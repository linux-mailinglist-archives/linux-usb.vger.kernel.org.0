Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF18325FE0
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 10:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhBZJTy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 04:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhBZJSE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Feb 2021 04:18:04 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEC1C061574
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 01:17:24 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 194so9461160ybl.5
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 01:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=iUHJ4YRRisIbzj/gPDQEXxkcbY1C4+1mIu/PFaLnQog=;
        b=eVtjykQX7a3iQvYl2bryk72OmiRH+ix56YgMq3gp+OyFVrGHnyNBRWN7vpKH6aO4nA
         tC4Jj8ZX/96l5YY5non2b8713wHBOP28FSZzrVgbw99Z3VG1r7rDcdA2CCSmY4zSDmjI
         4In7oI7MfV8pipMsksdREMEb5Y+ctolmwIMeV2PAvbobF/7bO2nxJS3pIlWrhQLt/mJT
         s2ptlYRPfHgch0+FY3IrtUqEYMlFEKDF/QApTNeJjc+idJmwxlLU8NU93WtADCOpLGzs
         upCIfBcgLrZyKK9sCdcLizsbifzXZumDN5hK01kv+cwnMHp4t2oHFMZksRFIAVhto66V
         HN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=iUHJ4YRRisIbzj/gPDQEXxkcbY1C4+1mIu/PFaLnQog=;
        b=FvCbFKNaVSwWOU7fiBiKyczyvdehEadjvJKnao3GHTFFgtb6ycc7ZP0QXfIvDH/GAP
         ze7ZXGmqpcAQ+leUaiDvAo2cW9eyf34/FctA4009r3kimMx4QDKg3HVwEylHL8vxNWgn
         ZSyc6kLX5LJXmTtM9Ib/YXjk6US9iEZJSqoi8wfMkLI3I5ttbWk081QpcWQ2tkMwbHZe
         YTfk4DLafcd++z0JljcHAkZE1YcayGSam3WddwufVetzyJsmnTLLKHDLBVA4z5LK9NWF
         cUahiwffKeV3pgdSF70sfKWx9kwshOrjVVoNkq8sLmLcTg1EO6eY3htut2/qGIHlGV8r
         BHTQ==
X-Gm-Message-State: AOAM530py4ejjeDz/dDW+guuxBo3QfEmv/n9pTlBUNHz+RrG1G0BJj4B
        c0DEOgpVho4XWG3OH5tQoxtDeFzmqiyxeA==
X-Google-Smtp-Source: ABdhPJytZ18QpC2AWlBHthypibLz2u/M0bX/RCMi3QsWmxODseYTeUPwkrdiZEDkWozlw050dv53yYiotb+pfQ==
Sender: "rickyniu via sendgmr" <rickyniu@rickyniu.ntc.corp.google.com>
X-Received: from rickyniu.ntc.corp.google.com ([2401:fa00:fc:202:31d4:be2d:8e3e:f8d3])
 (user=rickyniu job=sendgmr) by 2002:a25:ca8f:: with SMTP id
 a137mr3118930ybg.228.1614331043606; Fri, 26 Feb 2021 01:17:23 -0800 (PST)
Date:   Fri, 26 Feb 2021 17:16:12 +0800
Message-Id: <20210226091612.508639-1-rickyniu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH] ANDROID: usb: core: Send uevent when USB TOPO layer over 6
From:   Ricky Niu <rickyniu@google.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        erosca@de.adit-jv.com, gustavoars@kernel.org,
        a.darwish@linutronix.de, rickyniu@google.com, oneukum@suse.com,
        kyletso@google.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the topology of the nested hubs are over 6 layers
Send uevent to user space when USB TOPO layer over 6.
Let end user more understand what happened.

Signed-off-by: Ricky Niu <rickyniu@google.com>
---
 drivers/usb/core/hub.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 7f71218cc1e5..e5e924526822 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -55,6 +55,10 @@ static DEFINE_SPINLOCK(device_state_lock);
 static struct workqueue_struct *hub_wq;
 static void hub_event(struct work_struct *work);
 
+/* struct to notify userspace of hub events */
+static struct class *hub_class;
+static struct device *hub_device;
+
 /* synchronize hub-port add/remove and peering operations */
 DEFINE_MUTEX(usb_port_peer_mutex);
 
@@ -1764,6 +1768,13 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
         return true;
 }
 
+static void hub_over_tier(void)
+{
+	char *envp[2] = { "HUB=OVERTIER", NULL };
+
+	kobject_uevent_env(&hub_device->kobj, KOBJ_CHANGE, envp);
+}
+
 static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 {
 	struct usb_host_interface *desc;
@@ -1831,6 +1842,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (hdev->level == MAX_TOPO_LEVEL) {
 		dev_err(&intf->dev,
 			"Unsupported bus topology: hub nested too deep\n");
+		hub_over_tier();
 		return -E2BIG;
 	}
 
@@ -5680,6 +5692,13 @@ int usb_hub_init(void)
 		return -1;
 	}
 
+	hub_class = class_create(THIS_MODULE, "usb_hub");
+	if (IS_ERR(hub_class))
+		return PTR_ERR(hub_class);
+
+	hub_device =
+		device_create(hub_class, NULL, MKDEV(0, 0), NULL, "usb_hub");
+
 	/*
 	 * The workqueue needs to be freezable to avoid interfering with
 	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
@@ -5699,6 +5718,9 @@ int usb_hub_init(void)
 
 void usb_hub_cleanup(void)
 {
+	if (!IS_ERR(hub_class))
+		class_destroy(hub_class);
+
 	destroy_workqueue(hub_wq);
 
 	/*
-- 
2.30.1.766.gb4fecdf3b7-goog

