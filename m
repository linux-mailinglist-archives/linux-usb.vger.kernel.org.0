Return-Path: <linux-usb+bounces-34266-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGTdN82ArmlfFQIAu9opvQ
	(envelope-from <linux-usb+bounces-34266-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 09:11:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 650472355D1
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 09:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16F803007CB7
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 08:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF2B36656C;
	Mon,  9 Mar 2026 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oTynYmyt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ia2Xpvmi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oTynYmyt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ia2Xpvmi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C42636B056
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043897; cv=none; b=Vsck6Uh4FtIJIvoxGfR2jwbwpxDwPJAnhdkexcDdwAHQgNc8rP1rRJrRkWgOB1kpj19/qM1BS0ejCzphsGEoYbfyUOY0YZuHmnzJN73QtRRIg6vvKYQO+AfdsUESA8Gvrmzc3TtsmmBCsIXMOBC7hF5/FlwPER4/Zx8dHzw1TKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043897; c=relaxed/simple;
	bh=8Wr+QHGi2xKFzk++2DxKsRg1oRjab/yYDMRypPaMk/U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SxY4ZK451o5iQvq0z70RmPzB+WEFZpQQlqKKuObjxtHzfMjPKffSuEtzAXnc2nr+ERPQIV/lFtETYKAU3SNLNm7yRCXv8s9MfU5RlnMXTgeeRqzT305Rv5gQbZmqF38h8PfvDdd1RNtjDgHR6C1TsiuZ+VeGC76Cd8vD7QN3oqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oTynYmyt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ia2Xpvmi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oTynYmyt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ia2Xpvmi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A518F4D206;
	Mon,  9 Mar 2026 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773043893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LfKcwrC+MnzBTWAPUwiLkszFKYg84zL7JEONpljn3I=;
	b=oTynYmytO9kFu0cL7j7PzOfcphed01RinVZUnnFur5j6gXjx82OGmpQ7D+LJ0aJLVgc5+v
	invi+CpwII6ND2zskEcMEetY7pPdGcZUiyb1nk6A95I6CYoW7uR2/hcicJEphYhm+wAdpD
	0qVQpXWScMi/5vYsmdtPRnEzzpQRbhE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773043893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LfKcwrC+MnzBTWAPUwiLkszFKYg84zL7JEONpljn3I=;
	b=Ia2XpvmiOPQPSNnJI0f27Z7vTFp0Ihaz2CmTrNegJhdPJ28BciTszWp8QVdrIs27MhV8Ll
	BxwCKpYQlNLWkwAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oTynYmyt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ia2Xpvmi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773043893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LfKcwrC+MnzBTWAPUwiLkszFKYg84zL7JEONpljn3I=;
	b=oTynYmytO9kFu0cL7j7PzOfcphed01RinVZUnnFur5j6gXjx82OGmpQ7D+LJ0aJLVgc5+v
	invi+CpwII6ND2zskEcMEetY7pPdGcZUiyb1nk6A95I6CYoW7uR2/hcicJEphYhm+wAdpD
	0qVQpXWScMi/5vYsmdtPRnEzzpQRbhE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773043893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LfKcwrC+MnzBTWAPUwiLkszFKYg84zL7JEONpljn3I=;
	b=Ia2XpvmiOPQPSNnJI0f27Z7vTFp0Ihaz2CmTrNegJhdPJ28BciTszWp8QVdrIs27MhV8Ll
	BxwCKpYQlNLWkwAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F69E3EDCA;
	Mon,  9 Mar 2026 08:11:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Db/tFbWArmkkFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 08:11:33 +0000
Date: Mon, 09 Mar 2026 09:11:32 +0100
Message-ID: <87y0k1toaz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com,
	g@b4.vu,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: usb-audio: Add the number of endpoints checked was 0
In-Reply-To: <tencent_251BAA25F2BA69BB9533A19E651B204B3208@qq.com>
References: <69acf72a.050a0220.310d8.0004.GAE@google.com>
	<tencent_251BAA25F2BA69BB9533A19E651B204B3208@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 650472355D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34266-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linux-usb,ae893a8901067fde2741];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,appspotmail.com:email,syzkaller.appspot.com:url,qq.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 09 Mar 2026 08:32:29 +0100,
Edward Adam Davis wrote:
> 
> The user constructed a corrupted USB device, causing the USB device
> enumeration phase to fail to resolve any endpoints. This resulted in
> a null pointer dereference reported in [1] when the USB sound card
> driver executed probe to initialize the mixer. 
> 
> To avoid the problem reported in [1], a check was added to ensure that
> the number of endpoints contained in the interface was 0 when checking
> the mixer status.
> 
> [1]
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:479 [inline]
> RIP: 0010:scarlett2_find_fc_interface sound/usb/mixer_scarlett2.c:8261 [inline]
> RIP: 0010:scarlett2_init_private sound/usb/mixer_scarlett2.c:8295 [inline]
> RIP: 0010:snd_scarlett2_controls_create sound/usb/mixer_scarlett2.c:8684 [inline]
> RIP: 0010:snd_scarlett2_init.cold+0xbad/0x6c79 sound/usb/mixer_scarlett2.c:9407
> Call Trace:
>  snd_usb_mixer_apply_create_quirk+0x1c21/0x2b80 sound/usb/mixer_quirks.c:4446
>  snd_usb_create_mixer+0x7a2/0x1910 sound/usb/mixer.c:3641
>  usb_audio_probe+0xf6d/0x3a90 sound/usb/card.c:1033
> 
> Reported-by: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ae893a8901067fde2741 
> Tested-by: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  sound/usb/mixer.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index ac8c71ba9483..bd28caec3004 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -3563,8 +3563,12 @@ static int snd_usb_mixer_status_create(struct usb_mixer_interface *mixer)
>  	int buffer_length;
>  	unsigned int epnum;
>  
> +	epnum = get_iface_desc(mixer->hostif)->bNumEndpoints;
> +	if (epnum == 0)
> +		return -EINVAL;
> +
>  	/* we need one interrupt input endpoint */
> -	if (get_iface_desc(mixer->hostif)->bNumEndpoints < 1)
> +	if (epnum < 1)
>  		return 0;

The change looks wrong.  We don't want to return an error here, as
mixer->urb is optional.  And the second check introduced above is
utterly nonsense; epnum is an unsigned int, so epnum < 1 means only
epnum == 0.

The problem is rather in the scarlett2 side, and it should have a
check there, not in the core function.


thanks,

Takashi

