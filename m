Return-Path: <linux-usb+bounces-31737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6A1CDADA4
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 00:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA29B30217B5
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 23:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347452C030E;
	Tue, 23 Dec 2025 23:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V8ZtiXMs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6vBh1HAu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V8ZtiXMs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6vBh1HAu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910F1A2C0B
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 23:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766533570; cv=none; b=bV9AnG/XFnAIGMNw80Qmp5pcgkCFDwwMooH084+UWWFtmFfCyaRGnW6b6Ct2Xwjs9Gjn8yQglymcj4ZQecmubvaz0BoyPWkTw1ikprMohfDjwAJOc1v34LQcoaPGo3qOq21+LzFHLcFY8qYpSgsV2QwwKSiTmSJAAd7nP3AOq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766533570; c=relaxed/simple;
	bh=wvY0i6cbTTXSARd9w5CrEAT7qmccFf0I76/U6zHNQ48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrT0eu7ZnhNvQKjIfeX2kFZWAJogp4SB7eXuziHe1MvkRQ7/u0t2nuNDYo3byhLi0BtM58A0rWo6TD+XN3umj9Dzdu8RqyRd3LJ0wPJYCfYIz5G2PQN9qWI1+35IstGoZ+WnJeWf7UmDYsVnSkKOd0Vv+xx3Q2BhhiSvIIvNjzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V8ZtiXMs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6vBh1HAu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V8ZtiXMs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6vBh1HAu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 186445BCF5;
	Tue, 23 Dec 2025 23:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766533565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfYmmg7IlwmZFIJtj2k/eg7vIZ86AM4p8ZvGCr8l5Qk=;
	b=V8ZtiXMsJSLk2lXf8nQ1VvJCYfgRSlv8LOVGQj0NvLXYrS4fd3ANRVt8kFPjg86sm3xUek
	q2LL0saFOW7qCDuimuXmB3pIKph1gOeztCfbrXoojFzy17BNNt95hgBt5eV2NPoq0L4vkV
	1nPf2+ETPAAjbkVzuQ9OOxOYsiE/XFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766533565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfYmmg7IlwmZFIJtj2k/eg7vIZ86AM4p8ZvGCr8l5Qk=;
	b=6vBh1HAuufCmH9N4NVaDUQSdJuhboMaPPrr8bzn9uOQ43ToRiThEadTYdMJ+NL28lTfUTo
	n+yaCt7vvNlLxXBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V8ZtiXMs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6vBh1HAu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766533565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfYmmg7IlwmZFIJtj2k/eg7vIZ86AM4p8ZvGCr8l5Qk=;
	b=V8ZtiXMsJSLk2lXf8nQ1VvJCYfgRSlv8LOVGQj0NvLXYrS4fd3ANRVt8kFPjg86sm3xUek
	q2LL0saFOW7qCDuimuXmB3pIKph1gOeztCfbrXoojFzy17BNNt95hgBt5eV2NPoq0L4vkV
	1nPf2+ETPAAjbkVzuQ9OOxOYsiE/XFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766533565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfYmmg7IlwmZFIJtj2k/eg7vIZ86AM4p8ZvGCr8l5Qk=;
	b=6vBh1HAuufCmH9N4NVaDUQSdJuhboMaPPrr8bzn9uOQ43ToRiThEadTYdMJ+NL28lTfUTo
	n+yaCt7vvNlLxXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9104913A54;
	Tue, 23 Dec 2025 23:46:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r7hFH7wpS2nrXQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 23 Dec 2025 23:46:04 +0000
Date: Tue, 23 Dec 2025 23:46:02 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: ucsi oops on system resume (6.19-rc1)
Message-ID: <kapqzmifxktrqqv7umwzolc7dp7zegwuwc5dxalcct3ksmxo5c@ovs34r2an6kt>
References: <ac4m5qtjpnmx336r5astuxkvtqfjhlt6674odmtecsn2e6sqja@hndb7jdcqsp3>
 <9c4e32eb-4ec6-44a1-aa8e-04f9e6b4ce74@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c4e32eb-4ec6-44a1-aa8e-04f9e6b4ce74@kernel.org>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 186445BCF5
X-Spam-Flag: NO
X-Spam-Score: -4.01

On Thu, Dec 18, 2025 at 09:24:47PM -0600, Mario Limonciello wrote:
> 
> 
> On 12/17/25 5:38 AM, Pedro Falcato wrote:
> > Hi,
> > 
> Here's a fix:
> 
> https://lore.kernel.org/linux-usb/20251216122210.5457-1-superm1@kernel.org/T/#u

Thanks, I think we've picked it up with 6.19-rc2. I'll report back if I
find anything borked again (though I am, admittedly, not doing much
dogfooding through the holidays).

-- 
Pedro

