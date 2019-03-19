
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 20             	sub    $0x20,%esp
   c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int fd, i;

  if(argc <= 1){
   f:	83 ff 01             	cmp    $0x1,%edi
  12:	7e 78                	jle    8c <main+0x8c>
  14:	8b 45 0c             	mov    0xc(%ebp),%eax
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
  17:	be 01 00 00 00       	mov    $0x1,%esi
  1c:	8d 58 04             	lea    0x4(%eax),%ebx
  1f:	90                   	nop
    if((fd = open(argv[i], 0)) < 0){
  20:	31 c0                	xor    %eax,%eax
  22:	89 44 24 04          	mov    %eax,0x4(%esp)
  26:	8b 03                	mov    (%ebx),%eax
  28:	89 04 24             	mov    %eax,(%esp)
  2b:	e8 f8 03 00 00       	call   428 <open>
  30:	85 c0                	test   %eax,%eax
  32:	78 32                	js     66 <main+0x66>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit(0);
    }
    wc(fd, argv[i]);
  34:	8b 13                	mov    (%ebx),%edx
  for(i = 1; i < argc; i++){
  36:	46                   	inc    %esi
  37:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  3a:	89 04 24             	mov    %eax,(%esp)
  3d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  41:	89 54 24 04          	mov    %edx,0x4(%esp)
  45:	e8 66 00 00 00       	call   b0 <wc>
    close(fd);
  4a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 ba 03 00 00       	call   410 <close>
  for(i = 1; i < argc; i++){
  56:	39 f7                	cmp    %esi,%edi
  58:	75 c6                	jne    20 <main+0x20>
  }
  exit(0);
  5a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  61:	e8 82 03 00 00       	call   3e8 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  66:	8b 03                	mov    (%ebx),%eax
  68:	c7 44 24 04 cb 08 00 	movl   $0x8cb,0x4(%esp)
  6f:	00 
  70:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  77:	89 44 24 08          	mov    %eax,0x8(%esp)
  7b:	e8 b0 04 00 00       	call   530 <printf>
      exit(0);
  80:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  87:	e8 5c 03 00 00       	call   3e8 <exit>
    wc(0, "");
  8c:	c7 44 24 04 bd 08 00 	movl   $0x8bd,0x4(%esp)
  93:	00 
  94:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9b:	e8 10 00 00 00       	call   b0 <wc>
    exit(0);
  a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a7:	e8 3c 03 00 00       	call   3e8 <exit>
  ac:	66 90                	xchg   %ax,%ax
  ae:	66 90                	xchg   %ax,%ax

000000b0 <wc>:
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  l = w = c = 0;
  b6:	31 db                	xor    %ebx,%ebx
{
  b8:	83 ec 3c             	sub    $0x3c,%esp
  inword = 0;
  bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  c2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  c9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  d0:	8b 45 08             	mov    0x8(%ebp),%eax
  d3:	ba 00 02 00 00       	mov    $0x200,%edx
  d8:	b9 e0 0b 00 00       	mov    $0xbe0,%ecx
  dd:	89 54 24 08          	mov    %edx,0x8(%esp)
  e1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  e5:	89 04 24             	mov    %eax,(%esp)
  e8:	e8 13 03 00 00       	call   400 <read>
  ed:	83 f8 00             	cmp    $0x0,%eax
  f0:	89 c6                	mov    %eax,%esi
  f2:	7e 6c                	jle    160 <wc+0xb0>
    for(i=0; i<n; i++){
  f4:	31 ff                	xor    %edi,%edi
  f6:	eb 14                	jmp    10c <wc+0x5c>
  f8:	90                   	nop
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        inword = 0;
 100:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
 107:	47                   	inc    %edi
 108:	39 fe                	cmp    %edi,%esi
 10a:	74 44                	je     150 <wc+0xa0>
      if(buf[i] == '\n')
 10c:	0f be 87 e0 0b 00 00 	movsbl 0xbe0(%edi),%eax
        l++;
 113:	31 c9                	xor    %ecx,%ecx
      if(strchr(" \r\t\n\v", buf[i]))
 115:	c7 04 24 a8 08 00 00 	movl   $0x8a8,(%esp)
        l++;
 11c:	3c 0a                	cmp    $0xa,%al
 11e:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 121:	89 44 24 04          	mov    %eax,0x4(%esp)
        l++;
 125:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 127:	e8 44 01 00 00       	call   270 <strchr>
 12c:	85 c0                	test   %eax,%eax
 12e:	75 d0                	jne    100 <wc+0x50>
      else if(!inword){
 130:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 133:	85 c0                	test   %eax,%eax
 135:	75 d0                	jne    107 <wc+0x57>
    for(i=0; i<n; i++){
 137:	47                   	inc    %edi
        w++;
 138:	ff 45 dc             	incl   -0x24(%ebp)
    for(i=0; i<n; i++){
 13b:	39 fe                	cmp    %edi,%esi
        inword = 1;
 13d:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 144:	75 c6                	jne    10c <wc+0x5c>
 146:	8d 76 00             	lea    0x0(%esi),%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 150:	01 75 e0             	add    %esi,-0x20(%ebp)
 153:	e9 78 ff ff ff       	jmp    d0 <wc+0x20>
 158:	90                   	nop
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(n < 0){
 160:	75 36                	jne    198 <wc+0xe8>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 162:	8b 45 0c             	mov    0xc(%ebp),%eax
 165:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 169:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 170:	89 44 24 14          	mov    %eax,0x14(%esp)
 174:	8b 45 e0             	mov    -0x20(%ebp),%eax
 177:	89 44 24 10          	mov    %eax,0x10(%esp)
 17b:	8b 45 dc             	mov    -0x24(%ebp),%eax
 17e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 182:	b8 be 08 00 00       	mov    $0x8be,%eax
 187:	89 44 24 04          	mov    %eax,0x4(%esp)
 18b:	e8 a0 03 00 00       	call   530 <printf>
}
 190:	83 c4 3c             	add    $0x3c,%esp
 193:	5b                   	pop    %ebx
 194:	5e                   	pop    %esi
 195:	5f                   	pop    %edi
 196:	5d                   	pop    %ebp
 197:	c3                   	ret    
    printf(1, "wc: read error\n");
 198:	c7 44 24 04 ae 08 00 	movl   $0x8ae,0x4(%esp)
 19f:	00 
 1a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1a7:	e8 84 03 00 00       	call   530 <printf>
    exit(0);
 1ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b3:	e8 30 02 00 00       	call   3e8 <exit>
 1b8:	66 90                	xchg   %ax,%ax
 1ba:	66 90                	xchg   %ax,%ax
 1bc:	66 90                	xchg   %ax,%ax
 1be:	66 90                	xchg   %ax,%ax

000001c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1c9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ca:	89 c2                	mov    %eax,%edx
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d0:	41                   	inc    %ecx
 1d1:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1d5:	42                   	inc    %edx
 1d6:	84 db                	test   %bl,%bl
 1d8:	88 5a ff             	mov    %bl,-0x1(%edx)
 1db:	75 f3                	jne    1d0 <strcpy+0x10>
    ;
  return os;
}
 1dd:	5b                   	pop    %ebx
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e6:	53                   	push   %ebx
 1e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
 1ea:	0f b6 01             	movzbl (%ecx),%eax
 1ed:	0f b6 13             	movzbl (%ebx),%edx
 1f0:	84 c0                	test   %al,%al
 1f2:	75 18                	jne    20c <strcmp+0x2c>
 1f4:	eb 22                	jmp    218 <strcmp+0x38>
 1f6:	8d 76 00             	lea    0x0(%esi),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 200:	41                   	inc    %ecx
  while(*p && *p == *q)
 201:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
 204:	43                   	inc    %ebx
 205:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
 208:	84 c0                	test   %al,%al
 20a:	74 0c                	je     218 <strcmp+0x38>
 20c:	38 d0                	cmp    %dl,%al
 20e:	74 f0                	je     200 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
 210:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
 211:	29 d0                	sub    %edx,%eax
}
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    
 215:	8d 76 00             	lea    0x0(%esi),%esi
 218:	5b                   	pop    %ebx
 219:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 21b:	29 d0                	sub    %edx,%eax
}
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    
 21f:	90                   	nop

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 226:	80 39 00             	cmpb   $0x0,(%ecx)
 229:	74 15                	je     240 <strlen+0x20>
 22b:	31 d2                	xor    %edx,%edx
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	42                   	inc    %edx
 231:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 235:	89 d0                	mov    %edx,%eax
 237:	75 f7                	jne    230 <strlen+0x10>
    ;
  return n;
}
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
 240:	31 c0                	xor    %eax,%eax
}
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    
 244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 24a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 55 08             	mov    0x8(%ebp),%edx
 256:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld    
 260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 262:	5f                   	pop    %edi
 263:	89 d0                	mov    %edx,%eax
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	74 1b                	je     29c <strchr+0x2c>
    if(*s == c)
 281:	38 d1                	cmp    %dl,%cl
 283:	75 0f                	jne    294 <strchr+0x24>
 285:	eb 17                	jmp    29e <strchr+0x2e>
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 290:	38 ca                	cmp    %cl,%dl
 292:	74 0a                	je     29e <strchr+0x2e>
  for(; *s; s++)
 294:	40                   	inc    %eax
 295:	0f b6 10             	movzbl (%eax),%edx
 298:	84 d2                	test   %dl,%dl
 29a:	75 f4                	jne    290 <strchr+0x20>
      return (char*)s;
  return 0;
 29c:	31 c0                	xor    %eax,%eax
}
 29e:	5d                   	pop    %ebp
 29f:	c3                   	ret    

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a5:	31 f6                	xor    %esi,%esi
{
 2a7:	53                   	push   %ebx
 2a8:	83 ec 3c             	sub    $0x3c,%esp
 2ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 2ae:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 2b1:	eb 32                	jmp    2e5 <gets+0x45>
 2b3:	90                   	nop
 2b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 2b8:	ba 01 00 00 00       	mov    $0x1,%edx
 2bd:	89 54 24 08          	mov    %edx,0x8(%esp)
 2c1:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2cc:	e8 2f 01 00 00       	call   400 <read>
    if(cc < 1)
 2d1:	85 c0                	test   %eax,%eax
 2d3:	7e 19                	jle    2ee <gets+0x4e>
      break;
    buf[i++] = c;
 2d5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d9:	43                   	inc    %ebx
 2da:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 2dd:	3c 0a                	cmp    $0xa,%al
 2df:	74 1f                	je     300 <gets+0x60>
 2e1:	3c 0d                	cmp    $0xd,%al
 2e3:	74 1b                	je     300 <gets+0x60>
  for(i=0; i+1 < max; ){
 2e5:	46                   	inc    %esi
 2e6:	3b 75 0c             	cmp    0xc(%ebp),%esi
 2e9:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 2ec:	7c ca                	jl     2b8 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 2ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 2f1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	83 c4 3c             	add    $0x3c,%esp
 2fa:	5b                   	pop    %ebx
 2fb:	5e                   	pop    %esi
 2fc:	5f                   	pop    %edi
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    
 2ff:	90                   	nop
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	01 c6                	add    %eax,%esi
 305:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 308:	eb e4                	jmp    2ee <gets+0x4e>
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 311:	31 c0                	xor    %eax,%eax
{
 313:	89 e5                	mov    %esp,%ebp
 315:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 318:	89 44 24 04          	mov    %eax,0x4(%esp)
 31c:	8b 45 08             	mov    0x8(%ebp),%eax
{
 31f:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 322:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 325:	89 04 24             	mov    %eax,(%esp)
 328:	e8 fb 00 00 00       	call   428 <open>
  if(fd < 0)
 32d:	85 c0                	test   %eax,%eax
 32f:	78 2f                	js     360 <stat+0x50>
 331:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 333:	8b 45 0c             	mov    0xc(%ebp),%eax
 336:	89 1c 24             	mov    %ebx,(%esp)
 339:	89 44 24 04          	mov    %eax,0x4(%esp)
 33d:	e8 fe 00 00 00       	call   440 <fstat>
  close(fd);
 342:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 345:	89 c6                	mov    %eax,%esi
  close(fd);
 347:	e8 c4 00 00 00       	call   410 <close>
  return r;
}
 34c:	89 f0                	mov    %esi,%eax
 34e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 351:	8b 75 fc             	mov    -0x4(%ebp),%esi
 354:	89 ec                	mov    %ebp,%esp
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 360:	be ff ff ff ff       	mov    $0xffffffff,%esi
 365:	eb e5                	jmp    34c <stat+0x3c>
 367:	89 f6                	mov    %esi,%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <atoi>:

int
atoi(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 4d 08             	mov    0x8(%ebp),%ecx
 376:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 377:	0f be 11             	movsbl (%ecx),%edx
 37a:	88 d0                	mov    %dl,%al
 37c:	2c 30                	sub    $0x30,%al
 37e:	3c 09                	cmp    $0x9,%al
  n = 0;
 380:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 385:	77 1e                	ja     3a5 <atoi+0x35>
 387:	89 f6                	mov    %esi,%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 390:	41                   	inc    %ecx
 391:	8d 04 80             	lea    (%eax,%eax,4),%eax
 394:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 398:	0f be 11             	movsbl (%ecx),%edx
 39b:	88 d3                	mov    %dl,%bl
 39d:	80 eb 30             	sub    $0x30,%bl
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 eb                	jbe    390 <atoi+0x20>
  return n;
}
 3a5:	5b                   	pop    %ebx
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    
 3a8:	90                   	nop
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	56                   	push   %esi
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	53                   	push   %ebx
 3b8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3be:	85 db                	test   %ebx,%ebx
 3c0:	7e 1a                	jle    3dc <memmove+0x2c>
 3c2:	31 d2                	xor    %edx,%edx
 3c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 3d0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3d4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3d7:	42                   	inc    %edx
  while(n-- > 0)
 3d8:	39 d3                	cmp    %edx,%ebx
 3da:	75 f4                	jne    3d0 <memmove+0x20>
  return vdst;
}
 3dc:	5b                   	pop    %ebx
 3dd:	5e                   	pop    %esi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e0:	b8 01 00 00 00       	mov    $0x1,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <exit>:
SYSCALL(exit)
 3e8:	b8 02 00 00 00       	mov    $0x2,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <wait>:
SYSCALL(wait)
 3f0:	b8 03 00 00 00       	mov    $0x3,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <pipe>:
SYSCALL(pipe)
 3f8:	b8 04 00 00 00       	mov    $0x4,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <read>:
SYSCALL(read)
 400:	b8 05 00 00 00       	mov    $0x5,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <write>:
SYSCALL(write)
 408:	b8 10 00 00 00       	mov    $0x10,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <close>:
SYSCALL(close)
 410:	b8 15 00 00 00       	mov    $0x15,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <kill>:
SYSCALL(kill)
 418:	b8 06 00 00 00       	mov    $0x6,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <exec>:
SYSCALL(exec)
 420:	b8 07 00 00 00       	mov    $0x7,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <open>:
SYSCALL(open)
 428:	b8 0f 00 00 00       	mov    $0xf,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <mknod>:
SYSCALL(mknod)
 430:	b8 11 00 00 00       	mov    $0x11,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <unlink>:
SYSCALL(unlink)
 438:	b8 12 00 00 00       	mov    $0x12,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <fstat>:
SYSCALL(fstat)
 440:	b8 08 00 00 00       	mov    $0x8,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <link>:
SYSCALL(link)
 448:	b8 13 00 00 00       	mov    $0x13,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <mkdir>:
SYSCALL(mkdir)
 450:	b8 14 00 00 00       	mov    $0x14,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <chdir>:
SYSCALL(chdir)
 458:	b8 09 00 00 00       	mov    $0x9,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <dup>:
SYSCALL(dup)
 460:	b8 0a 00 00 00       	mov    $0xa,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <getpid>:
SYSCALL(getpid)
 468:	b8 0b 00 00 00       	mov    $0xb,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <sbrk>:
SYSCALL(sbrk)
 470:	b8 0c 00 00 00       	mov    $0xc,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <sleep>:
SYSCALL(sleep)
 478:	b8 0d 00 00 00       	mov    $0xd,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <uptime>:
SYSCALL(uptime)
 480:	b8 0e 00 00 00       	mov    $0xe,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    
 488:	66 90                	xchg   %ax,%ax
 48a:	66 90                	xchg   %ax,%ax
 48c:	66 90                	xchg   %ax,%ax
 48e:	66 90                	xchg   %ax,%ax

00000490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 496:	89 d3                	mov    %edx,%ebx
 498:	c1 eb 1f             	shr    $0x1f,%ebx
{
 49b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 49e:	84 db                	test   %bl,%bl
{
 4a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4a3:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 4a5:	74 79                	je     520 <printint+0x90>
 4a7:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ab:	74 73                	je     520 <printint+0x90>
    neg = 1;
    x = -xx;
 4ad:	f7 d8                	neg    %eax
    neg = 1;
 4af:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4b6:	31 f6                	xor    %esi,%esi
 4b8:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4bb:	eb 05                	jmp    4c2 <printint+0x32>
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4c0:	89 fe                	mov    %edi,%esi
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	f7 f1                	div    %ecx
 4c6:	8d 7e 01             	lea    0x1(%esi),%edi
 4c9:	0f b6 92 e8 08 00 00 	movzbl 0x8e8(%edx),%edx
  }while((x /= base) != 0);
 4d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4d2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 4d5:	75 e9                	jne    4c0 <printint+0x30>
  if(neg)
 4d7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 4da:	85 d2                	test   %edx,%edx
 4dc:	74 08                	je     4e6 <printint+0x56>
    buf[i++] = '-';
 4de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4e3:	8d 7e 02             	lea    0x2(%esi),%edi
 4e6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 4ea:	8b 7d c0             	mov    -0x40(%ebp),%edi
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	0f b6 06             	movzbl (%esi),%eax
 4f3:	4e                   	dec    %esi
  write(fd, &c, 1);
 4f4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4f8:	89 3c 24             	mov    %edi,(%esp)
 4fb:	88 45 d7             	mov    %al,-0x29(%ebp)
 4fe:	b8 01 00 00 00       	mov    $0x1,%eax
 503:	89 44 24 08          	mov    %eax,0x8(%esp)
 507:	e8 fc fe ff ff       	call   408 <write>

  while(--i >= 0)
 50c:	39 de                	cmp    %ebx,%esi
 50e:	75 e0                	jne    4f0 <printint+0x60>
    putc(fd, buf[i]);
}
 510:	83 c4 4c             	add    $0x4c,%esp
 513:	5b                   	pop    %ebx
 514:	5e                   	pop    %esi
 515:	5f                   	pop    %edi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    
 518:	90                   	nop
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 520:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 527:	eb 8d                	jmp    4b6 <printint+0x26>
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000530 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 539:	8b 75 0c             	mov    0xc(%ebp),%esi
 53c:	0f b6 1e             	movzbl (%esi),%ebx
 53f:	84 db                	test   %bl,%bl
 541:	0f 84 d1 00 00 00    	je     618 <printf+0xe8>
  state = 0;
 547:	31 ff                	xor    %edi,%edi
 549:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 54a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 54d:	89 fa                	mov    %edi,%edx
 54f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 552:	89 45 d0             	mov    %eax,-0x30(%ebp)
 555:	eb 41                	jmp    598 <printf+0x68>
 557:	89 f6                	mov    %esi,%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 560:	83 f8 25             	cmp    $0x25,%eax
 563:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 566:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 56b:	74 1e                	je     58b <printf+0x5b>
  write(fd, &c, 1);
 56d:	b8 01 00 00 00       	mov    $0x1,%eax
 572:	89 44 24 08          	mov    %eax,0x8(%esp)
 576:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 579:	89 44 24 04          	mov    %eax,0x4(%esp)
 57d:	89 3c 24             	mov    %edi,(%esp)
 580:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 583:	e8 80 fe ff ff       	call   408 <write>
 588:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 58b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 58c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 590:	84 db                	test   %bl,%bl
 592:	0f 84 80 00 00 00    	je     618 <printf+0xe8>
    if(state == 0){
 598:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 59a:	0f be cb             	movsbl %bl,%ecx
 59d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5a0:	74 be                	je     560 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5a2:	83 fa 25             	cmp    $0x25,%edx
 5a5:	75 e4                	jne    58b <printf+0x5b>
      if(c == 'd'){
 5a7:	83 f8 64             	cmp    $0x64,%eax
 5aa:	0f 84 f0 00 00 00    	je     6a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5b0:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5b6:	83 f9 70             	cmp    $0x70,%ecx
 5b9:	74 65                	je     620 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5bb:	83 f8 73             	cmp    $0x73,%eax
 5be:	0f 84 8c 00 00 00    	je     650 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c4:	83 f8 63             	cmp    $0x63,%eax
 5c7:	0f 84 13 01 00 00    	je     6e0 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5cd:	83 f8 25             	cmp    $0x25,%eax
 5d0:	0f 84 e2 00 00 00    	je     6b8 <printf+0x188>
  write(fd, &c, 1);
 5d6:	b8 01 00 00 00       	mov    $0x1,%eax
 5db:	46                   	inc    %esi
 5dc:	89 44 24 08          	mov    %eax,0x8(%esp)
 5e0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e7:	89 3c 24             	mov    %edi,(%esp)
 5ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ee:	e8 15 fe ff ff       	call   408 <write>
 5f3:	ba 01 00 00 00       	mov    $0x1,%edx
 5f8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5fb:	89 54 24 08          	mov    %edx,0x8(%esp)
 5ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 603:	89 3c 24             	mov    %edi,(%esp)
 606:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 609:	e8 fa fd ff ff       	call   408 <write>
  for(i = 0; fmt[i]; i++){
 60e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 612:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 614:	84 db                	test   %bl,%bl
 616:	75 80                	jne    598 <printf+0x68>
    }
  }
}
 618:	83 c4 3c             	add    $0x3c,%esp
 61b:	5b                   	pop    %ebx
 61c:	5e                   	pop    %esi
 61d:	5f                   	pop    %edi
 61e:	5d                   	pop    %ebp
 61f:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 620:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 627:	b9 10 00 00 00       	mov    $0x10,%ecx
 62c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 62f:	89 f8                	mov    %edi,%eax
 631:	8b 13                	mov    (%ebx),%edx
 633:	e8 58 fe ff ff       	call   490 <printint>
        ap++;
 638:	89 d8                	mov    %ebx,%eax
      state = 0;
 63a:	31 d2                	xor    %edx,%edx
        ap++;
 63c:	83 c0 04             	add    $0x4,%eax
 63f:	89 45 d0             	mov    %eax,-0x30(%ebp)
 642:	e9 44 ff ff ff       	jmp    58b <printf+0x5b>
 647:	89 f6                	mov    %esi,%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 650:	8b 45 d0             	mov    -0x30(%ebp),%eax
 653:	8b 10                	mov    (%eax),%edx
        ap++;
 655:	83 c0 04             	add    $0x4,%eax
 658:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 65b:	85 d2                	test   %edx,%edx
 65d:	0f 84 aa 00 00 00    	je     70d <printf+0x1dd>
        while(*s != 0){
 663:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 666:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 668:	84 c0                	test   %al,%al
 66a:	74 27                	je     693 <printf+0x163>
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 670:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 673:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 678:	43                   	inc    %ebx
  write(fd, &c, 1);
 679:	89 44 24 08          	mov    %eax,0x8(%esp)
 67d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 680:	89 44 24 04          	mov    %eax,0x4(%esp)
 684:	89 3c 24             	mov    %edi,(%esp)
 687:	e8 7c fd ff ff       	call   408 <write>
        while(*s != 0){
 68c:	0f b6 03             	movzbl (%ebx),%eax
 68f:	84 c0                	test   %al,%al
 691:	75 dd                	jne    670 <printf+0x140>
      state = 0;
 693:	31 d2                	xor    %edx,%edx
 695:	e9 f1 fe ff ff       	jmp    58b <printf+0x5b>
 69a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6a7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6ac:	e9 7b ff ff ff       	jmp    62c <printf+0xfc>
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 6b8:	b9 01 00 00 00       	mov    $0x1,%ecx
 6bd:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6c0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 6c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c8:	89 3c 24             	mov    %edi,(%esp)
 6cb:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6ce:	e8 35 fd ff ff       	call   408 <write>
      state = 0;
 6d3:	31 d2                	xor    %edx,%edx
 6d5:	e9 b1 fe ff ff       	jmp    58b <printf+0x5b>
 6da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 6e0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6e3:	8b 03                	mov    (%ebx),%eax
        ap++;
 6e5:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6e8:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 6eb:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6ee:	b8 01 00 00 00       	mov    $0x1,%eax
 6f3:	89 44 24 08          	mov    %eax,0x8(%esp)
 6f7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fe:	e8 05 fd ff ff       	call   408 <write>
      state = 0;
 703:	31 d2                	xor    %edx,%edx
        ap++;
 705:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 708:	e9 7e fe ff ff       	jmp    58b <printf+0x5b>
          s = "(null)";
 70d:	bb df 08 00 00       	mov    $0x8df,%ebx
        while(*s != 0){
 712:	b0 28                	mov    $0x28,%al
 714:	e9 57 ff ff ff       	jmp    670 <printf+0x140>
 719:	66 90                	xchg   %ax,%ax
 71b:	66 90                	xchg   %ax,%ax
 71d:	66 90                	xchg   %ax,%ax
 71f:	90                   	nop

00000720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	a1 c0 0b 00 00       	mov    0xbc0,%eax
{
 726:	89 e5                	mov    %esp,%ebp
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	53                   	push   %ebx
 72b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 72e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 731:	eb 0d                	jmp    740 <free+0x20>
 733:	90                   	nop
 734:	90                   	nop
 735:	90                   	nop
 736:	90                   	nop
 737:	90                   	nop
 738:	90                   	nop
 739:	90                   	nop
 73a:	90                   	nop
 73b:	90                   	nop
 73c:	90                   	nop
 73d:	90                   	nop
 73e:	90                   	nop
 73f:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 740:	39 c8                	cmp    %ecx,%eax
 742:	8b 10                	mov    (%eax),%edx
 744:	73 32                	jae    778 <free+0x58>
 746:	39 d1                	cmp    %edx,%ecx
 748:	72 04                	jb     74e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74a:	39 d0                	cmp    %edx,%eax
 74c:	72 32                	jb     780 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 74e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 751:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 754:	39 fa                	cmp    %edi,%edx
 756:	74 30                	je     788 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 758:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75b:	8b 50 04             	mov    0x4(%eax),%edx
 75e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 761:	39 f1                	cmp    %esi,%ecx
 763:	74 3c                	je     7a1 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 765:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 767:	5b                   	pop    %ebx
  freep = p;
 768:	a3 c0 0b 00 00       	mov    %eax,0xbc0
}
 76d:	5e                   	pop    %esi
 76e:	5f                   	pop    %edi
 76f:	5d                   	pop    %ebp
 770:	c3                   	ret    
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 778:	39 d0                	cmp    %edx,%eax
 77a:	72 04                	jb     780 <free+0x60>
 77c:	39 d1                	cmp    %edx,%ecx
 77e:	72 ce                	jb     74e <free+0x2e>
{
 780:	89 d0                	mov    %edx,%eax
 782:	eb bc                	jmp    740 <free+0x20>
 784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 788:	8b 7a 04             	mov    0x4(%edx),%edi
 78b:	01 fe                	add    %edi,%esi
 78d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 790:	8b 10                	mov    (%eax),%edx
 792:	8b 12                	mov    (%edx),%edx
 794:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 797:	8b 50 04             	mov    0x4(%eax),%edx
 79a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 79d:	39 f1                	cmp    %esi,%ecx
 79f:	75 c4                	jne    765 <free+0x45>
    p->s.size += bp->s.size;
 7a1:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 7a4:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    p->s.size += bp->s.size;
 7a9:	01 ca                	add    %ecx,%edx
 7ab:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ae:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7b1:	89 10                	mov    %edx,(%eax)
}
 7b3:	5b                   	pop    %ebx
 7b4:	5e                   	pop    %esi
 7b5:	5f                   	pop    %edi
 7b6:	5d                   	pop    %ebp
 7b7:	c3                   	ret    
 7b8:	90                   	nop
 7b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 15 c0 0b 00 00    	mov    0xbc0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 78 07             	lea    0x7(%eax),%edi
 7d5:	c1 ef 03             	shr    $0x3,%edi
 7d8:	47                   	inc    %edi
  if((prevp = freep) == 0){
 7d9:	85 d2                	test   %edx,%edx
 7db:	0f 84 8f 00 00 00    	je     870 <malloc+0xb0>
 7e1:	8b 02                	mov    (%edx),%eax
 7e3:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7e6:	39 cf                	cmp    %ecx,%edi
 7e8:	76 66                	jbe    850 <malloc+0x90>
 7ea:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7f0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7f5:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7f8:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7ff:	eb 10                	jmp    811 <malloc+0x51>
 801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 808:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 80a:	8b 48 04             	mov    0x4(%eax),%ecx
 80d:	39 f9                	cmp    %edi,%ecx
 80f:	73 3f                	jae    850 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 811:	39 05 c0 0b 00 00    	cmp    %eax,0xbc0
 817:	89 c2                	mov    %eax,%edx
 819:	75 ed                	jne    808 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 81b:	89 34 24             	mov    %esi,(%esp)
 81e:	e8 4d fc ff ff       	call   470 <sbrk>
  if(p == (char*)-1)
 823:	83 f8 ff             	cmp    $0xffffffff,%eax
 826:	74 18                	je     840 <malloc+0x80>
  hp->s.size = nu;
 828:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 82b:	83 c0 08             	add    $0x8,%eax
 82e:	89 04 24             	mov    %eax,(%esp)
 831:	e8 ea fe ff ff       	call   720 <free>
  return freep;
 836:	8b 15 c0 0b 00 00    	mov    0xbc0,%edx
      if((p = morecore(nunits)) == 0)
 83c:	85 d2                	test   %edx,%edx
 83e:	75 c8                	jne    808 <malloc+0x48>
        return 0;
  }
}
 840:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 843:	31 c0                	xor    %eax,%eax
}
 845:	5b                   	pop    %ebx
 846:	5e                   	pop    %esi
 847:	5f                   	pop    %edi
 848:	5d                   	pop    %ebp
 849:	c3                   	ret    
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 850:	39 cf                	cmp    %ecx,%edi
 852:	74 4c                	je     8a0 <malloc+0xe0>
        p->s.size -= nunits;
 854:	29 f9                	sub    %edi,%ecx
 856:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 859:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 85c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 85f:	89 15 c0 0b 00 00    	mov    %edx,0xbc0
}
 865:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 868:	83 c0 08             	add    $0x8,%eax
}
 86b:	5b                   	pop    %ebx
 86c:	5e                   	pop    %esi
 86d:	5f                   	pop    %edi
 86e:	5d                   	pop    %ebp
 86f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 870:	b8 c4 0b 00 00       	mov    $0xbc4,%eax
 875:	ba c4 0b 00 00       	mov    $0xbc4,%edx
    base.s.size = 0;
 87a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 87c:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    base.s.size = 0;
 881:	b8 c4 0b 00 00       	mov    $0xbc4,%eax
    base.s.ptr = freep = prevp = &base;
 886:	89 15 c4 0b 00 00    	mov    %edx,0xbc4
    base.s.size = 0;
 88c:	89 0d c8 0b 00 00    	mov    %ecx,0xbc8
 892:	e9 53 ff ff ff       	jmp    7ea <malloc+0x2a>
 897:	89 f6                	mov    %esi,%esi
 899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 8a0:	8b 08                	mov    (%eax),%ecx
 8a2:	89 0a                	mov    %ecx,(%edx)
 8a4:	eb b9                	jmp    85f <malloc+0x9f>
