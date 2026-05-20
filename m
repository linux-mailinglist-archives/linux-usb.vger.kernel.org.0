Return-Path: <linux-usb+bounces-37751-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBbNFNhNDWoNvwUAu9opvQ
	(envelope-from <linux-usb+bounces-37751-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 07:59:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F08CF587F74
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 07:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DBED304421C
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 05:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A3A37268B;
	Wed, 20 May 2026 05:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkyu4WRZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29314367B9C
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256776; cv=none; b=e3Lbra6MTeL8/IgmqgZBeuX6m3TTOUpyyWMF27ODdUxP2t8BNIiX0820STN5c2E3K2XzvObP8ooNTjUmkPJ5v3NOZwz8sAzZhYJ6W5ZBH8zh6A2CbaaOGlUnu+zxkS8eTflhyqX8qXx/dPlQKLCxFfy06y+UUAyJmFI+tmErQNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256776; c=relaxed/simple;
	bh=2f5OUImFmuhrF3x72G+LTN7IOvpnkhPV9gMr4mx2qz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IeuhsjieR3YVu5h8z7X9wzVC64RF+3cSMO5EzhDwTCzWhdcDUhhQmgYKAsQZB0rNMMuOpjBf8wPMnRPYgTbX+6iBghV+2JVuozXOr9yX1jdgbq2yTX8XMTPI4VbXrkq9PD9Ldb8CGtMzQ/VwdyjFym9K6mYb+C4RPwkT9FzfCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkyu4WRZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4585a116a4aso3614447f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 22:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779256773; x=1779861573; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gnm8zcvKAshSvXmnApGnkudHEo/9J/+vPZuXibcqvww=;
        b=kkyu4WRZQ2nLjW3vWF5k9Kk6/hKNxy1pPtUBwEjAbSNWTxkhdnzPExnESg0z648AhO
         rGjFlqWgTfmygyQSJ2z9+ehGFyrBm3B9lk66q/tzL3irvaufJ6zBynqLrxKBzBUc0Je/
         fUbLw/JsCDkTioM7bqZ7dxtcNBl04o+4uZZGYDR2F1nb+NMpHKAz26egctEpsrXHsZfA
         LM5/JNGbvJW3dPvHyari0c1waaWKJAFBiBBUOLBcB4Cz6y72Hv+BiCNzx7t0Hpomnazk
         CQjJIKKPxSsbOZzzxo+t+NyCnvsn+hsZ90KkpTUSem0sQB/HTqTzHGoNdKzg58mE12GG
         VTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256773; x=1779861573;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnm8zcvKAshSvXmnApGnkudHEo/9J/+vPZuXibcqvww=;
        b=eco+NCAJX6Ro1R6rjBca+Bh5beQ8FhE6Pno3Ll1abeBdacGlu61W7z8JjSRSnCQxkU
         lXKs4f+zQFq9IEEFNwEKJpgbYhhGnNCYAyvqLwC1etrwF1spEwTNiCi3+cIAIjLsew7C
         v9sAYQTR+Y25HALxPmjWxkfMNIkpQR3yfUO/1h9pGZUMeBvdQru84LNBBUCIwf/V7FQ6
         sYqtX7EWSD/awpwTweBF7/YbWb5kS9tgCXWEB2+rGAzvgtWsX1XlcNknplzcuiRN3N8F
         qB7BRq7Dk5Uef3dsgCgtPEikUH4xVDClRbJEx/5sr1c7KnP83B8MvWNZfzLaM+hQX38q
         5H9A==
X-Forwarded-Encrypted: i=1; AFNElJ/XDI3nb3GrZxKNfFRhMHYI4Bc7NHUKsarlqkPTtBCLImgvz927aWvEv4y6PUhdj/H6mzyhr48ikxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ5hfI3gfT1oN87fOGpELTpf+0xn7y65sLZ0gjwdMHOSv8J+LB
	v/jiC6GD6xJQmTmZvl51vlKRjY10BwSAY3WNh5orA+PUG/taVN32fnlh
X-Gm-Gg: Acq92OE18sFCRvhdiDj0pS/O301jaa6/2iMpwtFTm+vGxWamp2P3qW6JorSiNyP6QaV
	fAEqhuARFj5KbTYZ0WoRSndJLYDVBvdeeaDdInGYGuAGbDHHVTrFpTS2rt+2CbWjkOc4uqKg1YR
	RHbTonkjJk5svQ6UclPqOYmcd5DWN4JEdMbUtcD8Yj1vkpPSInQ9TLd3j23lHcjzA6q/yfJjQW+
	zCAn4BNAriKSieNIOqbvsasmJrkJyTQloBr0Cj0KDjLG4jCxUDbeIp3yMOgXsMo4Hy1wbC/NpC2
	w96fWX5u9pQAxwpvc0AQQoZj55tOVX1hTTelDRu+HbQvY4niZyj92f/ytQf9gHFXL9gco/YTnAU
	MTaSExsq/CK+QNTQXf2v+S6BTMIsrIxi+QTwQ/C8qBrGoUjBXgNoCuRTLOOGXmzDmbPbaz/9LeN
	eVgvLeUlZO1gk6KVsifZR1w3Q=
X-Received: by 2002:adf:fa85:0:b0:45e:739c:f186 with SMTP id ffacd0b85a97d-45e739cf80dmr17301878f8f.20.1779256773468;
        Tue, 19 May 2026 22:59:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm51207565f8f.22.2026.05.19.22.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 22:59:32 -0700 (PDT)
Date: Wed, 20 May 2026 08:59:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: dwc2: Fix use after free in debug code
Message-ID: <ag1NwBpqT4IEQcdJ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37751-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F08CF587F74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We're not allowed to dereference "urb" after calling
usb_hcd_giveback_urb() so save the urb->status ahead of time.

Fixes: 7359d482eb4d ("staging: HCD files for the DWC2 driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/usb/dwc2/hcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 1a763ad4f721..2414291aa908 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4804,6 +4804,7 @@ static int _dwc2_hcd_urb_dequeue(struct usb_hcd *hcd, struct urb *urb,
 	struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
 	int rc;
 	unsigned long flags;
+	int urb_status;
 
 	dev_dbg(hsotg->dev, "DWC OTG HCD URB Dequeue\n");
 	dwc2_dump_urb_info(hcd, urb, "urb_dequeue");
@@ -4828,11 +4829,12 @@ static int _dwc2_hcd_urb_dequeue(struct usb_hcd *hcd, struct urb *urb,
 
 	/* Higher layer software sets URB status */
 	spin_unlock(&hsotg->lock);
+	urb_status = urb->status;
 	usb_hcd_giveback_urb(hcd, urb, status);
 	spin_lock(&hsotg->lock);
 
 	dev_dbg(hsotg->dev, "Called usb_hcd_giveback_urb()\n");
-	dev_dbg(hsotg->dev, "  urb->status = %d\n", urb->status);
+	dev_dbg(hsotg->dev, "  urb->status = %d\n", urb_status);
 out:
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
-- 
2.53.0


