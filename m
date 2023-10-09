Return-Path: <linux-usb+bounces-1289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F67BE879
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 19:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9BED280EB1
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C686038DDE;
	Mon,  9 Oct 2023 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZgqm4Ml"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6538DDB
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 17:40:55 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE492E4
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 10:40:52 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c008042211so57579551fa.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Oct 2023 10:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696873251; x=1697478051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bclGRwuWLHVjQHCsBos6jKdQfEdG5WbxRNo0rlhZFc=;
        b=xZgqm4MlK+x4E1VKaY8XkGJY6rToQpLeW54whj6k4/qzleDR9e+HYcPYt76LAJV629
         VbbNrwP7DnCdGSSIs0p8WPMZxUvBcw+vAC3N0MTr9uwPm+DQ6En16N+tRTjtAOVAZlkQ
         RxKeOwDox/VKHD4SfeN/DyaZkcdV+A0qRTP/aTgkdQDJ9gNqEdupD02cmVBKnea1KmAA
         opPLkUJylDCG/V5S5/+YMQXkmbFOVfaNgUDYoii/X94RGw7klOVpkykQBpcVNiNlv8tZ
         4nbS0wkaeNE3R1gNpSHbwI+01Qt9zL2rzA02GOQK3/bbpnrOMmvwpRpZCnOLp7qTNdsj
         jadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696873251; x=1697478051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bclGRwuWLHVjQHCsBos6jKdQfEdG5WbxRNo0rlhZFc=;
        b=IAUT05Uo/DpFXXHOeSWBJlEbX0CBly9lo9vGImGYjNUCoCdezkUT5vkMrCS2W/e0ST
         KTlp5TIUGyxnQQkTJ6+3TjD7cm+DvNklGJ9LREfXVa/f2CGtY5JIDXDS/hBIvwwLQj4a
         Heok/2Q+zacv38fmitNOx7Euu1UkqGguvzs1Bp/poNgExw/8noVeLRG8gGvFINNlhexf
         3RwD4xQ9CJMK5Sc2DQT4sLVCZobTeL6nbxEVGsZv8Lj9xC7S2GwqcmW7ORZPynleswOf
         xosgeZ9dxvwAEC/pET48pMMwmP/cLd209gICxdX0QsFOBVyy43X2uWwUipOW5KW2t0wS
         HwVQ==
X-Gm-Message-State: AOJu0Ywl5ABzRNd9cydMguUsnnIGxTYVfOs7vK0kUQ004zPnzTXcUM1U
	0oYKSLZT+nNJbQdUTEcxQQRcfg==
X-Google-Smtp-Source: AGHT+IGY96Dx/DKFkz0wGbbKAQL8l46PHp6xMHBL/SRiJTJrxohlqg7G+rNmpZIOvsxiSXs3LsePdg==
X-Received: by 2002:a2e:3612:0:b0:2c0:293c:ad12 with SMTP id d18-20020a2e3612000000b002c0293cad12mr13040999lja.17.1696873251002;
        Mon, 09 Oct 2023 10:40:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z5-20020a2e3505000000b002bcbae4c21fsm2128988ljz.50.2023.10.09.10.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:40:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Simon Ser <contact@emersion.fr>,
	Janne Grunau <j@jannau.net>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 2/3 RESEND] drm/bridge_connector: stop filtering events in drm_bridge_connector_hpd_cb()
Date: Mon,  9 Oct 2023 20:40:47 +0300
Message-Id: <20231009174048.2695981-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009174048.2695981-1-dmitry.baryshkov@linaro.org>
References: <20231009174048.2695981-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

In some cases the bridge drivers would like to receive hotplug events
even in the case new status is equal to the old status. In the DP case
this is used to deliver "attention" messages to the DP host. Stop
filtering the events in the drm_bridge_connector_hpd_cb() and let
drivers decide whether they would like to receive the event or not.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 31baf1f5ff81..70582491d955 100644
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
 
 	drm_kms_helper_connector_hotplug_event(connector);
-- 
2.39.2


