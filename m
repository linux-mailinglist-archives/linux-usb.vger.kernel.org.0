Return-Path: <linux-usb+bounces-34274-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPfRCBybrmkjGwIAu9opvQ
	(envelope-from <linux-usb+bounces-34274-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:04:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFA236B85
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A9463030B00
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 10:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D251A38B7A8;
	Mon,  9 Mar 2026 10:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gadA1yOu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hyS81opS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gadA1yOu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hyS81opS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5F5386C1D
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050630; cv=none; b=Lg9HNi4oBzcovgLsykLaSXWYvL1AlnR186m7Rvr/gwS+PfwNAjSzMmxaC4HALXp3YU/xDuX2MII1pXGTZlNg5wVdt30i1sMBfa4i00wyzPBug9uNWIBPvbvnsSd6SHoTuxfUaXf1FnNZmcKgXfvUD86yUDPJpIx2Av2MhFN72yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050630; c=relaxed/simple;
	bh=yg3qLcXJHXojrXxTrTWkjp9BcnrTrykrh8m8I3U/BrQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNJrlJfQMYPIDDGECUeK2gYQ/WpJNp5Heb6Cw34wa9gu80jo7w+Ueokr2hlzxJjg4iMKsOyFd1RpXSsv4L5rwcp5sp8ThL9FwUKrW7kBTTblC4fdJY/4fq3qCEcc0TP0x2FKZZzPPNx1dBciSAK5X+RS4nThZU8HUrCaimV4Xy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gadA1yOu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hyS81opS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gadA1yOu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hyS81opS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9680A5BE23;
	Mon,  9 Mar 2026 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773050627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LtSoxW0Hxz8yqH/IJyiZgQLFLXouXIsduA1nVp1VML0=;
	b=gadA1yOucWj7dFg3a1CHOv6s/sE0n65mEqS7ky0tZlH9f8pRXC8FixzaSYALVpjBKHKfzT
	T2E0VXnfI++D6CtZnDG8H3Xzhw48XtLw8X79NalC6dBWdoh9K63bqbzbQ54F5mjEIUvFpA
	RPyPZqL193q0sTlRjJX1u/H/LDQuBtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773050627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LtSoxW0Hxz8yqH/IJyiZgQLFLXouXIsduA1nVp1VML0=;
	b=hyS81opS92Bn9jSWXeLzFFgXIKmjy7m24dUGg4ClqT8S+avC1oMRjAxAyHUCr/fB08gdLy
	m3cMbDdFi3ySzNAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773050627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LtSoxW0Hxz8yqH/IJyiZgQLFLXouXIsduA1nVp1VML0=;
	b=gadA1yOucWj7dFg3a1CHOv6s/sE0n65mEqS7ky0tZlH9f8pRXC8FixzaSYALVpjBKHKfzT
	T2E0VXnfI++D6CtZnDG8H3Xzhw48XtLw8X79NalC6dBWdoh9K63bqbzbQ54F5mjEIUvFpA
	RPyPZqL193q0sTlRjJX1u/H/LDQuBtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773050627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LtSoxW0Hxz8yqH/IJyiZgQLFLXouXIsduA1nVp1VML0=;
	b=hyS81opS92Bn9jSWXeLzFFgXIKmjy7m24dUGg4ClqT8S+avC1oMRjAxAyHUCr/fB08gdLy
	m3cMbDdFi3ySzNAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54C673EE3C;
	Mon,  9 Mar 2026 10:03:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Hy2OEwObrmm9IQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 10:03:47 +0000
Date: Mon, 09 Mar 2026 11:03:46 +0100
Message-ID: <87h5qpnwu5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Adam Davis <eadavis@qq.com>
Cc: tiwai@suse.de,
	g@b4.vu,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: scarlett2: Add the number of endpoints checked was 0
In-Reply-To: <tencent_986ED56EFECC99E7EF86D412F6064FC99906@qq.com>
References: <87y0k1toaz.wl-tiwai@suse.de>
	<tencent_986ED56EFECC99E7EF86D412F6064FC99906@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.79
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 99AFA236B85
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
	TAGGED_FROM(0.00)[bounces-34274-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,syzkaller.appspot.com:url,appspotmail.com:email,qq.com:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action

On Mon, 09 Mar 2026 10:57:03 +0100,
Edward Adam Davis wrote:
> 
> The user constructed a corrupted USB device, causing the USB device
> enumeration phase to fail to resolve any endpoints. This resulted in
> a null pointer dereference reported in [1] when the USB sound card
> driver executed probe to initialize the mixer. 
> 
> To avoid the problem reported in [1], a check was added to ensure that
> the number of endpoints contained in the interface was 0 when creating
> mixer controls for the Focusrite Scarlett 2nd/3rd Gen USB sound card.
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
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
> v1 -> v2: move the check to scarlett2
> 
>  sound/usb/mixer_scarlett2.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
> index ef3150581eab..4b300226f16c 100644
> --- a/sound/usb/mixer_scarlett2.c
> +++ b/sound/usb/mixer_scarlett2.c
> @@ -9393,6 +9393,15 @@ int snd_scarlett2_init(struct usb_mixer_interface *mixer)
>  		return 0;
>  	}
>  
> +	if (get_iface_desc(mixer->hostif)->bNumEndpoints == 0) {
> +		usb_audio_err(chip,
> +			"%s: There are no endpoints for %04x:%04x\n",
> +			__func__,
> +			USB_ID_VENDOR(chip->usb_id),
> +			USB_ID_PRODUCT(chip->usb_id));
> +		return 0;

This should be an error.  It's obviously a broken descriptor, and this
is the code specific to the certain configuration.


Takashi

