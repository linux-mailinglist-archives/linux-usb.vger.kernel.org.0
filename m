Return-Path: <linux-usb+bounces-34095-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKfOKJaHqWki+gAAu9opvQ
	(envelope-from <linux-usb+bounces-34095-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:39:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7B212A97
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AD893019FCF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 13:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3AF3A4F48;
	Thu,  5 Mar 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5ISThHN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1419A255F2C;
	Thu,  5 Mar 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717961; cv=none; b=RKFic6vx804yTmUaVtsEwPFI2EmK2QTzZ/i4mHad1//d+yd2YEZEXRMWy4CMfh+OyDk5NbcLMlKYwELjekft79QJ/bQCYi0Hh8X9mdQmmW3KecYoB/a30zgWLB+V3Dh36wzEJxmwDfJsMRkpOG5qOO1D66G8tOa+R4dnQS7aX7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717961; c=relaxed/simple;
	bh=oGosNgm8KTcTgOrEfQxJveURIrjZHUjQGfbohfgnOnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeZqFPHWY5yAhW4RtUgD57TGyQHdGkvZPQ9OZ7pzkh+KytGsAy3+64Xd8IxmKDAExZ4dQo16nIY7xPZOnd3/fJUATEJJUb/+TB/9mLZmLHI919n7aaLq25o5JWionlgrGrKJegWG3IfddM9szj6ezamIADxB26emfIewqFVEZ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5ISThHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AADC4AF0B;
	Thu,  5 Mar 2026 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772717960;
	bh=oGosNgm8KTcTgOrEfQxJveURIrjZHUjQGfbohfgnOnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b5ISThHNPiQI77dpf8GP3uDVVCxWydZFh333lIS+7EVCNlb1V2tYG0adNBBpLgJ3J
	 xVy2z2ikBdfeNrDQ52vg6tQO/VZpEIGen2yslCP8fA7uAXeg+bUxYzVHl+V05ZZ+aX
	 CtStDA2Eu7xLjDf0H8GPS3HKw4FtpHIg8EUy31h7QPOgE2pO7FZ+7BiqDsy+JNnDyn
	 XsCF+EurHmcU2PR5xNbLfHWC1DRwVMS+2DgzSbj5YYKiU/nXhgzp/UvKvJedZ3MEcS
	 S8MU9Ih8Fj9ooR4Tn6+27UfLESfD/1gMsaw8RojNpJzLHBA8BluNEcY1XF5usLbTCG
	 FyEpJUMLruvmw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy8v8-000000000mF-212A;
	Thu, 05 Mar 2026 14:39:18 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bastien Nocera <hadess@hadess.net>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] USB: apple-mfi-fastcharge: drop redundant device reference
Date: Thu,  5 Mar 2026 14:38:50 +0100
Message-ID: <20260305133851.2952-2-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305133851.2952-1-johan@kernel.org>
References: <20260305133851.2952-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ECE7B212A97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[hadess.net,gmail.com,kernel.org,zenithal.me,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34095-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB device while it is bound to a
driver and there is no need to take additional references unless the
structure is needed after disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/apple-mfi-fastcharge.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index 339f6cd2e9b2..af266e19f2fd 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -210,7 +210,7 @@ static int mfi_fc_probe(struct usb_device *udev)
 		goto err_free_name;
 	}
 
-	mfi->udev = usb_get_dev(udev);
+	mfi->udev = udev;
 	dev_set_drvdata(&udev->dev, mfi);
 
 	return 0;
@@ -231,7 +231,6 @@ static void mfi_fc_disconnect(struct usb_device *udev)
 		power_supply_unregister(mfi->battery);
 	kfree(mfi->battery_desc.name);
 	dev_set_drvdata(&udev->dev, NULL);
-	usb_put_dev(mfi->udev);
 	kfree(mfi);
 }
 
-- 
2.52.0


