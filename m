Return-Path: <linux-usb+bounces-50-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7651E7A01B6
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 368672813F5
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 10:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0798D23764;
	Thu, 14 Sep 2023 10:31:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95892375A
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 10:31:03 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448C2DF
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 03:31:03 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bf55a81eeaso5927065ad.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 03:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694687462; x=1695292262; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSb/P3KICCCHFYQROsH0b6J3lxHrRQkUuegycRxSUOM=;
        b=WZpzyTaXtSx4NfLF1v0YJ+ECS05ZzEP7m67NLSoqsZHkZ5fzBmdXWsQK14DvOEazIo
         Caw63709EFEECSekBCA3EVXwsTitfcuwR0yrVKgkfiwb9EsvpDigmdYVEzWEoYEYi3ov
         CVi7jrZfJVtMwZ3TJY44gqKDUGkoJpcBNzwXB47OEiXRnugaYUFIaXFLrUkElHXFbAx+
         tkqc7WCLBfTdtofucobX4OAosmSYwZOywTWodvcNfBISrqRZO43s5+COyLqgnFl/yu6k
         Sis9TmnztLPVR0robPnYCupLLD1YicF5vyZtsb0KEvACtydfc0UiQnwd5TsfQep/T7w4
         wCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694687462; x=1695292262;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSb/P3KICCCHFYQROsH0b6J3lxHrRQkUuegycRxSUOM=;
        b=VBERzUGV8nxxuewK3wjkWokzQWPwRInstyONXsmJ8vKdfMGVEJMjjDOINPDxvT36T2
         l1Z+s8TXTqsD9YKqiLjAyeIlDg+w0YkGnMnnDeWZ+pXNCjj8A2ukEN9/24MXToLVCN7o
         Oe+d5e0zk9cVcqVPwKWGGkaprR3kkM0ZH8ki7FLwgRCZymn4Yhl++JzpeA8drVbRlcCj
         aPj2OR6hcM62I3PIaveTnBwqu5/6LPjKNgy0gGs1iWsojuLMNjJ23GZzgoObsItaRV4v
         6iN7/nlYhYJ0ATvhoUMbi+Z/0Yx4I0LsEiqPNJqjpXepULtb3ZdLY0c83I0zuiKgdbA4
         uNBQ==
X-Gm-Message-State: AOJu0YzUb99BaJS86prMqGlSZYhtVxRYAwG+fb9UuO9izy3/GwdFh7Hu
	0AYyPkTYBi0vQo607ddm+2hVQ9+nZrA=
X-Google-Smtp-Source: AGHT+IEicnNhMc5tF1hDhtkQ7o1uUmAiMvqL1ORQidTYxcIB1Wbi/dqPrsTL6tK+H8txAKLDOvE2Mg==
X-Received: by 2002:a17:902:e543:b0:1c3:a4f2:7c92 with SMTP id n3-20020a170902e54300b001c3a4f27c92mr6172812plf.65.1694687462584;
        Thu, 14 Sep 2023 03:31:02 -0700 (PDT)
Received: from localhost ([103.40.76.4])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902ced200b001bba669a7eesm1244342plg.52.2023.09.14.03.31.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 03:31:02 -0700 (PDT)
From: Jiazi Li <jqqlijiazi@gmail.com>
X-Google-Original-From: Jiazi Li <jiazi.li@transsion.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiazi Li <jiazi.li@transsion.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_fs: increase eps_revmap length
Date: Thu, 14 Sep 2023 18:30:58 +0800
Message-Id: <20230914103058.29385-1-jiazi.li@transsion.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Commit 41dc9ac163e7 ("usb: gadget: f_fs: Accept up to 30 endpoints.")
increase eps_addrmap length to 31, eps_revmap also need to increase.
Increase it's length to 31.

For same-address, opposite-direction endpoints, will use same idx in
eps_revmap, use ffs_ep_revmap_index to calculate idx for endpoints.

Signed-off-by: Jiazi Li <jiazi.li@transsion.com>
---
Changes in v2:
- increase eps_revmap length to 31
- use inline function to calculate index, and add comments
---
 drivers/usb/gadget/function/f_fs.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 6e9ef35a43a7..7894260c3535 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -71,12 +71,28 @@ struct ffs_function {
 	struct ffs_data			*ffs;
 
 	struct ffs_ep			*eps;
-	u8				eps_revmap[16];
+	u8				eps_revmap[31];
 	short				*interfaces_nums;
 
 	struct usb_function		function;
 };
 
+/*
+ * index 0 for control ep
+ * For same-address, opposite-direction endpoints, each address
+ * corresponds to two indices, distinguished by dir.
+ * index 1 for 1out
+ * index 2 for 1in
+ * ...
+ */
+static int ffs_ep_revmap_index(u8 epaddr)
+{
+	if (!(epaddr & USB_ENDPOINT_NUMBER_MASK))
+		return 0;
+
+	return ((epaddr & USB_ENDPOINT_NUMBER_MASK) * 2) +
+		(epaddr & USB_DIR_IN ? 1 : 0) - 1;
+}
 
 static struct ffs_function *ffs_func_from_usb(struct usb_function *f)
 {
@@ -2820,6 +2836,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 		struct usb_ep *ep;
 		u8 bEndpointAddress;
 		u16 wMaxPacketSize;
+		int revmap_idx;
 
 		/*
 		 * We back up bEndpointAddress because autoconfig overwrites
@@ -2843,8 +2860,8 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 
 		ffs_ep->ep  = ep;
 		ffs_ep->req = req;
-		func->eps_revmap[ds->bEndpointAddress &
-				 USB_ENDPOINT_NUMBER_MASK] = idx + 1;
+		revmap_idx = ffs_ep_revmap_index(ds->bEndpointAddress);
+		func->eps_revmap[revmap_idx] = idx + 1;
 		/*
 		 * If we use virtual address mapping, we restore
 		 * original bEndpointAddress value.
@@ -3371,7 +3388,7 @@ static void ffs_func_resume(struct usb_function *f)
 
 static int ffs_func_revmap_ep(struct ffs_function *func, u8 num)
 {
-	num = func->eps_revmap[num & USB_ENDPOINT_NUMBER_MASK];
+	num = func->eps_revmap[ffs_ep_revmap_index(num)];
 	return num ? num : -EDOM;
 }
 
-- 
2.17.1


