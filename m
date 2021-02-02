Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA8630C74E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 18:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237295AbhBBRQv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 12:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236248AbhBBQUl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 11:20:41 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE71C0613ED
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 08:18:02 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id v65so12208926qtd.0
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 08:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=h9F+R4Nom0a0kcU68ODid/C9vIVgRj0kf37EQ97LnK8=;
        b=Fm3B7TaJrUNbAqormiYDWsYWVgNiYA8xRMV8DT4R67Uz6iiqJZn5wtDq50M9Bc1nTt
         rqoep4hZRGPSNy6NWC6I6TsXCkBHvvI5SXM9smJstouBtuPezVsWIgV+qzwwpOe6sPen
         5zwebDJ6A1xWBNjRurOlaBVDrtNh9a0uEGJRR805wT4J1z0RpuuyMjUp7dLCeJZmVxrm
         T1d7gHXEkU8ITYFv+Ho5qUlcxYJ33bl2vW86wuOcSVYNoKx51K0dVA5MvjLbVw4q8+Bc
         g7Ej4g9QVquWzWr4UP5ZHR2fmqtZS5jby0advyayDWvmc91PUgr4SrVEx1/SCNi3PrOs
         uftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=h9F+R4Nom0a0kcU68ODid/C9vIVgRj0kf37EQ97LnK8=;
        b=L8z0ErLs26RoFDNMLCMK6Txjzwc4tu+g09thLp+b+dTYSnGG2x/9+4sxGBW+G4vMKV
         JKEw2lJE8mmgVO/LHxvaaft/mytMhBO0U+vBhxCNz4QMq8AxE6O6g4Gxt2167PMfnHy7
         52f114iABWTWIvLqilt8QxpYe3yUG8dHq6NPCmrclPoHmMoIDKQao5MH08zEjSlU6cvH
         4O1XHks9sOXRlidWUJaKl3pdR8kQcEinSVQTG+dpekmqkr/gJ//3do4hqxyvz/StD6OX
         6oEg5VKgzQq2Dh68/NiX/3Dz8+lHcsFQzBDofEk+SclNGFtEd5hngJ/z08TmmoswPhe3
         SIAw==
X-Gm-Message-State: AOAM532RwUpMgMpkwZhddpm2GjLVkb5QXGghKaizUnRn5h7vNrKT1uj7
        1J/WLAggKEN8cP22sq8VRHu6YKD4bzt2
X-Google-Smtp-Source: ABdhPJz/AuHk6c/VnxUK5cRbPl4GWW3zk3BwrQKDzoRVafDAKeiS7yajsMFWAu1AyCkM/OZUJo+uar5xylKF
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:a0c:cb82:: with SMTP id
 p2mr20676717qvk.54.1612282681406; Tue, 02 Feb 2021 08:18:01 -0800 (PST)
Date:   Wed,  3 Feb 2021 00:17:31 +0800
In-Reply-To: <20210202161733.932215-1-kyletso@google.com>
Message-Id: <20210202161733.932215-7-kyletso@google.com>
Mime-Version: 1.0
References: <20210202161733.932215-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v5 6/8] usb: typec: displayport: Fill the negotiated SVDM
 Version in the header
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, hdegoede@redhat.com, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VDM header now requires SVDM Version. Get it from typec_port.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/altmodes/displayport.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 0abc3121238f..7b47dd4ea531 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -15,8 +15,10 @@
 #include <linux/usb/typec_dp.h>
 #include "displayport.h"
 
-#define DP_HEADER(_dp, cmd)		(VDO((_dp)->alt->svid, 1, SVDM_VER_1_0, cmd) | \
-					 VDO_OPOS(USB_TYPEC_DP_MODE))
+#define DP_HEADER(_dp, cmd)		(VDO((_dp)->alt->svid, 1,			\
+					     typec_get_svdm_version((_dp)->typec),	\
+					     cmd)					\
+					 | VDO_OPOS(USB_TYPEC_DP_MODE))
 
 enum {
 	DP_CONF_USB,
@@ -62,6 +64,7 @@ struct dp_altmode {
 	struct work_struct work;
 	struct typec_altmode *alt;
 	const struct typec_altmode *port;
+	struct typec_port *typec;
 };
 
 static int dp_altmode_notify(struct dp_altmode *dp)
@@ -536,6 +539,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	mutex_init(&dp->lock);
 	dp->port = port;
 	dp->alt = alt;
+	dp->typec = typec_altmode2port(alt);
 
 	alt->desc = "DisplayPort";
 	alt->ops = &dp_altmode_ops;
-- 
2.30.0.365.g02bc693789-goog

