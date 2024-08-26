Return-Path: <linux-usb+bounces-14094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8595EC7F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 10:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F11871F22FB8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 08:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9D913D63D;
	Mon, 26 Aug 2024 08:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OvqaVSaV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424A18027;
	Mon, 26 Aug 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662551; cv=none; b=sbZPWNkvmMjnDGj/XnLbURWdWvp/5NO0gf+2oCETT2x357SJFqPLWHDYvjicCtxmeX2OsEortuh3s1Wi/4msForWasB6znA4OdYIKOn/5a2Yhuw9HSHo3W5hqgO0Klk4uJZDDsjEQ97ziXD8CiNOhBanGHMQkyOlZ4v9WORHX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662551; c=relaxed/simple;
	bh=LkbWTSUkA/HXQNOCmkB1V3Z/0VHtPAfPH1Tmuhr4P2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A0URzu0usDT532hQS6FnDNwS+6TWpsHdZhV7vAcYkWygGVbC0gePijwY/tvCYLoI5yeXQjshSXEj2ph1VRCiszuCLSHdVDzPIGBhsVvJc6haCtButDJ753olw/fW/JxD/A7hX0cUV/YKox5QbacJr0bihGuqOPAcOPQPKHdwFXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OvqaVSaV; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1724662516;
	bh=k/35Lo2hD9f+cYcBT0jFAFSH8VVNZid0dlX0kgt9qjA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OvqaVSaVg9jEt0KQvnL1gRvWDYj3+jyPlkaWGQtwZ/8U9a9kLEcp+jkiQBAQzYDDU
	 6S2QysvhGROfES5Qr8Pv0vvxpkbcA0RmZmuTEmyZuHh4JFK/DgpptzyLAlL6fpAjvu
	 xTiwsBqOqG6dpfGzebrSEP0KIrXtkABFFJJpZlsc=
X-QQ-mid: bizesmtp89t1724662507tk6hdop8
X-QQ-Originating-IP: BM4d1iZd248hf9efdPXelNY78YnbewOSPPCDN+jurLo=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Aug 2024 16:55:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7241265521874854059
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	leoliu-oc@zhaoxin.com,
	dlemoal@kernel.org,
	arnd@kernel.org,
	wangyuli@uniontech.com,
	schnelle@linux.ibm.com,
	WeitaoWang-oc@zhaoxin.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	ulf.hansson@linaro.org,
	vkoul@kernel.org,
	hslester96@gmail.com,
	Carsten_Schmid@mentor.com,
	efremov@linux.com,
	tonywwang@zhaoxin.com,
	weitaowang@zhaoxin.com,
	CobeChen@zhaoxin.com,
	TimGuo@zhaoxin.com,
	wwt8723@163.com,
	stern@rowland.harvard.edu,
	alex.williamson@redhat.com,
	guanwentao@uniontech.com,
	xuerpeng@uniontech.com
Subject: [PATCH v2] USB: Fix kernel NULL pointer when unbind UHCI form vfio-pci
Date: Mon, 26 Aug 2024 16:54:55 +0800
Message-ID: <42A38D045199FD79+20240826085455.1525536-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

From: leoliu-oc <leoliu-oc@zhaoxin.com>

This bug is found in Zhaoxin platform, but it's a commom code bug.

Fail sequence:
step1: Unbind UHCI controller from native driver;
step2: Bind UHCI controller to vfio-pci, which will put UHCI controller in
	   one vfio group's device list and set UHCI's dev->driver_data to
	   struct vfio-pci(for UHCI)
step3: Unbind EHCI controller from native driver, will try to tell UHCI
	   native driver that "I'm removed by set
	   companion_hcd->self.hs_companion to NULL. However, companion_hcd
	   get from UHCI's dev->driver_data that has modified by vfio-pci
	   already. So, the vfio-pci structure will be damaged!
step4: Bind EHCI controller to vfio-pci driver, which will put EHCI
	   controller in the same vfio group as UHCI controller;
       ... ...
step5: Unbind UHCI controller from vfio-pci, which will delete UHCI from
	   vfio group device list that has been damaged in step 3. So, delete
	   operation can random result into a NULL pointer dereference with
	   the below stack dump.
step6: Bind UHCI controller to native driver;
step7: Unbind EHCI controller from vfio-pci, which will try to remove EHCI
	   controller from the vfio group;
step8: Bind EHCI controller to native driver;

