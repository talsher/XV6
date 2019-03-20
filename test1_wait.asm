
_test1_wait:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
    int pid;
    int status=123123;
   1:	b8 f3 e0 01 00       	mov    $0x1e0f3,%eax
{
   6:	89 e5                	mov    %esp,%ebp
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	83 ec 20             	sub    $0x20,%esp
    int status=123123;
   e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if((pid = fork()) > 0){
  12:	e8 99 02 00 00       	call   2b0 <fork>
  17:	83 f8 00             	cmp    $0x0,%eax
  1a:	7f 2e                	jg     4a <main+0x4a>
        if(wait(&status) < 0)
            printf(1, "No children!\n");
        else
             printf(1, "Exit with %d\n", status);
    } else if(pid == 0){
  1c:	74 20                	je     3e <main+0x3e>
        exit(10);
    } else {
         printf(1, "Error while fork\n");
  1e:	c7 44 24 04 b4 07 00 	movl   $0x7b4,0x4(%esp)
  25:	00 
  26:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2d:	e8 ee 03 00 00       	call   420 <printf>
    }
    exit(0);
  32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  39:	e8 7a 02 00 00       	call   2b8 <exit>
        exit(10);
  3e:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  45:	e8 6e 02 00 00       	call   2b8 <exit>
        if(wait(&status) < 0)
  4a:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 6a 02 00 00       	call   2c0 <wait>
  56:	85 c0                	test   %eax,%eax
  58:	78 1e                	js     78 <main+0x78>
             printf(1, "Exit with %d\n", status);
  5a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5e:	c7 44 24 04 a6 07 00 	movl   $0x7a6,0x4(%esp)
  65:	00 
  66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6d:	89 44 24 08          	mov    %eax,0x8(%esp)
  71:	e8 aa 03 00 00       	call   420 <printf>
  76:	eb ba                	jmp    32 <main+0x32>
            printf(1, "No children!\n");
  78:	c7 44 24 04 98 07 00 	movl   $0x798,0x4(%esp)
  7f:	00 
  80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  87:	e8 94 03 00 00       	call   420 <printf>
  8c:	eb a4                	jmp    32 <main+0x32>
  8e:	66 90                	xchg   %ax,%ax

00000090 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 45 08             	mov    0x8(%ebp),%eax
  96:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  99:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  9a:	89 c2                	mov    %eax,%edx
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a0:	41                   	inc    %ecx
  a1:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  a5:	42                   	inc    %edx
  a6:	84 db                	test   %bl,%bl
  a8:	88 5a ff             	mov    %bl,-0x1(%edx)
  ab:	75 f3                	jne    a0 <strcpy+0x10>
    ;
  return os;
}
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b6:	53                   	push   %ebx
  b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
  ba:	0f b6 01             	movzbl (%ecx),%eax
  bd:	0f b6 13             	movzbl (%ebx),%edx
  c0:	84 c0                	test   %al,%al
  c2:	75 18                	jne    dc <strcmp+0x2c>
  c4:	eb 22                	jmp    e8 <strcmp+0x38>
  c6:	8d 76 00             	lea    0x0(%esi),%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  d0:	41                   	inc    %ecx
  while(*p && *p == *q)
  d1:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
  d4:	43                   	inc    %ebx
  d5:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
  d8:	84 c0                	test   %al,%al
  da:	74 0c                	je     e8 <strcmp+0x38>
  dc:	38 d0                	cmp    %dl,%al
  de:	74 f0                	je     d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
  e0:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
  e1:	29 d0                	sub    %edx,%eax
}
  e3:	5d                   	pop    %ebp
  e4:	c3                   	ret    
  e5:	8d 76 00             	lea    0x0(%esi),%esi
  e8:	5b                   	pop    %ebx
  e9:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  eb:	29 d0                	sub    %edx,%eax
}
  ed:	5d                   	pop    %ebp
  ee:	c3                   	ret    
  ef:	90                   	nop

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 39 00             	cmpb   $0x0,(%ecx)
  f9:	74 15                	je     110 <strlen+0x20>
  fb:	31 d2                	xor    %edx,%edx
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	42                   	inc    %edx
 101:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 105:	89 d0                	mov    %edx,%eax
 107:	75 f7                	jne    100 <strlen+0x10>
    ;
  return n;
}
 109:	5d                   	pop    %ebp
 10a:	c3                   	ret    
 10b:	90                   	nop
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
 110:	31 c0                	xor    %eax,%eax
}
 112:	5d                   	pop    %ebp
 113:	c3                   	ret    
 114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 11a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 55 08             	mov    0x8(%ebp),%edx
 126:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	5f                   	pop    %edi
 133:	89 d0                	mov    %edx,%eax
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	74 1b                	je     16c <strchr+0x2c>
    if(*s == c)
 151:	38 d1                	cmp    %dl,%cl
 153:	75 0f                	jne    164 <strchr+0x24>
 155:	eb 17                	jmp    16e <strchr+0x2e>
 157:	89 f6                	mov    %esi,%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 160:	38 ca                	cmp    %cl,%dl
 162:	74 0a                	je     16e <strchr+0x2e>
  for(; *s; s++)
 164:	40                   	inc    %eax
 165:	0f b6 10             	movzbl (%eax),%edx
 168:	84 d2                	test   %dl,%dl
 16a:	75 f4                	jne    160 <strchr+0x20>
      return (char*)s;
  return 0;
 16c:	31 c0                	xor    %eax,%eax
}
 16e:	5d                   	pop    %ebp
 16f:	c3                   	ret    

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 175:	31 f6                	xor    %esi,%esi
{
 177:	53                   	push   %ebx
 178:	83 ec 3c             	sub    $0x3c,%esp
 17b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 17e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 181:	eb 32                	jmp    1b5 <gets+0x45>
 183:	90                   	nop
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 188:	ba 01 00 00 00       	mov    $0x1,%edx
 18d:	89 54 24 08          	mov    %edx,0x8(%esp)
 191:	89 7c 24 04          	mov    %edi,0x4(%esp)
 195:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19c:	e8 37 01 00 00       	call   2d8 <read>
    if(cc < 1)
 1a1:	85 c0                	test   %eax,%eax
 1a3:	7e 19                	jle    1be <gets+0x4e>
      break;
    buf[i++] = c;
 1a5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a9:	43                   	inc    %ebx
 1aa:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 1ad:	3c 0a                	cmp    $0xa,%al
 1af:	74 1f                	je     1d0 <gets+0x60>
 1b1:	3c 0d                	cmp    $0xd,%al
 1b3:	74 1b                	je     1d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1b5:	46                   	inc    %esi
 1b6:	3b 75 0c             	cmp    0xc(%ebp),%esi
 1b9:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1bc:	7c ca                	jl     188 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 1be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1c1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
 1c7:	83 c4 3c             	add    $0x3c,%esp
 1ca:	5b                   	pop    %ebx
 1cb:	5e                   	pop    %esi
 1cc:	5f                   	pop    %edi
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    
 1cf:	90                   	nop
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	01 c6                	add    %eax,%esi
 1d5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 1d8:	eb e4                	jmp    1be <gets+0x4e>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e1:	31 c0                	xor    %eax,%eax
{
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 1e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ec:	8b 45 08             	mov    0x8(%ebp),%eax
{
 1ef:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1f2:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 1f5:	89 04 24             	mov    %eax,(%esp)
 1f8:	e8 03 01 00 00       	call   300 <open>
  if(fd < 0)
 1fd:	85 c0                	test   %eax,%eax
 1ff:	78 2f                	js     230 <stat+0x50>
 201:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 1c 24             	mov    %ebx,(%esp)
 209:	89 44 24 04          	mov    %eax,0x4(%esp)
 20d:	e8 06 01 00 00       	call   318 <fstat>
  close(fd);
 212:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 215:	89 c6                	mov    %eax,%esi
  close(fd);
 217:	e8 cc 00 00 00       	call   2e8 <close>
  return r;
}
 21c:	89 f0                	mov    %esi,%eax
 21e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 221:	8b 75 fc             	mov    -0x4(%ebp),%esi
 224:	89 ec                	mov    %ebp,%esp
 226:	5d                   	pop    %ebp
 227:	c3                   	ret    
 228:	90                   	nop
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb e5                	jmp    21c <stat+0x3c>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 08             	mov    0x8(%ebp),%ecx
 246:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	88 d0                	mov    %dl,%al
 24c:	2c 30                	sub    $0x30,%al
 24e:	3c 09                	cmp    $0x9,%al
  n = 0;
 250:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 255:	77 1e                	ja     275 <atoi+0x35>
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 260:	41                   	inc    %ecx
 261:	8d 04 80             	lea    (%eax,%eax,4),%eax
 264:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 268:	0f be 11             	movsbl (%ecx),%edx
 26b:	88 d3                	mov    %dl,%bl
 26d:	80 eb 30             	sub    $0x30,%bl
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	5b                   	pop    %ebx
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	8b 45 08             	mov    0x8(%ebp),%eax
 287:	53                   	push   %ebx
 288:	8b 5d 10             	mov    0x10(%ebp),%ebx
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 db                	test   %ebx,%ebx
 290:	7e 1a                	jle    2ac <memmove+0x2c>
 292:	31 d2                	xor    %edx,%edx
 294:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 29a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 2a0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2a4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2a7:	42                   	inc    %edx
  while(n-- > 0)
 2a8:	39 d3                	cmp    %edx,%ebx
 2aa:	75 f4                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2ac:	5b                   	pop    %ebx
 2ad:	5e                   	pop    %esi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    

000002b0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2b0:	b8 01 00 00 00       	mov    $0x1,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <exit>:
SYSCALL(exit)
 2b8:	b8 02 00 00 00       	mov    $0x2,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <wait>:
SYSCALL(wait)
 2c0:	b8 03 00 00 00       	mov    $0x3,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <wait_stat>:
SYSCALL(wait_stat)
 2c8:	b8 19 00 00 00       	mov    $0x19,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <pipe>:
SYSCALL(pipe)
 2d0:	b8 04 00 00 00       	mov    $0x4,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <read>:
SYSCALL(read)
 2d8:	b8 05 00 00 00       	mov    $0x5,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <write>:
SYSCALL(write)
 2e0:	b8 10 00 00 00       	mov    $0x10,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <close>:
SYSCALL(close)
 2e8:	b8 15 00 00 00       	mov    $0x15,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <kill>:
SYSCALL(kill)
 2f0:	b8 06 00 00 00       	mov    $0x6,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <exec>:
SYSCALL(exec)
 2f8:	b8 07 00 00 00       	mov    $0x7,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <open>:
SYSCALL(open)
 300:	b8 0f 00 00 00       	mov    $0xf,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <mknod>:
SYSCALL(mknod)
 308:	b8 11 00 00 00       	mov    $0x11,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <unlink>:
SYSCALL(unlink)
 310:	b8 12 00 00 00       	mov    $0x12,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <fstat>:
SYSCALL(fstat)
 318:	b8 08 00 00 00       	mov    $0x8,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <link>:
SYSCALL(link)
 320:	b8 13 00 00 00       	mov    $0x13,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <mkdir>:
SYSCALL(mkdir)
 328:	b8 14 00 00 00       	mov    $0x14,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <chdir>:
SYSCALL(chdir)
 330:	b8 09 00 00 00       	mov    $0x9,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <dup>:
SYSCALL(dup)
 338:	b8 0a 00 00 00       	mov    $0xa,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <getpid>:
SYSCALL(getpid)
 340:	b8 0b 00 00 00       	mov    $0xb,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <sbrk>:
SYSCALL(sbrk)
 348:	b8 0c 00 00 00       	mov    $0xc,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <sleep>:
SYSCALL(sleep)
 350:	b8 0d 00 00 00       	mov    $0xd,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <uptime>:
SYSCALL(uptime)
 358:	b8 0e 00 00 00       	mov    $0xe,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <detach>:
SYSCALL(detach)
 360:	b8 16 00 00 00       	mov    $0x16,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <policy>:
SYSCALL(policy)
 368:	b8 17 00 00 00       	mov    $0x17,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <priority>:
 370:	b8 18 00 00 00       	mov    $0x18,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    
 378:	66 90                	xchg   %ax,%ax
 37a:	66 90                	xchg   %ax,%ax
 37c:	66 90                	xchg   %ax,%ax
 37e:	66 90                	xchg   %ax,%ax

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 386:	89 d3                	mov    %edx,%ebx
 388:	c1 eb 1f             	shr    $0x1f,%ebx
{
 38b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 38e:	84 db                	test   %bl,%bl
{
 390:	89 45 c0             	mov    %eax,-0x40(%ebp)
 393:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 395:	74 79                	je     410 <printint+0x90>
 397:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 39b:	74 73                	je     410 <printint+0x90>
    neg = 1;
    x = -xx;
 39d:	f7 d8                	neg    %eax
    neg = 1;
 39f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3a6:	31 f6                	xor    %esi,%esi
 3a8:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3ab:	eb 05                	jmp    3b2 <printint+0x32>
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3b0:	89 fe                	mov    %edi,%esi
 3b2:	31 d2                	xor    %edx,%edx
 3b4:	f7 f1                	div    %ecx
 3b6:	8d 7e 01             	lea    0x1(%esi),%edi
 3b9:	0f b6 92 d0 07 00 00 	movzbl 0x7d0(%edx),%edx
  }while((x /= base) != 0);
 3c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3c2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 3c5:	75 e9                	jne    3b0 <printint+0x30>
  if(neg)
 3c7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3ca:	85 d2                	test   %edx,%edx
 3cc:	74 08                	je     3d6 <printint+0x56>
    buf[i++] = '-';
 3ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3d3:	8d 7e 02             	lea    0x2(%esi),%edi
 3d6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 3da:	8b 7d c0             	mov    -0x40(%ebp),%edi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	0f b6 06             	movzbl (%esi),%eax
 3e3:	4e                   	dec    %esi
  write(fd, &c, 1);
 3e4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3e8:	89 3c 24             	mov    %edi,(%esp)
 3eb:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ee:	b8 01 00 00 00       	mov    $0x1,%eax
 3f3:	89 44 24 08          	mov    %eax,0x8(%esp)
 3f7:	e8 e4 fe ff ff       	call   2e0 <write>

  while(--i >= 0)
 3fc:	39 de                	cmp    %ebx,%esi
 3fe:	75 e0                	jne    3e0 <printint+0x60>
    putc(fd, buf[i]);
}
 400:	83 c4 4c             	add    $0x4c,%esp
 403:	5b                   	pop    %ebx
 404:	5e                   	pop    %esi
 405:	5f                   	pop    %edi
 406:	5d                   	pop    %ebp
 407:	c3                   	ret    
 408:	90                   	nop
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 410:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 417:	eb 8d                	jmp    3a6 <printint+0x26>
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 75 0c             	mov    0xc(%ebp),%esi
 42c:	0f b6 1e             	movzbl (%esi),%ebx
 42f:	84 db                	test   %bl,%bl
 431:	0f 84 d1 00 00 00    	je     508 <printf+0xe8>
  state = 0;
 437:	31 ff                	xor    %edi,%edi
 439:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 43a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 43d:	89 fa                	mov    %edi,%edx
 43f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 442:	89 45 d0             	mov    %eax,-0x30(%ebp)
 445:	eb 41                	jmp    488 <printf+0x68>
 447:	89 f6                	mov    %esi,%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 450:	83 f8 25             	cmp    $0x25,%eax
 453:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 456:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 45b:	74 1e                	je     47b <printf+0x5b>
  write(fd, &c, 1);
 45d:	b8 01 00 00 00       	mov    $0x1,%eax
 462:	89 44 24 08          	mov    %eax,0x8(%esp)
 466:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 469:	89 44 24 04          	mov    %eax,0x4(%esp)
 46d:	89 3c 24             	mov    %edi,(%esp)
 470:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 473:	e8 68 fe ff ff       	call   2e0 <write>
 478:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 47b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 47c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 480:	84 db                	test   %bl,%bl
 482:	0f 84 80 00 00 00    	je     508 <printf+0xe8>
    if(state == 0){
 488:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 48a:	0f be cb             	movsbl %bl,%ecx
 48d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 490:	74 be                	je     450 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 492:	83 fa 25             	cmp    $0x25,%edx
 495:	75 e4                	jne    47b <printf+0x5b>
      if(c == 'd'){
 497:	83 f8 64             	cmp    $0x64,%eax
 49a:	0f 84 f0 00 00 00    	je     590 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4a0:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4a6:	83 f9 70             	cmp    $0x70,%ecx
 4a9:	74 65                	je     510 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4ab:	83 f8 73             	cmp    $0x73,%eax
 4ae:	0f 84 8c 00 00 00    	je     540 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4b4:	83 f8 63             	cmp    $0x63,%eax
 4b7:	0f 84 13 01 00 00    	je     5d0 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4bd:	83 f8 25             	cmp    $0x25,%eax
 4c0:	0f 84 e2 00 00 00    	je     5a8 <printf+0x188>
  write(fd, &c, 1);
 4c6:	b8 01 00 00 00       	mov    $0x1,%eax
 4cb:	46                   	inc    %esi
 4cc:	89 44 24 08          	mov    %eax,0x8(%esp)
 4d0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d7:	89 3c 24             	mov    %edi,(%esp)
 4da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4de:	e8 fd fd ff ff       	call   2e0 <write>
 4e3:	ba 01 00 00 00       	mov    $0x1,%edx
 4e8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4eb:	89 54 24 08          	mov    %edx,0x8(%esp)
 4ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f3:	89 3c 24             	mov    %edi,(%esp)
 4f6:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4f9:	e8 e2 fd ff ff       	call   2e0 <write>
  for(i = 0; fmt[i]; i++){
 4fe:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 502:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 504:	84 db                	test   %bl,%bl
 506:	75 80                	jne    488 <printf+0x68>
    }
  }
}
 508:	83 c4 3c             	add    $0x3c,%esp
 50b:	5b                   	pop    %ebx
 50c:	5e                   	pop    %esi
 50d:	5f                   	pop    %edi
 50e:	5d                   	pop    %ebp
 50f:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 510:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 517:	b9 10 00 00 00       	mov    $0x10,%ecx
 51c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 51f:	89 f8                	mov    %edi,%eax
 521:	8b 13                	mov    (%ebx),%edx
 523:	e8 58 fe ff ff       	call   380 <printint>
        ap++;
 528:	89 d8                	mov    %ebx,%eax
      state = 0;
 52a:	31 d2                	xor    %edx,%edx
        ap++;
 52c:	83 c0 04             	add    $0x4,%eax
 52f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 532:	e9 44 ff ff ff       	jmp    47b <printf+0x5b>
 537:	89 f6                	mov    %esi,%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 540:	8b 45 d0             	mov    -0x30(%ebp),%eax
 543:	8b 10                	mov    (%eax),%edx
        ap++;
 545:	83 c0 04             	add    $0x4,%eax
 548:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 54b:	85 d2                	test   %edx,%edx
 54d:	0f 84 aa 00 00 00    	je     5fd <printf+0x1dd>
        while(*s != 0){
 553:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 556:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 558:	84 c0                	test   %al,%al
 55a:	74 27                	je     583 <printf+0x163>
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 560:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 563:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 568:	43                   	inc    %ebx
  write(fd, &c, 1);
 569:	89 44 24 08          	mov    %eax,0x8(%esp)
 56d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 570:	89 44 24 04          	mov    %eax,0x4(%esp)
 574:	89 3c 24             	mov    %edi,(%esp)
 577:	e8 64 fd ff ff       	call   2e0 <write>
        while(*s != 0){
 57c:	0f b6 03             	movzbl (%ebx),%eax
 57f:	84 c0                	test   %al,%al
 581:	75 dd                	jne    560 <printf+0x140>
      state = 0;
 583:	31 d2                	xor    %edx,%edx
 585:	e9 f1 fe ff ff       	jmp    47b <printf+0x5b>
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 590:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 597:	b9 0a 00 00 00       	mov    $0xa,%ecx
 59c:	e9 7b ff ff ff       	jmp    51c <printf+0xfc>
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 5a8:	b9 01 00 00 00       	mov    $0x1,%ecx
 5ad:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5b0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 5b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b8:	89 3c 24             	mov    %edi,(%esp)
 5bb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5be:	e8 1d fd ff ff       	call   2e0 <write>
      state = 0;
 5c3:	31 d2                	xor    %edx,%edx
 5c5:	e9 b1 fe ff ff       	jmp    47b <printf+0x5b>
 5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 5d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5d3:	8b 03                	mov    (%ebx),%eax
        ap++;
 5d5:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5d8:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 5db:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 5de:	b8 01 00 00 00       	mov    $0x1,%eax
 5e3:	89 44 24 08          	mov    %eax,0x8(%esp)
 5e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ee:	e8 ed fc ff ff       	call   2e0 <write>
      state = 0;
 5f3:	31 d2                	xor    %edx,%edx
        ap++;
 5f5:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5f8:	e9 7e fe ff ff       	jmp    47b <printf+0x5b>
          s = "(null)";
 5fd:	bb c6 07 00 00       	mov    $0x7c6,%ebx
        while(*s != 0){
 602:	b0 28                	mov    $0x28,%al
 604:	e9 57 ff ff ff       	jmp    560 <printf+0x140>
 609:	66 90                	xchg   %ax,%ax
 60b:	66 90                	xchg   %ax,%ax
 60d:	66 90                	xchg   %ax,%ax
 60f:	90                   	nop

00000610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	a1 5c 0a 00 00       	mov    0xa5c,%eax
{
 616:	89 e5                	mov    %esp,%ebp
 618:	57                   	push   %edi
 619:	56                   	push   %esi
 61a:	53                   	push   %ebx
 61b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 61e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 621:	eb 0d                	jmp    630 <free+0x20>
 623:	90                   	nop
 624:	90                   	nop
 625:	90                   	nop
 626:	90                   	nop
 627:	90                   	nop
 628:	90                   	nop
 629:	90                   	nop
 62a:	90                   	nop
 62b:	90                   	nop
 62c:	90                   	nop
 62d:	90                   	nop
 62e:	90                   	nop
 62f:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 630:	39 c8                	cmp    %ecx,%eax
 632:	8b 10                	mov    (%eax),%edx
 634:	73 32                	jae    668 <free+0x58>
 636:	39 d1                	cmp    %edx,%ecx
 638:	72 04                	jb     63e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 63a:	39 d0                	cmp    %edx,%eax
 63c:	72 32                	jb     670 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 63e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 641:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 644:	39 fa                	cmp    %edi,%edx
 646:	74 30                	je     678 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 648:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 64b:	8b 50 04             	mov    0x4(%eax),%edx
 64e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 651:	39 f1                	cmp    %esi,%ecx
 653:	74 3c                	je     691 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 655:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 657:	5b                   	pop    %ebx
  freep = p;
 658:	a3 5c 0a 00 00       	mov    %eax,0xa5c
}
 65d:	5e                   	pop    %esi
 65e:	5f                   	pop    %edi
 65f:	5d                   	pop    %ebp
 660:	c3                   	ret    
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 668:	39 d0                	cmp    %edx,%eax
 66a:	72 04                	jb     670 <free+0x60>
 66c:	39 d1                	cmp    %edx,%ecx
 66e:	72 ce                	jb     63e <free+0x2e>
{
 670:	89 d0                	mov    %edx,%eax
 672:	eb bc                	jmp    630 <free+0x20>
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 678:	8b 7a 04             	mov    0x4(%edx),%edi
 67b:	01 fe                	add    %edi,%esi
 67d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 680:	8b 10                	mov    (%eax),%edx
 682:	8b 12                	mov    (%edx),%edx
 684:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 687:	8b 50 04             	mov    0x4(%eax),%edx
 68a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 68d:	39 f1                	cmp    %esi,%ecx
 68f:	75 c4                	jne    655 <free+0x45>
    p->s.size += bp->s.size;
 691:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 694:	a3 5c 0a 00 00       	mov    %eax,0xa5c
    p->s.size += bp->s.size;
 699:	01 ca                	add    %ecx,%edx
 69b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 69e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6a1:	89 10                	mov    %edx,(%eax)
}
 6a3:	5b                   	pop    %ebx
 6a4:	5e                   	pop    %esi
 6a5:	5f                   	pop    %edi
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    
 6a8:	90                   	nop
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6bc:	8b 15 5c 0a 00 00    	mov    0xa5c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c2:	8d 78 07             	lea    0x7(%eax),%edi
 6c5:	c1 ef 03             	shr    $0x3,%edi
 6c8:	47                   	inc    %edi
  if((prevp = freep) == 0){
 6c9:	85 d2                	test   %edx,%edx
 6cb:	0f 84 8f 00 00 00    	je     760 <malloc+0xb0>
 6d1:	8b 02                	mov    (%edx),%eax
 6d3:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6d6:	39 cf                	cmp    %ecx,%edi
 6d8:	76 66                	jbe    740 <malloc+0x90>
 6da:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6e0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6e5:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6e8:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6ef:	eb 10                	jmp    701 <malloc+0x51>
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6fa:	8b 48 04             	mov    0x4(%eax),%ecx
 6fd:	39 f9                	cmp    %edi,%ecx
 6ff:	73 3f                	jae    740 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 701:	39 05 5c 0a 00 00    	cmp    %eax,0xa5c
 707:	89 c2                	mov    %eax,%edx
 709:	75 ed                	jne    6f8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 70b:	89 34 24             	mov    %esi,(%esp)
 70e:	e8 35 fc ff ff       	call   348 <sbrk>
  if(p == (char*)-1)
 713:	83 f8 ff             	cmp    $0xffffffff,%eax
 716:	74 18                	je     730 <malloc+0x80>
  hp->s.size = nu;
 718:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 71b:	83 c0 08             	add    $0x8,%eax
 71e:	89 04 24             	mov    %eax,(%esp)
 721:	e8 ea fe ff ff       	call   610 <free>
  return freep;
 726:	8b 15 5c 0a 00 00    	mov    0xa5c,%edx
      if((p = morecore(nunits)) == 0)
 72c:	85 d2                	test   %edx,%edx
 72e:	75 c8                	jne    6f8 <malloc+0x48>
        return 0;
  }
}
 730:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 733:	31 c0                	xor    %eax,%eax
}
 735:	5b                   	pop    %ebx
 736:	5e                   	pop    %esi
 737:	5f                   	pop    %edi
 738:	5d                   	pop    %ebp
 739:	c3                   	ret    
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 740:	39 cf                	cmp    %ecx,%edi
 742:	74 4c                	je     790 <malloc+0xe0>
        p->s.size -= nunits;
 744:	29 f9                	sub    %edi,%ecx
 746:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 749:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 74c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 74f:	89 15 5c 0a 00 00    	mov    %edx,0xa5c
}
 755:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 758:	83 c0 08             	add    $0x8,%eax
}
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 760:	b8 60 0a 00 00       	mov    $0xa60,%eax
 765:	ba 60 0a 00 00       	mov    $0xa60,%edx
    base.s.size = 0;
 76a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 76c:	a3 5c 0a 00 00       	mov    %eax,0xa5c
    base.s.size = 0;
 771:	b8 60 0a 00 00       	mov    $0xa60,%eax
    base.s.ptr = freep = prevp = &base;
 776:	89 15 60 0a 00 00    	mov    %edx,0xa60
    base.s.size = 0;
 77c:	89 0d 64 0a 00 00    	mov    %ecx,0xa64
 782:	e9 53 ff ff ff       	jmp    6da <malloc+0x2a>
 787:	89 f6                	mov    %esi,%esi
 789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb b9                	jmp    74f <malloc+0x9f>
