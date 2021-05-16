Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75992381C51
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 05:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhEPDuF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 23:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbhEPDuF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 23:50:05 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401C9C06174A
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 20:48:51 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso2755783otg.9
        for <linux-usb@vger.kernel.org>; Sat, 15 May 2021 20:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhSuvbBg5gouj0NE7hl4DXAk820cn3WTuep5FOuXDwc=;
        b=lkZxtWoEjjiosjTeDSf4x3x9LrI+RVU2xKtvHK+igcsoDCFKplXu+Ri92PWCej7FD2
         vLkJ3Uv0hjZGbAoShkD+zgDIbMM6Ylu9prE3RoStAEcHY94pzxo8+qgV0GMyXPgeW604
         jz//XMdatYIawZv5H1x90QQVFViruQBPcb82xLFVd71KzOQX8muETHUqmBCarZqOmBzK
         MSBkgRdS6mcMk++RwG0CgzKdWPWw9KEhAtlyjZOLEupuYNmLdR973mDPvY0sMucfnl5D
         Q9LoSqhw+tNqATp1edBIBhxAO4WGxWWLXbSubAuTKT2eZmbg6+Sz8OfzJYJvI6hhFHw6
         EBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhSuvbBg5gouj0NE7hl4DXAk820cn3WTuep5FOuXDwc=;
        b=ecdllGfDeKD5Aud4J34unwDtiBJwsamYllWr/6pQS35yJY2oxOeDNqj7EY2c3hTYdo
         SWze5ZF4leLeJkkbG2LJwHGriFmnddffxBw7r8Hed5/Nur4EwGISfj+pcsxXcNz0jlcv
         k3dqxnYtPNf/RW8Pfipz6LGVbeybgTCNfMYxg5w/g5RRZm5CaAD2HAGs6Tz5wyilgMsF
         uZf7qDLmBB85hLr6DC+N9imWae/hAFv8mLh8+Y+dCURrAznXHvKUSK8UJly4txCF15yC
         imkIL/nCFQgTyYEn3Soq4T3Qd3C8At654jrIMkSTKX//IvUZUDboDz+ixmC3nggf1Dmr
         U3+w==
X-Gm-Message-State: AOAM533uQ8oVll2KaIHhEL+b55Q0+28YoGUTOmcE5yYdSZUcxJFtm03Q
        imcANYUcwGMRBJRgxqdF4IDkFlBcqeRE/Q==
X-Google-Smtp-Source: ABdhPJyvorLo/0yrCwQe4/dEA9gklJA0g2j0oBuvydQy1cGORFcBO748zV7AJg6c7yxn8J2BIank/w==
X-Received: by 2002:a9d:6255:: with SMTP id i21mr42041532otk.284.1621136930641;
        Sat, 15 May 2021 20:48:50 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u15sm613702ote.81.2021.05.15.20.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 20:48:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: mux: Fix copy-paste of the container_of
Date:   Sat, 15 May 2021 20:48:33 -0700
Message-Id: <20210516034833.621530-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some of the boilerplate code was copy pasted from the typec_switch and
retained the use of the switch's container_of macros. The two structs
are identical in this regard, so this change doesn't cause a functional
change today, but could possibly cause future issues.

Fixes: 3370db35193b ("usb: typec: Registering real device entries for the muxes")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/typec/mux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 8514bec7e1b8..e4467c4c3742 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -45,7 +45,7 @@ static void *typec_switch_match(struct fwnode_handle *fwnode, const char *id,
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				switch_fwnode_match);
 
-	return dev ? to_typec_switch(dev) : ERR_PTR(-EPROBE_DEFER);
+	return dev ? to_typec_mux(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
 /**
@@ -87,7 +87,7 @@ EXPORT_SYMBOL_GPL(typec_switch_put);
 
 static void typec_switch_release(struct device *dev)
 {
-	kfree(to_typec_switch(dev));
+	kfree(to_typec_mux(dev));
 }
 
 static const struct device_type typec_switch_dev_type = {
@@ -239,7 +239,7 @@ static void *typec_mux_match(struct fwnode_handle *fwnode, const char *id,
 	dev = class_find_device(&typec_mux_class, NULL, fwnode,
 				mux_fwnode_match);
 
-	return dev ? to_typec_switch(dev) : ERR_PTR(-EPROBE_DEFER);
+	return dev ? to_typec_mux(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
 /**
-- 
2.29.2

