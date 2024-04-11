Return-Path: <linux-usb+bounces-9259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 102EF8A1505
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41C2A1C20D57
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 12:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB8514D43E;
	Thu, 11 Apr 2024 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="okRqMagY";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="okRqMagY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD57143C76
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839650; cv=none; b=ZFCaXtWutbYaWt6WArsutdoWMdwIawkCuGPN0mzo6qbJ4rQJ2C5en2ysVt35dmi/GMuU3plEWh286M4buxl5TnIaVrOFSAlEqRiCWwATTnvVu8cbU/hzlNed1CGS7HPnMm1pnWk6Q96eLKDlbk4eWf6k8jfmo+8uf5coLCnqUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839650; c=relaxed/simple;
	bh=CiQIDEFIWB5VZzFPPLfc88TyYabppV8vqrgcnm6xAds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWQC/QUhq2HyrAMFGT/1snIhrV9BjSRhJSQ0nyvIK3vdcI1RZueHKUkoMg8FCiIevfcOJmEFSeRoN9VoH2Lj96vBECGXgwO0ox9tEuGV2ojwJ4FvSUYFw/z2spEXRYVnb3/4MOibKp+bx5DDlVbnf/HdTeNHoVg9207tnsrz82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=okRqMagY; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=okRqMagY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 421E55C6BE;
	Thu, 11 Apr 2024 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPfnNf5yVNNLb1kwQ5v5wCznZ0z7XRP2KzVLldzXKT0=;
	b=okRqMagYAqAXLE1LSYuKjh5yK6D7RR/GGtI68cBwcT/ZTBE9AATbOg7dYiS3uFM1WA7C+M
	OWFQ8uiOwTwZ9ogqZc+SQGKurLZWpHQZuJw5l7a2EPqq3HppwVIqlJj0vVb4wGax88wbX/
	yj64RKj7jDFUPl08rbuN3U08kgGEex8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPfnNf5yVNNLb1kwQ5v5wCznZ0z7XRP2KzVLldzXKT0=;
	b=okRqMagYAqAXLE1LSYuKjh5yK6D7RR/GGtI68cBwcT/ZTBE9AATbOg7dYiS3uFM1WA7C+M
	OWFQ8uiOwTwZ9ogqZc+SQGKurLZWpHQZuJw5l7a2EPqq3HppwVIqlJj0vVb4wGax88wbX/
	yj64RKj7jDFUPl08rbuN3U08kgGEex8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1802C13A1F;
	Thu, 11 Apr 2024 12:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sM26A97bF2brIQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 11 Apr 2024 12:47:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 4/6] usb: usb_parse_endpoint guard against an incromprehensible preamble
Date: Thu, 11 Apr 2024 14:43:02 +0200
Message-ID: <20240411124722.17343-5-oneukum@suse.com>
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
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.01)[47.77%];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: 0.19
X-Spam-Flag: NO

usb_parse_endpoint processes an endpoint descriptor and then
advances the parser to the next endpoint descriptor.
However, a malicious device could feature something other than
an endpoint descriptor after the interface descriptor

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/config.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 050cd5066ccf..055910fc6b19 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -271,6 +271,8 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	buffer += d->bLength;
 	size -= d->bLength;
 
+	if (d->bDescriptorType != USB_DT_ENDPOINT)
+		goto skip_to_next_endpoint_or_interface_descriptor;
 	if (d->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE)
 		n = USB_DT_ENDPOINT_AUDIO_SIZE;
 	else if (d->bLength >= USB_DT_ENDPOINT_SIZE)
-- 
2.44.0


