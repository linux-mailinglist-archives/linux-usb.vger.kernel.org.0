Return-Path: <linux-usb+bounces-19064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A76A03CBC
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 11:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216591881766
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 10:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A42D1E5701;
	Tue,  7 Jan 2025 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tP/kl3SB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VX6xQMUJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tP/kl3SB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VX6xQMUJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C3B1DF986;
	Tue,  7 Jan 2025 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246663; cv=none; b=PruYpT0rBDou+zelsvxo/VJdPkbZLT+eE2N8zq5eK6UzQ3ElzJQS0cT2yqp1K/lGXx7nRA1+laW2bASHHebjXg+ph4hbvgMzUuh6YMZgHyK0zlbF6K462m8CZkQopddrdIa+N9fo+9YSPsOd1vuG6pb2qx/wfqL/b3fNz/8o3e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246663; c=relaxed/simple;
	bh=5TXa1IMnE5pVmiMrUfjxeBfb6oloIl3FOfWgwg/iRvk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8ly2GE197R6zq3Q9NeBSd7YsAe3Om2VqtgArribfhSreQkY5T26JKfWbT9B1xcAsl+/8p6TqYUSRPy7B2acjvX8+p9Xt6CdfjudyYkHh8fcrJOTAOYUH9hNtMO73NSdhLkvd4aBXkw9WLAictIAzALB/63F4HOeKWB3VF8k6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tP/kl3SB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VX6xQMUJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tP/kl3SB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VX6xQMUJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8F1891F450;
	Tue,  7 Jan 2025 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736246658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yR1zTqNGDu5KW0e4+aI0Q5PzkMF3lgA29c6b57IvLzM=;
	b=tP/kl3SBr6KfHF6gLm9vlUK9i3inf07CFb/ecYeyKy7HLOTHOEHeAs9ZqE2FjhZiWYToJc
	G1BgZF5arGBJ9WfMONNoKs+B/x+CoYlyzDd7YN4xzcD7AS+gWvIaUsdZVSXZLlc/63Sssn
	QuvmG1zYnuywkSOlchaiT0B490o+itU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736246658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yR1zTqNGDu5KW0e4+aI0Q5PzkMF3lgA29c6b57IvLzM=;
	b=VX6xQMUJ18DZoUC4VBTPeTgK0XzYwv24PulbbsKnqXDCngPnNhsR+skU682iwUa4YoEchA
	SQLGO0WBJkv62lBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="tP/kl3SB";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VX6xQMUJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736246658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yR1zTqNGDu5KW0e4+aI0Q5PzkMF3lgA29c6b57IvLzM=;
	b=tP/kl3SBr6KfHF6gLm9vlUK9i3inf07CFb/ecYeyKy7HLOTHOEHeAs9ZqE2FjhZiWYToJc
	G1BgZF5arGBJ9WfMONNoKs+B/x+CoYlyzDd7YN4xzcD7AS+gWvIaUsdZVSXZLlc/63Sssn
	QuvmG1zYnuywkSOlchaiT0B490o+itU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736246658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yR1zTqNGDu5KW0e4+aI0Q5PzkMF3lgA29c6b57IvLzM=;
	b=VX6xQMUJ18DZoUC4VBTPeTgK0XzYwv24PulbbsKnqXDCngPnNhsR+skU682iwUa4YoEchA
	SQLGO0WBJkv62lBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D33113763;
	Tue,  7 Jan 2025 10:44:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1+20DYIFfWdKawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 10:44:18 +0000
