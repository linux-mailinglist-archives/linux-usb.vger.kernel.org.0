Return-Path: <linux-usb+bounces-32835-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 707mNAD5eGlGuQEAu9opvQ
	(envelope-from <linux-usb+bounces-32835-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 18:42:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC4F9895C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 18:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77952300C98C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 17:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A6131E0F0;
	Tue, 27 Jan 2026 17:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwEHWNY7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCFF2E11D2
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535740; cv=none; b=hATCW47eSxRcMPsj2Wg13uX3HN0+SHHzZOyaQz5AE3kIJhsFMfwysJmz9Da+9JEhEndSTcBsO3JicJ+jxdmhzJ9VCPr5LOWMYPbIKWasIHbVITpB2gVaYWWa01fXioupL9HDNMnIqtBuTTudPZuxcJvAnYvhliWP9aUamjDwGJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535740; c=relaxed/simple;
	bh=UQR5Q0TT0vE/il1SHh9UiNaX4lkSPM/Wsx64afUvF8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UMKfuPXh1tJ+asGCpUNXysttDhbLDv1oLs8NeuyfcSywKVpXylX67oNWhxbspDrSuxwX9k1o9MnGiV++9G504/i+fdolIpZ2Tz0oSrxc3F2z6DqUOFvfONtLISo1BV9a8oN4ghUo8r83RBU4jCEFcK45xO7Kvp3EOUdVylm7ZWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwEHWNY7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-352e2c59264so4043999a91.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 09:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535738; x=1770140538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9H29XGRCWjq19aHAWGrvC5AjKxI+lrUGaklAUNmCS4=;
        b=IwEHWNY7XOUBvDIu3PqLmr1fsqJ0J1QPquq1LLmddlSZrjlHAoQHqCxO9NQ0l65Rfy
         5ddF5it51xV0L3x+eZ0v7hOPN9W1U+3GXcMTSCTnQzWjrtFLHbuoXNJTk3SgwJXm0to1
         OYEicUEblkIOmeKsN6SvMNQTPs/d9d/fz+lo6T70SZNtZQEdWfWi7MKro6UAXhwJ629C
         uww917vyJOmEcKYkmsj+HPo4zxaHSe+810jsaAwaB9F6pCLxmb3laxjxD955TdP4SE2T
         20jSq/ej7zsjx5Gh2un30ECPNm5rbyGHmdzBOxQiK4/MAL+gDVBuIQl4me/dBRA7qKeC
         Ujyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535738; x=1770140538;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9H29XGRCWjq19aHAWGrvC5AjKxI+lrUGaklAUNmCS4=;
        b=HIjDKzUwrBZkfOE8hULcxqNdaMIrQPCmUTDfmmqO4cpSV8wtYjTf/AnkWqEuucEX4t
         dUkklywKcq58bfAIRbwroLngEHf3DOGJ70mji3GAtwBtWDteNOHROfvDrLYibtEfDmPq
         +xPKFUoH2fBsUNQbwilq8j2CHybgRgf4S7zWBcD9SsCW6+zbrGy640avCFJhWlSHwdrA
         Q8yzAyI2kr5h3MYg5gJXNSgRG721t59RhCdSIewHGMiy23gB5Q5tV4ZcOs5bO7qGtjvQ
         EAKF/emWgclyysoagvbrWEVy7jJyejbhh9uRWR3y5eKVuDOki9IAHmyaAEeTwsnakO36
         ZXJA==
X-Gm-Message-State: AOJu0YxkS9VEuN3oAczx3Ga8nvgNW5MseqgATZJ0zYy3eV63w/GhmbIl
	YNBlch/7KFBv8Qzg704+ly8C9adRypAyjOa6xyGIjuvnc4vY/ybw6BJD
X-Gm-Gg: AZuq6aJm5W75xwjNFoSjnM0AyUOxA+wbqM4nhr4pZb8E8u1z57Ni7mTlM+ubBolk3ml
	sbMRm4wcPmQhNj6r575sS05foTW79Z+nCex1Z20z96vNScl5A3V5jVOagqHxB9rHPhaPKMaBrMI
	+ymCej1rEr1uXeih8g/AItpnVr4C/36+YQEMLdkMP6oB3FwiAeza6wdDt/yLtm/ULZGXX3/WtUm
	YJQTwgOVCn75lqOwy3AibehtZ6T6T2Frd1ggSeE4s8pQ5qaI8GF4UJl28C4pn/344hZko/gpDzY
	pTdTidSvrzYh5CbiKtOSkaMM40P1U4c0VtCLDeC9c7CWjOfvKQjdETTZMjROBmQrHhQsIVrA3z4
	My+GRXyPvwSyY213U3TbklVKovQ9cWwYEWkAQsurdi+cl5+ECpit6dvv+dpXX97TC4t8vihfoHC
	3mmtr1vFjetBYWsjyW+N+FiFLaaRSkDDR2xA==
X-Received: by 2002:a17:90b:1805:b0:34a:b8e0:dd59 with SMTP id 98e67ed59e1d1-353fed0a019mr2364861a91.15.1769535738230;
        Tue, 27 Jan 2026 09:42:18 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.251.203])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3540f2cae91sm89251a91.4.2026.01.27.09.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:42:17 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: usb: Convert TI OMAP MUSB OTG
 controller and DWC3 USB Glue to DT schema
Date: Tue, 27 Jan 2026 17:42:12 +0000
Message-Id: <20260127-ti-usb-v2-0-9dd6a65b43df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPT4eGkC/zXMyw7CIBCF4VdpZi0GxoDiyvcwXbQwbSexl0Alm
 oZ3Fxtd/icn3waRAlOEa7VBoMSR56kEHipwQzP1JNiXBpRopJJWrCyesRXWd+bkzkRKI5TzEqj
 j1w7d69IDx3UO791N6rv+CDR/IikhBV60dgottcbf+rHhx9HNI9Q55w9wlBwVnAAAAA==
X-Change-ID: 20260109-ti-usb-9df63c7ee152
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32835-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BC4F9895C
X-Rspamd-Action: no action

This series converts the old text-based DeviceTree bindings for TI OMAP
MUSB OTG controller and TI DWC3 USB glue to modern JSON-schema (YAML) format.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v2:
- ti,omap4-musb: Fix a missing ">" in the maintainer entry.
- ti,omap4-musb: Drop obsolete "pattern" and "ti,hwmods" properties.
- ti,omap4-musb: Update "interrupt-names" and "power" properties for clarity.
- ti,dwc3: Drop obsolete "pattern" and "ti,hwmods" properties.
- ti,omap4-musb, ti,dwc3: Revise commit message to justify changes in YAML bindings.
- Link to v1: https://lore.kernel.org/r/20260126-ti-usb-v1-0-2855c129eb6d@gmail.com

---
Charan Pedumuru (2):
      dt-bindings: usb: ti,omap4-musb: convert to DT schema
      dt-bindings: usb: ti,dwc3: convert to DT schema

 Documentation/devicetree/bindings/usb/omap-usb.txt |  80 --------------
 Documentation/devicetree/bindings/usb/ti,dwc3.yaml | 100 +++++++++++++++++
 .../devicetree/bindings/usb/ti,omap4-musb.yaml     | 120 +++++++++++++++++++++
 3 files changed, 220 insertions(+), 80 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260109-ti-usb-9df63c7ee152

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


