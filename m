Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF792B522B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 21:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731910AbgKPUNl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 15:13:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728944AbgKPUNl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 15:13:41 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840E7C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 12:13:41 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 10so15215158pfp.5
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 12:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cFs/450EOXSyFQGw0igAIis8gqnsSIn7PCkr4KqQMGo=;
        b=KY0R+QOsVfDpOLEeAT02x+Rn5QMZgXtGFY6ju46zCjJy1oGTXwH0wDCbRx/FRL/Gb/
         b3Nkro3pogM6DJKQfNiKCpx6IY9zniAasFrFz/WXQLFu4h9KwuVwS52BwbH0Ck70rpey
         +u3MHd29St1gQZjpwb2pRbKnZpSO+BVSkMmtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cFs/450EOXSyFQGw0igAIis8gqnsSIn7PCkr4KqQMGo=;
        b=o9CGjM7mUDygLeQRQnwBVKOzsyrBMgh9zyoYQ9VXFLv7wsX244SQBqEa1LZ7Ae0oUp
         a47VGCFFShjCOprYJnvCgsOxHlM9hfC4ZlT7KeVNU72jiw6qh1arZ9nQEA0/4MWq/QRb
         N/HDPHHgaHIsO/MtxMbsdNBKFpvfEdQX6KwdO9n0U3WeUtqUsHrlOysoogZ9rhctT0i6
         8KYL8l5CyfxshwiKCtXPoZs1Vd2skRhBV7kndsrqHNFJcmOwh8wGRNh58qfDVZ5ArAjv
         vq+vT9B3RcBUE3YdW0TwuZdd03yBs+ySLwQ9zRPrcp8W4GMEfBuuZMcxca/R2bdoiola
         CaAw==
X-Gm-Message-State: AOAM533i3MsItZ/evmy7hJLpnT6/M2ScsINJ9uUInbDO+CTJ0jzAkDXk
        aHzE+Ubn0V8cGFctZB+a6VZJJQ==
X-Google-Smtp-Source: ABdhPJwLjVBFNCqymR9CCTS5I//EF5IZtI6bDa/COj1kNfSLyJQ5TJFbF66poMkZOrQ9CCpqcqjVTg==
X-Received: by 2002:a62:445:0:b029:196:61fc:2756 with SMTP id 66-20020a6204450000b029019661fc2756mr4941288pfe.12.1605557621119;
        Mon, 16 Nov 2020 12:13:41 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id a12sm234577pjh.48.2020.11.16.12.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 12:13:40 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        enric.balletbo@collabora.com
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v3 08/11] platform/chrome: cros_ec_typec: Store cable plug type
Date:   Mon, 16 Nov 2020 12:11:52 -0800
Message-Id: <20201116201150.2919178-9-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20201116201150.2919178-1-pmalani@chromium.org>
References: <20201116201150.2919178-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the PD VDO Type C cable plug type macro to retrieve and store the
cable plug type in the cable descriptor.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

Changes in v3:
- Re-arranged patch order and combined it with related series of
  patches.
- Added Reviewed-by tags

Changes in v2:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 5e7f0b4ebbec..cf609aa10567 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -709,6 +709,7 @@ static int cros_typec_handle_sop_prime_disc(struct cros_typec_data *typec, int p
 		.port = port_num,
 		.partner_type = TYPEC_PARTNER_SOP_PRIME,
 	};
+	u32 cable_plug_type;
 	int ret = 0;
 
 	memset(disc, 0, EC_PROTO2_MAX_RESPONSE_SIZE);
@@ -722,8 +723,26 @@ static int cros_typec_handle_sop_prime_disc(struct cros_typec_data *typec, int p
 	/* Parse the PD identity data, even if only 0s were returned. */
 	cros_typec_parse_pd_identity(&port->c_identity, disc);
 
-	if (disc->identity_count != 0)
+	if (disc->identity_count != 0) {
+		cable_plug_type = VDO_TYPEC_CABLE_TYPE(port->c_identity.vdo[0]);
+		switch (cable_plug_type) {
+		case CABLE_ATYPE:
+			desc.type = USB_PLUG_TYPE_A;
+			break;
+		case CABLE_BTYPE:
+			desc.type = USB_PLUG_TYPE_B;
+			break;
+		case CABLE_CTYPE:
+			desc.type = USB_PLUG_TYPE_C;
+			break;
+		case CABLE_CAPTIVE:
+			desc.type = USB_PLUG_CAPTIVE;
+			break;
+		default:
+			desc.type = USB_PLUG_NONE;
+		}
 		desc.active = PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_ACABLE;
+	}
 
 	desc.identity = &port->c_identity;
 
-- 
2.29.2.299.gdc1121823c-goog

