Return-Path: <linux-usb+bounces-35688-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMfvKQudymmg+QUAu9opvQ
	(envelope-from <linux-usb+bounces-35688-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 17:55:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E4635E3C9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 17:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C572306D8B9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7462037474A;
	Mon, 30 Mar 2026 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMlkh4TF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB38374172
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885678; cv=none; b=US3FCT7qO2JcxNJg5SZmcANc2BO88fYomZhsbP01IIw8Yn9P0X52IPwxIuQQB/GltCc225OZnwqwpBALRXnBXEWEv2P0TQl/1EkKAN2ZpBxZB59NebaOt70bJ46fLxjBy3X9ZgA5rm4rNoyy2iqJufLtj2O5opSBMt1Xxv2mqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885678; c=relaxed/simple;
	bh=ZxBhTQD/UNucgERdjuVVc9ygUsuIPz1wuK7H8PK0OX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X8ehCILFbf7x7YoLCs+Rpi7WAma/9lqatss0l0bISo9d/YSBgJ9uAIyAq+94ij8PGNX8f+9Ag/mNPR5TxeVgO5aAzZ2m01QhLLmD0IXZC0Zs+HqytdtL7718F+YIHixR1EZymwmrmkq/QJY5G/NdnqAsJ3L+TjxXXeupgGdDt0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMlkh4TF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso3287524b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774885675; x=1775490475; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXPH/5N3aRj2h7rrCewujB5ozh9GZfzf8wnIwaz+QTQ=;
        b=lMlkh4TFayWLUJU584e3r2Mrc/TUcSpFNz6TmCsq270soHgtBRxGIghRUlEXkTDaIL
         rCnFJ/orbFkPrCBBnYiaM32XTZFTcqX2UalHaSGBzPLKjCxCiznM6IyL/CSsyopf/dE9
         sQG/bTS7db29FXJk7g+1FIp9zthzvkvDFEAM8rgkhJqvw23BIoVQP2AK4k6dnvzLftFs
         Rpi0jXuprbTRhgOVdFdjBN6WGTEfsh0BucJagDAWxm+ImhwRoX7W2lHooBQdoDF5JhN3
         Y+LRlC0RsTuOXt5WCqzReI+WgxnEKIXCyPSBySLl5UxFhYOGpduzw4pcz65Yq1YQKnYy
         wqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774885675; x=1775490475;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXPH/5N3aRj2h7rrCewujB5ozh9GZfzf8wnIwaz+QTQ=;
        b=oDAoEwCoH+stn57BHXCGT6VfuZBHozZhRGWUILyffJA4twxD3qJWroLNxvPtrH8vOq
         Oe/CG+7/JP2+B55fWcxBlJpY+yYTWV68owm0K2DujtmiYtgch8kl/q3UOGxcrR3Cf8BR
         uHEib9OIyCpf3+R+Kng/ZEsU1prxs9xwDsMerPJJUKnU6nu/DqBRkxa77DlcZDZ/0lZi
         186rxd58uhOMMfYliK3qQTh5zywQATWm6U1j2Zy0uV59bfQN/TKzeOyVhlsoTMZC2olO
         shQ/lYztLUHSSVRtjWIQJ643T5H1DZIKygXBHA+AcU9hRDDlX1nu8VwIYFqvrE5gYkHo
         Us9A==
X-Gm-Message-State: AOJu0Yy1Fuajf4dBf5rbgXoZqMMt4Y+bFfxd1ecNeTkZNROTdkpxHIGt
	q6bguhm5e9WiaVLIxRPXzZwkiHv+pCKer4J6udf9/MHMrxJIi5BVNwVAEVO8KA==
X-Gm-Gg: ATEYQzxR3a/3sxVxXx5OdRSleiEJfUpiORvWqPF4k+Dk+pU5NKschxdvcSx49a8qGio
	6/BbJgEvAB1aV0sOiJoatB2COvkEIuKByl141iBxUEK4oc7yKsTn98vsPomt2DiHBzD2GhKtTjp
	8bb4xYkTw+hQrwyc4QYaTCo1sezg6nNz7VE5TpKhTdZ+bPBQr3zwjp6W9G5BM+e6CCufDXiu8BO
	8C4aQDIoes4tNcu2Xg52hp9EYcHK8nvEgEpS7YMQVbRRWnkSobk925OlcDIk++jHNcXbpe5Owq5
	UDuu09ZmQrcRH+ovDTrN4XbC0o0Gsb6gfn7y9Ur6jTyWrF0fYgSLCCL4cONqUyEWYBI5j1sw+gO
	Ev61ydDgWHD8JtBApIgIeTxj3lmPSN9Qh7Fvwp/lKhCIX+dvriUQ1qpqdlOnaqXiqDiP1BANljT
	KhB5dkPmOohQdccZj6BZ79OXkttCfZJr1F4nSZ
X-Received: by 2002:a05:6a00:9087:b0:82a:768c:9a2c with SMTP id d2e1a72fcca58-82c95d24dfdmr13509569b3a.22.1774885675153;
        Mon, 30 Mar 2026 08:47:55 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fcb84sm7244051b3a.49.2026.03.30.08.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:47:54 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 30 Mar 2026 23:47:50 +0800
Subject: [PATCH] usb: misc: usbio: Fix URB memory leak on submit failure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-usbio-v1-1-7141b6dc612a@gmail.com>
X-B4-Tracking: v=1; b=H4sIACWbymkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY2MD3dLipMx83RRzg1RD02RL80TzRCWg2oKi1LTMCrA50bG1tQAb5kG
 UVwAAAA==
X-Change-ID: 20260330-usbio-d70e15c97a7a
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774885672; l=1153;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=ZxBhTQD/UNucgERdjuVVc9ygUsuIPz1wuK7H8PK0OX0=;
 b=Bsfyw4GbxSI+TMOdLHNqqvH/Mx4w6Tn99vGk+D2lyfTYHtlklsAu85nj+aZKRiyRbE4PKDztO
 nt8PHLg1lnoCTeafyEutl0JJW2p/ZMum2v3bKgfga+54ktWEvY9qp48
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35688-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 68E4635E3C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When usb_submit_urb() fails in usbio_probe(), the previously allocated
URB is never freed, causing a memory leak.

Add usb_free_urb() call to properly release the URB on the error path.

Fixes: 121a0f839dbb ("usb: misc: Add Intel USBIO bridge driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/misc/usbio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
index 2e68d48a2cc0..d4eb3c7bafc4 100644
--- a/drivers/usb/misc/usbio.c
+++ b/drivers/usb/misc/usbio.c
@@ -614,8 +614,10 @@ static int usbio_probe(struct usb_interface *intf, const struct usb_device_id *i
 	usb_fill_bulk_urb(usbio->urb, udev, usbio->rx_pipe, usbio->rxbuf,
 			  usbio->rxbuf_len, usbio_bulk_recv, usbio);
 	ret = usb_submit_urb(usbio->urb, GFP_KERNEL);
-	if (ret)
+	if (ret) {
+		usb_free_urb(usbio->urb);
 		return dev_err_probe(dev, ret, "Submitting usb urb\n");
+	}
 
 	mutex_lock(&usbio->ctrl_mutex);
 

---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-usbio-d70e15c97a7a

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


