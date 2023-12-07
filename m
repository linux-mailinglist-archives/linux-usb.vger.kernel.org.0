Return-Path: <linux-usb+bounces-3852-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDADB808810
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 13:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863E1283391
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28133D0AD;
	Thu,  7 Dec 2023 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgnqVnZe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACD2D5E;
	Thu,  7 Dec 2023 04:42:27 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c67fdbe7d4so111328a12.0;
        Thu, 07 Dec 2023 04:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701952947; x=1702557747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBoD0NAlVPKWgZXNfYVQBHK6l1V4ZPm2HAkRoJxe6G8=;
        b=hgnqVnZeE/zo6bn7psD1QLEF3sod0mgeeNVUWn9ogmm7yACZRYyX0SbYFQPUamx5Am
         QcEl4GWxT/N/KuYzJXYciDRDi4dHBuRgfbc8Kt0XGJChEnBBRmLY+RQa/udMMkOUiowj
         owj+O1hj4RHC/WDsslxaAqoDBQ/LjnBLCGjfpCON0qmUfsmZOLRo4Mrrq9pmQ0G0nHh4
         9juHB3mzGVB4Ojr70iA9I4ed/s+fcPIEFF7WqCEnMsPv2IRZZ/kiDyQg+0ofM3VRVCE8
         ncrVjGqW5WEOUccymbzHKmzCP38Ab88EVSwjcuRRKU6LqstDf6kLDrcA/v9393DNcFhA
         9PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701952947; x=1702557747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBoD0NAlVPKWgZXNfYVQBHK6l1V4ZPm2HAkRoJxe6G8=;
        b=biRsa0aU92NjAQPzVpm6d55JgCdjYg59Xs7DZalogzvpiu4jcsIm72ztLJHidhcEJf
         Rywa6+5SGWtzbvu42u1/OYci2+KEkV6JZ4fOijCyBgBpvnsdWAMc1fTyzWsy/KioCw9E
         0teb0a5E7X9OQKqB82Hmk4Ku/BFriLxJCcqg/2zrS2y4n0Wng2F7HOaa433TAr9S/v60
         AJdr3cKfFOKjwa1t01B6pH4R8BCM/YiF3zFUwsbA75CJoSmYrA17bnX+Q5ryUMhx93Tg
         7iOqzc8uTB8bf+3B4+Q/Rw/EHGNmLy7THvYD0d4pQc2Kgi7LvRKOBogWP3hJRuhJiTay
         /7fg==
X-Gm-Message-State: AOJu0YwT3mKQ4rkhcSw0cHLEtLCADO1QXS5jjuEvGuyOcsxaVtddfJGW
	iEQ6k2/jT202XJNdgT4mLAU=
X-Google-Smtp-Source: AGHT+IFH6AJFYpAebsuV5dy8XuNU7aXMCnYbBJkNaIgFkUfJ8ynJX2GLPLJDDjo0NDNpIg6Zl5tSEw==
X-Received: by 2002:a05:6a21:188:b0:18f:c8e7:ac9f with SMTP id le8-20020a056a21018800b0018fc8e7ac9fmr5160633pzb.3.1701952947301;
        Thu, 07 Dec 2023 04:42:27 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:492a:db3d:eb42:de92])
        by smtp.gmail.com with ESMTPSA id pw10-20020a17090b278a00b002867594de40sm1263064pjb.14.2023.12.07.04.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:42:26 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: uwu@icenowy.me,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: usb: genesys,gl850g: Document 'peer-hub'
Date: Thu,  7 Dec 2023 09:42:17 -0300
Message-Id: <20231207124217.2530457-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The 'peer-hub' is a valid property for the hub.

Document it to fix the following dt-schema warning:

imx8mp-debix-som-a-bmb-08.dtb: hub@1: 'peer-hub' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index ee08b9c3721f..37cf5249e526 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -29,6 +29,11 @@ properties:
     description:
       the regulator that provides 3.3V core power to the hub.
 
+  peer-hub:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the peer hub on the controller.
+
 required:
   - compatible
   - reg
-- 
2.34.1


