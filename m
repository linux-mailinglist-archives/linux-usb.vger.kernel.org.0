Return-Path: <linux-usb+bounces-34068-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKZCISdnqWlN6wAAu9opvQ
	(envelope-from <linux-usb+bounces-34068-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:21:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31168210844
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 12:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C633A3058E39
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 11:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E003A388396;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuCYM3Le"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006738642F;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709328; cv=none; b=SzSU93PgA33ivZ6ZZSUprm9/81XOJ0szuBms4y6PyrlNcJvHd21nIgw0DBuZ3fix7IkVj9xwu0i3bMvEOgvy5jAwJ7vCjVI7ISreU4AzaZOcZ6ZbcLCa3XsSum2yMENpVMKLh66KojG0Egfte8Pzr/JMoD6MrJfFgbc/9ZfivRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709328; c=relaxed/simple;
	bh=hGq0+CM200unysQdJAyOZo6M3b9G1AjRQPl31InwpJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCUs5ZxqieVbC+mQRomu17e4SPDIWvPxTSbcPRiU78oG/3vsfKuWiUaLSTTmzqEd+/MSV3+81zo94NlAkA1pq16J/A03/8Xj2YgWzxfxFK7RDEGeX32fDoPpYX41GXYGW6h2fjy5d6hgDg0mgKIPT+YgmgpkAxxO/DNfyVFWbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuCYM3Le; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10510C2BCAF;
	Thu,  5 Mar 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709328;
	bh=hGq0+CM200unysQdJAyOZo6M3b9G1AjRQPl31InwpJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EuCYM3Le5f0YUBWsPJ86WUx8jv/W1aLzD5iFbpHizrClP8/S/zrKC76bJCpRWFC0a
	 DsKr1OH77PEsSuV+dGtOJUiS3hqAGlQAJ7bQMLTZqyYOZ8GyMfWFVp74x/nEVS0j4K
	 SFErcwR5ru557L6T7r8cBUaoX70RdLstc/BRyZBvTYqT1DFYb377EqHV4uHJQoyJj5
	 WkCFOFsH34TNlYIOfRzlOGsmmB2Vd90HZDSZvch3Wa+lvAbVxcfVckSUOmzM3u5UYm
	 TnGCDkS3ICugOEY6hJtWTrjF8HdltnRMkFH5kNpKikmHqquf2epKRQfm/X3Oufz4w0
	 seAw90+TTAy8w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy6ft-000000004nd-3lOW;
	Thu, 05 Mar 2026 12:15:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/5] USB: cypress_cy7c63: drop redundant device reference
Date: Thu,  5 Mar 2026 12:15:07 +0100
Message-ID: <20260305111511.18386-2-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305111511.18386-1-johan@kernel.org>
References: <20260305111511.18386-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 31168210844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34068-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/cypress_cy7c63.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
index 99185fc3e9df..4a7f955ba85b 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -215,7 +215,7 @@ static int cypress_probe(struct usb_interface *interface,
 	if (!dev)
 		goto error_mem;
 
-	dev->udev = usb_get_dev(interface_to_usbdev(interface));
+	dev->udev = interface_to_usbdev(interface);
 
 	/* save our data pointer in this interface device */
 	usb_set_intfdata(interface, dev);
@@ -239,8 +239,6 @@ static void cypress_disconnect(struct usb_interface *interface)
 	 * device files have been removed */
 	usb_set_intfdata(interface, NULL);
 
-	usb_put_dev(dev->udev);
-
 	dev_info(&interface->dev,
 		 "Cypress CY7C63xxx device now disconnected\n");
 
-- 
2.52.0


