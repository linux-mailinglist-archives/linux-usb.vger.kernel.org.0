Return-Path: <linux-usb+bounces-12248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5A933A55
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 11:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CD8028426E
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 09:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D72F17E8E6;
	Wed, 17 Jul 2024 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="urL8qr4I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5trr00UR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FZUlTtgj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4mOeTb+T"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5535C17DE29;
	Wed, 17 Jul 2024 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209837; cv=none; b=d14kVvGa9IW6IDbNBY+JzZvqFr4g2PMTUXKbEd/ILR4hy859CE1rgG4E6o77Dqxp0ITf0aomktoTiM6OKj3Yio+aDkb1Jk3/mlTJTCkLZoiQT4U+8oR7TI6yRzo+dKRMOFpmRqG2rWKbUbNmgsrKq05L8yXawLOyWBT2jIUryaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209837; c=relaxed/simple;
	bh=eQS5RKdfOra5/LpllGCGfQBZ6vDcLxuH49YDFIDyfBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpN4uimIUzyGUqtmEe7EpSRAdAP6DGaOfhGuUWvoplbnEPmkVOOMyHBPNewzOUMe7YrLGorahWcJaIiNah0s8PcAxQn0rek5oZEKDll1G7t+15dN8jF+rFP9MQedLdowwUxHGdoGfE9ZtcTIPKA6FqUUAaRfz5KGi93lBWaKJcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=urL8qr4I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5trr00UR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FZUlTtgj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4mOeTb+T; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A0A021B31;
	Wed, 17 Jul 2024 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721209834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7xdFaceBDQbQp8VbYkcJwWmrWqwpLj1lSKxadCCPUFI=;
	b=urL8qr4IybptK1q7AymGok9lDMJkzEAB5Z+gjFa6DxRdARpk8vk/205FfPB12P731aFe8f
	9BiLmGrrKVf+68TmIpbAwGwQ75nHKwyNQo90v3ooNQAX11wSaGvrVj/LhHFZMU7R8OroKl
	gYurV+2HmF/u9s1qlQkFBvMiqzskr0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721209834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7xdFaceBDQbQp8VbYkcJwWmrWqwpLj1lSKxadCCPUFI=;
	b=5trr00URDkexhuvCuzQ6Pd+SQmMYR1trOmL/HhZCYLCTUu8gCLLv7BECIl4V5RaK8DSTGb
	3WsFjbHIxJMFoBCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FZUlTtgj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4mOeTb+T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721209833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7xdFaceBDQbQp8VbYkcJwWmrWqwpLj1lSKxadCCPUFI=;
	b=FZUlTtgjGAfdXyxuK5GV6YSSvsPxcQ+srw+CS5+DyfX7NXl/9DUqFbnJUOlSDnxLTtzXYr
	hx5YkAHuETKM7AgPzDHn22rB1cDztW0nVpuWcbtE6fxaQiqOuJSKz2lf9KpNbRgOKvsF0G
	R6wGHwJLoBb3hUASOsPCySMIu8YQfBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721209833;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7xdFaceBDQbQp8VbYkcJwWmrWqwpLj1lSKxadCCPUFI=;
	b=4mOeTb+TXyUSU5EwafT7irpO+NjbLWfFjVce0PqdLwum0690vVIKCgFAkETvNEI4RWlMin
	U+Vr+n2Ee3C7XEDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33201136E5;
	Wed, 17 Jul 2024 09:50:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dEcZC+mTl2ZuLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jul 2024 09:50:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] usb: gadget: midi2: Fix the response for FB info with block 0xff
Date: Wed, 17 Jul 2024 11:50:53 +0200
Message-ID: <20240717095102.10493-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5A0A021B31
X-Spam-Flag: NO
X-Spam-Score: 0.99
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.99 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spamd-Bar: /

When the block number 0xff is given to Function Block Discovery
message, the device should return the information of all Function
Blocks, but currently the gadget driver treats it as an error.

Implement the proper behavior for the block 0xff instead.

Fixes: 8b645922b223 ("usb: gadget: Add support for USB MIDI 2.0 function driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/usb/gadget/function/f_midi2.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index ec8cd7c7bbfc..d8379013a376 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -640,12 +640,21 @@ static void process_ump_stream_msg(struct f_midi2_ep *ep, const u32 *data)
 		if (format)
 			return; // invalid
 		blk = (*data >> 8) & 0xff;
-		if (blk >= ep->num_blks)
-			return;
-		if (*data & UMP_STREAM_MSG_REQUEST_FB_INFO)
-			reply_ump_stream_fb_info(ep, blk);
-		if (*data & UMP_STREAM_MSG_REQUEST_FB_NAME)
-			reply_ump_stream_fb_name(ep, blk);
+		if (blk == 0xff) {
+			/* inquiry for all blocks */
+			for (blk = 0; blk < ep->num_blks; blk++) {
+				if (*data & UMP_STREAM_MSG_REQUEST_FB_INFO)
+					reply_ump_stream_fb_info(ep, blk);
+				if (*data & UMP_STREAM_MSG_REQUEST_FB_NAME)
+					reply_ump_stream_fb_name(ep, blk);
+			}
+		} else if (blk < ep->num_blks) {
+			/* only the specified block */
+			if (*data & UMP_STREAM_MSG_REQUEST_FB_INFO)
+				reply_ump_stream_fb_info(ep, blk);
+			if (*data & UMP_STREAM_MSG_REQUEST_FB_NAME)
+				reply_ump_stream_fb_name(ep, blk);
+		}
 		return;
 	}
 }
-- 
2.43.0


