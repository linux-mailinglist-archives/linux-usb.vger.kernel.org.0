Return-Path: <linux-usb+bounces-31094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A915C9A649
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 08:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C337A3A52F1
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 07:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF70221546;
	Tue,  2 Dec 2025 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ss3Z4KGT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="htkrx82c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ss3Z4KGT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="htkrx82c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD8222597
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 07:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764659340; cv=none; b=TM/xh/Kq8I9AecsH1spxpAmsHjRrrMxcUynAmKI9t9QY5oAMVLZTSjspflUPcxu5G8r9amGyQej/jg2H9Ifi5ZFPq3qjUE2q30obPtRQUxzx5NfOfqfrdvFLIe6tlKU+T99sACIQIRRrCcxMCo0kOt2fEoKthY5GvkF+CQ6byCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764659340; c=relaxed/simple;
	bh=9oni4O3FH546gzWvprfOZq7bFoZoCQe6UmotMQrKenE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fmor1vZZXuj5L6ufLqEuOMtL1aFJpULk6aaQWJNkWsYE+TddFNoJyXs2yZyrSlEX6MoZd1rdf7f1n4KQ/EqK0KSXJyLMjdEHuRWHBcIX1HaK1D1nKwOxQGyKXX/Xo58DGx20bMokxN146vUOAv4FNzisCBSPXWGiBmc0qZ8hdmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ss3Z4KGT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=htkrx82c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ss3Z4KGT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=htkrx82c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C32233686;
	Tue,  2 Dec 2025 07:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764659336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yjdRZGIHCXKY8AWyYEvxhWGGJE5P1QgCYAu0R0Zl/m4=;
	b=Ss3Z4KGTXAUW6uTMQXPLRX9dJ5FtJ+cRw4OJsh8quuZJR77mwAPqrVxkMBkvkX28Km0lWT
	MkZuDoxujKqG6B7Ek/Qr9H65G0rruD+WHnw1xECF/8T+ALVtEfXTfLjByCfZF8BZT/8fW7
	PDRZJ8Ll/xf/+oCWdBTbAx2O9IJUDNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764659336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yjdRZGIHCXKY8AWyYEvxhWGGJE5P1QgCYAu0R0Zl/m4=;
	b=htkrx82cfcb4BWu/MoqH919ARpns8NKvD4wXeRW6FuAtjERiTzdvc/xRNeLRDwO4xcQp2M
	UFUhcteOFsUmjXCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ss3Z4KGT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=htkrx82c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764659336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yjdRZGIHCXKY8AWyYEvxhWGGJE5P1QgCYAu0R0Zl/m4=;
	b=Ss3Z4KGTXAUW6uTMQXPLRX9dJ5FtJ+cRw4OJsh8quuZJR77mwAPqrVxkMBkvkX28Km0lWT
	MkZuDoxujKqG6B7Ek/Qr9H65G0rruD+WHnw1xECF/8T+ALVtEfXTfLjByCfZF8BZT/8fW7
	PDRZJ8Ll/xf/+oCWdBTbAx2O9IJUDNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764659336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yjdRZGIHCXKY8AWyYEvxhWGGJE5P1QgCYAu0R0Zl/m4=;
	b=htkrx82cfcb4BWu/MoqH919ARpns8NKvD4wXeRW6FuAtjERiTzdvc/xRNeLRDwO4xcQp2M
	UFUhcteOFsUmjXCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF8133EA63;
	Tue,  2 Dec 2025 07:08:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6DdwNYeQLmkXYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Dec 2025 07:08:55 +0000
Date: Tue, 02 Dec 2025 08:08:55 +0100
Message-ID: <87sedt5piw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
In-Reply-To: <CA+Df+jeCQXAuxLp5woF1fb4wgPNcKn7uMNaXnNG6j8EvuKX-eQ@mail.gmail.com>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
	<20251129205639.48fdbdf9.michal.pecio@gmail.com>
	<87jyz7dc6k.wl-tiwai@suse.de>
	<20251130130035.6f44713e.michal.pecio@gmail.com>
	<87h5ubd8o7.wl-tiwai@suse.de>
	<20251201114705.470325f5.michal.pecio@gmail.com>
	<CA+Df+jeCQXAuxLp5woF1fb4wgPNcKn7uMNaXnNG6j8EvuKX-eQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 1C32233686
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,suse.de,vger.kernel.org,suse.com,perex.cz];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Tue, 02 Dec 2025 00:10:21 +0100,
Dylan Robinson wrote:
> 
> > Dylan, could you check whether the cleanup is OK?
> > I'll apply it once after the confirmation.
> 
> Tested and seems to be working. The cleanup looks good to me.
> 
> This is what our endpoint looks like:
> 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes           37
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Implicit feedback Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               1
>         bMaxBurst               3
>         wBytesPerInterval    3205

Thanks for confirmation.  Then let's take this.


Takashi

