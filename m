Return-Path: <linux-usb+bounces-6327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EC85300A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 13:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1376D28A5D1
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 12:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A73138DCD;
	Tue, 13 Feb 2024 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mbtQOJWI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X1ohQcox";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mbtQOJWI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X1ohQcox"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441BE3D54D;
	Tue, 13 Feb 2024 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707825748; cv=none; b=HmChiG0NsnpbtY3rTbeV7CtmEpf/p4OcJHs4cLZTM6fioHeKGBcL9L+Lnn4PYcC3hVdPRIoCBJ/kt6FOodAXWLjsX5+CGJrDKWHvTQ/fcTXVUFoDDkNAHulqsAjAQKDtECgVdupjNp9q5eb4Y9bAsoLcol52pynUQUFCzHiruN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707825748; c=relaxed/simple;
	bh=lQvXOiYbN7ijUs4uZHWglAHFBJJLScF1aZlTN9THRds=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FTcIuyPrwG1hwHj0c+sw94BnHLU3g9Avc5KQAxme5N2uk9wwaX//k23NcxtRtwKeboFNUo2LFnaTHXIdrfApZXa3IJjQj5+gBnB+c/TVFr2oYSr5c1bq1uaKfwGd2V6aG51ZASGldNcnXgj/jT5hTMzVLnYrUw5fUA5+g1+YNF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mbtQOJWI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X1ohQcox; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mbtQOJWI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X1ohQcox; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 797A41FCA1;
	Tue, 13 Feb 2024 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707825745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7s8TY48d2sWEZq6v8pf1kB4rU8R+US3lEisv7Ug8+dY=;
	b=mbtQOJWIJembR1g+vuy2zaWCUnlj6gOADYsB2X8aUTvylDqsEvx8SpS2bZ2sn66544EIkS
	X20WDvpQpMmxCde3LMjl0upjn9BnB/UnF5lIHzLbETkcx3hwJceFKhtEJPk7OpucT8ejDp
	pjf4IqiRo8L797PeGrzKPvEBYYyLgvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707825745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7s8TY48d2sWEZq6v8pf1kB4rU8R+US3lEisv7Ug8+dY=;
	b=X1ohQcoxefjTyo8aWK5/HtO4NfgnLXl4qhf3ZOjmj6UMkOQ4bm6JJEHpwHzMVFWhxMIpDO
	vz7iqEvLUN65Q5Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707825745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7s8TY48d2sWEZq6v8pf1kB4rU8R+US3lEisv7Ug8+dY=;
	b=mbtQOJWIJembR1g+vuy2zaWCUnlj6gOADYsB2X8aUTvylDqsEvx8SpS2bZ2sn66544EIkS
	X20WDvpQpMmxCde3LMjl0upjn9BnB/UnF5lIHzLbETkcx3hwJceFKhtEJPk7OpucT8ejDp
	pjf4IqiRo8L797PeGrzKPvEBYYyLgvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707825745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7s8TY48d2sWEZq6v8pf1kB4rU8R+US3lEisv7Ug8+dY=;
	b=X1ohQcoxefjTyo8aWK5/HtO4NfgnLXl4qhf3ZOjmj6UMkOQ4bm6JJEHpwHzMVFWhxMIpDO
	vz7iqEvLUN65Q5Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5BDE11370C;
	Tue, 13 Feb 2024 12:02:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tH3lFVFay2WKAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 12:02:25 +0000
Date: Tue, 13 Feb 2024 13:02:25 +0100
Message-ID: <87sf1wy3la.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Tsoy <alexander@tsoy.me>,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nikolay Yakimov <root@livid.pp.ru>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH] USB: Always select config with the highest supported UAC version
In-Reply-To: <2024021353-reversing-waltz-7402@gregkh>
References: <20240212152848.44782-1-alexander@tsoy.me>
	<2024021353-reversing-waltz-7402@gregkh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [0.85 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.05)[60.23%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.85

On Tue, 13 Feb 2024 12:05:47 +0100,
Greg Kroah-Hartman wrote:
> On Mon, Feb 12, 2024 at 06:28:48PM +0300, Alexander Tsoy wrote:
> >  
> > -			/* If there is no UAC3 config, prefer the first config */
> > -			else if (i == 0)
> > +			if (i == 0)
> >  				best = c;
> >  
> > +			/* Assume that bInterfaceProtocol value is always
> > +			 * growing when UAC versions are incremented, so that
> > +			 * the direct comparison is possible. */
> 
> How do we know this assumption is always true?  What happens when it is not?

I believe this assumption is acceptable.  It's all about the protocol
number from 1 to 3, so far.  If UAC4 is ever supported in future,
it'll be highly probably the number 4.  (If not and keeping the same
protocol number 3, we'll need a different check in anyway.)
And the other numbers are excluded already in is_supported_uac()
check.

> > +			else if (is_supported_uac(desc) && best_desc &&
> > +				 (!is_supported_uac(best_desc) ||
> > +				  (desc->bInterfaceProtocol >
> > +				   best_desc->bInterfaceProtocol)))
> > +					best = c;
> 
> I really can't understand this if logic, sorry, can you describe it
> better so that we can maintain it over time?

The condition looks cryptic, though, yes.

Maybe the check should be factored out, e.g.

/* return true if the new config has a higher priority then the old config */
static bool check_uac_desc_priority(struct usb_host_config *old,
				struct usb_host_config *new)
{
	if (!is_supported_uac(new))
		return false;

	if (!is_supported_uac(old))
		return true;

	/*
	 * Assume that bInterfaceProtocol value is always growing;
	 * so far, it's true from UAC1 to UAC3 (1..3)
	 */
	if (new->bInterfaceProtocol > old->bInterfaceProtocol)
		return true;

	return false;
}


thanks,

Takashi

