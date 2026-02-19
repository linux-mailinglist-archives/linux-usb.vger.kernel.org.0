Return-Path: <linux-usb+bounces-33472-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP14BJZ9lmkggQIAu9opvQ
	(envelope-from <linux-usb+bounces-33472-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 04:03:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7B215BD06
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 04:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF95B304751A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D842727FB25;
	Thu, 19 Feb 2026 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INGNFJyo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B553233149
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 03:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771470198; cv=none; b=mLLWxeCfrjWwYWQs6j4+VkuDQ6hGtac+AWk7/D97jZMUrPRRF5Ba3TMKC+WMa/uge3CJ/ZS4pyGEoSklf8IuJAakpTzr96EjBMEfScsTE46A61dp6gr97w3TTkGZs22uC0Lo9Ay+wj9IQBBVA6eEI1slYjxXSZnSv2wo1GNwuBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771470198; c=relaxed/simple;
	bh=8RRSBYilIfiL5lynfWm3DT44GAdjVX633zCzSbPTLWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2jKYSSpOeMuHsQnjQfg9mDed7OjFv/BrbWiCDjh6K42+W1fCHqBiVZ0a6Yoc9KRXvRtm3tR5M5jXFh2QtepVAZPUeInQG+xK/HBOB8F3oeUNw8XvIG2yP5fqiWI0Q8S++F4qU/5NIgGz0rb0V1u15k7XZJFr80R0PuPCNGJjLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INGNFJyo; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-897002b7576so5813816d6.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 19:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771470196; x=1772074996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kO0bZz8fXFUnx33OsYDyerQbNWGaSPZMI3QHli9Iwk=;
        b=INGNFJyoY0AEDeSvGdoULlZzKXxiGdmJ1SoF7/5uLk/lKYmzt3oSEUb+EyBIZxM3Ip
         qMx9INSMrW80/BEHxIoie0cwbUJFr8nRVkNacr7CC7BKAh2otu8RS9+k1mDUFinUMPO1
         wZS9u14nSWca1whCOrRDZcWNKvfdaoPJRxRagg5uhdCu9a9KObByhTJTzccQAywV2KYa
         8N5CWvZxerRm/xy+eCd6NhLYlS+0AQdIceg9dHkfHmrSHEdW6Ub5iQw5B1Cj16W5u6pt
         aFEs9cbrQwTNbKhx6R3R4zjJ0ubkNuy/i2Ot00MVokt6VkujqB1H2QdIEQ7btCW3HAI8
         d5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771470196; x=1772074996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9kO0bZz8fXFUnx33OsYDyerQbNWGaSPZMI3QHli9Iwk=;
        b=LndOnqZmrW4vsOeDUVrEDtRjOIH0pgBrV+Mbyr0r3DdKQiB8HxTahDxh7p7D3j/U5E
         B4Ef+bgRawvIWEiNLjKhkPZNdJ9zXaoC1TQY7btfIH+9pMqMf9SOSnmZgYLmL6tE3744
         /VBp8qESpQ5UNdbuDXguoFXcVWkWLgzr/p8KUIjmNrO2bge3GYeroK40jcbXQ0MQDPqR
         8KPFZWrzo8BS4A0iZlZM4QNlxppedXXOXJqzs0iwODOGndrHcwKWtg2Yek87jtb95B+a
         SSUZw8s5XDb7VB62i1+x6fdxKgVcaiAk+cT9Kxwhjd8GWLNm7WHDE1snh2shBtJGkK32
         l8JQ==
X-Gm-Message-State: AOJu0YwuZ2TCEVWwL+Q05ljvd7PdRiZUQrTMoOQrzfnSv9M/ADQnTtWt
	y5ZlS6H1bL49i+iht2TNS9MPXsCpfPLe/dEJ29akgonKzSb6AQeNcGyJZp6dphdDCH4=
X-Gm-Gg: AZuq6aIujqRRFOqCDOsAVD0zOps1g0cvmj3gPkHXFbIYKySub9ZVIEnAcUk+VUpcvYk
	ZEsnh1GLJb7AIlASi1oT+0OSOGhjt7u38tFpZhNT+qqtZNqAx1CL+fGpYKRKPI4vVetekCmmPKA
	qQ53kDsvvrFoMBSrtLBmuMnQnfZtLL+zRkRuNdA0cxqIBDEpnf5aHCqSUl6TSzrHAVll1/8xaFS
	zvJ5Kz+9JfVwwVuR0L7F/VDHIqU/1EJLEYEzp0402/98PzRejM7F+Chr6itv56qxFjXezz7dNU3
	Pw9yYJBnMNzOgfKhwKGzQpWrdN+hAifhvYuONA2OokHRvRoHTqFo7pH12b1qKacY0Yglnbp+MD+
	fqQMYBdDAsieWghZu5jyLdVq/36SmahSMZ7SId6jpEPi+NZKfK+KIc72WSonatiYyVzfEomrqhx
	UYw9WezwAfDg0kv1L1wKflyqh3Ssg=
X-Received: by 2002:a05:6214:212e:b0:895:4d85:5edc with SMTP id 6a1803df08f44-8995812859cmr56143536d6.70.1771470196026;
        Wed, 18 Feb 2026 19:03:16 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cddc526sm205359896d6.53.2026.02.18.19.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 19:03:15 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Thu, 19 Feb 2026 03:02:51 +0000
Subject: [PATCH v2 1/2] dt-bindings: usb: document the Etek ET7304 USB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-et7304-v2-1-b2e268494ae8@gmail.com>
References: <20260219-et7304-v2-0-b2e268494ae8@gmail.com>
In-Reply-To: <20260219-et7304-v2-0-b2e268494ae8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33472-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexcaoys@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF7B215BD06
X-Rspamd-Action: no action

Type-C Port Controller

Document the ETEK ET7304 USB Type-C Port Controller with USB-PD.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 3 ++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index ae611f7e57ca..ed0802112eb9 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -21,8 +21,9 @@ properties:
     enum:
       - richtek,rt1711h
       - richtek,rt1715
+      - etek,et7304
     description:
-      RT1711H support PD20, RT1715 support PD30 except Fast Role Swap.
+      RT1711H support PD20, RT1715 and ET7304 support PD30 except Fast Role Swap.
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..80a5362f1c08 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -541,6 +541,8 @@ patternProperties:
     description: ESTeem Wireless Modems
   "^eswin,.*":
     description: Beijing ESWIN Technology Group Co. Ltd.
+  "^etek,.*":
+    description: Wuxi ETEK Micro-Electronics Co.,Ltd.
   "^ettus,.*":
     description: NI Ettus Research
   "^eukrea,.*":

-- 
2.53.0


