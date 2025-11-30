Return-Path: <linux-usb+bounces-31049-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E5C94EA2
	for <lists+linux-usb@lfdr.de>; Sun, 30 Nov 2025 11:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC603A7CD3
	for <lists+linux-usb@lfdr.de>; Sun, 30 Nov 2025 10:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE34C23A58F;
	Sun, 30 Nov 2025 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uODbF9yq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SAAMpPyS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EOpWF0zT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dgJRB65T"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67598A41
	for <linux-usb@vger.kernel.org>; Sun, 30 Nov 2025 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764499997; cv=none; b=iSlr9ksfxsXJ0kIqGMyykDxc+h5KOQCDtKSMEgML9APc9HNZYHuzmdcNcxdOgf+3htT/oB5pFDF9eqgywNc2KiXiAKNLvzc/fd39C30VvLF+D03xyMXW0m8Hjrf1qADxJvzAz3F67zrwQAKM5kYfJDBDeHXGBnD3Sg+Do34nxi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764499997; c=relaxed/simple;
	bh=ub8mv6PVBzgFwtuEKq2O0DFRjayf3bD6adgdxBQriiM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4CoEInK6w+XDOdCpiMOsWdpYMUfV1xqIvBXdAOdOWWaXKfZusHOzG7phPidqCJNItSlhpMwbwWCaT46lj+TE3yWWEbURH9Cb9PAt1xabzdkwt8T7h1GQewylR9UsIYswOZd2OthNhQkHzmVOFqRU2UBgSi1gUWdMQPSFkOYhSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uODbF9yq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SAAMpPyS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EOpWF0zT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dgJRB65T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E95405BCD4;
	Sun, 30 Nov 2025 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764499988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sw9hI40C32t/QIJi/ltZw6E+2wUBIHlesbi9g4eFK7g=;
	b=uODbF9yqmypV0nUKGawJ9KHFRmoHiChWulxagb6waRzJ8TPSO9U5Z5NgvvdMoJcNqc6wJo
	sj5ryu2666TGhj7xw6u1NJCf/c/xUKLAsbnBDaAd7IIM+f9au2xfb/Z6db1RRwDEhMI/Do
	SajVENcFOaldoMnHQWVp/aiNmztpBXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764499988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sw9hI40C32t/QIJi/ltZw6E+2wUBIHlesbi9g4eFK7g=;
	b=SAAMpPySxop/mTOOYzZeMWa1dhyo4y6to68qdOnvmZg3qO/IpKy0+O9zFMVSIBrZDJbtRO
	sViOvLzBlK5skaAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764499987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sw9hI40C32t/QIJi/ltZw6E+2wUBIHlesbi9g4eFK7g=;
	b=EOpWF0zT13m0CyyYftEo0R/UzmdpBjinlLM5AHCx4cqM3ft8Ba/ft2Mx0VDdHcStAdvSRp
	Nbwir1HlFvBi0VcP9Xi6WLSPpYNxvMdY3gOpMy1vhPj4qZpYdDOWxA8g7/CYKbCqP9W60f
	OT7AbhMT8qa5xmXyxUnWZymCUPl5glc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764499987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sw9hI40C32t/QIJi/ltZw6E+2wUBIHlesbi9g4eFK7g=;
	b=dgJRB65TtJ8igZ6Xy502ZsXDzZZAPHRWrBB5Njno14yGaw87tUnfGJZ2qkB704jyPcAiBw
	WpUUmmQzWb376JCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B946C3EA63;
	Sun, 30 Nov 2025 10:53:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U5EHLBMiLGmdLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 30 Nov 2025 10:53:07 +0000
Date: Sun, 30 Nov 2025 11:53:07 +0100
Message-ID: <87jyz7dc6k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Dylan Robinson <dylan_robinson@motu.com>,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
In-Reply-To: <20251129205639.48fdbdf9.michal.pecio@gmail.com>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
	<20251129205639.48fdbdf9.michal.pecio@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Sat, 29 Nov 2025 20:56:39 +0100,
