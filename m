Return-Path: <linux-usb+bounces-928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 035887B533A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 14:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id A7CC7284B3E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 12:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D72818E3A;
	Mon,  2 Oct 2023 12:29:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559E1802B
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 12:29:20 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87096DA
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 05:29:17 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405497850dbso144867025e9.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696249756; x=1696854556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgkgY+Hphqjk3amPtIZgb/fXeevEe3mIn4vayjBuH/Q=;
        b=pWWuDtexRpwgrtrUTk3qRTe16jU+WxHXtAX+DGFDJirVkzGrnbVRVlDEaMmDGza7U+
         /mwmy7T7gYHZtLSlIzqELL5g+ILgCUXyDf00Hz4icc6OrX36a6gU8cJscNc//j/cucHN
         SZ5fBca54cpK/hKDIEiTKUk/u93qfdGMKoydJjcVslLB6BjOWNeZiuqFQnGy+QBxBa3F
         sKWyt3QzW91uymMrgQiLcrjQ67nwZ28YumtuKFEb6rPPnBh+WlTHiv4iGwPTXWNLgUH3
         mdaH++sdU2VGkxj6QUOP8iyZ581sLawOUC7Qhe4amQI4v2XWU5bWIk0WHMmm7SMof6Ix
         LfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696249756; x=1696854556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgkgY+Hphqjk3amPtIZgb/fXeevEe3mIn4vayjBuH/Q=;
        b=pjS70GTbiFCmAWE+9Q4n5a9LYbtKb4HJOZZutbMCYj17/RkLv7GrdE/KdnMqzddiku
         7YQhafQbiT7e+Ksx2oTAzBrwvoqmLtQYHa4690B7FzoDl3SBUlgICF2t6UkpULw7Z07h
         7BEInn1t4+0eEv0CCo/0hZ+SRXnKqkmym8x80emTi1AggLuNzXsM96dLB4OqwVgjL1/N
         sWWzQCGRljZzIke5Dmqqh/SyXw8TnocHAhI/HkYjCAZvOijQTUk4PAflkLlUIccthiGh
         WZVaxchy21ImhsLy7FSx1udKkNovq59Tlx+hwSxA6ds+XOKqD2bIenLqpj7m7oIwBU/6
         P7pQ==
X-Gm-Message-State: AOJu0Yz3SO5Wq82Vv19GRyU7GQWZZCaJJYANvfECH+B7OTQJf6SExbW+
	RO1PDrfwgHPcxsQVRK/oMW3mvg==
X-Google-Smtp-Source: AGHT+IHaICWozkAOxVKpDGyd190ouKwdneqDNILngD+XeRWNOuBi+o+3Ai7Htyu5JiiL2skBq8+P6w==
X-Received: by 2002:a7b:c44f:0:b0:402:ee71:29 with SMTP id l15-20020a7bc44f000000b00402ee710029mr9655082wmi.10.1696249755731;
        Mon, 02 Oct 2023 05:29:15 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fcf2:65f1:853c:13be])
        by smtp.googlemail.com with ESMTPSA id s16-20020a05600c045000b0040536dcec17sm7144819wmb.27.2023.10.02.05.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 05:29:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: usb: add device for Genesys Logic hub gl3510
Date: Mon,  2 Oct 2023 14:29:08 +0200
Message-Id: <20231002122909.2338049-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231002122909.2338049-1-jbrunet@baylibre.com>
References: <20231002122909.2338049-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add gl3510 USB 3 root hub device id

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index d0927f6768a4..ee08b9c3721f 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Genesys Logic GL850G USB 2.0 hub controller
+title: Genesys Logic USB hub controller
 
 maintainers:
   - Icenowy Zheng <uwu@icenowy.me>
@@ -18,6 +18,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,626
 
   reg: true
 
-- 
2.40.1


