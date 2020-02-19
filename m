Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABC31646B2
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 15:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgBSOSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 09:18:25 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55391 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgBSOSY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Feb 2020 09:18:24 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so811860wmj.5
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2020 06:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
        b=OY4L7JXID100VO7sMstNm3Vg7a0+wT+lVdg8MEtqryyI+TYXZGlIErbrrbqxqK3yPs
         wdvk41G17tIZ1Ri3e1jZu3lvbkz+5WxSsokZK4IB2ZF58bVnRIxqOra/hIWPqh0WiXTf
         3BciMV40Ew2d3lcXTn5sJCCJq40CQBm5euELUb6bmhenK2YYJ9K6Yqgz/s4ZxQh0/uMc
         OaH+ZvfL6aVJKEfZMgW3jmEQ1bcHAKMrYn7T+qV/V5xvTiPqsJjuprnJjJT//dt9wJOa
         nna9/GHGDLoUjKC4FlAkG4+HUnxCFQu7hzgb5WtMEJ4d8GmOtobA60I+8L48wt4aoh0b
         ZUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
        b=GlV8Zls0/2w3+E72Jm724n+BnHJjxO9zkzYafiPt3Wyc91cnbCdVY/VMCww+WK1m1r
         UrdHf38GV4FbLJpPdTviIaQRWPqtv2cOPOL3bZ44Gg2Iu294w2zpJLLcFQK/U2pJUvxr
         wlZ3mXdIgquGCY5/IstSgePt1IPu8+0JprZ5AAed/vdbGHRE65O0HC4aT24cokvLoN+w
         aVWBLZ+C8mhbv0VDhjlfYYY2kUV43k+VONG16YNF5jjUi0fQprcJtsPRezeK0/KQCEN0
         0K5rTnA0Pb/DnQh4/rkeQXZoPaJDPMFlLDaVW4L0WOYTHDPkCB+npVCEMR/7eZoBpzpn
         8rZw==
X-Gm-Message-State: APjAAAVuGWPy7Ve9MulsiJTWP7b+RtaIzJ+ZNryxWJAy3fV+s1UVjaKI
        9eDaCSl72btbezsW1vWQntZr6A==
X-Google-Smtp-Source: APXvYqxbFf7wsrLC1kZpSw63DDiVHiO6jf7+hpSQDkUZ5FYc6y6crGhDW4wdqY4nIxMLAhwojCjI4Q==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr10179005wmb.174.1582121901731;
        Wed, 19 Feb 2020 06:18:21 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:510e:e29a:93ab:74c3])
        by smtp.gmail.com with ESMTPSA id b11sm3337772wrx.89.2020.02.19.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 06:18:21 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Jun Li <lijun.kernel@gmail.com>, Tim <elatllat@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] doc: dt: bindings: usb: dwc3: Update entries for disabling SS instances in park mode
Date:   Wed, 19 Feb 2020 15:18:15 +0100
Message-Id: <20200219141817.24521-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200219141817.24521-1-narmstrong@baylibre.com>
References: <20200219141817.24521-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch updates the documentation with the information related
to the quirks that needs to be added for disabling all SuperSpeed XHCI
instances in park mode.

Cc: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
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

