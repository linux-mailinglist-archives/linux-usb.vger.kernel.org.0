Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068A021CAB7
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jul 2020 19:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgGLRcw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jul 2020 13:32:52 -0400
Received: from crapouillou.net ([89.234.176.41]:41932 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728882AbgGLRcw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 12 Jul 2020 13:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1594575169; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:content-transfer-encoding:in-reply-to:
         references; bh=Jl9sMbotBoFxjS8mOnQpdRxUlMPwm3S5bXXI7/kn6hg=;
        b=aCF0OIjxs6mijYBXp5VknjHnXmM+RLjBAkwN5ad589uEKjqSXRQmomSNyYPUthqjxsxXVm
        wjrf/Nq1zKSBoZ7wHbQ1fFmpW/R39XSYMrUdwlzwSrw2ywgAmJaW08MDaskg7waqGlOyu9
        mB+A1Bajx+R19XA6MR3RYoaPiY9fS9o=
Date:   Sun, 12 Jul 2020 19:32:39 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Segfault in MUSB core
To:     Bin Liu <b-liu@ti.com>
Cc:     Linux USB List <linux-usb@vger.kernel.org>, od@zcrc.me
Message-Id: <F2ADDQ.J4D20OIYC0823@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bin,

I'm trying to squash a bug that's been annoying me for a while. On 
older Ingenic SoCs, trying to telnet after a reboot seems to result in 
a 50% chance of having a kernel oops. It does happen on newer SoCs too 
but much less often.

Looking at the stack trace, it happens to segfault within musb_g_tx(), 
when it's called by musb_interrupt(). But the reason why it segfaults 
is beyond me.

I can only guess it is related to the two error messages that can be 
seen before the stack trace, but again I am clueless about why these 
pop up.

Any ideas about what's happening here?

Thanks,
-Paul

------------------------

[ 26.459013] musb-hdrc musb-hdrc.0.auto: could not add resume work 
93e7adf0
[ 26.472959] musb-hdrc musb-hdrc.0.auto: musb_gadget_queue resume work: 
-150
[ 27.462159] CPU 0 Unable to handle kernel paging request at virtual 
address 00000104, epc == 802c5858, ra == 802c6370
[ 27.483622] Oops[#1]:
[ 27.488282] CPU: 0 PID: 3 Comm: kworker/0:0 Not tainted 5.8.0-rc4+ #37
[ 27.501449] Workqueue: pm 0x80285f6c
[ 27.508700] $ 0 : 00000000 10000000 00000122 00000100
[ 27.519257] $ 4 : 8124e484 80a37d80 00000000 00002004
[ 27.529815] $ 8 : 00000000 81028000 804a3108 00000000
[ 27.540372] $12 : 804a310c fffffffd 00000000 77ce4890
[ 27.550932] $16 : 000020a2 80a37d80 00000000 00000001
[ 27.561489] $20 : 8124e4d4 b3040000 8124e484 b3040010
[ 27.572049] $24 : 00000000 802bfff0
[ 27.582608] $28 : 81080000 8102bbe0 80540000 802c6370
[ 27.593170] Hi : 0000004a
[ 27.599015] Lo : 00000000
[ 27.604867] epc : 802c5858 0x802c5858
[ 27.612636] ra : 802c6370 0x802c6370
[ 27.620394] Status: 10000002 KERNEL EXL
[ 27.628338] Cause : 0080000c (ExcCode 03)
[ 27.636440] BadVA : 00000104
[ 27.642289] PrId : 1ed0024f (Ingenic XBurst)
[ 27.651123] Process kworker/0:0 (pid: 3, threadinfo=6c73c9fe, 
task=3b071406, tls=00000000)
[ 27.667828] Stack : 00000000 80884cc0 80a34280 81376000 000020a2 
80a37d80 8124e080 802c6370
[ 27.684738] 80893e40 8033ea00 8124e4b0 00002004 4f4bf699 00000000 
8126c81c 803412e0
[ 27.701649] 8124e080 00000000 00000001 00000000 80540000 0000001b 
804016b4 804b0000
[ 27.718557] 00000001 802c2f2c 00000000 89b20000 00000000 81376000 
0000001b 80893e00
[ 27.735465] 10000000 8035dd00 00000002 80893e00 8124e080 804a8d38 
8124e080 00000000
[ 27.752376] ...
[ 27.757361] Call Trace:
[ 27.757382] [<802c6370>] 0x802c6370 drivers/usb/musb/musb_gadget.c:500
[ 27.769417] [<8033ea00>] 0x8033ea00 include/linux/netdevice.h:4626
[ 27.776497] [<803412e0>] 0x803412e0 include/linux/netdevice.h:131
[ 27.783577] [<802c2f2c>] 0x802c2f2c drivers/usb/musb/musb_core.c:1775 
(discriminator 2)
[ 27.790657] [<8035dd00>] 0x8035dd00 include/net/sch_generic.h:1088
[ 27.797738] [<802c8098>] 0x802c8098 drivers/usb/musb/jz4740.c:51
[ 27.804817] [<800b5764>] 0x800b5764 mm/slab.c:3313
[ 27.811897] [<800557a8>] 0x800557a8 kernel/irq/handle.c:156
[ 27.818975] [<8033eca8>] 0x8033eca8 include/net/pkt_sched.h:134
[ 27.826055] [<8033eb04>] 0x8033eb04 include/net/dst.h:271
[ 27.833136] [<80055884>] 0x80055884 kernel/irq/handle.c:198
[ 27.840214] [<8005912c>] 0x8005912c kernel/irq/generic-chip.c:44
[ 27.847292] [<802cf544>] 0x802cf544 include/linux/netdevice.h:3739
[ 27.854371] [<80055904>] 0x80055904 kernel/irq/handle.c:216
[ 27.861449] [<802c58b8>] 0x802c58b8 drivers/usb/musb/musb_gadget.c:150
[ 27.868528] [<8005827c>] 0x8005827c include/linux/irq.h:331
[ 27.875607] [<802c4cd4>] 0x802c4cd4 drivers/usb/musb/musb_gadget.c:394 
(discriminator 4)
[ 27.882686] [<80055120>] 0x80055120 kernel/irq/irqdesc.c:651
[ 27.889766] [<801f1f00>] 0x801f1f00 drivers/irqchip/irq-ingenic.c:54
[ 27.896848] [<800557a8>] 0x800557a8 kernel/irq/handle.c:156
[ 27.903929] [<80055884>] 0x80055884 kernel/irq/handle.c:198
[ 27.911011] [<8005841c>] 0x8005841c kernel/irq/chip.c:908
[ 27.918092] [<80055120>] 0x80055120 kernel/irq/irqdesc.c:651
[ 27.925171] [<803f6b58>] 0x803f6b58 arch/mips/kernel/irq.c:108
[ 27.932252] [<800558b0>] 0x800558b0 kernel/irq/handle.c:203
[ 27.939331] [<8005917c>] 0x8005917c kernel/irq/generic-chip.c:103
[ 27.946411] [<801f1dfc>] 0x801f1dfc drivers/irqchip/irq-mips-cpu.c:146
[ 27.953490] [<80057e30>] 0x80057e30 kernel/irq/chip.c:173
[ 27.960569] [<80014d64>] 0x80014d64 arch/mips/kernel/genex.S:226
[ 27.967647] [<80382a98>] 0x80382a98 net/ipv4/inet_connection_sock.c:717
[ 27.974727] [<80055120>] 0x80055120 kernel/irq/irqdesc.c:651
[ 27.981810] [<801f1cc0>] 0x801f1cc0 
arch/mips/include/asm/mipsregs.h:2875
[ 27.988890] [<803f6bf4>] 0x803f6bf4 kernel/softirq.c:295
[ 27.995971] [<800558b0>] 0x800558b0 kernel/irq/handle.c:203
[ 28.003049] [<8002c120>] 0x8002c120 
arch/mips/include/asm/irqflags.h:118
[ 28.010130] [<8005841c>] 0x8005841c kernel/irq/chip.c:908
[ 28.017212] [<8002c2a0>] 0x8002c2a0 kernel/softirq.c:400
[ 28.024292] [<801f1dfc>] 0x801f1dfc drivers/irqchip/irq-mips-cpu.c:146
[ 28.031372] [<80283c8c>] 0x80283c8c drivers/base/power/generic_ops.c:41
[ 28.038451] [<80014d64>] 0x80014d64 arch/mips/kernel/genex.S:226
[ 28.045521]
[ 28.048589] Code: 8ca2003c 8ca30038 90920059 <ac620004> ac430000 
24020100 aca20038 8ca30030 24020122
[ 28.068299]
[ 28.071374] ---[ end trace bc487b9161cb41e4 ]---
[ 28.080705] Kernel panic - not syncing: Fatal exception in interrupt
[ 28.093529] ---[ end Kernel panic - not syncing: Fatal exception in 
interrupt ]---



