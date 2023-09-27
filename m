Return-Path: <linux-usb+bounces-639-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14327B044D
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 14:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 4532B2829DC
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 12:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422641F5EF;
	Wed, 27 Sep 2023 12:35:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C80E250EB;
	Wed, 27 Sep 2023 12:35:28 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB07E1B4;
	Wed, 27 Sep 2023 05:35:26 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c72e235debso427955ad.0;
        Wed, 27 Sep 2023 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695818126; x=1696422926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gprJVDsXwLSiY6ns4WLf8qHBaq7AHy9fuArStvHNVVI=;
        b=FT/lPXtXa252nj2IyWI20iCeWGLWc8lq59OT7wi0PnN8yOoFBA0cMhv3I2QOyQbe2I
         X0cxL4GokxL8XJ7ZaiFtJMHYgEuSOBSz8GfM6lp/0XFXr0dmv8Qq7sRxXsm46N6n8kQh
         HfvawIUmlTvnvAAnXrUudjkpRhhy3PkHQnW1R72Zmi7P8mAvnE/xJ2vCMJ1HGx671L5S
         cDVUQGXtd2kln4jRtRdnjr0cLSfKaScFhGb992S9V/6PrQ+T3f0wVFCrbwuM6qzhzSYK
         AmaNDcO/zl7C7MU0G25qRH2Dx5D3f3vYtNqmuQF177Xpqxh/VI9VJ1wFtEBjaT/l66fy
         slRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818126; x=1696422926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gprJVDsXwLSiY6ns4WLf8qHBaq7AHy9fuArStvHNVVI=;
        b=ddlg85OnQMsMxiZd/q4ariesAvb9bbNHwhMKZ4e7mh0EQfHrgExNXoSuCCZ94ZvC2Q
         B0iWwIl3hM4kAMyomFkDLdl4v5tV1Q+AQNEISUcRsryfAydIkwlU+YfRQona0KAtsvvM
         PMIsqYPFwv69oYFtl1azTxaWwiBEdtlqDeE/CUoFLD6v2rgHPOIIxU7iVgALIoX6uAIV
         r6efsZVdKq7heZo4ZwU3gwqhJZ/RdrZY4aIDyE/tiQqSREuV8dSJnViYzoSI6r0NxtkB
         O+p1Y10aht6HfWVJGIdGYQmbRB4QdaeXFmBh7NDAWDsiZ6pxj/zsH9poTIblMp9gcO3g
         HYog==
X-Gm-Message-State: AOJu0YydKooxAG2GAzOCESxscTTN2vQGG3BzwcWtH/RQBalVHpw3gR2T
	wMpwALzWsnJVzlRJL4gCd0A=
X-Google-Smtp-Source: AGHT+IFvWPS14Ke6xJZbCzThFfKWqUdQUhikdjJShzrA/Q14kj3jp3KU5J0a+6vJuUyG74ROZUfu6Q==
X-Received: by 2002:a17:902:c94d:b0:1c6:9312:187 with SMTP id i13-20020a170902c94d00b001c693120187mr1755433pla.3.1695818126019;
        Wed, 27 Sep 2023 05:35:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8313:ad6b:7769:5148])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902a50400b001b567bbe82dsm12969886plq.150.2023.09.27.05.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:35:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	jun.li@nxp.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 2/2] dt-bindings: usb: gpio-sbu-mux: Make 'mode-switch' not required
Date: Wed, 27 Sep 2023 09:35:11 -0300
Message-Id: <20230927123511.45085-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927123511.45085-1-festevam@gmail.com>
References: <20230927123511.45085-1-festevam@gmail.com>
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

On a i.MX8QXP MEK board that has an NXP CBDTU02043 mux, there is
no mode-switch, only an orientation switch.

Make the 'mode-switch' property a non-required one.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Newly introduced.

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


