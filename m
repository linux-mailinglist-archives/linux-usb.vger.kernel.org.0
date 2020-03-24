Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E60F9190AAF
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgCXKVM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:21:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43217 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbgCXKU4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:20:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id b2so20651023wrj.10
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GhA9x8hO0OSqZFQSsNcZ2UKUqCG4/t+w/VnuL1kPUHU=;
        b=qkkU2Hsy3KDoPTQpcjYY1qdbEx1TTR+31GrBzsfrej5riME6gzYRij4LFJmmSnTlYn
         uj/LhvVBDDEXQRX7bKMRLx6uC0Arw3UVexvCTGXLLPd0KvtNlZDpQ/iSPPpCvfeD0322
         t5zFFnmBEAjdW2Lm7kugnAuT2aXCMf5miFReQar54A4WiMMmWmqciJhne0zU/qvbqbaG
         W8odiVk5SpXaLfVOXq56uqevXAfUJi96Fz8kjWViOqX0ChuAew4G88CPv2PEnlwMUgKa
         utrQa8uQqj3RjbNG5P9/9SQ2rcPjEpQJ16muoqs9rDaO7yh098l6yDOWeyHiGClZvjIH
         6hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhA9x8hO0OSqZFQSsNcZ2UKUqCG4/t+w/VnuL1kPUHU=;
        b=ZTomcBHQVrRHqqJL8ovqic0xRL1WBMzA/XjUpZwhCcPf6YevNnqWjKdJjYQ2u24zEB
         1wLs+GI5Ic87MIH/civw5X0UBmSOaOBH8YupwUvD0r0gapoNFKgHW1yIXHht/pKo7UBB
         1MYYtGfpbBSjUaUa68srg73f+4/qHWWdB43B/0JunCLa3sBiEvS86iCcelkZHdMuIl7i
         eYmtdf2Y6vlijaHENFtZ/TRhouI607/NaxaX0fs4Eg1Uv4d0+/3j0Jl9EG1YSZzXFi7+
         JY54BP5XuTjugz/42VcDj9ZuB4x1MugYp3NsDS8Cf6rvjJIIdSZl1vIWKh8obibd6JfF
         hKmw==
X-Gm-Message-State: ANhLgQ33ap8/K4eii2s+MlRnoOcP0sgbUKoddorZDrkWfZ3LPXNOKsGG
        GzEfnRJNms2y82x37VDIueopkg==
X-Google-Smtp-Source: ADFU+vsOUkcfU1BNDYfhQfb1PA6CgnmWBbxotLsJb0kQIO5yklTREcusHubmGOMO+cINekbgUIW0dA==
X-Received: by 2002:a05:6000:a:: with SMTP id h10mr8576233wrx.226.1585045254135;
        Tue, 24 Mar 2020 03:20:54 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:20:53 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] dt-bindings: usb: dwc3: remove amlogic compatible entries
Date:   Tue, 24 Mar 2020 11:20:29 +0100
Message-Id: <20200324102030.31000-13-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is now a dedicated driver for these SoCs making the old compatible
obsolete.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..2ef0bcc30648 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -14,8 +14,6 @@ Required properties:
 Exception for clocks:
   clocks are optional if the parent node (i.e. glue-layer) is compatible to
   one of the following:
-    "amlogic,meson-axg-dwc3"
-    "amlogic,meson-gxl-dwc3"
     "cavium,octeon-7130-usb-uctl"
     "qcom,dwc3"
     "samsung,exynos5250-dwusb3"
-- 
2.22.0

