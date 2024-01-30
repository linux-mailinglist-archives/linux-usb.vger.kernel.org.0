Return-Path: <linux-usb+bounces-5665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A542D842CE1
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 20:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10ABFB244B9
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 19:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB9271B48;
	Tue, 30 Jan 2024 19:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8iJydgk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2597B3F1
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 19:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706643193; cv=none; b=QzTWqyLwoACd/+FioqguR4mNlsY5tTkePODkGYAPHTSuIFcXtaZ7WFfpVqFOGp1VQubppIXftrt0RruDfl+mgYmrgC6sc6fgzv7wxWQY/GOPEmqDz7VOV4LGO0ug0z1UvfE9FTQRCeBt1m0U8AcUoHEYt/WCXzEU/WCrSDZjb2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706643193; c=relaxed/simple;
	bh=Ow4yR6ctjY/xEto4RfYBtSJOP3Dtx+46NhV6h4aXJaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDmZrtp5ch0f5ot68oSn+ssNAJMV6PxckSdvzmQ+UqHU51aGPrw+gDzNr8XRDTOw6sjaG472eT9MhLgTff3Kr1kRN5CchyAmteA3jl0xivoaj0tGMLoHIvIZ0K8SwWcOa4T0B34vzZKxNaoXS1HloijTbB7grjqgHduPRZZpH44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8iJydgk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-511207d62b6so866851e87.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706643189; x=1707247989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIOls1rDbmjiI7zQY4HMCjRALFzPkzCrHv4ccP/WN1c=;
        b=z8iJydgkLglk88uMBlTU0xdGXRGaufzl7rkNvnlYLIxQB0WN5wgfPC0TOM1PbVORPe
         bNnXK0SSLGAFuDAp0kkI3eVqV9n2t/GpJg2w68dPQ+VA/hGM095EY4gVQ3xbqL1D/ftQ
         +9unQbTlMznu5K8yMFPPil+dZBhH4tGf34wvrUIaRPy0MPS302eSye80WwKvMMTU9Vbv
         wsAJphObz4YOP+VWi+Bjs+gFR2bu0vUDPP0y7yuPLFdoMU3tSUWz+/I7N2TcvvgZ4U10
         NQdVAhYK2Cef/6XRUdbIYs2ayk6AWzbEkrEv+cSSGT7RFrbpCFkEnWFtVg9jfuQo/eUs
         81rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706643189; x=1707247989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIOls1rDbmjiI7zQY4HMCjRALFzPkzCrHv4ccP/WN1c=;
        b=cAHubdRmC7tSH4g4VLO+5d6G6mC0Ww6bWJA7CETB9ZWmNHuoPfT9DgEVhIKBirWOV4
         7NU/4JVwOHQ5bu+2i+QUc15Az6VYQo+sNYfWBcbjDP3fD8I+DmEJ3f2UJm+UXC7LzteF
         bbMZwGSdtnxB5iUCRUT/Ti06JzvSzmk9NbzcOhhEjYjk1dY3KD21W/7ApXkTg8PC0/O4
         Ehyo5ZlVj3o0P/1fDL4/G8WG+lJlZMPgxHPO1Mo5++Reiq+gN3hc26/43bHIkVi7LNf1
         WgulVcSHeTRxUuCsOPhweAAW9cblfl/fUr1FTybyLnJLtP3OoYmBZMky4iP7igZDJ2fx
         73vQ==
X-Gm-Message-State: AOJu0YzEx94/tb86JssXZ35Z3Eo6MMXLOtg5GFxOURxZL66RdfU8fFOP
	HZ0H7Qk2nSmUXrCgBmaGQppo5OHe0B+fiZBcX5YmmoiYSLPwV4++SDDQu5Jz4WM=
