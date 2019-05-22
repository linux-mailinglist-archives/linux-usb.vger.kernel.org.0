Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC0C262FC
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 13:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbfEVLbn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 07:31:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:39534 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728335AbfEVLbn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 07:31:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 04:31:43 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by orsmga003.jf.intel.com with ESMTP; 22 May 2019 04:31:41 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Carsten Schmid <carsten_schmid@mentor.com>,
        Stable <stable@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/5] usb: xhci: avoid null pointer deref when bos field is NULL
Date:   Wed, 22 May 2019 14:33:59 +0300
Message-Id: <1558524841-25397-4-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558524841-25397-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1558524841-25397-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Carsten Schmid <carsten_schmid@mentor.com>

With defective USB sticks we see the following error happen:
usb 1-3: new high-speed USB device number 6 using xhci_hcd
usb 1-3: device descriptor read/64, error -71
usb 1-3: device descriptor read/64, error -71
usb 1-3: new high-speed USB device number 7 using xhci_hcd
usb 1-3: device descriptor read/64, error -71
usb 1-3: unable to get BOS descriptor set
usb 1-3: New USB device found, idVendor=0781, idProduct=5581
usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
...
BUG: unable to handle kernel NULL pointer dereference at 0000000000000008

This comes from the following place:
[ 1660.215380] IP: xhci_set_usb2_hardware_lpm+0xdf/0x3d0 [xhci_hcd]
[ 1660.222092] PGD 0 P4D 0
[ 1660.224918] Oops: 0000 [#1] PREEMPT SMP NOPTI
[ 1660.425520] CPU: 1 PID: 38 Comm: kworker/1:1 Tainted: P     U  W  O    4.14.67-apl #1
[ 1660.434277] Workqueue: usb_hub_wq hub_event [usbcore]
[ 1660.439918] task: ffffa295b6ae4c80 task.stack: ffffad4580150000
[ 1660.446532] RIP: 0010:xhci_set_usb2_hardware_lpm+0xdf/0x3d0 [xhci_hcd]
[ 1660.453821] RSP: 0018:ffffad4580153c70 EFLAGS: 00010046
[ 1660.459655] RAX: 0000000000000000 RBX: ffffa295b4d7c000 RCX: 0000000000000002
[ 1660.467625] RDX: 0000000000000002 RSI: ffffffff984a55b2 RDI: ffffffff984a55b2
[ 1660.475586] RBP: ffffad4580153cc8 R08: 0000000000d6520a R09: 0000000000000001
[ 1660.483556] R10: ffffad4580a004a0 R11: 0000000000000286 R12: ffffa295b4d7c000
[ 1660.491525] R13: 0000000000010648 R14: ffffa295a84e1800 R15: 0000000000000000
[ 1660.499494] FS:  0000000000000000(0000) GS:ffffa295bfc80000(0000) knlGS:0000000000000000
[ 1660.508530] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1660.514947] CR2: 0000000000000008 CR3: 000000025a114000 CR4: 00000000003406a0
[ 1660.522917] Call Trace:
[ 1660.525657]  usb_set_usb2_hardware_lpm+0x3d/0x70 [usbcore]
[ 1660.531792]  usb_disable_device+0x242/0x260 [usbcore]
[ 1660.537439]  usb_disconnect+0xc1/0x2b0 [usbcore]
[ 1660.542600]  hub_event+0x596/0x18f0 [usbcore]
[ 1660.547467]  ? trace_preempt_on+0xdf/0x100
[ 1660.552040]  ? process_one_work+0x1c1/0x410
[ 1660.556708]  process_one_work+0x1d2/0x410
[ 1660.561184]  ? preempt_count_add.part.3+0x21/0x60
[ 1660.566436]  worker_thread+0x2d/0x3f0
[ 1660.570522]  kthread+0x122/0x140
[ 1660.574123]  ? process_one_work+0x410/0x410
[ 1660.578792]  ? kthread_create_on_node+0x60/0x60
[ 1660.583849]  ret_from_fork+0x3a/0x50
[ 1660.587839] Code: 00 49 89 c3 49 8b 84 24 50 16 00 00 8d 4a ff 48 8d 04 c8 48 89 ca 4c 8b 10 45 8b 6a 04 48 8b 00 48 89 45 c0 49 8b 86 80 03 00 00 <48> 8b 40 08 8b 40 03 0f 1f 44 00 00 45 85 ff 0f 84 81 01 00 00
[ 1660.608980] RIP: xhci_set_usb2_hardware_lpm+0xdf/0x3d0 [xhci_hcd] RSP: ffffad4580153c70
[ 1660.617921] CR2: 0000000000000008

Tracking this down shows that udev->bos is NULL in the following code:
(xhci.c, in xhci_set_usb2_hardware_lpm)
	field = le32_to_cpu(udev->bos->ext_cap->bmAttributes);  <<<<<<< here

	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
			enable ? "enable" : "disable", port_num + 1);

	if (enable) {
		/* Host supports BESL timeout instead of HIRD */
		if (udev->usb2_hw_lpm_besl_capable) {
			/* if device doesn't have a preferred BESL value use a
			 * default one which works with mixed HIRD and BESL
			 * systems. See XHCI_DEFAULT_BESL definition in xhci.h
			 */
			if ((field & USB_BESL_SUPPORT) &&
			    (field & USB_BESL_BASELINE_VALID))
				hird = USB_GET_BESL_BASELINE(field);
			else
				hird = udev->l1_params.besl;

The failing case is when disabling LPM. So it is sufficient to avoid
access to udev->bos by moving the instruction into the "enable" clause.

Cc: Stable <stable@vger.kernel.org>
Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9bb796..048a675 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4320,7 +4320,6 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	pm_addr = ports[port_num]->addr + PORTPMSC;
 	pm_val = readl(pm_addr);
 	hlpm_addr = ports[port_num]->addr + PORTHLPMC;
-	field = le32_to_cpu(udev->bos->ext_cap->bmAttributes);
 
 	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
 			enable ? "enable" : "disable", port_num + 1);
@@ -4332,6 +4331,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 			 * default one which works with mixed HIRD and BESL
 			 * systems. See XHCI_DEFAULT_BESL definition in xhci.h
 			 */
+			field = le32_to_cpu(udev->bos->ext_cap->bmAttributes);
 			if ((field & USB_BESL_SUPPORT) &&
 			    (field & USB_BESL_BASELINE_VALID))
 				hird = USB_GET_BESL_BASELINE(field);
-- 
2.7.4

