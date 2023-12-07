Return-Path: <linux-usb+bounces-3868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B87808D7A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 17:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 878861C20AA8
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 16:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC934776C;
	Thu,  7 Dec 2023 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFIi4YDZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A34810F3;
	Thu,  7 Dec 2023 08:34:41 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d072f50a44so2411575ad.0;
        Thu, 07 Dec 2023 08:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701966880; x=1702571680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOGw2W3jLOAHznlrSbnbW0fidCo29b1AXBg+sMocrPs=;
        b=dFIi4YDZNfWqcblp+qcP5skBVP71+hPqaxSNB+x3WbpLbR2tFxDuykD1eX9U0oGND4
         gQoHdntSczmk53bc6RXPmzktqvCqNd8LAXLVZQjGDzpyK2A9fHIVf1BMHV5z+/eYIJKN
         PU/Ti0hkoggbrExxG+4W9rr56aLA2ugmBU/ZBDe9mbZQ6YFeYCGrdtvDtDEgSEYEheFN
         wXzpaQwaKhC67HTPzFEr36/ln5Xr9jtSm4lOx5c7n7XC6zXBQHcP+3X2r9B/SHbRGOXC
         4hkU+826pSZs45VvkHMF5KwLXBgS89Per6oQcxzvrlhQ9BAy57CsliBmn4H+TebeLISW
         DnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701966880; x=1702571680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOGw2W3jLOAHznlrSbnbW0fidCo29b1AXBg+sMocrPs=;
        b=KgzghNaJQA64O8ZPi7LD5O2G5N0KjBASNG+y2AoZydJEYsaDW2+u0cpF28HiFttdiZ
         2ykl3GsbRTiihCuG1V1fudFN4L/v5OjGVuyqAFZyJh3OUap4ORonCBAO7C8XUqHC1cvu
         +GMLkPM2vs3qn1OhhlACYFBQB3l6Xsxecz6WI9Gl0aT1dzU/7mTkAYXmPeNFmmGfL7BZ
         h/v7I7NRoFbUpJhzpcCnE5ftDc64pTuyktOyN4RJIkWOaR1fTDoOC6h9L7Tn+san0Ft4
         cz15ebCywSKyIf9wLuvYoKv+eG4sU5pyPDw7ZVg4oMTaPzFn65m/43jmGjQujIOV0cT6
         Bmpw==
X-Gm-Message-State: AOJu0YyDCpHuTx+KQLGAf5xzxGAuXlDNFsaAyHgkT++OB4Tq2flbJmU2
	S+EqmWWxKnB3+F8vKfc/MXs=
X-Google-Smtp-Source: AGHT+IHu8CxMgLoCdvksxhWQU2Ti1IysB/voNu8hbXfDghp7QitpQlcBCIBMiUnLEIiqNarLr7KHOg==
X-Received: by 2002:a17:902:7616:b0:1d0:bcd5:903 with SMTP id k22-20020a170902761600b001d0bcd50903mr5346780pll.4.1701966880470;
        Thu, 07 Dec 2023 08:34:40 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:492a:db3d:eb42:de92])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001cf51972586sm3790plb.292.2023.12.07.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 08:34:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jun.li@nxp.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: usb: nxp,ptn5110: Fix typo in the title
Date: Thu,  7 Dec 2023 13:34:26 -0300
Message-Id: <20231207163426.2651126-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Fix the misspelled "Controller" word.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
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
+title: NXP PTN5110 Typec Port Controller
 
 maintainers:
   - Li Jun <jun.li@nxp.com>
-- 
2.34.1


