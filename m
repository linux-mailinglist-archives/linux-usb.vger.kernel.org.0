Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A372297F4
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 14:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgGVMNC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 22 Jul 2020 08:13:02 -0400
Received: from ZXSHCAS2.zhaoxin.com ([203.148.12.82]:46651 "EHLO
        ZXSHCAS2.zhaoxin.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726161AbgGVMNC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 08:13:02 -0400
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Jul 2020 08:13:00 EDT
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 22 Jul
 2020 19:57:53 +0800
Received: from localhost.localdomain (114.242.248.179) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 22 Jul
 2020 19:57:51 +0800
From:   WeitaoWangoc <WeitaoWang-oc@zhaoxin.com>
To:     <gregkh@linuxfoundation.org>, <mathias.nyman@linux.intel.com>,
        <ulf.hansson@linaro.org>, <vkoul@kernel.org>,
        <hslester96@gmail.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <Carsten_Schmid@mentor.com>,
        <efremov@linux.com>
CC:     <tonywwang@zhaoxin.com>, <weitaowang@zhaoxin.com>,
        <CobeChen@zhaoxin.com>, <TimGuo@zhaoxin.com>, <wwt8723@163.com>
Subject: [PATCH] USB:Fix kernel NULL pointer when unbind UHCI form vfio-pci
Date:   Wed, 22 Jul 2020 19:57:48 +0800
Message-ID: <1595419068-4812-1-git-send-email-WeitaoWang-oc@zhaoxin.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [114.242.248.179]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This bug is found in Zhaoxin platform, but it's a commom code bug.
Fail sequence:
step1: Unbind UHCI controller from native driver;
step2: Bind UHCI controller to vfio-pci, which will put UHCI controller in one vfio
       group's device list and set UHCI's dev->driver_data to struct vfio-pci(for UHCI)
step3: Unbind EHCI controller from native driver, will try to tell UHCI native driver
       that "I'm removed by set companion_hcd->self.hs_companion to NULL. However,
       companion_hcd get from UHCI's dev->driver_data that has modified by vfio-pci
       already.So, the vfio-pci structure will be damaged!
step4: Bind EHCI controller to vfio-pci driver, which will put EHCI controller in the
       same vfio group as UHCI controller;
     ... ...
step5: Unbind UHCI controller from vfio-pci, which will delete UHCI from vfio group'
       device list that has been damaged in step 3. So,delete operation can random
       result into a NULL pointer dereference with the below stack dump.
step6: Bind UHCI controller to native driver;
step7: Unbind EHCI controller from vfio-pci, which will try to remove EHCI controller
       from the vfio group;
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
                48 b8 00 01 00 00 00 00 ad de 48 89 43 20 48 b8 00 02 00
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

Fix this by check for UHCI driver loaded or not before modifiy UHCI's dev->driver_data,
which will happen in ehci native driver probe/remove.

Signed-off-by: WeitaoWangoc <WeitaoWang-oc@zhaoxin.com>
---
 drivers/usb/core/hcd-pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 1547aa6..484f2a0 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -34,6 +34,7 @@ static DECLARE_RWSEM(companions_rwsem);
 #define CL_OHCI                PCI_CLASS_SERIAL_USB_OHCI
 #define CL_EHCI                PCI_CLASS_SERIAL_USB_EHCI

+#define PCI_DEV_DRV_FLAG       2
 static inline int is_ohci_or_uhci(struct pci_dev *pdev)
 {
        return pdev->class == CL_OHCI || pdev->class == CL_UHCI;
@@ -68,6 +69,8 @@ static void for_each_companion(struct pci_dev *pdev, struct usb_hcd *hcd,
                if (companion->class != CL_UHCI && companion->class != CL_OHCI &&
                                companion->class != CL_EHCI)
                        continue;
+               if (!(companion->priv_flags & PCI_DEV_DRV_FLAG))
+                       continue;

                companion_hcd = pci_get_drvdata(companion);
                if (!companion_hcd || !companion_hcd->self.root_hub)
@@ -254,6 +257,7 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id,
        }

        pci_set_master(dev);
+       dev->priv_flags | = PCI_DEV_DRV_FLAG;

        /* Note: dev_set_drvdata must be called while holding the rwsem */
        if (dev->class == CL_EHCI) {
@@ -326,6 +330,7 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
        local_irq_disable();
        usb_hcd_irq(0, hcd);
        local_irq_enable();
+       dev->priv_flags & = ~PCI_DEV_DRV_FLAG;

        /* Note: dev_set_drvdata must be called while holding the rwsem */
        if (dev->class == CL_EHCI) {
--
2.7.4



保密声明：
本邮件含有保密或专有信息，仅供指定收件人使用。严禁对本邮件或其内容做任何未经授权的查阅、使用、复制或转发。
CONFIDENTIAL NOTE:
This email contains confidential or legally privileged information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or forwarding of this email or the content of this email is strictly prohibited.
