Return-Path: <linux-usb+bounces-14919-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AB97471D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 02:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D659F289480
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 00:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE72F469D;
	Wed, 11 Sep 2024 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxdBQFve"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63EA8F6C
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 00:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726013284; cv=none; b=mddMNDWPw7J2rBxWYXsv3SZDGI6wRiA51WOuUcnNP65cjbhCsBhOpI3ONMAu7Tk00wnoWAcu/xrisrlDwAWDOF3JObVtY8eSNFvoDKOR7vnpjkFkMl2nAkGKlfGuF2vBcqZzzthyE3I7IOPye4z4PdG6A6mGGHicHN0yH/Xe7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726013284; c=relaxed/simple;
	bh=HCzm6/XYJgVg038NOuIBT5dfy7b7uGQ2TF8ZuJ2Crj0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k1K+SilD2z00IJUloi4Pty2cu+ukqFl4mw3bzwnNHgWJcd5dw1MBGoaJ+gKYyAs6R/YljrXIUtbGAG+VFAuvCAcC6ofXZjwP0IWERABoIJiYVeAGSEztdMW4/9GhHr7OXjQ5tznoQIdmvCt3v7awo1Tm1D0x2iyE/bGbcRe2OhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxdBQFve; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6d5235d1bcaso181263937b3.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 17:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726013281; x=1726618081; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=20SC5znsIjYm+2KNyb0KEnPeyTx6kqJyFPelaWmdQXA=;
        b=nxdBQFveAs71K0OseGgzO3bN9zZ/6myW6oE5YztW/00IyP1dK7eNUawCwZf/MlwOSN
         tUntpso4u9vB0TwnkGf8AXrQv3wZMV4DVWwttXjyYyym3aJhCAMQFTvVVC7it7+Egltl
         uafMCt8l1pNLeoIEVSKvvdxe+ijL+xJjidJTstR3WXUUrJ+aSGwWoxgR8zoDb7ZuDfj8
         hD350mJge27F8gzqp+4rC1nbAw7Ft302mr9ItwHr7ln/kDIZZDDCTG68O8AkZx3DL5JL
         7+Is/2+nP8zriZ7uzGL3vsUSFB7w+XzhR9bNwljFZWFBkLwsc/zey8MjGyv3C1ET6T5Y
         g4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726013281; x=1726618081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20SC5znsIjYm+2KNyb0KEnPeyTx6kqJyFPelaWmdQXA=;
        b=JzX3ZY9ExNcbMr43Po8XbQm8emqFqHprwCdJk+dshYqKt7jGx2RC9Yc1x6pDSJMNK7
         yFA+UxQaboiVkYPL+fW0/uwAVCEXLI6YEi1J4gi/HI7H7AbeWvzRRr6+5CEgFLpzU/ig
         yt3YIFqpp7r17exCCuYl05b6qoLowL5VmWYWkC5looRSjl/yf/7Zhr9jyqoEs9qxJi/A
         bbM0xDTKeLFPQmwvYqOzVrCVVTu0bVkdZcX/y6NrXgyIxUrID/vQmB6HD0iBj3RUt78E
         oMO2Dah//eHyM/Ldpw42QBSaOiZIRY35/84MP03XU8GPAqHgI7HQs6axZGGQILvE+KTy
         Q+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXOKcTbsWI3le+f8nUye0VRA2uhEvcPRs0grg+lJ7cM7KW5Z+4hRa9z+Iu0+Xcw+xvoVkJ8c7kAqC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIBGeX+CTTIa7/4bsZv4EsS1Ush08rwNYPBqNCAVINDNVc8AJ
	hRJih5mzLkmqVgp2UDzRqQjKLb7wjwqPk2XEchtldmOWsc/+lFQucEM77FPeeaf/hCQXD8u5GVb
	FFQ==
X-Google-Smtp-Source: AGHT+IE667GhT1HoNc/PHmcsLt+AJfIx+Hx1SkvhKuEFRZUjW1lbjJ3YKeeUz2y1ehuLDAgex6elLCsr8SE=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a25:680b:0:b0:e0b:958a:3344 with SMTP id
 3f1490d57ef6-e1d34a3abb7mr41869276.10.1726013280867; Tue, 10 Sep 2024
 17:08:00 -0700 (PDT)
Date: Tue, 10 Sep 2024 17:07:05 -0700
In-Reply-To: <20240911000715.554184-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240911000715.554184-1-amitsd@google.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Message-ID: <20240911000715.554184-2-amitsd@google.com>
Subject: [RFC 1/2] dt-bindings: connector: Add property to set pd timer values
From: Amit Sunil Dhamne <amitsd@google.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kyletso@google.com, rdbabiera@google.com, 
	Amit Sunil Dhamne <amitsd@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This commit adds a new property "pd-timers" to enable setting of
platform/board specific pd timer values for timers that have a range of
acceptable values.

Cc: Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../bindings/connector/usb-connector.yaml     | 23 +++++++++++++++++++
 include/dt-bindings/usb/pd.h                  |  8 +++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index fb216ce68bb3..9be4ed12f13c 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -253,6 +253,16 @@ properties:
 
     additionalProperties: false
 
+  pd-timers:
+    description: An array of u32 integers, where an even index (i) is the timer (referenced in
+      dt-bindings/usb/pd.h) and the odd index (i+1) is the timer value in ms (refer
+      "Table 6-68 Time Values" of "USB Power Delivery Specification Revision 3.0, Version 1.2 " for
+      the appropriate value). For certain timers the PD spec defines a range rather than a fixed
+      value. The timers may need to be tuned based on the platform. This dt property allows the user
+      to assign specific values based on the platform. If these values are not explicitly defined,
+      TCPM will use a valid default value for such timers.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
@@ -478,3 +488,16 @@ examples:
             };
         };
     };
+
+  # USB-C connector with PD timers
+  - |
+    #include <dt-bindings/usb/pd.h>
+    usb {
+        connector {
+            compatible = "usb-c-connector";
+            label = "USB-C";
+            pd-timers =
+                <PD_TIMER_SINK_WAIT_CAP 600>,
+                <PD_TIMER_CC_DEBOUNCE 170>;
+        };
+    };
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index e6526b138174..6c58c30f3f39 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -465,4 +465,12 @@
 	 | ((vbm) & 0x3) << 15 | (curr) << 14 | ((vbi) & 0x3f) << 7	\
 	 | ((gi) & 0x3f) << 1 | (ct))
 
+/* PD Timer definitions */
+/* tTypeCSinkWaitCap (Table 6-68 Time Values, USB PD3.1 Spec) */
+#define PD_TIMER_SINK_WAIT_CAP		0
+/* tPSSourceOff (Table 6-68 Time Values, USB PD3.1 Spec) */
+#define PD_TIMER_PS_SOURCE_OFF		1
+/* tCCDebounce (Table 4-33 CC Timing, USB Type-C Cable & Connector Spec Rel2.2) */
+#define PD_TIMER_CC_DEBOUNCE		2
+
 #endif /* __DT_POWER_DELIVERY_H */
-- 
2.46.0.598.g6f2099f65c-goog


