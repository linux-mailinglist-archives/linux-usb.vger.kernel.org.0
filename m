Return-Path: <linux-usb+bounces-33969-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL8dNUQOqGk8ngAAu9opvQ
	(envelope-from <linux-usb+bounces-33969-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 11:49:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF91FE8A8
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 11:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F1AF302D5E0
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 10:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36A739FCC7;
	Wed,  4 Mar 2026 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+qWUZFZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06757342535
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621375; cv=none; b=UUzVlPuFlW+6L1AzlcLKXCLUUnozCvbuR+B9hyn4t4LSvKXCz196iWRNx1NgfkqQEE/l1HhnTsUfQ36zDogHmhdYQIAmPh6+tw7/eU8UTvueOhHlRWBX9M83t4n6qrKAjHWKrLKih4CkFDos2bBxAUKGlL7dUCNYXkdaGdrW5bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621375; c=relaxed/simple;
	bh=NU3qvXDKYUPJXtwId6AS1Tx0hH2rtjn+R6KGYEHw4Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GjaTZhk3IBsJ+4jpGnXMWBrjdKgwU293eCifMBHh2FbAqPX+McEEf8+EQpEkAmrghh+ysJJUiGFEpaAuLVzGuUAHgMMz9DpoYJOp7AQoB1axhT2vz3TSEnGm1K8bZIVRhEYc5z0OD2tyd3AvLjpAk28ys4mNGXSFTfepFXjzhP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+qWUZFZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b935ff845c8so862197266b.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 02:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772621372; x=1773226172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yFpGGr3aSXkcuzGnGO0O/+SjGkAJm7NJIwzs6YJwGWU=;
        b=c+qWUZFZXVLVnj25k8kKfhJdFxoO1B2s52ifusXG7d8bTtfEdARhRBJS3GyvE4VZ0E
         IvyqA9Xu7iAf/XZeJb/pIeVTwK4iSs40JiRGHsHBA70jpPFRY1k/QOM3hPL03Hl6ztkv
         h5c1BGJzbshkUjN9obDDmvTXl0P1l3hwVpqfAaua8xljX30vrjDKCjFbJapRXnNSRAIt
         /zb2Vzx+CEvNLYshk/LEiWUWn2o4rWIg6p9EX9TMV7WgikHPpZ213nMhbIX0vnH1krPN
         M5qKblEobyANXqDuA6SOnREhfBqX4m+93FnB6eZDgfQiav/nrVW8kQyYg7w/hyEWHIDJ
         0XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621372; x=1773226172;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFpGGr3aSXkcuzGnGO0O/+SjGkAJm7NJIwzs6YJwGWU=;
        b=ekVkpWRsQY4GP1/sJn2wabcYq1/rLo87eho060lqomk8fTPfS6KQlwMs+x6Pr8DyUI
         IvAT2fUIshFpcVmi7QIMSUpcqDflrS1QRas/kPGYD9g8uF8ymjZYB19IlGDjW/GTaxYR
         cFbB2bdq3v/mVyf7VUwFBIQZMOIwkIiHk1Fy0u2YxmeCHtqPr/pYyebkjUklJaAHDPLs
         jGJ240KHUi2JmW6jjCaXJ+5qVDDUmK/aOYl8RBz5pBi40N9sfO0C6zIuRzXkGkuVVvZi
         mZbACVFEfFVTW5WfadXKGOuSQ7YleSeznqK72oI/vONp/aovNAlxT7RTVZX0GUtxCXCl
         GaJw==
X-Forwarded-Encrypted: i=1; AJvYcCXGfixSoLUbyfNFH5LpvelYBmfYZ7WFi3rLcKPyrzNu1eT/VYVt1IBym7qTXYQrMnzb2oooZoyThU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0nMkkP+qbDVRQCY9rb5dYZ5gRyBAa/6skgWLEeWkN8KoOn53
	K85J1IOrCwKTJJCYqfuTF2OfxJF7nF1o1hereRVdLWiSWKtm1aCoFILv
X-Gm-Gg: ATEYQzwTALMnRzV5rDNNR+Az3SIx4YP1fQkW+SHpVc5WrFLS0AcJFX9rGcxbg7VD/HU
	BkOVkTM0qFg8swuePvxQeSzRpk11UXB+tNRa8MI9ECPTFbliF72Ux8oTL+WOK2xkmugR8Y/PaYf
	yzPZx3jpoUoXJac2USG/8ij7BGvC9k9H27BC7Dj8E3a/1BH+f83l35ymsK4JPk690M06gAmTTPV
	jLD72TxzgXuQf8OonLaDSQKDG6w/Ogl1WE8B97sI5ogm9RzR5cECzbuNxJX/yS/WicOpiU6P8cA
	4zI+VjnHi9mcZabVeScyhaVwp53cw/mDo3RhjqFAmKGcb89Lhf4Y5d25VYYb/nuH9AlGDFPZhbJ
	7m27r3gpm5kTKxdNxrTO5qZi3RlIjOjasntwx0RmErdCs95RVvfNaCLmAcZ2Y2lGKFroB2kDPMV
	sdMSSdP86qBkYKHy8tn7KwWQwn7jJKiSpw
X-Received: by 2002:a17:907:9302:b0:b88:7431:3942 with SMTP id a640c23a62f3a-b93f138790bmr79373166b.33.1772621372079;
        Wed, 04 Mar 2026 02:49:32 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6560asm741831666b.43.2026.03.04.02.49.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Mar 2026 02:49:31 -0800 (PST)
Date: Wed, 4 Mar 2026 11:49:28 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Xu Rao <raoxu@uniontech.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Fix debugfs bandwidth reporting
Message-ID: <20260304114928.110be4c4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 50FF91FE8A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33969-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Replace kernel USB speed numbers with xHCI protocol IDs expected by HW.
They are numerically equal up to high speed, but instead of SuperSpeed
we were querying SuperSpeed+.

Gen1 hardware rejects such commands with TRB Error, which resulted in
zero available bandwidth being shown.

While at that, report command failure as IO error, not zero bandwidth.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-debugfs.c | 6 +++---
 drivers/usb/host/xhci.c         | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index c2080ee4df50..d45fa29a9691 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -709,7 +709,7 @@ static int xhci_ss_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_SUPER, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_SS), s);
 	return ret;
 }
 
@@ -718,7 +718,7 @@ static int xhci_hs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_HIGH, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_HS), s);
 	return ret;
 }
 
@@ -727,7 +727,7 @@ static int xhci_fs_bw_show(struct seq_file *s, void *unused)
 	int ret;
 	struct xhci_hcd		*xhci = (struct xhci_hcd *)s->private;
 
-	ret = xhci_port_bw_show(xhci, USB_SPEED_FULL, s);
+	ret = xhci_port_bw_show(xhci, DEV_PORT_SPEED(XDEV_FS), s);
 	return ret;
 }
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6b312966c103..2f23b796ca12 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3277,6 +3277,8 @@ int xhci_get_port_bandwidth(struct xhci_hcd *xhci, struct xhci_container_ctx *ct
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
 	wait_for_completion(cmd->completion);
+	if (cmd->status != COMP_SUCCESS)
+		ret = -EIO;
 err_out:
 	kfree(cmd->completion);
 	kfree(cmd);
-- 
2.48.1

