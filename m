Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD39BB766
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 17:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbfIWPAF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 11:00:05 -0400
Received: from st43p00im-ztdg10061801.me.com ([17.58.63.170]:44740 "EHLO
        st43p00im-ztdg10061801.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727020AbfIWPAF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 11:00:05 -0400
X-Greylist: delayed 392 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Sep 2019 11:00:04 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1569250412; bh=MnbkURa/jm7q3dhiqaQRdwGuJTqbKet6v+GpMuYbkv0=;
        h=Content-Type:Subject:From:Date:Message-Id:To;
        b=NjBFIg1gOpoer8EtKlw11yg/Y8aPHb2TsRcR3s8QDVzaHtavEbTw1EIPc5swyiL5I
         os2llXwlpt6/OC0a4OPTzt4sQYVm32KqoacI1iF/FGs+fFvXBRhuoxsjjyEyyonMt7
         iixMs/LJ4qyOlX38M/lKJ03wY098gLE3jUMu/GkqZeLshmUvfPrjOirGGt8k9Ubkh+
         1099OWZcbRkBbGMWbPY0prDjCilKUvQJgo/ubezOGFrjYRDv4Zq0NBY0+q94vit+A9
         e7ce6zCL+v/CP9W691TM4mL0JaQ7yNBsfdtsqX7RQotJHwpvRlp/CyAtHuZRMM3GiH
         rqwz7AjyKI2zg==
Received: from alexanders-imac.fritz.box (p4FE1E4E7.dip0.t-ipconnect.de [79.225.228.231])
        by st43p00im-ztdg10061801.me.com (Postfix) with ESMTPSA id 1A9068C0614;
        Mon, 23 Sep 2019 14:53:30 +0000 (UTC)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.2\))
Subject: Re: KASAN: use-after-free Read in appledisplay_bl_get_brightness
From:   =?utf-8?Q?Alexander_Thei=C3=9Fen?= <alex.theissen@me.com>
In-Reply-To: <00000000000042d60805933945b5@google.com>
Date:   Mon, 23 Sep 2019 16:53:29 +0200
Cc:     2pi@mok.nu, andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <3087BA08-AFF5-4000-82F0-6FD65430BD7D@me.com>
References: <00000000000042d60805933945b5@google.com>
To:     syzbot <syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com>
X-Mailer: Apple Mail (2.3594.4.2)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-23_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909230142
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

just by looking at appledisplay_probe() I would say that the problem =
here is that usb_submit_urb() is called while the probe function can =
still fail. If it fails after submitting the urb the work item could =
already been scheduled from appledisplay_complete() and therefore =
operates on freed data.

Regards,
Alexander


> On 23. Sep 2019, at 16:31, syzbot =
<syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com> wrote:
>=20
> Hello,
>=20
> syzbot found the following crash on:
>=20
> HEAD commit:    e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: =
https://syzkaller.appspot.com/x/log.txt?x=3D13714ad9600000
> kernel config:  =
https://syzkaller.appspot.com/x/.config?x=3D8847e5384a16f66a
> dashboard link: =
https://syzkaller.appspot.com/bug?extid=3D495dab1f175edc9c2f13
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      =
https://syzkaller.appspot.com/x/repro.syz?x=3D1653d945600000
> C reproducer:   =
https://syzkaller.appspot.com/x/repro.c?x=3D15176945600000
>=20
> IMPORTANT: if you fix the bug, please add the following tag to the =
commit:
> Reported-by: syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: use-after-free in =
appledisplay_bl_get_brightness+0x1ac/0x1c0 =
drivers/usb/misc/appledisplay.c:167
> Read of size 8 at addr ffff8881cfc576a0 by task kworker/1:0/17
>=20
> CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.0+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 01/01/2011
> Workqueue: events appledisplay_work
> Call Trace:
> __dump_stack lib/dump_stack.c:77 [inline]
> dump_stack+0xca/0x13e lib/dump_stack.c:113
> print_address_description+0x6a/0x32c mm/kasan/report.c:351
> __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
> kasan_report+0xe/0x12 mm/kasan/common.c:618
> appledisplay_bl_get_brightness+0x1ac/0x1c0 =
drivers/usb/misc/appledisplay.c:167
> appledisplay_work+0x36/0x160 drivers/usb/misc/appledisplay.c:187
> process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> kthread+0x318/0x420 kernel/kthread.c:255
> ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>=20
> Allocated by task 83:
> save_stack+0x1b/0x80 mm/kasan/common.c:69
> set_track mm/kasan/common.c:77 [inline]
> __kasan_kmalloc mm/kasan/common.c:493 [inline]
> __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
> kmalloc include/linux/slab.h:552 [inline]
> kzalloc include/linux/slab.h:748 [inline]
> appledisplay_probe+0x15a/0xb37 drivers/usb/misc/appledisplay.c:218
> usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> really_probe+0x281/0x6d0 drivers/base/dd.c:548
> driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
> __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> __device_attach+0x217/0x360 drivers/base/dd.c:894
> bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> device_add+0xae6/0x16f0 drivers/base/core.c:2201
> usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> really_probe+0x281/0x6d0 drivers/base/dd.c:548
> driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
> __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> __device_attach+0x217/0x360 drivers/base/dd.c:894
> bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> device_add+0xae6/0x16f0 drivers/base/core.c:2201
> usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
> hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> port_event drivers/usb/core/hub.c:5359 [inline]
> hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
> process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> kthread+0x318/0x420 kernel/kthread.c:255
> ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>=20
> Freed by task 83:
> save_stack+0x1b/0x80 mm/kasan/common.c:69
> set_track mm/kasan/common.c:77 [inline]
> __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
> slab_free_hook mm/slub.c:1423 [inline]
> slab_free_freelist_hook mm/slub.c:1474 [inline]
> slab_free mm/slub.c:3016 [inline]
> kfree+0xe4/0x2f0 mm/slub.c:3957
> appledisplay_probe+0x772/0xb37 drivers/usb/misc/appledisplay.c:312
> usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> really_probe+0x281/0x6d0 drivers/base/dd.c:548
> driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
> __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> __device_attach+0x217/0x360 drivers/base/dd.c:894
> bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> device_add+0xae6/0x16f0 drivers/base/core.c:2201
> usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> really_probe+0x281/0x6d0 drivers/base/dd.c:548
> driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
> __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
> bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> __device_attach+0x217/0x360 drivers/base/dd.c:894
> bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> device_add+0xae6/0x16f0 drivers/base/core.c:2201
> usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
> hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> port_event drivers/usb/core/hub.c:5359 [inline]
> hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
> process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> kthread+0x318/0x420 kernel/kthread.c:255
> ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>=20
> The buggy address belongs to the object at ffff8881cfc57680
> which belongs to the cache kmalloc-512 of size 512
> The buggy address is located 32 bytes inside of
> 512-byte region [ffff8881cfc57680, ffff8881cfc57880)
> The buggy address belongs to the page:
> page:ffffea00073f1580 refcount:1 mapcount:0 mapping:ffff8881da002500 =
index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 dead000000000100 dead000000000122 =
ffff8881da002500
> raw: 0000000000000000 00000000000c000c 00000001ffffffff =
0000000000000000
> page dumped because: kasan: bad access detected
>=20
> Memory state around the buggy address:
> ffff8881cfc57580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cfc57600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>> ffff8881cfc57680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                               ^
> ffff8881cfc57700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff8881cfc57780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>=20
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

