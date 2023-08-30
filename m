Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A707B78D8EC
	for <lists+linux-usb@lfdr.de>; Wed, 30 Aug 2023 20:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236162AbjH3Sbh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Aug 2023 14:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243004AbjH3KEo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Aug 2023 06:04:44 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69C51B0
        for <linux-usb@vger.kernel.org>; Wed, 30 Aug 2023 03:04:41 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a0c:5a83:9103:1700:2f0:bfeb:cfb7:701b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A84FC660724E;
        Wed, 30 Aug 2023 11:04:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1693389880;
        bh=PuY/PBzrtN+DuzEkT2l30ikI64ziIXGpjqQ2fSRGvyM=;
        h=From:To:Cc:Subject:Date:From;
        b=Mgpv8ZZw9O4bbQvGCDchH9+lZgBatmS4tHdC1aIgVabWSePDd3HIWmotuLaWSqifF
         ACNZTMa08Rmodx7pzqlsMXb1e1yOf2FByv54LQ2tQbCGko/f5FepWlIYuZxMmRNCc9
         Eq1CKUpn6OmM2wxKbQx82pit/UofpYb7aAiYdpRTI8Wq84mDJWf4m9Y5+qNGr1nWeP
         hUVI/DFvD4DFwb4IFHyuy4Fv/7cHyXAbAqvwK5/VJS2LvI5qPLDgpOt2G+qijvBT75
         0/Q97iKdUcv0+Y2UinoqbubNI+wrT+FN2Y8ffq7rYDRlKd0M6PG83oNYUQYwm+tDDa
         +5nAZVSqAWg5w==
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     gregkh@linuxfoundation.org
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux@roeck-us.net, kernel@collabora.com
Subject: [PATCH] usb: hub: Guard against accesses to uninitialized BOS descriptors
Date:   Wed, 30 Aug 2023 12:04:18 +0200
Message-Id: <20230830100418.1952143-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Many functions in drivers/usb/core/hub.c and drivers/usb/core/hub.h
access fields inside udev->bos without checking if it was allocated and
initialized. If usb_get_bos_descriptor() fails for whatever
reason, udev->bos will be NULL and those accesses will result in a
crash:

BUG: kernel NULL pointer dereference, address: 0000000000000018
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP NOPTI
CPU: 5 PID: 17818 Comm: kworker/5:1 Tainted: G W 5.15.108-18910-gab0e1cb584e1 #1 <HASH:1f9e 1>
Hardware name: Google Kindred/Kindred, BIOS Google_Kindred.12672.413.0 02/03/2021
Workqueue: usb_hub_wq hub_event
RIP: 0010:hub_port_reset+0x193/0x788
Code: 89 f7 e8 20 f7 15 00 48 8b 43 08 80 b8 96 03 00 00 03 75 36 0f b7 88 92 03 00 00 81 f9 10 03 00 00 72 27 48 8b 80 a8 03 00 00 <48> 83 78 18 00 74 19 48 89 df 48 8b 75 b0 ba 02 00 00 00 4c 89 e9
RSP: 0018:ffffab740c53fcf8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffffa1bc5f678000 RCX: 0000000000000310
RDX: fffffffffffffdff RSI: 0000000000000286 RDI: ffffa1be9655b840
RBP: ffffab740c53fd70 R08: 00001b7d5edaa20c R09: ffffffffb005e060
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: ffffab740c53fd3e R14: 0000000000000032 R15: 0000000000000000
FS: 0000000000000000(0000) GS:ffffa1be96540000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000018 CR3: 000000022e80c005 CR4: 00000000003706e0
Call Trace:
hub_event+0x73f/0x156e
? hub_activate+0x5b7/0x68f
process_one_work+0x1a2/0x487
worker_thread+0x11a/0x288
kthread+0x13a/0x152
? process_one_work+0x487/0x487
? kthread_associate_blkcg+0x70/0x70
ret_from_fork+0x1f/0x30

Fall back to a default behavior if the BOS descriptor isn't accessible
and skip all the functionalities that depend on it: LPM support checks,
Super Speed capabilitiy checks, U1/U2 states setup.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
Cc: stable <stable@vger.kernel.org>
---
 drivers/usb/core/hub.c | 25 ++++++++++++++++++++++---
 drivers/usb/core/hub.h |  2 +-
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a739403a9e45..7e2d092df893 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -151,6 +151,10 @@ int usb_device_supports_lpm(struct usb_device *udev)
 	if (udev->quirks & USB_QUIRK_NO_LPM)
 		return 0;
 
+	/* Skip if the device BOS descriptor couldn't be read */
+	if (!udev->bos)
+		return 0;
+
 	/* USB 2.1 (and greater) devices indicate LPM support through
 	 * their USB 2.0 Extended Capabilities BOS descriptor.
 	 */
@@ -327,6 +331,10 @@ static void usb_set_lpm_parameters(struct usb_device *udev)
 	if (!udev->lpm_capable || udev->speed < USB_SPEED_SUPER)
 		return;
 
+	/* Skip if the device BOS descriptor couldn't be read */
+	if (!udev->bos)
+		return;
+
 	hub = usb_hub_to_struct_hub(udev->parent);
 	/* It doesn't take time to transition the roothub into U0, since it
 	 * doesn't have an upstream link.
@@ -2715,13 +2723,17 @@ int usb_authorize_device(struct usb_device *usb_dev)
 static enum usb_ssp_rate get_port_ssp_rate(struct usb_device *hdev,
 					   u32 ext_portstatus)
 {
-	struct usb_ssp_cap_descriptor *ssp_cap = hdev->bos->ssp_cap;
+	struct usb_ssp_cap_descriptor *ssp_cap;
 	u32 attr;
 	u8 speed_id;
 	u8 ssac;
 	u8 lanes;
 	int i;
 
+	if (!hdev->bos)
+		goto out;
+
+	ssp_cap = hdev->bos->ssp_cap;
 	if (!ssp_cap)
 		goto out;
 
@@ -4239,8 +4251,15 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
 		enum usb3_link_state state)
 {
 	int timeout;
-	__u8 u1_mel = udev->bos->ss_cap->bU1devExitLat;
-	__le16 u2_mel = udev->bos->ss_cap->bU2DevExitLat;
+	__u8 u1_mel;
+	__le16 u2_mel;
+
+	/* Skip if the device BOS descriptor couldn't be read */
+	if (!udev->bos)
+		return;
+
+	u1_mel = udev->bos->ss_cap->bU1devExitLat;
+	u2_mel = udev->bos->ss_cap->bU2DevExitLat;
 
 	/* If the device says it doesn't have *any* exit latency to come out of
 	 * U1 or U2, it's probably lying.  Assume it doesn't implement that link
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 37897afd1b64..d44dd7f6623e 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -153,7 +153,7 @@ static inline int hub_is_superspeedplus(struct usb_device *hdev)
 {
 	return (hdev->descriptor.bDeviceProtocol == USB_HUB_PR_SS &&
 		le16_to_cpu(hdev->descriptor.bcdUSB) >= 0x0310 &&
-		hdev->bos->ssp_cap);
+		hdev->bos && hdev->bos->ssp_cap);
 }
 
 static inline unsigned hub_power_on_good_delay(struct usb_hub *hub)
-- 
2.25.1

