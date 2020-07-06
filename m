Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2315C21586F
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgGFNe0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbgGFNeZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:25 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C44CC061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:24 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r12so40881770wrj.13
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+aWkOnJjbe/7IK7NRoDvxRwORV+t2eCxVhOYLY5eRmU=;
        b=gbx/6YjTbDOXIW4LuH0gXQ/axZ6vtr5Q+IM30lN6HSd2IbKna7uTyK10teMAt6y0Lk
         0xliIWmuFyYSKC28K8Txu3/u3lIpSijGtDQGknnxxqv2omOKry0M4wAsRTesMW1jTCkw
         /Ba0dcFpT+psH9sKfyWZCtE7LsLorCxeXUV4QsTez0/QuWDq2MrS6syfLhb7J2VnpAbZ
         q2Q119ypezf9Whp4PGxmTQ+bdWH+i0HCBUEBAsa0C1SfsMKNGakHeNCRHHdN1ynTWw5y
         33tnFoqLPdDQh4A3ja91qaZ+9hK40F/VuKoKaVKroSwGPK31KwufTLIdetqfGKmilXP3
         l4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+aWkOnJjbe/7IK7NRoDvxRwORV+t2eCxVhOYLY5eRmU=;
        b=ts9vygYj6MnzG50a7GhXMoUePW+UR08oWsh9cuozkTtxAY/Nn811GBs1RvDTqTJmDX
         FJOxAB/90DFRCW2AmxeQoawByqqw70qbMHiDIhWo/YwE2ukF6w118Q0MDjzUQHhBdka/
         /ul1yfcYsHU+ZvPB9RbfbtD1bl6BVW7KkEH5UKD+nP+6alU+O1KHyA8l7Q4WTrkFhjry
         KCBDd8QhvQZRilGc+8ywJWGgmCKzHu9SDCPSjfeY2SyLOEbCQnWc1jw5ZLw+vYVI82qq
         f4mTObGzmlZe92tyQgHfBrUmdAz7ZRxw4FN4en1DKmGhEYimgqxKhwdMDBB8teoMRFnQ
         9WCA==
X-Gm-Message-State: AOAM5331u7Rg3jhFrYxwd4oj9EQza5ODfLicLFDdpUpi9lrqP9h10EiY
        fXFacIHwcH/CZ3uRh4Gn/Oh2uw==
X-Google-Smtp-Source: ABdhPJxzVzY9SwrV/olyY4sGtNbsNmUZ7ypHADkmoDe0zZ4QHpbHLQ5OWEWVzQ/lT81AhxcLun8qWw==
X-Received: by 2002:adf:8024:: with SMTP id 33mr52422302wrk.117.1594042463436;
        Mon, 06 Jul 2020 06:34:23 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:22 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 32/32] usb: host: xhci-plat: Do not define 'struct acpi_device_id' when !CONFIG_ACPI
Date:   Mon,  6 Jul 2020 14:33:41 +0100
Message-Id: <20200706133341.476881-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since ACPI_PTR() is used to NULLify the value when !CONFIG_ACPI,
struct usb_xhci_acpi_match becomes defined by unused.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/xhci-plat.c:457:36: warning: ‘usb_xhci_acpi_match’ defined but not used [-Wunused-const-variable=]
 457 | static const struct acpi_device_id usb_xhci_acpi_match[] = {
 | ^~~~~~~~~~~~~~~~~~~

Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index f6b4089bfc4a5..3e15b70a6fc99 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -454,12 +454,14 @@ static const struct dev_pm_ops xhci_plat_pm_ops = {
 			   NULL)
 };
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id usb_xhci_acpi_match[] = {
 	/* XHCI-compliant USB Controller */
 	{ "PNP0D10", },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, usb_xhci_acpi_match);
+#endif
 
 static struct platform_driver usb_xhci_driver = {
 	.probe	= xhci_plat_probe,
-- 
2.25.1

