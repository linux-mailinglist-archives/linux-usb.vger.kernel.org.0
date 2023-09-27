Return-Path: <linux-usb+bounces-638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE10C7B044B
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 14:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 007D41C20A3E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 12:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FEE28DC9;
	Wed, 27 Sep 2023 12:35:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E6623778;
	Wed, 27 Sep 2023 12:35:25 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BD513A;
	Wed, 27 Sep 2023 05:35:23 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6927528c01dso1722816b3a.0;
        Wed, 27 Sep 2023 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695818123; x=1696422923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZmTHs4dbokakR8gFcLSlnEV375fC03XiwASdWZxx3c=;
        b=a87PakmvGN0TkAWBqkNE3JqpUQGnlktKdKIGWQAYUkb/y7ZlHkFbqH3RstLqRk6G9R
         3Ju4uwa32PUZ4dzdJ4yk0ynt4h8KzLXvxF+CZoytxJ3zQGVyN4G0so+nTJ2g8LFb+Xgd
         vSIBeE/adsghEyv6KQoIxNwUsO81An7JAHi4uM0ancWo8PuYkIRJLpTkVQHUhfM82yI9
         pU5R7IhXRfGhJuS08lDJAUnmI/1AmcPqgdgqQ5mdjBXoX29fzpsRS+x3kteOsDH2BaMX
         QJXCCbudYmaodDe/U/VquixdZWLbzxdZX+rZqXvQZCwlH8cFJl7feU+XpxZwJoHCblp/
         IkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818123; x=1696422923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZmTHs4dbokakR8gFcLSlnEV375fC03XiwASdWZxx3c=;
        b=tt3IYib+iZ1eMnEWk0qTkKMDLxsH+BqtWYAVn41idWGQkK9S8ek+ZHV8H5XxEfffoL
         hroKwLhyvKzMF7r9fSKuYyIZUDkorzNrqmwZ66J7SajENRgTkCmtbRytCwtNEDNTDgEp
         3QDHGVRXo76JinXlh+eA5kuoqqUlj/Xo1WW8tFxpkmi3oX8wUvJcSjkk1FQSZLjWxpJQ
         eGXsgIKY+FeLVYKztpUECAe3yKJnL3TWC7GGMKRHWznhI3+FMW442Twt1axEda95gB3J
         vYgJkSQqk/GXbpFKIKjOJxpNnjVUJJLpWXNxsUed88qwMQ3w49Fv1rNS6PUjDNOPWyZ0
         4N2w==
X-Gm-Message-State: AOJu0YymakR7bKMPBe4I1d7v9kEkC3VhIJNiln88fqrcDXLkr6AYB9gF
	ELexpMuhC+nbNfU3SHq/LD8=
X-Google-Smtp-Source: AGHT+IEteVHzB1bHAgzOS9qc6fFf/SUHwn6ezxQ3PdhRXtaZbCXw+dENsj3GVzN0/K8S83Vj0Ji4dA==
X-Received: by 2002:a05:6a20:1445:b0:13d:d5bd:758f with SMTP id a5-20020a056a20144500b0013dd5bd758fmr1941642pzi.6.1695818122712;
        Wed, 27 Sep 2023 05:35:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8313:ad6b:7769:5148])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902a50400b001b567bbe82dsm12969886plq.150.2023.09.27.05.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:35:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	jun.li@nxp.com,
	Fabio Estevam <festevam@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: usb: gpio-sbu-mux: Add an entry for CBDTU02043
Date: Wed, 27 Sep 2023 09:35:10 -0300
Message-Id: <20230927123511.45085-1-festevam@gmail.com>
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

Add a compatible entry for the NXP CBDTU02043 GPIO-based mux hardware
used for connecting, disconnecting and switching orientation of
the SBU lines in USB Type-C applications.

CBTU02043 datasheet: https://www.nxp.com/docs/en/data-sheet/CBTU02043.pdf

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v2:
- None. Splitted the dt-bindings from the dts changes so that
this series can go via the USB tree.

Changes since v1:
- None. Only collected Conor's Ack.

 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index f196beb826d8..b61dcf8b4aad 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     items:
       - enum:
+          - nxp,cbdtu02043
           - onnn,fsusb43l10x
           - pericom,pi3usb102
       - const: gpio-sbu-mux
-- 
2.34.1


