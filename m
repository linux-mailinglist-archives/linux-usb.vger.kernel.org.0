Return-Path: <linux-usb+bounces-3863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09504808CE7
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 17:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A635B1F20FBA
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 16:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5F94654C;
	Thu,  7 Dec 2023 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPFMZ547"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C974884;
	Thu,  7 Dec 2023 08:06:52 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5c68b988f3eso40023a12.1;
        Thu, 07 Dec 2023 08:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701965212; x=1702570012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SncyDrD1iqLY11BuPRzN4t5QxIXbUDgT8cWLREXyzyY=;
        b=mPFMZ547LMOIPmGmSXZdiOHz3E96gT6819KsDGjwr7ed/Pn+BdBziLGqJ6cvGuQOeB
         OKYInvwLMwCXv8jXF8XgTt2VNae3c9E2TKEUjOu9m9rI1P49Jl/RY6mpHCyHalGCYUVG
         6CRgxbz3y8vix09f2DhVJc+z02iWfabpCaEUaB5hEESAp/AYkAujvzfeas5BhFR85jGA
         woh+2CbIdoQbHFM6vQklzaCdcbBTLW09Pe/EJqoNqKpYdEEprHWFOJr7f1Gi0rtxMuDd
         k60/65BSZQ4BIMZQOrA7qWdjkXVclZJy9zDDEXv5plVvsPoHFJqtpMykN0EBPpyMEfUT
         owyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701965212; x=1702570012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SncyDrD1iqLY11BuPRzN4t5QxIXbUDgT8cWLREXyzyY=;
        b=Y4BcCpF+AXi9cGdPOWBOjQS3TOh4wmFevC3GeMKt9XXM6woz2kDWzonRA6JTXhx4WH
         6Y3DT/BtydE/ebPPFL0pjCRWUQa0v9NGowNDxN32BHt7uwb1ZPm3CLneQBYwnbJek9e3
         HNxbbPsCWDeDfMW/fv8atNUe4DxR9Pe3hv+yRxJ5zvf/NdQTp55t9Sirekt/JqnfPWwd
         iQkVHbhjIHCyPl7jofQJCkCCNu/nSer5N6EpCIKJYytLP4GmmWkhCiyMf1Fpm6LOeH6c
         JveeslTpXdBJYCb4ILCLko8rZQfc4tZpJGf+gTuqnc1k2Ri1UqN8Rtau2HEF5c2TevI6
         ZT5w==
X-Gm-Message-State: AOJu0Yxe6iDvW3tEJsXDQ0AfnCahlTzSsI5wnetZ+B+vDIe7fefQRW1J
	IFkrByWcVu6FQBBc59jonJw=
X-Google-Smtp-Source: AGHT+IHnJeBMW6DlsH7CCcFUL2AkakRI5XBn+D+QWxbm+CG9Uy/jEGkYqxpCEMDOiJe0WGKSviyQtg==
X-Received: by 2002:a05:6a20:e117:b0:187:4a56:9a06 with SMTP id kr23-20020a056a20e11700b001874a569a06mr5881126pzb.5.1701965212155;
        Thu, 07 Dec 2023 08:06:52 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:492a:db3d:eb42:de92])
        by smtp.gmail.com with ESMTPSA id x20-20020a056a00189400b006ce5066282bsm1492673pfh.34.2023.12.07.08.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 08:06:51 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jun.li@nxp.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: usb: nxp,ptn5110: Fix typo in the title
Date: Thu,  7 Dec 2023 13:06:34 -0300
Message-Id: <20231207160634.2646285-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The word 'Controller' is misspelled.

Fix it.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 28eb25ecba74..f154fae290a4 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/usb/nxp,ptn5110.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: NXP PTN5110 Typec Port Cotroller
+title: NXP PTN5110 Typec Port Controller
 
 maintainers:
   - Li Jun <jun.li@nxp.com>
-- 
2.34.1


