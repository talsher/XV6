
_senity:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
    int pid;
    if((pid=fork()) == 0 ){
   a:	e8 c1 02 00 00       	call   2d0 <fork>
   f:	83 f8 00             	cmp    $0x0,%eax
  12:	74 5c                	je     70 <main+0x70>
        sleep(100); // wait to detach
    } else if (pid > 0){
  14:	7e 3a                	jle    50 <main+0x50>
        if(detach(pid)<0)
  16:	89 04 24             	mov    %eax,(%esp)
  19:	89 c3                	mov    %eax,%ebx
  1b:	e8 60 03 00 00       	call   380 <detach>
  20:	85 c0                	test   %eax,%eax
  22:	78 5a                	js     7e <main+0x7e>
            printf(1, "Error!"); // Error because child exists
        else
            printf(1, "Chiled detached!");
  24:	c7 44 24 04 bf 07 00 	movl   $0x7bf,0x4(%esp)
  2b:	00 
  2c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  33:	e8 08 04 00 00       	call   440 <printf>

        if(detach(pid)<0)
  38:	89 1c 24             	mov    %ebx,(%esp)
  3b:	e8 40 03 00 00       	call   380 <detach>
  40:	85 c0                	test   %eax,%eax
  42:	78 50                	js     94 <main+0x94>
            printf(1, "Greate!");  // OK because child detached
    } else {
        printf(1, "Error fork");
        exit(1);
    }
    exit(0);
  44:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  4b:	e8 88 02 00 00       	call   2d8 <exit>
        printf(1, "Error fork");
  50:	c7 44 24 04 d8 07 00 	movl   $0x7d8,0x4(%esp)
  57:	00 
  58:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5f:	e8 dc 03 00 00       	call   440 <printf>
        exit(1);
  64:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6b:	e8 68 02 00 00       	call   2d8 <exit>
        sleep(100); // wait to detach
  70:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  77:	e8 f4 02 00 00       	call   370 <sleep>
  7c:	eb c6                	jmp    44 <main+0x44>
            printf(1, "Error!"); // Error because child exists
  7e:	c7 44 24 04 b8 07 00 	movl   $0x7b8,0x4(%esp)
  85:	00 
  86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8d:	e8 ae 03 00 00       	call   440 <printf>
  92:	eb a4                	jmp    38 <main+0x38>
            printf(1, "Greate!");  // OK because child detached
  94:	c7 44 24 04 d0 07 00 	movl   $0x7d0,0x4(%esp)
  9b:	00 
  9c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a3:	e8 98 03 00 00       	call   440 <printf>
  a8:	eb 9a                	jmp    44 <main+0x44>
  aa:	66 90                	xchg   %ax,%ax
  ac:	66 90                	xchg   %ax,%ax
  ae:	66 90                	xchg   %ax,%ax

