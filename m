Return-Path: <linux-usb+bounces-35448-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNimOk+/w2kRtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35448-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:56:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D70F3235F3
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F26730D81A3
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293AA3C4553;
	Wed, 25 Mar 2026 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYZ8pmQQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE313C3BFE
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435731; cv=none; b=drN9eYLlsXB9jQ89IYcKaUotUPS3Hi1jvuzeEurqNo8SR0mTvNLyHuVpqkNcuG/nJL9JtYzfya1ip4VsyrQrShTUcirpA7/lOCsfnq+YMjzgpPO5GSAvOGe5iuQ/e1MSZaf3HTBQroBMOJEMwxpZf87xby4e6ylIX73M0nz4wUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435731; c=relaxed/simple;
	bh=4mm6W64Ng6bIOnpbuqsq0Dz9vts5bzPSyKlCli52rxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b6KV6pp09taWEAqnwbacWg10SZVNmYIFp9zHAMqHXi/1y/ARIe3JWYnGWJrv2XIgLeDTe9jYCmylWqk1p0nUFnue3WaN3a6y40Mzw2rQaASP+eeW0aqjSvzHelmevbHgudA3nN9ldBPtwJS9aVoYLNbqZLdRJyiOQFdv5V0/hxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYZ8pmQQ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cfd44fa075so299948385a.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 03:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774435729; x=1775040529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX3iHsCsSfEusmydEYJs4Wt68LpXS70cbXuxfu+xvJQ=;
        b=mYZ8pmQQxHfdDsegHcK93NUoUYXu3c8WXrRsxr8CYdhoYbNFoVl/mlbKEZM9CTTsMf
         +vYvnfkII0O2BhXF8foU4llYD0yb9ok+KjHLZ+aCDC5XYEIyMeSwKo60B27/zOU1F7Pd
         ADOEVZ/5sklqPvNTfGigYOHkHVzCYEU/GEzkBcFdqNP9I+Bnqt9kmrvIbg3lJGOKG5CX
         FNzu1ioThX8CG9fdgD7MRfzZex0XMdErPu2qKcVX1teufgdP0uOE1x28UtQget4iWaU8
         NtGN3FmNRBnm8cuTrWwNagPLlqU3dAWZxKE03HGCA4tYCNwT0dAizSEBdWKLsMBp/OPt
         edxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774435729; x=1775040529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cX3iHsCsSfEusmydEYJs4Wt68LpXS70cbXuxfu+xvJQ=;
        b=iTCMAQhqXL75/T4S56dCtJadtmC3CpLRHnkmWAd+amCoFYt8hwMMFuR7FKk6ibsCTQ
         EGRgeNJFToHtA8CD1MRrEsLux8xsRuQAUPqoStN4iQKaTFNatuU3w0HgGIXOU3XM62zK
         nHS8Z0U4exq6exlop/zVDwL85EPVB6FvGr0WSxaNFV8Rp5VrXIhwym/bio86CkVa1BDU
         8fsFJ0HF1S0E11GhygiUAhTJIs35eagzCpRmplE83aHeRXp0r3guuCHsVlQ8eLh8orUz
         yY++Te3qaQlIXyQxdND6Ge01kuJX8KXmQOY8/YZkwDJz4UCQh0ntiJF/KA+phtBwsI09
         NNnQ==
X-Gm-Message-State: AOJu0Yy4aCYAqM3wF7okOKTKwUWwBXbRGjQdevL408asGM/bM6rgSodD
	C6sCEb7wK2Ymgvs7YTzIj/GM+1NlO9k6lCj/Nrb+edjLAPpl6VIhgqvAVLrUvlRJqsiFWQ==
