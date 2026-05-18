Return-Path: <linux-usb+bounces-37646-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGkuFH+YC2rXJgUAu9opvQ
	(envelope-from <linux-usb+bounces-37646-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:53:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE480574D07
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 510C43043527
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE32E3043C9;
	Mon, 18 May 2026 22:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+Im+Qnt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2873090E2
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 22:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144553; cv=none; b=K/PhS1dZCa6SaNZGlnySoGkHkojwHz9jpBz0n1qPD1gognpOyQQSl/B4pojRFqelwmIV6oZ/t5r6tIsrarw7FWzStyahjtxxNKU2s/+OMwsrLR7cmkHf2r8Vt63vxAL3XIfmZe7xezTxOme1crcwldawQOoyyCYynlxpZyOqqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144553; c=relaxed/simple;
	bh=mMlrQ6bBizH57MI7nK3fM4UonsfmfD+vEi22s2zV0e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvhZR2TYIWCn+GJG2EU8+/T/hjULjDvJnCH6XL8NqnnxQLJazpGS7GhZ9e1+IulLcfqWM85qDGBy/ewM9K2lkxBNxy0QONHGbQfRrcA4j4GOI08mtMS7YICTJXg9PKssHYhDYDiufcSI1vx6EBHBZypZ9BAw3FRYF20/eJ78bJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+Im+Qnt; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50d7c12e48eso32229911cf.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 15:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779144551; x=1779749351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2EjJjfxLoRLJmQYcLNUgbMCLVnhmrc0i6pQ7FGOvJY=;
        b=n+Im+QntvjLb1Lc9xM4XUee6BR57eFly5WM+0lvPN11p1csMfABFZaVx7mRTWLClT5
         eRDKTy/0F/w5j3QiG84MCN710N/xxtEMlJPEgSzh0L9QhcAeAQos5KvvBCLgOw+dr+cl
         HLK25ACXIy0OnhVecunss6TCFaYO1YltcBtKnUiijtm946zOT8d79vh/rdVjGlv7TPA6
         S0hDmZcsLGx1hcDjoKKxHDrbUqvPP2aDNUI4wd5MxXLcq8VTT7PIZyKLdBGGNkjF8lte
         CZSDU5yFjC6hJHHvoVdQgMdvV+kzwlsp6QYq3Cycp5qLg7e29j/t7dm8+ZZkHXsZLoVq
         vjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144551; x=1779749351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2EjJjfxLoRLJmQYcLNUgbMCLVnhmrc0i6pQ7FGOvJY=;
        b=Cd8G6GsHz3HLGImJd7PkHZi4lrdniTYtlUMHmcbiLWvtQP07bU4nG37li+Jxl86ae1
         qxqIz5drTmBJav9QABCM+LrH4HOa3icDJeV6Cgd8YbnxBEe8ehGgN6u+dNR241c0tEK3
         IfhGsKFMjy2tU1ep26TH+4F5eviJAlh++cAv4ll0hDlibfp61QPgpGfpFDOkobBLfSc9
         w7qSGVDRoRD87fDp3QR8CKyAF5P6sUbRxWRn0CV6rCsxgV4x8NZwQrn6CqozDMw3DtqS
         Saup1DaOZNBcI1rMoDc3yh6qnQwpjYrzPZvxUoCUN4czVmDkN8kZKOxJs3YE5EegeHhu
         pJOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ph1SEheEd6fBDE7LqNSiKRYWVw5g3EAws80qm+6+3xVO6BSr6sJXTlA52aU8dXcua/F8KBWN2Ar8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUA+Fay2c1Di1vahN0Na4kbXJGsCzoCH4D7rKmfp1uLmKEzut
	7z91X6Pb6H+i9sf2sGS995MHIhG41QqjuB9iPS+f/d8G3S1h5BzFGyuP
X-Gm-Gg: Acq92OGW1NSDbAE/emQlI816GuxUMJ9PpSE899OwLQ2bMfLNwQgxhDDok+diLEHspY+
	EsIZv95fhZulpd5+6bCp9x/qV/AnzIM6xOCfmNXhL6jpzGxeWQzI5ZU/mxWDg+JU5d4hibQ2z+1
	Ua77Wx0jl85Pe6B+nZYxFyemc8O+8J8HmKUf16E4vhz0EXWOyLLNkx7pY5ifShf7r3mLO1YIFj5
	uWu2P7T2Pt+YIEIhsS8pM98DDISqDRUuGABtwZyScMkbzqsoRd1Fy/A73QC0XMh/DLlSarkU5Gn
	muJA+uME37JEFFsQ34qCHT8ldBFz/p48g+3jEoBcSERk+JX3IJf3Kb+rhTBSxeiuwjvw9CyoHJk
	S/EtIUHX2bK2hZZVu6YUPhDTdRE2j3HaJMNwM2KBjbIS+/5BfbI/mE0xFFCkmR86zl7POGew9/V
	W1oZqIqUvS7GeZGTStpEqpxYm5ywY9sQVQS6LY3/KwRPeurixAqKaFny7gT0QWSw==
X-Received: by 2002:a05:622a:4c8:b0:50f:b61c:ec4c with SMTP id d75a77b69052e-516596ed735mr217243941cf.7.1779144551199;
        Mon, 18 May 2026 15:49:11 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.167])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645687d30sm154720631cf.4.2026.05.18.15.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:49:09 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
Date: Mon, 18 May 2026 18:49:00 -0400
Message-ID: <20260518224901.1887013-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517190308.1876316-1-eeodqql09@gmail.com>
References: <20260517190308.1876316-1-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,dartmouth.edu,rowland.harvard.edu,kernel.org,linaro.org,egauge.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37646-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AE480574D07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Seungjin Bae <eeodqql09@gmail.com>

The `max3421_hub_control()` function handles USB hub class requests
to the virtual root hub. In the `default` branches of both the
`ClearPortFeature` and `SetPortFeature` switch statements, it modifies
`max3421_hcd->port_status` by left shifting 1 by the request's `value`
parameter. However, it does not validate whether this shift will exceed
the width of `port_status`.

So if a malicious userspace task with access to the root hub via
/dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
greater than or equal to 32, the left shift operation invokes
shift-out-of-bounds undefined behavior. This results in arbitrary
bit corruption of `port_status`, including the normally-immutable
change bits, which can bypass internal state checks and confuse the
hub status.

Fix this by rejecting requests whose `value` exceeds the shift width
before performing the shift.

This issue was found using a KLEE-based symbolic execution tool for
kernel drivers that I'm currently developing.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Restored a paragraph in the commit message that was truncated.
 v2 -> v3: No functional changes; reorganized as part of a 2-patch series.
 v3 -> v4: Document the tool used to find this issue.

 drivers/usb/host/max3421-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 0e17c988d36a..3d6b351dcb1a 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1694,6 +1694,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 						!pdata->vbus_active_level);
 			fallthrough;
 		default:
+			if (value >= 32)
+				goto error;
 			max3421_hcd->port_status &= ~(1 << value);
 		}
 		break;
@@ -1747,6 +1749,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 			max3421_reset_port(hcd);
 			fallthrough;
 		default:
+			if (value >= 32)
+				goto error;
 			if ((max3421_hcd->port_status & USB_PORT_STAT_POWER)
 			    != 0)
 				max3421_hcd->port_status |= (1 << value);
-- 
2.43.0


