Return-Path: <linux-usb+bounces-9760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5F8B1DED
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 11:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2907B254AE
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 09:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF4A12C484;
	Thu, 25 Apr 2024 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HmGrcuXV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7kTHxT7Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HmGrcuXV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7kTHxT7Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E4884FCC
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714036934; cv=none; b=gDzFgSNcLTx3uq7Rk40MY95q5RXnfFdfClWc7Or3TTo439IHozAW5VBAFdiN9bptvdXsXBB7o6sBBeno+BEFUuSNlDAC1bvnKfq1dNumT217K/dl7OmR3mTDk9fhukHEAFX+z/+dzZJ1LgX5NN2tONitnG76AtO1P0Q3E3dZDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714036934; c=relaxed/simple;
	bh=HDlJSLefKXe2JUBM3NFVTfxfmPrNGrt+DF2ru5JAiok=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BR8L5gN3cJU78k94IDpYB8QgMPP2kbfsKQucQIlxtacGTbMTZR8v4GKQFEJk3NLrwYnAIEqyR9arY7e1WvgaI0AETQwm3F9aRw+t+3f+yo62AWVqFbiZDozrQFIp+2bNiAd8lz3XogPaUFK/TNuKzv/aeX0SexTRtexxwTifVKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HmGrcuXV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7kTHxT7Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HmGrcuXV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7kTHxT7Q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D76B3205A4;
	Thu, 25 Apr 2024 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsEP3vEV/iyEKIFQ6+MZRsSwkcuVQPAVQsrBK6Ka6x0=;
	b=HmGrcuXVQYNzTBFAmy47lsV8quKoGV6qW7lpgkclvW2uwrc2fX5g8hL9wT0oLUtovn7RY+
	Mll9EKQ4kZtyTazbBKIS99n/2TLOehf0NVudRZMOwL2yj8CRJ5BjNnJJInNu/0p0jcv+SG
	jJbeJPjX1rZn41t9X72mHH+B/nFTAkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714036930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsEP3vEV/iyEKIFQ6+MZRsSwkcuVQPAVQsrBK6Ka6x0=;
	b=7kTHxT7QxM/BDERe81R/g0L3bOlaAJqrxTjpaEiXekqXEtaEuTXVQPjWAfkxlpsuYEEvA5
	Nu7EHgNKYxtlSnAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsEP3vEV/iyEKIFQ6+MZRsSwkcuVQPAVQsrBK6Ka6x0=;
	b=HmGrcuXVQYNzTBFAmy47lsV8quKoGV6qW7lpgkclvW2uwrc2fX5g8hL9wT0oLUtovn7RY+
	Mll9EKQ4kZtyTazbBKIS99n/2TLOehf0NVudRZMOwL2yj8CRJ5BjNnJJInNu/0p0jcv+SG
	jJbeJPjX1rZn41t9X72mHH+B/nFTAkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714036930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsEP3vEV/iyEKIFQ6+MZRsSwkcuVQPAVQsrBK6Ka6x0=;
	b=7kTHxT7QxM/BDERe81R/g0L3bOlaAJqrxTjpaEiXekqXEtaEuTXVQPjWAfkxlpsuYEEvA5
	Nu7EHgNKYxtlSnAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D8021393C;
	Thu, 25 Apr 2024 09:22:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id atZbJcIgKmYhLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Apr 2024 09:22:10 +0000
Date: Thu, 25 Apr 2024 11:22:12 +0200
Message-ID: <871q6tbxvf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Felipe Balbi
 <balbi@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Julian Scheel <julian@jusst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	John Keeping <john@metanate.com>,
	AKASH KUMAR <quic_akakum@quicinc.com>,
	Jack Pham <jackp@codeaurora.org>,
	Chris Wulff <Chris.Wulff@biamp.com>
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for channel/samplesize combinations
In-Reply-To: <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
	<72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,alsa-project.org,gmail.com,kernel.org,baylibre.com,jusst.de,linuxfoundation.org,metanate.com,quicinc.com,codeaurora.org,biamp.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Wed, 24 Apr 2024 09:40:52 +0200,
Pavel Hofman wrote:
> 
> 
> On 17. 04. 24 13:07, Pavel Hofman wrote:
> 
> > I am considering implementation of multiple altsettings to f_uac2, so
> > that multiple combinations of channels and samplesizes can be offered to
> > the host.
> > 
> > Configuration:
> > --------------
> > * each altsetting for each direction should define
> >    * channel mask
> >    * samplesize
> >    * hs_bint bInterval
> >    * c_sync type (for capture only)
> > 
> > 
> > Perhaps the easiest config would be allowing lists for the existing
> > parameters (like the multiple samplerates were implemented). All the
> > list params would have to have the same number of items - initial check.
> > First values in the list would apply to altsetting 1, second to
> > altsetting 2 etc.
> > 
> > Or the altsetting could be some structured configfs param - please is
> > there any recommended standard for structured configfs params?
> > 
> > 
> > Should the config also adjust the list of allowed samplerates for each
> > altsetting? Technically it makes sense as higher number of channels can
> > decrease the max samplerate, e.g. for via a TDM interface. If so, it
> > would need either the structured configuration or some "list of lists"
> > format.
> > 
> > 
> > Implementation:
> > ---------------
> > 
> > Parameters could be turned to arrays of fixed predefined sizes, like the
> > p/s_srates. E.g. 5 max. altsettings in each direction would consume only
> > 4 * (5-1) + 3* (5-1) = 28 extra ints (excluding the samplerates config).
> > 
> > Currently all descriptor structs are statically pre-allocated as there
> > are only two hard-coded altsettings. IMO the descriptors specific for
> > each altsetting could be allocated dynamically in a loop over all
> > none-zero alsettings.
> > 
> > Please may I ask UAC2 gadget "stakeholders" for comments, suggestions,
> > recommendations, so that my eventual initial version was in some
> > generally acceptable direction?
> > 
> 
> This feature has coincidentally arisen in recent commits by Chris
> https://lore.kernel.org/lkml/c9928edb-8b2d-1948-40b8-c16e34cea3e2@ivitera.com/T/
> 
> Maybe Takashi's commits to the midi gadget could be a way
> https://patchwork.kernel.org/project/alsa-devel/list/?series=769151&state=%2A&archive=both
> The midi gadget allows multiple configurations now, where configs are
> placed into a separate block.X configfs directory. That way the configfs
> recommendation to keep one value per item is adhered to and the
> configuration is nice and clean.
> 
> This method would nicely allow various samplerate lists for each
> altsetting, without having to use some obscure list of lists.
> 
> The f_uac2 tree config could have e.g. alt.1-X subdirs, to fit the
> altsetting ID. I am not sure the dot index not starting with 0 would be
> an issue.
> 
> Now the question would be what to do with the existing (and the new
> params added by Chris) flat-structure parameters which apply to (the
> only one) altsetting 1. Maybe they could be used as defaults for the
> other altsettings for unspecified parameters?
> 
> I very much appreciate any input, thank you all in advance.

IMO, a softer approach would be to use subdirs for alt1+ while flat
files are kept used for alt0.  Alternatively, we may allow creating
alt0, too, and the values there will win over the flat values.


thanks,

Takashi