Date: Tue, 07 Jan 2025 11:44:17 +0100
Message-ID: <87v7uqx5ry.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Will Mortensen <willmo@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Yakimov <root@livid.pp.ru>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AT <kernel@twinhelix.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] usb: core: prefer only full UAC3 config, not BADD
In-Reply-To: <CAFCitJ8cLi1Tqk47fhr-F2PBHxxtu_9kr4sSHwdN6XWYmC=2cg@mail.gmail.com>
References: <20250104-usb-choose-config-full-uac3-v1-1-f8bf8760ae90@gmail.com>
	<2025010402-audacity-flounder-d8df@gregkh>
	<CAFCitJ8cLi1Tqk47fhr-F2PBHxxtu_9kr4sSHwdN6XWYmC=2cg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8F1891F450
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,livid.pp.ru,vger.kernel.org,twinhelix.com,gmail.com,suse.com,intel.com,linux.intel.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,linuxfoundation.org:email,suse.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Mon, 06 Jan 2025 10:08:43 +0100,
Will Mortensen wrote:
> 
> Hi Greg,
> 
> (For new CCs, see [1] for full context)
> 
> Thanks for the feedback! Replies below:
> 
> On Sat, Jan 4, 2025 at 12:53 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Sat, Jan 04, 2025 at 07:45:29AM +0000, Will Mortensen wrote:
> > > Previously, usb_choose_configuration() chose the first config whose
> > > first interface was UAC3 (if there was such a config), which could mean
> > > choosing UAC3 BADD over full UAC3, potentially losing most of the
> > > device's functionality. With this patch, we check the config's first IAD
> > > and only prefer the config if it's full UAC3, not BADD.
> > >
> > > Note that if the device complies with the UAC3 spec, then the device's
> > > first config is UAC1/2. With this patch, if the device also has a UAC3
> > > BADD config but no full UAC3 config (which is allowed by the spec),
> > > then we'll select the first, UAC1/2 config, *not* the BADD config.
> > >
> > > That might be undesirable (?), so we could instead try to implement a
> > > priority scheme like: full UAC3 > UAC3 BADD > UAC1/2. But unless we also
> > > enhance this function to look at more than one IAD and interface per
> > > config, we could incorrectly select the BADD config over more fully-
> > > featured UAC1/2/3 configs if the full UAC3 IAD is not first in its
> > > config(s). I don't know enough about UAC3 devices to know what's
> > > preferable, and I'm not sure how simple vs. correct the heuristics in
> > > this function should be. :-) This patch errs on the side of simple.
> > >
> > > For some history, the preference for the first UAC3 config (instead of
> > > the first config, which should be UAC1/2) originated a bit before the
> > > Fixes commit, in commit f13912d3f014 ("usbcore: Select UAC3
> > > configuration for audio if present") and commit ff2a8c532c14 ("usbcore:
> > > Select only first configuration for non-UAC3 compliant devices"). Also,
> > > the Fixes commit's message is a bit wrong in one place since the UAC3
> > > spec prohibits a device's first configuration from being UAC3.
> > >
> > > I tested only with an Apple USB-C headphone adapter (as in the linked
> > > bug), which has three configs in the following order: UAC2, UAC3 BADD,
> > > full UAC3. Previously the UAC3 BADD config was selected; with this patch
> > > the full UAC3 config is selected.
> > >
> > > Reported-by: AT <kernel@twinhelix.com>
> > > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217501
> > > Fixes: 25b016145036 ("USB: Fix configuration selection issues introduced in v4.20.0")
> > > Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > > Cc: Takashi Iwai <tiwai@suse.com>
> > > Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> > > Cc: Saranya Gopal <saranya.gopal@intel.com>
> > > Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> > > Cc: Nikolay Yakimov <root@livid.pp.ru>
> > > Signed-off-by: Will Mortensen <willmo@gmail.com>
> > > ---
> > >  drivers/usb/core/generic.c | 25 +++++++++++++++++--------
> > >  1 file changed, 17 insertions(+), 8 deletions(-)
> > > @@ -48,9 +49,11 @@ static bool is_audio(struct usb_interface_descriptor *desc)
> > >       return desc->bInterfaceClass == USB_CLASS_AUDIO;
> > >  }
> > >
> > > -static bool is_uac3_config(struct usb_interface_descriptor *desc)
> > > +static bool is_full_uac3(struct usb_interface_assoc_descriptor *assoc)
> > >  {
> > > -     return desc->bInterfaceProtocol == UAC_VERSION_3;
> > > +     return assoc->bFunctionClass == USB_CLASS_AUDIO
> > > +             && assoc->bFunctionSubClass == UAC3_FUNCTION_SUBCLASS_FULL_ADC_3_0
> > > +             && assoc->bFunctionProtocol == UAC_VERSION_3;
> >
> > Nit, the "&&" should go on the previous lines, right?
> 
> Sorry, I copied that style from the functions a few lines above. It
> seems this file isn't consistent. :-) I'm happy to change it.
> 
> Answering your other points in reverse order:
> 
> > In other words, I'm really worried about regressions here, what devices
> > has this change been tested on and how can we be assured nothing that
> > works today is suddenly going to break?
> 
> The only audio device I tested on was the Apple headphone adapter. :-)
> I can try to test on a few more audio devices, and find some
> descriptor dumps online.
> 
> I definitely take your point that we should avoid behavior changes
> (presumably even at the cost of some code complexity) unless they're
> strongly justified. This patch erred on the side of code simplicity at
> the cost of unnecessary behavior changes. I'll strike a better balance
> going forward.
> 
> > And what about your comment above which says it "should" be the first
> > config, where is that required?  What about devices that didn't have
> > that and now the functionality changes because that assumption isn't
> > true, and they weren't a "full UAC3 compliant" device?
> 
> Hmm, do you mean this comment?
> 
> /*
>  * […] (If the only UAC3
>  * config is a BADD, we will instead select the first config,
>  * which should be UAC1/2.)
>  */
> 
> The UAC3 spec requires the first config to comply with UAC1/2. If the
> device violates that then it's more complicated, but anyway, this
> comment describes an unnecessary behavior change in the patch. I'll
> avoid this going forward unless I can justify it better.
> 
> > I feel like this is making the kernel pick a specific policy, when
> > userspace might have wanted a different one, right?  Is there anything
> > in the USB spec that mandates that this is the correct config to always
> > pick "first"?
> 
> Good question. I think the UAC3 spec implies that full UAC3 (if
> present) is preferred over UAC3 BADD and UAC1/2. But perhaps more to
> the point, it says in section 4.1 "Standard Descriptors":
> 
>     Because any Device compliant with this specification is required to
>     contain multiple Configuration descriptors, it is also required that any
>     such device include a Configuration Summary Descriptor as part of
>     the standard BOS descriptor.
> 
> And the USB 3.2 spec says in section 9.6.2.7 "Configuration Summary Descriptor":
> 
>     Configuration Summary Descriptors should be included in the BOS
>     descriptor in order of descending preference.
> 
> And my Apple headphone adapters do have those descriptors (in the
> opposite order of the configuration descriptors: full UAC3, UAC3 BADD,
> UAC2). So those descriptors might be the best signal, but AFAICT the
> kernel doesn't parse them. It seems the kernel just has
> usb_choose_configuration(), which just looks at the first interface of
> each configuration, and usb_device_driver.choose_configuration(),
> which only one driver implements (r8152, to choose a vendor-specific
> configuration sometimes).
> 
> As for userspace, at least when it comes to USB audio devices, it
> seems like users generally have to write their own scripts or udev
> rules that call usb_modeswitch or equivalent. At a quick glance, I
> don't see any audio devices in the usb_modeswitch DB, nor any
> automatic USB configuration selection in PipeWire/PulseAudio/JACK or
> the various ALSA utilities (although I may not have looked in the
> right places).
> 
> Anyway, if we really just want to delegate this whole issue to
> userspace, it's a little funny that the kernel does have a policy of
> preferring UAC3, albeit without distinguishing between BADD and full
> UAC3. Are we just stuck with that now? :-) Would it ever make sense
> for the kernel to try to respect the preference expressed by the
> Configuration Summary Descriptors when they exist?

It sounds like a good suggestion.  We should check the actual UAC3
devices, but judging (only) from the description, this will lead to a
best choice.

Speaking of regression: the current pickup of UAC3 BADD caused already
a regression, and basically this patch can be seen as a sort of
long-standing regression, too, as stated in the bugzilla entry.


thanks,

Takashi

> [1] https://lore.kernel.org/linux-usb/20250104-usb-choose-config-full-uac3-v1-1-f8bf8760ae90@gmail.com/T/

