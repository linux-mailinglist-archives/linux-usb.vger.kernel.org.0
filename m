Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEA221588B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbgGFNfP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729346AbgGFNeM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:34:12 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318C5C08C5DF
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:34:12 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o11so40974975wrv.9
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OciwYyOFlkXAJUScx7SVNAsT2ixoj+EcNyfWn6Xsafg=;
        b=VcXzc+ei6oAKh0w9DGfsZ7yETc5sXN+3CKC6KObuvLUoH3M6ejWS+WNh038+jerj1h
         KI4cAa0tpwKF8qImVnIfbBVmuIpuZXmutsi83s3amfRemr24wtyYXdFrVYFykResp+mG
         qSAP9l84fi+Dt0Fnu3Cb2A14nb4o0z0JBuqtUyrjUfF6KCeBfoBEAO5gWLv/tqgaBMBI
         YLCG0Yb6MCy94d4x5KSxVAJ+aVCnKF9vdxqfslNV7uGTtNVTyuugED/g2wBXF3lcN4ep
         1swxoIWib4nm7mySMmzgcmGIskZ388OV4ojyM0vWXISGi3/m8ZetblrkAo0WynFU/xn3
         tkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OciwYyOFlkXAJUScx7SVNAsT2ixoj+EcNyfWn6Xsafg=;
        b=fMSUgTEM8GljCjDL1N9NrxNPa6RLly/dcJV+15FSHHLsRymLI2WYRqJ2E69FD5EKYs
         91AqSNjtqwB4xeYy9M9VuIAUWhFIDxS998TLdxeiYmHvhrZ5o7G4yRziCuWGQgzidhzg
         QTxORo63CVFKbaL4xRbmYZHEcSP3V8iPkUaY46C3RDRWVcDjYaS1yc1l/+PtSo4cbf2Y
         AVyHkoeTeGE9qaf5O+duw0iAN3GIXjMiVVYJlmQA6CtjECVHU5NgdOTxp1Yyn+tI79YS
         TkndHw1Ewc0v3BPK/BE6KPwsDQkYCtYm2NtzC4Mk7Nz/OU52fvGrdYAjiZrUXi0EGs3M
         UjWQ==
X-Gm-Message-State: AOAM5339Lz7D45GP0ZZKniyrBXzJUQJarDCHHdw10OTINxNcxC3B/WXp
        KWIKYp2bc8D9Q2sTtD2MgqXFtg==
X-Google-Smtp-Source: ABdhPJwafQcWQ5lx2OMY4PDcOm8GgrMZIhHBn7VBMVREZs6ut8V4qlC9AB2XOFs67IvmSh8lOCpxuQ==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr21898286wrm.103.1594042450943;
        Mon, 06 Jul 2020 06:34:10 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:10 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jason Yan <yanaijie@huawei.com>, Yu Xu <yuxu@marvell.com>
Subject: [PATCH 22/32] usb: gadget: udc: mv_u3d_core: Remove unused static const 'driver_desc'
Date:   Mon,  6 Jul 2020 14:33:31 +0100
Message-Id: <20200706133341.476881-23-lee.jones@linaro.org>
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

Looks like it's never been used.  Driver was mainlined in 2014.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/gadget/udc/mv_u3d_core.c:35:19: warning: ‘driver_desc’ defined but not used [-Wunused-const-variable=]
 35 | static const char driver_desc[] = DRIVER_DESC;
 | ^~~~~~~~~~~

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Jason Yan <yanaijie@huawei.com>
Cc: Yu Xu <yuxu@marvell.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/gadget/udc/mv_u3d_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index 5bb0568b934e1..5486f5a708681 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -32,7 +32,6 @@
 #define DRIVER_DESC		"Marvell PXA USB3.0 Device Controller driver"
 
 static const char driver_name[] = "mv_u3d";
-static const char driver_desc[] = DRIVER_DESC;
 
 static void mv_u3d_nuke(struct mv_u3d_ep *ep, int status);
 static void mv_u3d_stop_activity(struct mv_u3d *u3d,
-- 
2.25.1

