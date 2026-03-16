Return-Path: <linux-usb+bounces-34884-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOW4Lc8cuGlYZAEAu9opvQ
	(envelope-from <linux-usb+bounces-34884-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:07:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6479329C030
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B46F30774FD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9812C31F9B6;
	Mon, 16 Mar 2026 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pSEAciOq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE16391827
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673389; cv=none; b=t06uvaJoABns4t/COt1/uUlRN1Mgyl8ji39tgKMHndZxdcnCGpG8gfN5QgJPOEaBbWDX71h2wO3dqZCHq1u2vNN2YGP4rgKsT9C+V3OjmcpNr/5CzKAPQhUUNk+FJqmzHffuRhp9a/hCC79blojzZMYb3rTJ6TESym8xHZKZsnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673389; c=relaxed/simple;
	bh=4emKMQpGnwxg+WazHqPYVUn+OWaTGfYXDzRjRzw8P5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JBmKfesMn/Vy/kD+xA8mlX3NfQw+yIR00fHsQaxQU8DT6RJcSHTsgjsumeZ3KaaQ2z1NAMWaJAujxe2bgEIV2l/9HM6xwXM5fp+ji+E96hd4cdRVt/q7MFu13COoCQwXzCfC1VD82n4Gwn6b0c1/Te4xMa0Z8ivyVtzNt+ItmD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pSEAciOq; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-128d59030d0so4827628c88.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 08:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773673386; x=1774278186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w9RHSlwF1VNunYEv1VCERKRFyFUXQhzCOoRBUszxeFM=;
        b=pSEAciOqEB1zlJHZ1KvByjGM51kZmmniv2fzN/FhEQhYNmw2RWcGUu6H7R/SPQvG0H
         Yd7299Ra52hm8hWIHwikjYud55/rm2u0goyW3S3XGPra6dGbb4uFoV+rlw05vTLPHxyW
         v1X9l5+VDQJRCSWZEwRVTOkNOdJt3YP4YaAMSDSGFHJJ35nD2hnCDioUhblZ1NbqDkeV
         4MhyqwczS41gHW9jk2VwkDxTm6fpcSLsP2byC9zArpy1ZU5rd/mtfTnxSwjCTxNBS33J
         oZH5yr3z4B1FJSs93dHOXMzQxI8SF3QRi0/Sast1keftI9h77nPXmAw4K1yxg1Jk0Hj8
         lQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673386; x=1774278186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9RHSlwF1VNunYEv1VCERKRFyFUXQhzCOoRBUszxeFM=;
        b=I1EOlk7O8MhDY3WVuHavB7mBYX7CaQAy1bZ2oJOAx3gzNlEQ5s1zm8c6Wjey4XlBxq
         Cr0BMU+PxVFxtu3reTZRyyqxG3mNBfwOnTh+yWmc4dBwp0Kf7iEFnrTm6KgVHtMxoQRQ
         blmn1gwNlse4PaXxEm3HkyVG+Jfou1vOvr7ffYBLlVDObJ3EeKTvxTJ/ozCXAK38uAek
         /92dG1B4xaOvsFQE1yD/I+EkeIZuyRsiFc69v3pzKlt3T1Y9uq7yY9GUWJw9Sx1b2RLx
         nXSYNCQaAhK1k6WF1ogztNKpbo6vnGE6FY/PSZ2QmpWyOXivUAph20FLmDpevwb1QhtK
         4lqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4jBYrKD/MsSvfjqQ+NNrlGselXtCRm/AGB/wZzyJWIDO4wyg5ggphmY8uWx9vz2lI4uw0w7EqQtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHozzhzZ4ByL3+FFO24FrTdV2OqKlU8UDokL4DegqcDke9taz
	6xNdjHCgHzGRAdcV1aiWDS3SNAc8ySiN/6XBX41tfRDqMcVHPiZZHK1a+wGOR0AZF1GWv+PbimV
	uep21/A==
X-Received: from dlbvv17.prod.google.com ([2002:a05:7022:5f11:b0:128:d41f:2c06])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:628b:b0:128:cf5c:5357
 with SMTP id a92af1059eb24-128f3d0dce2mr6738893c88.2.1773673386080; Mon, 16
 Mar 2026 08:03:06 -0700 (PDT)
Date: Mon, 16 Mar 2026 15:02:59 +0000
In-Reply-To: <20260316150301.3892223-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260316150301.3892223-1-badhri@google.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260316150301.3892223-2-badhri@google.com>
Subject: [PATCH v2 1/3] dt-bindings: connector: Add SPR AVS Sink APDO definitions
From: Badhri Jagan Sridharan <badhri@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Sunil Dhamne <amitsd@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34884-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6479329C030
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

USB Power Delivery 3.2 introduces a new power supply type SPR AVS.
Add macro definitions for the USB Power Delivery (PD)
Standard Power Range (SPR) Adjustable Voltage Supply (AVS) as a
Sink Augmented Power Data Object (APDO) in the device tree bindings.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/connector/usb-connector.yaml      |  5 +++--
 include/dt-bindings/usb/pd.h                   | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 901986de3e2b..a00b239960a3 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -364,8 +364,9 @@ $defs:
           "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
           Sink Capabilities Message, the order of each entry(PDO) should follow the
           PD spec chapter 6.4.1. Required for power sink and power dual role. User
-          can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_APDO() defined
-          in dt-bindings/usb/pd.h.
+          can specify the sink PDO array via
+          PDO_FIXED/BATT/VAR/PPS_APDO/SPR_AVS_SNK_APDO() defined in
+          dt-bindings/usb/pd.h.
         minItems: 1
         maxItems: 7
         $ref: /schemas/types.yaml#/definitions/uint32-array
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index 6cff2339bda3..1e64a1f563f9 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -60,6 +60,7 @@
 	 PDO_VAR_MAX_VOLT(max_mv) | PDO_VAR_MAX_CURR(max_ma))
 
 #define APDO_TYPE_PPS		0
