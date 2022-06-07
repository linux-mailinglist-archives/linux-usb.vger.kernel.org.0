Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC185541A91
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 23:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380199AbiFGVeo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 17:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379560AbiFGVcq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 17:32:46 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492F8176D79
        for <linux-usb@vger.kernel.org>; Tue,  7 Jun 2022 12:04:18 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 184so789711pga.12
        for <linux-usb@vger.kernel.org>; Tue, 07 Jun 2022 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UPHySLfOpgOfXsztwA/AoI4liAt+hRYFwSofNUnDeK0=;
        b=NMRk8qUnzsCyyw2urc38alI23uarraGbB57Y33MpslHFrAZKVuxonD/MN435lJFYZs
         jvf2LGisHWNkv78vR/azokCTzZxCkKzp+1nQlFH8JOnRQAMElQgYhq6QWNRlBwFumzv1
         CE9Dheipng0OFhGsDMHPi3dp10SkQAl55SIuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UPHySLfOpgOfXsztwA/AoI4liAt+hRYFwSofNUnDeK0=;
        b=euQNx8ktGUo+e2uxcPzaPJicKjZE5rJQ8PI13Iqrw+jHqVveam0ghlTWmlQPEejN6c
         1DLUyQLBH8r5RTXQc5i2m4McRgrj8tPiIXrkWtdAADmZdzaB1BQ4wW31/EhiVo2xW95f
         PWeDulHkdPmwhJb+1NILCARu4EaIqAYB1GkYZQ20lts0IYJ/WgQn5TBRxvah+ywbghqn
         rV0mqq6KYJhmNqA+5wZ/SEbCFIVfX+M5/Db+PODZJHy27KslO3ed+9vsvjnJK0rUAdSB
         7WSDsJ5pC/iw6xL2IhrIBehtr6rztCwJViW7p2O7dQmN5wLWxOUSdm1tpfZnMTyHbRwW
         gxfQ==
X-Gm-Message-State: AOAM531bxfqtmhIxx38lxo+Lk0msT8457a9T40UNvSHO4D6CKlvGFxjN
        3+67lA6xWRyrX8w3XjMMKp92JA==
X-Google-Smtp-Source: ABdhPJzUhOSgysTyTRCREBnClkvK0Im2EtwyJP1WVB3p1tRJEXapV3kd1TN/wP/ojvVD63SBsIHboA==
X-Received: by 2002:a05:6a00:240c:b0:51b:9bfc:90db with SMTP id z12-20020a056a00240c00b0051b9bfc90dbmr31109429pfh.24.1654628657712;
        Tue, 07 Jun 2022 12:04:17 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id g29-20020aa79ddd000000b0050dc762819esm13236084pfq.120.2022.06.07.12.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 12:04:17 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>, Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 1/7] usb: typec: mux: Allow muxes to specify mode-switch
Date:   Tue,  7 Jun 2022 19:00:19 +0000
Message-Id: <20220607190131.1647511-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607190131.1647511-1-pmalani@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Loosen the typec_mux_match() requirements so that searches where an
alt mode is not specified, but the target mux device lists the
"mode-switch" property, return a success.

This is helpful in Type C port drivers which would like to get a pointer
to the mux switch associated with a Type C port, but don't want to
specify a particular alt mode.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/mux.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index fd55c2c516a5..464330776cd6 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -281,9 +281,13 @@ static void *typec_mux_match(struct fwnode_handle *fwnode, const char *id,
 	if (match)
 		goto find_mux;
 
-	/* Accessory Mode muxes */
 	if (!desc) {
-		match = fwnode_property_present(fwnode, "accessory");
+		/*
+		 * Accessory Mode muxes & muxes which explicitly specify
+		 * the required identifier can avoid SVID matching.
+		 */
+		match = fwnode_property_present(fwnode, "accessory") ||
+			fwnode_property_present(fwnode, id);
 		if (match)
 			goto find_mux;
 		return NULL;
-- 
2.36.1.255.ge46751e96f-goog

