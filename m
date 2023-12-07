Return-Path: <linux-usb+bounces-3873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5BB808EA8
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 18:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7C0A1F2113E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 17:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F224A993;
	Thu,  7 Dec 2023 17:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxkuaaF9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D72110DD;
	Thu,  7 Dec 2023 09:29:24 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d0481b68ebso2714335ad.0;
        Thu, 07 Dec 2023 09:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701970164; x=1702574964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkjkzbQQ6Rq4wq73LTQ/pht/xYe3qv9/yWFrPdq2YYw=;
        b=cxkuaaF9xKrCMDlEPJPJYKJW+CxAQsdZEWDAiqE83yaQ4/KKUik8GvM2NCC3HT8tn/
         jM85ZMLt8Je/ImLjLWSVso3XJYKP+T1qC9RISoKF642AmcJjQ6V6jR6hFSQyq8Ql3zRL
         lH/4RisKcgGusPyUAaNHowNBrD5N739n25VfwOS36VqrfS3t4Mk3radpcci0MrFRge7/
         lYSkn9G3eRNYZ4yeauv++ne/iapgdJ6BfjveiLctlsqzB4gOS3j3kCJDo6fmzbV2aKm0
         dHu0ugekUqN5/KdP/yIldCUwWST3iz3R+5GTb6umVwEzQC9Vi4kMA85O8YW97nZTk+Se
         VhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701970164; x=1702574964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkjkzbQQ6Rq4wq73LTQ/pht/xYe3qv9/yWFrPdq2YYw=;
        b=DIGC/LzXb4NFRX1spxR2DestHjogfYSNh1mOVPEpkxUViCoU6ZEsbaYLxMJ2F438D5
         OVH6VvbK75ThXC5yCvhBI5h5X+zlFUEX20B/S0iLIMFLVBIcx8cIL9LPn9RB+cAlAOEt
         eO/w1y8m96AnAZSvjPF+oeEFEFPXxpsW3SXVvDA2Bkk46VKXQ4H4fh72LaC53f593xRJ
         qY0p/Uh2+7JCLoNKlna+0onVx3AleL1V15Wjcxfkvl2fGx0jaW/36OLffyzlvSIa53Sv
         D37eHCxJE7fQQUUCCwRZ+XH08LLxTrKmji5Ivb6wrlOwUPnkd18clyDW4K3Uq9bLVlt9
         wSJQ==
X-Gm-Message-State: AOJu0YzGeZARKtSjh2GGnES7vPEv3x9/UrjpyPeMp92p/keX4HyA5sBp
	OHq1OJmvVEJxpr1gmHaZR1Y=
X-Google-Smtp-Source: AGHT+IEn+z92S4NGDps/OluXN2AeE6gP00NKBFUZkVl0tmuSdxKi9+GnbUnnBejwlkFX2jyDBLOXPA==
X-Received: by 2002:a17:902:ee45:b0:1d0:9661:161b with SMTP id 5-20020a170902ee4500b001d09661161bmr5649920plo.6.1701970163786;
        Thu, 07 Dec 2023 09:29:23 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:492a:db3d:eb42:de92])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902d48200b001cfb4d36eb1sm62931plg.215.2023.12.07.09.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 09:29:23 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jun.li@nxp.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	s.shtylyov@omp.ru,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3] dt-bindings: usb: nxp,ptn5110: Fix typos in the title
Date: Thu,  7 Dec 2023 14:29:12 -0300
Message-Id: <20231207172912.2658226-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Fix the misspelled "Controller" and "Type-C" words.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v2:
- Also fix the spelling of "Type-C". (Sergey/Conor).

Changes since v1:
- Use a single line in the commit log. (Krzysztof)

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
+title: NXP PTN5110 Type-C Port Controller
 
 maintainers:
   - Li Jun <jun.li@nxp.com>
-- 
2.34.1


