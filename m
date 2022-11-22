Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A79396349C2
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 23:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbiKVWGR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 17:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235051AbiKVWGN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 17:06:13 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FECC7215
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 14:06:11 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id h193so15174485pgc.10
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 14:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTwasftcYWGoOTE8NtdjlLPhFZo1K5FqzfQnri8pWqI=;
        b=MsUJ2I6a4ufk8VL80LUg7X5dz5P321MFBR9qAYp30CBw34Zi5yXn1JbMB8zoTZH/gF
         /vsTmHEWlIPIv7UADILPslwaI1eenMfK56llyah7PRD2FOw3ucNeO+1NeLGaElmW1ykU
         JgzwzMMkr+ZM/kFNBtARIq6ALHXvreLLjKKUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTwasftcYWGoOTE8NtdjlLPhFZo1K5FqzfQnri8pWqI=;
        b=llxA+DwNe4Hba+3L4qGCK5h9YQQeAXiayIzGmHPtlfqwYhCSMl3O/0065ajwY/mf5B
         SMJLdW6Jze4TbNeOjmL6r3q0CnFFF3bwjnl8YUyZJ2usHFTD/Y103lcoqznPG/TzmhYq
         pmgiv2dMdJ9GvWQ02QhQ2wM79k5NBe7VKy86mO9wixmIPj19g/6Y+waGHhEt2SXXgr1l
         7XPaV4+dvngVN47tWq7DxDcc7Cn8uN1hUIJ+xGyloh++jFki4RIJbYW3YwwUBRetZa54
         jFldtsajjSs3hTG/z/H5KCwU41/mRrKkA2IGeSiXjr/4OoD4cJYgMNGnBdrA5sQ8xJqt
         z8HA==
X-Gm-Message-State: ANoB5pnXaxBN/HGOIe+YMJgplh9NGzU3KOm4xQ4n2u3mPxOBGo/eCCHf
        2fTRPjAU/LW3gi1PT5DOkVCP+Q==
X-Google-Smtp-Source: AA0mqf6IASzDx6pIfEcciVvIvI7Vqy/uQHA9epznnO2/2iUSYy8BgdxIjZtO+aSu/RHhtUPo9hVpww==
X-Received: by 2002:aa7:9159:0:b0:572:24c7:34da with SMTP id 25-20020aa79159000000b0057224c734damr5946459pfi.73.1669154770592;
        Tue, 22 Nov 2022 14:06:10 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id i24-20020a63e458000000b0042988a04bfdsm9640497pgk.9.2022.11.22.14.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:06:10 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     Prashant Malani <pmalani@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 1/2] usb: typec: Add partner PD object wrapper
Date:   Tue, 22 Nov 2022 22:05:36 +0000
Message-Id: <20221122220538.2991775-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221122220538.2991775-1-pmalani@chromium.org>
References: <20221122220538.2991775-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some port drivers may want to set a Type-C partner as a parent for a
USB Power Delivery object, but the Type-C partner struct isn't exposed
outside of the Type-C class driver. Add a wrapper to
usb_power_delivery_register() which sets the provided Type-C partner
as a parent to the USB PD object. This helps to avoid exposing the
Type-C partner's device struct unnecessarily.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Patch first introduced in v2.

 drivers/usb/typec/class.c | 19 +++++++++++++++++++
 include/linux/usb/typec.h |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index bd5e5dd70431..5897905cb4f0 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -821,6 +821,25 @@ void typec_partner_set_svdm_version(struct typec_partner *partner,
 }
 EXPORT_SYMBOL_GPL(typec_partner_set_svdm_version);
 
+/**
+ * typec_partner_usb_power_delivery_register - Register Type-C partner USB Power Delivery Support
+ * @partner: Type-C partner device.
+ * @desc: Description of the USB PD contract.
+ *
+ * This routine is a wrapper around usb_power_delivery_register(). It registers
+ * USB Power Delivery Capabilities for a Type-C partner device. Specifically,
+ * it sets the Type-C partner device as a parent for the resulting USB Power Delivery object.
+ *
+ * Returns handle to struct usb_power_delivery or ERR_PTR.
+ */
+struct usb_power_delivery *
+typec_partner_usb_power_delivery_register(struct typec_partner *partner,
+					  struct usb_power_delivery_desc *desc)
+{
+	return usb_power_delivery_register(&partner->dev, desc);
+}
+EXPORT_SYMBOL_GPL(typec_partner_usb_power_delivery_register);
+
 /**
  * typec_register_partner - Register a USB Type-C Partner
  * @port: The USB Type-C Port the partner is connected to
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 7751bedcae5d..8fa781207970 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -23,6 +23,7 @@ struct fwnode_handle;
 struct device;
 
 struct usb_power_delivery;
+struct usb_power_delivery_desc;
 
 enum typec_port_type {
 	TYPEC_PORT_SRC,
@@ -327,6 +328,9 @@ void typec_partner_set_svdm_version(struct typec_partner *partner,
 				    enum usb_pd_svdm_ver svdm_version);
 int typec_get_negotiated_svdm_version(struct typec_port *port);
 
+struct usb_power_delivery *typec_partner_usb_power_delivery_register(struct typec_partner *partner,
+							struct usb_power_delivery_desc *desc);
+
 int typec_port_set_usb_power_delivery(struct typec_port *port, struct usb_power_delivery *pd);
 int typec_partner_set_usb_power_delivery(struct typec_partner *partner,
 					 struct usb_power_delivery *pd);
-- 
2.38.1.584.g0f3c55d4c2-goog

