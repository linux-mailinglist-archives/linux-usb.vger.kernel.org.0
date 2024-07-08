Return-Path: <linux-usb+bounces-12063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 005B7929FAD
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jul 2024 11:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA5E728A1E8
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jul 2024 09:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C120F7347E;
	Mon,  8 Jul 2024 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dA5GuL+2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="idJ673mz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dA5GuL+2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="idJ673mz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2E553362;
	Mon,  8 Jul 2024 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432613; cv=none; b=RY6r3s+yzBLCrQ9xwGBD9Azp4+sZV9EYT7JwY5ZsxRBrmSdJlMmxd39kD3yhEGFl0TxZ4WbQrvwmozm+mv3YIKSPuUavNyqcQQ/jFrYNKug54i4Y8daDrRt4mzEIOuDZfmI2N65PRIAMXn/ebscwgi6W3Gxq8DzzgczzqBcQqUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432613; c=relaxed/simple;
	bh=x+B/2ML74coKTqWf/fcCs0R8H9A2qdIGmhQFctqOzUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H1RXnIE2zsrby3VwHWzWzavi9N6b0qDCHCBU/mqagv0Phgpt83+1Tghsn2J1DQyqIixuxLJ3bTMG4uVkZAf+cnMSSHPNKjC+0Y9EBna23L656cEpVhhosG2bXJhs7Dhqu9RLERF5tV+pd7FWOluf4IYFHqH5s5SlMbGdcKxxI/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dA5GuL+2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=idJ673mz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dA5GuL+2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=idJ673mz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C58AB21B34;
	Mon,  8 Jul 2024 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720432609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N8Y4IL89FfVC6afdpT5IvYSfFgULE0O2g7AEbdsUBpE=;
	b=dA5GuL+2qC61+53r9hgtPLivv9R1IrkAXv3I/r2lh8cE+6SentEDy7df8kOHKVz4cSYWmM
	f7no5uqL2cdqRGXJ2cQ7Ir1a3o2hw0IpELsKnz6yohiiYtGKf9wkHFvq1WzU8ebblapnfO
	imCSq0uu9TlJEvFrW4+go5jBBGgo/Qg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720432609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N8Y4IL89FfVC6afdpT5IvYSfFgULE0O2g7AEbdsUBpE=;
	b=idJ673mz54WylhZQehUWvtJ/trytKSuVnJicpey2yUR8LEJGzg7B3DAm/eHlrXpnqf3x/0
	tadd3BlgmXpY75Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dA5GuL+2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=idJ673mz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720432609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N8Y4IL89FfVC6afdpT5IvYSfFgULE0O2g7AEbdsUBpE=;
	b=dA5GuL+2qC61+53r9hgtPLivv9R1IrkAXv3I/r2lh8cE+6SentEDy7df8kOHKVz4cSYWmM
	f7no5uqL2cdqRGXJ2cQ7Ir1a3o2hw0IpELsKnz6yohiiYtGKf9wkHFvq1WzU8ebblapnfO
	imCSq0uu9TlJEvFrW4+go5jBBGgo/Qg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720432609;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N8Y4IL89FfVC6afdpT5IvYSfFgULE0O2g7AEbdsUBpE=;
	b=idJ673mz54WylhZQehUWvtJ/trytKSuVnJicpey2yUR8LEJGzg7B3DAm/eHlrXpnqf3x/0
	tadd3BlgmXpY75Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A051713A82;
	Mon,  8 Jul 2024 09:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AG7mJeG3i2a1PwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Jul 2024 09:56:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] usb: gadget: midi2: Fix incorrect default MIDI2 protocol setup
