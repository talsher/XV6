
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
       9:	eb 0a                	jmp    15 <main+0x15>
       b:	90                   	nop
       c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      10:	83 f8 02             	cmp    $0x2,%eax
      13:	7f 78                	jg     8d <main+0x8d>
  while((fd = open("console", O_RDWR)) >= 0){
      15:	ba 02 00 00 00       	mov    $0x2,%edx
      1a:	89 54 24 04          	mov    %edx,0x4(%esp)
      1e:	c7 04 24 9f 15 00 00 	movl   $0x159f,(%esp)
      25:	e8 4e 10 00 00       	call   1078 <open>
      2a:	85 c0                	test   %eax,%eax
      2c:	79 e2                	jns    10 <main+0x10>
      2e:	eb 1c                	jmp    4c <main+0x4c>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      30:	80 3d e2 1b 00 00 20 	cmpb   $0x20,0x1be2
      37:	74 7e                	je     b7 <main+0xb7>
int
fork1(void)
{
  int pid;

  pid = fork();
      39:	e8 f2 0f 00 00       	call   1030 <fork>
  if(pid == -1)
      3e:	83 f8 ff             	cmp    $0xffffffff,%eax
      41:	74 3e                	je     81 <main+0x81>
    if(fork1() == 0)
      43:	85 c0                	test   %eax,%eax
      45:	74 5c                	je     a3 <main+0xa3>
    wait();
      47:	e8 f4 0f 00 00       	call   1040 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      4c:	b8 64 00 00 00       	mov    $0x64,%eax
      51:	89 44 24 04          	mov    %eax,0x4(%esp)
      55:	c7 04 24 e0 1b 00 00 	movl   $0x1be0,(%esp)
      5c:	e8 ff 00 00 00       	call   160 <getcmd>
      61:	85 c0                	test   %eax,%eax
      63:	78 32                	js     97 <main+0x97>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      65:	80 3d e0 1b 00 00 63 	cmpb   $0x63,0x1be0
      6c:	75 cb                	jne    39 <main+0x39>
      6e:	80 3d e1 1b 00 00 64 	cmpb   $0x64,0x1be1
      75:	74 b9                	je     30 <main+0x30>
  pid = fork();
      77:	e8 b4 0f 00 00       	call   1030 <fork>
  if(pid == -1)
      7c:	83 f8 ff             	cmp    $0xffffffff,%eax
      7f:	75 c2                	jne    43 <main+0x43>
    panic("fork");
      81:	c7 04 24 28 15 00 00 	movl   $0x1528,(%esp)
      88:	e8 33 01 00 00       	call   1c0 <panic>
      close(fd);
      8d:	89 04 24             	mov    %eax,(%esp)
      90:	e8 cb 0f 00 00       	call   1060 <close>
      break;
      95:	eb b5                	jmp    4c <main+0x4c>
  exit(0);
      97:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      9e:	e8 95 0f 00 00       	call   1038 <exit>
      runcmd(parsecmd(buf));
      a3:	c7 04 24 e0 1b 00 00 	movl   $0x1be0,(%esp)
      aa:	e8 e1 0c 00 00       	call   d90 <parsecmd>
      af:	89 04 24             	mov    %eax,(%esp)
      b2:	e8 39 01 00 00       	call   1f0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      b7:	c7 04 24 e0 1b 00 00 	movl   $0x1be0,(%esp)
      be:	e8 ad 0d 00 00       	call   e70 <strlen>
      if(chdir(buf+3) < 0)
      c3:	c7 04 24 e3 1b 00 00 	movl   $0x1be3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      ca:	c6 80 df 1b 00 00 00 	movb   $0x0,0x1bdf(%eax)
      if(chdir(buf+3) < 0)
      d1:	e8 d2 0f 00 00       	call   10a8 <chdir>
      d6:	85 c0                	test   %eax,%eax
      d8:	0f 89 6e ff ff ff    	jns    4c <main+0x4c>
        printf(2, "cannot cd %s\n", buf+3);
      de:	c7 44 24 08 e3 1b 00 	movl   $0x1be3,0x8(%esp)
      e5:	00 
      e6:	c7 44 24 04 a7 15 00 	movl   $0x15a7,0x4(%esp)
      ed:	00 
      ee:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      f5:	e8 86 10 00 00       	call   1180 <printf>
      fa:	e9 4d ff ff ff       	jmp    4c <main+0x4c>
      ff:	90                   	nop

00000100 <strcat>:
void strcat(char* buffer,char* str1,char* str2){
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	8b 45 08             	mov    0x8(%ebp),%eax
     106:	53                   	push   %ebx
     107:	8b 4d 10             	mov    0x10(%ebp),%ecx
     10a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*tmp != '\0'){
     10d:	80 38 00             	cmpb   $0x0,(%eax)
     110:	74 22                	je     134 <strcat+0x34>
     112:	89 c2                	mov    %eax,%edx
     114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     11a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *tmp = '\0';
     120:	c6 02 00             	movb   $0x0,(%edx)
    tmp++;
     123:	42                   	inc    %edx
  while(*tmp != '\0'){
     124:	80 3a 00             	cmpb   $0x0,(%edx)
     127:	75 f7                	jne    120 <strcat+0x20>
  while(*str1 != '\0'){
     129:	0f b6 13             	movzbl (%ebx),%edx
     12c:	84 d2                	test   %dl,%dl
     12e:	74 24                	je     154 <strcat+0x54>
    *tmp = *str1;
     130:	88 10                	mov    %dl,(%eax)
    str1++;
     132:	43                   	inc    %ebx
    tmp++;
     133:	40                   	inc    %eax
  while(*str1 != '\0'){
     134:	0f b6 13             	movzbl (%ebx),%edx
     137:	84 d2                	test   %dl,%dl
     139:	75 f5                	jne    130 <strcat+0x30>
  while(*str2 != '\0'){
     13b:	0f b6 11             	movzbl (%ecx),%edx
     13e:	84 d2                	test   %dl,%dl
     140:	74 19                	je     15b <strcat+0x5b>
     142:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *tmp = *str2;
     150:	88 10                	mov    %dl,(%eax)
    str2++;
     152:	41                   	inc    %ecx
    tmp++;
     153:	40                   	inc    %eax
  while(*str2 != '\0'){
     154:	0f b6 11             	movzbl (%ecx),%edx
     157:	84 d2                	test   %dl,%dl
     159:	75 f5                	jne    150 <strcat+0x50>
}
     15b:	5b                   	pop    %ebx
     15c:	5d                   	pop    %ebp
     15d:	c3                   	ret    
     15e:	66 90                	xchg   %ax,%ax

00000160 <getcmd>:
{
     160:	55                   	push   %ebp
  printf(2, "$ ");
     161:	b8 f8 14 00 00       	mov    $0x14f8,%eax
{
     166:	89 e5                	mov    %esp,%ebp
     168:	83 ec 18             	sub    $0x18,%esp
     16b:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     16e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     171:	89 75 fc             	mov    %esi,-0x4(%ebp)
     174:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     177:	89 44 24 04          	mov    %eax,0x4(%esp)
     17b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     182:	e8 f9 0f 00 00       	call   1180 <printf>
  memset(buf, 0, nbuf);
     187:	31 d2                	xor    %edx,%edx
     189:	89 74 24 08          	mov    %esi,0x8(%esp)
     18d:	89 54 24 04          	mov    %edx,0x4(%esp)
     191:	89 1c 24             	mov    %ebx,(%esp)
     194:	e8 07 0d 00 00       	call   ea0 <memset>
  gets(buf, nbuf);
     199:	89 74 24 04          	mov    %esi,0x4(%esp)
     19d:	89 1c 24             	mov    %ebx,(%esp)
     1a0:	e8 4b 0d 00 00       	call   ef0 <gets>
  if(buf[0] == 0) // EOF
     1a5:	31 c0                	xor    %eax,%eax
}
     1a7:	8b 75 fc             	mov    -0x4(%ebp),%esi
  if(buf[0] == 0) // EOF
     1aa:	80 3b 00             	cmpb   $0x0,(%ebx)
}
     1ad:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  if(buf[0] == 0) // EOF
     1b0:	0f 94 c0             	sete   %al
}
     1b3:	89 ec                	mov    %ebp,%esp
  if(buf[0] == 0) // EOF
     1b5:	f7 d8                	neg    %eax
}
     1b7:	5d                   	pop    %ebp
     1b8:	c3                   	ret    
     1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <panic>:
{
     1c0:	55                   	push   %ebp
     1c1:	89 e5                	mov    %esp,%ebp
     1c3:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     1c6:	8b 45 08             	mov    0x8(%ebp),%eax
     1c9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1d0:	89 44 24 08          	mov    %eax,0x8(%esp)
     1d4:	b8 9b 15 00 00       	mov    $0x159b,%eax
     1d9:	89 44 24 04          	mov    %eax,0x4(%esp)
     1dd:	e8 9e 0f 00 00       	call   1180 <printf>
  exit(0);
     1e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1e9:	e8 4a 0e 00 00       	call   1038 <exit>
     1ee:	66 90                	xchg   %ax,%ax

000001f0 <runcmd>:
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	57                   	push   %edi
     1f4:	56                   	push   %esi
     1f5:	53                   	push   %ebx
     1f6:	81 ec 3c 08 00 00    	sub    $0x83c,%esp
     1fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ff:	85 db                	test   %ebx,%ebx
     201:	74 5d                	je     260 <runcmd+0x70>
  switch(cmd->type){
     203:	83 3b 05             	cmpl   $0x5,(%ebx)
     206:	0f 87 e4 01 00 00    	ja     3f0 <runcmd+0x200>
     20c:	8b 03                	mov    (%ebx),%eax
     20e:	ff 24 85 b8 15 00 00 	jmp    *0x15b8(,%eax,4)
    close(rcmd->fd);
     215:	8b 43 14             	mov    0x14(%ebx),%eax
     218:	89 04 24             	mov    %eax,(%esp)
     21b:	e8 40 0e 00 00       	call   1060 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     220:	8b 43 10             	mov    0x10(%ebx),%eax
     223:	89 44 24 04          	mov    %eax,0x4(%esp)
     227:	8b 43 08             	mov    0x8(%ebx),%eax
     22a:	89 04 24             	mov    %eax,(%esp)
     22d:	e8 46 0e 00 00       	call   1078 <open>
     232:	85 c0                	test   %eax,%eax
     234:	79 48                	jns    27e <runcmd+0x8e>
      printf(2, "open %s failed\n", rcmd->file);
     236:	8b 43 08             	mov    0x8(%ebx),%eax
     239:	c7 44 24 04 18 15 00 	movl   $0x1518,0x4(%esp)
     240:	00 
     241:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     248:	89 44 24 08          	mov    %eax,0x8(%esp)
     24c:	e8 2f 0f 00 00       	call   1180 <printf>
     251:	eb 0d                	jmp    260 <runcmd+0x70>
     253:	90                   	nop
     254:	90                   	nop
     255:	90                   	nop
     256:	90                   	nop
     257:	90                   	nop
     258:	90                   	nop
     259:	90                   	nop
     25a:	90                   	nop
     25b:	90                   	nop
     25c:	90                   	nop
     25d:	90                   	nop
     25e:	90                   	nop
     25f:	90                   	nop
      exit(0);
     260:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     267:	e8 cc 0d 00 00       	call   1038 <exit>
  pid = fork();
     26c:	e8 bf 0d 00 00       	call   1030 <fork>
  if(pid == -1)
     271:	83 f8 ff             	cmp    $0xffffffff,%eax
     274:	0f 84 82 01 00 00    	je     3fc <runcmd+0x20c>
    if(fork1() == 0)
     27a:	85 c0                	test   %eax,%eax
     27c:	75 e2                	jne    260 <runcmd+0x70>
      runcmd(bcmd->cmd);
     27e:	8b 43 04             	mov    0x4(%ebx),%eax
     281:	89 04 24             	mov    %eax,(%esp)
     284:	e8 67 ff ff ff       	call   1f0 <runcmd>
    if(ecmd->argv[0] == 0)
     289:	8b 43 04             	mov    0x4(%ebx),%eax
     28c:	85 c0                	test   %eax,%eax
     28e:	74 d0                	je     260 <runcmd+0x70>
    if((fd = open(ecmd->argv[0], O_RDONLY)) >= 0){
     290:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     297:	00 
     298:	89 04 24             	mov    %eax,(%esp)
     29b:	e8 d8 0d 00 00       	call   1078 <open>
     2a0:	85 c0                	test   %eax,%eax
     2a2:	89 c2                	mov    %eax,%edx
     2a4:	78 26                	js     2cc <runcmd+0xdc>
          close(fd);
     2a6:	89 04 24             	mov    %eax,(%esp)
     2a9:	89 85 d4 f7 ff ff    	mov    %eax,-0x82c(%ebp)
     2af:	e8 ac 0d 00 00       	call   1060 <close>
          exec(ecmd->argv[0], ecmd->argv);
     2b4:	8d 43 04             	lea    0x4(%ebx),%eax
     2b7:	89 44 24 04          	mov    %eax,0x4(%esp)
     2bb:	8b 43 04             	mov    0x4(%ebx),%eax
     2be:	89 04 24             	mov    %eax,(%esp)
     2c1:	e8 aa 0d 00 00       	call   1070 <exec>
     2c6:	8b 95 d4 f7 ff ff    	mov    -0x82c(%ebp),%edx
    if((pathFD = open("/path", O_RDONLY)) < 0){
     2cc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2d3:	00 
     2d4:	c7 04 24 02 15 00 00 	movl   $0x1502,(%esp)
     2db:	89 95 d4 f7 ff ff    	mov    %edx,-0x82c(%ebp)
     2e1:	e8 92 0d 00 00       	call   1078 <open>
     2e6:	8b 95 d4 f7 ff ff    	mov    -0x82c(%ebp),%edx
     2ec:	85 c0                	test   %eax,%eax
     2ee:	89 c6                	mov    %eax,%esi
     2f0:	0f 88 1a 01 00 00    	js     410 <runcmd+0x220>
    if((readCount=read(pathFD, buffer, 1024)) < 0){
     2f6:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
     2fc:	c7 44 24 08 00 04 00 	movl   $0x400,0x8(%esp)
     303:	00 
     304:	89 44 24 04          	mov    %eax,0x4(%esp)
     308:	89 34 24             	mov    %esi,(%esp)
     30b:	89 95 d4 f7 ff ff    	mov    %edx,-0x82c(%ebp)
     311:	e8 3a 0d 00 00       	call   1050 <read>
     316:	85 c0                	test   %eax,%eax
     318:	0f 88 ea 00 00 00    	js     408 <runcmd+0x218>
     31e:	8b 95 d4 f7 ff ff    	mov    -0x82c(%ebp),%edx
          exec(tmpBuffer, ecmd->argv);
     324:	8d 4b 04             	lea    0x4(%ebx),%ecx
    if((readCount=read(pathFD, buffer, 1024)) < 0){
     327:	8d b5 e8 f7 ff ff    	lea    -0x818(%ebp),%esi
     32d:	89 5d 08             	mov    %ebx,0x8(%ebp)
    currPath = buffer;
     330:	89 f7                	mov    %esi,%edi
     332:	89 c3                	mov    %eax,%ebx
          exec(tmpBuffer, ecmd->argv);
     334:	89 8d d0 f7 ff ff    	mov    %ecx,-0x830(%ebp)
    for(int i = 0; i < readCount; i++){
     33a:	89 f0                	mov    %esi,%eax
     33c:	8d 8d e8 f7 ff ff    	lea    -0x818(%ebp),%ecx
     342:	29 c8                	sub    %ecx,%eax
     344:	39 c3                	cmp    %eax,%ebx
     346:	0f 8e c2 01 00 00    	jle    50e <runcmd+0x31e>
      if(buffer[i] == ':'){
     34c:	80 3e 3a             	cmpb   $0x3a,(%esi)
     34f:	8d 46 01             	lea    0x1(%esi),%eax
     352:	0f 84 d8 00 00 00    	je     430 <runcmd+0x240>
     358:	89 c6                	mov    %eax,%esi
     35a:	eb de                	jmp    33a <runcmd+0x14a>
    if(pipe(p) < 0)
     35c:	8d 85 e0 f7 ff ff    	lea    -0x820(%ebp),%eax
     362:	89 04 24             	mov    %eax,(%esp)
     365:	e8 de 0c 00 00       	call   1048 <pipe>
     36a:	85 c0                	test   %eax,%eax
     36c:	0f 88 90 01 00 00    	js     502 <runcmd+0x312>
  pid = fork();
     372:	e8 b9 0c 00 00       	call   1030 <fork>
  if(pid == -1)
     377:	83 f8 ff             	cmp    $0xffffffff,%eax
     37a:	0f 84 7c 00 00 00    	je     3fc <runcmd+0x20c>
    if(fork1() == 0){
     380:	85 c0                	test   %eax,%eax
     382:	0f 84 91 01 00 00    	je     519 <runcmd+0x329>
  pid = fork();
     388:	e8 a3 0c 00 00       	call   1030 <fork>
  if(pid == -1)
     38d:	83 f8 ff             	cmp    $0xffffffff,%eax
     390:	74 6a                	je     3fc <runcmd+0x20c>
    if(fork1() == 0){
     392:	85 c0                	test   %eax,%eax
     394:	0f 84 27 01 00 00    	je     4c1 <runcmd+0x2d1>
    close(p[0]);
     39a:	8b 85 e0 f7 ff ff    	mov    -0x820(%ebp),%eax
     3a0:	89 04 24             	mov    %eax,(%esp)
     3a3:	e8 b8 0c 00 00       	call   1060 <close>
    close(p[1]);
     3a8:	8b 85 e4 f7 ff ff    	mov    -0x81c(%ebp),%eax
     3ae:	89 04 24             	mov    %eax,(%esp)
     3b1:	e8 aa 0c 00 00       	call   1060 <close>
    wait();
     3b6:	e8 85 0c 00 00       	call   1040 <wait>
    wait();
     3bb:	e8 80 0c 00 00       	call   1040 <wait>
    break;
     3c0:	e9 9b fe ff ff       	jmp    260 <runcmd+0x70>
  pid = fork();
     3c5:	e8 66 0c 00 00       	call   1030 <fork>
  if(pid == -1)
     3ca:	83 f8 ff             	cmp    $0xffffffff,%eax
     3cd:	8d 76 00             	lea    0x0(%esi),%esi
     3d0:	74 2a                	je     3fc <runcmd+0x20c>
    if(fork1() == 0)
     3d2:	85 c0                	test   %eax,%eax
     3d4:	0f 84 a4 fe ff ff    	je     27e <runcmd+0x8e>
     3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    wait();
     3e0:	e8 5b 0c 00 00       	call   1040 <wait>
    runcmd(lcmd->right);
     3e5:	8b 43 08             	mov    0x8(%ebx),%eax
     3e8:	89 04 24             	mov    %eax,(%esp)
     3eb:	e8 00 fe ff ff       	call   1f0 <runcmd>
    panic("runcmd");
     3f0:	c7 04 24 fb 14 00 00 	movl   $0x14fb,(%esp)
     3f7:	e8 c4 fd ff ff       	call   1c0 <panic>
    panic("fork");
     3fc:	c7 04 24 28 15 00 00 	movl   $0x1528,(%esp)
     403:	e8 b8 fd ff ff       	call   1c0 <panic>
      close(pathFD);
     408:	89 34 24             	mov    %esi,(%esp)
    close(fd);
     40b:	e8 50 0c 00 00       	call   1060 <close>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     410:	8b 43 04             	mov    0x4(%ebx),%eax
     413:	c7 44 24 04 08 15 00 	movl   $0x1508,0x4(%esp)
     41a:	00 
     41b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     422:	89 44 24 08          	mov    %eax,0x8(%esp)
     426:	e8 55 0d 00 00       	call   1180 <printf>
    break;
     42b:	e9 30 fe ff ff       	jmp    260 <runcmd+0x70>
        strcat(tmpBuffer, currPath, ecmd->argv[0]);
     430:	8b 45 08             	mov    0x8(%ebp),%eax
        buffer[i] = '\0';
     433:	c6 06 00             	movb   $0x0,(%esi)
        strcat(tmpBuffer, currPath, ecmd->argv[0]);
     436:	8b 48 04             	mov    0x4(%eax),%ecx
  char* tmp = buffer;
     439:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     43f:	eb 04                	jmp    445 <runcmd+0x255>
    *tmp = '\0';
     441:	c6 00 00             	movb   $0x0,(%eax)
    tmp++;
     444:	40                   	inc    %eax
  while(*tmp != '\0'){
     445:	80 38 00             	cmpb   $0x0,(%eax)
     448:	75 f7                	jne    441 <runcmd+0x251>
  tmp = buffer;
     44a:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     450:	eb 04                	jmp    456 <runcmd+0x266>
    *tmp = *str1;
     452:	88 10                	mov    %dl,(%eax)
    str1++;
     454:	47                   	inc    %edi
    tmp++;
     455:	40                   	inc    %eax
  while(*str1 != '\0'){
     456:	0f b6 17             	movzbl (%edi),%edx
     459:	84 d2                	test   %dl,%dl
     45b:	75 f5                	jne    452 <runcmd+0x262>
     45d:	31 ff                	xor    %edi,%edi
     45f:	eb 04                	jmp    465 <runcmd+0x275>
    *tmp = *str2;
     461:	88 14 38             	mov    %dl,(%eax,%edi,1)
     464:	47                   	inc    %edi
  while(*str2 != '\0'){
     465:	0f b6 14 39          	movzbl (%ecx,%edi,1),%edx
     469:	84 d2                	test   %dl,%dl
     46b:	75 f4                	jne    461 <runcmd+0x271>
        if((fd = open(tmpBuffer, O_RDONLY)) >= 0){
     46d:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     473:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     47a:	00 
     47b:	89 04 24             	mov    %eax,(%esp)
     47e:	e8 f5 0b 00 00       	call   1078 <open>
     483:	85 c0                	test   %eax,%eax
     485:	89 c2                	mov    %eax,%edx
     487:	78 2c                	js     4b5 <runcmd+0x2c5>
          close(fd);
     489:	89 04 24             	mov    %eax,(%esp)
     48c:	89 85 d4 f7 ff ff    	mov    %eax,-0x82c(%ebp)
     492:	e8 c9 0b 00 00       	call   1060 <close>
          exec(tmpBuffer, ecmd->argv);
     497:	8b 85 d0 f7 ff ff    	mov    -0x830(%ebp),%eax
     49d:	89 44 24 04          	mov    %eax,0x4(%esp)
     4a1:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     4a7:	89 04 24             	mov    %eax,(%esp)
     4aa:	e8 c1 0b 00 00       	call   1070 <exec>
     4af:	8b 95 d4 f7 ff ff    	mov    -0x82c(%ebp),%edx
     4b5:	8d 46 01             	lea    0x1(%esi),%eax
     4b8:	89 c7                	mov    %eax,%edi
     4ba:	89 c6                	mov    %eax,%esi
     4bc:	e9 79 fe ff ff       	jmp    33a <runcmd+0x14a>
      close(0);
     4c1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     4c8:	e8 93 0b 00 00       	call   1060 <close>
      dup(p[0]);
     4cd:	8b 85 e0 f7 ff ff    	mov    -0x820(%ebp),%eax
     4d3:	89 04 24             	mov    %eax,(%esp)
     4d6:	e8 d5 0b 00 00       	call   10b0 <dup>
      close(p[0]);
     4db:	8b 85 e0 f7 ff ff    	mov    -0x820(%ebp),%eax
     4e1:	89 04 24             	mov    %eax,(%esp)
     4e4:	e8 77 0b 00 00       	call   1060 <close>
      close(p[1]);
     4e9:	8b 85 e4 f7 ff ff    	mov    -0x81c(%ebp),%eax
     4ef:	89 04 24             	mov    %eax,(%esp)
     4f2:	e8 69 0b 00 00       	call   1060 <close>
      runcmd(pcmd->right);
     4f7:	8b 43 08             	mov    0x8(%ebx),%eax
     4fa:	89 04 24             	mov    %eax,(%esp)
     4fd:	e8 ee fc ff ff       	call   1f0 <runcmd>
      panic("pipe");
     502:	c7 04 24 2d 15 00 00 	movl   $0x152d,(%esp)
     509:	e8 b2 fc ff ff       	call   1c0 <panic>
     50e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    close(fd);
     511:	89 14 24             	mov    %edx,(%esp)
     514:	e9 f2 fe ff ff       	jmp    40b <runcmd+0x21b>
      close(1);
     519:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     520:	e8 3b 0b 00 00       	call   1060 <close>
      dup(p[1]);
     525:	8b 85 e4 f7 ff ff    	mov    -0x81c(%ebp),%eax
     52b:	89 04 24             	mov    %eax,(%esp)
     52e:	e8 7d 0b 00 00       	call   10b0 <dup>
      close(p[0]);
     533:	8b 85 e0 f7 ff ff    	mov    -0x820(%ebp),%eax
     539:	89 04 24             	mov    %eax,(%esp)
     53c:	e8 1f 0b 00 00       	call   1060 <close>
      close(p[1]);
     541:	8b 85 e4 f7 ff ff    	mov    -0x81c(%ebp),%eax
     547:	89 04 24             	mov    %eax,(%esp)
     54a:	e8 11 0b 00 00       	call   1060 <close>
      runcmd(pcmd->left);
     54f:	8b 43 04             	mov    0x4(%ebx),%eax
     552:	89 04 24             	mov    %eax,(%esp)
     555:	e8 96 fc ff ff       	call   1f0 <runcmd>
     55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000560 <fork1>:
{
     560:	55                   	push   %ebp
     561:	89 e5                	mov    %esp,%ebp
     563:	83 ec 18             	sub    $0x18,%esp
  pid = fork();
     566:	e8 c5 0a 00 00       	call   1030 <fork>
  if(pid == -1)
     56b:	83 f8 ff             	cmp    $0xffffffff,%eax
     56e:	74 02                	je     572 <fork1+0x12>
  return pid;
}
     570:	c9                   	leave  
     571:	c3                   	ret    
    panic("fork");
     572:	c7 04 24 28 15 00 00 	movl   $0x1528,(%esp)
     579:	e8 42 fc ff ff       	call   1c0 <panic>
     57e:	66 90                	xchg   %ax,%ax

00000580 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     580:	55                   	push   %ebp
     581:	89 e5                	mov    %esp,%ebp
     583:	53                   	push   %ebx
     584:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     587:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     58e:	e8 7d 0e 00 00       	call   1410 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     593:	31 d2                	xor    %edx,%edx
     595:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     599:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     59b:	b8 54 00 00 00       	mov    $0x54,%eax
     5a0:	89 1c 24             	mov    %ebx,(%esp)
     5a3:	89 44 24 08          	mov    %eax,0x8(%esp)
     5a7:	e8 f4 08 00 00       	call   ea0 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     5ac:	89 d8                	mov    %ebx,%eax
  cmd->type = EXEC;
     5ae:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
     5b4:	83 c4 14             	add    $0x14,%esp
     5b7:	5b                   	pop    %ebx
     5b8:	5d                   	pop    %ebp
     5b9:	c3                   	ret    
     5ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005c0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	53                   	push   %ebx
     5c4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5c7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     5ce:	e8 3d 0e 00 00       	call   1410 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5d3:	31 d2                	xor    %edx,%edx
     5d5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     5d9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5db:	b8 18 00 00 00       	mov    $0x18,%eax
     5e0:	89 1c 24             	mov    %ebx,(%esp)
     5e3:	89 44 24 08          	mov    %eax,0x8(%esp)
     5e7:	e8 b4 08 00 00       	call   ea0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     5ec:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     5ef:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     5f5:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     5f8:	8b 45 0c             	mov    0xc(%ebp),%eax
     5fb:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     5fe:	8b 45 10             	mov    0x10(%ebp),%eax
     601:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     604:	8b 45 14             	mov    0x14(%ebp),%eax
     607:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     60a:	8b 45 18             	mov    0x18(%ebp),%eax
     60d:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     610:	83 c4 14             	add    $0x14,%esp
     613:	89 d8                	mov    %ebx,%eax
     615:	5b                   	pop    %ebx
     616:	5d                   	pop    %ebp
     617:	c3                   	ret    
     618:	90                   	nop
     619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000620 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	53                   	push   %ebx
     624:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     627:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     62e:	e8 dd 0d 00 00       	call   1410 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     633:	31 d2                	xor    %edx,%edx
     635:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     639:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     63b:	b8 0c 00 00 00       	mov    $0xc,%eax
     640:	89 1c 24             	mov    %ebx,(%esp)
     643:	89 44 24 08          	mov    %eax,0x8(%esp)
     647:	e8 54 08 00 00       	call   ea0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     64c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     64f:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     655:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     658:	8b 45 0c             	mov    0xc(%ebp),%eax
     65b:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     65e:	83 c4 14             	add    $0x14,%esp
     661:	89 d8                	mov    %ebx,%eax
     663:	5b                   	pop    %ebx
     664:	5d                   	pop    %ebp
     665:	c3                   	ret    
     666:	8d 76 00             	lea    0x0(%esi),%esi
     669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	53                   	push   %ebx
     674:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     677:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     67e:	e8 8d 0d 00 00       	call   1410 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     683:	31 d2                	xor    %edx,%edx
     685:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     689:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     68b:	b8 0c 00 00 00       	mov    $0xc,%eax
     690:	89 1c 24             	mov    %ebx,(%esp)
     693:	89 44 24 08          	mov    %eax,0x8(%esp)
     697:	e8 04 08 00 00       	call   ea0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     69c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     69f:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     6a5:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     6a8:	8b 45 0c             	mov    0xc(%ebp),%eax
     6ab:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     6ae:	83 c4 14             	add    $0x14,%esp
     6b1:	89 d8                	mov    %ebx,%eax
     6b3:	5b                   	pop    %ebx
     6b4:	5d                   	pop    %ebp
     6b5:	c3                   	ret    
     6b6:	8d 76 00             	lea    0x0(%esi),%esi
     6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006c0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     6c0:	55                   	push   %ebp
     6c1:	89 e5                	mov    %esp,%ebp
     6c3:	53                   	push   %ebx
     6c4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6c7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     6ce:	e8 3d 0d 00 00       	call   1410 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6d3:	31 d2                	xor    %edx,%edx
     6d5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     6d9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     6db:	b8 08 00 00 00       	mov    $0x8,%eax
     6e0:	89 1c 24             	mov    %ebx,(%esp)
     6e3:	89 44 24 08          	mov    %eax,0x8(%esp)
     6e7:	e8 b4 07 00 00       	call   ea0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     6ec:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     6ef:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     6f5:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     6f8:	83 c4 14             	add    $0x14,%esp
     6fb:	89 d8                	mov    %ebx,%eax
     6fd:	5b                   	pop    %ebx
     6fe:	5d                   	pop    %ebp
     6ff:	c3                   	ret    

00000700 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     700:	55                   	push   %ebp
     701:	89 e5                	mov    %esp,%ebp
     703:	57                   	push   %edi
     704:	56                   	push   %esi
     705:	53                   	push   %ebx
     706:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     709:	8b 45 08             	mov    0x8(%ebp),%eax
{
     70c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     70f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     712:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     714:	39 de                	cmp    %ebx,%esi
     716:	72 0d                	jb     725 <gettoken+0x25>
     718:	eb 22                	jmp    73c <gettoken+0x3c>
     71a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     720:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     721:	39 f3                	cmp    %esi,%ebx
     723:	74 17                	je     73c <gettoken+0x3c>
     725:	0f be 06             	movsbl (%esi),%eax
     728:	c7 04 24 cc 1b 00 00 	movl   $0x1bcc,(%esp)
     72f:	89 44 24 04          	mov    %eax,0x4(%esp)
     733:	e8 88 07 00 00       	call   ec0 <strchr>
     738:	85 c0                	test   %eax,%eax
     73a:	75 e4                	jne    720 <gettoken+0x20>
  if(q)
     73c:	85 ff                	test   %edi,%edi
     73e:	74 02                	je     742 <gettoken+0x42>
    *q = s;
     740:	89 37                	mov    %esi,(%edi)
  ret = *s;
     742:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     745:	3c 29                	cmp    $0x29,%al
     747:	7f 57                	jg     7a0 <gettoken+0xa0>
     749:	3c 28                	cmp    $0x28,%al
     74b:	0f 8d cb 00 00 00    	jge    81c <gettoken+0x11c>
     751:	31 ff                	xor    %edi,%edi
     753:	84 c0                	test   %al,%al
     755:	0f 85 cd 00 00 00    	jne    828 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     75b:	8b 55 14             	mov    0x14(%ebp),%edx
     75e:	85 d2                	test   %edx,%edx
     760:	74 05                	je     767 <gettoken+0x67>
    *eq = s;
     762:	8b 45 14             	mov    0x14(%ebp),%eax
     765:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     767:	39 de                	cmp    %ebx,%esi
     769:	72 0a                	jb     775 <gettoken+0x75>
     76b:	eb 1f                	jmp    78c <gettoken+0x8c>
     76d:	8d 76 00             	lea    0x0(%esi),%esi
    s++;
     770:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     771:	39 f3                	cmp    %esi,%ebx
     773:	74 17                	je     78c <gettoken+0x8c>
     775:	0f be 06             	movsbl (%esi),%eax
     778:	c7 04 24 cc 1b 00 00 	movl   $0x1bcc,(%esp)
     77f:	89 44 24 04          	mov    %eax,0x4(%esp)
     783:	e8 38 07 00 00       	call   ec0 <strchr>
     788:	85 c0                	test   %eax,%eax
     78a:	75 e4                	jne    770 <gettoken+0x70>
  *ps = s;
     78c:	8b 45 08             	mov    0x8(%ebp),%eax
     78f:	89 30                	mov    %esi,(%eax)
  return ret;
}
     791:	83 c4 1c             	add    $0x1c,%esp
     794:	89 f8                	mov    %edi,%eax
     796:	5b                   	pop    %ebx
     797:	5e                   	pop    %esi
     798:	5f                   	pop    %edi
     799:	5d                   	pop    %ebp
     79a:	c3                   	ret    
     79b:	90                   	nop
     79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     7a0:	3c 3e                	cmp    $0x3e,%al
     7a2:	75 1c                	jne    7c0 <gettoken+0xc0>
    if(*s == '>'){
     7a4:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
    s++;
     7a8:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '>'){
     7ab:	0f 84 94 00 00 00    	je     845 <gettoken+0x145>
    s++;
     7b1:	89 c6                	mov    %eax,%esi
     7b3:	bf 3e 00 00 00       	mov    $0x3e,%edi
     7b8:	eb a1                	jmp    75b <gettoken+0x5b>
     7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  switch(*s){
     7c0:	7f 56                	jg     818 <gettoken+0x118>
     7c2:	88 c1                	mov    %al,%cl
     7c4:	80 e9 3b             	sub    $0x3b,%cl
     7c7:	80 f9 01             	cmp    $0x1,%cl
     7ca:	76 50                	jbe    81c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     7cc:	39 f3                	cmp    %esi,%ebx
     7ce:	77 27                	ja     7f7 <gettoken+0xf7>
     7d0:	eb 5e                	jmp    830 <gettoken+0x130>
     7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7d8:	0f be 06             	movsbl (%esi),%eax
     7db:	c7 04 24 c4 1b 00 00 	movl   $0x1bc4,(%esp)
     7e2:	89 44 24 04          	mov    %eax,0x4(%esp)
     7e6:	e8 d5 06 00 00       	call   ec0 <strchr>
     7eb:	85 c0                	test   %eax,%eax
     7ed:	75 1c                	jne    80b <gettoken+0x10b>
      s++;
     7ef:	46                   	inc    %esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     7f0:	39 f3                	cmp    %esi,%ebx
     7f2:	74 3c                	je     830 <gettoken+0x130>
     7f4:	0f be 06             	movsbl (%esi),%eax
     7f7:	89 44 24 04          	mov    %eax,0x4(%esp)
     7fb:	c7 04 24 cc 1b 00 00 	movl   $0x1bcc,(%esp)
     802:	e8 b9 06 00 00       	call   ec0 <strchr>
     807:	85 c0                	test   %eax,%eax
     809:	74 cd                	je     7d8 <gettoken+0xd8>
    ret = 'a';
     80b:	bf 61 00 00 00       	mov    $0x61,%edi
     810:	e9 46 ff ff ff       	jmp    75b <gettoken+0x5b>
     815:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     818:	3c 7c                	cmp    $0x7c,%al
     81a:	75 b0                	jne    7cc <gettoken+0xcc>
  ret = *s;
     81c:	0f be f8             	movsbl %al,%edi
    s++;
     81f:	46                   	inc    %esi
    break;
     820:	e9 36 ff ff ff       	jmp    75b <gettoken+0x5b>
     825:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     828:	3c 26                	cmp    $0x26,%al
     82a:	75 a0                	jne    7cc <gettoken+0xcc>
     82c:	eb ee                	jmp    81c <gettoken+0x11c>
     82e:	66 90                	xchg   %ax,%ax
  if(eq)
     830:	8b 45 14             	mov    0x14(%ebp),%eax
     833:	bf 61 00 00 00       	mov    $0x61,%edi
     838:	85 c0                	test   %eax,%eax
     83a:	0f 85 22 ff ff ff    	jne    762 <gettoken+0x62>
     840:	e9 47 ff ff ff       	jmp    78c <gettoken+0x8c>
      s++;
     845:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     848:	bf 2b 00 00 00       	mov    $0x2b,%edi
     84d:	e9 09 ff ff ff       	jmp    75b <gettoken+0x5b>
     852:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000860 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	53                   	push   %ebx
     866:	83 ec 1c             	sub    $0x1c,%esp
     869:	8b 7d 08             	mov    0x8(%ebp),%edi
     86c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     86f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     871:	39 f3                	cmp    %esi,%ebx
     873:	72 10                	jb     885 <peek+0x25>
     875:	eb 25                	jmp    89c <peek+0x3c>
     877:	89 f6                	mov    %esi,%esi
     879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     880:	43                   	inc    %ebx
  while(s < es && strchr(whitespace, *s))
     881:	39 de                	cmp    %ebx,%esi
     883:	74 17                	je     89c <peek+0x3c>
     885:	0f be 03             	movsbl (%ebx),%eax
     888:	c7 04 24 cc 1b 00 00 	movl   $0x1bcc,(%esp)
     88f:	89 44 24 04          	mov    %eax,0x4(%esp)
     893:	e8 28 06 00 00       	call   ec0 <strchr>
     898:	85 c0                	test   %eax,%eax
     89a:	75 e4                	jne    880 <peek+0x20>
  *ps = s;
     89c:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     89e:	31 c0                	xor    %eax,%eax
     8a0:	0f be 13             	movsbl (%ebx),%edx
     8a3:	84 d2                	test   %dl,%dl
     8a5:	74 17                	je     8be <peek+0x5e>
     8a7:	8b 45 10             	mov    0x10(%ebp),%eax
     8aa:	89 54 24 04          	mov    %edx,0x4(%esp)
     8ae:	89 04 24             	mov    %eax,(%esp)
     8b1:	e8 0a 06 00 00       	call   ec0 <strchr>
     8b6:	85 c0                	test   %eax,%eax
     8b8:	0f 95 c0             	setne  %al
     8bb:	0f b6 c0             	movzbl %al,%eax
}
     8be:	83 c4 1c             	add    $0x1c,%esp
     8c1:	5b                   	pop    %ebx
     8c2:	5e                   	pop    %esi
     8c3:	5f                   	pop    %edi
     8c4:	5d                   	pop    %ebp
     8c5:	c3                   	ret    
     8c6:	8d 76 00             	lea    0x0(%esi),%esi
     8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008d0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     8d0:	55                   	push   %ebp
     8d1:	89 e5                	mov    %esp,%ebp
     8d3:	57                   	push   %edi
     8d4:	56                   	push   %esi
     8d5:	53                   	push   %ebx
     8d6:	83 ec 3c             	sub    $0x3c,%esp
     8d9:	8b 75 0c             	mov    0xc(%ebp),%esi
     8dc:	8b 5d 10             	mov    0x10(%ebp),%ebx
     8df:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     8e0:	b8 4f 15 00 00       	mov    $0x154f,%eax
     8e5:	89 44 24 08          	mov    %eax,0x8(%esp)
     8e9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     8ed:	89 34 24             	mov    %esi,(%esp)
     8f0:	e8 6b ff ff ff       	call   860 <peek>
     8f5:	85 c0                	test   %eax,%eax
     8f7:	0f 84 93 00 00 00    	je     990 <parseredirs+0xc0>
    tok = gettoken(ps, es, 0, 0);
     8fd:	31 c0                	xor    %eax,%eax
     8ff:	89 44 24 0c          	mov    %eax,0xc(%esp)
     903:	31 c0                	xor    %eax,%eax
     905:	89 44 24 08          	mov    %eax,0x8(%esp)
     909:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     90d:	89 34 24             	mov    %esi,(%esp)
     910:	e8 eb fd ff ff       	call   700 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     915:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     919:	89 34 24             	mov    %esi,(%esp)
    tok = gettoken(ps, es, 0, 0);
     91c:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     91e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     921:	89 44 24 0c          	mov    %eax,0xc(%esp)
     925:	8d 45 e0             	lea    -0x20(%ebp),%eax
     928:	89 44 24 08          	mov    %eax,0x8(%esp)
     92c:	e8 cf fd ff ff       	call   700 <gettoken>
     931:	83 f8 61             	cmp    $0x61,%eax
     934:	75 65                	jne    99b <parseredirs+0xcb>
      panic("missing file for redirection");
    switch(tok){
     936:	83 ff 3c             	cmp    $0x3c,%edi
     939:	74 45                	je     980 <parseredirs+0xb0>
     93b:	83 ff 3e             	cmp    $0x3e,%edi
     93e:	66 90                	xchg   %ax,%ax
     940:	74 05                	je     947 <parseredirs+0x77>
     942:	83 ff 2b             	cmp    $0x2b,%edi
     945:	75 99                	jne    8e0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     947:	ba 01 00 00 00       	mov    $0x1,%edx
     94c:	b9 01 02 00 00       	mov    $0x201,%ecx
     951:	89 54 24 10          	mov    %edx,0x10(%esp)
     955:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     959:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     95c:	89 44 24 08          	mov    %eax,0x8(%esp)
     960:	8b 45 e0             	mov    -0x20(%ebp),%eax
     963:	89 44 24 04          	mov    %eax,0x4(%esp)
     967:	8b 45 08             	mov    0x8(%ebp),%eax
     96a:	89 04 24             	mov    %eax,(%esp)
     96d:	e8 4e fc ff ff       	call   5c0 <redircmd>
     972:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     975:	e9 66 ff ff ff       	jmp    8e0 <parseredirs+0x10>
     97a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     980:	31 ff                	xor    %edi,%edi
     982:	31 c0                	xor    %eax,%eax
     984:	89 7c 24 10          	mov    %edi,0x10(%esp)
     988:	89 44 24 0c          	mov    %eax,0xc(%esp)
     98c:	eb cb                	jmp    959 <parseredirs+0x89>
     98e:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     990:	8b 45 08             	mov    0x8(%ebp),%eax
     993:	83 c4 3c             	add    $0x3c,%esp
     996:	5b                   	pop    %ebx
     997:	5e                   	pop    %esi
     998:	5f                   	pop    %edi
     999:	5d                   	pop    %ebp
     99a:	c3                   	ret    
      panic("missing file for redirection");
     99b:	c7 04 24 32 15 00 00 	movl   $0x1532,(%esp)
     9a2:	e8 19 f8 ff ff       	call   1c0 <panic>
     9a7:	89 f6                	mov    %esi,%esi
     9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009b0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     9b0:	55                   	push   %ebp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     9b1:	ba 52 15 00 00       	mov    $0x1552,%edx
{
     9b6:	89 e5                	mov    %esp,%ebp
     9b8:	57                   	push   %edi
     9b9:	56                   	push   %esi
     9ba:	53                   	push   %ebx
     9bb:	83 ec 3c             	sub    $0x3c,%esp
     9be:	8b 75 08             	mov    0x8(%ebp),%esi
     9c1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(peek(ps, es, "("))
     9c4:	89 54 24 08          	mov    %edx,0x8(%esp)
     9c8:	89 34 24             	mov    %esi,(%esp)
     9cb:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9cf:	e8 8c fe ff ff       	call   860 <peek>
     9d4:	85 c0                	test   %eax,%eax
     9d6:	0f 85 9c 00 00 00    	jne    a78 <parseexec+0xc8>
     9dc:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     9de:	e8 9d fb ff ff       	call   580 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     9e3:	89 7c 24 08          	mov    %edi,0x8(%esp)
     9e7:	89 74 24 04          	mov    %esi,0x4(%esp)
     9eb:	89 04 24             	mov    %eax,(%esp)
  ret = execcmd();
     9ee:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     9f1:	e8 da fe ff ff       	call   8d0 <parseredirs>
     9f6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     9f9:	eb 1b                	jmp    a16 <parseexec+0x66>
     9fb:	90                   	nop
     9fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     a00:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     a03:	89 7c 24 08          	mov    %edi,0x8(%esp)
     a07:	89 74 24 04          	mov    %esi,0x4(%esp)
     a0b:	89 04 24             	mov    %eax,(%esp)
     a0e:	e8 bd fe ff ff       	call   8d0 <parseredirs>
     a13:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     a16:	b8 69 15 00 00       	mov    $0x1569,%eax
     a1b:	89 44 24 08          	mov    %eax,0x8(%esp)
     a1f:	89 7c 24 04          	mov    %edi,0x4(%esp)
     a23:	89 34 24             	mov    %esi,(%esp)
     a26:	e8 35 fe ff ff       	call   860 <peek>
     a2b:	85 c0                	test   %eax,%eax
     a2d:	75 69                	jne    a98 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     a2f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     a32:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a36:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a39:	89 44 24 08          	mov    %eax,0x8(%esp)
     a3d:	89 7c 24 04          	mov    %edi,0x4(%esp)
     a41:	89 34 24             	mov    %esi,(%esp)
     a44:	e8 b7 fc ff ff       	call   700 <gettoken>
     a49:	85 c0                	test   %eax,%eax
     a4b:	74 4b                	je     a98 <parseexec+0xe8>
    if(tok != 'a')
     a4d:	83 f8 61             	cmp    $0x61,%eax
     a50:	75 65                	jne    ab7 <parseexec+0x107>
    cmd->argv[argc] = q;
     a52:	8b 45 e0             	mov    -0x20(%ebp),%eax
     a55:	8b 55 d0             	mov    -0x30(%ebp),%edx
     a58:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     a5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a5f:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     a63:	43                   	inc    %ebx
    if(argc >= MAXARGS)
     a64:	83 fb 0a             	cmp    $0xa,%ebx
     a67:	75 97                	jne    a00 <parseexec+0x50>
      panic("too many args");
     a69:	c7 04 24 5b 15 00 00 	movl   $0x155b,(%esp)
     a70:	e8 4b f7 ff ff       	call   1c0 <panic>
     a75:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     a78:	89 7c 24 04          	mov    %edi,0x4(%esp)
     a7c:	89 34 24             	mov    %esi,(%esp)
     a7f:	e8 9c 01 00 00       	call   c20 <parseblock>
     a84:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     a87:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     a8a:	83 c4 3c             	add    $0x3c,%esp
     a8d:	5b                   	pop    %ebx
     a8e:	5e                   	pop    %esi
     a8f:	5f                   	pop    %edi
     a90:	5d                   	pop    %ebp
     a91:	c3                   	ret    
     a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a98:	8b 45 d0             	mov    -0x30(%ebp),%eax
     a9b:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     a9e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     aa5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     aac:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     aaf:	83 c4 3c             	add    $0x3c,%esp
     ab2:	5b                   	pop    %ebx
     ab3:	5e                   	pop    %esi
     ab4:	5f                   	pop    %edi
     ab5:	5d                   	pop    %ebp
     ab6:	c3                   	ret    
      panic("syntax");
     ab7:	c7 04 24 54 15 00 00 	movl   $0x1554,(%esp)
     abe:	e8 fd f6 ff ff       	call   1c0 <panic>
     ac3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ad0 <parsepipe>:
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	83 ec 28             	sub    $0x28,%esp
     ad6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     ad9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     adc:	89 75 f8             	mov    %esi,-0x8(%ebp)
     adf:	8b 75 0c             	mov    0xc(%ebp),%esi
     ae2:	89 7d fc             	mov    %edi,-0x4(%ebp)
  cmd = parseexec(ps, es);
     ae5:	89 1c 24             	mov    %ebx,(%esp)
     ae8:	89 74 24 04          	mov    %esi,0x4(%esp)
     aec:	e8 bf fe ff ff       	call   9b0 <parseexec>
  if(peek(ps, es, "|")){
     af1:	b9 6e 15 00 00       	mov    $0x156e,%ecx
     af6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     afa:	89 74 24 04          	mov    %esi,0x4(%esp)
     afe:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseexec(ps, es);
     b01:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     b03:	e8 58 fd ff ff       	call   860 <peek>
     b08:	85 c0                	test   %eax,%eax
     b0a:	75 14                	jne    b20 <parsepipe+0x50>
}
     b0c:	89 f8                	mov    %edi,%eax
     b0e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     b11:	8b 75 f8             	mov    -0x8(%ebp),%esi
     b14:	8b 7d fc             	mov    -0x4(%ebp),%edi
     b17:	89 ec                	mov    %ebp,%esp
     b19:	5d                   	pop    %ebp
     b1a:	c3                   	ret    
     b1b:	90                   	nop
     b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     b20:	31 d2                	xor    %edx,%edx
     b22:	31 c0                	xor    %eax,%eax
     b24:	89 54 24 08          	mov    %edx,0x8(%esp)
     b28:	89 74 24 04          	mov    %esi,0x4(%esp)
     b2c:	89 1c 24             	mov    %ebx,(%esp)
     b2f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b33:	e8 c8 fb ff ff       	call   700 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b38:	89 74 24 04          	mov    %esi,0x4(%esp)
     b3c:	89 1c 24             	mov    %ebx,(%esp)
     b3f:	e8 8c ff ff ff       	call   ad0 <parsepipe>
}
     b44:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b47:	89 7d 08             	mov    %edi,0x8(%ebp)
}
     b4a:	8b 75 f8             	mov    -0x8(%ebp),%esi
     b4d:	8b 7d fc             	mov    -0x4(%ebp),%edi
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b50:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     b53:	89 ec                	mov    %ebp,%esp
     b55:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b56:	e9 c5 fa ff ff       	jmp    620 <pipecmd>
     b5b:	90                   	nop
     b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b60 <parseline>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
     b65:	53                   	push   %ebx
     b66:	83 ec 1c             	sub    $0x1c,%esp
     b69:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     b6f:	89 1c 24             	mov    %ebx,(%esp)
     b72:	89 74 24 04          	mov    %esi,0x4(%esp)
     b76:	e8 55 ff ff ff       	call   ad0 <parsepipe>
     b7b:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     b7d:	eb 23                	jmp    ba2 <parseline+0x42>
     b7f:	90                   	nop
    gettoken(ps, es, 0, 0);
     b80:	31 c0                	xor    %eax,%eax
     b82:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b86:	31 c0                	xor    %eax,%eax
     b88:	89 44 24 08          	mov    %eax,0x8(%esp)
     b8c:	89 74 24 04          	mov    %esi,0x4(%esp)
     b90:	89 1c 24             	mov    %ebx,(%esp)
     b93:	e8 68 fb ff ff       	call   700 <gettoken>
    cmd = backcmd(cmd);
     b98:	89 3c 24             	mov    %edi,(%esp)
     b9b:	e8 20 fb ff ff       	call   6c0 <backcmd>
     ba0:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     ba2:	b8 70 15 00 00       	mov    $0x1570,%eax
     ba7:	89 44 24 08          	mov    %eax,0x8(%esp)
     bab:	89 74 24 04          	mov    %esi,0x4(%esp)
     baf:	89 1c 24             	mov    %ebx,(%esp)
     bb2:	e8 a9 fc ff ff       	call   860 <peek>
     bb7:	85 c0                	test   %eax,%eax
     bb9:	75 c5                	jne    b80 <parseline+0x20>
  if(peek(ps, es, ";")){
     bbb:	b9 6c 15 00 00       	mov    $0x156c,%ecx
     bc0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     bc4:	89 74 24 04          	mov    %esi,0x4(%esp)
     bc8:	89 1c 24             	mov    %ebx,(%esp)
     bcb:	e8 90 fc ff ff       	call   860 <peek>
     bd0:	85 c0                	test   %eax,%eax
     bd2:	75 0c                	jne    be0 <parseline+0x80>
}
     bd4:	83 c4 1c             	add    $0x1c,%esp
     bd7:	89 f8                	mov    %edi,%eax
     bd9:	5b                   	pop    %ebx
     bda:	5e                   	pop    %esi
     bdb:	5f                   	pop    %edi
     bdc:	5d                   	pop    %ebp
     bdd:	c3                   	ret    
     bde:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     be0:	31 d2                	xor    %edx,%edx
     be2:	31 c0                	xor    %eax,%eax
     be4:	89 54 24 08          	mov    %edx,0x8(%esp)
     be8:	89 74 24 04          	mov    %esi,0x4(%esp)
     bec:	89 1c 24             	mov    %ebx,(%esp)
     bef:	89 44 24 0c          	mov    %eax,0xc(%esp)
     bf3:	e8 08 fb ff ff       	call   700 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     bf8:	89 74 24 04          	mov    %esi,0x4(%esp)
     bfc:	89 1c 24             	mov    %ebx,(%esp)
     bff:	e8 5c ff ff ff       	call   b60 <parseline>
     c04:	89 7d 08             	mov    %edi,0x8(%ebp)
     c07:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     c0a:	83 c4 1c             	add    $0x1c,%esp
     c0d:	5b                   	pop    %ebx
     c0e:	5e                   	pop    %esi
     c0f:	5f                   	pop    %edi
     c10:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     c11:	e9 5a fa ff ff       	jmp    670 <listcmd>
     c16:	8d 76 00             	lea    0x0(%esi),%esi
     c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c20 <parseblock>:
{
     c20:	55                   	push   %ebp
  if(!peek(ps, es, "("))
     c21:	b8 52 15 00 00       	mov    $0x1552,%eax
{
     c26:	89 e5                	mov    %esp,%ebp
     c28:	83 ec 28             	sub    $0x28,%esp
     c2b:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     c2e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     c31:	89 75 f8             	mov    %esi,-0x8(%ebp)
     c34:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     c37:	89 44 24 08          	mov    %eax,0x8(%esp)
{
     c3b:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(!peek(ps, es, "("))
     c3e:	89 1c 24             	mov    %ebx,(%esp)
     c41:	89 74 24 04          	mov    %esi,0x4(%esp)
     c45:	e8 16 fc ff ff       	call   860 <peek>
     c4a:	85 c0                	test   %eax,%eax
     c4c:	74 74                	je     cc2 <parseblock+0xa2>
  gettoken(ps, es, 0, 0);
     c4e:	31 c9                	xor    %ecx,%ecx
     c50:	31 ff                	xor    %edi,%edi
     c52:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     c56:	89 7c 24 08          	mov    %edi,0x8(%esp)
     c5a:	89 74 24 04          	mov    %esi,0x4(%esp)
     c5e:	89 1c 24             	mov    %ebx,(%esp)
     c61:	e8 9a fa ff ff       	call   700 <gettoken>
  cmd = parseline(ps, es);
     c66:	89 74 24 04          	mov    %esi,0x4(%esp)
     c6a:	89 1c 24             	mov    %ebx,(%esp)
     c6d:	e8 ee fe ff ff       	call   b60 <parseline>
  if(!peek(ps, es, ")"))
     c72:	89 74 24 04          	mov    %esi,0x4(%esp)
     c76:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseline(ps, es);
     c79:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     c7b:	b8 8e 15 00 00       	mov    $0x158e,%eax
     c80:	89 44 24 08          	mov    %eax,0x8(%esp)
     c84:	e8 d7 fb ff ff       	call   860 <peek>
     c89:	85 c0                	test   %eax,%eax
     c8b:	74 41                	je     cce <parseblock+0xae>
  gettoken(ps, es, 0, 0);
     c8d:	31 d2                	xor    %edx,%edx
     c8f:	31 c0                	xor    %eax,%eax
     c91:	89 54 24 08          	mov    %edx,0x8(%esp)
     c95:	89 74 24 04          	mov    %esi,0x4(%esp)
     c99:	89 1c 24             	mov    %ebx,(%esp)
     c9c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     ca0:	e8 5b fa ff ff       	call   700 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ca5:	89 74 24 08          	mov    %esi,0x8(%esp)
     ca9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     cad:	89 3c 24             	mov    %edi,(%esp)
     cb0:	e8 1b fc ff ff       	call   8d0 <parseredirs>
}
     cb5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     cb8:	8b 75 f8             	mov    -0x8(%ebp),%esi
     cbb:	8b 7d fc             	mov    -0x4(%ebp),%edi
     cbe:	89 ec                	mov    %ebp,%esp
     cc0:	5d                   	pop    %ebp
     cc1:	c3                   	ret    
    panic("parseblock");
     cc2:	c7 04 24 72 15 00 00 	movl   $0x1572,(%esp)
     cc9:	e8 f2 f4 ff ff       	call   1c0 <panic>
    panic("syntax - missing )");
     cce:	c7 04 24 7d 15 00 00 	movl   $0x157d,(%esp)
     cd5:	e8 e6 f4 ff ff       	call   1c0 <panic>
     cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ce0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	53                   	push   %ebx
     ce4:	83 ec 14             	sub    $0x14,%esp
     ce7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     cea:	85 db                	test   %ebx,%ebx
     cec:	74 1d                	je     d0b <nulterminate+0x2b>
    return 0;

  switch(cmd->type){
     cee:	83 3b 05             	cmpl   $0x5,(%ebx)
     cf1:	77 18                	ja     d0b <nulterminate+0x2b>
     cf3:	8b 03                	mov    (%ebx),%eax
     cf5:	ff 24 85 d0 15 00 00 	jmp    *0x15d0(,%eax,4)
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     d00:	8b 43 04             	mov    0x4(%ebx),%eax
     d03:	89 04 24             	mov    %eax,(%esp)
     d06:	e8 d5 ff ff ff       	call   ce0 <nulterminate>
    break;
  }
  return cmd;
}
     d0b:	83 c4 14             	add    $0x14,%esp
     d0e:	89 d8                	mov    %ebx,%eax
     d10:	5b                   	pop    %ebx
     d11:	5d                   	pop    %ebp
     d12:	c3                   	ret    
     d13:	90                   	nop
     d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->left);
     d18:	8b 43 04             	mov    0x4(%ebx),%eax
     d1b:	89 04 24             	mov    %eax,(%esp)
     d1e:	e8 bd ff ff ff       	call   ce0 <nulterminate>
    nulterminate(lcmd->right);
     d23:	8b 43 08             	mov    0x8(%ebx),%eax
     d26:	89 04 24             	mov    %eax,(%esp)
     d29:	e8 b2 ff ff ff       	call   ce0 <nulterminate>
}
     d2e:	83 c4 14             	add    $0x14,%esp
     d31:	89 d8                	mov    %ebx,%eax
     d33:	5b                   	pop    %ebx
     d34:	5d                   	pop    %ebp
     d35:	c3                   	ret    
     d36:	8d 76 00             	lea    0x0(%esi),%esi
     d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     d40:	8b 4b 04             	mov    0x4(%ebx),%ecx
     d43:	8d 43 08             	lea    0x8(%ebx),%eax
     d46:	85 c9                	test   %ecx,%ecx
     d48:	74 c1                	je     d0b <nulterminate+0x2b>
     d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     d50:	8b 50 24             	mov    0x24(%eax),%edx
     d53:	83 c0 04             	add    $0x4,%eax
     d56:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     d59:	8b 50 fc             	mov    -0x4(%eax),%edx
     d5c:	85 d2                	test   %edx,%edx
     d5e:	75 f0                	jne    d50 <nulterminate+0x70>
}
     d60:	83 c4 14             	add    $0x14,%esp
     d63:	89 d8                	mov    %ebx,%eax
     d65:	5b                   	pop    %ebx
     d66:	5d                   	pop    %ebp
     d67:	c3                   	ret    
     d68:	90                   	nop
     d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(rcmd->cmd);
     d70:	8b 43 04             	mov    0x4(%ebx),%eax
     d73:	89 04 24             	mov    %eax,(%esp)
     d76:	e8 65 ff ff ff       	call   ce0 <nulterminate>
    *rcmd->efile = 0;
     d7b:	8b 43 0c             	mov    0xc(%ebx),%eax
     d7e:	c6 00 00             	movb   $0x0,(%eax)
}
     d81:	83 c4 14             	add    $0x14,%esp
     d84:	89 d8                	mov    %ebx,%eax
     d86:	5b                   	pop    %ebx
     d87:	5d                   	pop    %ebp
     d88:	c3                   	ret    
     d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d90 <parsecmd>:
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	56                   	push   %esi
     d94:	53                   	push   %ebx
     d95:	83 ec 10             	sub    $0x10,%esp
  es = s + strlen(s);
     d98:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d9b:	89 1c 24             	mov    %ebx,(%esp)
     d9e:	e8 cd 00 00 00       	call   e70 <strlen>
     da3:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     da5:	8d 45 08             	lea    0x8(%ebp),%eax
     da8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     dac:	89 04 24             	mov    %eax,(%esp)
     daf:	e8 ac fd ff ff       	call   b60 <parseline>
  peek(&s, es, "");
     db4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  cmd = parseline(&s, es);
     db8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     dba:	b8 17 15 00 00       	mov    $0x1517,%eax
     dbf:	89 44 24 08          	mov    %eax,0x8(%esp)
     dc3:	8d 45 08             	lea    0x8(%ebp),%eax
     dc6:	89 04 24             	mov    %eax,(%esp)
     dc9:	e8 92 fa ff ff       	call   860 <peek>
  if(s != es){
     dce:	8b 45 08             	mov    0x8(%ebp),%eax
     dd1:	39 d8                	cmp    %ebx,%eax
     dd3:	75 11                	jne    de6 <parsecmd+0x56>
  nulterminate(cmd);
     dd5:	89 34 24             	mov    %esi,(%esp)
     dd8:	e8 03 ff ff ff       	call   ce0 <nulterminate>
}
     ddd:	83 c4 10             	add    $0x10,%esp
     de0:	89 f0                	mov    %esi,%eax
     de2:	5b                   	pop    %ebx
     de3:	5e                   	pop    %esi
     de4:	5d                   	pop    %ebp
     de5:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     de6:	89 44 24 08          	mov    %eax,0x8(%esp)
     dea:	c7 44 24 04 90 15 00 	movl   $0x1590,0x4(%esp)
     df1:	00 
     df2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     df9:	e8 82 03 00 00       	call   1180 <printf>
    panic("syntax");
     dfe:	c7 04 24 54 15 00 00 	movl   $0x1554,(%esp)
     e05:	e8 b6 f3 ff ff       	call   1c0 <panic>
     e0a:	66 90                	xchg   %ax,%ax
     e0c:	66 90                	xchg   %ax,%ax
     e0e:	66 90                	xchg   %ax,%ax

00000e10 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	8b 45 08             	mov    0x8(%ebp),%eax
     e16:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     e19:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     e1a:	89 c2                	mov    %eax,%edx
     e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e20:	41                   	inc    %ecx
     e21:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     e25:	42                   	inc    %edx
     e26:	84 db                	test   %bl,%bl
     e28:	88 5a ff             	mov    %bl,-0x1(%edx)
     e2b:	75 f3                	jne    e20 <strcpy+0x10>
    ;
  return os;
}
     e2d:	5b                   	pop    %ebx
     e2e:	5d                   	pop    %ebp
     e2f:	c3                   	ret    

00000e30 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	8b 4d 08             	mov    0x8(%ebp),%ecx
     e36:	53                   	push   %ebx
     e37:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
     e3a:	0f b6 01             	movzbl (%ecx),%eax
     e3d:	0f b6 13             	movzbl (%ebx),%edx
     e40:	84 c0                	test   %al,%al
     e42:	75 18                	jne    e5c <strcmp+0x2c>
     e44:	eb 22                	jmp    e68 <strcmp+0x38>
     e46:	8d 76 00             	lea    0x0(%esi),%esi
     e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     e50:	41                   	inc    %ecx
  while(*p && *p == *q)
     e51:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
     e54:	43                   	inc    %ebx
     e55:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
     e58:	84 c0                	test   %al,%al
     e5a:	74 0c                	je     e68 <strcmp+0x38>
     e5c:	38 d0                	cmp    %dl,%al
     e5e:	74 f0                	je     e50 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
     e60:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
     e61:	29 d0                	sub    %edx,%eax
}
     e63:	5d                   	pop    %ebp
     e64:	c3                   	ret    
     e65:	8d 76 00             	lea    0x0(%esi),%esi
     e68:	5b                   	pop    %ebx
     e69:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     e6b:	29 d0                	sub    %edx,%eax
}
     e6d:	5d                   	pop    %ebp
     e6e:	c3                   	ret    
     e6f:	90                   	nop

00000e70 <strlen>:

uint
strlen(const char *s)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     e76:	80 39 00             	cmpb   $0x0,(%ecx)
     e79:	74 15                	je     e90 <strlen+0x20>
     e7b:	31 d2                	xor    %edx,%edx
     e7d:	8d 76 00             	lea    0x0(%esi),%esi
     e80:	42                   	inc    %edx
     e81:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     e85:	89 d0                	mov    %edx,%eax
     e87:	75 f7                	jne    e80 <strlen+0x10>
    ;
  return n;
}
     e89:	5d                   	pop    %ebp
     e8a:	c3                   	ret    
     e8b:	90                   	nop
     e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
     e90:	31 c0                	xor    %eax,%eax
}
     e92:	5d                   	pop    %ebp
     e93:	c3                   	ret    
     e94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ea0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	8b 55 08             	mov    0x8(%ebp),%edx
     ea6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     ea7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     eaa:	8b 45 0c             	mov    0xc(%ebp),%eax
     ead:	89 d7                	mov    %edx,%edi
     eaf:	fc                   	cld    
     eb0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     eb2:	5f                   	pop    %edi
     eb3:	89 d0                	mov    %edx,%eax
     eb5:	5d                   	pop    %ebp
     eb6:	c3                   	ret    
     eb7:	89 f6                	mov    %esi,%esi
     eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ec0 <strchr>:

char*
strchr(const char *s, char c)
{
     ec0:	55                   	push   %ebp
     ec1:	89 e5                	mov    %esp,%ebp
     ec3:	8b 45 08             	mov    0x8(%ebp),%eax
     ec6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     eca:	0f b6 10             	movzbl (%eax),%edx
     ecd:	84 d2                	test   %dl,%dl
     ecf:	74 1b                	je     eec <strchr+0x2c>
    if(*s == c)
     ed1:	38 d1                	cmp    %dl,%cl
     ed3:	75 0f                	jne    ee4 <strchr+0x24>
     ed5:	eb 17                	jmp    eee <strchr+0x2e>
     ed7:	89 f6                	mov    %esi,%esi
     ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     ee0:	38 ca                	cmp    %cl,%dl
     ee2:	74 0a                	je     eee <strchr+0x2e>
  for(; *s; s++)
     ee4:	40                   	inc    %eax
     ee5:	0f b6 10             	movzbl (%eax),%edx
     ee8:	84 d2                	test   %dl,%dl
     eea:	75 f4                	jne    ee0 <strchr+0x20>
      return (char*)s;
  return 0;
     eec:	31 c0                	xor    %eax,%eax
}
     eee:	5d                   	pop    %ebp
     eef:	c3                   	ret    

00000ef0 <gets>:

char*
gets(char *buf, int max)
{
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	57                   	push   %edi
     ef4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ef5:	31 f6                	xor    %esi,%esi
{
     ef7:	53                   	push   %ebx
     ef8:	83 ec 3c             	sub    $0x3c,%esp
     efb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
     efe:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
     f01:	eb 32                	jmp    f35 <gets+0x45>
     f03:	90                   	nop
     f04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
     f08:	ba 01 00 00 00       	mov    $0x1,%edx
     f0d:	89 54 24 08          	mov    %edx,0x8(%esp)
     f11:	89 7c 24 04          	mov    %edi,0x4(%esp)
     f15:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f1c:	e8 2f 01 00 00       	call   1050 <read>
    if(cc < 1)
     f21:	85 c0                	test   %eax,%eax
     f23:	7e 19                	jle    f3e <gets+0x4e>
      break;
    buf[i++] = c;
     f25:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     f29:	43                   	inc    %ebx
     f2a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
     f2d:	3c 0a                	cmp    $0xa,%al
     f2f:	74 1f                	je     f50 <gets+0x60>
     f31:	3c 0d                	cmp    $0xd,%al
     f33:	74 1b                	je     f50 <gets+0x60>
  for(i=0; i+1 < max; ){
     f35:	46                   	inc    %esi
     f36:	3b 75 0c             	cmp    0xc(%ebp),%esi
     f39:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     f3c:	7c ca                	jl     f08 <gets+0x18>
      break;
  }
  buf[i] = '\0';
     f3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     f41:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
     f44:	8b 45 08             	mov    0x8(%ebp),%eax
     f47:	83 c4 3c             	add    $0x3c,%esp
     f4a:	5b                   	pop    %ebx
     f4b:	5e                   	pop    %esi
     f4c:	5f                   	pop    %edi
     f4d:	5d                   	pop    %ebp
     f4e:	c3                   	ret    
     f4f:	90                   	nop
     f50:	8b 45 08             	mov    0x8(%ebp),%eax
     f53:	01 c6                	add    %eax,%esi
     f55:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     f58:	eb e4                	jmp    f3e <gets+0x4e>
     f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000f60 <stat>:

int
stat(const char *n, struct stat *st)
{
     f60:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     f61:	31 c0                	xor    %eax,%eax
{
     f63:	89 e5                	mov    %esp,%ebp
     f65:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
     f68:	89 44 24 04          	mov    %eax,0x4(%esp)
     f6c:	8b 45 08             	mov    0x8(%ebp),%eax
{
     f6f:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     f72:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
     f75:	89 04 24             	mov    %eax,(%esp)
     f78:	e8 fb 00 00 00       	call   1078 <open>
  if(fd < 0)
     f7d:	85 c0                	test   %eax,%eax
     f7f:	78 2f                	js     fb0 <stat+0x50>
     f81:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     f83:	8b 45 0c             	mov    0xc(%ebp),%eax
     f86:	89 1c 24             	mov    %ebx,(%esp)
     f89:	89 44 24 04          	mov    %eax,0x4(%esp)
     f8d:	e8 fe 00 00 00       	call   1090 <fstat>
  close(fd);
     f92:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     f95:	89 c6                	mov    %eax,%esi
  close(fd);
     f97:	e8 c4 00 00 00       	call   1060 <close>
  return r;
}
     f9c:	89 f0                	mov    %esi,%eax
     f9e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     fa1:	8b 75 fc             	mov    -0x4(%ebp),%esi
     fa4:	89 ec                	mov    %ebp,%esp
     fa6:	5d                   	pop    %ebp
     fa7:	c3                   	ret    
     fa8:	90                   	nop
     fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     fb0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     fb5:	eb e5                	jmp    f9c <stat+0x3c>
     fb7:	89 f6                	mov    %esi,%esi
     fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000fc0 <atoi>:

int
atoi(const char *s)
{
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     fc6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     fc7:	0f be 11             	movsbl (%ecx),%edx
     fca:	88 d0                	mov    %dl,%al
     fcc:	2c 30                	sub    $0x30,%al
     fce:	3c 09                	cmp    $0x9,%al
  n = 0;
     fd0:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     fd5:	77 1e                	ja     ff5 <atoi+0x35>
     fd7:	89 f6                	mov    %esi,%esi
     fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     fe0:	41                   	inc    %ecx
     fe1:	8d 04 80             	lea    (%eax,%eax,4),%eax
     fe4:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     fe8:	0f be 11             	movsbl (%ecx),%edx
     feb:	88 d3                	mov    %dl,%bl
     fed:	80 eb 30             	sub    $0x30,%bl
     ff0:	80 fb 09             	cmp    $0x9,%bl
     ff3:	76 eb                	jbe    fe0 <atoi+0x20>
  return n;
}
     ff5:	5b                   	pop    %ebx
     ff6:	5d                   	pop    %ebp
     ff7:	c3                   	ret    
     ff8:	90                   	nop
     ff9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001000 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	56                   	push   %esi
    1004:	8b 45 08             	mov    0x8(%ebp),%eax
    1007:	53                   	push   %ebx
    1008:	8b 5d 10             	mov    0x10(%ebp),%ebx
    100b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    100e:	85 db                	test   %ebx,%ebx
    1010:	7e 1a                	jle    102c <memmove+0x2c>
    1012:	31 d2                	xor    %edx,%edx
    1014:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    101a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
    1020:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1024:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1027:	42                   	inc    %edx
  while(n-- > 0)
    1028:	39 d3                	cmp    %edx,%ebx
    102a:	75 f4                	jne    1020 <memmove+0x20>
  return vdst;
}
    102c:	5b                   	pop    %ebx
    102d:	5e                   	pop    %esi
    102e:	5d                   	pop    %ebp
    102f:	c3                   	ret    

00001030 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1030:	b8 01 00 00 00       	mov    $0x1,%eax
    1035:	cd 40                	int    $0x40
    1037:	c3                   	ret    

00001038 <exit>:
SYSCALL(exit)
    1038:	b8 02 00 00 00       	mov    $0x2,%eax
    103d:	cd 40                	int    $0x40
    103f:	c3                   	ret    

00001040 <wait>:
SYSCALL(wait)
    1040:	b8 03 00 00 00       	mov    $0x3,%eax
    1045:	cd 40                	int    $0x40
    1047:	c3                   	ret    

00001048 <pipe>:
SYSCALL(pipe)
    1048:	b8 04 00 00 00       	mov    $0x4,%eax
    104d:	cd 40                	int    $0x40
    104f:	c3                   	ret    

00001050 <read>:
SYSCALL(read)
    1050:	b8 05 00 00 00       	mov    $0x5,%eax
    1055:	cd 40                	int    $0x40
    1057:	c3                   	ret    

00001058 <write>:
SYSCALL(write)
    1058:	b8 10 00 00 00       	mov    $0x10,%eax
    105d:	cd 40                	int    $0x40
    105f:	c3                   	ret    

00001060 <close>:
SYSCALL(close)
    1060:	b8 15 00 00 00       	mov    $0x15,%eax
    1065:	cd 40                	int    $0x40
    1067:	c3                   	ret    

00001068 <kill>:
SYSCALL(kill)
    1068:	b8 06 00 00 00       	mov    $0x6,%eax
    106d:	cd 40                	int    $0x40
    106f:	c3                   	ret    

00001070 <exec>:
SYSCALL(exec)
    1070:	b8 07 00 00 00       	mov    $0x7,%eax
    1075:	cd 40                	int    $0x40
    1077:	c3                   	ret    

00001078 <open>:
SYSCALL(open)
    1078:	b8 0f 00 00 00       	mov    $0xf,%eax
    107d:	cd 40                	int    $0x40
    107f:	c3                   	ret    

00001080 <mknod>:
SYSCALL(mknod)
    1080:	b8 11 00 00 00       	mov    $0x11,%eax
    1085:	cd 40                	int    $0x40
    1087:	c3                   	ret    

00001088 <unlink>:
SYSCALL(unlink)
    1088:	b8 12 00 00 00       	mov    $0x12,%eax
    108d:	cd 40                	int    $0x40
    108f:	c3                   	ret    

00001090 <fstat>:
SYSCALL(fstat)
    1090:	b8 08 00 00 00       	mov    $0x8,%eax
    1095:	cd 40                	int    $0x40
    1097:	c3                   	ret    

00001098 <link>:
SYSCALL(link)
    1098:	b8 13 00 00 00       	mov    $0x13,%eax
    109d:	cd 40                	int    $0x40
    109f:	c3                   	ret    

000010a0 <mkdir>:
SYSCALL(mkdir)
    10a0:	b8 14 00 00 00       	mov    $0x14,%eax
    10a5:	cd 40                	int    $0x40
    10a7:	c3                   	ret    

000010a8 <chdir>:
SYSCALL(chdir)
    10a8:	b8 09 00 00 00       	mov    $0x9,%eax
    10ad:	cd 40                	int    $0x40
    10af:	c3                   	ret    

000010b0 <dup>:
SYSCALL(dup)
    10b0:	b8 0a 00 00 00       	mov    $0xa,%eax
    10b5:	cd 40                	int    $0x40
    10b7:	c3                   	ret    

000010b8 <getpid>:
SYSCALL(getpid)
    10b8:	b8 0b 00 00 00       	mov    $0xb,%eax
    10bd:	cd 40                	int    $0x40
    10bf:	c3                   	ret    

000010c0 <sbrk>:
SYSCALL(sbrk)
    10c0:	b8 0c 00 00 00       	mov    $0xc,%eax
    10c5:	cd 40                	int    $0x40
    10c7:	c3                   	ret    

000010c8 <sleep>:
SYSCALL(sleep)
    10c8:	b8 0d 00 00 00       	mov    $0xd,%eax
    10cd:	cd 40                	int    $0x40
    10cf:	c3                   	ret    

000010d0 <uptime>:
SYSCALL(uptime)
    10d0:	b8 0e 00 00 00       	mov    $0xe,%eax
    10d5:	cd 40                	int    $0x40
    10d7:	c3                   	ret    
    10d8:	66 90                	xchg   %ax,%ax
    10da:	66 90                	xchg   %ax,%ax
    10dc:	66 90                	xchg   %ax,%ax
    10de:	66 90                	xchg   %ax,%ax

000010e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	56                   	push   %esi
    10e5:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    10e6:	89 d3                	mov    %edx,%ebx
    10e8:	c1 eb 1f             	shr    $0x1f,%ebx
{
    10eb:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
    10ee:	84 db                	test   %bl,%bl
{
    10f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    10f3:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    10f5:	74 79                	je     1170 <printint+0x90>
    10f7:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    10fb:	74 73                	je     1170 <printint+0x90>
    neg = 1;
    x = -xx;
    10fd:	f7 d8                	neg    %eax
    neg = 1;
    10ff:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1106:	31 f6                	xor    %esi,%esi
    1108:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    110b:	eb 05                	jmp    1112 <printint+0x32>
    110d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1110:	89 fe                	mov    %edi,%esi
    1112:	31 d2                	xor    %edx,%edx
    1114:	f7 f1                	div    %ecx
    1116:	8d 7e 01             	lea    0x1(%esi),%edi
    1119:	0f b6 92 f0 15 00 00 	movzbl 0x15f0(%edx),%edx
  }while((x /= base) != 0);
    1120:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1122:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1125:	75 e9                	jne    1110 <printint+0x30>
  if(neg)
    1127:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    112a:	85 d2                	test   %edx,%edx
    112c:	74 08                	je     1136 <printint+0x56>
    buf[i++] = '-';
    112e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1133:	8d 7e 02             	lea    0x2(%esi),%edi
    1136:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    113a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    113d:	8d 76 00             	lea    0x0(%esi),%esi
    1140:	0f b6 06             	movzbl (%esi),%eax
    1143:	4e                   	dec    %esi
  write(fd, &c, 1);
    1144:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1148:	89 3c 24             	mov    %edi,(%esp)
    114b:	88 45 d7             	mov    %al,-0x29(%ebp)
    114e:	b8 01 00 00 00       	mov    $0x1,%eax
    1153:	89 44 24 08          	mov    %eax,0x8(%esp)
    1157:	e8 fc fe ff ff       	call   1058 <write>

  while(--i >= 0)
    115c:	39 de                	cmp    %ebx,%esi
    115e:	75 e0                	jne    1140 <printint+0x60>
    putc(fd, buf[i]);
}
    1160:	83 c4 4c             	add    $0x4c,%esp
    1163:	5b                   	pop    %ebx
    1164:	5e                   	pop    %esi
    1165:	5f                   	pop    %edi
    1166:	5d                   	pop    %ebp
    1167:	c3                   	ret    
    1168:	90                   	nop
    1169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1170:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    1177:	eb 8d                	jmp    1106 <printint+0x26>
    1179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001180 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
    1185:	53                   	push   %ebx
    1186:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1189:	8b 75 0c             	mov    0xc(%ebp),%esi
    118c:	0f b6 1e             	movzbl (%esi),%ebx
    118f:	84 db                	test   %bl,%bl
    1191:	0f 84 d1 00 00 00    	je     1268 <printf+0xe8>
  state = 0;
    1197:	31 ff                	xor    %edi,%edi
    1199:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
    119a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
    119d:	89 fa                	mov    %edi,%edx
    119f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
    11a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    11a5:	eb 41                	jmp    11e8 <printf+0x68>
    11a7:	89 f6                	mov    %esi,%esi
    11a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    11b0:	83 f8 25             	cmp    $0x25,%eax
    11b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    11b6:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    11bb:	74 1e                	je     11db <printf+0x5b>
  write(fd, &c, 1);
    11bd:	b8 01 00 00 00       	mov    $0x1,%eax
    11c2:	89 44 24 08          	mov    %eax,0x8(%esp)
    11c6:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    11c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    11cd:	89 3c 24             	mov    %edi,(%esp)
    11d0:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    11d3:	e8 80 fe ff ff       	call   1058 <write>
    11d8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    11db:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
    11dc:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    11e0:	84 db                	test   %bl,%bl
    11e2:	0f 84 80 00 00 00    	je     1268 <printf+0xe8>
    if(state == 0){
    11e8:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    11ea:	0f be cb             	movsbl %bl,%ecx
    11ed:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    11f0:	74 be                	je     11b0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    11f2:	83 fa 25             	cmp    $0x25,%edx
    11f5:	75 e4                	jne    11db <printf+0x5b>
      if(c == 'd'){
    11f7:	83 f8 64             	cmp    $0x64,%eax
    11fa:	0f 84 f0 00 00 00    	je     12f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1200:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1206:	83 f9 70             	cmp    $0x70,%ecx
    1209:	74 65                	je     1270 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    120b:	83 f8 73             	cmp    $0x73,%eax
    120e:	0f 84 8c 00 00 00    	je     12a0 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1214:	83 f8 63             	cmp    $0x63,%eax
    1217:	0f 84 13 01 00 00    	je     1330 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    121d:	83 f8 25             	cmp    $0x25,%eax
    1220:	0f 84 e2 00 00 00    	je     1308 <printf+0x188>
  write(fd, &c, 1);
    1226:	b8 01 00 00 00       	mov    $0x1,%eax
    122b:	46                   	inc    %esi
    122c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1230:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1233:	89 44 24 04          	mov    %eax,0x4(%esp)
    1237:	89 3c 24             	mov    %edi,(%esp)
    123a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    123e:	e8 15 fe ff ff       	call   1058 <write>
    1243:	ba 01 00 00 00       	mov    $0x1,%edx
    1248:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    124b:	89 54 24 08          	mov    %edx,0x8(%esp)
    124f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1253:	89 3c 24             	mov    %edi,(%esp)
    1256:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    1259:	e8 fa fd ff ff       	call   1058 <write>
  for(i = 0; fmt[i]; i++){
    125e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1262:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1264:	84 db                	test   %bl,%bl
    1266:	75 80                	jne    11e8 <printf+0x68>
    }
  }
}
    1268:	83 c4 3c             	add    $0x3c,%esp
    126b:	5b                   	pop    %ebx
    126c:	5e                   	pop    %esi
    126d:	5f                   	pop    %edi
    126e:	5d                   	pop    %ebp
    126f:	c3                   	ret    
        printint(fd, *ap, 16, 0);
    1270:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1277:	b9 10 00 00 00       	mov    $0x10,%ecx
    127c:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    127f:	89 f8                	mov    %edi,%eax
    1281:	8b 13                	mov    (%ebx),%edx
    1283:	e8 58 fe ff ff       	call   10e0 <printint>
        ap++;
    1288:	89 d8                	mov    %ebx,%eax
      state = 0;
    128a:	31 d2                	xor    %edx,%edx
        ap++;
    128c:	83 c0 04             	add    $0x4,%eax
    128f:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1292:	e9 44 ff ff ff       	jmp    11db <printf+0x5b>
    1297:	89 f6                	mov    %esi,%esi
    1299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    12a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    12a3:	8b 10                	mov    (%eax),%edx
        ap++;
    12a5:	83 c0 04             	add    $0x4,%eax
    12a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    12ab:	85 d2                	test   %edx,%edx
    12ad:	0f 84 aa 00 00 00    	je     135d <printf+0x1dd>
        while(*s != 0){
    12b3:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
    12b6:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
    12b8:	84 c0                	test   %al,%al
    12ba:	74 27                	je     12e3 <printf+0x163>
    12bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12c0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    12c3:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
    12c8:	43                   	inc    %ebx
  write(fd, &c, 1);
    12c9:	89 44 24 08          	mov    %eax,0x8(%esp)
    12cd:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    12d0:	89 44 24 04          	mov    %eax,0x4(%esp)
    12d4:	89 3c 24             	mov    %edi,(%esp)
    12d7:	e8 7c fd ff ff       	call   1058 <write>
        while(*s != 0){
    12dc:	0f b6 03             	movzbl (%ebx),%eax
    12df:	84 c0                	test   %al,%al
    12e1:	75 dd                	jne    12c0 <printf+0x140>
      state = 0;
    12e3:	31 d2                	xor    %edx,%edx
    12e5:	e9 f1 fe ff ff       	jmp    11db <printf+0x5b>
    12ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    12f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12f7:	b9 0a 00 00 00       	mov    $0xa,%ecx
    12fc:	e9 7b ff ff ff       	jmp    127c <printf+0xfc>
    1301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1308:	b9 01 00 00 00       	mov    $0x1,%ecx
    130d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1310:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1314:	89 44 24 04          	mov    %eax,0x4(%esp)
    1318:	89 3c 24             	mov    %edi,(%esp)
    131b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    131e:	e8 35 fd ff ff       	call   1058 <write>
      state = 0;
    1323:	31 d2                	xor    %edx,%edx
    1325:	e9 b1 fe ff ff       	jmp    11db <printf+0x5b>
    132a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
    1330:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1333:	8b 03                	mov    (%ebx),%eax
        ap++;
    1335:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    1338:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
    133b:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    133e:	b8 01 00 00 00       	mov    $0x1,%eax
    1343:	89 44 24 08          	mov    %eax,0x8(%esp)
    1347:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    134a:	89 44 24 04          	mov    %eax,0x4(%esp)
    134e:	e8 05 fd ff ff       	call   1058 <write>
      state = 0;
    1353:	31 d2                	xor    %edx,%edx
        ap++;
    1355:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1358:	e9 7e fe ff ff       	jmp    11db <printf+0x5b>
          s = "(null)";
    135d:	bb e8 15 00 00       	mov    $0x15e8,%ebx
        while(*s != 0){
    1362:	b0 28                	mov    $0x28,%al
    1364:	e9 57 ff ff ff       	jmp    12c0 <printf+0x140>
    1369:	66 90                	xchg   %ax,%ax
    136b:	66 90                	xchg   %ax,%ax
    136d:	66 90                	xchg   %ax,%ax
    136f:	90                   	nop

00001370 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1370:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1371:	a1 44 1c 00 00       	mov    0x1c44,%eax
{
    1376:	89 e5                	mov    %esp,%ebp
    1378:	57                   	push   %edi
    1379:	56                   	push   %esi
    137a:	53                   	push   %ebx
    137b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    137e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1381:	eb 0d                	jmp    1390 <free+0x20>
    1383:	90                   	nop
    1384:	90                   	nop
    1385:	90                   	nop
    1386:	90                   	nop
    1387:	90                   	nop
    1388:	90                   	nop
    1389:	90                   	nop
    138a:	90                   	nop
    138b:	90                   	nop
    138c:	90                   	nop
    138d:	90                   	nop
    138e:	90                   	nop
    138f:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1390:	39 c8                	cmp    %ecx,%eax
    1392:	8b 10                	mov    (%eax),%edx
    1394:	73 32                	jae    13c8 <free+0x58>
    1396:	39 d1                	cmp    %edx,%ecx
    1398:	72 04                	jb     139e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    139a:	39 d0                	cmp    %edx,%eax
    139c:	72 32                	jb     13d0 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
    139e:	8b 73 fc             	mov    -0x4(%ebx),%esi
    13a1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    13a4:	39 fa                	cmp    %edi,%edx
    13a6:	74 30                	je     13d8 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    13a8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13ab:	8b 50 04             	mov    0x4(%eax),%edx
    13ae:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13b1:	39 f1                	cmp    %esi,%ecx
    13b3:	74 3c                	je     13f1 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    13b5:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    13b7:	5b                   	pop    %ebx
  freep = p;
    13b8:	a3 44 1c 00 00       	mov    %eax,0x1c44
}
    13bd:	5e                   	pop    %esi
    13be:	5f                   	pop    %edi
    13bf:	5d                   	pop    %ebp
    13c0:	c3                   	ret    
    13c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13c8:	39 d0                	cmp    %edx,%eax
    13ca:	72 04                	jb     13d0 <free+0x60>
    13cc:	39 d1                	cmp    %edx,%ecx
    13ce:	72 ce                	jb     139e <free+0x2e>
{
    13d0:	89 d0                	mov    %edx,%eax
    13d2:	eb bc                	jmp    1390 <free+0x20>
    13d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    13d8:	8b 7a 04             	mov    0x4(%edx),%edi
    13db:	01 fe                	add    %edi,%esi
    13dd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    13e0:	8b 10                	mov    (%eax),%edx
    13e2:	8b 12                	mov    (%edx),%edx
    13e4:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13e7:	8b 50 04             	mov    0x4(%eax),%edx
    13ea:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13ed:	39 f1                	cmp    %esi,%ecx
    13ef:	75 c4                	jne    13b5 <free+0x45>
    p->s.size += bp->s.size;
    13f1:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
    13f4:	a3 44 1c 00 00       	mov    %eax,0x1c44
    p->s.size += bp->s.size;
    13f9:	01 ca                	add    %ecx,%edx
    13fb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    13fe:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1401:	89 10                	mov    %edx,(%eax)
}
    1403:	5b                   	pop    %ebx
    1404:	5e                   	pop    %esi
    1405:	5f                   	pop    %edi
    1406:	5d                   	pop    %ebp
    1407:	c3                   	ret    
    1408:	90                   	nop
    1409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001410 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	56                   	push   %esi
    1415:	53                   	push   %ebx
    1416:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1419:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    141c:	8b 15 44 1c 00 00    	mov    0x1c44,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1422:	8d 78 07             	lea    0x7(%eax),%edi
    1425:	c1 ef 03             	shr    $0x3,%edi
    1428:	47                   	inc    %edi
  if((prevp = freep) == 0){
    1429:	85 d2                	test   %edx,%edx
    142b:	0f 84 8f 00 00 00    	je     14c0 <malloc+0xb0>
    1431:	8b 02                	mov    (%edx),%eax
    1433:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1436:	39 cf                	cmp    %ecx,%edi
    1438:	76 66                	jbe    14a0 <malloc+0x90>
    143a:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1440:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1445:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1448:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    144f:	eb 10                	jmp    1461 <malloc+0x51>
    1451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1458:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    145a:	8b 48 04             	mov    0x4(%eax),%ecx
    145d:	39 f9                	cmp    %edi,%ecx
    145f:	73 3f                	jae    14a0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1461:	39 05 44 1c 00 00    	cmp    %eax,0x1c44
    1467:	89 c2                	mov    %eax,%edx
    1469:	75 ed                	jne    1458 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    146b:	89 34 24             	mov    %esi,(%esp)
    146e:	e8 4d fc ff ff       	call   10c0 <sbrk>
  if(p == (char*)-1)
    1473:	83 f8 ff             	cmp    $0xffffffff,%eax
    1476:	74 18                	je     1490 <malloc+0x80>
  hp->s.size = nu;
    1478:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    147b:	83 c0 08             	add    $0x8,%eax
    147e:	89 04 24             	mov    %eax,(%esp)
    1481:	e8 ea fe ff ff       	call   1370 <free>
  return freep;
    1486:	8b 15 44 1c 00 00    	mov    0x1c44,%edx
      if((p = morecore(nunits)) == 0)
    148c:	85 d2                	test   %edx,%edx
    148e:	75 c8                	jne    1458 <malloc+0x48>
        return 0;
  }
}
    1490:	83 c4 1c             	add    $0x1c,%esp
        return 0;
    1493:	31 c0                	xor    %eax,%eax
}
    1495:	5b                   	pop    %ebx
    1496:	5e                   	pop    %esi
    1497:	5f                   	pop    %edi
    1498:	5d                   	pop    %ebp
    1499:	c3                   	ret    
    149a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    14a0:	39 cf                	cmp    %ecx,%edi
    14a2:	74 4c                	je     14f0 <malloc+0xe0>
        p->s.size -= nunits;
    14a4:	29 f9                	sub    %edi,%ecx
    14a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    14a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    14ac:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    14af:	89 15 44 1c 00 00    	mov    %edx,0x1c44
}
    14b5:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
    14b8:	83 c0 08             	add    $0x8,%eax
}
    14bb:	5b                   	pop    %ebx
    14bc:	5e                   	pop    %esi
    14bd:	5f                   	pop    %edi
    14be:	5d                   	pop    %ebp
    14bf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    14c0:	b8 48 1c 00 00       	mov    $0x1c48,%eax
    14c5:	ba 48 1c 00 00       	mov    $0x1c48,%edx
    base.s.size = 0;
    14ca:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
    14cc:	a3 44 1c 00 00       	mov    %eax,0x1c44
    base.s.size = 0;
    14d1:	b8 48 1c 00 00       	mov    $0x1c48,%eax
    base.s.ptr = freep = prevp = &base;
    14d6:	89 15 48 1c 00 00    	mov    %edx,0x1c48
    base.s.size = 0;
    14dc:	89 0d 4c 1c 00 00    	mov    %ecx,0x1c4c
    14e2:	e9 53 ff ff ff       	jmp    143a <malloc+0x2a>
    14e7:	89 f6                	mov    %esi,%esi
    14e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
    14f0:	8b 08                	mov    (%eax),%ecx
    14f2:	89 0a                	mov    %ecx,(%edx)
    14f4:	eb b9                	jmp    14af <malloc+0x9f>
