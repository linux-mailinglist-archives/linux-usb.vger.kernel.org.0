Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B782979CE71
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 12:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbjILKgB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 06:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234094AbjILKe3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 06:34:29 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD394210D
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:34:22 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c1ff5b741cso49316265ad.2
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694514862; x=1695119662; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25pMmv0eFGnACBWimpT959NfTJ1UsBBxTXZ9YN0t6B4=;
        b=j+9F+muG3kteMCuLyRTFVFeD7q+LWqfubgwvrUEYuHNR1o2ea5uwmUZVNe1975Awr0
         xQuqlHdS0eOEsgekvFk84rXRRnYBN/3SuTasPNHFTyrOxGMg0XPuBacjTgjr8KY+VUvh
         GtfB4u848VU7xF0QdnMs21DDd5aiJagffOa+ycP5IvAVR4jrRHPTA5bJx7m1zoGcjtZ2
         WkbjLyNr/rK5xHUGdvRHUmAh1kLqhFV9JTijnjbziWb7Jn6rslZBk3WpeydFnXmSQYq5
         vofCjHzAuUdJ9zOu9w6CxZoJwHbCasR+Phy0TpO/lKBHrvvmgK+Gf6TODwrRueO4Vqr5
         kIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694514862; x=1695119662;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25pMmv0eFGnACBWimpT959NfTJ1UsBBxTXZ9YN0t6B4=;
        b=neN+CJ3gCqXD5fpnKU2TlMfaaGJ6xwLTOoxGgTI+V+FFRvNF8T7j+uZHCZr0AJpzD6
         uf3Ii598hbivVOC/ZPWn3u0ZelGs0b6W34WZtf1JsoyRZ8KfwVuWv9K7QT5ef6XqgUQn
         f2bAUH74/Dii1j9CMOBza9n5JCOACWgYZtirPZ1dibfhm52aqbXM3z9LnodntJ/tSTm8
         qB/7o4pcbFaqc9QAEPKE8xNIwXrlCBvIEU0VXJJVRXxJH+S+EZJDH6uISZM/NvQ/l6fs
         zbxNsTjwzqZJdZp0Zx7RoOYrH/myMn7cAKgsdaHkxg/LZ+Wfki+yjyj84ejbj8fWxhvh
         zCPA==
X-Gm-Message-State: AOJu0YxRKkalZ912UOuWJibSPmluB2EHQNWn4HD9eMi4szTGlvYS2YXH
        1b4iksZjBV4a9KwxMFfJpIr+JElpvHg=
X-Google-Smtp-Source: AGHT+IGuOvYhmrQ93u9xsBguauQ4GgdSDkipFGTYahTGZv+wk6NDgp+/M/m4q5dC/ac558uZyc2AKA==
X-Received: by 2002:a17:902:9a4b:b0:1c0:bf62:c921 with SMTP id x11-20020a1709029a4b00b001c0bf62c921mr12617976plv.18.1694514862146;
        Tue, 12 Sep 2023 03:34:22 -0700 (PDT)
Received: from localhost ([103.40.76.4])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902ea1000b001bf095dfb76sm1176775plg.237.2023.09.12.03.34.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 03:34:21 -0700 (PDT)
From:   "Jiazi.Li" <jqqlijiazi@gmail.com>
X-Google-Original-From: "Jiazi.Li" <jiazi.li@transsion.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Jiazi.Li" <jiazi.li@transsion.com>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: increase eps_revmap length
Date:   Tue, 12 Sep 2023 18:34:17 +0800
Message-Id: <20230912103417.18839-1-jiazi.li@transsion.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 41dc9ac163e7 ("usb: gadget: f_fs: Accept up to 30 endpoints.")
increase eps_addrmap length to 31, eps_revmap also need to increase.
Increase it's length to 32.

For same-address, opposite-direction endpoints, will use same idx in
eps_revmap, so add new marco REVMAP_IDX to calculate idx for endpoints.

Signed-off-by: Jiazi.Li <jiazi.li@transsion.com>
---
 drivers/usb/gadget/function/f_fs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 6e9ef35a43a7..4a210368bd33 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -71,12 +71,14 @@ struct ffs_function {
 	struct ffs_data			*ffs;
 
 	struct ffs_ep			*eps;
-	u8				eps_revmap[16];
+	u8				eps_revmap[32];
 	short				*interfaces_nums;
 
 	struct usb_function		function;
 };
 
+#define REVMAP_IDX(epaddr)	((epaddr & USB_ENDPOINT_NUMBER_MASK) \
+				* 2 + ((epaddr & USB_DIR_IN) ? 1 : 0))
 
 static struct ffs_function *ffs_func_from_usb(struct usb_function *f)
 {
@@ -2843,8 +2845,7 @@ static int __ffs_func_bind_do_descs(enum ffs_entity_type type, u8 *valuep,
 
 		ffs_ep->ep  = ep;
 		ffs_ep->req = req;
-		func->eps_revmap[ds->bEndpointAddress &
-				 USB_ENDPOINT_NUMBER_MASK] = idx + 1;
+		func->eps_revmap[REVMAP_IDX(ds->bEndpointAddress)] = idx + 1;
 		/*
 		 * If we use virtual address mapping, we restore
 		 * original bEndpointAddress value.
@@ -3371,7 +3372,7 @@ static void ffs_func_resume(struct usb_function *f)
 
 static int ffs_func_revmap_ep(struct ffs_function *func, u8 num)
 {
-	num = func->eps_revmap[num & USB_ENDPOINT_NUMBER_MASK];
+	num = func->eps_revmap[REVMAP_IDX(num)];
 	return num ? num : -EDOM;
 }
 
-- 
2.17.1

