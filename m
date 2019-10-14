Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA399D64EB
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 16:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732606AbfJNORY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 10:17:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33013 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732457AbfJNORX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Oct 2019 10:17:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so19984945wrs.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2019 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wMvLKdMW2yszyQrYkGsmywM/YMlu6KRc8iq2yfQBOJU=;
        b=eY5Ijx4QWTlhlQGgOpdrVKEgjA20rWFw2eiZwRKaJUwJG/7aYuLbxNjxklme848/FJ
         bZIENnbseJ8mKmmwXVSzonk7Ng1vb6vhsbHBsJNqNAmUllpNX8AX1ucQG8nUQtVatNSn
         sFOIgOQ9gV9zZjtGU0jIjQTaRE9DBPg+HEMIyXkmO2VTK/khiMwWsvhrac4wYFbgq+Z3
         vE5xtZZ0RJ1pMA7JuOvXzAaOGtggmD2NXmqcdm4f6tWycPkf8RLCBBUsj+BrcLeomLtJ
         mR19XkB+Lfc1ufptniAr2amT/joX/dioGuQbWLAGoXf3f64nUyhxO6JQtw6i4rFn3BMz
         quqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wMvLKdMW2yszyQrYkGsmywM/YMlu6KRc8iq2yfQBOJU=;
        b=o9D+W+uVymU5fr/4uxVI5y2XBgTrOEJRcI0PMmm2zFINHPxhDe7D2y/+UDLe3oFd1h
         UvkwbrNMgr3zrQMGvWujM5ip+jpO4MfXkAWBjrSPEREEm/v93RPjY+kE/XlATe/r5s7Y
         MSkWERABUZIyUvEjkp8ihxyrLwOeZ8ljHJGcdPW03WPr9yq48m6LLjTD7BSf2OI6M48t
         rwYa3nOEatmoQlc/I8cBcRgCJB7Vq/dUC05s358Wc09AiM8wS+D2EbmZDDcBW4th6OPY
         6CmPiaeZK/2XhnVd6PaxHhcy0ikEPO2IwAKV0RpJQC0JuT//XtcLhvamefoT3kW9uhsz
         NW0w==
X-Gm-Message-State: APjAAAUbTqs/nwUD5l6+5IPPFyjI7XUxSKsTiLH2cKL3zlPgLmCku17b
        1n9+RRdW7TqaNM74rSl9CH6XZQ==
X-Google-Smtp-Source: APXvYqxYpJiFTdR6oysIP3BylyvjHRtG6AcTsX9/NO35uydOOjXlwBQ3nkYdCfVqNkSILXSLfHU1UA==
X-Received: by 2002:adf:8526:: with SMTP id 35mr300767wrh.266.1571062641346;
        Mon, 14 Oct 2019 07:17:21 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t83sm42708624wmt.18.2019.10.14.07.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 07:17:20 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>, Tim <elatllat@gmail.com>
Subject: [PATCH 1/3] doc: dt: bindings: usb: dwc3: Update entries for disabling SS instances in park mode
Date:   Mon, 14 Oct 2019 16:17:16 +0200
Message-Id: <20191014141718.22603-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014141718.22603-1-narmstrong@baylibre.com>
References: <20191014141718.22603-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch updates the documentation with the information related
to the quirks that needs to be added for disabling all SuperSpeed XHCi
instances in park mode.

CC: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..c977a3ba2f35 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -75,6 +75,8 @@ Optional properties:
 			from P0 to P1/P2/P3 without delay.
  - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
 			during HS transmit.
+ - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
+			park mode are disabled.
  - snps,dis_metastability_quirk: when set, disable metastability workaround.
 			CAUTION: use only if you are absolutely sure of it.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
-- 
2.22.0