+#define APDO_TYPE_SPR_AVS	2
 
 #define PDO_APDO_TYPE_SHIFT	28	/* Only valid value currently is 0x0 - PPS */
 #define PDO_APDO_TYPE_MASK	0x3
@@ -85,6 +86,23 @@
 	 PDO_PPS_APDO_MIN_VOLT(min_mv) | PDO_PPS_APDO_MAX_VOLT(max_mv) |	\
 	 PDO_PPS_APDO_MAX_CURR(max_ma))
 
+#define PDO_SPR_AVS_APDO_9V_TO_15V_MAX_CURR_SHIFT	10	/* 10mA units */
+#define PDO_SPR_AVS_APDO_15V_TO_20V_MAX_CURR_SHIFT	0	/* 10mA units */
+#define PDO_SPR_AVS_APDO_MAX_CURR_MASK			0x3ff
+
+#define PDO_SPR_AVS_APDO_9V_TO_15V_MAX_CURR(max_cur_9v_to_15v_ma)		\
+	((((max_cur_9v_to_15v_ma) / 10) & PDO_SPR_AVS_APDO_MAX_CURR_MASK) <<	\
+	PDO_SPR_AVS_APDO_9V_TO_15V_MAX_CURR_SHIFT)
+
+#define PDO_SPR_AVS_APDO_15V_TO_20V_MAX_CURR(max_cur_15v_to_20v_ma)		\
+	((((max_cur_15v_to_20v_ma) / 10) & PDO_SPR_AVS_APDO_MAX_CURR_MASK) <<	\
+	PDO_SPR_AVS_APDO_15V_TO_20V_MAX_CURR_SHIFT)
+
+#define PDO_SPR_AVS_SNK_APDO(max_cur_9v_to_15v_ma, max_cur_15v_to_20v_ma)	\
+	(PDO_TYPE(PDO_TYPE_APDO) | PDO_APDO_TYPE(APDO_TYPE_SPR_AVS) |		\
+	PDO_SPR_AVS_APDO_9V_TO_15V_MAX_CURR(max_cur_9v_to_15v_ma) |		\
+	PDO_SPR_AVS_APDO_15V_TO_20V_MAX_CURR(max_cur_15v_to_20v_ma))
+
  /*
   * Based on "Table 6-14 Fixed Supply PDO - Sink" of "USB Power Delivery Specification Revision 3.0,
   * Version 1.2"
-- 
2.53.0.851.ga537e3e6e9-goog


