Return-Path: <linux-usb+bounces-15080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FA197792A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 09:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 937C8B23C92
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 07:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0831B9831;
	Fri, 13 Sep 2024 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NEG2wpMg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hZWGsOvU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NEG2wpMg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hZWGsOvU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F40C13D625
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726211622; cv=none; b=Zbgk84ZTvMYyPt19zW/XnbQmBR0x6VPkpNdqDMl7lri/98CGENSrBTJIa2fZ7MdLUgB5S/d6zLX99RQsbnMWnq88E2hy1RD5aF43Iaw4M6xPji+whMbkYOKWfkP/O894k151Jvr1JA6As06Axr1A1DdOWdeBv+XW/DXHivomZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726211622; c=relaxed/simple;
	bh=nmAZJOs4/YfAaOhJG+M49fu8a38aloU1FmK3w4Rqal8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K3m01/A171NNGkj1lT0wPcRjWUE9orWKvaG9lZcIQNvlzUaFdr/BhW+c8upRdnXUAJNJlTcoXto4ygKzWtdksYzWwGTp4kix/fhp8CrwHbGf0Qp7FcoP9aIFGChCD6nSPmk5VAUC/xLO80gxsbDdqX3GEL2Yy6SiSMalR2kaN8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NEG2wpMg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hZWGsOvU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NEG2wpMg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hZWGsOvU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BE947219E5;
	Fri, 13 Sep 2024 07:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726211618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+Xpcc2JM6j8Pae6K6gMiCTE8w6aCep62s/t0UF2vKk=;
	b=NEG2wpMgpEgxzAIjz1/2Dl97scV6fQSQodF7prAZ2Z1M3MVlJRHsJDWqtFOFYCmkjfnAcP
	jmRlFDZetfjWZohnJDuJPBT8Ujo6x3qDQcdK9jtyenxOID9IlogaMedmZa1+LpNnitnCSu
	x4fHUta4qBsP4qySaizJeIJN78i3EVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726211618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+Xpcc2JM6j8Pae6K6gMiCTE8w6aCep62s/t0UF2vKk=;
	b=hZWGsOvUVg70G6Nriy360HtR6B5FExsmXyUrP9DT+PflX4WbddTW2zDiw3/WUf1hfumVNr
	HuV27Gr7ew6kBdDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726211618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+Xpcc2JM6j8Pae6K6gMiCTE8w6aCep62s/t0UF2vKk=;
	b=NEG2wpMgpEgxzAIjz1/2Dl97scV6fQSQodF7prAZ2Z1M3MVlJRHsJDWqtFOFYCmkjfnAcP
	jmRlFDZetfjWZohnJDuJPBT8Ujo6x3qDQcdK9jtyenxOID9IlogaMedmZa1+LpNnitnCSu
	x4fHUta4qBsP4qySaizJeIJN78i3EVM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726211618;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+Xpcc2JM6j8Pae6K6gMiCTE8w6aCep62s/t0UF2vKk=;
	b=hZWGsOvUVg70G6Nriy360HtR6B5FExsmXyUrP9DT+PflX4WbddTW2zDiw3/WUf1hfumVNr
	HuV27Gr7ew6kBdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EB8F13A73;
	Fri, 13 Sep 2024 07:13:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eRlPHSLm42ZrJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Sep 2024 07:13:38 +0000
Date: Fri, 13 Sep 2024 09:14:27 +0200
Message-ID: <87wmjgdnzg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-USB <linux-usb@vger.kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg KH <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
In-Reply-To: <87ed5o8hen.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
	<d6e47194-a708-4dfe-96c8-aba9391e4496@perex.cz>
	<46b37ef3-047c-4b1b-a79b-37187a46754a@sirena.org.uk>
	<87ed5o8hen.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 13 Sep 2024 03:35:28 +0200,
Kuninori Morimoto wrote:
> 
> 
> Hi Takashi, Mark, Jaroslav
> 
> This is the reply for very old patch (almost 2 month ago).
> 
> > > > Many drivers are using below code to know the Sound direction.
> > 
> > > > 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> > 
> > > > This patch-set add snd_pcm_is_playback/capture() macro to handle it.
> > 
> > > NAK from my side (overdesign, no improved readability). The defines
> > > (SNDRV_PCM_STREAM_*) are enough to check the stream type value correctly.
> > 
> > I have to say I do remember this being a little bit of a confusing idiom
> > when I first stated looking at ALSA stuff, especially for capture only
> > cases.
> 
> This patch-set got both Ack and Nack.
> I wonder can I re-post this after merge-window again ?
> I'm asking because this is very huge patch-set.

If we get a NACK for this kind of cleanups, it's rather negative.
Unless its' a mandatory preliminary change for other upcoming stuff,
I don't think it's worth to work on this further. 


thanks,

Takashi

