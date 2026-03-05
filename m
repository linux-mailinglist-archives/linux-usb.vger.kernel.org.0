Return-Path: <linux-usb+bounces-34094-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CVHNJGHqWki+gAAu9opvQ
	(envelope-from <linux-usb+bounces-34094-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:39:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB2212A7F
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A625C3046105
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 13:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2443A4F42;
	Thu,  5 Mar 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcvuZgKV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140B520C477;
	Thu,  5 Mar 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717961; cv=none; b=WPfF4RXU/hFWx2bl41HogYj7K2RtoL+w8yjehouep3Z0shFB9oZI/Z8fUeEJaikMQ5tI0o31LZg6xLgCrsLv5g46TPPeXsIBCLpCVi+0opaZOnYUJMpTD7UjFkOx3fMAtSLCCI4/Cp89njvbV01/LJiD2O8tHOqF5zI0cjeKOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717961; c=relaxed/simple;
	bh=7g8E85s4/CkrS5O9m2Y1ieZNTM2Olns/iy2gpI/RzyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLsQ7NPC7RWjVE7ZgxLThLdsTO8WXim3tKF7NGBfi7qwdTbqRB4tzoKRRz83rUHDKyN8sNKXsHF8Q77ko9bUWoXlZYoqaZ9dkq7ZxFVFEM2/t+h41HbDLhAnR9Jnhg79Y58UDjDOh1mw6TJCZoAOCya2nMx6AbNKacdEdNm9Dw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcvuZgKV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50B9C19423;
	Thu,  5 Mar 2026 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772717960;
	bh=7g8E85s4/CkrS5O9m2Y1ieZNTM2Olns/iy2gpI/RzyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PcvuZgKVqn05EBq6vAJfLjrdClF8ftLBIWGmaNTirD0MzNzJfPD7wmgl7JkyPVHYC
	 D0dehHB+8iR8FUPNtRVmgPoKYr90G+f1sY7TFr0N7VMDvmy8EQEZ1x3WEPLtdy9zUQ
	 1WADv981R3XTCMsW1nDunJpF9tfmQYesGSQLafAHOyBiRLvj4yuxonxW4n1rLDBjGK
	 g6wk499a6JVZDJ9xX4xremubNUzOZNJxvAWYf4QvfEgntu4eBtOKQKkCYbm+vMi3Qt
	 H/fTzidoo5GIP/yR/QH5UMkm52TmH9aOSvkMjeTANmUnH03j9+51u1w2Ziohl6Yvq+
	 eGDt2TKrObHUQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy8v8-000000000mH-23RC;
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
Subject: [PATCH 2/2] USB: usbip: drop redundant device reference
Date: Thu,  5 Mar 2026 14:38:51 +0100
Message-ID: <20260305133851.2952-3-johan@kernel.org>
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
X-Rspamd-Queue-Id: 76AB2212A7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[hadess.net,gmail.com,kernel.org,zenithal.me,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34094-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB device while it is bound to a
driver and there is no need to take additional references unless the
structure is needed after disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/usbip/stub_dev.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index 34990b7e2d18..abfa11d6bde7 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -267,7 +267,7 @@ static struct stub_device *stub_device_alloc(struct usb_device *udev)
 	if (!sdev)
 		return NULL;
 
-	sdev->udev = usb_get_dev(udev);
+	sdev->udev = udev;
 
 	/*
 	 * devid is defined with devnum when this driver is first allocated.
@@ -409,7 +409,6 @@ static int stub_probe(struct usb_device *udev)
 	put_busid_priv(busid_priv);
 
 sdev_free:
-	usb_put_dev(udev);
 	stub_device_free(sdev);
 
 	return rc;
@@ -488,8 +487,6 @@ static void stub_disconnect(struct usb_device *udev)
 	/* shutdown the current connection */
 	shutdown_busid(busid_priv);
 
-	usb_put_dev(sdev->udev);
-
 	/* we already have busid_priv, just lock busid_lock */
 	spin_lock(&busid_priv->busid_lock);
 	/* free sdev */
-- 
2.52.0


