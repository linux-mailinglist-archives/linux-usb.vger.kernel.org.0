Return-Path: <linux-usb+bounces-32606-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEzHG8Y8cWnKfQAAu9opvQ
	(envelope-from <linux-usb+bounces-32606-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 21:53:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3095DA4C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 21:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 96FBBB47FE7
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 20:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A22410D17;
	Wed, 21 Jan 2026 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVVJbuxn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CEF40F8C6
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 20:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769028012; cv=none; b=pINbeWfeXASbP2axLG5daVYEDN0gOIp9/5B86voZFShYKmecLMrMITu3o9xoF215p95npMvhEtLD04urWDFyTY1D0Pan/xYDNklPyeYtXJr9vwrB3cKjvTBJTEL/u1t9vahrKr3ppcwt3V95+WvAtCprCtslnPVmu164rfy0coI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769028012; c=relaxed/simple;
	bh=V2zWVys+PtkXckOdQvGark86ZIH7sM9/WDKxGNnhPJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rEx9RxZTy4YLuRHRbPkmTpsEHjKsdiqAiV74FtlqxQiXv7DvQWB5WLAcq7IqKgaC6eVvoGb6r3R1WmVRlsevbc1ev+JTd3wEX/7z0ma2/iGeceGCz6YI7JXPE5TFhmd8pVaJw8Yph5JgmWJALbqDOdY2AprLzyVY56bcRpT+wYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVVJbuxn; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f39438187so203328b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 12:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769028008; x=1769632808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JrCFsj8n1PTzjRt8oNof1XPee5TPhQFTql5gKP4FrlQ=;
        b=EVVJbuxn2AoHWKDHkC8jH94dVr2SP59YuRt5Sh1TVeIjqiBijCcEbyWIe4O8pxV/E2
         xzBKszMJDhFKtaHd5u+JqVLORELxUWCmrHUoMxHKjp0yii3rYH437VdRfyg5tnH4Afmx
         +4NDRGOW5vD4MmGETLUHYk6iUeLe+PPAhdmdOHYvI//6IWmzxiSQAknsIemUIs3Gw5cx
         5478eUUaiHHpuzVihuY0YidjYd366TNKy8dHE6r214cam2uOUQtCHKPblo/SQQ4oJqEk
         GyeZ0K9e2uSHi/sSORCt9l6CBbGDrNpyyQNq8/GL72N5Yxjt0lqriBWuQJ+oCH9TCrQ6
         5oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769028008; x=1769632808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrCFsj8n1PTzjRt8oNof1XPee5TPhQFTql5gKP4FrlQ=;
        b=JJ/cWKiJW8NC+RiMnfpIK2BS7qH/Texn3y/i8X7NJezg9Xin7AMMQV6PyU7DcIlRHs
         3ev2Tu4djS0o6zfX3cJWSMbJkEJIPbfEI2HGNWlgarJczoA/xJB1zQDX1mlCOH9xucxD
         niXS8U17ZUTeJD+U/40cWcEmSqZyKJur8ZBeEw6rS+W5FyOQXNJOinktICtk6ql28doz
         9poT8m76KDN9+UST1snVPoB+ALcnu8N0GHfgBTmx1Jk4pqhJkD1bcBcAIqJXazetA/ep
         gyQQJT/zFb3FffsGxjdoD1Qn4JQUnv/Guu738TOJAohP9XpWi8c7WF2Duge4TTclE566
         k6MA==
X-Forwarded-Encrypted: i=1; AJvYcCW2fu/DIgYH8iRIELHD4S3+aEpjmSLD4GCwum7QYXPd8uORsZIPNfM6270fqsfGN0/mEXuOpSm7YIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZy9Bytn+Y8Okv1gjE5LeckIukZWDTfm2u779/78EBtZApqOTm
	RwycYe38FSss9H+rtZffZKUpPlasKVmdgHWZjebqrMrq3WDeCgQA4dk=
X-Gm-Gg: AZuq6aKIrA0UYNqiT7tBvhDCBNat52NESM2kM8/QgkJd0wcDLc5sgTCSnLx/XF0hM0V
	isufeLRxNP6U9WQH0Tmm2O5x/MoZXOw83/dhY+pR/e2fAq+2Yx6txh8kKZsQGusZbPHno8g3Au2
	gDu5HA3UwtuB450EDFchOpq3odwgq4ugSDS2nZRFnRZX3DAs+oZTtScvw4LEKw0WpAWz08vqbd7
	WsGV9yom81MBAONjMz1k7ITZFZuprqZEX2iVckLcMA3FsutG7z1YRDxo3oywOkPNEx09vhwvSRj
	wc0NiI4H2rJ6aBEr2scjoaaCdSaPqOQxB+x3wDx8dkUSoz9YKWuruBd4r1Xf0uoKosTneAL4QXM
	4otlS02/Wz+M9fv1+T537qCY6XOi21jMKe9ZN53EYSPLvoooNEWIcLpSODWX+G9YeEIPBEYcdtM
	e3nycrG1S+4URZ2to=
X-Received: by 2002:a05:6a00:27a3:b0:821:81ef:5de8 with SMTP id d2e1a72fcca58-82181ef6aa9mr1177615b3a.12.1769028008057;
        Wed, 21 Jan 2026 12:40:08 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([38.76.140.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12787e6sm15734799b3a.37.2026.01.21.12.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 12:40:07 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: gregkh@linuxfoundation.org
Cc: balbi@kernel.org,
	jaswinder.singh@linaro.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] USB: gadget: validate endpoint index for max3420 udc
Date: Thu, 22 Jan 2026 04:39:45 +0800
Message-ID: <20260121203944.1898-2-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-32606-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FROM_NEQ_ENVFROM(0.00)[qikeyu2017@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1D3095DA4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The max3420_getstatus() and max3420_set_clear_feature() functions use
the endpoint index from USB setup packet's wIndex field to access the
endpoint array. The index is masked with USB_ENDPOINT_NUMBER_MASK (0x0f),
which allows values 0-15, but the endpoint array (udc->ep) only has
MAX3420_MAX_EPS (4) elements.

A malicious USB host can send a specially crafted control request with
an invalid endpoint index (>= 4) to trigger an out-of-bounds array access,
potentially leading to information disclosure or kernel memory corruption.

Add validation to ensure the endpoint index is within bounds before
accessing the endpoint array.

Fixes: 48ba02b2e2b1a ("usb: gadget: add udc driver for max3420")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/usb/gadget/udc/max3420_udc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 7349ea774adf..9d183a986380 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -548,6 +548,9 @@ static void max3420_getstatus(struct max3420_udc *udc)
 			goto stall;
 		break;
 	case USB_RECIP_ENDPOINT:
+		if ((udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK)
+				>= MAX3420_MAX_EPS)
+			goto stall;
 		ep = &udc->ep[udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK];
 		if (udc->setup.wIndex & USB_DIR_IN) {
 			if (!ep->ep_usb.caps.dir_in)
@@ -596,6 +599,8 @@ static void max3420_set_clear_feature(struct max3420_udc *udc)
 			break;
 
 		id = udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK;
+		if (id >= MAX3420_MAX_EPS)
+			break;
 		ep = &udc->ep[id];
 
 		spin_lock_irqsave(&ep->lock, flags);
-- 
2.34.1


