Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708A92208CA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbgGOJcR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730761AbgGOJcQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 05:32:16 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE52C08C5DD
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:15 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c80so4687354wme.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 02:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Z3KCPJPJ9xqOxMrVh/E1QUCCirSlEPo9eFXpxRTSLE=;
        b=j1hC6fbFvEKSfKk3vGCWwkBbfplkz5E48kA4VMiG9AJs8jLE2MQYYlqUG4PUexzeWZ
         JaAxqVumQic3OZhO1DNUlAwOkwiHCXh5UE3M2Z+S87THP6F5wND7f9Ee0wmUgmoEegsZ
         LVnSYFgKt+rh9f+IXR2jnsPTcDcBsap1QoK8duiDrdW8QG78i3ll5N03D/juvat4fj7k
         X1b6UEJ/f13U3vfWT5XhHJr0ty7jwnu35Q6LggfCBPBNOw8noBWj6GmoDQ/nQyU7nP+D
         XmMKy432/ChdZt0+jP09xTU+QNTA3a3+aRuWXDbxAe9tU8D26pQELScIlU5dAIpuwSar
         zzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Z3KCPJPJ9xqOxMrVh/E1QUCCirSlEPo9eFXpxRTSLE=;
        b=ua4EVDg3fOcBBVMAU5xOHeyGyJF1O9hjHzbp2tru6aY64n8iu9khT5Rf3FlUlWo43q
         k5ojNtCvg2RkRVjNh9iC4q9h5kAmt/9/ZCCj1GxavNmoWECkUrnL5/zP5f19lqGZiB7y
         cXHdQT3ymKtzuGhv5Hsqr+fShaV1XDsLKOBCFqSnpMzztf7EO7xObTuZMUG1HDKVnNpd
         GHyrulTqxjSEyKFPbi+s1ydE8sDKkjpi4SSMMSvniYtLbF9txLQEM3pzzGquQ+9SHyWZ
         C5zVoWNkw3UNqLwsou/CjbD3QwEs5+F1m2yuuz27BpTdYyNwpq79peqW5PH6/iCW3dT8
         nrgA==
X-Gm-Message-State: AOAM533LMPdzUx3Bv52pz9RBdCzflLPBR0wDwX2ou2eGJvibKh0UNcqB
        jbXCfxLaA2J5VjP5dDqSuV/YiA==
X-Google-Smtp-Source: ABdhPJz2F7AQdDuodvs3Nhzm9b78oR7eczk/gzHg9MMwyTt6vuYsGoFv1+7G/mzU5URIZ5Ey8K5mdg==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr7495953wmg.153.1594805534090;
        Wed, 15 Jul 2020 02:32:14 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id s203sm2686991wms.32.2020.07.15.02.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 02:32:13 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Ben Dooks <ben@simtec.co.uk>
Subject: [PATCH v2 1/8] usb: dwc2: gadget: Make use of GINTMSK2
Date:   Wed, 15 Jul 2020 10:32:02 +0100
Message-Id: <20200715093209.3165641-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715093209.3165641-1-lee.jones@linaro.org>
References: <20200715093209.3165641-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The value obtained from GINTSTS2 should be masked with the GINTMSK2
value.  Looks like this has been broken since
dwc2_gadget_wkup_alert_handler() was added back in 2018.

Also fixes the following W=1 warning:

 drivers/usb/dwc2/gadget.c: In function ‘dwc2_gadget_wkup_alert_handler’:
 drivers/usb/dwc2/gadget.c:259:6: warning: variable ‘gintmsk2’ set but not used [-Wunused-but-set-variable]
 259 | u32 gintmsk2;
 | ^~~~~~~~

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Ben Dooks <ben@simtec.co.uk>
Fixes: 187c5298a1229 ("usb: dwc2: gadget: Add handler for WkupAlert interrupt")
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
Changelog:

v2: Re-written to *use* instad of *remove* gintmsk2

 drivers/usb/dwc2/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index df5fedaca60a0..03cf1fa856219 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -260,6 +260,7 @@ static void dwc2_gadget_wkup_alert_handler(struct dwc2_hsotg *hsotg)
 
 	gintsts2 = dwc2_readl(hsotg, GINTSTS2);
 	gintmsk2 = dwc2_readl(hsotg, GINTMSK2);
+	gintsts2 &= gintmsk2;
 
 	if (gintsts2 & GINTSTS2_WKUP_ALERT_INT) {
 		dev_dbg(hsotg->dev, "%s: Wkup_Alert_Int\n", __func__);
-- 
2.25.1

