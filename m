Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C44D5174FF
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 18:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386331AbiEBQzM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 12:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242813AbiEBQzE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 12:55:04 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEA96245
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 09:51:35 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-e9027efe6aso14778818fac.10
        for <linux-usb@vger.kernel.org>; Mon, 02 May 2022 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K90a1QhJHpsQXxatRkh1e5e68HIkTPZWj4pLHJQIQOA=;
        b=FQdtOKJDpPgUqFOC6SLrbP7LwibhmUyCwt5JMP8J7hd8YFMu7yfmlKGGywt9yD2AzZ
         4bNOCHHiB4eybvTS1NLlgDgqEqzaXe1WLrpi6/yEbiUSZF2iTfhDUcdd1aTSBJeMO0s+
         RNrSMxkgJ+cDk16I0j3q/QuMvq9FTTHLpjVDaOXW87Soxx1WNnA4G05KHPsHX0Bt1RQA
         Che3UYlwJtgGsO1iyGUIuklvTidR98D2Ml6CHj7wHGh1HQDEJRNLfW0dOlqfrKO3it+q
         zq7mWXF6EKGzBH3tI8Ob+j4wTCs0Uu1e3d+TRSRlrso0O0Uq58gkXqcVYskUpugAfKiT
         Z9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K90a1QhJHpsQXxatRkh1e5e68HIkTPZWj4pLHJQIQOA=;
        b=uNMug/8aV1Rz2lzd8WNKD5DzQ4r1ITh8eOmF9N8firZsEXOUDlW3/WJCusYhRg6CRw
         zRe4/RsfbMeslV9ybNZSRMLBQuEhhRAi7auYnxRbWxHToBBxgW2GVIRGf2uSq/ZG5Rkj
         FFwyAQQaiVsXfJ1Khga0UFS7BYPiTW73Y+ATvCe9dqalCa/MJCaPTaC1AQaXgJN1/UTA
         Vl4Pd77eNHSwQ7BX6SDdBbAkGK2vsI9HRo457cZlaF5euYS/iFPhV4mXAwVjg3Wmk+T2
         9zgVw6cfWkiotHUMGoiTpw0jg4iMSmkEtwQdWQprbmvBDd0g9T1xP0XY2xtqWy4c9xlB
         1ylA==
X-Gm-Message-State: AOAM532eL8b4T4R0oZy39trEPPsFHTmow5QVrOdPKpiMxBloCB+NIkeF
        ZEWWjO+IA3yxkRqfmkqQ58QvxA==
X-Google-Smtp-Source: ABdhPJzCOneZu4AMnooib+bg8ZJwce3fsqFCE7WWhYymkLStPsKv55OzdAyCgnQNFba6Oycz1dDM2g==
X-Received: by 2002:a05:6870:70a8:b0:e6:30d9:c7f6 with SMTP id v40-20020a05687070a800b000e630d9c7f6mr2821oae.179.1651510294594;
        Mon, 02 May 2022 09:51:34 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h11-20020a4add8b000000b0035eb4e5a6ccsm4029422oov.34.2022.05.02.09.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:51:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 3/5] drm/bridge_connector: implement oob_hotplug_event
Date:   Mon,  2 May 2022 09:53:14 -0700
Message-Id: <20220502165316.4167199-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Implement the oob_hotplug_event() callback. Translate it to the HPD
notification sent to the HPD bridge in the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- New patch

 drivers/gpu/drm/drm_bridge_connector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0f6f3f653f65..6a0a6b14360a 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -123,6 +123,17 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
+						   enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hpd = bridge_connector->bridge_hpd;
+
+	if (hpd)
+		drm_bridge_hpd_notify(hpd, status);
+}
+
 /**
  * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
  * @connector: The DRM bridge connector
@@ -233,6 +244,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.35.1

