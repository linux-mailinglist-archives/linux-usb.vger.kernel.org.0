Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D853F5174FE
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 18:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242006AbiEBQzH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 12:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242079AbiEBQzE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 12:55:04 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36516357
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 09:51:32 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id y63so15762556oia.7
        for <linux-usb@vger.kernel.org>; Mon, 02 May 2022 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JqXm5mzS8kpBJUgP9sXYQo0gKUg4rwrNT1MkEiMwhzo=;
        b=lpW8N5V4XnUE73nDbYRQGdRm84nw4f38tWrteoB+Jo5jt6mSYmIEMPtazkjTdkKOh4
         JK3ITJ6d4skY4rt1f89ucOlLrxurvr3KYqmzeoH28FyS9VxP4XVwqz6YUBAFx1DwnVN9
         3TzV6pgQkrzLD4GqQ7G3qEH+mSYC6a2JkHNJq4J/82rwoNNtyWwl3ao2IggjKBXn70Kx
         QxqeZa05dRB5KrH1Ox6abxI78yaC3yyXIl6rOkaKCy51t4JSEz2b7DU3NSYESNPjvy+m
         OHQ8xEoLGTthxG1QZ0A6Ag9qF5GdN8hB+LRLyQpohxy8Mm2+sVTktcd0Ml2BgS8WliMe
         Pc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JqXm5mzS8kpBJUgP9sXYQo0gKUg4rwrNT1MkEiMwhzo=;
        b=bz5l5ZwiGcpVSBqeiaN8RuvSC1uEFIfkFH7Xi7BH7kgd/XvxKJcyTAYqc/M3rVqlvf
         gcmgGjHsZYJeniEsXbLa9hDedLG91cFPYFCLyzFRxYQ9JTwij6fTJIioK7hPLQrrYT/2
         TP5/nlGDYzgyg+BgONs0C8RT/vdTnCYlF3GitUooLlcztXC+wEOjCqRiPcP8Tl3Q015y
         TzDO6dau4EJxbZFx2tnGmUXw464ErY7R0+Z6LpdBiPsUDrePj2kD72xtYdYns4tYCFet
         1z/x0GoCidc/kzphf7ygc5lHeec41MWxfyNKdHr965ZBR9/qTvyelxC+ghlTdsm4Saim
         ojug==
X-Gm-Message-State: AOAM531U05sDiz6dcuvZTz7493pxEu7+0LyJzAxSQc4weQVG2F87i7Mz
        iAOuCeHrfgBj7PEH4UA39im7tg==
X-Google-Smtp-Source: ABdhPJyPEJV83XhQIM3m+EnnISwGK0X+EtqC8xYaJoRK12XrkaKDo9qmfW3qOlfv8+YsIKYkTfE4kg==
X-Received: by 2002:a05:6808:1b06:b0:325:ebc4:f391 with SMTP id bx6-20020a0568081b0600b00325ebc4f391mr26286oib.288.1651510292134;
        Mon, 02 May 2022 09:51:32 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h11-20020a4add8b000000b0035eb4e5a6ccsm4029422oov.34.2022.05.02.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:51:31 -0700 (PDT)
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
Subject: [PATCH v4 1/5] drm/bridge_connector: stop filtering events in drm_bridge_connector_hpd_cb()
Date:   Mon,  2 May 2022 09:53:12 -0700
Message-Id: <20220502165316.4167199-2-bjorn.andersson@linaro.org>
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

In some cases the bridge drivers would like to receive hotplug events
even in the case new status is equal to the old status. In the DP case
this is used to deliver "attention" messages to the DP host. Stop
filtering the events in the drm_bridge_connector_hpd_cb() and let
drivers decide whether they would like to receive the event or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- New patch, needed due to the move to drm_bridge_connector

 drivers/gpu/drm/drm_bridge_connector.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 6b3dad03d77d..0f6f3f653f65 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -113,16 +113,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
-	enum drm_connector_status old_status;
 
 	mutex_lock(&dev->mode_config.mutex);
-	old_status = connector->status;
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	if (old_status == status)
-		return;
-
 	drm_bridge_connector_hpd_notify(connector, status);
 
 	drm_kms_helper_hotplug_event(dev);
-- 
2.35.1

