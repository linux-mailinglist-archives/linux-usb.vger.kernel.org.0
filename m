Return-Path: <linux-usb+bounces-541-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD77ACAAC
	for <lists+linux-usb@lfdr.de>; Sun, 24 Sep 2023 18:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 422A81C2084E
	for <lists+linux-usb@lfdr.de>; Sun, 24 Sep 2023 16:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4516D518;
	Sun, 24 Sep 2023 16:04:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271A1D280;
	Sun, 24 Sep 2023 16:04:03 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A15D3;
	Sun, 24 Sep 2023 09:04:02 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-690fe1d9ba1so1231358b3a.0;
        Sun, 24 Sep 2023 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695571442; x=1696176242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=THIrqfhs66I00TgDmnjEXJn2FBMw3XbQkxYTPCLx3Kw=;
        b=RkZbPURsSLTyPhKdwpn0J221FcsQRDu285+Iaju7p/rEU6NdjAQ76jZ70KBny5M065
         BeshVVLKmi8/AA36twv/AY2e07aFZlLHhxja3w4rN2NqnBwcVk+mKypSfkK1Mzrcd+i3
         uikKrd6yKzZ6x5dWA+/vHNxL2AdbmoDF76lwnw7m8vjl+tIeSvYnQIyDB97GVg7RasUz
         z1j1bCsbfp3yOGhuhZSxZlDcPR2mm3zIYIYiAWiMETfptKInszq5ylDzGM2H+jPUReoO
         QZGAn04JdxdxjM3jb8KtW6yhz5ncjh1mhiizTzy5RnjIgcgUTLP8i49N615X94cOH332
         wJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695571442; x=1696176242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THIrqfhs66I00TgDmnjEXJn2FBMw3XbQkxYTPCLx3Kw=;
        b=wUOdhdPbP3+zKpl0CDIdDU1WIGZMb0hFte7irTfFGXJtDQu+Wh21OHb8Pcw9qjBvuE
         zlJGVidY2jJN/y+K8g5IpX23MClhtZir55DMxzPnthAlLWZMnO1sff5V6R9epd1A0Akl
         pXMPmt6AvaxLaCfxw5I7SEmDY6ogV3oWN1tecM235ztCu7+cE7Za+ji3OZblx24S4mUy
         PvxLjKZo9VZOWbMftmffDkHd5E2VXiM/FfDgD9y0Z8N9c1/XRKzG2oJvuDQN2CMdXlEq
         B0WDoKZNVQtR+1/g1aajLDhPQPtJj1HqtnH/R+MMQdJ9xlpyJLs0vSC9RxSTPEzpLdzN
         siRA==
X-Gm-Message-State: AOJu0YyS15OerdhzX0IzxBDukm27OKQ2D/JlNZcwnMoVHGZ2HUJe3Qn2
	EVZoOA+OO7JvLwPgHxAnTZ0=
X-Google-Smtp-Source: AGHT+IFxRc+ZWfFaXBAHy4XFr3+YtWgw2Pa1YeaH+bNugXaodCE2D27fmdKd/TLmhy+p5VdGUEwWWg==
X-Received: by 2002:a05:6a21:999a:b0:14d:4ab5:5e3c with SMTP id ve26-20020a056a21999a00b0014d4ab55e3cmr7285528pzb.1.1695571442254;
        Sun, 24 Sep 2023 09:04:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1456:78d8:9605:879e])
        by smtp.gmail.com with ESMTPSA id g23-20020aa78757000000b00690cd49cee2sm6461430pfo.63.2023.09.24.09.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 09:04:01 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: usb: ci-hdrc-usb2: Allow "fsl,imx27-usb" to be passed alone
Date: Sun, 24 Sep 2023 13:03:51 -0300
Message-Id: <20230924160351.692867-1-festevam@gmail.com>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Fabio Estevam <festevam@denx.de>

imx27.dtsi describes its usb nodes as:

compatible = "fsl,imx27-usb";

Adjust the bindings to allow it and avoid the following schema warning:

usb@10024000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx27-usb'] is too short

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 1394557517b1..cd58ab3cc143 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -15,6 +15,7 @@ properties:
     oneOf:
       - enum:
           - chipidea,usb2
+          - fsl,imx27-usb
           - lsi,zevio-usb
           - nvidia,tegra20-ehci
           - nvidia,tegra20-udc
-- 
2.34.1


