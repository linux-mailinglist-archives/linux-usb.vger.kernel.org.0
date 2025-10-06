Return-Path: <linux-usb+bounces-28911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670CBBEB8D
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 18:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CDC9188FEF5
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 16:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BFB220F49;
	Mon,  6 Oct 2025 16:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="c+c3uceZ";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dbal24H0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA73221DAC
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759769108; cv=none; b=lmQTcUHXl98p+ZRge/XA1rgsWCKFOTQntUrsGC/BQAAMYj43a86tMef1Ubk47cz9Cf9x7ZDszz8wJ9NHzYS0/OG3mBipohwiajejt2OLrnWgDHN/Acz+c90jYrd6bhpTX050UG9WsPX4vpd+kRSjhfo8vsCc1Enqfo80w4I8YPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759769108; c=relaxed/simple;
	bh=ca5fVwv12tbBgUgUJ3UcFF2rCFKVXpYELstSn4jRmXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9ih8/qX99napA3WquIQWS3RTh3pbnXnHaqqGAbjrrunC+YBL66RKVSSrSRMtX9Vln7kuWVrn0MV6Oyj2VYbeoxEkPFCSN5JgaTCOu4HOOl1GX7ewTyygWonO82y5dtV5PmzZVUP/DYoWSKGoDmNJg9h+yu1zBqpUdlpeZDS7bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=c+c3uceZ; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=dbal24H0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA5131F451;
	Mon,  6 Oct 2025 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759769103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kU5cidUPIFYWz3duq3VTPwNFXBoRkrEbz1rq8Nla8zk=;
	b=c+c3uceZUlyuxkUvWjAfYJPF57SXnvr3SvP+oAHs/xS4dwxc7+AyfKoztsDSEFaOK5fzoo
	xPGFpUrKdGqjmEyDNgsfNHEqU7W37x/zMU9cWwuxfAChxIfGNsQcEs70Ivq3a0ZWIwN4+L
	zO/BX8ZKHo0xbat6ZUk7RwET93l7fKs=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759769102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kU5cidUPIFYWz3duq3VTPwNFXBoRkrEbz1rq8Nla8zk=;
	b=dbal24H0Quqn6sXxS+uQiE5eAWYiebUG1JgzAW9Pv4DvnVEfvVS2EVxHPteA6jTxD3KAJG
	g3meZhVJW8kjLQ2qpMAGI9Y903Lldfsbd55cFTqOlMYwnv6Wl2U2/9yXNbnqL+PKiGitwJ
	UGl4Il7GmmSpvzC4dGMDbfxBgfGN76w=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A16BA13995;
	Mon,  6 Oct 2025 16:45:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PKChJQ7y42jBRAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Mon, 06 Oct 2025 16:45:02 +0000
From: Oliver Neukum <oneukum@suse.com>
To: amardeep.rai@intel.com,
	r.kannappan@intel.com,
	mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/1] USB: core: also treat eUSB2V2 as eUSB2 regarding ISO transfers
Date: Mon,  6 Oct 2025 18:44:51 +0200
Message-ID: <20251006164500.131899-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.80

eUSB2V2 devices use a bcdUSB of 0x0230, not 0x0220
to identify as eUSB2 devices, yet their endpoint companion
descriptors must also be parsed.

Fixes: c749f058b4371 ("USB: core: Add eUSB2 descriptor and parsing in USB core")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index baf5bc844b6f..c96ef5e9b74d 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -455,7 +455,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	 */
 	maxp = le16_to_cpu(endpoint->desc.wMaxPacketSize);
 
-	if (maxp == 0 && bcdUSB != 0x0220 &&
+	if (maxp == 0 && bcdUSB != 0x0220 && bcdUSB != 0x0230 &&
 	    !(usb_endpoint_xfer_isoc(d) && asnum == 0))
 		dev_notice(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
 		    cfgno, inum, asnum, d->bEndpointAddress);
@@ -507,7 +507,7 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	}
 
 	/* Parse a possible eUSB2 periodic endpoint companion descriptor */
-	if (udev->speed == USB_SPEED_HIGH && bcdUSB == 0x0220 &&
+	if (udev->speed == USB_SPEED_HIGH && (bcdUSB == 0x0220 || bcdUSB == 0x0230) &&
 	    !le16_to_cpu(d->wMaxPacketSize) && usb_endpoint_is_isoc_in(d))
 		usb_parse_eusb2_isoc_endpoint_companion(ddev, cfgno, inum, asnum,
 							endpoint, buffer, size);
-- 
2.51.0


