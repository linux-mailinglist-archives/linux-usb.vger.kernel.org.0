Return-Path: <linux-usb+bounces-37223-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIZEODaCAWpObwEAu9opvQ
	(envelope-from <linux-usb+bounces-37223-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC07508F07
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB60F300729E
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 07:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B199F37AA8C;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/Hd8bf1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B093101B2;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=RXk+L5Xd+tRnr+W6wpwUOkua5h5MNsL7iXs7yQ4vq0Nc9NEoPfIDW+qGauE0lf+ndw85joCKTDxB7zGSrBtJOloPmkdPQxS9tZjrbC4LVql65vLZbTwKkpbau+gpQDkyXCDyJieZq8lXhCHkyFtjRjViNCD1GR1XB6mrmppKdq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=GAX3vgHnPau6iCK5ZtrdEwbtFDTfYoPmCaF3R4f2/Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeeW8fFVSdVsCIvt5JaCd7LaFKGvhu+K/tn2zpynbnnNJsDYFOpl9C6FFm224Wv9svVLxxNbnFHf2lFkHtaWPpdBLa7l78S9TCqO8xKClyFGl/pcJJCs6UhV6nIm7WinfqqThxHJXRmrmd2NSrt6O3v4VYJA1u+u8N1Kdvu4sdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/Hd8bf1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0072BC2BCFB;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=GAX3vgHnPau6iCK5ZtrdEwbtFDTfYoPmCaF3R4f2/Tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z/Hd8bf1L7qrYV+z1qWXpDTJ3zG7xBo1+SBRqikL/NmcBDuDIrAXdAux9nECefzc/
	 IPhnwgk2ZfngW4gW7bmuKaCscbwYlr+c9v7yUY77d/5Me6vQXrBsyXr4z3+jwDwvKu
	 pBcea6rl70waZw2AxDmZRofLoe65ZxIFCY2dHOm2gSY+uv18+PXcIJo22B416Ftn3q
	 1xS2c9ve+PANI6AkgKPgEAH4cvmODKH8MKgdeS5fSyoCUxbF5eC7jYwawhghPF+EY5
	 CU3ory64ooe0ZcHGBZlQv6l8jh7CqJj0wywr4PfRxoRZhkiH2G4l+m4pMe9E8deEA+
	 T00iQUg7jaf1g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCW-2ywr;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] USB: serial: garmin_gps: drop unused atomic include
Date: Mon, 11 May 2026 09:14:46 +0200
Message-ID: <20260511071448.611875-7-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511071448.611875-1-johan@kernel.org>
References: <20260511071448.611875-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DEC07508F07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37223-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This driver no longer uses anything from atomic.h so drop the unused
include directive.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/garmin_gps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 9f955962d546..8020149f5658 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -18,7 +18,6 @@
 #include <linux/tty_flip.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
-#include <linux/atomic.h>
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
-- 
2.53.0


