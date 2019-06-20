Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B4B4CA13
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 10:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731360AbfFTI4E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 04:56:04 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.208]:40655 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726168AbfFTI4E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 04:56:04 -0400
Received: from [67.219.251.50] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-west-2.aws.symcld.net id 0D/0A-14478-12A4B0D5; Thu, 20 Jun 2019 08:56:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsVySpdNU1fRizv
  WoOGxiEXz4vVsFouWtTJbHFu5mdWB2WPxnpdMHvvnrmH3+LxJLoA5ijUzLym/IoE1o+FoUUGL
  U8WflVuYGxiXWXcxcnEICWxmlLj1eTNzFyMnB5uAqcTKuftYQGwRAXmJWW8vMoLYzAJOEi9eH
  2AFsYUFfCWWbdwFVsMioCoxfdthIJuDg1cgQGLZ71CQsISAnMTJY5PBynkFBCVOznzCAjFGQu
  Lgixdgq4QEdCUuz//HPoGRexaSsllIyhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1NDYH0uZ
  6iVW6yXqlxbrlqcUlukZ6ieXFesWVuck5KXp5qSWbGIEBlVLQWbqDccaB13qHGCU5mJREeQ/o
  c8cK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuC18ADKCRalpqdWpGXmAIMbJi3BwaMkwuvvCZTmL
  S5IzC3OTIdInWI05lj1f94iZo7fG5YsYhZiycvPS5US59UAKRUAKc0ozYMbBIu6S4yyUsK8jA
  wMDEI8BalFuZklqPKvGMU5GJWEedNBpvBk5pXA7XsFdAoT0CkLZnOBnFKSiJCSamAq/bEjT5s
  7wDPThCG3crn8o4nxyxg/RngIXp0qVif6kOOxWqrQr+PiBUFZT2fHJNkc8KiZYmN5eiFbxJ8d
  iZWb1l0sesUu3TtF5vE3D8Fkp6l7zm40eXE4g+f/5NUCD3J/r+zpCal8FFCw5n9q0uQ/G2RkR
  Kbdv/rPWeJooc9JztR6MT83hk0BjK9mLv6S8PLMtYCt6Tbtkv7v13H4rtcx0Ap58V+M3b90zi
  XzMlEdRrYcey+3KZKb/75jmn3BJ6vxcVfxhOnnfNdU8u339p/eMUVi1tNLc+qMfC79rzxbrPV
  syyxvPnsh42/HTts5/9B6zHhpbejk/39iA1a9sndYfvdMRsWvF1f4TbPKzecosRRnJBpqMRcV
  JwIAa0ZOWjUDAAA=
X-Env-Sender: Kiruthika.Varadarajan@harman.com
X-Msg-Ref: server-9.tower-362.messagelabs.com!1561020952!9877239!2
X-Originating-IP: [202.45.6.41]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6626 invoked from network); 20 Jun 2019 08:56:01 -0000
Received: from unknown (HELO HIBDWSMB10.ad.harman.com) (202.45.6.41)
  by server-9.tower-362.messagelabs.com with DHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Jun 2019 08:56:01 -0000
Received: from hiawsmblxbld30.ad.harman.com (10.46.128.17) by
 HIBDWSMB10.ad.harman.com (10.99.236.104) with Microsoft SMTP Server id
 15.0.1365.1; Thu, 20 Jun 2019 14:25:56 +0530
From:   kvaradarajan <Kiruthika.Varadarajan@harman.com>
To:     <linux-usb@vger.kernel.org>
CC:     <prabhat.chand.pandey@intel.com>, <gregkh@linuxfoundation.org>
Subject: [PATCH] USB/Gadget: Fix race between gether_disconnect and rx_submit
Date:   Thu, 20 Jun 2019 08:55:56 +0000
Message-ID: <1561020956-17870-1-git-send-email-Kiruthika.Varadarajan@harman.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Kiruthika Varadarajan <Kiruthika.Varadarajan@harman.com>

During gadget connection/disconnect several times panic observed.

[ 64.723260] BUG: unable to handle kernel NULL pointer dereference at 0000
 0000000000f0
