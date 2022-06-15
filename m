Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D31254CF9E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 19:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349764AbiFORVi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 13:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349739AbiFORVi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 13:21:38 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A38422BE8
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:21:37 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso2695033pjk.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jat6dhLeZ479iY01jqnpJJmmx4iBaVyzdt75yCacVFk=;
        b=CTbzYX0mU8x2G9wYTMN9/+ShQbDWPSZUnKSQz3p2zDl0GSxC2zDIeyICJCqxABHmko
         ozexhom+4LY52Rh9URh2HyhEshSaEGxvQ34y2s1se4BY2i8/P4dJIiDiLZQtC1VyxwBN
         gtaeXosMTsknyWQbF3qa6DUok2hckCaeupNgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jat6dhLeZ479iY01jqnpJJmmx4iBaVyzdt75yCacVFk=;
        b=aFky00k2W+vlE9fXA6IttyVQKvDcyufK+/wQU9A0GeoehozSPVRe8jofyy4BQ7R6Ry
         c8s3s4BdolOVSrOHU4b6XYePuhF4f1yvWRJBi3zQ1hMVlvgYd8sscFl9pV19Hb4sTApm
         QGFCxYDHRghBspmccLyRipEO0q8ZCuB79hQRvR4DJwV9X9cHTK0ZlGEET6Ld1lWVaUQa
         2kWJWUsYxzJWFR0aYjYnVo8v9yNA2H9jtNCr6rj+YrP8w6H2RYdS3LMDgIvgCNZz5I9l
         uEUXuY+88rv9zGSMdNjb/9nmJ7goJXEW+v9wIeNDYCbIEcWFyiTT4P8rW801IuhXd0uF
         patA==
X-Gm-Message-State: AJIora9bcMO48qeq2OXZFLmhobej9HPubEdaaSsQBJlyct8dQIbZma45
        Qs6TguIhayuG3eKumorl11Wc8Q==
X-Google-Smtp-Source: AGRyM1v2ffJyyex2Z1SWcnGwQyabjiyjeoPNbV28pRh16ZNt3vcd1Ou9LkSTonhyJ2StUVemfyv4hg==
X-Received: by 2002:a17:902:9307:b0:166:41a8:abc0 with SMTP id bc7-20020a170902930700b0016641a8abc0mr638722plb.135.1655313696754;
        Wed, 15 Jun 2022 10:21:36 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 10:21:36 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, swboyd@chromium.org,
        heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v4 0/7] usb: typec: Introduce typec-switch binding
Date:   Wed, 15 Jun 2022 17:20:16 +0000
Message-Id: <20220615172129.1314056-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
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

This series introduces a binding for Type-C data lane switches. These
control the routing and operating modes of USB Type-C data lanes based
on the PD messaging from the Type-C port driver regarding connected
peripherals.

The first patch introduces a change to the Type-C mux class mode-switch
matching code, while the second adds a config guard to a Type-C header.
The next couple of patches introduce the new "typec-switch" binding as
well as one user of it (the ANX7625 drm bridge).

The remaining patches add functionality to the anx7625 driver to
register the mode-switches, as well as program its crosspoint
switch depending on which Type-C port has a DisplayPort (DP) peripheral
connected to it.

v3: https://lore.kernel.org/linux-usb/20220614193558.1163205-1-pmalani@chromium.org/

Changes since v3:
- Some more modifications to the anx7625 binding patch (4/7).
- Picked up 1 more Reviewed-by tag.

Pin-Yen Lin (1):
  drm/bridge: anx7625: Add typec_mux_set callback function

Prashant Malani (6):
  usb: typec: mux: Allow muxes to specify mode-switch
  usb: typec: mux: Add CONFIG guards for functions
  dt-bindings: usb: Add Type-C switch binding
  dt-bindings: drm/bridge: anx7625: Add mode-switch support
  drm/bridge: anx7625: Register number of Type C switches
  drm/bridge: anx7625: Register Type-C mode switches

 .../display/bridge/analogix,anx7625.yaml      |  64 ++++++++
 .../devicetree/bindings/usb/typec-switch.yaml |  74 +++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 148 ++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  20 +++
 drivers/usb/typec/mux.c                       |   8 +-
 include/linux/usb/typec_mux.h                 |  44 +++++-
 6 files changed, 350 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

-- 
2.36.1.476.g0c4daa206d-goog

