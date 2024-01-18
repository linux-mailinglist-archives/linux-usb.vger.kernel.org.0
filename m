Return-Path: <linux-usb+bounces-5236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 884DC831F2C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 19:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FFA9B24E47
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 18:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A441B2DF8E;
	Thu, 18 Jan 2024 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="EhPHCOc1";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="EhPHCOc1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EA72D7AF
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 18:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705603013; cv=none; b=NWFkhaiE2CpdEWALpqcuEONgx8J4gC7/y4Bp7SxImanHZ1QWq9l3lhRUYozxruFYyL57Q9m46EXNlAqIvcN65hdkM6rTKlJvSTjbzBU9MgkIlIxceS3DebSFtpqSwgsiMIK2cRlpJzrLhyAu/Rgi/7jsQlfM0n5bZFv59J6BVD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705603013; c=relaxed/simple;
	bh=7XaDezftJdfLtoXqjI9tc6tkftW9dm21WXv5xUvuiiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gcxf6QQDG1tU+Gzj3B6uWcbqjqA6jaTLaXR5sSn6fpHBShbkv/2trDH1npbRg1bI/btzxIeKlDPYAVikJanclz+3ZOHeO79qC1BL4T1NsFcFYepVgwgGxvxlJv75UXmmlE42aM6BxJifkkQSgw2eBOdaP+JpJEQC2A8lVjl3ZlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=EhPHCOc1; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=EhPHCOc1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A9DC21FCA;
	Thu, 18 Jan 2024 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1705603008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IJ+HObzaYEIgtcly05F3DuuPPoiovbK5zjXko671Pgc=;
	b=EhPHCOc1jhXql48O2MbrQq5R20aCE/2eCIVUbZCl1G5Ve2Loh6qQPFfkRZkhp9gB7tm1db
	xBrLky0CaT9bz4uM8JVJQXO4alFwujnYFSyQGERcTMOYgP7ibWiGKJlBsJCHYJEaIaZTu5
	+j6H7adXg2qmDiWyLQOPWRbrpX8HozI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1705603008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IJ+HObzaYEIgtcly05F3DuuPPoiovbK5zjXko671Pgc=;
	b=EhPHCOc1jhXql48O2MbrQq5R20aCE/2eCIVUbZCl1G5Ve2Loh6qQPFfkRZkhp9gB7tm1db
	xBrLky0CaT9bz4uM8JVJQXO4alFwujnYFSyQGERcTMOYgP7ibWiGKJlBsJCHYJEaIaZTu5
	+j6H7adXg2qmDiWyLQOPWRbrpX8HozI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E712136F5;
	Thu, 18 Jan 2024 18:36:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YVzXCMBvqWXkaQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 18 Jan 2024 18:36:48 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: uapi: OTG 3.0
Date: Thu, 18 Jan 2024 19:36:33 +0100
Message-ID: <20240118183644.16125-1-oneukum@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Add attribute bits defined in version 3.0

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 include/uapi/linux/usb/ch9.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 8a147abfc680..44d73ba8788d 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -763,6 +763,8 @@ struct usb_otg20_descriptor {
 #define USB_OTG_SRP		(1 << 0)
 #define USB_OTG_HNP		(1 << 1)	/* swap host/device roles */
 #define USB_OTG_ADP		(1 << 2)	/* support ADP */
+/* OTG 3.0 */
+#define USB_OTG_RSP		(1 << 3)	/* support RSP */
 
 #define OTG_STS_SELECTOR	0xF000		/* OTG status selector */
 /*-------------------------------------------------------------------------*/
-- 
2.43.0


