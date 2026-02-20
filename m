Return-Path: <linux-usb+bounces-33509-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAfyC9o0mGn/CgMAu9opvQ
	(envelope-from <linux-usb+bounces-33509-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 11:18:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB3B166C1B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 11:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 428133021BAB
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9536533C50D;
	Fri, 20 Feb 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="AtVTXtAK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TVEMMypK"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F55E33C53D
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582671; cv=none; b=Qsv//TD/u1wAgQYrAuK1NOEI3nBOYOoZTWcvOv4OxUSof/dGoFxSFrQSFB4CgF0/VkEEq1qiNaDO8w4IRcgiBJKRT8P8irFxhVC2qkFyJAi3cJaF70jLC56/I7YJ4qZyzIOtvCj5gz8YH7kkpC0SX5SG+OFyDp/o+DBfo9NRpWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582671; c=relaxed/simple;
	bh=h2xpjGLHu/JW9dLBoLooZldJMkCo8EYPvzS6bds28CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M63ZZSz97hX2NoA4XnqDNccT3mg+oyrCNgBxhN8BTTfdRxQ+ig1PvXt1K5oQKjqDaFtmtHFwk7WrvKq7FxA2tOoPan9scV39zuhdoinUJMNun1WdIUQpqUMkifEEXVyaSrO06fQT3AbdrPLf5m54F/Yan1ZZ/fFQstPaft6obmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=AtVTXtAK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TVEMMypK; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 679777A006C;
	Fri, 20 Feb 2026 05:17:48 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 20 Feb 2026 05:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1771582668; x=1771669068; bh=n+BjGJYW9p
	8qAhK0h6tRB33nyxboVeDflevKIS+buVY=; b=AtVTXtAKTJEVkne+eLN8PWC2Ss
	TYf4napX4M7KfmB0MVu63BVlkpMpeOxGH2SrmsgJA4ff49F8Z3n9OVD5QMGvuaaj
	JWT299HORPEzxLFfD3YWuMuE05L/h6VQAzBne9gFgvJ0SSU55+go7YVsJJOL6bxl
	IPJ1KKgsusNgmuU2FfbAHJ4IVKUj1McMKPsodAE99zFrUC7l3v9w3Fq4wqD6tp4c
	jzv1nAzLgAq6y/myMLEMkm3eC/QtSTGBbYnPqai+Ht2zk9gsWnxH7MsMe2RbLuTO
	OMkOpPrjfbbDium0oBdzPdCpbyLlvjGHKvdE71Bf2JdUWE21jDissWhtzE7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771582668; x=1771669068; bh=n+BjGJYW9p8qAhK0h6tRB33nyxboVeDflev
	KIS+buVY=; b=TVEMMypK7BMaY6jfjtbMLKngHqN61Dx2n6gwqnM23SEx8N9C3x3
	KvEU86SlM4nYzLxO5xjeDisuQBqMIXz/7Me0cTFru57cRthN425xdCEiKh5VecjY
	3Y3Xg0Fg+pYQNfxqXfPkenlZnrDtqLtxzEmq/2aGhqxJXdWdHkWqKIiUH22OnwBT
	bbLrbBvH8O6ZD++Sk8xWNxrj4POEBVOSlq2ZQLrMCjsjNEFAIa6jiIGZNBtm7KqW
	8ESLoj/6cz/OzhdWVQ7CfjOFo1AUps2hYsJnNUyZz91JEk5xqCMsr9GznQbFNWYC
	N1syae2AGxY4oEFxguxddWm9sKPBObFq14w==
X-ME-Sender: <xms:zDSYab4rFA9Sb4H6NMYmHRYETn_9045ebWCSbWPqbtcpAO0Dg-6MuA>
    <xme:zDSYaethK3uCGcnn8j3Jv_jwYZ-XjFU_-7tWhHDQsE_fd3vnTZgNEkld_GIQmAMv_
    i0hQb5on74wI7XI31CPhGcfwqCZsHvO-cDYO7an4I1JauCA-Wo>
X-ME-Received: <xmr:zDSYac4IVycNy2sSAtrg3vUDGgepD8-RwhoOVdq9sXzfxx8FwPVRNO1-0vN0J307WNAEjx8h4XE2UPzfsGnuNKCUzarleo6MT8GMaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdekudejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduieffvd
    dufeefleevtddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegsuhhgiihilhhlrgdquggrvghmohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zDSYaZUhdgJd8S5-EqA-cL0kMSG-MjzR7VNoT0ZhXgMZLYyE1rtO0A>
    <xmx:zDSYae89v-Gno00ERVanyToAi6KhTzsbfhDVnDN61Sdsb3yhI-6FDg>
    <xmx:zDSYaVn_kmWyCFMj6LY61IXeUk4kSEGGFf0WHz0oobwLsh6CedB-Vg>
    <xmx:zDSYacVBH4iknZ75fUXCnv5TY90tYyoz-P0qZvAAKlIXveRQyPA84A>
    <xmx:zDSYac0e_NFHYqqMSOUS48yiXaSP_2tGzrLS9V4VRo1ewNCuhOv0sD5N>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Feb 2026 05:17:47 -0500 (EST)
Date: Fri, 20 Feb 2026 11:17:45 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Message-ID: <2026022044-discolor-blazing-4e4b@gregkh>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
 <bug-221103-208809-81pZ0utVvy@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-221103-208809-81pZ0utVvy@https.bugzilla.kernel.org/>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33509-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,unnservice.com:email,messagingengine.com:dkim,kroah.com:dkim]
X-Rspamd-Queue-Id: 5FB3B166C1B
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:07:57AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221103
> 
> --- Comment #9 from Paul Alesius (paul@unnservice.com) ---
> > Or perhaps simply this would crash it?
> > while sleep .1 ; do true </dev/bus/usb/010/001 ; done
> 
> Yes it froze the system on iteration 3000
> 
> A C program without ioctl also froze it on iteration 887. Doing ioctl seems to
> trigger it much faster at iteration ~200.
> 
> I ordered a USB-to-ethernet adapter in the meantime to try to get more
> diagnostics through netconsole, instead of serial cable, will that work?

If the USB stack is locking up, dumping USB data out when that happens
would obviously not be possible :)

There is a special USB debug cable that will work instead, search around
on the web for one if you are curious about using it.

good luck!

greg k-h