Date: Mon,  8 Jul 2024 11:57:17 +0200
Message-ID: <20240708095719.25627-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.63 / 50.00];
	BAYES_HAM(-2.62)[98.31%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C58AB21B34
X-Spam-Flag: NO
X-Spam-Score: -2.63
X-Spam-Level: 

The MIDI2 gadget driver handled the default MIDI protocol version
incorrectly due to the confusion of the protocol version passed via
configfs (either 1 or 2) and UMP protocol bits (0x100 / 0x200).
As a consequence, the default protocol always resulted in MIDI1.

This patch addresses the misunderstanding of the protocol handling.

Fixes: 29ee7a4dddd5 ("usb: gadget: midi2: Add configfs support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/usb/gadget/function/f_midi2.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi2.c b/drivers/usb/gadget/function/f_midi2.c
index ec8cd7c7bbfc..0e38bb145e8f 100644
--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -150,6 +150,9 @@ struct f_midi2 {
 
 #define func_to_midi2(f)	container_of(f, struct f_midi2, func)
 
+/* convert from MIDI protocol number (1 or 2) to SNDRV_UMP_EP_INFO_PROTO_* */
+#define to_ump_protocol(v)	(((v) & 3) << 8)
+
 /* get EP name string */
 static const char *ump_ep_name(const struct f_midi2_ep *ep)
 {
@@ -564,8 +567,7 @@ static void reply_ump_stream_ep_config(struct f_midi2_ep *ep)
 		.status = UMP_STREAM_MSG_STATUS_STREAM_CFG,
 	};
 
-	if ((ep->info.protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI_MASK) ==
-	    SNDRV_UMP_EP_INFO_PROTO_MIDI2)
+	if (ep->info.protocol == 2)
 		rep.protocol = UMP_STREAM_MSG_EP_INFO_CAP_MIDI2 >> 8;
 	else
 		rep.protocol = UMP_STREAM_MSG_EP_INFO_CAP_MIDI1 >> 8;
@@ -627,13 +629,13 @@ static void process_ump_stream_msg(struct f_midi2_ep *ep, const u32 *data)
 		return;
 	case UMP_STREAM_MSG_STATUS_STREAM_CFG_REQUEST:
 		if (*data & UMP_STREAM_MSG_EP_INFO_CAP_MIDI2) {
-			ep->info.protocol = SNDRV_UMP_EP_INFO_PROTO_MIDI2;
+			ep->info.protocol = 2;
 			DBG(midi2, "Switching Protocol to MIDI2\n");
 		} else {
-			ep->info.protocol = SNDRV_UMP_EP_INFO_PROTO_MIDI1;
+			ep->info.protocol = 1;
 			DBG(midi2, "Switching Protocol to MIDI1\n");
 		}
-		snd_ump_switch_protocol(ep->ump, ep->info.protocol);
+		snd_ump_switch_protocol(ep->ump, to_ump_protocol(ep->info.protocol));
 		reply_ump_stream_ep_config(ep);
 		return;
 	case UMP_STREAM_MSG_STATUS_FB_DISCOVERY:
@@ -1065,7 +1067,8 @@ static void f_midi2_midi1_ep_out_complete(struct usb_ep *usb_ep,
 		group = midi2->out_cable_mapping[cable].group;
 		bytes = midi1_packet_bytes[*buf & 0x0f];
 		for (c = 0; c < bytes; c++) {
-			snd_ump_convert_to_ump(cvt, group, ep->info.protocol,
+			snd_ump_convert_to_ump(cvt, group,
+					       to_ump_protocol(ep->info.protocol),
 					       buf[c + 1]);
 			if (cvt->ump_bytes) {
 				snd_ump_receive(ep->ump, cvt->ump,
@@ -1375,7 +1378,7 @@ static void assign_block_descriptors(struct f_midi2 *midi2,
 			desc->nNumGroupTrm = b->num_groups;
 			desc->iBlockItem = ep->blks[blk].string_id;
 
-			if (ep->info.protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI2)
+			if (ep->info.protocol == 2)
 				desc->bMIDIProtocol = USB_MS_MIDI_PROTO_2_0;
 			else
 				desc->bMIDIProtocol = USB_MS_MIDI_PROTO_1_0_128;
@@ -1552,7 +1555,7 @@ static int f_midi2_create_card(struct f_midi2 *midi2)
 		if (midi2->info.static_block)
 			ump->info.flags |= SNDRV_UMP_EP_INFO_STATIC_BLOCKS;
 		ump->info.protocol_caps = (ep->info.protocol_caps & 3) << 8;
-		ump->info.protocol = (ep->info.protocol & 3) << 8;
+		ump->info.protocol = to_ump_protocol(ep->info.protocol);
 		ump->info.version = 0x0101;
 		ump->info.family_id = ep->info.family;
 		ump->info.model_id = ep->info.model;
-- 
2.43.0


