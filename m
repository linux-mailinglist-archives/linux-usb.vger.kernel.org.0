Return-Path: <linux-usb+bounces-31051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F17C94F36
	for <lists+linux-usb@lfdr.de>; Sun, 30 Nov 2025 13:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A493A3E32
	for <lists+linux-usb@lfdr.de>; Sun, 30 Nov 2025 12:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03CA279DCA;
	Sun, 30 Nov 2025 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BnbJ94QG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vlq5+dVC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rwq4LuZR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FmLb0Gok"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD536D510
	for <linux-usb@vger.kernel.org>; Sun, 30 Nov 2025 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764504542; cv=none; b=aLpF/it5M9ws7IGTTh/VuG+hAucMIBLzv6gy2tzjs3RjN+PC9uuYDbx9dXaBxsF0SW8EkSDJ7vxGjNyeRZNyhQ8cYT7DPs3KRf5Ae5H/G+6p0n3HJt/DrhVjZyBbpJLSRfnbPvaj8auQncuQXlMwAUcX8Hhki1bm1nEXdp213AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764504542; c=relaxed/simple;
	bh=h2CZ7Xv2NcR5qSwX88FWqUUSLLUnlGPhydrfqq1hCUQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uP3ED1V9NDrLKqe7J1Yz5qJ+g1n4sW/rs1ub3YL4JdcJMX4a6eEJxutwxZQyRTHICih12lL5SR4ZdeQBJPUQ8rZFXV+sA1nRkOg0yUYXcQuwpjoMpR7kZWySzCGNWFl4M8ldMoGoXGYqDYVKJs/o3hbiRcdVmm7tADNgSgnHepI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BnbJ94QG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vlq5+dVC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rwq4LuZR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FmLb0Gok; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3BC395BCD4;
	Sun, 30 Nov 2025 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764504538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xytd0cRqyWLdMiI3d7ssVMcPm/89hSlVI49QUf/MIrI=;
	b=BnbJ94QGEdN1La2BUscdnYwLTbASemAj9cpQ52vlBVhBMhQZSHhPzyKan6D2mwvntwRSWg
	HtXmU+7zmoXbyrauUa/RMCJcXsW4ept/ijZQaeY7QJqmUAA0PbA8Ss39mlbaNME2CDAedS
	nR1rKJ9oAOcgLXXSVSlyr7irMyJmoHo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764504538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xytd0cRqyWLdMiI3d7ssVMcPm/89hSlVI49QUf/MIrI=;
	b=vlq5+dVCk/NfPzfyfRE/FCXf1qkHUZa5owgZwVWbX6pxAU4mVChPiAN8UW1vHlHiSWPnQp
	wqrgEGdMHNF4nNAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Rwq4LuZR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FmLb0Gok
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764504537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xytd0cRqyWLdMiI3d7ssVMcPm/89hSlVI49QUf/MIrI=;
	b=Rwq4LuZRbqTX0n7FrBsqZNkATeqBBt+gdBGeXyR0aZuqPLUi4O4L9VlP1xfUVdJD9QkjIW
	aqQwTt3bjC9lEBNwUlWCB2LygQ0LUcV40lhBaJUthtzAnjmu/53y2FvQ72UNvfH0zBD1Rs
	1IHQtO93XS0qSKr/moou7b4Hd0A5+18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764504537;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xytd0cRqyWLdMiI3d7ssVMcPm/89hSlVI49QUf/MIrI=;
	b=FmLb0GokS0cgDahhAgb+81/eLYdC4BZni8E51Env9kSE/0gG57VXfcUiTRDqVqSUNGWyNu
	VPvowBjQbnA37pDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 073B23EA63;
	Sun, 30 Nov 2025 12:08:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bqw2ANkzLGnobwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 30 Nov 2025 12:08:56 +0000
Date: Sun, 30 Nov 2025 13:08:56 +0100
Message-ID: <87h5ubd8o7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Dylan Robinson <dylan_robinson@motu.com>,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
In-Reply-To: <20251130130035.6f44713e.michal.pecio@gmail.com>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
	<20251129205639.48fdbdf9.michal.pecio@gmail.com>
	<87jyz7dc6k.wl-tiwai@suse.de>
	<20251130130035.6f44713e.michal.pecio@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -2.01
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3BC395BCD4
X-Rspamd-Action: no action
X-Spam-Flag: NO

On Sun, 30 Nov 2025 13:00:35 +0100,
Michal Pecio wrote:
> 
> On Sun, 30 Nov 2025 11:53:07 +0100, Takashi Iwai wrote:
> > On Sat, 29 Nov 2025 20:56:39 +0100,
> > Michal Pecio wrote:
> > > 
> > > On Mon, 24 Nov 2025 16:05:18 -0500, Dylan Robinson wrote:  
> > > > The maxpacksize field in struct audioformat represents the maximum number
> > > > of bytes per isochronous interval. The current implementation only
> > > > special-cases high-speed endpoints and does not account for the different
> > > > computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
> > > > result, USB audio class devices operating at these speeds may fail to
> > > > stream correctly. The issue was observed on a MOTU 16A (2025) interface,
> > > > which requires more than 1024 bytes per interval at SuperSpeed.
> > > > 
> > > > This patch replaces the existing logic with a helper that computes the
> > > > correct maximum bytes-per-interval for all USB speeds, borrowing the logic
> > > > used in drivers/usb/core/urb.c.  
> > > 
> > > Hi,
> > > 
> > > Since v6.18 we have usb_endpoint_max_periodic_payload(), which looks
> > > like the exact function you need. It is already used by uvcvideo and
> > > xhci_hcd, the latter being particularly important because it ensures
> > > that your endpoints will get the bandwidth allocation you expect.
> > > 
> > > The copy-pasta in urb.c should probably be cleaned up at this point,
> > > but that would be a separate and unrelated patch, of course.  
> > 
> > Thanks for the information!  So we can clean up a lot with this new
> > helper like below.
> 
> Yes, something like that.
> 
> Note that there is a small gotcha here: Dylan's patch and the original
> code, as well as usb_submit_urb(), didn't take wBytesPerInterval into
> account, while usb_endpoint_max_periodic_payload() and xhci_hcd do.
> 
> Odd SuperSpeed endpoints like those below will now be considered to
> have 512B/1536B capacity, not 1KB/2KB. Whether any such UAC devices
> exist (mine is UVC) I don't know. My only SuperSpeed UAC device uses
> one packet per interval and wMaxPacketSize == wBytesPerInterval.
> 
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               1
>         bMaxBurst               0
>         wBytesPerInterval     512
> 
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               1
>         bMaxBurst               1       /* two packets per interval */
>         wBytesPerInterval    1536
> 
> I also don't know whether this affects UAC operation in any way, but
> it's something to watch out for.
> 
> Ignoring wBytesPerInterval wasn't right either, because xhci_hcd would
> still reserve wBytesPerInterval bandwidth (as per spec) and URBs which
> exceed that could complete with an error.
> 
> If a device is found where wBytesPerInterval makes no sense and must be
> ignored, it needs to be ignored consistently across the kernel.

Agreed, it makes more sense to have the common criteria applied to all
places.

Dylan, could you check whether the cleanup is OK?
I'll apply it once after the confirmation.


thanks,

Takashi

