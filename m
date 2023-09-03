Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5AE6790E57
	for <lists+linux-usb@lfdr.de>; Sun,  3 Sep 2023 23:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349028AbjICVmE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Sep 2023 17:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348918AbjICVl6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Sep 2023 17:41:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF9ACD
        for <linux-usb@vger.kernel.org>; Sun,  3 Sep 2023 14:41:54 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5007616b756so1449250e87.3
        for <linux-usb@vger.kernel.org>; Sun, 03 Sep 2023 14:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693777313; x=1694382113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ma99b4LHGq53HSGcZQ6vjRnRZEGnePGsfNP3DlvaRh0=;
        b=MYOlbi+JGeJYtrISEHYVNAZ7NpZm2f81saVxar4AyapqsYeo9BDcG1/09r2DRXNEwr
         mbf6atiwzL2s0ypbJJ/s/IfiyvbdNhMmfBynyy9zq4Rf7vF/UKwNGdUfTRKiv76gxCL4
         mE9f/P4GWaSqWgWg8Blc4HJR9dojKiw2um+uyr3Q+NCLydXKm/qP+nrucUF+8gcc0LUa
         //eAsXd+bWEEnLFNEWZPuifwc6Em2sPC2YYH2qyga5l+JI3cHzbKS9tuyVzYtX/3wrA1
         q6UYZNGQK1DVXTysf21XRs667gV4bf/tno9hwUtOQSBCWQKZUkQZU+7gjOhnFIxAnByJ
         oXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693777313; x=1694382113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ma99b4LHGq53HSGcZQ6vjRnRZEGnePGsfNP3DlvaRh0=;
        b=L0PCELn/Mx4DSNX1KuZe7EJGm2NQidneAFAydyWqwUnkFmlTA9xHl7Jwz78toQg9aD
         mVgkGMZfqw4WmPBTPdE0FwjnZdw3cuaoVVOwcy3Kmk0ODcVCj+roc2K/e8P5kqVYOJhm
         ujAcxNhInmTw3eywAI+H8IxUlyCQMkfVoZeZ4Q6ehkVXwpRsjoQ/KD1ibs9gAIhMLZuw
         qQ54dgltN+SLadzAlV+Q9aIGZPBk0lUrRBf77N4Eazt7J41+0gxnjBqPENFF2nvvy51p
         x/LQ+bPjLNswCeA8uSXrL3ux1W1TjYtfTnbzR/WzdYbUMbnazBaShNXyigEQyZ9CQzmg
         Thiw==
X-Gm-Message-State: AOJu0YyaVzrFCwTgoh5AD3M0+pphVaoduEX8Yr7l8oSxB7y2HpzOrVQH
        gCpJMqU5RO/XXDDHl1UbFlH9AQ==
X-Google-Smtp-Source: AGHT+IHJVW1SRXqtDqVwoMB9XSCNYSPZYNLw0l5nqazh953B3y2RWKaTYGlv3/IkcL42Y/AtV9dO0g==
X-Received: by 2002:a05:6512:44c:b0:4fd:d517:fbcd with SMTP id y12-20020a056512044c00b004fdd517fbcdmr4553861lfk.6.1693777312712;
        Sun, 03 Sep 2023 14:41:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 14:41:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 02/12] drm/sysfs: link DRM connector device to the connector's fw nodes
Date:   Mon,  4 Sep 2023 00:41:40 +0300
Message-Id: <20230903214150.2877023-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Setup the of_node and fwnode fields for the DRM connector device,
making respective links to appear in /sys.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 06662cc8d3f4..cb926d95ef0e 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -345,6 +345,8 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 	kdev->class = drm_class;
 	kdev->type = &drm_sysfs_device_connector;
 	kdev->parent = dev->primary->kdev;
+	kdev->of_node = to_of_node(connector->fwnode);
+	kdev->fwnode = connector->fwnode;
 	kdev->groups = connector_dev_groups;
 	kdev->release = drm_sysfs_release;
 	dev_set_drvdata(kdev, connector);
-- 
2.39.2

