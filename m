Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED31F54CFAC
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 19:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357500AbiFORYN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 13:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346434AbiFORYM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 13:24:12 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964DB37A3C
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:24:11 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id f8so10961806plo.9
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fd+38h/ZuXO4QEJ1wGS9J1AZQKshnBpf5+thNgq+mvo=;
        b=fOBgTZqs3hQWvC0l3F/p+i0TivYNq1gtt4eW8E5d/3EHeKhewOjTxbqwIFFM0Lbu/+
         GerPeMoFwy6Z4NemLuydPC6RvG7vpFvFGMyg+AVSadlJ5a+5TyQ5+Fa6xMfwhJ89GRj5
         61ppCfkk/HUEn6FzNFZYKJ5NkQdUVDIEWg3jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fd+38h/ZuXO4QEJ1wGS9J1AZQKshnBpf5+thNgq+mvo=;
        b=LAjA0DzAJyZKOfa6X9C5w7BbscMXba37/8fy67Ql9+NOh1luLGoR4L1SR0erHNKFaj
         98i+bzLPvEUJjy5PXle2jILyOQeSym6uiWiTrcmzMn6IxFgUdFpVdaoLIn6nkQ2/QZHo
         UqlQXwJCQHSth8ndaavGoAaNUOj7oDD3eYRSC85TmlTQxV0oCIVKXgXOsRIqeiSvDc1b
         DoUv1yWgVeVWYxPWhuMc94o0rdl9Crfw114YZ74bTuPIlddAq9fYevNXXR9VxBBrePUG
         OwlhYTT2vIMRQ0E7+p7c9X9TQ6o/srfMIbZ5VxIZvdnwsCfx8lR6FDsLl8LqZrf9kNys
         iwlg==
X-Gm-Message-State: AJIora9nR2TvRXz3NprhRFxq7nhyZcsNf65YsURXyUoTG9nI46mOKcog
        OM1JT1PYwzyZ4XgZ010ok9o9lw==
X-Google-Smtp-Source: AGRyM1u814zjEMHfZtf5sU7v86toFZpanB4vAxQLXrCLt1xth/wAXbRon/BiyEIZtPgjcFL0ZTmeDw==
X-Received: by 2002:a17:902:ca0b:b0:167:4c4d:7320 with SMTP id w11-20020a170902ca0b00b001674c4d7320mr390478pld.113.1655313851115;
        Wed, 15 Jun 2022 10:24:11 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 10:24:10 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        kernel test robot <lkp@intel.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v4 2/7] usb: typec: mux: Add CONFIG guards for functions
Date:   Wed, 15 Jun 2022 17:20:18 +0000
Message-Id: <20220615172129.1314056-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There are some drivers that can use the Type C mux API, but don't have
to. Introduce CONFIG guards for the mux functions so that drivers can
include the header file and not run into compilation errors on systems
which don't have CONFIG_TYPEC enabled. When CONFIG_TYPEC is not enabled,
the Type C mux functions will be stub versions of the original calls.

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- No changes.

Changes since v2:
- Fix up return types for some of the stubs. Remove 1 unnecessary stub
  in the else condition.
- Remove unnecessary IS_MODULE config guard.
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- Added static inline to stub functions.
- Updated function signature of stub functions from "struct typec_mux"
  to "struct typec_mux_dev" in accordance with updates from commit
  713fd49b430c ("usb: typec: mux: Introduce indirection")

 include/linux/usb/typec_mux.h | 44 ++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index ee57781dcf28..9292f0e07846 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -58,17 +58,13 @@ struct typec_mux_desc {
 	void *drvdata;
 };
 
+#if IS_ENABLED(CONFIG_TYPEC)
+
 struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
 				       const struct typec_altmode_desc *desc);
 void typec_mux_put(struct typec_mux *mux);
 int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state);
 
-static inline struct typec_mux *
-typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
-{
-	return fwnode_typec_mux_get(dev_fwnode(dev), desc);
-}
-
 struct typec_mux_dev *
 typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
 void typec_mux_unregister(struct typec_mux_dev *mux);
@@ -76,4 +72,40 @@ void typec_mux_unregister(struct typec_mux_dev *mux);
 void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
 void *typec_mux_get_drvdata(struct typec_mux_dev *mux);
 
+#else
+
+static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
+				       const struct typec_altmode_desc *desc)
+{
+	return NULL;
+}
+
+static inline void typec_mux_put(struct typec_mux *mux) {}
+
+static inline int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
+{
+	return 0;
+}
+
+static inline struct typec_mux_dev *
+typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline void typec_mux_unregister(struct typec_mux_dev *mux) {}
+
+static inline void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data) {}
+static inline void *typec_mux_get_drvdata(struct typec_mux_dev *mux)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+#endif /* CONFIG_TYPEC */
+
+static inline struct typec_mux *
+typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
+{
+	return fwnode_typec_mux_get(dev_fwnode(dev), desc);
+}
+
 #endif /* __USB_TYPEC_MUX */
-- 
2.36.1.476.g0c4daa206d-goog

