Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7C673006
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 15:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbfGXNg3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 09:36:29 -0400
Received: from mail.seal-one.com ([194.9.72.89]:58240 "EHLO mail.seal-one.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726688AbfGXNg3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jul 2019 09:36:29 -0400
X-Greylist: delayed 502 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Jul 2019 09:36:29 EDT
Received: from [192.168.0.13] (limes.novosec.com [46.252.142.130])
        by mail.seal-one.com (Postfix) with ESMTPSA id E909E200116
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2019 15:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=seal-one.com; s=mail;
        t=1563974872; bh=JFk8lWWDZU6F7rRQXAkP8qXdx+8wBNMJfsCG800M3nc=;
        h=From:Subject:Date:To:From;
        b=R25B0523E9kD2z7g5ZUvMIaGRiVsaGqkLqENq+z1bT5P8LyM+nZ+pLfK8MMU+5wuA
         w+swx9EAybUHOR+W6mXgTN04hWzw8+8j/1TmNgFo7N5TgDk8qxSiWTPGBjFvK17iBZ
         o+07whJw3biS6M69u9zqr+Wq3g328Q9kko6TkOlg=
From:   Maik Stohn <maik.stohn@seal-one.com>
Content-Type: multipart/signed;
        boundary="Apple-Mail=_60A8C851-3FF8-4347-93BE-69F763C51EB4";
        protocol="application/pkcs7-signature";
        micalg=sha-256
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: KERNEL CRASH when using XHCI devices (affects any architecture, any
 USB device)  
Message-Id: <21B63064-BAD5-4DC3-8E1A-3986CD948A93@seal-one.com>
Date:   Wed, 24 Jul 2019 15:27:51 +0200
To:     linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.11)
X-Virus-Scanned: clamav-milter 0.100.3 at mail.seal-one.com
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Apple-Mail=_60A8C851-3FF8-4347-93BE-69F763C51EB4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

KERNEL CRASH when using XHCI devices (affects any architecture, any USB =
device)=20

