Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9777E3C3325
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 08:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbhGJGGo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Jul 2021 02:06:44 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50552 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229690AbhGJGGn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Jul 2021 02:06:43 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EFAE840170;
        Sat, 10 Jul 2021 06:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1625897038; bh=c0ky0nucYPpag8qixdlzPW+7JgbM55OBHHAlv3x3TCU=;
        h=Date:From:Subject:To:Cc:From;
        b=cu+boN42aw7xlcu3rDPkoBu2FTBz+YJRj3mKIb7T0We/B7WeQ4Bvs9XQ8Sy0hychI
         S97IPh1MQSNEcbbiKWn22DRv+yE0ZDgNmpkrQo1QgYH/1NVP2wUpfMLrFzKXDgO6YS
         9HwShXbg7CY3M6MJa/XBlEGkOzdS2bXLKDmVYqCPy2zsSJ2k0yJ7bYb0c79hK5tftO
         3EgUzYPDuaOxgFbtBidZcN8lYoAQwwk98k/D6tcBf8ylgnIxv8HGsjbaptnBJiB2n5
         9+ROsbOu3H0sV1NsdcYPbOaMJxYPvKh1bIWfx3+Wphxh5TBmvronxjJ5VXwNa7qfFE
         16iPG4dx4OlLw==
Received: from razpc-HP (razpc-hp.internal.synopsys.com [10.116.75.64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 9C647A005D;
        Sat, 10 Jul 2021 06:03:53 +0000 (UTC)
Received: by razpc-HP (sSMTP sendmail emulation); Sat, 10 Jul 2021 10:03:51 +0400
Date:   Sat, 10 Jul 2021 10:03:51 +0400
Message-Id: <c0711737fe54efa72d35df42cc4b9db31c382e7a.1625896955.git.Arthur.Petrosyan@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: [RFC PATCH] usb: phy: Fix handle page fault on usb_phy_uevent
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Peter Chen <peter.chen@kernel.org>
Cc:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the dwc2 platform device is removed, it unregisters the generic
phy. usb_remove_phy() is called and the dwc2 usb_phy is removed from the
"phy_list", but the uevent may still attempt to access the stale data
resulting in a page fault bug. Currently we can't access the usb_phy
from the "phy_list" after the device is removed. As a quick fix, check
if the phy_list is empty before getting the usb_phy and ignore the
uevent otherwise.

[   84.949345] BUG: unable to handle page fault for address:00000007935688d8
[   84.949349] #PF: supervisor read access in kernel mode
[   84.949351] #PF: error_code(0x0000) - not-present page
[   84.949353] PGD 0 P4D 0
[   84.949356] Oops: 0000 [#1] SMP PTI
[   84.949360] CPU: 2 PID: 2081 Comm: rmmod Not tainted 5.13.0-rc4-snps-16547-ga8534cb092d7-dirty #32
[   84.949363] Hardware name: Hewlett-Packard HP Z400 Workstation/0B4Ch, BIOS 786G3 v03.54 11/02/2011
[   84.949365] RIP: 0010:usb_phy_uevent+0x99/0x121
[   84.949372] Code: 8d 83 f8 00 00 00 48 3d b0 12 22 94 74 05 4c 3b 23
75 5b 8b 83 9c 00 00 00 be 32 00 00 00 48 8d 7c 24 04 48 c7 c2 d4 5d 7b
93 <48> 8b 0c c5 e0 88 56 93 e8 0f 63 8a ff 8b 83 98 00 00 00 be 32 00
[   84.949375] RSP: 0018:ffffa46bc0f2fc70 EFLAGS: 00010246
[   84.949378] RAX: 00000000ffffffff RBX: ffffffff942211b8 RCX: 0000000000000027
[   84.949380] RDX: ffffffff937b5dd4 RSI: 0000000000000032 RDI: ffffa46bc0f2fc74
[   84.949383] RBP: ffff94a306613000 R08: 0000000000000000 R09: 00000000fffeffff
[   84.949385] R10: ffffa46bc0f2faa8 R11: ffffa46bc0f2faa0 R12: ffff94a30186d410
[   84.949387] R13: ffff94a32d188a80 R14: ffff94a30029f960 R15: ffffffff93522dd0
[   84.949389] FS:  00007efdbd417540(0000) GS:ffff94a513a80000(0000) knlGS:0000000000000000
[   84.949392] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   84.949394] CR2: 00000007935688d8 CR3: 0000000165606000 CR4: 00000000000006e0
[   84.949396] Call Trace:
[   84.949401]  dev_uevent+0x190/0x1ad
[   84.949408]  kobject_uevent_env+0x18e/0x46c
[   84.949414]  device_release_driver_internal+0x17f/0x18e
[   84.949418]  bus_remove_device+0xd3/0xe5
[   84.949421]  device_del+0x1c3/0x31d
[   84.949425]  ? kobject_put+0x97/0xa8
[   84.949428]  platform_device_del+0x1c/0x63
[   84.949432]  platform_device_unregister+0xa/0x11
[   84.949436]  dwc2_pci_remove+0x1e/0x2c [dwc2_pci]
[   84.949440]  pci_device_remove+0x31/0x81
[   84.949445]  device_release_driver_internal+0xea/0x18e
[   84.949448]  driver_detach+0x68/0x72
[   84.949450]  bus_remove_driver+0x63/0x82
[   84.949453]  pci_unregister_driver+0x1a/0x75
[   84.949457]  __do_sys_delete_module+0x149/0x1e9
[   84.949462]  ? task_work_run+0x64/0x6e
[   84.949465]  ? exit_to_user_mode_prepare+0xd4/0x10d
[   84.949471]  do_syscall_64+0x5d/0x70
[   84.949475]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   84.949480] RIP: 0033:0x7efdbd563bcb
[   84.949482] Code: 73 01 c3 48 8b 0d c5 82 0c 00 f7 d8 64 89 01 48 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00 00 0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 95 82 0c 00 f7 d8 64 89 01 48
[   84.949485] RSP: 002b:00007ffe944d7d98 EFLAGS: 00000206 ORIG_RAX: 00000000000000b0
[   84.949489] RAX: ffffffffffffffda RBX: 00005651072eb700 RCX: 00007efdbd563bcb
[   84.949491] RDX: 000000000000000a RSI: 0000000000000800 RDI: 00005651072eb768
[   84.949493] RBP: 00007ffe944d7df8 R08: 0000000000000000 R09: 0000000000000000
[   84.949495] R10: 00007efdbd5dfac0 R11: 0000000000000206 R12: 00007ffe944d7fd0
[   84.949497] R13: 00007ffe944d8610 R14: 00005651072eb2a0 R15: 00005651072eb700
[   84.949500] Modules linked in: uas configfs dwc2_pci(-) phy_generic fuse crc32c_intel [last unloaded: udc_core]
[   84.949508] CR2: 00000007935688d8
[   84.949510] ---[ end trace e40c871ca3e4dc9e ]---
[   84.949512] RIP: 0010:usb_phy_uevent+0x99/0x121

Fixes: a8534cb092d7 ("usb: phy: introduce usb_phy device type with its own uevent handler")
Signed-off-by: Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/phy/phy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 83ed5089475a..5046d4a07348 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -151,6 +151,9 @@ static int usb_phy_uevent(struct device *dev, struct kobj_uevent_env *env)
 	char uchger_state[50] = { 0 };
 	char uchger_type[50] = { 0 };
 
+	if (list_empty(&phy_list))
+		return -ENODEV;
+
 	usb_phy = __device_to_usb_phy(dev);
 
 	snprintf(uchger_state, ARRAY_SIZE(uchger_state),

base-commit: 77d34a4683b053108ecd466cc7c4193b45805528
-- 
2.25.1