[ 64.732040] IP: [<ffffffff81736b6d>] rx_fill+0x1ed/0x3b0
[ 64.737984] PGD 6bece067 PUD 0
[ 64.741503] Oops: 0000 [#1] PREEMPT SMP
[ 64.802125] CPU: 0 PID: 636 Comm: kworker/u8:2 Tainted: G U W O 4.4.71-quilt-2e5dc0ac-g0b463804d692-dirty #45
[ 64.814092] Workqueue: uether process_rx_w
[ 64.818675] task: ffff8800779c40c0 ti: ffff88007702c000 task.ti: ffff88007702c000
[ 64.827040] RIP: 0010:[<ffffffff81736b6d>] [<ffffffff81736b6d>] rx_fill+0x1ed/0x3b0
[ 64.835706] RSP: 0000:ffff88007702fd80 EFLAGS: 00010246
[ 64.841642] RAX: 0000000000000000 RBX: ffff88006f2768c0 RCX: 0000000000000200
[ 64.849617] RDX: 00000000000001fd RSI: ffffffff82081f71 RDI: 00000000ffffffff
[ 64.857591] RBP: ffff88007702fdc8 R08: ffffc90000285000 R09: 0000000000000600
[ 64.865566] R10: ffff88002ab99670 R11: 0000000000000f7a R12: 0000000000000002
[ 64.873541] R13: ffff88006f2768f0 R14: 0000000000000600 R15: ffff88006bf6f118
[ 64.881509] FS: 0000000000000000(0000) GS:ffff88007ac00000(0000) knlGS:0000000000000000
[ 64.890545] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 64.896965] CR2: 00000000000000f0 CR3: 0000000065c99000 CR4: 00000000003406f0
[ 64.904936] Last Branch Records:
[ 64.908551] to: [<ffffffff81a50260>] page_fault+0x0/0x80
[ 64.914787] from: [<ffffffff81736b6d>] rx_fill+0x1ed/0x3b0
[ 64.921020] to: [<ffffffff81736b69>] rx_fill+0x1e9/0x3b0
[ 64.927253] from: [<ffffffff81736b63>] rx_fill+0x1e3/0x3b0
[ 64.933480] to: [<ffffffff81736b37>] rx_fill+0x1b7/0x3b0
[ 64.939704] from: [<ffffffff811804bd>] printk+0x4f/0x50
[ 64.945654] to: [<ffffffff811804b6>] printk+0x48/0x50
[ 64.951588] from: [<ffffffff810ecb60>] vprintk_default+0x20/0x30
[ 64.958403] to: [<ffffffff810ecb5f>] vprintk_default+0x1f/0x30
[ 64.965219] from: [<ffffffff810ec64f>] vprintk_emit+0x16f/0x530
[ 64.971941] to: [<ffffffff810ec641>] vprintk_emit+0x161/0x530
[ 64.978653] from: [<ffffffff810ec752>] vprintk_emit+0x272/0x530
[ 64.985383] to: [<ffffffff810ec752>] vprintk_emit+0x272/0x530
[ 64.992116] from: [<ffffffff81001387>] restore+0xd/0x16
[ 64.998059] to: [<ffffffff8100137a>] restore+0x0/0x16
[ 65.003999] from: [<ffffffff81001364>] ___preempt_schedule+0x12/0x14
[ 65.011205] to: [<ffffffff81001364>] ___preempt_schedule+0x12/0x14
[ 65.018411] from: [<ffffffff81a47a60>] preempt_schedule+0x20/0x30
[ 65.025324] to: [<ffffffff81a47a5f>] preempt_schedule+0x1f/0x30
[ 65.032228] from: [<ffffffff81a47a33>] preempt_schedule_common+0x33/0x40
[ 65.039835] to: [<ffffffff81a47a1f>] preempt_schedule_common+0x1f/0x40
[ 65.047427] from: [<ffffffff81a471db>] __schedule+0x36b/0xb90
[ 65.053952] to: [<ffffffff81a471bc>] __schedule+0x34c/0xb90
[ 65.060478] from: [<ffffffff810c1326>] finish_task_switch+0xb6/0x210
[ 65.067688] to: [<ffffffff810c12fb>] finish_task_switch+0x8b/0x210
[ 65.074886] from: [<ffffffff81a4db3a>] _raw_spin_unlock_irq+0x2a/0x40
[ 65.082190] to: [<ffffffff81a4db2e>] _raw_spin_unlock_irq+0x1e/0x40
[ 65.089494] from: [<ffffffff810bde65>] preempt_count_sub+0x35/0xb0
[ 65.096508] to: [<ffffffff810bde5b>] preempt_count_sub+0x2b/0xb0
[ 65.103511] from: [<ffffffff810bdea5>] preempt_count_sub+0x75/0xb0
[ 65.110517] to: [<ffffffff810bde9c>] preempt_count_sub+0x6c/0xb0
[ 65.117522] from: [<ffffffff810bde59>] preempt_count_sub+0x29/0xb0
[ 65.124530] to: [<ffffffff810bde30>] preempt_count_sub+0x0/0xb0
[ 65.131444] from: [<ffffffff81a4db29>] _raw_spin_unlock_irq+0x19/0x40
[ 65.138748] to: [<ffffffff81a4db23>] _raw_spin_unlock_irq+0x13/0x40
[ 65.146052] from: [<ffffffff81155389>] trace_hardirqs_on+0x9/0xf0
[ 65.152958] to: [<ffffffff81155380>] trace_hardirqs_on+0x0/0xf0
[ 65.159872] from: [<ffffffff81a4db1e>] _raw_spin_unlock_irq+0xe/0x40
[ 65.167065] to: [<ffffffff81a4db1e>] _raw_spin_unlock_irq+0xe/0x40
[ 65.174257] from: [<ffffffff810e58cb>] do_raw_spin_unlock+0x4b/0xa0
[ 65.181364] to: [<ffffffff810e5880>] do_raw_spin_unlock+0x0/0xa0
[ 65.188372] from: [<ffffffff81a4db19>] _raw_spin_unlock_irq+0x9/0x40
[ 65.195575] to: [<ffffffff81a4db10>] _raw_spin_unlock_irq+0x0/0x40
[ 65.202776] from: [<ffffffff810c12f6>] finish_task_switch+0x86/0x210
[ 65.209980] to: [<ffffffff810c1295>] finish_task_switch+0x25/0x210
[ 65.217183] from: [<ffffffff813dec08>] debug_smp_processor_id+0x18/0x20
[ 65.224676] to: [<ffffffff813dec07>] debug_smp_processor_id+0x17/0x20
[ 65.232171] from: [<ffffffff813deb26>] check_preemption_disabled+0x26/0xf0
[ 65.239952] to: [<ffffffff813deb00>] check_preemption_disabled+0x0/0xf0
[ 65.247632] from: [<ffffffff813dec02>] debug_smp_processor_id+0x12/0x20
[ 65.255124] to: [<ffffffff813debf0>] debug_smp_processor_id+0x0/0x20
[ 65.262521] from: [<ffffffff810c1290>] finish_task_switch+0x20/0x210
[ 65.269734] to: [<ffffffff810c1270>] finish_task_switch+0x0/0x210
[ 65.276831] from: [<ffffffff81a471b7>] __schedule+0x347/0xb90
[ 65.283353] to: [<ffffffff81a47184>] __schedule+0x314/0xb90
[ 65.289871] from: [<ffffffff81003677>] __switch_to+0x297/0x5a0
[ 65.296486] to: [<ffffffff81003666>] __switch_to+0x286/0x5a0
[ 65.303092] from: [<ffffffff81003654>] __switch_to+0x274/0x5a0
[ 65.309728] to: [<ffffffff81003610>] __switch_to+0x230/0x5a0
[ 65.316352] from: [<ffffffff81003600>] __switch_to+0x220/0x5a0
[ 65.322972] to: [<ffffffff810035d3>] __switch_to+0x1f3/0x5a0
[ 65.329582] from: [<ffffffff810035c3>] __switch_to+0x1e3/0x5a0
[ 65.336203] to: [<ffffffff81003525>] __switch_to+0x145/0x5a0
[ 65.342821] from: [<ffffffff810034ce>] __switch_to+0xee/0x5a0
[ 65.349343] Stack:
[ 65.351585] 0000000000000286 ffff88006bd22548 024000c081a4dae8 ffff88006f276918
[ 65.359856] 0000000000000000 0000000000000000 ffff88006f276938 ffff88006f2768c0
[ 65.368143] ffff88006f2769a8 ffff88007702fe00 ffffffff81736f5f ffff88006f2769a8
[ 65.376447] Call Trace:
[ 65.379176] [<ffffffff81736f5f>] process_rx_w+0xcf/0x130
[ 65.385213] [<ffffffff810b29aa>] process_one_work+0x14a/0x450
[ 65.391736] [<ffffffff810b2fe6>] worker_thread+0x66/0x450
[ 65.397868] [<ffffffff810b2f80>] ? rescuer_thread+0x2d0/0x2d0
[ 65.404391] [<ffffffff810b2f80>] ? rescuer_thread+0x2d0/0x2d0
[ 65.410911] [<ffffffff810b80ad>] kthread+0xfd/0x120
[ 65.416456] [<ffffffff810b7fb0>] ? kthread_create_on_node+0x190/0x190
[ 65.423755] [<ffffffff81a4e46f>] ret_from_fork+0x3f/0x70
[ 65.429785] [<ffffffff810b7fb0>] ? kthread_create_on_node+0x190/0x190
[ 65.437077] Code: 4c 89 c9 41 83 e9 01 4d 63 c9 4d 01 f1 4c 89 c8 48 f7 f1 8b 83 b0 00 00 00 49 29 d1 4d 89 ce 85 c0 74 04 4c 0f af f0 48 8b 43 18 <80> b8 f0 00 00 00 00 0f 85 78 01 00 00 48 8b 73 20 4c 89 f1 48
[ 65.458462] RIP [<ffffffff81736b6d>] rx_fill+0x1ed/0x3b0
[ 65.464493] RSP <ffff88007702fd80>
[ 65.468388] CR2: 00000000000000f0
[ 65.472090] ---[ end trace 5a9d1e73247ee2aa ]---
[ 65.479952] Kernel panic - not syncing: Fatal exception
[ 65.486167] intel_tasks_dumper: intel_task_panic_hndl: Skip tasks dumper.
[ 65.493763] reboot: panic mode set: p,w
[ 65.498045] Kernel Offset: disabled
[ 65.509960] Rebooting in 10 seconds..