000000b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  b9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  ba:	89 c2                	mov    %eax,%edx
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c0:	41                   	inc    %ecx
  c1:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  c5:	42                   	inc    %edx
  c6:	84 db                	test   %bl,%bl
  c8:	88 5a ff             	mov    %bl,-0x1(%edx)
  cb:	75 f3                	jne    c0 <strcpy+0x10>
    ;
  return os;
}
  cd:	5b                   	pop    %ebx
  ce:	5d                   	pop    %ebp
  cf:	c3                   	ret    

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  d6:	53                   	push   %ebx
  d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
  da:	0f b6 01             	movzbl (%ecx),%eax
  dd:	0f b6 13             	movzbl (%ebx),%edx
  e0:	84 c0                	test   %al,%al
  e2:	75 18                	jne    fc <strcmp+0x2c>
  e4:	eb 22                	jmp    108 <strcmp+0x38>
  e6:	8d 76 00             	lea    0x0(%esi),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  f0:	41                   	inc    %ecx
  while(*p && *p == *q)
  f1:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
  f4:	43                   	inc    %ebx
  f5:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
  f8:	84 c0                	test   %al,%al
  fa:	74 0c                	je     108 <strcmp+0x38>
  fc:	38 d0                	cmp    %dl,%al
  fe:	74 f0                	je     f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
 100:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
 101:	29 d0                	sub    %edx,%eax
}
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 76 00             	lea    0x0(%esi),%esi
 108:	5b                   	pop    %ebx
 109:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 10b:	29 d0                	sub    %edx,%eax
}
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    
 10f:	90                   	nop

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 116:	80 39 00             	cmpb   $0x0,(%ecx)
 119:	74 15                	je     130 <strlen+0x20>
 11b:	31 d2                	xor    %edx,%edx
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	42                   	inc    %edx
 121:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 125:	89 d0                	mov    %edx,%eax
 127:	75 f7                	jne    120 <strlen+0x10>
    ;
  return n;
}
 129:	5d                   	pop    %ebp
 12a:	c3                   	ret    
 12b:	90                   	nop
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
 130:	31 c0                	xor    %eax,%eax
}
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 55 08             	mov    0x8(%ebp),%edx
 146:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 152:	5f                   	pop    %edi
 153:	89 d0                	mov    %edx,%eax
 155:	5d                   	pop    %ebp
 156:	c3                   	ret    
 157:	89 f6                	mov    %esi,%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16a:	0f b6 10             	movzbl (%eax),%edx
 16d:	84 d2                	test   %dl,%dl
 16f:	74 1b                	je     18c <strchr+0x2c>
    if(*s == c)
 171:	38 d1                	cmp    %dl,%cl
 173:	75 0f                	jne    184 <strchr+0x24>
 175:	eb 17                	jmp    18e <strchr+0x2e>
 177:	89 f6                	mov    %esi,%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 180:	38 ca                	cmp    %cl,%dl
 182:	74 0a                	je     18e <strchr+0x2e>
  for(; *s; s++)
 184:	40                   	inc    %eax
 185:	0f b6 10             	movzbl (%eax),%edx
 188:	84 d2                	test   %dl,%dl
 18a:	75 f4                	jne    180 <strchr+0x20>
      return (char*)s;
  return 0;
 18c:	31 c0                	xor    %eax,%eax
}
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	31 f6                	xor    %esi,%esi
{
 197:	53                   	push   %ebx
 198:	83 ec 3c             	sub    $0x3c,%esp
 19b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 19e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 1a1:	eb 32                	jmp    1d5 <gets+0x45>
 1a3:	90                   	nop
 1a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 1a8:	ba 01 00 00 00       	mov    $0x1,%edx
 1ad:	89 54 24 08          	mov    %edx,0x8(%esp)
 1b1:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1bc:	e8 37 01 00 00       	call   2f8 <read>
    if(cc < 1)
 1c1:	85 c0                	test   %eax,%eax
 1c3:	7e 19                	jle    1de <gets+0x4e>
      break;
    buf[i++] = c;
 1c5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c9:	43                   	inc    %ebx
 1ca:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 1f                	je     1f0 <gets+0x60>
 1d1:	3c 0d                	cmp    $0xd,%al
 1d3:	74 1b                	je     1f0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1d5:	46                   	inc    %esi
 1d6:	3b 75 0c             	cmp    0xc(%ebp),%esi
 1d9:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1dc:	7c ca                	jl     1a8 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 1de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1e1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	83 c4 3c             	add    $0x3c,%esp
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5f                   	pop    %edi
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	01 c6                	add    %eax,%esi
 1f5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 1f8:	eb e4                	jmp    1de <gets+0x4e>
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 201:	31 c0                	xor    %eax,%eax
{
 203:	89 e5                	mov    %esp,%ebp
 205:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 208:	89 44 24 04          	mov    %eax,0x4(%esp)
 20c:	8b 45 08             	mov    0x8(%ebp),%eax
{
 20f:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 212:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 215:	89 04 24             	mov    %eax,(%esp)
 218:	e8 03 01 00 00       	call   320 <open>
  if(fd < 0)
 21d:	85 c0                	test   %eax,%eax
 21f:	78 2f                	js     250 <stat+0x50>
 221:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 223:	8b 45 0c             	mov    0xc(%ebp),%eax
 226:	89 1c 24             	mov    %ebx,(%esp)
 229:	89 44 24 04          	mov    %eax,0x4(%esp)
 22d:	e8 06 01 00 00       	call   338 <fstat>
  close(fd);
 232:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 235:	89 c6                	mov    %eax,%esi
  close(fd);
 237:	e8 cc 00 00 00       	call   308 <close>
  return r;
}
 23c:	89 f0                	mov    %esi,%eax
 23e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 241:	8b 75 fc             	mov    -0x4(%ebp),%esi
 244:	89 ec                	mov    %ebp,%esp
 246:	5d                   	pop    %ebp
 247:	c3                   	ret    
 248:	90                   	nop
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb e5                	jmp    23c <stat+0x3c>
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 4d 08             	mov    0x8(%ebp),%ecx
 266:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 11             	movsbl (%ecx),%edx
 26a:	88 d0                	mov    %dl,%al
 26c:	2c 30                	sub    $0x30,%al
 26e:	3c 09                	cmp    $0x9,%al
  n = 0;
 270:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 275:	77 1e                	ja     295 <atoi+0x35>
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 280:	41                   	inc    %ecx
 281:	8d 04 80             	lea    (%eax,%eax,4),%eax
 284:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 288:	0f be 11             	movsbl (%ecx),%edx
 28b:	88 d3                	mov    %dl,%bl
 28d:	80 eb 30             	sub    $0x30,%bl
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	5b                   	pop    %ebx
 296:	5d                   	pop    %ebp
 297:	c3                   	ret    
 298:	90                   	nop
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	56                   	push   %esi
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	53                   	push   %ebx
 2a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 db                	test   %ebx,%ebx
 2b0:	7e 1a                	jle    2cc <memmove+0x2c>
 2b2:	31 d2                	xor    %edx,%edx
 2b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 2c0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2c4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2c7:	42                   	inc    %edx
  while(n-- > 0)
 2c8:	39 d3                	cmp    %edx,%ebx
 2ca:	75 f4                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2cc:	5b                   	pop    %ebx
 2cd:	5e                   	pop    %esi
 2ce:	5d                   	pop    %ebp
 2cf:	c3                   	ret    

000002d0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d0:	b8 01 00 00 00       	mov    $0x1,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <exit>:
SYSCALL(exit)
 2d8:	b8 02 00 00 00       	mov    $0x2,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <wait>:
SYSCALL(wait)
 2e0:	b8 03 00 00 00       	mov    $0x3,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <wait_stat>:
SYSCALL(wait_stat)
 2e8:	b8 19 00 00 00       	mov    $0x19,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <pipe>:
SYSCALL(pipe)
 2f0:	b8 04 00 00 00       	mov    $0x4,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <read>:
SYSCALL(read)
 2f8:	b8 05 00 00 00       	mov    $0x5,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <write>:
SYSCALL(write)
 300:	b8 10 00 00 00       	mov    $0x10,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <close>:
SYSCALL(close)
 308:	b8 15 00 00 00       	mov    $0x15,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <kill>:
SYSCALL(kill)
 310:	b8 06 00 00 00       	mov    $0x6,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <exec>:
SYSCALL(exec)
 318:	b8 07 00 00 00       	mov    $0x7,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <open>:
SYSCALL(open)
 320:	b8 0f 00 00 00       	mov    $0xf,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <mknod>:
SYSCALL(mknod)
 328:	b8 11 00 00 00       	mov    $0x11,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <unlink>:
SYSCALL(unlink)
 330:	b8 12 00 00 00       	mov    $0x12,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <fstat>:
SYSCALL(fstat)
 338:	b8 08 00 00 00       	mov    $0x8,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <link>:
SYSCALL(link)
 340:	b8 13 00 00 00       	mov    $0x13,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <mkdir>:
SYSCALL(mkdir)
 348:	b8 14 00 00 00       	mov    $0x14,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <chdir>:
SYSCALL(chdir)
 350:	b8 09 00 00 00       	mov    $0x9,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <dup>:
SYSCALL(dup)
 358:	b8 0a 00 00 00       	mov    $0xa,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <getpid>:
SYSCALL(getpid)
 360:	b8 0b 00 00 00       	mov    $0xb,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <sbrk>:
SYSCALL(sbrk)
 368:	b8 0c 00 00 00       	mov    $0xc,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <sleep>:
SYSCALL(sleep)
 370:	b8 0d 00 00 00       	mov    $0xd,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <uptime>:
SYSCALL(uptime)
 378:	b8 0e 00 00 00       	mov    $0xe,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <detach>:
SYSCALL(detach)
 380:	b8 16 00 00 00       	mov    $0x16,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <policy>:
SYSCALL(policy)
 388:	b8 17 00 00 00       	mov    $0x17,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <priority>:
 390:	b8 18 00 00 00       	mov    $0x18,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    
 398:	66 90                	xchg   %ax,%ax
 39a:	66 90                	xchg   %ax,%ax
 39c:	66 90                	xchg   %ax,%ax
 39e:	66 90                	xchg   %ax,%ax

000003a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	56                   	push   %esi
 3a5:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3a6:	89 d3                	mov    %edx,%ebx
 3a8:	c1 eb 1f             	shr    $0x1f,%ebx
{
 3ab:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 3ae:	84 db                	test   %bl,%bl
{
 3b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3b3:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 3b5:	74 79                	je     430 <printint+0x90>
 3b7:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3bb:	74 73                	je     430 <printint+0x90>
    neg = 1;
    x = -xx;
 3bd:	f7 d8                	neg    %eax
    neg = 1;
 3bf:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3c6:	31 f6                	xor    %esi,%esi
 3c8:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3cb:	eb 05                	jmp    3d2 <printint+0x32>
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3d0:	89 fe                	mov    %edi,%esi
 3d2:	31 d2                	xor    %edx,%edx
 3d4:	f7 f1                	div    %ecx
 3d6:	8d 7e 01             	lea    0x1(%esi),%edi
 3d9:	0f b6 92 ec 07 00 00 	movzbl 0x7ec(%edx),%edx
  }while((x /= base) != 0);
 3e0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3e2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 3e5:	75 e9                	jne    3d0 <printint+0x30>
  if(neg)
 3e7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3ea:	85 d2                	test   %edx,%edx
 3ec:	74 08                	je     3f6 <printint+0x56>
    buf[i++] = '-';
 3ee:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3f3:	8d 7e 02             	lea    0x2(%esi),%edi
 3f6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 3fa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
 400:	0f b6 06             	movzbl (%esi),%eax
 403:	4e                   	dec    %esi
  write(fd, &c, 1);
 404:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 408:	89 3c 24             	mov    %edi,(%esp)
 40b:	88 45 d7             	mov    %al,-0x29(%ebp)
 40e:	b8 01 00 00 00       	mov    $0x1,%eax
 413:	89 44 24 08          	mov    %eax,0x8(%esp)
 417:	e8 e4 fe ff ff       	call   300 <write>

  while(--i >= 0)
 41c:	39 de                	cmp    %ebx,%esi
 41e:	75 e0                	jne    400 <printint+0x60>
    putc(fd, buf[i]);
}
 420:	83 c4 4c             	add    $0x4c,%esp
 423:	5b                   	pop    %ebx
 424:	5e                   	pop    %esi
 425:	5f                   	pop    %edi
 426:	5d                   	pop    %ebp
 427:	c3                   	ret    
 428:	90                   	nop
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 430:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 437:	eb 8d                	jmp    3c6 <printint+0x26>
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000440 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 449:	8b 75 0c             	mov    0xc(%ebp),%esi
 44c:	0f b6 1e             	movzbl (%esi),%ebx
 44f:	84 db                	test   %bl,%bl
 451:	0f 84 d1 00 00 00    	je     528 <printf+0xe8>
  state = 0;
 457:	31 ff                	xor    %edi,%edi
 459:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 45a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 45d:	89 fa                	mov    %edi,%edx
 45f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 462:	89 45 d0             	mov    %eax,-0x30(%ebp)
 465:	eb 41                	jmp    4a8 <printf+0x68>
 467:	89 f6                	mov    %esi,%esi
 469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 470:	83 f8 25             	cmp    $0x25,%eax
 473:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 476:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 47b:	74 1e                	je     49b <printf+0x5b>
  write(fd, &c, 1);
 47d:	b8 01 00 00 00       	mov    $0x1,%eax
 482:	89 44 24 08          	mov    %eax,0x8(%esp)
 486:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 489:	89 44 24 04          	mov    %eax,0x4(%esp)
 48d:	89 3c 24             	mov    %edi,(%esp)
 490:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 493:	e8 68 fe ff ff       	call   300 <write>
 498:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 49b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 49c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4a0:	84 db                	test   %bl,%bl
 4a2:	0f 84 80 00 00 00    	je     528 <printf+0xe8>
    if(state == 0){
 4a8:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 4aa:	0f be cb             	movsbl %bl,%ecx
 4ad:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4b0:	74 be                	je     470 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4b2:	83 fa 25             	cmp    $0x25,%edx
 4b5:	75 e4                	jne    49b <printf+0x5b>
      if(c == 'd'){
 4b7:	83 f8 64             	cmp    $0x64,%eax
 4ba:	0f 84 f0 00 00 00    	je     5b0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4c0:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4c6:	83 f9 70             	cmp    $0x70,%ecx
 4c9:	74 65                	je     530 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4cb:	83 f8 73             	cmp    $0x73,%eax
 4ce:	0f 84 8c 00 00 00    	je     560 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4d4:	83 f8 63             	cmp    $0x63,%eax
 4d7:	0f 84 13 01 00 00    	je     5f0 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4dd:	83 f8 25             	cmp    $0x25,%eax
 4e0:	0f 84 e2 00 00 00    	je     5c8 <printf+0x188>
  write(fd, &c, 1);
 4e6:	b8 01 00 00 00       	mov    $0x1,%eax
 4eb:	46                   	inc    %esi
 4ec:	89 44 24 08          	mov    %eax,0x8(%esp)
 4f0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f7:	89 3c 24             	mov    %edi,(%esp)
 4fa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4fe:	e8 fd fd ff ff       	call   300 <write>
 503:	ba 01 00 00 00       	mov    $0x1,%edx
 508:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 50b:	89 54 24 08          	mov    %edx,0x8(%esp)
 50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 513:	89 3c 24             	mov    %edi,(%esp)
 516:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 519:	e8 e2 fd ff ff       	call   300 <write>
  for(i = 0; fmt[i]; i++){
 51e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 522:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 524:	84 db                	test   %bl,%bl
 526:	75 80                	jne    4a8 <printf+0x68>
    }
  }
}
 528:	83 c4 3c             	add    $0x3c,%esp
 52b:	5b                   	pop    %ebx
 52c:	5e                   	pop    %esi
 52d:	5f                   	pop    %edi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 530:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 537:	b9 10 00 00 00       	mov    $0x10,%ecx
 53c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 53f:	89 f8                	mov    %edi,%eax
 541:	8b 13                	mov    (%ebx),%edx
 543:	e8 58 fe ff ff       	call   3a0 <printint>
        ap++;
 548:	89 d8                	mov    %ebx,%eax
      state = 0;
 54a:	31 d2                	xor    %edx,%edx
        ap++;
 54c:	83 c0 04             	add    $0x4,%eax
 54f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 552:	e9 44 ff ff ff       	jmp    49b <printf+0x5b>
 557:	89 f6                	mov    %esi,%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 560:	8b 45 d0             	mov    -0x30(%ebp),%eax
 563:	8b 10                	mov    (%eax),%edx
        ap++;
 565:	83 c0 04             	add    $0x4,%eax
 568:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 56b:	85 d2                	test   %edx,%edx
 56d:	0f 84 aa 00 00 00    	je     61d <printf+0x1dd>
        while(*s != 0){
 573:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 576:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 578:	84 c0                	test   %al,%al
 57a:	74 27                	je     5a3 <printf+0x163>
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 580:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 583:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 588:	43                   	inc    %ebx
  write(fd, &c, 1);
 589:	89 44 24 08          	mov    %eax,0x8(%esp)
 58d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 590:	89 44 24 04          	mov    %eax,0x4(%esp)
 594:	89 3c 24             	mov    %edi,(%esp)
 597:	e8 64 fd ff ff       	call   300 <write>
        while(*s != 0){
 59c:	0f b6 03             	movzbl (%ebx),%eax
 59f:	84 c0                	test   %al,%al
 5a1:	75 dd                	jne    580 <printf+0x140>
      state = 0;
 5a3:	31 d2                	xor    %edx,%edx
 5a5:	e9 f1 fe ff ff       	jmp    49b <printf+0x5b>
 5aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5b7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5bc:	e9 7b ff ff ff       	jmp    53c <printf+0xfc>
 5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5c8:	b9 01 00 00 00       	mov    $0x1,%ecx
 5cd:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5d0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 5d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d8:	89 3c 24             	mov    %edi,(%esp)
 5db:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5de:	e8 1d fd ff ff       	call   300 <write>
      state = 0;
 5e3:	31 d2                	xor    %edx,%edx
 5e5:	e9 b1 fe ff ff       	jmp    49b <printf+0x5b>
 5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 5f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5f3:	8b 03                	mov    (%ebx),%eax
        ap++;
 5f5:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5f8:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 5fb:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 5fe:	b8 01 00 00 00       	mov    $0x1,%eax
 603:	89 44 24 08          	mov    %eax,0x8(%esp)
 607:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 60a:	89 44 24 04          	mov    %eax,0x4(%esp)
 60e:	e8 ed fc ff ff       	call   300 <write>
      state = 0;
 613:	31 d2                	xor    %edx,%edx
        ap++;
 615:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 618:	e9 7e fe ff ff       	jmp    49b <printf+0x5b>
          s = "(null)";
 61d:	bb e3 07 00 00       	mov    $0x7e3,%ebx
        while(*s != 0){
 622:	b0 28                	mov    $0x28,%al
 624:	e9 57 ff ff ff       	jmp    580 <printf+0x140>
 629:	66 90                	xchg   %ax,%ax
 62b:	66 90                	xchg   %ax,%ax
 62d:	66 90                	xchg   %ax,%ax
 62f:	90                   	nop

00000630 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 630:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	a1 78 0a 00 00       	mov    0xa78,%eax
{
 636:	89 e5                	mov    %esp,%ebp
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	53                   	push   %ebx
 63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 63e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 641:	eb 0d                	jmp    650 <free+0x20>
 643:	90                   	nop
 644:	90                   	nop
 645:	90                   	nop
 646:	90                   	nop
 647:	90                   	nop
 648:	90                   	nop
 649:	90                   	nop
 64a:	90                   	nop
 64b:	90                   	nop
 64c:	90                   	nop
 64d:	90                   	nop
 64e:	90                   	nop
 64f:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 650:	39 c8                	cmp    %ecx,%eax
 652:	8b 10                	mov    (%eax),%edx
 654:	73 32                	jae    688 <free+0x58>
 656:	39 d1                	cmp    %edx,%ecx
 658:	72 04                	jb     65e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 65a:	39 d0                	cmp    %edx,%eax
 65c:	72 32                	jb     690 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 65e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 661:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 664:	39 fa                	cmp    %edi,%edx
 666:	74 30                	je     698 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 668:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 66b:	8b 50 04             	mov    0x4(%eax),%edx
 66e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 671:	39 f1                	cmp    %esi,%ecx
 673:	74 3c                	je     6b1 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 675:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 677:	5b                   	pop    %ebx
  freep = p;
 678:	a3 78 0a 00 00       	mov    %eax,0xa78
}
 67d:	5e                   	pop    %esi
 67e:	5f                   	pop    %edi
 67f:	5d                   	pop    %ebp
 680:	c3                   	ret    
 681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 688:	39 d0                	cmp    %edx,%eax
 68a:	72 04                	jb     690 <free+0x60>
 68c:	39 d1                	cmp    %edx,%ecx
 68e:	72 ce                	jb     65e <free+0x2e>
{
 690:	89 d0                	mov    %edx,%eax
 692:	eb bc                	jmp    650 <free+0x20>
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 698:	8b 7a 04             	mov    0x4(%edx),%edi
 69b:	01 fe                	add    %edi,%esi
 69d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a0:	8b 10                	mov    (%eax),%edx
 6a2:	8b 12                	mov    (%edx),%edx
 6a4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6a7:	8b 50 04             	mov    0x4(%eax),%edx
 6aa:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ad:	39 f1                	cmp    %esi,%ecx
 6af:	75 c4                	jne    675 <free+0x45>
    p->s.size += bp->s.size;
 6b1:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 6b4:	a3 78 0a 00 00       	mov    %eax,0xa78
    p->s.size += bp->s.size;
 6b9:	01 ca                	add    %ecx,%edx
 6bb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6be:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6c1:	89 10                	mov    %edx,(%eax)
}
 6c3:	5b                   	pop    %ebx
 6c4:	5e                   	pop    %esi
 6c5:	5f                   	pop    %edi
 6c6:	5d                   	pop    %ebp
 6c7:	c3                   	ret    
 6c8:	90                   	nop
 6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6dc:	8b 15 78 0a 00 00    	mov    0xa78,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e2:	8d 78 07             	lea    0x7(%eax),%edi
 6e5:	c1 ef 03             	shr    $0x3,%edi
 6e8:	47                   	inc    %edi
  if((prevp = freep) == 0){
 6e9:	85 d2                	test   %edx,%edx
 6eb:	0f 84 8f 00 00 00    	je     780 <malloc+0xb0>
 6f1:	8b 02                	mov    (%edx),%eax
 6f3:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6f6:	39 cf                	cmp    %ecx,%edi
 6f8:	76 66                	jbe    760 <malloc+0x90>
 6fa:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 700:	bb 00 10 00 00       	mov    $0x1000,%ebx
 705:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 708:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 70f:	eb 10                	jmp    721 <malloc+0x51>
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 718:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 71a:	8b 48 04             	mov    0x4(%eax),%ecx
 71d:	39 f9                	cmp    %edi,%ecx
 71f:	73 3f                	jae    760 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 721:	39 05 78 0a 00 00    	cmp    %eax,0xa78
 727:	89 c2                	mov    %eax,%edx
 729:	75 ed                	jne    718 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 72b:	89 34 24             	mov    %esi,(%esp)
 72e:	e8 35 fc ff ff       	call   368 <sbrk>
  if(p == (char*)-1)
 733:	83 f8 ff             	cmp    $0xffffffff,%eax
 736:	74 18                	je     750 <malloc+0x80>
  hp->s.size = nu;
 738:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 73b:	83 c0 08             	add    $0x8,%eax
 73e:	89 04 24             	mov    %eax,(%esp)
 741:	e8 ea fe ff ff       	call   630 <free>
  return freep;
 746:	8b 15 78 0a 00 00    	mov    0xa78,%edx
      if((p = morecore(nunits)) == 0)
 74c:	85 d2                	test   %edx,%edx
 74e:	75 c8                	jne    718 <malloc+0x48>
        return 0;
  }
}
 750:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 753:	31 c0                	xor    %eax,%eax
}
 755:	5b                   	pop    %ebx
 756:	5e                   	pop    %esi
 757:	5f                   	pop    %edi
 758:	5d                   	pop    %ebp
 759:	c3                   	ret    
 75a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 760:	39 cf                	cmp    %ecx,%edi
 762:	74 4c                	je     7b0 <malloc+0xe0>
        p->s.size -= nunits;
 764:	29 f9                	sub    %edi,%ecx
 766:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 769:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 76c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 76f:	89 15 78 0a 00 00    	mov    %edx,0xa78
}
 775:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 778:	83 c0 08             	add    $0x8,%eax
}
 77b:	5b                   	pop    %ebx
 77c:	5e                   	pop    %esi
 77d:	5f                   	pop    %edi
 77e:	5d                   	pop    %ebp
 77f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 780:	b8 7c 0a 00 00       	mov    $0xa7c,%eax
 785:	ba 7c 0a 00 00       	mov    $0xa7c,%edx
    base.s.size = 0;
 78a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 78c:	a3 78 0a 00 00       	mov    %eax,0xa78
    base.s.size = 0;
 791:	b8 7c 0a 00 00       	mov    $0xa7c,%eax
    base.s.ptr = freep = prevp = &base;
 796:	89 15 7c 0a 00 00    	mov    %edx,0xa7c
    base.s.size = 0;
 79c:	89 0d 80 0a 00 00    	mov    %ecx,0xa80
 7a2:	e9 53 ff ff ff       	jmp    6fa <malloc+0x2a>
 7a7:	89 f6                	mov    %esi,%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 7b0:	8b 08                	mov    (%eax),%ecx
 7b2:	89 0a                	mov    %ecx,(%edx)
 7b4:	eb b9                	jmp    76f <malloc+0x9f>
