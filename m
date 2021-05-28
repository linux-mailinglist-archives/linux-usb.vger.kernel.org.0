Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2153C393EA3
	for <lists+linux-usb@lfdr.de>; Fri, 28 May 2021 10:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbhE1IUO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 May 2021 04:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236318AbhE1IUH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 May 2021 04:20:07 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730DFC061574
        for <linux-usb@vger.kernel.org>; Fri, 28 May 2021 01:18:28 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id f17so192653wmf.2
        for <linux-usb@vger.kernel.org>; Fri, 28 May 2021 01:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nxtUCORFUv1eRR4XIVBf88/R8ChiE/6MK9LbrGzsY3g=;
        b=O1S/OFyLGA1Z9G6YG2xz/c/bCK2liCA49AwY0X0jpGR4UnFRHDo2izD6P6BCZJiBAy
         Oxghns1L7rdtVmUtPv3wTqv15IEbGkbbQ8GYSQQ7VbshWcHuZ/kpmAq/pUgHdJQ9bGz5
         gkJ0ZfS2hu1xlAzaP2is3rVkppts2+b3SxLa2EQod9EQ7L45N8xZXWGBO6V4EX7qpzLG
         AowHxdyRFyYESkb9XRtRqJk8iwkrO3T2Tg7vC8h2vVScZJCV4cBejYeU4yfB6PuZq4SX
         xJJLXNsshCJR5mVteuWSd+cuV9agT9ljxZfmKgoknP9gkskB3WODiM8XRQdKG0CyimcG
         AHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nxtUCORFUv1eRR4XIVBf88/R8ChiE/6MK9LbrGzsY3g=;
        b=e64kO2j+pphP+7mpJFgLNlS7+0GCLx2/+0hBE7bYLlOuZ6XO/1DjAJSPTtKjpq1QzB
         Q1EMQGOX6TTTrMOlymg21eYt+a9jSZyQ6FQHKGGWSxgbFUja0Jf49DZzQcyMI4krUMOV
         cQozGWDwTNrn1a6Ae4QW7qaKF5n7/WfX2YENQ1xWIS817DlLhKmkXFg7M2NpWw27MLpV
         QK/AUo5dxBWZQkpy67VSxpCYsBMF144c0wBNwG56YlBUpd/hA4wqQCZZS8+hDa6vCxXj
         T2DsLflVA1sUgsDNyJPmyPLumq3MV+MDIV3+rf8bCeiRy5rUUCZ+khPgWx+7yGxE5uRW
         kBeQ==
X-Gm-Message-State: AOAM530cqfnteHQT1Ug8nH+JuVeTtgk+tOQSmiVuJHda+NYERRlVU68i
        dMvgkkBMYeYGpW5VZin5AJpU8Q==
X-Google-Smtp-Source: ABdhPJwTaPerNtSc6U5py9eIAjcVtCvEr9c3x0LBoZ22BD4HFfXyewvA20ELiHPoPtVa6Sn1Pbyo+g==
X-Received: by 2002:a1c:b755:: with SMTP id h82mr5824751wmf.140.1622189907116;
        Fri, 28 May 2021 01:18:27 -0700 (PDT)
Received: from buildbot.pitowers.org ([2a00:1098:3142:14:ae1f:6bff:fedd:de54])
        by smtp.gmail.com with ESMTPSA id u17sm6285689wrt.61.2021.05.28.01.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 01:18:26 -0700 (PDT)
From:   Phil Elwell <phil@raspberrypi.com>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH] usb: dwc2: Fix build in periphal-only mode
Date:   Fri, 28 May 2021 09:18:18 +0100
Message-Id: <20210528081818.2601382-1-phil@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The bus_suspended member of struct dwc2_hsotg is only present in builds
that support host-mode.

Fixes: 62bb46f51f91 ("usb: dwc2: Fix hibernation between host and device modes.")
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
---
 drivers/usb/dwc2/core_intr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index a5ab03808da6..03d0c034cf57 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -725,7 +725,11 @@ static inline void dwc_handle_gpwrdn_disc_det(struct dwc2_hsotg *hsotg,
 	dwc2_writel(hsotg, gpwrdn_tmp, GPWRDN);
 
 	hsotg->hibernated = 0;
+
+#if IS_ENABLED(CONFIG_USB_DWC2_HOST) ||	\
+	IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
 	hsotg->bus_suspended = 0;
+#endif
 
 	if (gpwrdn & GPWRDN_IDSTS) {
 		hsotg->op_state = OTG_STATE_B_PERIPHERAL;
-- 
2.25.1