On spin lock release in rx_submit, gether_disconnect get
a chance to run, it makes port_usb NULL, rx_submit access
NULL port USB, hence the above crash.

Fixed by releasing the lock in rx_submit after port_usb
is used.

Signed-off-by: Kiruthika Varadarajan <Kiruthika.Varadarajan@harman.com>
---
 drivers/usb/gadget/function/u_ether.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 737bd77..76cf1e4 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -186,11 +186,11 @@ static void defer_kevent(struct eth_dev *dev, int flag)
 		out = dev->port_usb->out_ep;
 	else
 		out = NULL;
-	spin_unlock_irqrestore(&dev->lock, flags);
 
-	if (!out)
+	if (!out) {
+		spin_unlock_irqrestore(&dev->lock, flags);
 		return -ENOTCONN;
-
+	}
 
 	/* Padding up to RX_EXTRA handles minor disagreements with host.
 	 * Normally we use the USB "terminate on short read" convention;
@@ -215,6 +215,7 @@ static void defer_kevent(struct eth_dev *dev, int flag)
 	if (dev->port_usb->is_fixed)
 		size = max_t(size_t, size, dev->port_usb->fixed_out_len);
 
+	spin_unlock_irqrestore(&dev->lock, flags);
 	skb = __netdev_alloc_skb(dev->net, size + NET_IP_ALIGN, gfp_flags);
 	if (skb == NULL) {
 		DBG(dev, "no rx skb\n");
-- 
1.9.1