This was already reported as a kernel bug in bugzilla =
(https://bugzilla.kernel.org/show_bug.cgi?id=3D204257) but I got told to =
report it here since it is usb related...

Affected kernels: 5.2, 5.2.1, 5.2.2, 5.3-rc1, ...

This bug is already causing real world problems with existing software =
and devices using SCSI BOT with raw SCSI commands and libusb software.

Reproduce (tested on several different machines with =
5.2,5.2.1,5.2.2,5.3rc1):

 - usb flash drive attached to XHCI controller (e.g. USB3.0 flash drive =
attached to USB3.0 port)
 - generic scsi module loaded (e.g. /dev/sg0 comes up when attaching the =
flash drive)
 - command line tool "sg_raw" from "sg3-utils"
 - execute: and press a key + return (-s1 sends one byte which is read =
from stdin)
   $ sudo sg_raw -s1 /dev/sg0 00 00 00 00 00 00 00 00 00 00
  =20
 -> KERNEL Oops
=20
 - same for -s2, -s3, ... up to -s8   (sending 1 to 8 bytes, exactly the =
maximum of bytes on my 64 bit machine where the "DMA bypass optimization =
/ IDT" kicks in, see below)
=20
Since this can be triggered by any normal user (without any special USB =
device needed) I think it is important enough to fix it for the existing =
5.2 kernel as well.

---

Patch introducing the crash:  =
https://patchwork.kernel.org/patch/10919167 / commit =
33e39350ebd20fe6a77a51b8c21c3aa6b4a208cf - "usb: xhci: add Immediate =
Data Transfer support"

Reason: NULL pointer dereference

---

I took me quite some time to find the cause of this.

I narrowed the crash down to the place inside of "xhci_queue_bulk_tx" in =
"xhci-ring.c" where the next SG is loaded

...
    while (sg && sent_len >=3D block_len) {
      /* New sg entry */
      --num_sgs;
      sent_len -=3D block_len;
      if (num_sgs !=3D 0) {
        sg =3D sg_next(sg);
        block_len =3D sg_dma_len(sg);           <=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D CRASH
                                                                 The =
comment of "sg_dma_len" clearly states "These macros should be used =
after a dma_map_sg call has been done..." - which was=20
                                                                 omitted =
by the new "xhci_map_urb_for_dma" function since the transfer was =
considered suitable for IDT.
        addr =3D (u64) sg_dma_address(sg);
        addr +=3D sent_len;
      }
    }
    block_len -=3D sent_len;
    send_addr =3D addr;
...

This only happens if the transfer was cosnideres suitable for IDT.=20
When I patched the function "xhci_urb_suitable_for_idt" to always return =
false (nothing suitable for IDT) everything was working fine.=20


Unfortunately I'm not deep enough into the inner workings of the kernel =
usb host driver to find a solution for this other than reverting the =
patch for IDT.


Greetings,

Maik Stohn


kernel.log:

Jul 19 16:43:29 lenovo kernel: BUG: kernel NULL pointer dereference, =
address: 0000000000000018
Jul 19 16:43:29 lenovo kernel: #PF: supervisor read access in kernel =
mode
Jul 19 16:43:29 lenovo kernel: #PF: error_code(0x0000) - not-present =
page
Jul 19 16:43:29 lenovo kernel: PGD 0 P4D 0=20
Jul 19 16:43:29 lenovo kernel: Oops: 0000 [#1] PREEMPT SMP PTI
Jul 19 16:43:29 lenovo kernel: CPU: 3 PID: 3901 Comm: usb-storage =
Tainted: P          IOE     5.2.1-arch1-1-ARCH #1
Jul 19 16:43:29 lenovo kernel: Hardware name: LENOVO 20287/AILZAZBZC, =
BIOS 8DCN26WW 09/23/2013
Jul 19 16:43:29 lenovo kernel: RIP: 0010:xhci_queue_bulk_tx+0x285/0x990 =
[xhci_hcd]
Jul 19 16:43:29 lenovo kernel: Code: 77 38 48 85 ed 74 33 48 89 ef eb 0a =
48 85 ff 74 26 44 39 e3 72 21 44 29 e3 41 83 ee 01 74 ed e8 71 a2 1e e0 =
4c 63 d3 48 89 c7 <44> 8b 60 18 4c 03 50 10 >
Jul 19 16:43:29 lenovo kernel: RSP: 0018:ffffa7e6c1ce3b20 EFLAGS: =
00010046
Jul 19 16:43:29 lenovo kernel: RAX: 0000000000000000 RBX: =
0000000000000000 RCX: 0000000000000410
Jul 19 16:43:29 lenovo kernel: RDX: ffff8b9112353ab0 RSI: =
0000000000000010 RDI: 0000000000000000
Jul 19 16:43:29 lenovo kernel: RBP: ffff8b9113c5d570 R08: =
0000000000000000 R09: 0000000000000000
Jul 19 16:43:29 lenovo kernel: R10: 0000000000000000 R11: =
0000000000000000 R12: 0000000000000000
Jul 19 16:43:29 lenovo kernel: R13: 0000000000000410 R14: =
00000000ffffffff R15: 0000000000000001
Jul 19 16:43:29 lenovo kernel: FS:  0000000000000000(0000) =
GS:ffff8b91572c0000(0000) knlGS:0000000000000000
Jul 19 16:43:29 lenovo kernel: CS:  0010 DS: 0000 ES: 0000 CR0: =
0000000080050033
Jul 19 16:43:29 lenovo kernel: CR2: 0000000000000018 CR3: =
0000000053a0a002 CR4: 00000000001606e0
Jul 19 16:43:29 lenovo kernel: Call Trace:
Jul 19 16:43:29 lenovo kernel:  ? __switch_to_asm+0x41/0x70
Jul 19 16:43:29 lenovo kernel:  ? finish_task_switch+0x84/0x2d0
Jul 19 16:43:29 lenovo kernel:  ? __switch_to+0x87/0x460
Jul 19 16:43:29 lenovo kernel:  xhci_urb_enqueue+0x334/0x5b0 [xhci_hcd]
Jul 19 16:43:29 lenovo kernel:  usb_hcd_submit_urb+0xc7/0xbb0
Jul 19 16:43:29 lenovo kernel:  ? __kmalloc+0x189/0x220
Jul 19 16:43:29 lenovo kernel:  ? usb_alloc_urb+0x3e/0x60
Jul 19 16:43:29 lenovo kernel:  usb_sg_wait+0x7b/0x150
Jul 19 16:43:29 lenovo kernel:  =
usb_stor_bulk_transfer_sglist.part.0+0x71/0xd0 [usb_storage]
Jul 19 16:43:29 lenovo kernel:  usb_stor_bulk_srb+0x60/0x90 =
[usb_storage]
Jul 19 16:43:29 lenovo kernel:  usb_stor_Bulk_transport+0x179/0x3f0 =
[usb_storage]
Jul 19 16:43:29 lenovo kernel:  usb_stor_invoke_transport+0x63/0x520 =
[usb_storage]
Jul 19 16:43:29 lenovo kernel:  usb_stor_control_thread+0x233/0x300 =
[usb_storage]
Jul 19 16:43:29 lenovo kernel:  kthread+0xfd/0x130
Jul 19 16:43:29 lenovo kernel:  ? fill_inquiry_response+0x40/0x40 =
[usb_storage]
Jul 19 16:43:29 lenovo kernel:  ? kthread_park+0x90/0x90
Jul 19 16:43:29 lenovo kernel:  ret_from_fork+0x35/0x40
Jul 19 16:43:29 lenovo kernel: Modules linked in: hid_generic uas usbhid =
usb_storage hid rfcomm fuse xt_CHECKSUM xt_MASQUERADE xt_conntrack =
ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mang>


--Apple-Mail=_60A8C851-3FF8-4347-93BE-69F763C51EB4
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

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
AAAAAA==
--Apple-Mail=_60A8C851-3FF8-4347-93BE-69F763C51EB4--
