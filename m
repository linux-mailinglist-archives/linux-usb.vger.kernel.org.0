Return-Path: <linux-usb+bounces-16926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 416AB9B876C
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 01:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D01C1C210ED
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 00:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C655535D8;
	Fri,  1 Nov 2024 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jg/9eRn/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D38F55896
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730419212; cv=none; b=lRm5iscshiSzvpdF732bmnWcSQbs/uMOhZGoQq9dHCaLfhnT+ia5q/YNGVhd2bFNnm9ed5m1MK2sgebhWLAJR3yorzKUF4rBjJry3U9ChImCTXCuQ6DDYJwAuhdkeqQ7VOdKwRmdW7nRVxOnKi7VY9+WI19sM+82iLy8QBvPgMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730419212; c=relaxed/simple;
	bh=UipML7Yg8hvmCAePJ+oaJ+qpyo3ZhUAnZLJXkXrCSsc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NhDmTjP79izjU9MOqGsMatTgy0xKpypt2rXeOQaDghVQXLjk15Gho/PKpmvwNZA30wwZbFFNDMCqg72t65GZjQ/CHbCqS29fUu2NByFlRqWb4gLK1FGq6QYXvJkrloshvCWh89hz13Pb246qdXc5c9o32vOk4nIEkuQTxvSWgKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jg/9eRn/; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e30cf121024so2820032276.1
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 17:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730419206; x=1731024006; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bHYzIMl6GMa9fGC8SIOmNYUS+e+ogp8fvmmhcUikr/U=;
        b=jg/9eRn/NvXNvnOX8kUK52c7pCyB0jvQ4MazRBMUl7EbOqjq7RXKtZBSQ1EPAcd8RH
         omWxsraMMWO6Mzkgs2qw1KalCoYkx/Pdtjb4i8LVnA+OyCWR93Arpo5AxtFfcyMukw26
         OM2sYMAy/8a4s1znUO2m1lVt3e+0vcfAGSFdoZh1x4ts5NJMym77L881wDR+iNf+oXUX
         RCbPmFPXix+f+fmKIhrzr8pGWHzmiOOh81amTl0JOmQ6pCaRZLj0hQ25Qvhee9EMoPwn
         tbyVbSh0sHuHIlAR6eVEtu7nbjCfsl1tJmJLwTFbltSzDoB9TJ+8uqadS9lSuyRySlZG
         lz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730419206; x=1731024006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHYzIMl6GMa9fGC8SIOmNYUS+e+ogp8fvmmhcUikr/U=;
        b=Od0rYNCBXC+h4vEUOKx/21buCn1lF59EfyOXkUv/6oOhsxrzLzcgErAeTlc4THGHHM
         HX0UBro4vOiSgAsytBbgtZGfUbTNhsnN6D5HqyZKjOsNGy0+g46+85rsU6/s6fbDwIht
         CgMPEfNuk4QNttyATnXn/HqmBqLdAOE9UvKBzOHWS1dlHShwcO5nwNBWmvgP2BCy/8CJ
         suYbmd+YuA0YlxUMrrzWLwSZwPWAUCMONeOOCgf6pl/NhagECeMYRHDvl6TPnwC24FDC
         5u2zY5OqWmFTzt8cNjP/UdSPcEtSeLFG2kK06pz6RykQiVCiHdQ8jtPEBY2HfIYsJk0F
         +iXw==
X-Forwarded-Encrypted: i=1; AJvYcCWiLi6lmAKDm9wUqka6PhO/NpJCBAJggJXhiUmlzR67AGKsIYVDfb2PbBV5dZpo8eH+OVKUKFOpSaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfO5Lk+cpJor07Rr5a4lvRsXNrnwVMhTGU9npDGqcz5UrP60O
	43+3o+0qJrpcNEH7wNAmqFQA7MNSOWuaKHU1P50bymNxCdYfEBOryvGpXOIPuKB7t0u27QFTYT8
	+cQ==
X-Google-Smtp-Source: AGHT+IFtsw1CqjzV/sSzOx+52KMljtEulrqPxf+Kx+05Kx6SAXpGeTLFotSa7WrdF+OVatsVoVJKlZNHePc=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a25:83c3:0:b0:e30:c79e:16bc with SMTP id
 3f1490d57ef6-e30c79e1861mr11704276.8.1730419206198; Thu, 31 Oct 2024 17:00:06
 -0700 (PDT)
Date: Thu, 31 Oct 2024 16:59:52 -0700
In-Reply-To: <20241031235957.1261244-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241031235957.1261244-1-amitsd@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241031235957.1261244-2-amitsd@google.com>
Subject: [PATCH v1 1/3] dt-bindings: connector: Add time property for Sink
 BC12 detection completion
From: Amit Sunil Dhamne <amitsd@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: dmitry.baryshkov@linaro.org, kyletso@google.com, rdbabiera@google.com, 
	badhri@google.com, linux@roeck-us.net, xu.yang_2@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

This commit adds a new time property for Battery charger (BC1.2) type
detection completion process (based on BCv1.2 detection spec) when
typec port connects in a potential sink role. BC1.2 detection is used
by some Type C port controllers implementations (such as
"maxim,max33359") to detect the type of charger port.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../devicetree/bindings/connector/usb-connector.yaml  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 21a0c58c65cd..67700440e23b 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -283,6 +283,16 @@ properties:
     maximum: 200
     default: 200
 
+  sink-bc12-completion-time-ms:
+    description: Represents the max time in ms that a port in sink role takes
+      to complete Battery Charger (BC1.2) Detection. BC1.2 detection is a
+      hardware mechanism, which in some TCPC implementations, can run in
+      parallel once the Type-C connection state machine reaches the "potential
+      connect as sink" state. In TCPCs where this causes delays to respond to
+      the incoming PD messages, sink-bc12-completion-time-ms is used to delay
+      PD negotiation till BC1.2 detection completes.
+    default: 0
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
@@ -426,6 +436,7 @@ examples:
             sink-wait-cap-time-ms = <465>;
             ps-source-off-time-ms = <835>;
             cc-debounce-time-ms = <101>;
+            sink-bc12-completion-time-ms = <500>;
         };
     };
 
-- 
2.47.0.199.ga7371fff76-goog


