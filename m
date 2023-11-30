Return-Path: <linux-usb+bounces-3496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3E7FEE11
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 12:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 090E4281F7F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C523C6B5;
	Thu, 30 Nov 2023 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="O6rjmQaL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB86710E0
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 03:40:12 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 963CE21AE0;
	Thu, 30 Nov 2023 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701344411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tlGOxdxyr2p8euFaiEymIrQqYmD8UD7RQhK/AwYwpX8=;
	b=O6rjmQaLp1M6mLOXglYibfzYxRI8gfGsxW4itxEhxNpa0iqI27ZPpnJAKqAq50lzR7TWzz
	7QwODn1XBqHNYRLLGoDOSLElo4Cvm/aqqfeK9BMsiiQbKgi4zALRNHa8HfFyC43TDHKSUq
	z813tlDGq9JYe6paOo/9L7lns3egC/Q=
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5130313A5C;
	Thu, 30 Nov 2023 11:40:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id BhM9EZt0aGX9RQAAn2gu4w
	(envelope-from <oneukum@suse.com>); Thu, 30 Nov 2023 11:40:11 +0000
From: Oliver Neukum <oneukum@suse.com>
To: stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC] USB: check for transmissible packet sizes when matching endpoints
Date: Thu, 30 Nov 2023 12:39:45 +0100
Message-ID: <20231130114006.31760-1-oneukum@suse.com>
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
X-Spam-Score: 3.90
X-Spamd-Result: default: False [3.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[11.12%]

Looking for a bulk endpoint to transfer data over
we need something that can transmit data.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 2a938cf47ccd..d163bd279021 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -80,6 +80,9 @@ static bool match_endpoint(struct usb_endpoint_descriptor *epd,
 {
 	switch (usb_endpoint_type(epd)) {
 	case USB_ENDPOINT_XFER_BULK:
+		if (!usb_endpoint_maxp(epd))
+			return false;
+
 		if (usb_endpoint_dir_in(epd)) {
 			if (bulk_in && !*bulk_in) {
 				*bulk_in = epd;
-- 
2.43.0


