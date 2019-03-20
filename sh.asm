
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
       9:	eb 0e                	jmp    19 <main+0x19>
       b:	90                   	nop
       c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      10:	83 f8 02             	cmp    $0x2,%eax
      13:	0f 8f 87 00 00 00    	jg     a0 <main+0xa0>
  while((fd = open("console", O_RDWR)) >= 0){
      19:	ba 02 00 00 00       	mov    $0x2,%edx
      1e:	89 54 24 04          	mov    %edx,0x4(%esp)
      22:	c7 04 24 ef 15 00 00 	movl   $0x15ef,(%esp)
      29:	e8 82 10 00 00       	call   10b0 <open>
      2e:	85 c0                	test   %eax,%eax
      30:	79 de                	jns    10 <main+0x10>
      32:	eb 2b                	jmp    5f <main+0x5f>
      34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      38:	80 3d 42 1c 00 00 20 	cmpb   $0x20,0x1c42
      3f:	0f 84 85 00 00 00    	je     ca <main+0xca>
int
fork1(void)
{
  int pid;

  pid = fork();
      45:	e8 16 10 00 00       	call   1060 <fork>
  if(pid == -1)
      4a:	83 f8 ff             	cmp    $0xffffffff,%eax
      4d:	74 45                	je     94 <main+0x94>
    if(fork1() == 0)
      4f:	85 c0                	test   %eax,%eax
      51:	74 63                	je     b6 <main+0xb6>
    wait(null);
      53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      5a:	e8 11 10 00 00       	call   1070 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      5f:	b8 64 00 00 00       	mov    $0x64,%eax
      64:	89 44 24 04          	mov    %eax,0x4(%esp)
      68:	c7 04 24 40 1c 00 00 	movl   $0x1c40,(%esp)
      6f:	e8 0c 01 00 00       	call   180 <getcmd>
      74:	85 c0                	test   %eax,%eax
      76:	78 32                	js     aa <main+0xaa>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      78:	80 3d 40 1c 00 00 63 	cmpb   $0x63,0x1c40
      7f:	75 c4                	jne    45 <main+0x45>
      81:	80 3d 41 1c 00 00 64 	cmpb   $0x64,0x1c41
      88:	74 ae                	je     38 <main+0x38>
  pid = fork();
      8a:	e8 d1 0f 00 00       	call   1060 <fork>
  if(pid == -1)
      8f:	83 f8 ff             	cmp    $0xffffffff,%eax
      92:	75 bb                	jne    4f <main+0x4f>
    panic("fork");
      94:	c7 04 24 78 15 00 00 	movl   $0x1578,(%esp)
      9b:	e8 40 01 00 00       	call   1e0 <panic>
      close(fd);
      a0:	89 04 24             	mov    %eax,(%esp)
      a3:	e8 f0 0f 00 00       	call   1098 <close>
      break;
      a8:	eb b5                	jmp    5f <main+0x5f>
  exit(0);
      aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      b1:	e8 b2 0f 00 00       	call   1068 <exit>
      runcmd(parsecmd(buf));
      b6:	c7 04 24 40 1c 00 00 	movl   $0x1c40,(%esp)
      bd:	e8 fe 0c 00 00       	call   dc0 <parsecmd>
      c2:	89 04 24             	mov    %eax,(%esp)
      c5:	e8 46 01 00 00       	call   210 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      ca:	c7 04 24 40 1c 00 00 	movl   $0x1c40,(%esp)
      d1:	e8 ca 0d 00 00       	call   ea0 <strlen>
      if(chdir(buf+3) < 0)
      d6:	c7 04 24 43 1c 00 00 	movl   $0x1c43,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      dd:	c6 80 3f 1c 00 00 00 	movb   $0x0,0x1c3f(%eax)
      if(chdir(buf+3) < 0)
      e4:	e8 f7 0f 00 00       	call   10e0 <chdir>
      e9:	85 c0                	test   %eax,%eax
      eb:	0f 89 6e ff ff ff    	jns    5f <main+0x5f>
        printf(2, "cannot cd %s\n", buf+3);
      f1:	c7 44 24 08 43 1c 00 	movl   $0x1c43,0x8(%esp)
      f8:	00 
      f9:	c7 44 24 04 f7 15 00 	movl   $0x15f7,0x4(%esp)
     100:	00 
     101:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     108:	e8 c3 10 00 00       	call   11d0 <printf>
     10d:	e9 4d ff ff ff       	jmp    5f <main+0x5f>
     112:	66 90                	xchg   %ax,%ax
     114:	66 90                	xchg   %ax,%ax
     116:	66 90                	xchg   %ax,%ax
     118:	66 90                	xchg   %ax,%ax
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <strcat>:
void strcat(char* buffer,char* str1,char* str2){
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	8b 45 08             	mov    0x8(%ebp),%eax
     126:	53                   	push   %ebx
     127:	8b 4d 10             	mov    0x10(%ebp),%ecx
     12a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*tmp != '\0'){
     12d:	80 38 00             	cmpb   $0x0,(%eax)
     130:	74 22                	je     154 <strcat+0x34>
     132:	89 c2                	mov    %eax,%edx
     134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *tmp = '\0';
     140:	c6 02 00             	movb   $0x0,(%edx)
    tmp++;
     143:	42                   	inc    %edx
  while(*tmp != '\0'){
     144:	80 3a 00             	cmpb   $0x0,(%edx)
     147:	75 f7                	jne    140 <strcat+0x20>
  while(*str1 != '\0'){
     149:	0f b6 13             	movzbl (%ebx),%edx
     14c:	84 d2                	test   %dl,%dl
     14e:	74 24                	je     174 <strcat+0x54>
    *tmp = *str1;
     150:	88 10                	mov    %dl,(%eax)
    str1++;
     152:	43                   	inc    %ebx
    tmp++;
     153:	40                   	inc    %eax
  while(*str1 != '\0'){
     154:	0f b6 13             	movzbl (%ebx),%edx
     157:	84 d2                	test   %dl,%dl
     159:	75 f5                	jne    150 <strcat+0x30>
  while(*str2 != '\0'){
     15b:	0f b6 11             	movzbl (%ecx),%edx
     15e:	84 d2                	test   %dl,%dl
     160:	74 19                	je     17b <strcat+0x5b>
     162:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    *tmp = *str2;
     170:	88 10                	mov    %dl,(%eax)
    str2++;
     172:	41                   	inc    %ecx
    tmp++;
     173:	40                   	inc    %eax
  while(*str2 != '\0'){
     174:	0f b6 11             	movzbl (%ecx),%edx
     177:	84 d2                	test   %dl,%dl
     179:	75 f5                	jne    170 <strcat+0x50>
}
     17b:	5b                   	pop    %ebx
     17c:	5d                   	pop    %ebp
     17d:	c3                   	ret    
     17e:	66 90                	xchg   %ax,%ax

00000180 <getcmd>:
{
     180:	55                   	push   %ebp
  printf(2, "$ ");
     181:	b8 48 15 00 00       	mov    $0x1548,%eax
{
     186:	89 e5                	mov    %esp,%ebp
     188:	83 ec 18             	sub    $0x18,%esp
     18b:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     18e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     191:	89 75 fc             	mov    %esi,-0x4(%ebp)
     194:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     197:	89 44 24 04          	mov    %eax,0x4(%esp)
     19b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1a2:	e8 29 10 00 00       	call   11d0 <printf>
  memset(buf, 0, nbuf);
     1a7:	31 d2                	xor    %edx,%edx
     1a9:	89 74 24 08          	mov    %esi,0x8(%esp)
     1ad:	89 54 24 04          	mov    %edx,0x4(%esp)
     1b1:	89 1c 24             	mov    %ebx,(%esp)
     1b4:	e8 17 0d 00 00       	call   ed0 <memset>
  gets(buf, nbuf);
     1b9:	89 74 24 04          	mov    %esi,0x4(%esp)
     1bd:	89 1c 24             	mov    %ebx,(%esp)
     1c0:	e8 5b 0d 00 00       	call   f20 <gets>
  if(buf[0] == 0) // EOF
     1c5:	31 c0                	xor    %eax,%eax
}
     1c7:	8b 75 fc             	mov    -0x4(%ebp),%esi
  if(buf[0] == 0) // EOF
     1ca:	80 3b 00             	cmpb   $0x0,(%ebx)
}
     1cd:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  if(buf[0] == 0) // EOF
     1d0:	0f 94 c0             	sete   %al
}
     1d3:	89 ec                	mov    %ebp,%esp
  if(buf[0] == 0) // EOF
     1d5:	f7 d8                	neg    %eax
}
     1d7:	5d                   	pop    %ebp
     1d8:	c3                   	ret    
     1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <panic>:
{
     1e0:	55                   	push   %ebp
     1e1:	89 e5                	mov    %esp,%ebp
     1e3:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     1e6:	8b 45 08             	mov    0x8(%ebp),%eax
     1e9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1f0:	89 44 24 08          	mov    %eax,0x8(%esp)
     1f4:	b8 eb 15 00 00       	mov    $0x15eb,%eax
     1f9:	89 44 24 04          	mov    %eax,0x4(%esp)
     1fd:	e8 ce 0f 00 00       	call   11d0 <printf>
  exit(0);
     202:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     209:	e8 5a 0e 00 00       	call   1068 <exit>
     20e:	66 90                	xchg   %ax,%ax

00000210 <runcmd>:
{
     210:	55                   	push   %ebp
     211:	89 e5                	mov    %esp,%ebp
     213:	57                   	push   %edi
     214:	56                   	push   %esi
     215:	53                   	push   %ebx
     216:	81 ec 3c 08 00 00    	sub    $0x83c,%esp
     21c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     21f:	85 db                	test   %ebx,%ebx
     221:	74 5d                	je     280 <runcmd+0x70>
  switch(cmd->type){
     223:	83 3b 05             	cmpl   $0x5,(%ebx)
     226:	0f 87 f5 01 00 00    	ja     421 <runcmd+0x211>
     22c:	8b 03                	mov    (%ebx),%eax
     22e:	ff 24 85 08 16 00 00 	jmp    *0x1608(,%eax,4)
    close(rcmd->fd);
     235:	8b 43 14             	mov    0x14(%ebx),%eax
     238:	89 04 24             	mov    %eax,(%esp)
     23b:	e8 58 0e 00 00       	call   1098 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     240:	8b 43 10             	mov    0x10(%ebx),%eax
     243:	89 44 24 04          	mov    %eax,0x4(%esp)
     247:	8b 43 08             	mov    0x8(%ebx),%eax
     24a:	89 04 24             	mov    %eax,(%esp)
     24d:	e8 5e 0e 00 00       	call   10b0 <open>
     252:	85 c0                	test   %eax,%eax
     254:	79 48                	jns    29e <runcmd+0x8e>
      printf(2, "open %s failed\n", rcmd->file);
     256:	8b 43 08             	mov    0x8(%ebx),%eax
     259:	c7 44 24 04 68 15 00 	movl   $0x1568,0x4(%esp)
     260:	00 
     261:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     268:	89 44 24 08          	mov    %eax,0x8(%esp)
     26c:	e8 5f 0f 00 00       	call   11d0 <printf>
     271:	eb 0d                	jmp    280 <runcmd+0x70>
     273:	90                   	nop
     274:	90                   	nop
     275:	90                   	nop
     276:	90                   	nop
     277:	90                   	nop
     278:	90                   	nop
     279:	90                   	nop
     27a:	90                   	nop
     27b:	90                   	nop
     27c:	90                   	nop
     27d:	90                   	nop
     27e:	90                   	nop
     27f:	90                   	nop
      exit(0);
     280:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     287:	e8 dc 0d 00 00       	call   1068 <exit>
  pid = fork();
     28c:	e8 cf 0d 00 00       	call   1060 <fork>
  if(pid == -1)
     291:	83 f8 ff             	cmp    $0xffffffff,%eax
     294:	0f 84 93 01 00 00    	je     42d <runcmd+0x21d>
    if(fork1() == 0)
     29a:	85 c0                	test   %eax,%eax
     29c:	75 e2                	jne    280 <runcmd+0x70>
      runcmd(bcmd->cmd);
     29e:	8b 43 04             	mov    0x4(%ebx),%eax
     2a1:	89 04 24             	mov    %eax,(%esp)
     2a4:	e8 67 ff ff ff       	call   210 <runcmd>
    if(ecmd->argv[0] == 0)
     2a9:	8b 43 04             	mov    0x4(%ebx),%eax
     2ac:	85 c0                	test   %eax,%eax
     2ae:	74 d0                	je     280 <runcmd+0x70>
    if((fd = open(ecmd->argv[0], O_RDONLY)) >= 0){
     2b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2b7:	00 
     2b8:	89 04 24             	mov    %eax,(%esp)
     2bb:	e8 f0 0d 00 00       	call   10b0 <open>
     2c0:	85 c0                	test   %eax,%eax
     2c2:	89 c2                	mov    %eax,%edx
     2c4:	78 26                	js     2ec <runcmd+0xdc>
          close(fd);
     2c6:	89 04 24             	mov    %eax,(%esp)
     2c9:	89 85 d4 f7 ff ff    	mov    %eax,-0x82c(%ebp)
     2cf:	e8 c4 0d 00 00       	call   1098 <close>
          exec(ecmd->argv[0], ecmd->argv);
     2d4:	8d 43 04             	lea    0x4(%ebx),%eax
     2d7:	89 44 24 04          	mov    %eax,0x4(%esp)
     2db:	8b 43 04             	mov    0x4(%ebx),%eax
     2de:	89 04 24             	mov    %eax,(%esp)
     2e1:	e8 c2 0d 00 00       	call   10a8 <exec>
     2e6:	8b 95 d4 f7 ff ff    	mov    -0x82c(%ebp),%edx
    if((pathFD = open("/path", O_RDONLY)) < 0){
     2ec:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2f3:	00 
     2f4:	c7 04 24 52 15 00 00 	movl   $0x1552,(%esp)
     2fb:	89 95 d4 f7 ff ff    	mov    %edx,-0x82c(%ebp)
     301:	e8 aa 0d 00 00       	call   10b0 <open>
     306:	8b 95 d4 f7 ff ff    	mov    -0x82c(%ebp),%edx
     30c:	85 c0                	test   %eax,%eax
     30e:	89 c6                	mov    %eax,%esi
     310:	0f 88 2b 01 00 00    	js     441 <runcmd+0x231>
    if((readCount=read(pathFD, buffer, 1024)) < 0){
     316:	8d 85 e8 f7 ff ff    	lea    -0x818(%ebp),%eax
     31c:	c7 44 24 08 00 04 00 	movl   $0x400,0x8(%esp)
     323:	00 
     324:	89 44 24 04          	mov    %eax,0x4(%esp)
     328:	89 34 24             	mov    %esi,(%esp)
     32b:	89 95 d4 f7 ff ff    	mov    %edx,-0x82c(%ebp)
     331:	e8 52 0d 00 00       	call   1088 <read>
     336:	85 c0                	test   %eax,%eax
     338:	0f 88 fb 00 00 00    	js     439 <runcmd+0x229>
     33e:	8b 95 d4 f7 ff ff    	mov    -0x82c(%ebp),%edx
          exec(tmpBuffer, ecmd->argv);
     344:	8d 4b 04             	lea    0x4(%ebx),%ecx
    if((readCount=read(pathFD, buffer, 1024)) < 0){
     347:	8d b5 e8 f7 ff ff    	lea    -0x818(%ebp),%esi
     34d:	89 5d 08             	mov    %ebx,0x8(%ebp)
    currPath = buffer;
     350:	89 f7                	mov    %esi,%edi
     352:	89 c3                	mov    %eax,%ebx
          exec(tmpBuffer, ecmd->argv);
     354:	89 8d d0 f7 ff ff    	mov    %ecx,-0x830(%ebp)
    for(int i = 0; i < readCount; i++){
     35a:	89 f0                	mov    %esi,%eax
     35c:	8d 8d e8 f7 ff ff    	lea    -0x818(%ebp),%ecx
     362:	29 c8                	sub    %ecx,%eax
     364:	39 c3                	cmp    %eax,%ebx
     366:	0f 8e d3 01 00 00    	jle    53f <runcmd+0x32f>
      if(buffer[i] == ':'){
     36c:	80 3e 3a             	cmpb   $0x3a,(%esi)
     36f:	8d 46 01             	lea    0x1(%esi),%eax
     372:	0f 84 e9 00 00 00    	je     461 <runcmd+0x251>
     378:	89 c6                	mov    %eax,%esi
     37a:	eb de                	jmp    35a <runcmd+0x14a>
    if(pipe(p) < 0)
     37c:	8d 85 e0 f7 ff ff    	lea    -0x820(%ebp),%eax
     382:	89 04 24             	mov    %eax,(%esp)
     385:	e8 f6 0c 00 00       	call   1080 <pipe>
     38a:	85 c0                	test   %eax,%eax
     38c:	0f 88 a1 01 00 00    	js     533 <runcmd+0x323>
  pid = fork();
     392:	e8 c9 0c 00 00       	call   1060 <fork>
  if(pid == -1)
     397:	83 f8 ff             	cmp    $0xffffffff,%eax
     39a:	0f 84 8d 00 00 00    	je     42d <runcmd+0x21d>
    if(fork1() == 0){
     3a0:	85 c0                	test   %eax,%eax
     3a2:	0f 84 a2 01 00 00    	je     54a <runcmd+0x33a>
  pid = fork();
     3a8:	e8 b3 0c 00 00       	call   1060 <fork>
  if(pid == -1)
     3ad:	83 f8 ff             	cmp    $0xffffffff,%eax
     3b0:	74 7b                	je     42d <runcmd+0x21d>
    if(fork1() == 0){
     3b2:	85 c0                	test   %eax,%eax
     3b4:	0f 84 38 01 00 00    	je     4f2 <runcmd+0x2e2>
    close(p[0]);
     3ba:	8b 85 e0 f7 ff ff    	mov    -0x820(%ebp),%eax
     3c0:	89 04 24             	mov    %eax,(%esp)
     3c3:	e8 d0 0c 00 00       	call   1098 <close>
    close(p[1]);
     3c8:	8b 85 e4 f7 ff ff    	mov    -0x81c(%ebp),%eax
     3ce:	89 04 24             	mov    %eax,(%esp)
     3d1:	e8 c2 0c 00 00       	call   1098 <close>
    wait(null);
     3d6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3dd:	e8 8e 0c 00 00       	call   1070 <wait>
    wait(null);
     3e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3e9:	e8 82 0c 00 00       	call   1070 <wait>
    break;
     3ee:	e9 8d fe ff ff       	jmp    280 <runcmd+0x70>
  pid = fork();
     3f3:	e8 68 0c 00 00       	call   1060 <fork>
  if(pid == -1)
     3f8:	83 f8 ff             	cmp    $0xffffffff,%eax
     3fb:	90                   	nop
     3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     400:	74 2b                	je     42d <runcmd+0x21d>
    if(fork1() == 0)
     402:	85 c0                	test   %eax,%eax
     404:	0f 84 94 fe ff ff    	je     29e <runcmd+0x8e>
    wait(null);
     40a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     411:	e8 5a 0c 00 00       	call   1070 <wait>
    runcmd(lcmd->right);
     416:	8b 43 08             	mov    0x8(%ebx),%eax
     419:	89 04 24             	mov    %eax,(%esp)
     41c:	e8 ef fd ff ff       	call   210 <runcmd>
    panic("runcmd");
     421:	c7 04 24 4b 15 00 00 	movl   $0x154b,(%esp)
     428:	e8 b3 fd ff ff       	call   1e0 <panic>
    panic("fork");
     42d:	c7 04 24 78 15 00 00 	movl   $0x1578,(%esp)
     434:	e8 a7 fd ff ff       	call   1e0 <panic>
      close(pathFD);
     439:	89 34 24             	mov    %esi,(%esp)
    close(fd);
     43c:	e8 57 0c 00 00       	call   1098 <close>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     441:	8b 43 04             	mov    0x4(%ebx),%eax
     444:	c7 44 24 04 58 15 00 	movl   $0x1558,0x4(%esp)
     44b:	00 
     44c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     453:	89 44 24 08          	mov    %eax,0x8(%esp)
     457:	e8 74 0d 00 00       	call   11d0 <printf>
    break;
     45c:	e9 1f fe ff ff       	jmp    280 <runcmd+0x70>
        strcat(tmpBuffer, currPath, ecmd->argv[0]);
     461:	8b 45 08             	mov    0x8(%ebp),%eax
        buffer[i] = '\0';
     464:	c6 06 00             	movb   $0x0,(%esi)
        strcat(tmpBuffer, currPath, ecmd->argv[0]);
     467:	8b 48 04             	mov    0x4(%eax),%ecx
  char* tmp = buffer;
     46a:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     470:	eb 04                	jmp    476 <runcmd+0x266>
    *tmp = '\0';
     472:	c6 00 00             	movb   $0x0,(%eax)
    tmp++;
     475:	40                   	inc    %eax
  while(*tmp != '\0'){
     476:	80 38 00             	cmpb   $0x0,(%eax)
     479:	75 f7                	jne    472 <runcmd+0x262>
  tmp = buffer;
     47b:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     481:	eb 04                	jmp    487 <runcmd+0x277>
    *tmp = *str1;
     483:	88 10                	mov    %dl,(%eax)
    str1++;
     485:	47                   	inc    %edi
    tmp++;
     486:	40                   	inc    %eax
  while(*str1 != '\0'){
     487:	0f b6 17             	movzbl (%edi),%edx
     48a:	84 d2                	test   %dl,%dl
     48c:	75 f5                	jne    483 <runcmd+0x273>
     48e:	31 ff                	xor    %edi,%edi
     490:	eb 04                	jmp    496 <runcmd+0x286>
    *tmp = *str2;
     492:	88 14 38             	mov    %dl,(%eax,%edi,1)
     495:	47                   	inc    %edi
  while(*str2 != '\0'){
     496:	0f b6 14 39          	movzbl (%ecx,%edi,1),%edx
     49a:	84 d2                	test   %dl,%dl
     49c:	75 f4                	jne    492 <runcmd+0x282>
        if((fd = open(tmpBuffer, O_RDONLY)) >= 0){
     49e:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     4a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4ab:	00 
     4ac:	89 04 24             	mov    %eax,(%esp)
     4af:	e8 fc 0b 00 00       	call   10b0 <open>
     4b4:	85 c0                	test   %eax,%eax
     4b6:	89 c2                	mov    %eax,%edx
     4b8:	78 2c                	js     4e6 <runcmd+0x2d6>
          close(fd);
     4ba:	89 04 24             	mov    %eax,(%esp)
     4bd:	89 85 d4 f7 ff ff    	mov    %eax,-0x82c(%ebp)
     4c3:	e8 d0 0b 00 00       	call   1098 <close>
          exec(tmpBuffer, ecmd->argv);
     4c8:	8b 85 d0 f7 ff ff    	mov    -0x830(%ebp),%eax
     4ce:	89 44 24 04          	mov    %eax,0x4(%esp)
     4d2:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
     4d8:	89 04 24             	mov    %eax,(%esp)
     4db:	e8 c8 0b 00 00       	call   10a8 <exec>
     4e0:	8b 95 d4 f7 ff ff    	mov    -0x82c(%ebp),%edx
     4e6:	8d 46 01             	lea    0x1(%esi),%eax
     4e9:	89 c7                	mov    %eax,%edi
     4eb:	89 c6                	mov    %eax,%esi
     4ed:	e9 68 fe ff ff       	jmp    35a <runcmd+0x14a>
      close(0);
     4f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     4f9:	e8 9a 0b 00 00       	call   1098 <close>
      dup(p[0]);
     4fe:	8b 85 e0 f7 ff ff    	mov    -0x820(%ebp),%eax
     504:	89 04 24             	mov    %eax,(%esp)
     507:	e8 dc 0b 00 00       	call   10e8 <dup>
      close(p[0]);
     50c:	8b 85 e0 f7 ff ff    	mov    -0x820(%ebp),%eax
     512:	89 04 24             	mov    %eax,(%esp)
     515:	e8 7e 0b 00 00       	call   1098 <close>
      close(p[1]);
     51a:	8b 85 e4 f7 ff ff    	mov    -0x81c(%ebp),%eax
     520:	89 04 24             	mov    %eax,(%esp)
     523:	e8 70 0b 00 00       	call   1098 <close>
      runcmd(pcmd->right);
     528:	8b 43 08             	mov    0x8(%ebx),%eax
     52b:	89 04 24             	mov    %eax,(%esp)
     52e:	e8 dd fc ff ff       	call   210 <runcmd>
      panic("pipe");
     533:	c7 04 24 7d 15 00 00 	movl   $0x157d,(%esp)
     53a:	e8 a1 fc ff ff       	call   1e0 <panic>
     53f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    close(fd);
     542:	89 14 24             	mov    %edx,(%esp)
     545:	e9 f2 fe ff ff       	jmp    43c <runcmd+0x22c>
      close(1);
     54a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     551:	e8 42 0b 00 00       	call   1098 <close>
      dup(p[1]);
     556:	8b 85 e4 f7 ff ff    	mov    -0x81c(%ebp),%eax
     55c:	89 04 24             	mov    %eax,(%esp)
     55f:	e8 84 0b 00 00       	call   10e8 <dup>
      close(p[0]);
     564:	8b 85 e0 f7 ff ff    	mov    -0x820(%ebp),%eax
     56a:	89 04 24             	mov    %eax,(%esp)
     56d:	e8 26 0b 00 00       	call   1098 <close>
      close(p[1]);
     572:	8b 85 e4 f7 ff ff    	mov    -0x81c(%ebp),%eax
     578:	89 04 24             	mov    %eax,(%esp)
     57b:	e8 18 0b 00 00       	call   1098 <close>
      runcmd(pcmd->left);
     580:	8b 43 04             	mov    0x4(%ebx),%eax
     583:	89 04 24             	mov    %eax,(%esp)
     586:	e8 85 fc ff ff       	call   210 <runcmd>
     58b:	90                   	nop
     58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <fork1>:
{
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	83 ec 18             	sub    $0x18,%esp
  pid = fork();
     596:	e8 c5 0a 00 00       	call   1060 <fork>
  if(pid == -1)
     59b:	83 f8 ff             	cmp    $0xffffffff,%eax
     59e:	74 02                	je     5a2 <fork1+0x12>
  return pid;
}
     5a0:	c9                   	leave  
     5a1:	c3                   	ret    
    panic("fork");
     5a2:	c7 04 24 78 15 00 00 	movl   $0x1578,(%esp)
     5a9:	e8 32 fc ff ff       	call   1e0 <panic>
     5ae:	66 90                	xchg   %ax,%ax

000005b0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     5b0:	55                   	push   %ebp
     5b1:	89 e5                	mov    %esp,%ebp
     5b3:	53                   	push   %ebx
     5b4:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5b7:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     5be:	e8 9d 0e 00 00       	call   1460 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5c3:	31 d2                	xor    %edx,%edx
     5c5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     5c9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5cb:	b8 54 00 00 00       	mov    $0x54,%eax
     5d0:	89 1c 24             	mov    %ebx,(%esp)
     5d3:	89 44 24 08          	mov    %eax,0x8(%esp)
     5d7:	e8 f4 08 00 00       	call   ed0 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     5dc:	89 d8                	mov    %ebx,%eax
  cmd->type = EXEC;
     5de:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
     5e4:	83 c4 14             	add    $0x14,%esp
     5e7:	5b                   	pop    %ebx
     5e8:	5d                   	pop    %ebp
     5e9:	c3                   	ret    
     5ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000005f0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     5f0:	55                   	push   %ebp
     5f1:	89 e5                	mov    %esp,%ebp
     5f3:	53                   	push   %ebx
     5f4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5f7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     5fe:	e8 5d 0e 00 00       	call   1460 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     603:	31 d2                	xor    %edx,%edx
     605:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     609:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     60b:	b8 18 00 00 00       	mov    $0x18,%eax
     610:	89 1c 24             	mov    %ebx,(%esp)
     613:	89 44 24 08          	mov    %eax,0x8(%esp)
     617:	e8 b4 08 00 00       	call   ed0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     61c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     61f:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     625:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     628:	8b 45 0c             	mov    0xc(%ebp),%eax
     62b:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     62e:	8b 45 10             	mov    0x10(%ebp),%eax
     631:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     634:	8b 45 14             	mov    0x14(%ebp),%eax
     637:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     63a:	8b 45 18             	mov    0x18(%ebp),%eax
     63d:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     640:	83 c4 14             	add    $0x14,%esp
     643:	89 d8                	mov    %ebx,%eax
     645:	5b                   	pop    %ebx
     646:	5d                   	pop    %ebp
     647:	c3                   	ret    
     648:	90                   	nop
     649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000650 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	53                   	push   %ebx
     654:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     657:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     65e:	e8 fd 0d 00 00       	call   1460 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     663:	31 d2                	xor    %edx,%edx
     665:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     669:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     66b:	b8 0c 00 00 00       	mov    $0xc,%eax
     670:	89 1c 24             	mov    %ebx,(%esp)
     673:	89 44 24 08          	mov    %eax,0x8(%esp)
     677:	e8 54 08 00 00       	call   ed0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     67c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     67f:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     685:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     688:	8b 45 0c             	mov    0xc(%ebp),%eax
     68b:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     68e:	83 c4 14             	add    $0x14,%esp
     691:	89 d8                	mov    %ebx,%eax
     693:	5b                   	pop    %ebx
     694:	5d                   	pop    %ebp
     695:	c3                   	ret    
     696:	8d 76 00             	lea    0x0(%esi),%esi
     699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006a0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     6a0:	55                   	push   %ebp
     6a1:	89 e5                	mov    %esp,%ebp
     6a3:	53                   	push   %ebx
     6a4:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6a7:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     6ae:	e8 ad 0d 00 00       	call   1460 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6b3:	31 d2                	xor    %edx,%edx
     6b5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     6b9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     6bb:	b8 0c 00 00 00       	mov    $0xc,%eax
     6c0:	89 1c 24             	mov    %ebx,(%esp)
     6c3:	89 44 24 08          	mov    %eax,0x8(%esp)
     6c7:	e8 04 08 00 00       	call   ed0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     6cc:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     6cf:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     6d5:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     6d8:	8b 45 0c             	mov    0xc(%ebp),%eax
     6db:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     6de:	83 c4 14             	add    $0x14,%esp
     6e1:	89 d8                	mov    %ebx,%eax
     6e3:	5b                   	pop    %ebx
     6e4:	5d                   	pop    %ebp
     6e5:	c3                   	ret    
     6e6:	8d 76 00             	lea    0x0(%esi),%esi
     6e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006f0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	53                   	push   %ebx
     6f4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6f7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     6fe:	e8 5d 0d 00 00       	call   1460 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     703:	31 d2                	xor    %edx,%edx
     705:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     709:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     70b:	b8 08 00 00 00       	mov    $0x8,%eax
     710:	89 1c 24             	mov    %ebx,(%esp)
     713:	89 44 24 08          	mov    %eax,0x8(%esp)
     717:	e8 b4 07 00 00       	call   ed0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     71c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     71f:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     725:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     728:	83 c4 14             	add    $0x14,%esp
     72b:	89 d8                	mov    %ebx,%eax
     72d:	5b                   	pop    %ebx
     72e:	5d                   	pop    %ebp
     72f:	c3                   	ret    

00000730 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     730:	55                   	push   %ebp
     731:	89 e5                	mov    %esp,%ebp
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	53                   	push   %ebx
     736:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     739:	8b 45 08             	mov    0x8(%ebp),%eax
{
     73c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     73f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     742:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     744:	39 de                	cmp    %ebx,%esi
     746:	72 0d                	jb     755 <gettoken+0x25>
     748:	eb 22                	jmp    76c <gettoken+0x3c>
     74a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     750:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     751:	39 f3                	cmp    %esi,%ebx
     753:	74 17                	je     76c <gettoken+0x3c>
     755:	0f be 06             	movsbl (%esi),%eax
     758:	c7 04 24 1c 1c 00 00 	movl   $0x1c1c,(%esp)
     75f:	89 44 24 04          	mov    %eax,0x4(%esp)
     763:	e8 88 07 00 00       	call   ef0 <strchr>
     768:	85 c0                	test   %eax,%eax
     76a:	75 e4                	jne    750 <gettoken+0x20>
  if(q)
     76c:	85 ff                	test   %edi,%edi
     76e:	74 02                	je     772 <gettoken+0x42>
    *q = s;
     770:	89 37                	mov    %esi,(%edi)
  ret = *s;
     772:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     775:	3c 29                	cmp    $0x29,%al
     777:	7f 57                	jg     7d0 <gettoken+0xa0>
     779:	3c 28                	cmp    $0x28,%al
     77b:	0f 8d cb 00 00 00    	jge    84c <gettoken+0x11c>
     781:	31 ff                	xor    %edi,%edi
     783:	84 c0                	test   %al,%al
     785:	0f 85 cd 00 00 00    	jne    858 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     78b:	8b 55 14             	mov    0x14(%ebp),%edx
     78e:	85 d2                	test   %edx,%edx
     790:	74 05                	je     797 <gettoken+0x67>
    *eq = s;
     792:	8b 45 14             	mov    0x14(%ebp),%eax
     795:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     797:	39 de                	cmp    %ebx,%esi
     799:	72 0a                	jb     7a5 <gettoken+0x75>
     79b:	eb 1f                	jmp    7bc <gettoken+0x8c>
     79d:	8d 76 00             	lea    0x0(%esi),%esi
    s++;
     7a0:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     7a1:	39 f3                	cmp    %esi,%ebx
     7a3:	74 17                	je     7bc <gettoken+0x8c>
     7a5:	0f be 06             	movsbl (%esi),%eax
     7a8:	c7 04 24 1c 1c 00 00 	movl   $0x1c1c,(%esp)
     7af:	89 44 24 04          	mov    %eax,0x4(%esp)
     7b3:	e8 38 07 00 00       	call   ef0 <strchr>
     7b8:	85 c0                	test   %eax,%eax
     7ba:	75 e4                	jne    7a0 <gettoken+0x70>
  *ps = s;
     7bc:	8b 45 08             	mov    0x8(%ebp),%eax
     7bf:	89 30                	mov    %esi,(%eax)
  return ret;
}
     7c1:	83 c4 1c             	add    $0x1c,%esp
     7c4:	89 f8                	mov    %edi,%eax
     7c6:	5b                   	pop    %ebx
     7c7:	5e                   	pop    %esi
     7c8:	5f                   	pop    %edi
     7c9:	5d                   	pop    %ebp
     7ca:	c3                   	ret    
     7cb:	90                   	nop
     7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     7d0:	3c 3e                	cmp    $0x3e,%al
     7d2:	75 1c                	jne    7f0 <gettoken+0xc0>
    if(*s == '>'){
     7d4:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
    s++;
     7d8:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '>'){
     7db:	0f 84 94 00 00 00    	je     875 <gettoken+0x145>
    s++;
     7e1:	89 c6                	mov    %eax,%esi
     7e3:	bf 3e 00 00 00       	mov    $0x3e,%edi
     7e8:	eb a1                	jmp    78b <gettoken+0x5b>
     7ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  switch(*s){
     7f0:	7f 56                	jg     848 <gettoken+0x118>
     7f2:	88 c1                	mov    %al,%cl
     7f4:	80 e9 3b             	sub    $0x3b,%cl
     7f7:	80 f9 01             	cmp    $0x1,%cl
     7fa:	76 50                	jbe    84c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     7fc:	39 f3                	cmp    %esi,%ebx
     7fe:	77 27                	ja     827 <gettoken+0xf7>
     800:	eb 5e                	jmp    860 <gettoken+0x130>
     802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     808:	0f be 06             	movsbl (%esi),%eax
     80b:	c7 04 24 14 1c 00 00 	movl   $0x1c14,(%esp)
     812:	89 44 24 04          	mov    %eax,0x4(%esp)
     816:	e8 d5 06 00 00       	call   ef0 <strchr>
     81b:	85 c0                	test   %eax,%eax
     81d:	75 1c                	jne    83b <gettoken+0x10b>
      s++;
     81f:	46                   	inc    %esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     820:	39 f3                	cmp    %esi,%ebx
     822:	74 3c                	je     860 <gettoken+0x130>
     824:	0f be 06             	movsbl (%esi),%eax
     827:	89 44 24 04          	mov    %eax,0x4(%esp)
     82b:	c7 04 24 1c 1c 00 00 	movl   $0x1c1c,(%esp)
     832:	e8 b9 06 00 00       	call   ef0 <strchr>
     837:	85 c0                	test   %eax,%eax
     839:	74 cd                	je     808 <gettoken+0xd8>
    ret = 'a';
     83b:	bf 61 00 00 00       	mov    $0x61,%edi
     840:	e9 46 ff ff ff       	jmp    78b <gettoken+0x5b>
     845:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     848:	3c 7c                	cmp    $0x7c,%al
     84a:	75 b0                	jne    7fc <gettoken+0xcc>
  ret = *s;
     84c:	0f be f8             	movsbl %al,%edi
    s++;
     84f:	46                   	inc    %esi
    break;
     850:	e9 36 ff ff ff       	jmp    78b <gettoken+0x5b>
     855:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     858:	3c 26                	cmp    $0x26,%al
     85a:	75 a0                	jne    7fc <gettoken+0xcc>
     85c:	eb ee                	jmp    84c <gettoken+0x11c>
     85e:	66 90                	xchg   %ax,%ax
  if(eq)
     860:	8b 45 14             	mov    0x14(%ebp),%eax
     863:	bf 61 00 00 00       	mov    $0x61,%edi
     868:	85 c0                	test   %eax,%eax
     86a:	0f 85 22 ff ff ff    	jne    792 <gettoken+0x62>
     870:	e9 47 ff ff ff       	jmp    7bc <gettoken+0x8c>
      s++;
     875:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     878:	bf 2b 00 00 00       	mov    $0x2b,%edi
     87d:	e9 09 ff ff ff       	jmp    78b <gettoken+0x5b>
     882:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000890 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	83 ec 1c             	sub    $0x1c,%esp
     899:	8b 7d 08             	mov    0x8(%ebp),%edi
     89c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     89f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     8a1:	39 f3                	cmp    %esi,%ebx
     8a3:	72 10                	jb     8b5 <peek+0x25>
     8a5:	eb 25                	jmp    8cc <peek+0x3c>
     8a7:	89 f6                	mov    %esi,%esi
     8a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     8b0:	43                   	inc    %ebx
  while(s < es && strchr(whitespace, *s))
     8b1:	39 de                	cmp    %ebx,%esi
     8b3:	74 17                	je     8cc <peek+0x3c>
     8b5:	0f be 03             	movsbl (%ebx),%eax
     8b8:	c7 04 24 1c 1c 00 00 	movl   $0x1c1c,(%esp)
     8bf:	89 44 24 04          	mov    %eax,0x4(%esp)
     8c3:	e8 28 06 00 00       	call   ef0 <strchr>
     8c8:	85 c0                	test   %eax,%eax
     8ca:	75 e4                	jne    8b0 <peek+0x20>
  *ps = s;
     8cc:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     8ce:	31 c0                	xor    %eax,%eax
     8d0:	0f be 13             	movsbl (%ebx),%edx
     8d3:	84 d2                	test   %dl,%dl
     8d5:	74 17                	je     8ee <peek+0x5e>
     8d7:	8b 45 10             	mov    0x10(%ebp),%eax
     8da:	89 54 24 04          	mov    %edx,0x4(%esp)
     8de:	89 04 24             	mov    %eax,(%esp)
     8e1:	e8 0a 06 00 00       	call   ef0 <strchr>
     8e6:	85 c0                	test   %eax,%eax
     8e8:	0f 95 c0             	setne  %al
     8eb:	0f b6 c0             	movzbl %al,%eax
}
     8ee:	83 c4 1c             	add    $0x1c,%esp
     8f1:	5b                   	pop    %ebx
     8f2:	5e                   	pop    %esi
     8f3:	5f                   	pop    %edi
     8f4:	5d                   	pop    %ebp
     8f5:	c3                   	ret    
     8f6:	8d 76 00             	lea    0x0(%esi),%esi
     8f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000900 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 3c             	sub    $0x3c,%esp
     909:	8b 75 0c             	mov    0xc(%ebp),%esi
     90c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     90f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     910:	b8 9f 15 00 00       	mov    $0x159f,%eax
     915:	89 44 24 08          	mov    %eax,0x8(%esp)
     919:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     91d:	89 34 24             	mov    %esi,(%esp)
     920:	e8 6b ff ff ff       	call   890 <peek>
     925:	85 c0                	test   %eax,%eax
     927:	0f 84 93 00 00 00    	je     9c0 <parseredirs+0xc0>
    tok = gettoken(ps, es, 0, 0);
     92d:	31 c0                	xor    %eax,%eax
     92f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     933:	31 c0                	xor    %eax,%eax
     935:	89 44 24 08          	mov    %eax,0x8(%esp)
     939:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     93d:	89 34 24             	mov    %esi,(%esp)
     940:	e8 eb fd ff ff       	call   730 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     945:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     949:	89 34 24             	mov    %esi,(%esp)
    tok = gettoken(ps, es, 0, 0);
     94c:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     94e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     951:	89 44 24 0c          	mov    %eax,0xc(%esp)
     955:	8d 45 e0             	lea    -0x20(%ebp),%eax
     958:	89 44 24 08          	mov    %eax,0x8(%esp)
     95c:	e8 cf fd ff ff       	call   730 <gettoken>
     961:	83 f8 61             	cmp    $0x61,%eax
     964:	75 65                	jne    9cb <parseredirs+0xcb>
      panic("missing file for redirection");
    switch(tok){
     966:	83 ff 3c             	cmp    $0x3c,%edi
     969:	74 45                	je     9b0 <parseredirs+0xb0>
     96b:	83 ff 3e             	cmp    $0x3e,%edi
     96e:	66 90                	xchg   %ax,%ax
     970:	74 05                	je     977 <parseredirs+0x77>
     972:	83 ff 2b             	cmp    $0x2b,%edi
     975:	75 99                	jne    910 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     977:	ba 01 00 00 00       	mov    $0x1,%edx
     97c:	b9 01 02 00 00       	mov    $0x201,%ecx
     981:	89 54 24 10          	mov    %edx,0x10(%esp)
     985:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     989:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     98c:	89 44 24 08          	mov    %eax,0x8(%esp)
     990:	8b 45 e0             	mov    -0x20(%ebp),%eax
     993:	89 44 24 04          	mov    %eax,0x4(%esp)
     997:	8b 45 08             	mov    0x8(%ebp),%eax
     99a:	89 04 24             	mov    %eax,(%esp)
     99d:	e8 4e fc ff ff       	call   5f0 <redircmd>
     9a2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9a5:	e9 66 ff ff ff       	jmp    910 <parseredirs+0x10>
     9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     9b0:	31 ff                	xor    %edi,%edi
     9b2:	31 c0                	xor    %eax,%eax
     9b4:	89 7c 24 10          	mov    %edi,0x10(%esp)
     9b8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     9bc:	eb cb                	jmp    989 <parseredirs+0x89>
     9be:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     9c0:	8b 45 08             	mov    0x8(%ebp),%eax
     9c3:	83 c4 3c             	add    $0x3c,%esp
     9c6:	5b                   	pop    %ebx
     9c7:	5e                   	pop    %esi
     9c8:	5f                   	pop    %edi
     9c9:	5d                   	pop    %ebp
     9ca:	c3                   	ret    
      panic("missing file for redirection");
     9cb:	c7 04 24 82 15 00 00 	movl   $0x1582,(%esp)
     9d2:	e8 09 f8 ff ff       	call   1e0 <panic>
     9d7:	89 f6                	mov    %esi,%esi
     9d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009e0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     9e0:	55                   	push   %ebp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     9e1:	ba a2 15 00 00       	mov    $0x15a2,%edx
{
     9e6:	89 e5                	mov    %esp,%ebp
     9e8:	57                   	push   %edi
     9e9:	56                   	push   %esi
     9ea:	53                   	push   %ebx
     9eb:	83 ec 3c             	sub    $0x3c,%esp
     9ee:	8b 75 08             	mov    0x8(%ebp),%esi
     9f1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(peek(ps, es, "("))
     9f4:	89 54 24 08          	mov    %edx,0x8(%esp)
     9f8:	89 34 24             	mov    %esi,(%esp)
     9fb:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9ff:	e8 8c fe ff ff       	call   890 <peek>
     a04:	85 c0                	test   %eax,%eax
     a06:	0f 85 9c 00 00 00    	jne    aa8 <parseexec+0xc8>
     a0c:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     a0e:	e8 9d fb ff ff       	call   5b0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     a13:	89 7c 24 08          	mov    %edi,0x8(%esp)
     a17:	89 74 24 04          	mov    %esi,0x4(%esp)
     a1b:	89 04 24             	mov    %eax,(%esp)
  ret = execcmd();
     a1e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     a21:	e8 da fe ff ff       	call   900 <parseredirs>
     a26:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     a29:	eb 1b                	jmp    a46 <parseexec+0x66>
     a2b:	90                   	nop
     a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     a30:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     a33:	89 7c 24 08          	mov    %edi,0x8(%esp)
     a37:	89 74 24 04          	mov    %esi,0x4(%esp)
     a3b:	89 04 24             	mov    %eax,(%esp)
     a3e:	e8 bd fe ff ff       	call   900 <parseredirs>
     a43:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     a46:	b8 b9 15 00 00       	mov    $0x15b9,%eax
     a4b:	89 44 24 08          	mov    %eax,0x8(%esp)
     a4f:	89 7c 24 04          	mov    %edi,0x4(%esp)
     a53:	89 34 24             	mov    %esi,(%esp)
     a56:	e8 35 fe ff ff       	call   890 <peek>
     a5b:	85 c0                	test   %eax,%eax
     a5d:	75 69                	jne    ac8 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     a5f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     a62:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a66:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a69:	89 44 24 08          	mov    %eax,0x8(%esp)
     a6d:	89 7c 24 04          	mov    %edi,0x4(%esp)
     a71:	89 34 24             	mov    %esi,(%esp)
     a74:	e8 b7 fc ff ff       	call   730 <gettoken>
     a79:	85 c0                	test   %eax,%eax
     a7b:	74 4b                	je     ac8 <parseexec+0xe8>
    if(tok != 'a')
     a7d:	83 f8 61             	cmp    $0x61,%eax
     a80:	75 65                	jne    ae7 <parseexec+0x107>
    cmd->argv[argc] = q;
     a82:	8b 45 e0             	mov    -0x20(%ebp),%eax
     a85:	8b 55 d0             	mov    -0x30(%ebp),%edx
     a88:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     a8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a8f:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     a93:	43                   	inc    %ebx
    if(argc >= MAXARGS)
     a94:	83 fb 0a             	cmp    $0xa,%ebx
     a97:	75 97                	jne    a30 <parseexec+0x50>
      panic("too many args");
     a99:	c7 04 24 ab 15 00 00 	movl   $0x15ab,(%esp)
     aa0:	e8 3b f7 ff ff       	call   1e0 <panic>
     aa5:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     aa8:	89 7c 24 04          	mov    %edi,0x4(%esp)
     aac:	89 34 24             	mov    %esi,(%esp)
     aaf:	e8 9c 01 00 00       	call   c50 <parseblock>
     ab4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     ab7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     aba:	83 c4 3c             	add    $0x3c,%esp
     abd:	5b                   	pop    %ebx
     abe:	5e                   	pop    %esi
     abf:	5f                   	pop    %edi
     ac0:	5d                   	pop    %ebp
     ac1:	c3                   	ret    
     ac2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ac8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     acb:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     ace:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     ad5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     adc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     adf:	83 c4 3c             	add    $0x3c,%esp
     ae2:	5b                   	pop    %ebx
     ae3:	5e                   	pop    %esi
     ae4:	5f                   	pop    %edi
     ae5:	5d                   	pop    %ebp
     ae6:	c3                   	ret    
      panic("syntax");
     ae7:	c7 04 24 a4 15 00 00 	movl   $0x15a4,(%esp)
     aee:	e8 ed f6 ff ff       	call   1e0 <panic>
     af3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b00 <parsepipe>:
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	83 ec 28             	sub    $0x28,%esp
     b06:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     b09:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b0c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     b0f:	8b 75 0c             	mov    0xc(%ebp),%esi
     b12:	89 7d fc             	mov    %edi,-0x4(%ebp)
  cmd = parseexec(ps, es);
     b15:	89 1c 24             	mov    %ebx,(%esp)
     b18:	89 74 24 04          	mov    %esi,0x4(%esp)
     b1c:	e8 bf fe ff ff       	call   9e0 <parseexec>
  if(peek(ps, es, "|")){
     b21:	b9 be 15 00 00       	mov    $0x15be,%ecx
     b26:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     b2a:	89 74 24 04          	mov    %esi,0x4(%esp)
     b2e:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseexec(ps, es);
     b31:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     b33:	e8 58 fd ff ff       	call   890 <peek>
     b38:	85 c0                	test   %eax,%eax
     b3a:	75 14                	jne    b50 <parsepipe+0x50>
}
     b3c:	89 f8                	mov    %edi,%eax
     b3e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     b41:	8b 75 f8             	mov    -0x8(%ebp),%esi
     b44:	8b 7d fc             	mov    -0x4(%ebp),%edi
     b47:	89 ec                	mov    %ebp,%esp
     b49:	5d                   	pop    %ebp
     b4a:	c3                   	ret    
     b4b:	90                   	nop
     b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     b50:	31 d2                	xor    %edx,%edx
     b52:	31 c0                	xor    %eax,%eax
     b54:	89 54 24 08          	mov    %edx,0x8(%esp)
     b58:	89 74 24 04          	mov    %esi,0x4(%esp)
     b5c:	89 1c 24             	mov    %ebx,(%esp)
     b5f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b63:	e8 c8 fb ff ff       	call   730 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b68:	89 74 24 04          	mov    %esi,0x4(%esp)
     b6c:	89 1c 24             	mov    %ebx,(%esp)
     b6f:	e8 8c ff ff ff       	call   b00 <parsepipe>
}
     b74:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b77:	89 7d 08             	mov    %edi,0x8(%ebp)
}
     b7a:	8b 75 f8             	mov    -0x8(%ebp),%esi
     b7d:	8b 7d fc             	mov    -0x4(%ebp),%edi
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b80:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     b83:	89 ec                	mov    %ebp,%esp
     b85:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b86:	e9 c5 fa ff ff       	jmp    650 <pipecmd>
     b8b:	90                   	nop
     b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b90 <parseline>:
{
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	57                   	push   %edi
     b94:	56                   	push   %esi
     b95:	53                   	push   %ebx
     b96:	83 ec 1c             	sub    $0x1c,%esp
     b99:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b9c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     b9f:	89 1c 24             	mov    %ebx,(%esp)
     ba2:	89 74 24 04          	mov    %esi,0x4(%esp)
     ba6:	e8 55 ff ff ff       	call   b00 <parsepipe>
     bab:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     bad:	eb 23                	jmp    bd2 <parseline+0x42>
     baf:	90                   	nop
    gettoken(ps, es, 0, 0);
     bb0:	31 c0                	xor    %eax,%eax
     bb2:	89 44 24 0c          	mov    %eax,0xc(%esp)
     bb6:	31 c0                	xor    %eax,%eax
     bb8:	89 44 24 08          	mov    %eax,0x8(%esp)
     bbc:	89 74 24 04          	mov    %esi,0x4(%esp)
     bc0:	89 1c 24             	mov    %ebx,(%esp)
     bc3:	e8 68 fb ff ff       	call   730 <gettoken>
    cmd = backcmd(cmd);
     bc8:	89 3c 24             	mov    %edi,(%esp)
     bcb:	e8 20 fb ff ff       	call   6f0 <backcmd>
     bd0:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     bd2:	b8 c0 15 00 00       	mov    $0x15c0,%eax
     bd7:	89 44 24 08          	mov    %eax,0x8(%esp)
     bdb:	89 74 24 04          	mov    %esi,0x4(%esp)
     bdf:	89 1c 24             	mov    %ebx,(%esp)
     be2:	e8 a9 fc ff ff       	call   890 <peek>
     be7:	85 c0                	test   %eax,%eax
     be9:	75 c5                	jne    bb0 <parseline+0x20>
  if(peek(ps, es, ";")){
     beb:	b9 bc 15 00 00       	mov    $0x15bc,%ecx
     bf0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     bf4:	89 74 24 04          	mov    %esi,0x4(%esp)
     bf8:	89 1c 24             	mov    %ebx,(%esp)
     bfb:	e8 90 fc ff ff       	call   890 <peek>
     c00:	85 c0                	test   %eax,%eax
     c02:	75 0c                	jne    c10 <parseline+0x80>
}
     c04:	83 c4 1c             	add    $0x1c,%esp
     c07:	89 f8                	mov    %edi,%eax
     c09:	5b                   	pop    %ebx
     c0a:	5e                   	pop    %esi
     c0b:	5f                   	pop    %edi
     c0c:	5d                   	pop    %ebp
     c0d:	c3                   	ret    
     c0e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     c10:	31 d2                	xor    %edx,%edx
     c12:	31 c0                	xor    %eax,%eax
     c14:	89 54 24 08          	mov    %edx,0x8(%esp)
     c18:	89 74 24 04          	mov    %esi,0x4(%esp)
     c1c:	89 1c 24             	mov    %ebx,(%esp)
     c1f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     c23:	e8 08 fb ff ff       	call   730 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     c28:	89 74 24 04          	mov    %esi,0x4(%esp)
     c2c:	89 1c 24             	mov    %ebx,(%esp)
     c2f:	e8 5c ff ff ff       	call   b90 <parseline>
     c34:	89 7d 08             	mov    %edi,0x8(%ebp)
     c37:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     c3a:	83 c4 1c             	add    $0x1c,%esp
     c3d:	5b                   	pop    %ebx
     c3e:	5e                   	pop    %esi
     c3f:	5f                   	pop    %edi
     c40:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     c41:	e9 5a fa ff ff       	jmp    6a0 <listcmd>
     c46:	8d 76 00             	lea    0x0(%esi),%esi
     c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c50 <parseblock>:
{
     c50:	55                   	push   %ebp
  if(!peek(ps, es, "("))
     c51:	b8 a2 15 00 00       	mov    $0x15a2,%eax
{
     c56:	89 e5                	mov    %esp,%ebp
     c58:	83 ec 28             	sub    $0x28,%esp
     c5b:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     c5e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     c61:	89 75 f8             	mov    %esi,-0x8(%ebp)
     c64:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     c67:	89 44 24 08          	mov    %eax,0x8(%esp)
{
     c6b:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(!peek(ps, es, "("))
     c6e:	89 1c 24             	mov    %ebx,(%esp)
     c71:	89 74 24 04          	mov    %esi,0x4(%esp)
     c75:	e8 16 fc ff ff       	call   890 <peek>
     c7a:	85 c0                	test   %eax,%eax
     c7c:	74 74                	je     cf2 <parseblock+0xa2>
  gettoken(ps, es, 0, 0);
     c7e:	31 c9                	xor    %ecx,%ecx
     c80:	31 ff                	xor    %edi,%edi
     c82:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     c86:	89 7c 24 08          	mov    %edi,0x8(%esp)
     c8a:	89 74 24 04          	mov    %esi,0x4(%esp)
     c8e:	89 1c 24             	mov    %ebx,(%esp)
     c91:	e8 9a fa ff ff       	call   730 <gettoken>
  cmd = parseline(ps, es);
     c96:	89 74 24 04          	mov    %esi,0x4(%esp)
     c9a:	89 1c 24             	mov    %ebx,(%esp)
     c9d:	e8 ee fe ff ff       	call   b90 <parseline>
  if(!peek(ps, es, ")"))
     ca2:	89 74 24 04          	mov    %esi,0x4(%esp)
     ca6:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseline(ps, es);
     ca9:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     cab:	b8 de 15 00 00       	mov    $0x15de,%eax
     cb0:	89 44 24 08          	mov    %eax,0x8(%esp)
     cb4:	e8 d7 fb ff ff       	call   890 <peek>
     cb9:	85 c0                	test   %eax,%eax
     cbb:	74 41                	je     cfe <parseblock+0xae>
  gettoken(ps, es, 0, 0);
     cbd:	31 d2                	xor    %edx,%edx
     cbf:	31 c0                	xor    %eax,%eax
     cc1:	89 54 24 08          	mov    %edx,0x8(%esp)
     cc5:	89 74 24 04          	mov    %esi,0x4(%esp)
     cc9:	89 1c 24             	mov    %ebx,(%esp)
     ccc:	89 44 24 0c          	mov    %eax,0xc(%esp)
     cd0:	e8 5b fa ff ff       	call   730 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     cd5:	89 74 24 08          	mov    %esi,0x8(%esp)
     cd9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     cdd:	89 3c 24             	mov    %edi,(%esp)
     ce0:	e8 1b fc ff ff       	call   900 <parseredirs>
}
     ce5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     ce8:	8b 75 f8             	mov    -0x8(%ebp),%esi
     ceb:	8b 7d fc             	mov    -0x4(%ebp),%edi
     cee:	89 ec                	mov    %ebp,%esp
     cf0:	5d                   	pop    %ebp
     cf1:	c3                   	ret    
    panic("parseblock");
     cf2:	c7 04 24 c2 15 00 00 	movl   $0x15c2,(%esp)
     cf9:	e8 e2 f4 ff ff       	call   1e0 <panic>
    panic("syntax - missing )");
     cfe:	c7 04 24 cd 15 00 00 	movl   $0x15cd,(%esp)
     d05:	e8 d6 f4 ff ff       	call   1e0 <panic>
     d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000d10 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	53                   	push   %ebx
     d14:	83 ec 14             	sub    $0x14,%esp
     d17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     d1a:	85 db                	test   %ebx,%ebx
     d1c:	74 1d                	je     d3b <nulterminate+0x2b>
    return 0;

  switch(cmd->type){
     d1e:	83 3b 05             	cmpl   $0x5,(%ebx)
     d21:	77 18                	ja     d3b <nulterminate+0x2b>
     d23:	8b 03                	mov    (%ebx),%eax
     d25:	ff 24 85 20 16 00 00 	jmp    *0x1620(,%eax,4)
     d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     d30:	8b 43 04             	mov    0x4(%ebx),%eax
     d33:	89 04 24             	mov    %eax,(%esp)
     d36:	e8 d5 ff ff ff       	call   d10 <nulterminate>
    break;
  }
  return cmd;
}
     d3b:	83 c4 14             	add    $0x14,%esp
     d3e:	89 d8                	mov    %ebx,%eax
     d40:	5b                   	pop    %ebx
     d41:	5d                   	pop    %ebp
     d42:	c3                   	ret    
     d43:	90                   	nop
     d44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->left);
     d48:	8b 43 04             	mov    0x4(%ebx),%eax
     d4b:	89 04 24             	mov    %eax,(%esp)
     d4e:	e8 bd ff ff ff       	call   d10 <nulterminate>
    nulterminate(lcmd->right);
     d53:	8b 43 08             	mov    0x8(%ebx),%eax
     d56:	89 04 24             	mov    %eax,(%esp)
     d59:	e8 b2 ff ff ff       	call   d10 <nulterminate>
}
     d5e:	83 c4 14             	add    $0x14,%esp
     d61:	89 d8                	mov    %ebx,%eax
     d63:	5b                   	pop    %ebx
     d64:	5d                   	pop    %ebp
     d65:	c3                   	ret    
     d66:	8d 76 00             	lea    0x0(%esi),%esi
     d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     d70:	8b 4b 04             	mov    0x4(%ebx),%ecx
     d73:	8d 43 08             	lea    0x8(%ebx),%eax
     d76:	85 c9                	test   %ecx,%ecx
     d78:	74 c1                	je     d3b <nulterminate+0x2b>
     d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     d80:	8b 50 24             	mov    0x24(%eax),%edx
     d83:	83 c0 04             	add    $0x4,%eax
     d86:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     d89:	8b 50 fc             	mov    -0x4(%eax),%edx
     d8c:	85 d2                	test   %edx,%edx
     d8e:	75 f0                	jne    d80 <nulterminate+0x70>
}
     d90:	83 c4 14             	add    $0x14,%esp
     d93:	89 d8                	mov    %ebx,%eax
     d95:	5b                   	pop    %ebx
     d96:	5d                   	pop    %ebp
     d97:	c3                   	ret    
     d98:	90                   	nop
     d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(rcmd->cmd);
     da0:	8b 43 04             	mov    0x4(%ebx),%eax
     da3:	89 04 24             	mov    %eax,(%esp)
     da6:	e8 65 ff ff ff       	call   d10 <nulterminate>
    *rcmd->efile = 0;
     dab:	8b 43 0c             	mov    0xc(%ebx),%eax
     dae:	c6 00 00             	movb   $0x0,(%eax)
}
     db1:	83 c4 14             	add    $0x14,%esp
     db4:	89 d8                	mov    %ebx,%eax
     db6:	5b                   	pop    %ebx
     db7:	5d                   	pop    %ebp
     db8:	c3                   	ret    
     db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000dc0 <parsecmd>:
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	56                   	push   %esi
     dc4:	53                   	push   %ebx
     dc5:	83 ec 10             	sub    $0x10,%esp
  es = s + strlen(s);
     dc8:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dcb:	89 1c 24             	mov    %ebx,(%esp)
     dce:	e8 cd 00 00 00       	call   ea0 <strlen>
     dd3:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     dd5:	8d 45 08             	lea    0x8(%ebp),%eax
     dd8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     ddc:	89 04 24             	mov    %eax,(%esp)
     ddf:	e8 ac fd ff ff       	call   b90 <parseline>
  peek(&s, es, "");
     de4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  cmd = parseline(&s, es);
     de8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     dea:	b8 67 15 00 00       	mov    $0x1567,%eax
     def:	89 44 24 08          	mov    %eax,0x8(%esp)
     df3:	8d 45 08             	lea    0x8(%ebp),%eax
     df6:	89 04 24             	mov    %eax,(%esp)
     df9:	e8 92 fa ff ff       	call   890 <peek>
  if(s != es){
     dfe:	8b 45 08             	mov    0x8(%ebp),%eax
     e01:	39 d8                	cmp    %ebx,%eax
     e03:	75 11                	jne    e16 <parsecmd+0x56>
  nulterminate(cmd);
     e05:	89 34 24             	mov    %esi,(%esp)
     e08:	e8 03 ff ff ff       	call   d10 <nulterminate>
}
     e0d:	83 c4 10             	add    $0x10,%esp
     e10:	89 f0                	mov    %esi,%eax
     e12:	5b                   	pop    %ebx
     e13:	5e                   	pop    %esi
     e14:	5d                   	pop    %ebp
     e15:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     e16:	89 44 24 08          	mov    %eax,0x8(%esp)
     e1a:	c7 44 24 04 e0 15 00 	movl   $0x15e0,0x4(%esp)
     e21:	00 
     e22:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     e29:	e8 a2 03 00 00       	call   11d0 <printf>
    panic("syntax");
     e2e:	c7 04 24 a4 15 00 00 	movl   $0x15a4,(%esp)
     e35:	e8 a6 f3 ff ff       	call   1e0 <panic>
     e3a:	66 90                	xchg   %ax,%ax
     e3c:	66 90                	xchg   %ax,%ax
     e3e:	66 90                	xchg   %ax,%ax

00000e40 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	8b 45 08             	mov    0x8(%ebp),%eax
     e46:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     e49:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     e4a:	89 c2                	mov    %eax,%edx
     e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e50:	41                   	inc    %ecx
     e51:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     e55:	42                   	inc    %edx
     e56:	84 db                	test   %bl,%bl
     e58:	88 5a ff             	mov    %bl,-0x1(%edx)
     e5b:	75 f3                	jne    e50 <strcpy+0x10>
    ;
  return os;
}
     e5d:	5b                   	pop    %ebx
     e5e:	5d                   	pop    %ebp
     e5f:	c3                   	ret    

00000e60 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     e60:	55                   	push   %ebp
     e61:	89 e5                	mov    %esp,%ebp
     e63:	8b 4d 08             	mov    0x8(%ebp),%ecx
     e66:	53                   	push   %ebx
     e67:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
     e6a:	0f b6 01             	movzbl (%ecx),%eax
     e6d:	0f b6 13             	movzbl (%ebx),%edx
     e70:	84 c0                	test   %al,%al
     e72:	75 18                	jne    e8c <strcmp+0x2c>
     e74:	eb 22                	jmp    e98 <strcmp+0x38>
     e76:	8d 76 00             	lea    0x0(%esi),%esi
     e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     e80:	41                   	inc    %ecx
  while(*p && *p == *q)
     e81:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
     e84:	43                   	inc    %ebx
     e85:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
     e88:	84 c0                	test   %al,%al
     e8a:	74 0c                	je     e98 <strcmp+0x38>
     e8c:	38 d0                	cmp    %dl,%al
     e8e:	74 f0                	je     e80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
     e90:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
     e91:	29 d0                	sub    %edx,%eax
}
     e93:	5d                   	pop    %ebp
     e94:	c3                   	ret    
     e95:	8d 76 00             	lea    0x0(%esi),%esi
     e98:	5b                   	pop    %ebx
     e99:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     e9b:	29 d0                	sub    %edx,%eax
}
     e9d:	5d                   	pop    %ebp
     e9e:	c3                   	ret    
     e9f:	90                   	nop

00000ea0 <strlen>:

uint
strlen(const char *s)
{
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     ea6:	80 39 00             	cmpb   $0x0,(%ecx)
     ea9:	74 15                	je     ec0 <strlen+0x20>
     eab:	31 d2                	xor    %edx,%edx
     ead:	8d 76 00             	lea    0x0(%esi),%esi
     eb0:	42                   	inc    %edx
     eb1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     eb5:	89 d0                	mov    %edx,%eax
     eb7:	75 f7                	jne    eb0 <strlen+0x10>
    ;
  return n;
}
     eb9:	5d                   	pop    %ebp
     eba:	c3                   	ret    
     ebb:	90                   	nop
     ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
     ec0:	31 c0                	xor    %eax,%eax
}
     ec2:	5d                   	pop    %ebp
     ec3:	c3                   	ret    
     ec4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     eca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ed0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	8b 55 08             	mov    0x8(%ebp),%edx
     ed6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     ed7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     eda:	8b 45 0c             	mov    0xc(%ebp),%eax
     edd:	89 d7                	mov    %edx,%edi
     edf:	fc                   	cld    
     ee0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     ee2:	5f                   	pop    %edi
     ee3:	89 d0                	mov    %edx,%eax
     ee5:	5d                   	pop    %ebp
     ee6:	c3                   	ret    
     ee7:	89 f6                	mov    %esi,%esi
     ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ef0 <strchr>:

char*
strchr(const char *s, char c)
{
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	8b 45 08             	mov    0x8(%ebp),%eax
     ef6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     efa:	0f b6 10             	movzbl (%eax),%edx
     efd:	84 d2                	test   %dl,%dl
     eff:	74 1b                	je     f1c <strchr+0x2c>
    if(*s == c)
     f01:	38 d1                	cmp    %dl,%cl
     f03:	75 0f                	jne    f14 <strchr+0x24>
     f05:	eb 17                	jmp    f1e <strchr+0x2e>
     f07:	89 f6                	mov    %esi,%esi
     f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     f10:	38 ca                	cmp    %cl,%dl
     f12:	74 0a                	je     f1e <strchr+0x2e>
  for(; *s; s++)
     f14:	40                   	inc    %eax
     f15:	0f b6 10             	movzbl (%eax),%edx
     f18:	84 d2                	test   %dl,%dl
     f1a:	75 f4                	jne    f10 <strchr+0x20>
      return (char*)s;
  return 0;
     f1c:	31 c0                	xor    %eax,%eax
}
     f1e:	5d                   	pop    %ebp
     f1f:	c3                   	ret    

00000f20 <gets>:

char*
gets(char *buf, int max)
{
     f20:	55                   	push   %ebp
     f21:	89 e5                	mov    %esp,%ebp
     f23:	57                   	push   %edi
     f24:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     f25:	31 f6                	xor    %esi,%esi
{
     f27:	53                   	push   %ebx
     f28:	83 ec 3c             	sub    $0x3c,%esp
     f2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
     f2e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
     f31:	eb 32                	jmp    f65 <gets+0x45>
     f33:	90                   	nop
     f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
     f38:	ba 01 00 00 00       	mov    $0x1,%edx
     f3d:	89 54 24 08          	mov    %edx,0x8(%esp)
     f41:	89 7c 24 04          	mov    %edi,0x4(%esp)
     f45:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f4c:	e8 37 01 00 00       	call   1088 <read>
    if(cc < 1)
     f51:	85 c0                	test   %eax,%eax
     f53:	7e 19                	jle    f6e <gets+0x4e>
      break;
    buf[i++] = c;
     f55:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     f59:	43                   	inc    %ebx
     f5a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
     f5d:	3c 0a                	cmp    $0xa,%al
     f5f:	74 1f                	je     f80 <gets+0x60>
     f61:	3c 0d                	cmp    $0xd,%al
     f63:	74 1b                	je     f80 <gets+0x60>
  for(i=0; i+1 < max; ){
     f65:	46                   	inc    %esi
     f66:	3b 75 0c             	cmp    0xc(%ebp),%esi
     f69:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     f6c:	7c ca                	jl     f38 <gets+0x18>
      break;
  }
  buf[i] = '\0';
     f6e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     f71:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
     f74:	8b 45 08             	mov    0x8(%ebp),%eax
     f77:	83 c4 3c             	add    $0x3c,%esp
     f7a:	5b                   	pop    %ebx
     f7b:	5e                   	pop    %esi
     f7c:	5f                   	pop    %edi
     f7d:	5d                   	pop    %ebp
     f7e:	c3                   	ret    
     f7f:	90                   	nop
     f80:	8b 45 08             	mov    0x8(%ebp),%eax
     f83:	01 c6                	add    %eax,%esi
     f85:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     f88:	eb e4                	jmp    f6e <gets+0x4e>
     f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000f90 <stat>:

int
stat(const char *n, struct stat *st)
{
     f90:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     f91:	31 c0                	xor    %eax,%eax
{
     f93:	89 e5                	mov    %esp,%ebp
     f95:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
     f98:	89 44 24 04          	mov    %eax,0x4(%esp)
     f9c:	8b 45 08             	mov    0x8(%ebp),%eax
{
     f9f:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     fa2:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
     fa5:	89 04 24             	mov    %eax,(%esp)
     fa8:	e8 03 01 00 00       	call   10b0 <open>
  if(fd < 0)
     fad:	85 c0                	test   %eax,%eax
     faf:	78 2f                	js     fe0 <stat+0x50>
     fb1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     fb3:	8b 45 0c             	mov    0xc(%ebp),%eax
     fb6:	89 1c 24             	mov    %ebx,(%esp)
     fb9:	89 44 24 04          	mov    %eax,0x4(%esp)
     fbd:	e8 06 01 00 00       	call   10c8 <fstat>
  close(fd);
     fc2:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     fc5:	89 c6                	mov    %eax,%esi
  close(fd);
     fc7:	e8 cc 00 00 00       	call   1098 <close>
  return r;
}
     fcc:	89 f0                	mov    %esi,%eax
     fce:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     fd1:	8b 75 fc             	mov    -0x4(%ebp),%esi
     fd4:	89 ec                	mov    %ebp,%esp
     fd6:	5d                   	pop    %ebp
     fd7:	c3                   	ret    
     fd8:	90                   	nop
     fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     fe0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     fe5:	eb e5                	jmp    fcc <stat+0x3c>
     fe7:	89 f6                	mov    %esi,%esi
     fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ff0 <atoi>:

int
atoi(const char *s)
{
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     ff6:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     ff7:	0f be 11             	movsbl (%ecx),%edx
     ffa:	88 d0                	mov    %dl,%al
     ffc:	2c 30                	sub    $0x30,%al
     ffe:	3c 09                	cmp    $0x9,%al
  n = 0;
    1000:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    1005:	77 1e                	ja     1025 <atoi+0x35>
    1007:	89 f6                	mov    %esi,%esi
    1009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    1010:	41                   	inc    %ecx
    1011:	8d 04 80             	lea    (%eax,%eax,4),%eax
    1014:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    1018:	0f be 11             	movsbl (%ecx),%edx
    101b:	88 d3                	mov    %dl,%bl
    101d:	80 eb 30             	sub    $0x30,%bl
    1020:	80 fb 09             	cmp    $0x9,%bl
    1023:	76 eb                	jbe    1010 <atoi+0x20>
  return n;
}
    1025:	5b                   	pop    %ebx
    1026:	5d                   	pop    %ebp
    1027:	c3                   	ret    
    1028:	90                   	nop
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001030 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	56                   	push   %esi
    1034:	8b 45 08             	mov    0x8(%ebp),%eax
    1037:	53                   	push   %ebx
    1038:	8b 5d 10             	mov    0x10(%ebp),%ebx
    103b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    103e:	85 db                	test   %ebx,%ebx
    1040:	7e 1a                	jle    105c <memmove+0x2c>
    1042:	31 d2                	xor    %edx,%edx
    1044:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    104a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
    1050:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    1054:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    1057:	42                   	inc    %edx
  while(n-- > 0)
    1058:	39 d3                	cmp    %edx,%ebx
    105a:	75 f4                	jne    1050 <memmove+0x20>
  return vdst;
}
    105c:	5b                   	pop    %ebx
    105d:	5e                   	pop    %esi
    105e:	5d                   	pop    %ebp
    105f:	c3                   	ret    

00001060 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1060:	b8 01 00 00 00       	mov    $0x1,%eax
    1065:	cd 40                	int    $0x40
    1067:	c3                   	ret    

00001068 <exit>:
SYSCALL(exit)
    1068:	b8 02 00 00 00       	mov    $0x2,%eax
    106d:	cd 40                	int    $0x40
    106f:	c3                   	ret    

00001070 <wait>:
SYSCALL(wait)
    1070:	b8 03 00 00 00       	mov    $0x3,%eax
    1075:	cd 40                	int    $0x40
    1077:	c3                   	ret    

00001078 <wait_stat>:
SYSCALL(wait_stat)
    1078:	b8 19 00 00 00       	mov    $0x19,%eax
    107d:	cd 40                	int    $0x40
    107f:	c3                   	ret    

00001080 <pipe>:
SYSCALL(pipe)
    1080:	b8 04 00 00 00       	mov    $0x4,%eax
    1085:	cd 40                	int    $0x40
    1087:	c3                   	ret    

00001088 <read>:
SYSCALL(read)
    1088:	b8 05 00 00 00       	mov    $0x5,%eax
    108d:	cd 40                	int    $0x40
    108f:	c3                   	ret    

00001090 <write>:
SYSCALL(write)
    1090:	b8 10 00 00 00       	mov    $0x10,%eax
    1095:	cd 40                	int    $0x40
    1097:	c3                   	ret    

00001098 <close>:
SYSCALL(close)
    1098:	b8 15 00 00 00       	mov    $0x15,%eax
    109d:	cd 40                	int    $0x40
    109f:	c3                   	ret    

000010a0 <kill>:
SYSCALL(kill)
    10a0:	b8 06 00 00 00       	mov    $0x6,%eax
    10a5:	cd 40                	int    $0x40
    10a7:	c3                   	ret    

000010a8 <exec>:
SYSCALL(exec)
    10a8:	b8 07 00 00 00       	mov    $0x7,%eax
    10ad:	cd 40                	int    $0x40
    10af:	c3                   	ret    

000010b0 <open>:
SYSCALL(open)
    10b0:	b8 0f 00 00 00       	mov    $0xf,%eax
    10b5:	cd 40                	int    $0x40
    10b7:	c3                   	ret    

000010b8 <mknod>:
SYSCALL(mknod)
    10b8:	b8 11 00 00 00       	mov    $0x11,%eax
    10bd:	cd 40                	int    $0x40
    10bf:	c3                   	ret    

000010c0 <unlink>:
SYSCALL(unlink)
    10c0:	b8 12 00 00 00       	mov    $0x12,%eax
    10c5:	cd 40                	int    $0x40
    10c7:	c3                   	ret    

000010c8 <fstat>:
SYSCALL(fstat)
    10c8:	b8 08 00 00 00       	mov    $0x8,%eax
    10cd:	cd 40                	int    $0x40
    10cf:	c3                   	ret    

000010d0 <link>:
SYSCALL(link)
    10d0:	b8 13 00 00 00       	mov    $0x13,%eax
    10d5:	cd 40                	int    $0x40
    10d7:	c3                   	ret    

000010d8 <mkdir>:
SYSCALL(mkdir)
    10d8:	b8 14 00 00 00       	mov    $0x14,%eax
    10dd:	cd 40                	int    $0x40
    10df:	c3                   	ret    

000010e0 <chdir>:
SYSCALL(chdir)
    10e0:	b8 09 00 00 00       	mov    $0x9,%eax
    10e5:	cd 40                	int    $0x40
    10e7:	c3                   	ret    

000010e8 <dup>:
SYSCALL(dup)
    10e8:	b8 0a 00 00 00       	mov    $0xa,%eax
    10ed:	cd 40                	int    $0x40
    10ef:	c3                   	ret    

000010f0 <getpid>:
SYSCALL(getpid)
    10f0:	b8 0b 00 00 00       	mov    $0xb,%eax
    10f5:	cd 40                	int    $0x40
    10f7:	c3                   	ret    

000010f8 <sbrk>:
SYSCALL(sbrk)
    10f8:	b8 0c 00 00 00       	mov    $0xc,%eax
    10fd:	cd 40                	int    $0x40
    10ff:	c3                   	ret    

00001100 <sleep>:
SYSCALL(sleep)
    1100:	b8 0d 00 00 00       	mov    $0xd,%eax
    1105:	cd 40                	int    $0x40
    1107:	c3                   	ret    

00001108 <uptime>:
SYSCALL(uptime)
    1108:	b8 0e 00 00 00       	mov    $0xe,%eax
    110d:	cd 40                	int    $0x40
    110f:	c3                   	ret    

00001110 <detach>:
SYSCALL(detach)
    1110:	b8 16 00 00 00       	mov    $0x16,%eax
    1115:	cd 40                	int    $0x40
    1117:	c3                   	ret    

00001118 <policy>:
SYSCALL(policy)
    1118:	b8 17 00 00 00       	mov    $0x17,%eax
    111d:	cd 40                	int    $0x40
    111f:	c3                   	ret    

00001120 <priority>:
    1120:	b8 18 00 00 00       	mov    $0x18,%eax
    1125:	cd 40                	int    $0x40
    1127:	c3                   	ret    
    1128:	66 90                	xchg   %ax,%ax
    112a:	66 90                	xchg   %ax,%ax
    112c:	66 90                	xchg   %ax,%ax
    112e:	66 90                	xchg   %ax,%ax

00001130 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	57                   	push   %edi
    1134:	56                   	push   %esi
    1135:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1136:	89 d3                	mov    %edx,%ebx
    1138:	c1 eb 1f             	shr    $0x1f,%ebx
{
    113b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
    113e:	84 db                	test   %bl,%bl
{
    1140:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1143:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1145:	74 79                	je     11c0 <printint+0x90>
    1147:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    114b:	74 73                	je     11c0 <printint+0x90>
    neg = 1;
    x = -xx;
    114d:	f7 d8                	neg    %eax
    neg = 1;
    114f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1156:	31 f6                	xor    %esi,%esi
    1158:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    115b:	eb 05                	jmp    1162 <printint+0x32>
    115d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1160:	89 fe                	mov    %edi,%esi
    1162:	31 d2                	xor    %edx,%edx
    1164:	f7 f1                	div    %ecx
    1166:	8d 7e 01             	lea    0x1(%esi),%edi
    1169:	0f b6 92 40 16 00 00 	movzbl 0x1640(%edx),%edx
  }while((x /= base) != 0);
    1170:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1172:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1175:	75 e9                	jne    1160 <printint+0x30>
  if(neg)
    1177:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    117a:	85 d2                	test   %edx,%edx
    117c:	74 08                	je     1186 <printint+0x56>
    buf[i++] = '-';
    117e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    1183:	8d 7e 02             	lea    0x2(%esi),%edi
    1186:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    118a:	8b 7d c0             	mov    -0x40(%ebp),%edi
    118d:	8d 76 00             	lea    0x0(%esi),%esi
    1190:	0f b6 06             	movzbl (%esi),%eax
    1193:	4e                   	dec    %esi
  write(fd, &c, 1);
    1194:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1198:	89 3c 24             	mov    %edi,(%esp)
    119b:	88 45 d7             	mov    %al,-0x29(%ebp)
    119e:	b8 01 00 00 00       	mov    $0x1,%eax
    11a3:	89 44 24 08          	mov    %eax,0x8(%esp)
    11a7:	e8 e4 fe ff ff       	call   1090 <write>

  while(--i >= 0)
    11ac:	39 de                	cmp    %ebx,%esi
    11ae:	75 e0                	jne    1190 <printint+0x60>
    putc(fd, buf[i]);
}
    11b0:	83 c4 4c             	add    $0x4c,%esp
    11b3:	5b                   	pop    %ebx
    11b4:	5e                   	pop    %esi
    11b5:	5f                   	pop    %edi
    11b6:	5d                   	pop    %ebp
    11b7:	c3                   	ret    
    11b8:	90                   	nop
    11b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    11c0:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    11c7:	eb 8d                	jmp    1156 <printint+0x26>
    11c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000011d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	57                   	push   %edi
    11d4:	56                   	push   %esi
    11d5:	53                   	push   %ebx
    11d6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    11d9:	8b 75 0c             	mov    0xc(%ebp),%esi
    11dc:	0f b6 1e             	movzbl (%esi),%ebx
    11df:	84 db                	test   %bl,%bl
    11e1:	0f 84 d1 00 00 00    	je     12b8 <printf+0xe8>
  state = 0;
    11e7:	31 ff                	xor    %edi,%edi
    11e9:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
    11ea:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
    11ed:	89 fa                	mov    %edi,%edx
    11ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
    11f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    11f5:	eb 41                	jmp    1238 <printf+0x68>
    11f7:	89 f6                	mov    %esi,%esi
    11f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1200:	83 f8 25             	cmp    $0x25,%eax
    1203:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1206:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    120b:	74 1e                	je     122b <printf+0x5b>
  write(fd, &c, 1);
    120d:	b8 01 00 00 00       	mov    $0x1,%eax
    1212:	89 44 24 08          	mov    %eax,0x8(%esp)
    1216:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1219:	89 44 24 04          	mov    %eax,0x4(%esp)
    121d:	89 3c 24             	mov    %edi,(%esp)
    1220:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1223:	e8 68 fe ff ff       	call   1090 <write>
    1228:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    122b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
    122c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1230:	84 db                	test   %bl,%bl
    1232:	0f 84 80 00 00 00    	je     12b8 <printf+0xe8>
    if(state == 0){
    1238:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    123a:	0f be cb             	movsbl %bl,%ecx
    123d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1240:	74 be                	je     1200 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1242:	83 fa 25             	cmp    $0x25,%edx
    1245:	75 e4                	jne    122b <printf+0x5b>
      if(c == 'd'){
    1247:	83 f8 64             	cmp    $0x64,%eax
    124a:	0f 84 f0 00 00 00    	je     1340 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1250:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1256:	83 f9 70             	cmp    $0x70,%ecx
    1259:	74 65                	je     12c0 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    125b:	83 f8 73             	cmp    $0x73,%eax
    125e:	0f 84 8c 00 00 00    	je     12f0 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1264:	83 f8 63             	cmp    $0x63,%eax
    1267:	0f 84 13 01 00 00    	je     1380 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    126d:	83 f8 25             	cmp    $0x25,%eax
    1270:	0f 84 e2 00 00 00    	je     1358 <printf+0x188>
  write(fd, &c, 1);
    1276:	b8 01 00 00 00       	mov    $0x1,%eax
    127b:	46                   	inc    %esi
    127c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1280:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1283:	89 44 24 04          	mov    %eax,0x4(%esp)
    1287:	89 3c 24             	mov    %edi,(%esp)
    128a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    128e:	e8 fd fd ff ff       	call   1090 <write>
    1293:	ba 01 00 00 00       	mov    $0x1,%edx
    1298:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    129b:	89 54 24 08          	mov    %edx,0x8(%esp)
    129f:	89 44 24 04          	mov    %eax,0x4(%esp)
    12a3:	89 3c 24             	mov    %edi,(%esp)
    12a6:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    12a9:	e8 e2 fd ff ff       	call   1090 <write>
  for(i = 0; fmt[i]; i++){
    12ae:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    12b2:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    12b4:	84 db                	test   %bl,%bl
    12b6:	75 80                	jne    1238 <printf+0x68>
    }
  }
}
    12b8:	83 c4 3c             	add    $0x3c,%esp
    12bb:	5b                   	pop    %ebx
    12bc:	5e                   	pop    %esi
    12bd:	5f                   	pop    %edi
    12be:	5d                   	pop    %ebp
    12bf:	c3                   	ret    
        printint(fd, *ap, 16, 0);
    12c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12c7:	b9 10 00 00 00       	mov    $0x10,%ecx
    12cc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    12cf:	89 f8                	mov    %edi,%eax
    12d1:	8b 13                	mov    (%ebx),%edx
    12d3:	e8 58 fe ff ff       	call   1130 <printint>
        ap++;
    12d8:	89 d8                	mov    %ebx,%eax
      state = 0;
    12da:	31 d2                	xor    %edx,%edx
        ap++;
    12dc:	83 c0 04             	add    $0x4,%eax
    12df:	89 45 d0             	mov    %eax,-0x30(%ebp)
    12e2:	e9 44 ff ff ff       	jmp    122b <printf+0x5b>
    12e7:	89 f6                	mov    %esi,%esi
    12e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    12f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    12f3:	8b 10                	mov    (%eax),%edx
        ap++;
    12f5:	83 c0 04             	add    $0x4,%eax
    12f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    12fb:	85 d2                	test   %edx,%edx
    12fd:	0f 84 aa 00 00 00    	je     13ad <printf+0x1dd>
        while(*s != 0){
    1303:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
    1306:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
    1308:	84 c0                	test   %al,%al
    130a:	74 27                	je     1333 <printf+0x163>
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1310:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1313:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
    1318:	43                   	inc    %ebx
  write(fd, &c, 1);
    1319:	89 44 24 08          	mov    %eax,0x8(%esp)
    131d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1320:	89 44 24 04          	mov    %eax,0x4(%esp)
    1324:	89 3c 24             	mov    %edi,(%esp)
    1327:	e8 64 fd ff ff       	call   1090 <write>
        while(*s != 0){
    132c:	0f b6 03             	movzbl (%ebx),%eax
    132f:	84 c0                	test   %al,%al
    1331:	75 dd                	jne    1310 <printf+0x140>
      state = 0;
    1333:	31 d2                	xor    %edx,%edx
    1335:	e9 f1 fe ff ff       	jmp    122b <printf+0x5b>
    133a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1340:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1347:	b9 0a 00 00 00       	mov    $0xa,%ecx
    134c:	e9 7b ff ff ff       	jmp    12cc <printf+0xfc>
    1351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1358:	b9 01 00 00 00       	mov    $0x1,%ecx
    135d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1360:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1364:	89 44 24 04          	mov    %eax,0x4(%esp)
    1368:	89 3c 24             	mov    %edi,(%esp)
    136b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    136e:	e8 1d fd ff ff       	call   1090 <write>
      state = 0;
    1373:	31 d2                	xor    %edx,%edx
    1375:	e9 b1 fe ff ff       	jmp    122b <printf+0x5b>
    137a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
    1380:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1383:	8b 03                	mov    (%ebx),%eax
        ap++;
    1385:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    1388:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
    138b:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    138e:	b8 01 00 00 00       	mov    $0x1,%eax
    1393:	89 44 24 08          	mov    %eax,0x8(%esp)
    1397:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    139a:	89 44 24 04          	mov    %eax,0x4(%esp)
    139e:	e8 ed fc ff ff       	call   1090 <write>
      state = 0;
    13a3:	31 d2                	xor    %edx,%edx
        ap++;
    13a5:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    13a8:	e9 7e fe ff ff       	jmp    122b <printf+0x5b>
          s = "(null)";
    13ad:	bb 38 16 00 00       	mov    $0x1638,%ebx
        while(*s != 0){
    13b2:	b0 28                	mov    $0x28,%al
    13b4:	e9 57 ff ff ff       	jmp    1310 <printf+0x140>
    13b9:	66 90                	xchg   %ax,%ax
    13bb:	66 90                	xchg   %ax,%ax
    13bd:	66 90                	xchg   %ax,%ax
    13bf:	90                   	nop

000013c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    13c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13c1:	a1 a4 1c 00 00       	mov    0x1ca4,%eax
{
    13c6:	89 e5                	mov    %esp,%ebp
    13c8:	57                   	push   %edi
    13c9:	56                   	push   %esi
    13ca:	53                   	push   %ebx
    13cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    13ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    13d1:	eb 0d                	jmp    13e0 <free+0x20>
    13d3:	90                   	nop
    13d4:	90                   	nop
    13d5:	90                   	nop
    13d6:	90                   	nop
    13d7:	90                   	nop
    13d8:	90                   	nop
    13d9:	90                   	nop
    13da:	90                   	nop
    13db:	90                   	nop
    13dc:	90                   	nop
    13dd:	90                   	nop
    13de:	90                   	nop
    13df:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13e0:	39 c8                	cmp    %ecx,%eax
    13e2:	8b 10                	mov    (%eax),%edx
    13e4:	73 32                	jae    1418 <free+0x58>
    13e6:	39 d1                	cmp    %edx,%ecx
    13e8:	72 04                	jb     13ee <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13ea:	39 d0                	cmp    %edx,%eax
    13ec:	72 32                	jb     1420 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
    13ee:	8b 73 fc             	mov    -0x4(%ebx),%esi
    13f1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    13f4:	39 fa                	cmp    %edi,%edx
    13f6:	74 30                	je     1428 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    13f8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    13fb:	8b 50 04             	mov    0x4(%eax),%edx
    13fe:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1401:	39 f1                	cmp    %esi,%ecx
    1403:	74 3c                	je     1441 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1405:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1407:	5b                   	pop    %ebx
  freep = p;
    1408:	a3 a4 1c 00 00       	mov    %eax,0x1ca4
}
    140d:	5e                   	pop    %esi
    140e:	5f                   	pop    %edi
    140f:	5d                   	pop    %ebp
    1410:	c3                   	ret    
    1411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1418:	39 d0                	cmp    %edx,%eax
    141a:	72 04                	jb     1420 <free+0x60>
    141c:	39 d1                	cmp    %edx,%ecx
    141e:	72 ce                	jb     13ee <free+0x2e>
{
    1420:	89 d0                	mov    %edx,%eax
    1422:	eb bc                	jmp    13e0 <free+0x20>
    1424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1428:	8b 7a 04             	mov    0x4(%edx),%edi
    142b:	01 fe                	add    %edi,%esi
    142d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1430:	8b 10                	mov    (%eax),%edx
    1432:	8b 12                	mov    (%edx),%edx
    1434:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1437:	8b 50 04             	mov    0x4(%eax),%edx
    143a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    143d:	39 f1                	cmp    %esi,%ecx
    143f:	75 c4                	jne    1405 <free+0x45>
    p->s.size += bp->s.size;
    1441:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
    1444:	a3 a4 1c 00 00       	mov    %eax,0x1ca4
    p->s.size += bp->s.size;
    1449:	01 ca                	add    %ecx,%edx
    144b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    144e:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1451:	89 10                	mov    %edx,(%eax)
}
    1453:	5b                   	pop    %ebx
    1454:	5e                   	pop    %esi
    1455:	5f                   	pop    %edi
    1456:	5d                   	pop    %ebp
    1457:	c3                   	ret    
    1458:	90                   	nop
    1459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001460 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1460:	55                   	push   %ebp
    1461:	89 e5                	mov    %esp,%ebp
    1463:	57                   	push   %edi
    1464:	56                   	push   %esi
    1465:	53                   	push   %ebx
    1466:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1469:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    146c:	8b 15 a4 1c 00 00    	mov    0x1ca4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1472:	8d 78 07             	lea    0x7(%eax),%edi
    1475:	c1 ef 03             	shr    $0x3,%edi
    1478:	47                   	inc    %edi
  if((prevp = freep) == 0){
    1479:	85 d2                	test   %edx,%edx
    147b:	0f 84 8f 00 00 00    	je     1510 <malloc+0xb0>
    1481:	8b 02                	mov    (%edx),%eax
    1483:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1486:	39 cf                	cmp    %ecx,%edi
    1488:	76 66                	jbe    14f0 <malloc+0x90>
    148a:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1490:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1495:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1498:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    149f:	eb 10                	jmp    14b1 <malloc+0x51>
    14a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    14a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    14aa:	8b 48 04             	mov    0x4(%eax),%ecx
    14ad:	39 f9                	cmp    %edi,%ecx
    14af:	73 3f                	jae    14f0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    14b1:	39 05 a4 1c 00 00    	cmp    %eax,0x1ca4
    14b7:	89 c2                	mov    %eax,%edx
    14b9:	75 ed                	jne    14a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    14bb:	89 34 24             	mov    %esi,(%esp)
    14be:	e8 35 fc ff ff       	call   10f8 <sbrk>
  if(p == (char*)-1)
    14c3:	83 f8 ff             	cmp    $0xffffffff,%eax
    14c6:	74 18                	je     14e0 <malloc+0x80>
  hp->s.size = nu;
    14c8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    14cb:	83 c0 08             	add    $0x8,%eax
    14ce:	89 04 24             	mov    %eax,(%esp)
    14d1:	e8 ea fe ff ff       	call   13c0 <free>
  return freep;
    14d6:	8b 15 a4 1c 00 00    	mov    0x1ca4,%edx
      if((p = morecore(nunits)) == 0)
    14dc:	85 d2                	test   %edx,%edx
    14de:	75 c8                	jne    14a8 <malloc+0x48>
        return 0;
  }
}
    14e0:	83 c4 1c             	add    $0x1c,%esp
        return 0;
    14e3:	31 c0                	xor    %eax,%eax
}
    14e5:	5b                   	pop    %ebx
    14e6:	5e                   	pop    %esi
    14e7:	5f                   	pop    %edi
    14e8:	5d                   	pop    %ebp
    14e9:	c3                   	ret    
    14ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    14f0:	39 cf                	cmp    %ecx,%edi
    14f2:	74 4c                	je     1540 <malloc+0xe0>
        p->s.size -= nunits;
    14f4:	29 f9                	sub    %edi,%ecx
    14f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    14f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    14fc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    14ff:	89 15 a4 1c 00 00    	mov    %edx,0x1ca4
}
    1505:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
    1508:	83 c0 08             	add    $0x8,%eax
}
    150b:	5b                   	pop    %ebx
    150c:	5e                   	pop    %esi
    150d:	5f                   	pop    %edi
    150e:	5d                   	pop    %ebp
    150f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1510:	b8 a8 1c 00 00       	mov    $0x1ca8,%eax
    1515:	ba a8 1c 00 00       	mov    $0x1ca8,%edx
    base.s.size = 0;
    151a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
    151c:	a3 a4 1c 00 00       	mov    %eax,0x1ca4
    base.s.size = 0;
    1521:	b8 a8 1c 00 00       	mov    $0x1ca8,%eax
    base.s.ptr = freep = prevp = &base;
    1526:	89 15 a8 1c 00 00    	mov    %edx,0x1ca8
    base.s.size = 0;
    152c:	89 0d ac 1c 00 00    	mov    %ecx,0x1cac
    1532:	e9 53 ff ff ff       	jmp    148a <malloc+0x2a>
    1537:	89 f6                	mov    %esi,%esi
    1539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
    1540:	8b 08                	mov    (%eax),%ecx
    1542:	89 0a                	mov    %ecx,(%edx)
    1544:	eb b9                	jmp    14ff <malloc+0x9f>