X-Google-Smtp-Source: AGHT+IG1dEVgfk/rWiEWIJSTmCl2hCeZIAQWlKHhCjW891Qo61yTMMIKfGJhzIMg9E70etfpLY5Acg==
X-Received: by 2002:a05:6512:70c:b0:511:1796:aad6 with SMTP id b12-20020a056512070c00b005111796aad6mr2556925lfs.35.1706643189043;
        Tue, 30 Jan 2024 11:33:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUp+MpkTQXH/5XRhcowQAQh0KJ8oE3k9Ghu3oOyvrS+Nz8DXuSa2BVaeT3a1bDjN2voKHMN2Uw0NyedwxPMBs/1GdDUdJ5fdTkBmSjhr2mZuhKnhifkNKlvAygtS+WM52WdnEmgMShnOygVUUQ8rSBjbGQPIGQnlyaimbHEnYPa1KpqlIi/d7puc7XeGtMF1xko6typsWgeIipLWlPSCiUMRcAgudUuL/9WzMZoUekIUKSIKkurYtDxKNbz3GIt78l1k69xthgKgEQsQucjXMPQ+KNifGdwCS/RScSDzfRqwaIUHsDW60/HxYIm6ICMepf5okjdBwkUlkMwJFLEWjb4odG11TGqoxuCec32PjB3EezKyuDskjQDxR9WgBR2E+UnJUUvjco6spwz1m/I6m5k1nwN3usAbOC8LPGfpHh6E1m1h7OmUVqXlsrG0WTuQs6a3sN0CR+MYl+YwaJkfIXEm986JZIfhX7xdZ8vAL+FccAZtOTwpCvI9Gnw6hpP1UY8VgogFyfMRBDN0205U3uFMrbqb6OsMBGDLDqbsruASmc/2irbbfr/k5cedJ7SkyXeCzlUd8k6mEUnAQSY0xmrIggnma29L/cX8oKWnkfT
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u25-20020a05651220d900b0051119371e7csm366525lfr.120.2024.01.30.11.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:33:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jan 2024 21:32:55 +0200
Subject: [PATCH v3 2/6] dt-bindings: usb: qcom,pmic-typec: add support for
 the PMI632 block
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-pmi632-typec-v3-2-b05fe44f0a51@linaro.org>
References: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org>
In-Reply-To: <20240130-pmi632-typec-v3-0-b05fe44f0a51@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2243;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ow4yR6ctjY/xEto4RfYBtSJOP3Dtx+46NhV6h4aXJaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBluU7x+nuSup/ei3JgHFWe//JXcCdfSiDNirSRn
 q+aDe/1t2WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZblO8QAKCRCLPIo+Aiko
 1XWvB/9ZFdURtS5La2iK9oZ/lQFWJd8RO05uAdlJR7pwQ4aqPzycVjolDaeEi3KaO7XrlTfOTVX
 AwPXozCY6oWCspC0L/IKSXNRXzhpQ9mh9TysyILhc0HUjGG8Eumt66FbfPUpCOTSv59zW2suSBO
 uilHdAS3bbTAmpdafw4jICNUgxx+uEGbJM+OjG3PRYETk48BMNcqFs1L84qDQVne9esW2TcuPKu
 KuZIRflK7/uIptULJoWKbNgwc+u8m5JQbakQFB6BHAjKqYkP6wGmQoq7ybZYTxA+o5fsMCKmipE
 yK9EkvbD//3ILqQ/b313jc9Un/o2bppUl1YGhMbFqCbjbjyw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The PMI632 PMIC has the same Type-C register block as the PM8150B.
However this PMIC doesn't support USB Power Delivery. As such it doesn't
have the second region used by the existing pm8150b bindings. Add if
clauses to handle the PMI632 usecase.

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sdm632-fairphone-fp3
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 32 +++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 55df3129a0bc..6c0c6b337693 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -15,6 +15,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,pmi632-typec
       - qcom,pm8150b-typec
 
   connector:
@@ -24,9 +25,11 @@ properties:
 
   reg:
     description: Type-C port and pdphy SPMI register base offsets
+    minItems: 1
     maxItems: 2
 
   interrupts:
+    minItems: 8
     items:
       - description: Type-C CC attach notification, VBUS error, tCCDebounce done
       - description: Type-C VCONN powered
@@ -46,6 +49,7 @@ properties:
       - description: Power Domain Fast Role Swap event
 
   interrupt-names:
+    minItems: 8
     items:
       - const: or-rid-detect-change
       - const: vpd-detect
@@ -81,7 +85,33 @@ required:
   - interrupts
   - interrupt-names
   - vdd-vbus-supply
-  - vdd-pdphy-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pmi632-typec
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        interrupts:
+          maxItems: 8
+        interrupt-names:
+          maxItems: 8
+        vdd-pdphy-supply: false
+    else:
+      properties:
+        reg:
+          maxItems: 2
+        interrupts:
+          minItems: 16
+        interrupt-names:
+          maxItems: 16
+      required:
+        - vdd-pdphy-supply
 
 additionalProperties: false
 

-- 
2.39.2


