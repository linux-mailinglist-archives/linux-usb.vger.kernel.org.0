Return-Path: <linux-usb+bounces-9260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF378A1507
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 771291F22C8F
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 12:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0DD143C76;
	Thu, 11 Apr 2024 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="lBcOitct";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="lBcOitct"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD9A145330
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839650; cv=none; b=hO1MLeoi6Z2rG75nJRjtFACqP/fm1EFovJuw/jQ+5NeG7CVmbN5GpvHyrG0R6o3iPtxaq7kfgrhfwb15vhIrsVQz3pvSk2aBTTjhsSBiXJ4sqR87MDjRryYOypwPZs/PhfPkinlA1AQL8dh+6a0NDNaNc+IaLVfjaO58mELCrsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839650; c=relaxed/simple;
	bh=ZLCL43J0c8HZaksF1ocYem1Jf9es7cHB7sLbyixYwcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8j7fz4U5moyIfjzdvg9slJ41PBlJ6lvM5Q/JhT2UHK4KEheL1NgjwT3O0I6n0GCYgl2OTHsXPjByxDZoo8QkWUIH/5OiqEweXmX6037CyXkPV2FtbfO+PTvHqBeNXJ7WqzoOasPY8cEx+PW1XDKYCv+PPy6kMtwtqfrE79OZo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=lBcOitct; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=lBcOitct; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9F9505C6D8;
	Thu, 11 Apr 2024 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2u656ARdXcneYuWL64AJCze56MdnOecQZQ+Cy/ZCYr0=;
	b=lBcOitctNnqbmvKpg/vgXuoz8/PbGEQWGu2k/yCvsVEME71V7OpgT10nX3qBPBchz6jpOx
	7ePGqConCMrFvpCLvbY6+3kMYcj5BIrt4AqRPPgsaprVRmWzEzgogce4VLGOiT4u0oH9vT
	CQ28Hvgk+8i6xNHxSKaoQagyPBvuAfQ=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2u656ARdXcneYuWL64AJCze56MdnOecQZQ+Cy/ZCYr0=;
	b=lBcOitctNnqbmvKpg/vgXuoz8/PbGEQWGu2k/yCvsVEME71V7OpgT10nX3qBPBchz6jpOx
	7ePGqConCMrFvpCLvbY6+3kMYcj5BIrt4AqRPPgsaprVRmWzEzgogce4VLGOiT4u0oH9vT
	CQ28Hvgk+8i6xNHxSKaoQagyPBvuAfQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CD9D13A20;
	Thu, 11 Apr 2024 12:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2COjEN7bF2brIQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 11 Apr 2024 12:47:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 5/6] usb: usb_parse_endpoint must not count duplicated endpoints
Date: Thu, 11 Apr 2024 14:43:03 +0200
Message-ID: <20240411124722.17343-6-oneukum@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411124722.17343-1-oneukum@suse.com>
References: <20240411124722.17343-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[13.30%];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.20
X-Spam-Flag: NO

When an interface is parsed the number of endpoints claimed to exist
is compared to the number of endpoint descriptors actually found.
Duplicated endpoints are not parsed in usb_parse_endpoint but
usb_parse_interface counts them. That makes no sense.
To correct this usb_parse_endpoint needs to return feedback
about the validity of parsed endpoints.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/config.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 055910fc6b19..50acc9021247 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -254,7 +254,7 @@ static bool config_endpoint_is_duplicate(struct usb_host_config *config,
 static int usb_parse_endpoint(struct device *ddev, int cfgno,
 		struct usb_host_config *config, int inum, int asnum,
 		struct usb_host_interface *ifp, int num_ep,
-		unsigned char *buffer, int size)
+		unsigned char *buffer, int size, bool *valid)
 {
 	struct usb_device *udev = to_usb_device(ddev);
 	unsigned char *buffer0 = buffer;
@@ -270,6 +270,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 
 	buffer += d->bLength;
 	size -= d->bLength;
+	*valid = false;
 
 	if (d->bDescriptorType != USB_DT_ENDPOINT)
 		goto skip_to_next_endpoint_or_interface_descriptor;
@@ -313,6 +314,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 		}
 	}
 
+	*valid = true;
 	endpoint = &ifp->endpoint[ifp->desc.bNumEndpoints];
 	++ifp->desc.bNumEndpoints;
 
@@ -581,14 +583,17 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
 	/* Parse all the endpoint descriptors */
 	n = 0;
 	while (size >= sizeof(struct usb_descriptor_header)) { /* minimum length to get bDescriptorType */
+		bool valid;
+
 		if (((struct usb_descriptor_header *) buffer)->bDescriptorType
 		     == USB_DT_INTERFACE)
 			break;
 		retval = usb_parse_endpoint(ddev, cfgno, config, inum, asnum,
-				alt, num_ep, buffer, size);
+				alt, num_ep, buffer, size, &valid);
 		if (retval < 0)
 			return retval;
-		++n;
+		if (valid)
+			++n;
 
 		buffer += retval;
 		size -= retval;
-- 
2.44.0


