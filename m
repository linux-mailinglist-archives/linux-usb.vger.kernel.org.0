Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 987B4194018
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgCZNpc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:45:32 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36281 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgCZNpb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 09:45:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id g62so7082084wme.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FYmBKvDX2uegk8HiuHznpAIvR/lIVMa/DD0ivvJWoKc=;
        b=WFIzC18kvsFjgIJ4FAaGh/U0e0VcyLOupRhUbB4tyLL65yxfgasTs/rTmfpo/K+C8r
         PfCapoDbaqg61p+hAHE7MW7uwGmcPNN0d3wQ/3UWumCMIsY4I5Gu0s4TQqOEeflO4HDm
         Ttxvoii4MFFwJXu1wNm5hk7cnRzqx10VF998dfGBf81edsilQuIw7ybIwSV1XlVG32Wx
         rp9uaoLg/EeTOZni35QERf+9CqXseJQnfGe8h5UtBa65ktyqDSGuejQiF+iGS9Vdm4Ve
         GSEu8/QXFsKWm4phRr9YycLomXzQvo9aVbJTThCeKu3Hvs+yExIEH5hDMK0Tvf21dSaZ
         O4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FYmBKvDX2uegk8HiuHznpAIvR/lIVMa/DD0ivvJWoKc=;
        b=dKBLXSdYtxpLjFBQWzJLaqsGXHJal74Fs4MUDppd6VEQIg2rzMjciUhihinO00IC3J
         aa9gsPrMqfJIHwzPEKdsTAIcAnmN3QG6IsNf0v6R/C1NYdlOhNaO0CDnRgm/L/libS29
         qFKbzIcCqEh5DShixp3kWj5CoRDBGjwgNMjfiYQsuFMtv86o5XWr4/HEVm58dLfWXhDH
         uEInRZBWqYlSidZKMzVnx/BEP7xA6Gm+ct+oXjsiTR+H6cr+hwgW6QmHqHwa8Ta9Yao9
         en43/GE37qB5PTvVkuakVLfb8Oci9i802iG3mdfMP6SZqZ4qCvVoXkqahZ0+vG6SynG9
         IrkQ==
X-Gm-Message-State: ANhLgQ1MBY2Cvp1sda0tsSTLoM0boXjmVVqD0b/4muH+SD9Rp9g1Jrtk
        rOncGy6mhxl/QoNFEaJlQMP7ng==
X-Google-Smtp-Source: ADFU+vtDec2EyGWkeh0RHipBALtSpkGygZ/tofT3qFJR5rH8aahV1B9w9HjqJoFyqKyUoc7AtWokQg==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr70540wmj.12.1585230328275;
        Thu, 26 Mar 2020 06:45:28 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:27 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/14] doc: dt: bindings: usb: dwc3: remove amlogic compatible entries
Date:   Thu, 26 Mar 2020 14:45:05 +0100
Message-Id: <20200326134507.4808-14-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

