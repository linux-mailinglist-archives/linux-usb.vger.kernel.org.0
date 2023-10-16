Return-Path: <linux-usb+bounces-1676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7875F7CA8FC
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 15:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A96BF1C20B9D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 13:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6927227738;
	Mon, 16 Oct 2023 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6VviycN"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7288226E01;
	Mon, 16 Oct 2023 13:11:56 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B092318D;
	Mon, 16 Oct 2023 06:11:53 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ca3a1a1712so182605ad.1;
        Mon, 16 Oct 2023 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697461913; x=1698066713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YKCms8DS0jYyHS5CO8BgpMSuFaYYHuAs8zsuZaCuW8c=;
        b=V6VviycNy5zMbZ4moeEZm5jdwGeNPGqe0TDY6hYc+pjoJppVVkhSHZJ2/Dmxfpp0UT
         gJaNGy6jVZOdfuzA/U6MOdYKXIoDG9sl9hhmhWkP3SlX0SiIiXHeFh0ToQWopSZZrRKJ
         uO7PTAPDXSiM1UtwGwVlwBXzrYFrkYCb6/nSX44QXzchTpYTL1gxlJn8EV2QOy+DnJUa
         HtkIHZx7+meLqhdlbeiWoXFGJmw/I3PpgFds6ageiZ++mswSl8ULc4zQ0JUmF3etxB5G
         KKOcGsEkHddLjbwYHWgk9zF8Gbtni4Fq9gyiUS5Ice5J96OtQW1P8Q4it+aWsMwAZj16
         XC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697461913; x=1698066713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKCms8DS0jYyHS5CO8BgpMSuFaYYHuAs8zsuZaCuW8c=;
        b=hbvdOwLXjcdmqxsiHscp2sKexhIaZb6X4pF5uNPrK9wdX7IIWLBdZzvc3vjxQsynwY
         WM+ke8AOZCO8YbmPXMEFbyMQpmhKCa6eLYQeHwgZqta9McIeEf1MYXn/pJqUPiWwk9rV
         qO55/GvH8ej1lROKdoZPWoYXQ38tzDiOs3F+aMSqi/iB0jlFxc4T/JrhuymqBJ9KlPGS
         X0df9LTOrgqCKCJTHpbR+AyS//NW66rAZ/anhWLjgLP0KASYG8JAw8MASRqrDrDnQFFz
         DrjJIreslHu05vTkD2PCJwSt6LlFs/M3de3yYe3VtU0tLgLYSfAAjgirFTsCBTY7viYW
         Ba8w==
X-Gm-Message-State: AOJu0YwevAfPEgld1t0OGTX+4uHD/fmkEXewlq8pY+o7smlMddaOtUl/
	ohKESOTW/Z/ri6Dp7T76G/k=
X-Google-Smtp-Source: AGHT+IF+f77rgGBM0mJn4zhn4hNjXUb5tEqRFgofjudBJxPUA/g7SLzOH3XKL+/dxPH6BMv2ehCg2w==
X-Received: by 2002:a17:903:2306:b0:1bb:ac37:384b with SMTP id d6-20020a170903230600b001bbac37384bmr38382736plh.6.1697461913074;
        Mon, 16 Oct 2023 06:11:53 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c13:68ee:4e08:4bd8])
        by smtp.gmail.com with ESMTPSA id kg14-20020a170903060e00b001bbb7af4963sm8454486plb.68.2023.10.16.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 06:11:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4] dt-bindings: usb: gpio-sbu-mux: Make 'mode-switch' not required
Date: Mon, 16 Oct 2023 10:11:41 -0300
Message-Id: <20231016131141.680517-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Fabio Estevam <festevam@denx.de>

On a i.MX8QXP MEK board that has an NXP CBDTU02043 mux, there is
no mode-switch support, only orientation switch.

Make the 'mode-switch' property a non-required one.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v3:
- Collected Conor's ack and sent it as standalone patch as the
previous patch has already been applied.

 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index b61dcf8b4aad..d3b2b666ec2a 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -51,7 +51,6 @@ required:
   - compatible
   - enable-gpios
   - select-gpios
-  - mode-switch
   - orientation-switch
   - port
 
-- 
2.34.1


