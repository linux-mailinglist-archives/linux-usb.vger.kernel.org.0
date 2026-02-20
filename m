Return-Path: <linux-usb+bounces-33490-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNaEC+f9l2lN/AIAu9opvQ
	(envelope-from <linux-usb+bounces-33490-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:23:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3C164EFE
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C49BF3030EB2
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 06:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81A6330320;
	Fri, 20 Feb 2026 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaTAP/CV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD75303A07
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 06:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771568591; cv=none; b=WPE0TKXGzwUZtRIT6zgGcTfgIdBgawoRIMrXZNMB9B0AMs/OgxytZmSAWiveVbxV9/ItFY/MfFssKXYppWLgu8OGK8OTix85GaQbFWrEbppt6bG7NoUYwpGmA2HXVfGstghOib0KWwtzNslk3nHHbZaN7MsXI0xMDwmePEqUJKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771568591; c=relaxed/simple;
	bh=mUB+oWFMPId9h1Gwcmlg2XD1GQALPtczn82jDplWb+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6J4rfeGWg05nZ7TR5QItw/39LoohDl8+Cir8UCmsje17OmCxD6vuLUd0Wr5db/cF7BVr4yh4sBKY+4DQkKdA9e/IBtAxDGYz/rbBt58mGHqThQ31VhpPVShmUUi+6S+TeCTxpBmfTIHE5JdtbwPAW2bwgDOAdS6iDgl3bae8nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaTAP/CV; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-896f44dc48dso15384926d6.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 22:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771568589; x=1772173389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCKrSxgbtkE6sBorbcneokbI0mX+kuYA9Blctjh+gpw=;
        b=QaTAP/CVhdNPsKziDVSvEKQk/XeiNHOrtZ/LrvaGUSWVHt/lXHA0gICCxUGtYvAAAh
         277gep20Ewkc3x2bfEDfxAAiXlwfz07EGKPcqVdcwZy1SJ1MXV7/I68OMOFLOUlCgXSC
         wAzTKEoT5teIMioshAWW2wzr5lEsPjUkworNV/kpPuB9NV3HDUKmNeucwXATwLXdJlTt
         wISetCdwKLX92peo+d6qyZYLoB3VTu8+3g8dtlpSVdILMzUy08P+VDI8h3I5GK+5nsiN
         9iqTWTSrg1G7/2wnlB9K6MDj6dS/ZWGn0ci2ac7PhbEYiCgTNzeZ0oD9o9cmhxUTTjV0
         J4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771568589; x=1772173389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LCKrSxgbtkE6sBorbcneokbI0mX+kuYA9Blctjh+gpw=;
        b=QvBeXIMF7cX9uemw8AWSU2bFCCyrnzCVNDxui5VsImgAGRSbs7a8f0Ln6kI97stSNf
         Ju5w3J0rOlo6I0witxiefLJ1B/KszGTC8/2/NhbIl2ZdOFfbKQWU/+7O+XxWqWzhfY24
         p+w79oRN5Wpoc8kf+ENxp2E/Fk5K6tRoJM6Qwm7ZavmKD7nZYgAhXRpZN8CEMSgUAL9r
         nqBNZVGvRDKygf/AfRPK9ZqFfB/rzXoIlNWk5lCDIIxFF685FSG+hU+PDHBNgQlo4QJj
         mTK5oGNtZcOuxP/PpahRjbV1cnKRCSYjoDiPJCrKAK4d+7sgpGMXwrQfMTBR37PiYhl0
         YsCQ==
X-Gm-Message-State: AOJu0YzBWrdb9HFEHUj5gwnrZ1gPfsr1+XGJIsVZDiVgl9KAOL9vCKke
	6HA0De+Gck8oR4LlH/+t9QJkTsA45Gom+KNw3P0vZIGX1lvwOUlLWG9g
X-Gm-Gg: AZuq6aKTwzG8Y85VZUpc/7ErJ8G2RKXf/HUhtPHbhRVit/xHQRUAGUNK5VwNjl15ldo
	4ci+qN1hFSk6ngwF4x2kkxrqRVJ3A7epKscSWNm2JSbGHUcHB6on6kMVLmur03GKTKXAvSacKTO
	wvO00VmK6AJ8iNWgHDZqSVWdCYKbJeBYKAIXFNtlvfiiaboxkVxLoiNwtSxxCeFGXPS/EmnO2fg
	ei52zcmXBL+YMDDFaVZ5pl15BGMXL+UwpVyjfKGgEogoH2oum+Mxtz2t3qCXzgh/fP3pCmgqejy
	XCpQ9RRT8zEa18Oqv7cV+B6WGEpUJD/XwFrnqj8N6V1w8QX1l60/8WrJifrQR2z+OhIKcDiZNhK
	OVkw4Ad0vvqQ5VxiUjInrjlG7hlQZdTZwhyBwA2IQ/1sUgI2vdkOGRHTsAy+nVrY8nAWVjSjFZw
	7WUJH3q+r7Dj2K3HDj11LC0PqzS38=
X-Received: by 2002:a05:6214:2301:b0:896:f767:966d with SMTP id 6a1803df08f44-89961fc1196mr69841406d6.11.1771568589064;
        Thu, 19 Feb 2026 22:23:09 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8a5ccsm234206306d6.25.2026.02.19.22.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 22:23:08 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 20 Feb 2026 06:22:40 +0000
Subject: [PATCH v3 1/2] dt-bindings: usb: document the Etek ET7304 USB
 Type-C Port Controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-et7304-v3-1-ede2d9634957@gmail.com>
References: <20260220-et7304-v3-0-ede2d9634957@gmail.com>
In-Reply-To: <20260220-et7304-v3-0-ede2d9634957@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-33490-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 86B3C164EFE
X-Rspamd-Action: no action

Document the ETEK Micro ET7304 USB Type-C Port Controller with USB-PD.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 3 ++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index ae611f7e57ca..1eb611f35998 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -19,10 +19,11 @@ description: |
 properties:
   compatible:
     enum:
+      - etekmicro,et7304
       - richtek,rt1711h
       - richtek,rt1715
     description:
-      RT1711H support PD20, RT1715 support PD30 except Fast Role Swap.
+      RT1711H support PD20, ET7304 and RT1715 support PD30 except Fast Role Swap.
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..5e504cebbcda 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -541,6 +541,8 @@ patternProperties:
     description: ESTeem Wireless Modems
   "^eswin,.*":
     description: Beijing ESWIN Technology Group Co. Ltd.
+  "^etekmicro,.*":
+    description: Wuxi ETEK Micro-Electronics Co.,Ltd.
   "^ettus,.*":
     description: NI Ettus Research
   "^eukrea,.*":

-- 
2.53.0


