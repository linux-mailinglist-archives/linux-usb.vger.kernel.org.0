Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C6D2A9C9A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 19:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgKFSme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 13:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbgKFSmd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Nov 2020 13:42:33 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F33FC0613CF
        for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2020 10:42:32 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 62so1586992pgg.12
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2020 10:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZIbxuFcWEsm1IZwnLCYdZyYRjU3KKvSYVK6rSgB6bkQ=;
        b=fPU257iApiVM5ZmKvNaVne8y3hNHUFNH1RDNQnXpKJ2MqUGURLqgAl4hIQl3NYfojQ
         rwhz+zEByqiwYfV++HLmDLP5DqcIWPhnx+TL5RKRnYaby3uNqhe1OYW0vPCn5EIm1zNc
         18jcCOC3Fx1mwy84rHdkrp6MMc6jPxy7UGXPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZIbxuFcWEsm1IZwnLCYdZyYRjU3KKvSYVK6rSgB6bkQ=;
        b=pMiXUp2qBVmrs1hT+YrfmSGtwdtjXnFGfsGYSDWC4oCl8OFQHuulGiEDIiqLhLTfH3
         Vj3kpcdxZdDF+X7Pplxhn4Dgj/DF9By0MTCiYvCcjZIHH1WlfDISYyZXop2Te+J5FYVa
         i2eNjcS0cyH5NHEpGlXs9a4QHWR8AGGYtVoUstAx//hp3icqq6nDlVhHqmI79xYbo92F
         DfXA3vfO2IQ9b9JO/PgPANKEYCOvZSXuMVWmkm20WcC611bvGEvwZ5EnBUYn61CljTVo
         xO5xlvVVd368RFOdIyldgdyxSz6/pyqHRUUpAxTNhbOxOmayJVkgBnurMKGbbAW6F7GW
         fAaA==
X-Gm-Message-State: AOAM5317TgpLB4Q0+jA3xuTHjHbfkkiyzZHZiRvj8MpyFEI5f5Kl+Wdh
        sj4xedeTtMUreGnbhD2Ys629nA==
X-Google-Smtp-Source: ABdhPJzevWVC1by/7jK4Y0IL195o8gPGu04HuvVtT+MV9LoFz3MHh1HFuSl7U3CpItiCa+7GU5pQDA==
X-Received: by 2002:a65:679a:: with SMTP id e26mr2914937pgr.374.1604688151778;
        Fri, 06 Nov 2020 10:42:31 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id b6sm3246143pjq.42.2020.11.06.10.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 10:42:31 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 6/6] platform/chrome: cros_ec_typec: Store cable plug type
Date:   Fri,  6 Nov 2020 10:41:10 -0800
Message-Id: <20201106184104.939284-7-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201106184104.939284-1-pmalani@chromium.org>
References: <20201106184104.939284-1-pmalani@chromium.org>
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
---

Changes in v2:
- Changed local variable from uint32_to u32.

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
2.29.1.341.ge80a0c044ae-goog

