Return-Path: <linux-usb+bounces-16557-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B289ABC82
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 05:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6C51B22344
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 03:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC6113CABC;
	Wed, 23 Oct 2024 03:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s7ZJ8wi9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AD513A3F3
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 03:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729655755; cv=none; b=BVDvtJHggeLSR+DpO/lQY/4ifv1m+ph+gPEQpEYZjIlBka2g52Iws54BngKMXzAW+FGAzUF4U9xEpPiXipEQ3n5SzaHHn6CwCF4S4Bw36TN+Zf4mPiF6YOZENdY1JAxTPoXBDmEY0E3clwCer0833svX3/gvMJWGIk0YVuwdDnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729655755; c=relaxed/simple;
	bh=sr1da177nMKJ/Vsh/2ykOlfrWElYkCVx5H9q1E23rWQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D7eL5zovlmpZKNx9j85g4S6v4Zkgg6wAo4VjMEeT5rCPXzrUV7cuBn7B+BGuV8AVctsvhMY/evWTYOeMNCk1FpEa/B0YiiAq5hWi/b82pys9teyxVcDU/RmJfl13zqPiTBvcllQ7gRbHFEzbzawoBATUciQxvI1Uf+1ngRHvcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s7ZJ8wi9; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e2974759f5fso647509276.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Oct 2024 20:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729655752; x=1730260552; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R8NOW9r0NeL3hg4pXGOJ9bNEj8VFlhidqkHS6u4oIJM=;
        b=s7ZJ8wi9oRKfp36hOgXxKI9D9cGtyUOca4b5pUNgsSNOTkTy2eNdLyDBpP+LfJGsMm
         47UEpTlcIVKABzC2EYTOSF272xRY3/hL13zmaaHFA8CB2Ke1FgY3PknWWzTrU1hJBpZv
         qUC4YhUr2lTCnF/v4WQbECw/DbTT28lo37Lsck9g7ach542TLDXQECCh3ivqRoQz60kv
         RR8nP/yMdOWVt0cyTwZtmVefYXXhBEPdOPn7Vy1R4RQl1PEMY/dt4ibeGlV9EJ6ii+26
         42lGwx4ioM4b/P06PojyXocXmb6YGhrkA+vA0pCuQV/jIfg9+kjPPg7M8PKJuFGRd12M
         AbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729655752; x=1730260552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8NOW9r0NeL3hg4pXGOJ9bNEj8VFlhidqkHS6u4oIJM=;
        b=AWSBt3A35ZaD9pThfm/wmt1wP69iUO0ES2DjSuiUfi5NeMuZxQyCEs9pa4wySSYI+3
         FekOD/onnaVQp4rK9x6N2THuaduOrAvCePEWhSUnnojp135RV8rA909q/FvtcLFp2DOO
         V/Uy2FlEPRq1M+A+tRmj7kl4SHnGnI695HjKtmjhnwHf+bKrHiJ8LsAYEket+URngFKJ
         VxyP1f1YeQhuMl5Dy8rWfGRksintogU0Twgo9yANcuWmQ8KWo0ZBwz4wuZ+MX9AKXFSQ
         hhXv0vi/RwkRJVpdOjlW8FrUAVM6HmGaTpzzrPxfiq1gi/Rs3kq6+uTQHYApcyI1YqiU
         Uwzw==
X-Forwarded-Encrypted: i=1; AJvYcCVCDHdcX2bhriSiFuXTBOHYCgQTR1Y6GTsunPMS4yrkLh1wndnYqa8AQD34IC76GzJcioBmE51u4FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXo64Nnt1dibY3RBqgstS8jyz0b2D+ada52f4BozlwYsN/SXr
	vmMtb5dhQNYutTy4G+iUf1cVg8QJTzh/9lx6rErrjPzZT4UrIkMEusumYlymkY0/3W4Ek4dPQ5J
	Png==
X-Google-Smtp-Source: AGHT+IHF16XCapmTGj83fmOd6YDMeRXK+zt7yj7Rd/dEGndzeE1M+dnbq+eF2jqvK+HHDBYhTXpq5zRGHLI=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a25:dc4f:0:b0:e2b:db24:905e with SMTP id
 3f1490d57ef6-e2e39d50bbemr14978276.5.1729655752269; Tue, 22 Oct 2024 20:55:52
 -0700 (PDT)
Date: Tue, 22 Oct 2024 20:55:48 -0700
In-Reply-To: <20241022-pd-dt-time-props-v1-0-fea96f51b302@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241022-pd-dt-time-props-v1-0-fea96f51b302@google.com>
X-Mailer: b4 0.13.0
Message-ID: <20241022-pd-dt-time-props-v1-1-fea96f51b302@google.com>
Subject: [PATCH 1/2] dt-bindings: connector: Add properties to define time values
From: Amit Sunil Dhamne <amitsd@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>, 
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
	Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="utf-8"

This commit adds the following properties:
  * sink-wait-cap-time-ms
  * ps-source-off-time-ms
  * cc-debounce-time-ms

This is to enable setting of platform/board specific timer values as
these timers have a range of acceptable values.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/connector/usb-connector.yaml          | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index fb216ce68bb3..21a0c58c65cd 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -253,6 +253,36 @@ properties:
 
     additionalProperties: false
 
+  sink-wait-cap-time-ms:
+    description: Represents the max time in ms that USB Type-C port (in sink
+      role) should wait for the port partner (source role) to send source caps.
+      SinkWaitCap timer starts when port in sink role attaches to the source.
+      This timer will stop when sink receives PD source cap advertisement before
+      timeout in which case it'll move to capability negotiation stage. A
+      timeout leads to a hard reset message by the port.
+    minimum: 310
+    maximum: 620
+    default: 310
+
+  ps-source-off-time-ms:
+    description: Represents the max time in ms that a DRP in source role should
+      take to turn off power after the PsSourceOff timer starts. PsSourceOff
+      timer starts when a sink's PHY layer receives EOP of the GoodCRC message
+      (corresponding to an Accept message sent in response to a PR_Swap or a
+      FR_Swap request). This timer stops when last bit of GoodCRC EOP
+      corresponding to the received PS_RDY message is transmitted by the PHY
+      layer. A timeout shall lead to error recovery in the type-c port.
+    minimum: 750
+    maximum: 920
+    default: 920
+
+  cc-debounce-time-ms:
+    description: Represents the max time in ms that a port shall wait to
+      determine if it's attached to a partner.
+    minimum: 100
+    maximum: 200
+    default: 200
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
@@ -380,7 +410,7 @@ examples:
     };
 
   # USB-C connector attached to a typec port controller(ptn5110), which has
-  # power delivery support and enables drp.
+  # power delivery support, explicitly defines time properties and enables drp.
   - |
     #include <dt-bindings/usb/pd.h>
     typec: ptn5110 {
@@ -393,6 +423,9 @@ examples:
             sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
                          PDO_VAR(5000, 12000, 2000)>;
             op-sink-microwatt = <10000000>;
+            sink-wait-cap-time-ms = <465>;
+            ps-source-off-time-ms = <835>;
+            cc-debounce-time-ms = <101>;
         };
     };
 

-- 
2.47.0.105.g07ac214952-goog


