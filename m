Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E8F74C0A2
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jul 2023 05:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjGIDmR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jul 2023 23:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjGIDmQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jul 2023 23:42:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD120E5
        for <linux-usb@vger.kernel.org>; Sat,  8 Jul 2023 20:42:14 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b702319893so50546011fa.3
        for <linux-usb@vger.kernel.org>; Sat, 08 Jul 2023 20:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688874133; x=1691466133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQnOLw2jy72B5d49p7EFl7RtUNtBu7jzNiDmy4d3gvw=;
        b=aAJuz4htS1BKdTf5jaulHZxuWw59Qcz6zgxK/Yat4BgS1ZhDP98V4jFS6AiOpeSjbF
         3IaQtm2szazl+4/o91QCA3nHTnuf12fM2Ta8C7PkLuarkemwo/Rd6wlCgcUWNvWhOnX3
         SqYX0u3aPtjeCynh+C1waBxT6r5b0p02Zyip7UaIvsk1lXu4EkPlFu0yE2qaYSiyPxxp
         gH2GYZe18ll79PTPdV9sU0UIJsbNVg3YDJvz0jJSIkMOQC7d+qb2MnG2mjohw/kSO12X
         4E3B8ruGhfMNy/qV3Jnzoa62EkrxY9dRE/gZbmRnyl6hv+UeV3AKl2/XzHAQjgZxwTQQ
         /jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688874133; x=1691466133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQnOLw2jy72B5d49p7EFl7RtUNtBu7jzNiDmy4d3gvw=;
        b=lAdQF4nhIrWu5oisprAEmpptVQ4Kb71IeEGenv7zk9dJq/1ug6BLeRA0YMrMbJTU5U
         qIRXIdcT3flGdSJyLi4wccTYHxw+NtFDWfZTtBHtSPz4f1UAPnAemSCkemAh49b3b3pU
         0JjfQ4EKjhw3hW7/h6ewyfc4JmG6NtmhfCa7AHjqBi+g+5N3lzzDBvh41n98ub6DoriW
         xp0QApbCTOHrJa8DYvIZrW74DKl/6C3hK7oEIFLTJ1fv44BJPPy6Ano+9wIzLtDxGmHH
         AlSLSQyBEY47+xdNlinCK7CjOnWs71q2DxrzQ/DsZvk7OTf7cQpu8MoKIEf1D2VEHi1c
         4zPg==
X-Gm-Message-State: ABy/qLZrm4e6nOFg59qhTXwGBqrLhXz/JNnWX0RJlPluhRcsxTNAozqx
        Q8W5MEYHOZ53N59EVFK1TCZFMA==
X-Google-Smtp-Source: APBJJlEIUuViZXZGeg4gKvrVXN0zB+nx8HuxfmaaEW7u+bhbsBTjyxPqmkvjkEhwiYrUb2wJY7X9hw==
X-Received: by 2002:a2e:9206:0:b0:2b5:8eae:7846 with SMTP id k6-20020a2e9206000000b002b58eae7846mr6984695ljg.18.1688874132630;
        Sat, 08 Jul 2023 20:42:12 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id y13-20020a2e9d4d000000b002b6d7682050sm1390289ljj.89.2023.07.08.20.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 20:42:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 0/3] drm/bridge_connector: implement OOB HPD handling
Date:   Sun,  9 Jul 2023 06:42:08 +0300
Message-Id: <20230709034211.4045004-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Note, this is sent as v5, since there were several revisions for this
patchset under a different series title ([1]).

USB altmodes code would send OOB notifications to the drm_connector
specified in the device tree. However as the MSM DP driver uses
drm_bridge_connector, there is no way to receive these event directly.
Implement a bridge between oob_hotplug_event and drm_bridge's
hpd_notify.

Merge strategy: since this series touches i915 code, it might make sense
to merge it through drm-intel.

[1] https://patchwork.freedesktop.org/series/103449/

Changes since v4:
- Picked up the patchset
- Dropped msm-specific patches
- Changed drm_bridge_connector_oob_hotplug_event to call connector's HPD
  callback directly, rather than going through the last bridge's
  hpd_notify
- Added proper fwnode for the drm_bridge_connector

Bjorn Andersson (1):
  drm: Add HPD state to drm_connector_oob_hotplug_event()

Dmitry Baryshkov (2):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event

 drivers/gpu/drm/drm_bridge_connector.c        | 34 ++++++++++++++-----
 drivers/gpu/drm/drm_connector.c               |  6 ++--
 .../gpu/drm/i915/display/intel_display_core.h |  3 ++
 drivers/gpu/drm/i915/display/intel_dp.c       | 17 ++++++++--
 drivers/usb/typec/altmodes/displayport.c      | 13 ++++---
 include/drm/drm_connector.h                   |  6 ++--
 6 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.39.2