[  929.114641] uhci_hcd 0000:00:10.0: remove, state 1
[  929.114652] usb usb1: USB disconnect, device number 1
[  929.114655] usb 1-1: USB disconnect, device number 2
[  929.270313] usb 1-2: USB disconnect, device number 3
[  929.318404] uhci_hcd 0000:00:10.0: USB bus 1 deregistered
[  929.343029] uhci_hcd 0000:00:10.1: remove, state 4
[  929.343045] usb usb3: USB disconnect, device number 1
[  929.343685] uhci_hcd 0000:00:10.1: USB bus 3 deregistered
[  929.369087] ehci-pci 0000:00:10.7: remove, state 4
[  929.369102] usb usb4: USB disconnect, device number 1
[  929.370325] ehci-pci 0000:00:10.7: USB bus 4 deregistered
[  932.398494] BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
[  932.398496] PGD 42a67d067 P4D 42a67d067 PUD 42a65f067 PMD 0
[  932.398502] Oops: 0002 [#2] SMP NOPTI
[  932.398505] CPU: 2 PID: 7824 Comm: vfio_unbind.sh Tainted: P   D  4.19.65-2020051917-rainos #1
[  932.398506] Hardware name: Shanghai Zhaoxin Semiconductor Co., Ltd. HX002EH/HX002EH,
	       	   BIOS HX002EH0_01_R480_R_200408 04/08/2020
[  932.398513] RIP: 0010:vfio_device_put+0x31/0xa0 [vfio]
[  932.398515] Code: 89 e5 41 54 53 4c 8b 67 18 48 89 fb 49 8d 74 24 30 e8 e3 0e f3 de
					 84 c0 74 67 48 8b 53 20 48 8b 43 28 48 8b 7b 18 48 89 42 08 <48> 89 10
					 48 b8+G26 00 01 00 00 00 00 ad de 48 89 43 20 48 b8 00 02 00
[  932.398516] RSP: 0018:ffffbbfd04cffc18 EFLAGS: 00010202
[  932.398518] RAX: 0000000000000000 RBX: ffff92c7ea717880 RCX: 0000000000000000
[  932.398519] RDX: ffff92c7ea713620 RSI: ffff92c7ea713630 RDI: ffff92c7ea713600
[  932.398521] RBP: ffffbbfd04cffc28 R08: ffff92c7f02a8080 R09: ffff92c7efc03980
[  932.398522] R10: ffffbbfd04cff9a8 R11: 0000000000000000 R12: ffff92c7ea713600
[  932.398523] R13: ffff92c7ed8bb0a8 R14: ffff92c7ea717880 R15: 0000000000000000
[  932.398525] FS:  00007f3031500740(0000) GS:ffff92c7f0280000(0000) knlGS:0000000000000000
[  932.398526] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  932.398527] CR2: 0000000000000000 CR3: 0000000428626004 CR4: 0000000000160ee0
[  932.398528] Call Trace:
[  932.398534]  vfio_del_group_dev+0xe8/0x2a0 [vfio]
[  932.398539]  ? __blocking_notifier_call_chain+0x52/0x60
[  932.398542]  ? do_wait_intr_irq+0x90/0x90
[  932.398546]  ? iommu_bus_notifier+0x75/0x100
[  932.398551]  vfio_pci_remove+0x20/0xa0 [vfio_pci]
[  932.398554]  pci_device_remove+0x3e/0xc0
[  932.398557]  device_release_driver_internal+0x17a/0x240
[  932.398560]  device_release_driver+0x12/0x20
[  932.398561]  unbind_store+0xee/0x180
[  932.398564]  drv_attr_store+0x27/0x40
[  932.398567]  sysfs_kf_write+0x3c/0x50
[  932.398568]  kernfs_fop_write+0x125/0x1a0
[  932.398572]  __vfs_write+0x3a/0x190
[  932.398575]  ? apparmor_file_permission+0x1a/0x20
[  932.398577]  ? security_file_permission+0x3b/0xc0
[  932.398581]  ? _cond_resched+0x1a/0x50
[  932.398582]  vfs_write+0xb8/0x1b0
[  932.398584]  ksys_write+0x5c/0xe0
[  932.398586]  __x64_sys_write+0x1a/0x20
[  932.398589]  do_syscall_64+0x5a/0x110
[  932.398592]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Using virt-manager/qemu to boot guest os, we can see the same fail sequence!

Fix this by determine whether the PCI Driver of the USB controller is a
kernel native driver. If not, do not let it modify UHCI's dev->driver_data.

Link: https://lore.kernel.org/all/1595419068-4812-1-git-send-email-WeitaoWang-oc@zhaoxin.com/
Signed-off-by: leoliu-oc <leoliu-oc@zhaoxin.com>
Tested-by: Erpeng Xu <xuerpeng@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/usb/core/hcd-pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index a08f3f228e6d..5a63d7a772ae 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -48,6 +48,7 @@ static void for_each_companion(struct pci_dev *pdev, struct usb_hcd *hcd,
 	struct pci_dev		*companion;
 	struct usb_hcd		*companion_hcd;
 	unsigned int		slot = PCI_SLOT(pdev->devfn);
+	struct pci_driver	*drv;
 
 	/*
 	 * Iterate through other PCI functions in the same slot.
@@ -60,6 +61,13 @@ static void for_each_companion(struct pci_dev *pdev, struct usb_hcd *hcd,
 				PCI_SLOT(companion->devfn) != slot)
 			continue;
 
+		drv = companion->driver;
+		if (drv &&
+		    strncmp(drv->name, "uhci_hcd", sizeof("uhci_hcd") - 1) &&
+		    strncmp(drv->name, "ohci-pci", sizeof("ohci-pci") - 1) &&
+		    strncmp(drv->name, "ehci-pci", sizeof("ehci-pci") - 1))
+			continue;
+
 		/*
 		 * Companion device should be either UHCI,OHCI or EHCI host
 		 * controller, otherwise skip.
-- 
2.43.4


