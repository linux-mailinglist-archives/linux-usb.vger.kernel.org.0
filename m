Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76CD15174FD
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 18:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243370AbiEBQzG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 12:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241975AbiEBQzB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 12:55:01 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8340964F0
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 09:51:31 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id s131so15783015oie.1
        for <linux-usb@vger.kernel.org>; Mon, 02 May 2022 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDbeIX3G7CAdlzYVZYrcGdjlGadN5/397vtFVJ5LGZ0=;
        b=XooHx68yyT3HJJvAvwlP32zNjixKBDR2DZX+foZ/QUBBANRiEilHqqKIyJMKqQF8l/
         USWW8mTYv0yD5WnhQ0199oxHJVfYZVVhMtab+xX+vTqWNRBVI827oWnXoJMh9n93ls2F
         nK8foxy6JPLfD6Nw+a3+4xbM+FHpQjSzk4OnF1T1AEAjbTwArmAnU2215ZyRtP6OZNkY
         VfkPJ6/gYjrj9tycLldB0fedH/O+ear22oankqOIHZjEeGz14YDpsbV+kvuEmjeijaLl
         emcOmA1hbgQyUmRUGEEL9AwyWm5TliinL6rXMxDelAdp3wYsyqvMA8t1HxV9X+0HGmEk
         77zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDbeIX3G7CAdlzYVZYrcGdjlGadN5/397vtFVJ5LGZ0=;
        b=T69zjqNy+qvz2S8Stg6FzVJRV40/Ch51K0C1CRX32cP8b3wk8w86YJJjOBD0xYNcQ8
         eWtUo8sNLuwxlrzMwSL5dd9apgTZonX3pcybP3iB3jPMBQLIEMIATDx4zYZdACI81XtD
         UgxNDP9lJXI1oJVuzx6/uAkfOeLTKSGb+GyzOmD+ggJPpC0AcLqUpV7q5FLjiJxauZQa
         RBMuOGxkVHMVQfCrJUUwvZn8B/PedA2KSdcmEO3MvllxMyWnaUjxdHtsAixfDsG+O7M9
         2gQC59FGZdxQxq0LtmBqgRkRiZLKh9vRFToZS3bAsP+Zi6Uj9+0k9P9D59RkcpfGyj+e
         6sUw==
X-Gm-Message-State: AOAM533M7iL/iJqB3eWzMHjOtfZ/zfrwHuw4hSI0juDvj/Wczk39mhUI
        s6MGOIbAhqJUuTZfzeponHT5sA==
X-Google-Smtp-Source: ABdhPJzBKz1yiIK2Jf2XUFNV3lOE1PeOdmDd6SS2he3gildxijlbqu95mdYr54pb4q4sU2bTKcztnQ==
X-Received: by 2002:aca:502:0:b0:2cd:c24:278f with SMTP id 2-20020aca0502000000b002cd0c24278fmr33189oif.150.1651510290838;
        Mon, 02 May 2022 09:51:30 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h11-20020a4add8b000000b0035eb4e5a6ccsm4029422oov.34.2022.05.02.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:51:29 -0700 (PDT)
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
Subject: [PATCH v4 0/5] drm/msm/dp: implement HPD notifications handling
Date:   Mon,  2 May 2022 09:53:11 -0700
Message-Id: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB altmodes code would send OOB notifications to the drm_connector
specified in the device tree. However as the MSM DP driver uses
drm_bridge_connector, there is no way to receive these event directly.
Implement a bridge between oob_hotplug_event and drm_bridge's hpd_notify
and use it to deliver altmode messages to the MSM DP driver.

Note, I left the original 'bool connected' field to be used by the
notifiers. However I think that it should be replaced in favour of using
the dp->hpd_state properly.

Bjorn Andersson (2):
  drm: Add HPD state to drm_connector_oob_hotplug_event()
  drm/msm/dp: Implement hpd_notify()

Dmitry Baryshkov (3):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event
  drm/msm/dp: remove most of usbpd-related remains

 drivers/gpu/drm/drm_bridge_connector.c   | 17 +++--
 drivers/gpu/drm/drm_connector.c          |  6 +-
 drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++-
 drivers/gpu/drm/i915/i915_drv.h          |  3 +
 drivers/gpu/drm/msm/Makefile             |  1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.h         |  1 -
 drivers/gpu/drm/msm/dp/dp_debug.c        |  6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h        |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c      | 81 +++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +
 drivers/gpu/drm/msm/dp/dp_drm.h          |  2 +
 drivers/gpu/drm/msm/dp/dp_hpd.c          | 67 --------------------
 drivers/gpu/drm/msm/dp/dp_hpd.h          | 78 -----------------------
 drivers/gpu/drm/msm/dp/dp_panel.h        |  1 -
 drivers/gpu/drm/msm/dp/dp_power.c        |  2 +-
 drivers/gpu/drm/msm/dp/dp_power.h        |  3 +-
 drivers/usb/typec/altmodes/displayport.c | 10 +--
 include/drm/drm_connector.h              |  6 +-
 19 files changed, 88 insertions(+), 221 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h

-- 
2.35.1

