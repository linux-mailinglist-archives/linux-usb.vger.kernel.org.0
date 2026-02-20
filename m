Return-Path: <linux-usb+bounces-33491-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCsqIgD+l2lN/AIAu9opvQ
	(envelope-from <linux-usb+bounces-33491-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:24:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E10CA164F16
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C473041A40
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 06:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE0A331217;
	Fri, 20 Feb 2026 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5TbpPQ4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D78F230BD9
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 06:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771568592; cv=none; b=EHcFeX8wC7qbj/CALBJygFKrPozCciwoHf7ivmfcPU4pREZrXB55f+Z1cZvX7vbi9dkETJI+6hiFdOqyMHU7Xm0PxBi5w59lXYmpOZ+Ul3qedOdOumeYsa3Wmds70mtShMe+rCFZJywjSKEGobl/ktVQ4RslVwAXIIjGJ2V/jD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771568592; c=relaxed/simple;
	bh=jGxXk46pFgaVzkygsdpMgVwvNmqmhVGMHUcNacup3+I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t/1ZpErwaMnBxbfQxWFD/PePR+F/f/8pRGVof+B07kM8iu8p4URWdIppxHDVFqEV7fccDQrSMFzArCtQPGwnUmDlZui0oiZVdrhZuOK5oc/vCxKvHA4hCT5rdDjb1wJgfzN+WQBVC4VVxbCuPSedzwbNVK4P3nA8C3r1IqKrxv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5TbpPQ4; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506362ac5f7so15579721cf.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 22:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771568588; x=1772173388; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CKdWjeKFseRtZP/qjhvaNFaOrIyblPhEnu6V6lWcBIU=;
        b=i5TbpPQ4vG8WnlN3EDnOM/H8pTbYl/5OgT1M/wc5Tvd3ltixJFuKX0uw3BNSJoFOL0
         P9hv0hhs7LG3rb+eHBDFq+Uqf23LsjAW70Zrx0mcJH1AtswN3gzf+fmlvvhb/bqdMZJu
         VD67mRbId4+aN8CPt2v6cHLA0XZouFn95UL5IrPZEMZ6s4/9WujaISXWbq/zv/uo5/u2
         A+zst7VhZmfIApRCi9VkB3aGeQzx3iJ/d+3YZzPNTzmjOJm084nNiV2CP/Mba4KiPmVL
         7FVLAqQoQagfzFqcPGALVHmUl2S7qC8aRDuN6UXo8l/H1Q63zvC5ZOpeOmpkUuTbM/Ab
         XDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771568588; x=1772173388;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKdWjeKFseRtZP/qjhvaNFaOrIyblPhEnu6V6lWcBIU=;
        b=fe/q64xxhQkZ3pKpyvZsNpe/Ew5augOe1jB+MLf7gjDgLkSCe4u3D+tNj/xFqvrPug
         2TnU0wz9DDg20qTaNJLOHo+4zgXnJof2nNYdAifmPtnCJRkkR0v3mZeRZfOcmyjkWJd4
         Yhr+tiOxSPrDVrVbuQjMaTlmXekY/Ia+bIyxZgybGG+RnwU3o0Db/Pifuw4wg9vdWm0r
         P6uOWU9eU5kFkaXS3WqLvSodUY6eVKOb0yvnnyRUTeauacPO184Rsm3d75x8ocurfro8
         7YAJF3tJdTLeKznLa6irtOrsM89ArRQCk/Ch8NFvbbjQz6iXHHNt6jjF55tWxaEbzmCa
         OYkw==
X-Gm-Message-State: AOJu0YxSh+sFFy4Hn4oVCoMvwXJe5UddIe0jzbH8eSYoI+Y9wzX+YCDA
	ZfrsLkTkD4kgna3cSwILxgP6tPuNpXo4N4K+/NowCS0fjLPI1gcBT+jJ
X-Gm-Gg: AZuq6aL2UNb/xw06+8GD8Cm+HKtvmO9euNvLZmERjAqwA3TrZcIY5QlcOnqmwYhidy2
	VlNCnkWnRSMstAYAOvga2+KRA3k6GECLcpnQ2yHUIUhtPRYsux08WRjBwblIJn+KahaTLVwyUT+
	Vx4qUPy1pvikCNyHnt5z1aumwLVNv1SGrxyz8C1N7G2ABwEfCPjd+IQJLLMDf8ShtdHP/AyFMPF
	bvLuqReWSWS37VYImAVNgLnv5lySAEA/Itz4F4lCwnfxUKNAYiD16MTW5oz5UZn5KQ5Q0Db7ncj
	iRsrphadBTO+Rxxs5yJ1kTIaQuo/ZmjRU7wv1XCivbmE7WLBY+MKiU1g1xCmamOUDQyAXYiDUM2
	gNdiH8g6OKhw6u7gpSx1cmwpcs3sQYEZaPwSh0mO4UNzUb82eip7aELUAtG+RtxGUWpdfabu/Nk
	VN7kFmMERuHMgEsrGTmb2KQRRjXKc=
X-Received: by 2002:a05:622a:255:b0:4ff:270f:9a48 with SMTP id d75a77b69052e-506b3f7dc66mr290587891cf.4.1771568588191;
        Thu, 19 Feb 2026 22:23:08 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8a5ccsm234206306d6.25.2026.02.19.22.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 22:23:07 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v3 0/2] Add support for Etek ET7304 Controller
Date: Fri, 20 Feb 2026 06:22:39 +0000
Message-Id: <20260220-et7304-v3-0-ede2d9634957@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/9l2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMD3dQSc2MDE90UA/NUE4u0VCMjS1MloOKCotS0zAqwQdGxtbUAGmr
 Sr1gAAAA=
X-Change-ID: 20260220-et7304-d07e48fe2295
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33491-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexcaoys@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_WP_URI(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E10CA164F16
X-Rspamd-Action: no action

The Etek Micro ET7304 is a USB Type-C Port Controller with USB-PD used on
the Radxa Cubie A7Z.
According to the ET7304 datasheet [1] and the vendor BSP source code
provided by Radxa [2], this controller is functionally identical as
Richtek RT1715, with the only difference being the VID.

Add support for the ET7304 by registering its chip info in the driver.
Tested on Radxa Cubie A7Z.

[1] https://www.etekmicro.com/wp-content/uploads/datasheets/ET7304_datasheet.pdf
[2] https://github.com/radxa/allwinner-bsp/commit/156b6578cc173855b41ea311a229403ccbadb17c

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v3:
- Reorder the table alphabetically
- Use etekmicro as the vender prefix
- Link to v2: https://lore.kernel.org/r/20260219-et7304-v2-0-b2e268494ae8@gmail.com/

Changes in v2:
- Put dt-bindings Documentation changes in a separate patch
- Add Etek to the vendor prefixes
- Link to v1: https://lore.kernel.org/r/20260217190010.67-1-alex.caoys@gmail.com/

---
Yuanshen Cao (2):
      dt-bindings: usb: document the Etek ET7304 USB Type-C Port Controller
      usb: typec: tcpm: Add vid and chip info for Etek ET7304

 .../devicetree/bindings/usb/richtek,rt1711h.yaml         |  3 ++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml   |  2 ++
 drivers/usb/typec/tcpm/tcpci_rt1711h.c                   | 16 +++++++++++++++-
 3 files changed, 19 insertions(+), 2 deletions(-)
---
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260220-et7304-d07e48fe2295

Best regards,
-- 
Yuanshen Cao <alex.caoys@gmail.com>


