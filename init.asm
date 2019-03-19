
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   1:	b9 02 00 00 00       	mov    $0x2,%ecx
{
   6:	89 e5                	mov    %esp,%ebp
   8:	53                   	push   %ebx
   9:	83 e4 f0             	and    $0xfffffff0,%esp
   c:	83 ec 10             	sub    $0x10,%esp
  if(open("console", O_RDWR) < 0){
   f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  13:	c7 04 24 18 08 00 00 	movl   $0x818,(%esp)
  1a:	e8 79 03 00 00       	call   398 <open>
  1f:	85 c0                	test   %eax,%eax
  21:	0f 88 c8 00 00 00    	js     ef <main+0xef>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2e:	e8 9d 03 00 00       	call   3d0 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 91 03 00 00       	call   3d0 <dup>
  3f:	90                   	nop

  for(;;){
    printf(1, "init: starting sh\n");
  40:	ba 20 08 00 00       	mov    $0x820,%edx
  45:	89 54 24 04          	mov    %edx,0x4(%esp)
  49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  50:	e8 4b 04 00 00       	call   4a0 <printf>
    pid = fork();
  55:	e8 f6 02 00 00       	call   350 <fork>
    if(pid < 0){
  5a:	85 c0                	test   %eax,%eax
    pid = fork();
  5c:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  5e:	78 3b                	js     9b <main+0x9b>
      printf(1, "init: fork failed\n");
      exit(0);
    }
    if(pid == 0){
  60:	74 59                	je     bb <main+0xbb>
  62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit(0);
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 eb 02 00 00       	call   360 <wait>
  75:	89 c2                	mov    %eax,%edx
  77:	f7 d2                	not    %edx
  79:	c1 ea 1f             	shr    $0x1f,%edx
  7c:	84 d2                	test   %dl,%dl
  7e:	74 c0                	je     40 <main+0x40>
  80:	39 c3                	cmp    %eax,%ebx
  82:	74 bc                	je     40 <main+0x40>
      printf(1, "zombie!\n");
  84:	b8 5f 08 00 00       	mov    $0x85f,%eax
  89:	89 44 24 04          	mov    %eax,0x4(%esp)
  8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  94:	e8 07 04 00 00       	call   4a0 <printf>
  99:	eb d5                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  9b:	c7 44 24 04 33 08 00 	movl   $0x833,0x4(%esp)
  a2:	00 
  a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  aa:	e8 f1 03 00 00       	call   4a0 <printf>
      exit(0);
  af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  b6:	e8 9d 02 00 00       	call   358 <exit>
      exec("sh", argv);
  bb:	c7 44 24 04 fc 0a 00 	movl   $0xafc,0x4(%esp)
  c2:	00 
  c3:	c7 04 24 46 08 00 00 	movl   $0x846,(%esp)
  ca:	e8 c1 02 00 00       	call   390 <exec>
      printf(1, "init: exec sh failed\n");
  cf:	c7 44 24 04 49 08 00 	movl   $0x849,0x4(%esp)
  d6:	00 
  d7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  de:	e8 bd 03 00 00       	call   4a0 <printf>
      exit(0);
  e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  ea:	e8 69 02 00 00       	call   358 <exit>
    mknod("console", 1, 1);
  ef:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  f6:	00 
  f7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  fe:	00 
  ff:	c7 04 24 18 08 00 00 	movl   $0x818,(%esp)
 106:	e8 95 02 00 00       	call   3a0 <mknod>
    open("console", O_RDWR);
 10b:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 112:	00 
 113:	c7 04 24 18 08 00 00 	movl   $0x818,(%esp)
 11a:	e8 79 02 00 00       	call   398 <open>
 11f:	e9 03 ff ff ff       	jmp    27 <main+0x27>
 124:	66 90                	xchg   %ax,%ax
 126:	66 90                	xchg   %ax,%ax
 128:	66 90                	xchg   %ax,%ax
 12a:	66 90                	xchg   %ax,%ax
 12c:	66 90                	xchg   %ax,%ax
 12e:	66 90                	xchg   %ax,%ax

00000130 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 139:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 13a:	89 c2                	mov    %eax,%edx
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 140:	41                   	inc    %ecx
 141:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 145:	42                   	inc    %edx
 146:	84 db                	test   %bl,%bl
 148:	88 5a ff             	mov    %bl,-0x1(%edx)
 14b:	75 f3                	jne    140 <strcpy+0x10>
    ;
  return os;
}
 14d:	5b                   	pop    %ebx
 14e:	5d                   	pop    %ebp
 14f:	c3                   	ret    

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 4d 08             	mov    0x8(%ebp),%ecx
 156:	53                   	push   %ebx
 157:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
 15a:	0f b6 01             	movzbl (%ecx),%eax
 15d:	0f b6 13             	movzbl (%ebx),%edx
 160:	84 c0                	test   %al,%al
 162:	75 18                	jne    17c <strcmp+0x2c>
 164:	eb 22                	jmp    188 <strcmp+0x38>
 166:	8d 76 00             	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 170:	41                   	inc    %ecx
  while(*p && *p == *q)
 171:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
 174:	43                   	inc    %ebx
 175:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
 178:	84 c0                	test   %al,%al
 17a:	74 0c                	je     188 <strcmp+0x38>
 17c:	38 d0                	cmp    %dl,%al
 17e:	74 f0                	je     170 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
 180:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
 181:	29 d0                	sub    %edx,%eax
}
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
 185:	8d 76 00             	lea    0x0(%esi),%esi
 188:	5b                   	pop    %ebx
 189:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 18b:	29 d0                	sub    %edx,%eax
}
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
 18f:	90                   	nop

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 196:	80 39 00             	cmpb   $0x0,(%ecx)
 199:	74 15                	je     1b0 <strlen+0x20>
 19b:	31 d2                	xor    %edx,%edx
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	42                   	inc    %edx
 1a1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a5:	89 d0                	mov    %edx,%eax
 1a7:	75 f7                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    
 1ab:	90                   	nop
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
 1b0:	31 c0                	xor    %eax,%eax
}
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	5f                   	pop    %edi
 1d3:	89 d0                	mov    %edx,%eax
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	74 1b                	je     20c <strchr+0x2c>
    if(*s == c)
 1f1:	38 d1                	cmp    %dl,%cl
 1f3:	75 0f                	jne    204 <strchr+0x24>
 1f5:	eb 17                	jmp    20e <strchr+0x2e>
 1f7:	89 f6                	mov    %esi,%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0a                	je     20e <strchr+0x2e>
  for(; *s; s++)
 204:	40                   	inc    %eax
 205:	0f b6 10             	movzbl (%eax),%edx
 208:	84 d2                	test   %dl,%dl
 20a:	75 f4                	jne    200 <strchr+0x20>
      return (char*)s;
  return 0;
 20c:	31 c0                	xor    %eax,%eax
}
 20e:	5d                   	pop    %ebp
 20f:	c3                   	ret    

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 215:	31 f6                	xor    %esi,%esi
{
 217:	53                   	push   %ebx
 218:	83 ec 3c             	sub    $0x3c,%esp
 21b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 21e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 221:	eb 32                	jmp    255 <gets+0x45>
 223:	90                   	nop
 224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 228:	ba 01 00 00 00       	mov    $0x1,%edx
 22d:	89 54 24 08          	mov    %edx,0x8(%esp)
 231:	89 7c 24 04          	mov    %edi,0x4(%esp)
 235:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 23c:	e8 2f 01 00 00       	call   370 <read>
    if(cc < 1)
 241:	85 c0                	test   %eax,%eax
 243:	7e 19                	jle    25e <gets+0x4e>
      break;
    buf[i++] = c;
 245:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 249:	43                   	inc    %ebx
 24a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	74 1f                	je     270 <gets+0x60>
 251:	3c 0d                	cmp    $0xd,%al
 253:	74 1b                	je     270 <gets+0x60>
  for(i=0; i+1 < max; ){
 255:	46                   	inc    %esi
 256:	3b 75 0c             	cmp    0xc(%ebp),%esi
 259:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 25c:	7c ca                	jl     228 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 25e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 261:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	83 c4 3c             	add    $0x3c,%esp
 26a:	5b                   	pop    %ebx
 26b:	5e                   	pop    %esi
 26c:	5f                   	pop    %edi
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
 26f:	90                   	nop
 270:	8b 45 08             	mov    0x8(%ebp),%eax
 273:	01 c6                	add    %eax,%esi
 275:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 278:	eb e4                	jmp    25e <gets+0x4e>
 27a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 281:	31 c0                	xor    %eax,%eax
{
 283:	89 e5                	mov    %esp,%ebp
 285:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 288:	89 44 24 04          	mov    %eax,0x4(%esp)
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
{
 28f:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 292:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 295:	89 04 24             	mov    %eax,(%esp)
 298:	e8 fb 00 00 00       	call   398 <open>
  if(fd < 0)
 29d:	85 c0                	test   %eax,%eax
 29f:	78 2f                	js     2d0 <stat+0x50>
 2a1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a6:	89 1c 24             	mov    %ebx,(%esp)
 2a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ad:	e8 fe 00 00 00       	call   3b0 <fstat>
  close(fd);
 2b2:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2b5:	89 c6                	mov    %eax,%esi
  close(fd);
 2b7:	e8 c4 00 00 00       	call   380 <close>
  return r;
}
 2bc:	89 f0                	mov    %esi,%eax
 2be:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2c1:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2c4:	89 ec                	mov    %ebp,%esp
 2c6:	5d                   	pop    %ebp
 2c7:	c3                   	ret    
 2c8:	90                   	nop
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 2d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2d5:	eb e5                	jmp    2bc <stat+0x3c>
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e7:	0f be 11             	movsbl (%ecx),%edx
 2ea:	88 d0                	mov    %dl,%al
 2ec:	2c 30                	sub    $0x30,%al
 2ee:	3c 09                	cmp    $0x9,%al
  n = 0;
 2f0:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2f5:	77 1e                	ja     315 <atoi+0x35>
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 300:	41                   	inc    %ecx
 301:	8d 04 80             	lea    (%eax,%eax,4),%eax
 304:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 308:	0f be 11             	movsbl (%ecx),%edx
 30b:	88 d3                	mov    %dl,%bl
 30d:	80 eb 30             	sub    $0x30,%bl
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	5b                   	pop    %ebx
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    
 318:	90                   	nop
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	53                   	push   %ebx
 328:	8b 5d 10             	mov    0x10(%ebp),%ebx
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32e:	85 db                	test   %ebx,%ebx
 330:	7e 1a                	jle    34c <memmove+0x2c>
 332:	31 d2                	xor    %edx,%edx
 334:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 33a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 340:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 344:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 347:	42                   	inc    %edx
  while(n-- > 0)
 348:	39 d3                	cmp    %edx,%ebx
 34a:	75 f4                	jne    340 <memmove+0x20>
  return vdst;
}
 34c:	5b                   	pop    %ebx
 34d:	5e                   	pop    %esi
 34e:	5d                   	pop    %ebp
 34f:	c3                   	ret    

00000350 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 350:	b8 01 00 00 00       	mov    $0x1,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <exit>:
SYSCALL(exit)
 358:	b8 02 00 00 00       	mov    $0x2,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <wait>:
SYSCALL(wait)
 360:	b8 03 00 00 00       	mov    $0x3,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <pipe>:
SYSCALL(pipe)
 368:	b8 04 00 00 00       	mov    $0x4,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <read>:
SYSCALL(read)
 370:	b8 05 00 00 00       	mov    $0x5,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <write>:
SYSCALL(write)
 378:	b8 10 00 00 00       	mov    $0x10,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <close>:
SYSCALL(close)
 380:	b8 15 00 00 00       	mov    $0x15,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <kill>:
SYSCALL(kill)
 388:	b8 06 00 00 00       	mov    $0x6,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exec>:
SYSCALL(exec)
 390:	b8 07 00 00 00       	mov    $0x7,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <open>:
SYSCALL(open)
 398:	b8 0f 00 00 00       	mov    $0xf,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <mknod>:
SYSCALL(mknod)
 3a0:	b8 11 00 00 00       	mov    $0x11,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <unlink>:
SYSCALL(unlink)
 3a8:	b8 12 00 00 00       	mov    $0x12,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <fstat>:
SYSCALL(fstat)
 3b0:	b8 08 00 00 00       	mov    $0x8,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <link>:
SYSCALL(link)
 3b8:	b8 13 00 00 00       	mov    $0x13,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <mkdir>:
SYSCALL(mkdir)
 3c0:	b8 14 00 00 00       	mov    $0x14,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <chdir>:
SYSCALL(chdir)
 3c8:	b8 09 00 00 00       	mov    $0x9,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <dup>:
SYSCALL(dup)
 3d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <getpid>:
SYSCALL(getpid)
 3d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <sbrk>:
SYSCALL(sbrk)
 3e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <sleep>:
SYSCALL(sleep)
 3e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <uptime>:
SYSCALL(uptime)
 3f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    
 3f8:	66 90                	xchg   %ax,%ax
 3fa:	66 90                	xchg   %ax,%ax
 3fc:	66 90                	xchg   %ax,%ax
 3fe:	66 90                	xchg   %ax,%ax

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 406:	89 d3                	mov    %edx,%ebx
 408:	c1 eb 1f             	shr    $0x1f,%ebx
{
 40b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 40e:	84 db                	test   %bl,%bl
{
 410:	89 45 c0             	mov    %eax,-0x40(%ebp)
 413:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 415:	74 79                	je     490 <printint+0x90>
 417:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 41b:	74 73                	je     490 <printint+0x90>
    neg = 1;
    x = -xx;
 41d:	f7 d8                	neg    %eax
    neg = 1;
 41f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 426:	31 f6                	xor    %esi,%esi
 428:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 42b:	eb 05                	jmp    432 <printint+0x32>
 42d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 430:	89 fe                	mov    %edi,%esi
 432:	31 d2                	xor    %edx,%edx
 434:	f7 f1                	div    %ecx
 436:	8d 7e 01             	lea    0x1(%esi),%edi
 439:	0f b6 92 70 08 00 00 	movzbl 0x870(%edx),%edx
  }while((x /= base) != 0);
 440:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 442:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 445:	75 e9                	jne    430 <printint+0x30>
  if(neg)
 447:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 44a:	85 d2                	test   %edx,%edx
 44c:	74 08                	je     456 <printint+0x56>
    buf[i++] = '-';
 44e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 453:	8d 7e 02             	lea    0x2(%esi),%edi
 456:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 45a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	0f b6 06             	movzbl (%esi),%eax
 463:	4e                   	dec    %esi
  write(fd, &c, 1);
 464:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 468:	89 3c 24             	mov    %edi,(%esp)
 46b:	88 45 d7             	mov    %al,-0x29(%ebp)
 46e:	b8 01 00 00 00       	mov    $0x1,%eax
 473:	89 44 24 08          	mov    %eax,0x8(%esp)
 477:	e8 fc fe ff ff       	call   378 <write>

  while(--i >= 0)
 47c:	39 de                	cmp    %ebx,%esi
 47e:	75 e0                	jne    460 <printint+0x60>
    putc(fd, buf[i]);
}
 480:	83 c4 4c             	add    $0x4c,%esp
 483:	5b                   	pop    %ebx
 484:	5e                   	pop    %esi
 485:	5f                   	pop    %edi
 486:	5d                   	pop    %ebp
 487:	c3                   	ret    
 488:	90                   	nop
 489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 490:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 497:	eb 8d                	jmp    426 <printint+0x26>
 499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4ac:	0f b6 1e             	movzbl (%esi),%ebx
 4af:	84 db                	test   %bl,%bl
 4b1:	0f 84 d1 00 00 00    	je     588 <printf+0xe8>
  state = 0;
 4b7:	31 ff                	xor    %edi,%edi
 4b9:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 4ba:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 4bd:	89 fa                	mov    %edi,%edx
 4bf:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 4c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c5:	eb 41                	jmp    508 <printf+0x68>
 4c7:	89 f6                	mov    %esi,%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d0:	83 f8 25             	cmp    $0x25,%eax
 4d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 4d6:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4db:	74 1e                	je     4fb <printf+0x5b>
  write(fd, &c, 1);
 4dd:	b8 01 00 00 00       	mov    $0x1,%eax
 4e2:	89 44 24 08          	mov    %eax,0x8(%esp)
 4e6:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ed:	89 3c 24             	mov    %edi,(%esp)
 4f0:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4f3:	e8 80 fe ff ff       	call   378 <write>
 4f8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4fb:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 4fc:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 500:	84 db                	test   %bl,%bl
 502:	0f 84 80 00 00 00    	je     588 <printf+0xe8>
    if(state == 0){
 508:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 50a:	0f be cb             	movsbl %bl,%ecx
 50d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 510:	74 be                	je     4d0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 512:	83 fa 25             	cmp    $0x25,%edx
 515:	75 e4                	jne    4fb <printf+0x5b>
      if(c == 'd'){
 517:	83 f8 64             	cmp    $0x64,%eax
 51a:	0f 84 f0 00 00 00    	je     610 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 520:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 526:	83 f9 70             	cmp    $0x70,%ecx
 529:	74 65                	je     590 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 52b:	83 f8 73             	cmp    $0x73,%eax
 52e:	0f 84 8c 00 00 00    	je     5c0 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 534:	83 f8 63             	cmp    $0x63,%eax
 537:	0f 84 13 01 00 00    	je     650 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 53d:	83 f8 25             	cmp    $0x25,%eax
 540:	0f 84 e2 00 00 00    	je     628 <printf+0x188>
  write(fd, &c, 1);
 546:	b8 01 00 00 00       	mov    $0x1,%eax
 54b:	46                   	inc    %esi
 54c:	89 44 24 08          	mov    %eax,0x8(%esp)
 550:	8d 45 e7             	lea    -0x19(%ebp),%eax
 553:	89 44 24 04          	mov    %eax,0x4(%esp)
 557:	89 3c 24             	mov    %edi,(%esp)
 55a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 55e:	e8 15 fe ff ff       	call   378 <write>
 563:	ba 01 00 00 00       	mov    $0x1,%edx
 568:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 56b:	89 54 24 08          	mov    %edx,0x8(%esp)
 56f:	89 44 24 04          	mov    %eax,0x4(%esp)
 573:	89 3c 24             	mov    %edi,(%esp)
 576:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 579:	e8 fa fd ff ff       	call   378 <write>
  for(i = 0; fmt[i]; i++){
 57e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 582:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 584:	84 db                	test   %bl,%bl
 586:	75 80                	jne    508 <printf+0x68>
    }
  }
}
 588:	83 c4 3c             	add    $0x3c,%esp
 58b:	5b                   	pop    %ebx
 58c:	5e                   	pop    %esi
 58d:	5f                   	pop    %edi
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 590:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 597:	b9 10 00 00 00       	mov    $0x10,%ecx
 59c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 59f:	89 f8                	mov    %edi,%eax
 5a1:	8b 13                	mov    (%ebx),%edx
 5a3:	e8 58 fe ff ff       	call   400 <printint>
        ap++;
 5a8:	89 d8                	mov    %ebx,%eax
      state = 0;
 5aa:	31 d2                	xor    %edx,%edx
        ap++;
 5ac:	83 c0 04             	add    $0x4,%eax
 5af:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b2:	e9 44 ff ff ff       	jmp    4fb <printf+0x5b>
 5b7:	89 f6                	mov    %esi,%esi
 5b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 5c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5c3:	8b 10                	mov    (%eax),%edx
        ap++;
 5c5:	83 c0 04             	add    $0x4,%eax
 5c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5cb:	85 d2                	test   %edx,%edx
 5cd:	0f 84 aa 00 00 00    	je     67d <printf+0x1dd>
        while(*s != 0){
 5d3:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 5d6:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 5d8:	84 c0                	test   %al,%al
 5da:	74 27                	je     603 <printf+0x163>
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5e3:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 5e8:	43                   	inc    %ebx
  write(fd, &c, 1);
 5e9:	89 44 24 08          	mov    %eax,0x8(%esp)
 5ed:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f4:	89 3c 24             	mov    %edi,(%esp)
 5f7:	e8 7c fd ff ff       	call   378 <write>
        while(*s != 0){
 5fc:	0f b6 03             	movzbl (%ebx),%eax
 5ff:	84 c0                	test   %al,%al
 601:	75 dd                	jne    5e0 <printf+0x140>
      state = 0;
 603:	31 d2                	xor    %edx,%edx
 605:	e9 f1 fe ff ff       	jmp    4fb <printf+0x5b>
 60a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 610:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 617:	b9 0a 00 00 00       	mov    $0xa,%ecx
 61c:	e9 7b ff ff ff       	jmp    59c <printf+0xfc>
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 628:	b9 01 00 00 00       	mov    $0x1,%ecx
 62d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 630:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 634:	89 44 24 04          	mov    %eax,0x4(%esp)
 638:	89 3c 24             	mov    %edi,(%esp)
 63b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 63e:	e8 35 fd ff ff       	call   378 <write>
      state = 0;
 643:	31 d2                	xor    %edx,%edx
 645:	e9 b1 fe ff ff       	jmp    4fb <printf+0x5b>
 64a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 650:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 653:	8b 03                	mov    (%ebx),%eax
        ap++;
 655:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 658:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 65b:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 65e:	b8 01 00 00 00       	mov    $0x1,%eax
 663:	89 44 24 08          	mov    %eax,0x8(%esp)
 667:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 66a:	89 44 24 04          	mov    %eax,0x4(%esp)
 66e:	e8 05 fd ff ff       	call   378 <write>
      state = 0;
 673:	31 d2                	xor    %edx,%edx
        ap++;
 675:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 678:	e9 7e fe ff ff       	jmp    4fb <printf+0x5b>
          s = "(null)";
 67d:	bb 68 08 00 00       	mov    $0x868,%ebx
        while(*s != 0){
 682:	b0 28                	mov    $0x28,%al
 684:	e9 57 ff ff ff       	jmp    5e0 <printf+0x140>
 689:	66 90                	xchg   %ax,%ax
 68b:	66 90                	xchg   %ax,%ax
 68d:	66 90                	xchg   %ax,%ax
 68f:	90                   	nop

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	a1 04 0b 00 00       	mov    0xb04,%eax
{
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 69e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6a1:	eb 0d                	jmp    6b0 <free+0x20>
 6a3:	90                   	nop
 6a4:	90                   	nop
 6a5:	90                   	nop
 6a6:	90                   	nop
 6a7:	90                   	nop
 6a8:	90                   	nop
 6a9:	90                   	nop
 6aa:	90                   	nop
 6ab:	90                   	nop
 6ac:	90                   	nop
 6ad:	90                   	nop
 6ae:	90                   	nop
 6af:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b0:	39 c8                	cmp    %ecx,%eax
 6b2:	8b 10                	mov    (%eax),%edx
 6b4:	73 32                	jae    6e8 <free+0x58>
 6b6:	39 d1                	cmp    %edx,%ecx
 6b8:	72 04                	jb     6be <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ba:	39 d0                	cmp    %edx,%eax
 6bc:	72 32                	jb     6f0 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6be:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6c1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6c4:	39 fa                	cmp    %edi,%edx
 6c6:	74 30                	je     6f8 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6c8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cb:	8b 50 04             	mov    0x4(%eax),%edx
 6ce:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6d1:	39 f1                	cmp    %esi,%ecx
 6d3:	74 3c                	je     711 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6d5:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6d7:	5b                   	pop    %ebx
  freep = p;
 6d8:	a3 04 0b 00 00       	mov    %eax,0xb04
}
 6dd:	5e                   	pop    %esi
 6de:	5f                   	pop    %edi
 6df:	5d                   	pop    %ebp
 6e0:	c3                   	ret    
 6e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e8:	39 d0                	cmp    %edx,%eax
 6ea:	72 04                	jb     6f0 <free+0x60>
 6ec:	39 d1                	cmp    %edx,%ecx
 6ee:	72 ce                	jb     6be <free+0x2e>
{
 6f0:	89 d0                	mov    %edx,%eax
 6f2:	eb bc                	jmp    6b0 <free+0x20>
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6f8:	8b 7a 04             	mov    0x4(%edx),%edi
 6fb:	01 fe                	add    %edi,%esi
 6fd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 700:	8b 10                	mov    (%eax),%edx
 702:	8b 12                	mov    (%edx),%edx
 704:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 707:	8b 50 04             	mov    0x4(%eax),%edx
 70a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 70d:	39 f1                	cmp    %esi,%ecx
 70f:	75 c4                	jne    6d5 <free+0x45>
    p->s.size += bp->s.size;
 711:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 714:	a3 04 0b 00 00       	mov    %eax,0xb04
    p->s.size += bp->s.size;
 719:	01 ca                	add    %ecx,%edx
 71b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 71e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 721:	89 10                	mov    %edx,(%eax)
}
 723:	5b                   	pop    %ebx
 724:	5e                   	pop    %esi
 725:	5f                   	pop    %edi
 726:	5d                   	pop    %ebp
 727:	c3                   	ret    
 728:	90                   	nop
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 739:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 73c:	8b 15 04 0b 00 00    	mov    0xb04,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 742:	8d 78 07             	lea    0x7(%eax),%edi
 745:	c1 ef 03             	shr    $0x3,%edi
 748:	47                   	inc    %edi
  if((prevp = freep) == 0){
 749:	85 d2                	test   %edx,%edx
 74b:	0f 84 8f 00 00 00    	je     7e0 <malloc+0xb0>
 751:	8b 02                	mov    (%edx),%eax
 753:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 756:	39 cf                	cmp    %ecx,%edi
 758:	76 66                	jbe    7c0 <malloc+0x90>
 75a:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 760:	bb 00 10 00 00       	mov    $0x1000,%ebx
 765:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 768:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 76f:	eb 10                	jmp    781 <malloc+0x51>
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 778:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 77a:	8b 48 04             	mov    0x4(%eax),%ecx
 77d:	39 f9                	cmp    %edi,%ecx
 77f:	73 3f                	jae    7c0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 781:	39 05 04 0b 00 00    	cmp    %eax,0xb04
 787:	89 c2                	mov    %eax,%edx
 789:	75 ed                	jne    778 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 78b:	89 34 24             	mov    %esi,(%esp)
 78e:	e8 4d fc ff ff       	call   3e0 <sbrk>
  if(p == (char*)-1)
 793:	83 f8 ff             	cmp    $0xffffffff,%eax
 796:	74 18                	je     7b0 <malloc+0x80>
  hp->s.size = nu;
 798:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 79b:	83 c0 08             	add    $0x8,%eax
 79e:	89 04 24             	mov    %eax,(%esp)
 7a1:	e8 ea fe ff ff       	call   690 <free>
  return freep;
 7a6:	8b 15 04 0b 00 00    	mov    0xb04,%edx
      if((p = morecore(nunits)) == 0)
 7ac:	85 d2                	test   %edx,%edx
 7ae:	75 c8                	jne    778 <malloc+0x48>
        return 0;
  }
}
 7b0:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 7b3:	31 c0                	xor    %eax,%eax
}
 7b5:	5b                   	pop    %ebx
 7b6:	5e                   	pop    %esi
 7b7:	5f                   	pop    %edi
 7b8:	5d                   	pop    %ebp
 7b9:	c3                   	ret    
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7c0:	39 cf                	cmp    %ecx,%edi
 7c2:	74 4c                	je     810 <malloc+0xe0>
        p->s.size -= nunits;
 7c4:	29 f9                	sub    %edi,%ecx
 7c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7cc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7cf:	89 15 04 0b 00 00    	mov    %edx,0xb04
}
 7d5:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 7d8:	83 c0 08             	add    $0x8,%eax
}
 7db:	5b                   	pop    %ebx
 7dc:	5e                   	pop    %esi
 7dd:	5f                   	pop    %edi
 7de:	5d                   	pop    %ebp
 7df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7e0:	b8 08 0b 00 00       	mov    $0xb08,%eax
 7e5:	ba 08 0b 00 00       	mov    $0xb08,%edx
    base.s.size = 0;
 7ea:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 7ec:	a3 04 0b 00 00       	mov    %eax,0xb04
    base.s.size = 0;
 7f1:	b8 08 0b 00 00       	mov    $0xb08,%eax
    base.s.ptr = freep = prevp = &base;
 7f6:	89 15 08 0b 00 00    	mov    %edx,0xb08
    base.s.size = 0;
 7fc:	89 0d 0c 0b 00 00    	mov    %ecx,0xb0c
 802:	e9 53 ff ff ff       	jmp    75a <malloc+0x2a>
 807:	89 f6                	mov    %esi,%esi
 809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 810:	8b 08                	mov    (%eax),%ecx
 812:	89 0a                	mov    %ecx,(%edx)
 814:	eb b9                	jmp    7cf <malloc+0x9f>
