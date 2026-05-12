Return-Path: <linux-usb+bounces-37291-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGxxCDiHAmrVtwEAu9opvQ
	(envelope-from <linux-usb+bounces-37291-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 03:49:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDFF51870C
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 03:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 288EF302A1AF
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 01:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A299D7083C;
	Tue, 12 May 2026 01:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhXfLr+u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363D2E413
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 01:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550232; cv=none; b=k8HDRn4GZmoqJVoAyIq83OXqEgYVijEF0uTETSdowE30J5YVRfpba2o0sdNc4JqOrO0okDuC9tkvgFM4CqMmxk19VkjCJaiWMNt4aNvZozv1GkMpBRberCUidWdlLAn5M6OAPQQrtnjevadVOOdgxutOVVZiFr6VGpYs6I31KSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550232; c=relaxed/simple;
	bh=QpqCFytlXuR0d8C9ucsJ7tz8T+DtLuvL8tttel4gvf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8ZhJ/F+Q2u2JBI9pbHcL5OqFQY6RIJhIQ5mMe0vhYNXz6a+nV8RYdcVvlL5lHbOf8bODN558naWGTq8LQADP7L8TqRRrmxFEhst6AbjsWk/srdLW8gqdOVaUXS3E1pTEH0cTrYfhNTtcblNRmljKTzHYU5zdhNQpig657Jydxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhXfLr+u; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b4000e51fdso50379376d6.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 18:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550230; x=1779155030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYpbANSKVGqlN+ZVCrKmCGjaI+L8XQ7CXzh383M1XaI=;
        b=PhXfLr+uyJIdFsQwba6mRTa0U4z38gu45rjDB4X6IypEqlxwT+6YhzsZuj5xrR7E3r
         fj2N0VQD1m5WwtiUjV1BTI7k79uVzy9LfdnL6wfwuYf/Zh5ymppqGuRFRhNPygdPORu1
         poepuI6tz2VktIBi3CYCKCo/6lhhRaAJpLTYpPKq65T/tmp7iAIEwOQFPadipsDf2mCh
         dvVbItaIJuq2nTTrF5s+EMWxwqBhok2JDLUOdoDMxJmqKhW8AIjWn3q+Nrvm7etAPJqp
         dabiYqYo8zp9lK6PaeM6ss5cY/vDFfQJWVyhlc0Tt0G2d5wXy1ZyP0G17fDmyfpU2Cv7
         Pneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550230; x=1779155030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYpbANSKVGqlN+ZVCrKmCGjaI+L8XQ7CXzh383M1XaI=;
        b=SkVSgSred5+Kiex6eBqQEy8OfdUkGvMy3jk4YTHlE48KtDYp2mAwhFibm7hG4Dv5WP
         6lMNdwt8wc0bbFMZOFHWCdhqiEDxBIam2R0CBOp1+F0ACkprYzKcBBBIfDbbeW3Q+5Tk
         kMT1N6nEL/6DS93sKLU8pDU+n9OrDq811FYJwBAjeteAqheB9TZMO9Dwz1EFoaPmrSxg
         98NUyvF4U4PNoS6ZEMp2ZuQORW+1MnFDC+oEal0+1ePZzWfSc5vmobzEc/t2AeGMunTo
         QzKdPTMGIsar22yqkoVUvePwGPgX5z3HY5LErJM7PJIL6NxyxGXwhD3Hzhucu6duOljE
         TGHg==
X-Gm-Message-State: AOJu0YzMA1y7vZvsxSpudohOEMptFBEB7uXUC5HIzbN/HNc0YUEvhVZi
	ILKZK4F1sFoDWu9hVk7N2Bd5xd9FavrrU3WjoM3YB9mhJiJQqCdxqzowVpeJTu8+wy0=
X-Gm-Gg: Acq92OEPGpmlSB5wbc1OE0WWfw8NOh7HsXw06a6h65bLrf8LaUIMSB0rWoQOe+sj1Ii
	J8KD+MlZZgfCaFBGFXtTLCkK7vUej9Vg9Pc65xt1+UX1YS72wTk6b3hI6Sbny4drl0zC0uZ2/xN
	RW1Y4mh8wsVkhI2hvabNogbY4/5Wi7MDEhA/koLD7DnlqzSkIhsMf4O4u/Kai2Vsaf4nDNxqLiS
	LpnvxoT2nUxp7wunilyrUwSTXLkCSJTFeMDhYcu+dHbZ4z2Cd1ytaYuWkkN7z6KWb1BIS+jMTBg
	go0+WE9n1Xer4egv3Gz8nNy83tFmuQ7dbyrpkgm1w+bA1pvF69Mv+n7BtDCGBfYIbrvJnUhmLka
	q7dX31wxSSgx6hpye3JxtPs1ner/rOw2HQMWfiKP9kBDQAPgHzf0oIJq75tot3zavJ7LRf10equ
	Yv60jIwmCLPecsE6WeBA27NxG8X/zePToNA7wD5gFxbzf4pgwbf8ZxgOC0pZp8nJC6Sj5QsVSXG
	y656Bw9vGoBlus=
X-Received: by 2002:a05:622a:4c0d:b0:50f:b7f6:d626 with SMTP id d75a77b69052e-514a0b700femr186281521cf.47.1778550229877;
        Mon, 11 May 2026 18:43:49 -0700 (PDT)
Received: from jeremy.kali (srv1619992.hstgr.cloud. [2a02:4780:75:55a3::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a43665fsm109591116d6.20.2026.05.11.18.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:43:49 -0700 (PDT)
From: Jeremy Erazo <mendozayt13@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: composite: fix integer underflow in WebUSB GET_URL handling
Date: Tue, 12 May 2026 01:43:43 +0000
Message-ID: <20260512014343.3770664-1-mendozayt13@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4DDFF51870C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37291-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mendozayt13@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The WebUSB GET_URL handler in composite_setup() narrows
landing_page_length to fit the host-supplied wLength using

	landing_page_length = w_length
		- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;

If wLength is smaller than WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH the
unsigned subtraction wraps, and the subsequent

	memcpy(url_descriptor->URL,
	       cdev->landing_page + landing_page_offset,
	       landing_page_length - landing_page_offset);

ends up copying close to UINT_MAX bytes from cdev->landing_page into
cdev->req->buf.  KASAN reports a slab-out-of-bounds in composite_setup
on the kmalloc-2k gadget_info allocation, and FORTIFY_SOURCE traps the
memcpy as a 4294967293-byte field-spanning write into
url_descriptor->URL (size 252).

A USB host can reach this from a single SETUP packet against any
gadget that has webusb/use=1 and a landingPage configured.

Handle the small-wLength case before the math: when the host requested
fewer bytes than the URL descriptor header, only the header is
meaningful and no URL bytes need to be copied.  Setting
landing_page_length to landing_page_offset makes the existing memcpy a
no-op and leaves the descriptor returned to the host unchanged for all
larger wLength values.

Reported-by: Jeremy Erazo <mendozayt13@gmail.com>
Signed-off-by: Jeremy Erazo <mendozayt13@gmail.com>
---
 drivers/usb/gadget/composite.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index a902184bd..dc3664374 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2172,7 +2172,10 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				sizeof(url_descriptor->URL)
 				- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset);
 
-			if (w_length < WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_length)
+			if (w_length < WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH)
+				landing_page_length = landing_page_offset;
+			else if (w_length <
+				 WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_length)
 				landing_page_length = w_length
 				- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;
 
-- 
2.53.0