X-Gm-Gg: ATEYQzygIDJr4kBN2uxiCk8XbWA4ndQeL666WV6vgZp3Z6eWgrKYu9lDl22h78oWLmt
	uNpLoC+ieMLvtWKONciiKW8IKt/JO2FfYKE5B0mMp0PnL2ArV6Xu5UM6EoKqyToq1GrWAppDHVi
	T+cUdbLJLEDFQCcwStAjztvNJR714Zfi219esvzWu3X7wSmfZ7HkbGlysOQu8injQYcrUhQgxyt
	djtcTxAHzKR+tbpqMul+voTZ14Akmo9Ds6x0U/dQYelp08FXzuToxvTHU6kLK3Qq8RAD0q4gDrU
	v2rc8kv2aiJXkjHJVQy5kiGpPq46KtdJbnbu8BILLzEgrY5hWKCYFl4kJy/hHA9gOiGVByw4UMR
	pwqIRtOBlYj3qWvYXESrpua2SLp44NEWqBy/wFSnX4Gk9OQhJrkH10vOcbgzFAwrJwbwqY81ZSC
	a8iztI7F97yCcPN9+szbirbyb6PhnnOFrDaYQkgGRI+kdlngQOhSgQUh4jy4fCRpe+R43tiuFMc
	GS+TIOu
X-Received: by 2002:a0c:ea50:0:b0:89c:5b78:6d4b with SMTP id 6a1803df08f44-89cc4b0aae0mr32922786d6.58.1774435729070;
        Wed, 25 Mar 2026 03:48:49 -0700 (PDT)
Received: from AddContent.localdomain (static-23-234-101-108.cust.tzulo.com. [23.234.101.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cc8c1673asm11745456d6.38.2026.03.25.03.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 03:48:48 -0700 (PDT)
From: Kelvin Mbogo <addcontent08@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org,
	Kelvin Mbogo <addcontent08@gmail.com>
Subject: [PATCH v2 2/3] usb: usbip: validate iso frame actual_length in usbip_recv_iso()
Date: Wed, 25 Mar 2026 13:48:40 +0300
Message-Id: <20260325104841.8282-2-addcontent08@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325104841.8282-1-addcontent08@gmail.com>
References: <20260325104841.8282-1-addcontent08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35448-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[addcontent08@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D70F3235F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

usbip_recv_iso() sums each frame's actual_length into an int
accumulator without checking the individual values first:

    total_length += urb->iso_frame_desc[i].actual_length;

A malicious server can send actual_length = 0xFFFFFFFC for one frame
and a small value for the other, making the signed sum wrap around to
match urb->actual_length.  The sanity check passes, and usbip_pad_iso()
later computes a negative actualoffset, feeding it to memmove() as a
source pointer - reads before the allocation, leaked to userspace via
USBDEVFS_REAPURB.

Reject any frame whose actual_length exceeds transfer_buffer_length
(one frame can't carry more data than the whole buffer), and widen the
accumulator to u32 so that many moderately-large frames can't wrap it
either.

Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
---
Changes in v2:
  - Drop Reported-by (author is signer)

 drivers/usb/usbip/usbip_common.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 8b6eb74..fd620e9 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -665,7 +665,7 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	int size;
 	int i;
 	int ret;
-	int total_length = 0;
+	u32 total_length = 0;
 
 	if (!usb_pipeisoc(urb->pipe))
 		return 0;
@@ -706,14 +706,23 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
 	for (i = 0; i < np; i++) {
 		usbip_iso_packet_correct_endian(&iso[i], 0);
 		usbip_pack_iso(&iso[i], &urb->iso_frame_desc[i], 0);
+		if (urb->iso_frame_desc[i].actual_length >
+				(unsigned int)urb->transfer_buffer_length) {
+			dev_err(&urb->dev->dev,
+				"recv iso: frame actual_length %u exceeds buffer %d\n",
+				urb->iso_frame_desc[i].actual_length,
+				urb->transfer_buffer_length);
+			kfree(buff);
+			return -EPROTO;
+		}
 		total_length += urb->iso_frame_desc[i].actual_length;
 	}
 
 	kfree(buff);
 
-	if (total_length != urb->actual_length) {
+	if (total_length != (u32)urb->actual_length) {
 		dev_err(&urb->dev->dev,
-			"total length of iso packets %d not equal to actual length of buffer %d\n",
+			"total length of iso packets %u not equal to actual length of buffer %d\n",
 			total_length, urb->actual_length);
 
 		if (ud->side == USBIP_STUB || ud->side == USBIP_VUDC)
-- 
2.34.1