Michal Pecio wrote:
> 
> On Mon, 24 Nov 2025 16:05:18 -0500, Dylan Robinson wrote:
> > The maxpacksize field in struct audioformat represents the maximum number
> > of bytes per isochronous interval. The current implementation only
> > special-cases high-speed endpoints and does not account for the different
> > computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
> > result, USB audio class devices operating at these speeds may fail to
> > stream correctly. The issue was observed on a MOTU 16A (2025) interface,
> > which requires more than 1024 bytes per interval at SuperSpeed.
> > 
> > This patch replaces the existing logic with a helper that computes the
> > correct maximum bytes-per-interval for all USB speeds, borrowing the logic
> > used in drivers/usb/core/urb.c.
> 
> Hi,
> 
> Since v6.18 we have usb_endpoint_max_periodic_payload(), which looks
> like the exact function you need. It is already used by uvcvideo and
> xhci_hcd, the latter being particularly important because it ensures
> that your endpoints will get the bandwidth allocation you expect.
> 
> The copy-pasta in urb.c should probably be cleaned up at this point,
> but that would be a separate and unrelated patch, of course.

Thanks for the information!  So we can clean up a lot with this new
helper like below.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: usb-audio: Simplify with usb_endpoint_max_periodic_payload()

Recently we received a new helper function,
usb_endpoint_max_periodic_payload(), for calculating the max packet
size for periodic transfer.

Simplify the former open code with the new helper function.

Fixes: a748e1dbb2df ("ALSA: usb-audio: Fix max bytes-per-interval calculation")
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 074a61215de6..ec7d756d78d1 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -684,43 +684,13 @@ snd_usb_find_output_terminal_descriptor(struct usb_host_interface *ctrl_iface,
 	return NULL;
 }
 
-static unsigned int
-snd_usb_max_bytes_per_interval(struct snd_usb_audio *chip,
-					struct usb_host_interface *alts)
-{
-	struct usb_host_endpoint *ep = &alts->endpoint[0];
-	unsigned int max_bytes = usb_endpoint_maxp(&ep->desc);
-
-	/* SuperSpeed isoc endpoints have up to 16 bursts of up to 3 packets each */
-	if (snd_usb_get_speed(chip->dev) >= USB_SPEED_SUPER) {
-		int burst = 1 + ep->ss_ep_comp.bMaxBurst;
-		int mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
-		max_bytes *= burst;
-		max_bytes *= mult;
-	}
-
-	if (snd_usb_get_speed(chip->dev) == USB_SPEED_SUPER_PLUS &&
-		USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)) {
-		max_bytes = le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
-	}
-
-	/* High speed, 1-3 packets/uframe, max 6 for eUSB2 double bw */
-	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH) {
-		if (usb_endpoint_is_hs_isoc_double(chip->dev, ep))
-			max_bytes = le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
-		else
-			max_bytes *= usb_endpoint_maxp_mult(&ep->desc);
-	}
-
-	return max_bytes;
-}
-
 static struct audioformat *
 audio_format_alloc_init(struct snd_usb_audio *chip,
 		       struct usb_host_interface *alts,
 		       int protocol, int iface_no, int altset_idx,
 		       int altno, int num_channels, int clock)
 {
+	struct usb_host_endpoint *ep = &alts->endpoint[0];
 	struct audioformat *fp;
 
 	fp = kzalloc(sizeof(*fp), GFP_KERNEL);
@@ -734,7 +704,7 @@ audio_format_alloc_init(struct snd_usb_audio *chip,
 	fp->ep_attr = get_endpoint(alts, 0)->bmAttributes;
 	fp->datainterval = snd_usb_parse_datainterval(chip, alts);
 	fp->protocol = protocol;
-	fp->maxpacksize = snd_usb_max_bytes_per_interval(chip, alts);
+	fp->maxpacksize = usb_endpoint_max_periodic_payload(chip->dev, ep);
 	fp->channels = num_channels;
 	fp->clock = clock;
 	INIT_LIST_HEAD(&fp->list);
-- 
2.52.0


