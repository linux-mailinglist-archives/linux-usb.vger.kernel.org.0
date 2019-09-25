Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 969DCBE918
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 01:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732306AbfIYXmd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Sep 2019 19:42:33 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44904 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732271AbfIYXmc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 19:42:32 -0400
Received: by mail-pl1-f193.google.com with SMTP id q15so131928pll.11
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2019 16:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BqAPbs/wZUWEhGivyo3NLB3Z3ocJiJHq8gLjsQrSOVI=;
        b=l2vPkiRmlXdJHN6GeFN8Z8GiZhmhg12dGgNyE97gFX1t7ha+98miz02tsg7Iek0dCg
         YoIg336NYQakybahq3pjXQV13OnYmh9bWgL1jRY5E9CDaycXkOrtT5JroxmvjkHypxwI
         gnxiap1CkAzXLcRY+iCMlLe9fxDBjp8FCX88MgFfNwx8Vr2u+lX9qbsEuSBaq2xUjRcm
         znMZhxhAgK1OX2g9PYKludIijQYdXzfey0dI+iQlBB6LHM21pWsoyNUlz7DGJE/4PwO3
         E1Bc5MEG371EEWMJNAGOFduBccgOxXKkgNPh/klrf+8pgvOIaRzM2e43J2lr/WYyce8k
         JjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BqAPbs/wZUWEhGivyo3NLB3Z3ocJiJHq8gLjsQrSOVI=;
        b=N2M0QZYTJI1pJyWrDDueNufYvDM7h02F/iE0gbqqkzuFZ+yNZYO69nPfvqxNzLuXEl
         7OFVYCucQHJM74PoXLe52pp5YUR5vaW5bpLBCNz6ZxtbOj7goHqWALq4Ri82ui4smDQi
         9aAc3FTJgLhX1iUz9s4+aVJD3Q2bykV5tXey/SZoo1SABrzcU1HunVtRhaoMbKqJmPIM
         AP1D4KIKzp2eyQVJ1mn/LRmC+y8Hi6dOvdnSmDLK3p0Gc11cahcqVBRjOjL5r+oQpCfb
         nyiv6y9egiZ1hbd/QgJCyTaMygiSnrnqQl+8kyqKrImQboXSt9U5NXEtxOZbfmm+z1ql
         IasA==
X-Gm-Message-State: APjAAAVPBO4O7Wr6/Tp2hfR3epRv8j8aMWyQlVEsfakKEgzs+jEVAx0q
        jua4jxXDJarmpc3FiXWBx00tfQ==
X-Google-Smtp-Source: APXvYqzMUd03gD/db63Y3t5pD+j0LGb6omLi0D1rmvHroR9ZzP4ylqsiPQgYxlYCCvBxuIxa9kobfw==
X-Received: by 2002:a17:902:6bc5:: with SMTP id m5mr707175plt.169.1569454951894;
        Wed, 25 Sep 2019 16:42:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id d1sm131127pfc.98.2019.09.25.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 16:42:31 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yu Chen <chenyu56@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: usb: dwc3: Add a property to do a CGTL soft reset on mode switching
Date:   Wed, 25 Sep 2019 23:42:20 +0000
Message-Id: <20190925234224.95216-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925234224.95216-1-john.stultz@linaro.org>
References: <20190925234224.95216-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Provide a dt-binding for quirk needed to do a GCTL soft reset on mode
switching

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..cf4ef6c22fb3 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -77,6 +77,8 @@ Optional properties:
 			during HS transmit.
  - snps,dis_metastability_quirk: when set, disable metastability workaround.
 			CAUTION: use only if you are absolutely sure of it.
+ - snps,gctl-reset-quirk: when set, GCTL soft reset will be executed on mode
+			switch.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
 			utmi_l1_suspend_n, false when asserts utmi_sleep_n
  - snps,hird-threshold: HIRD threshold
-- 
2.17.1

