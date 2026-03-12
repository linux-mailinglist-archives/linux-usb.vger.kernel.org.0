Return-Path: <linux-usb+bounces-34702-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCoqGlz9smmQRQAAu9opvQ
	(envelope-from <linux-usb+bounces-34702-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:52:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A3276D3E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68064302D5B9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 17:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DE9242D97;
	Thu, 12 Mar 2026 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="mci0bO73";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SdQ8cei0"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C383FB061
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337945; cv=none; b=gKiYjndp5kx5712hCgUQWyxidnDWnQMFWJcAouxW8pgv6b1MFDMwM33Oi5dOBXn4TeHY1EFS7ucui2Lk9XtzbcYwhkzXlxiXAP3ysVud+RpPnpnT+NwO8v3mLTGbPgrFeHP+Q257vsKefDnxV1uOwiCoxfnfG5O84VzFTQ9rzZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337945; c=relaxed/simple;
	bh=QQ3jPnYBzd81VGmjfpJE5pyaDDTNgMIzGUkxgfDO5Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zln0Tw3a98vZA6PGFnumGUdjn1P2PAJbBNhWbb8gSVmu4HJpPJf2t/ttJP2yaP3Gh3Cqmj7GjZLBA+OrcsMxwjzhStP3mZJAeD8F5sf6KXXAlQ7ogAe8vfD4DPj/YOV63Xvy6fr153bqOthFSb605j83rf3frKO3GEUASNEFKfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=mci0bO73; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SdQ8cei0; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 74F0BEC0571;
	Thu, 12 Mar 2026 13:52:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 12 Mar 2026 13:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1773337942; x=1773424342; bh=mfUuxHGHlV
	wZC1vW6dcR1XwJZQdZDvAsC6JKUOae/0o=; b=mci0bO73noXk7zpEqviXkF14mg
	xpKEy8Qo+XSVCV2KxmJ3QjS6ElaNG2oKkQPHel0HF61k1vBwiJG3v9D7VyR594DF
	eYtfmQq8TDpWcLUBgZxA54a3ddoZkybOhM9St9M1c7JLnO90gfMT+3UCheyCGm+g
	j3LbExPQF0WKZLvVtGydZYRi4ELfN/GYRgX2bDNSYEt7lSXqniEislb+KgfO9nL7
	2wb9UEiWTHv2KGHblSmogiT6k9VkD1qFPQ7ESY3cpR1DCqBAXlkpP/z65qzN50Gr
	5MZG7BMptxysd4GuOxhXyrVudvBv2DqVED4gN2uoK5e8t7CL0hVq9vdE2L1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773337942; x=1773424342; bh=mfUuxHGHlVwZC1vW6dcR1XwJZQdZDvAsC6J
	KUOae/0o=; b=SdQ8cei0EmMPCzGzb81HEaIPbfuCEEZUJDAiXr8Oz7ksUQev0CO
	pcc4doqKdPQpGfVZ5rOXPneO4+w+9sJVTm1eWlYFWLtnZlwsd5iKL8V0AzyN7gsS
	Wc/Jv9aN45C7mtzIptjvaEb6JFGWID1XagChzDTjDxqRJlkZtv/x1jc/GfNl76Rv
	CSSMeia9VSkIsB/yEuAq0nSP1bVsNfb4YH66LSLZwoa9wuzUMv47xUsGpGG5FK+q
	nP+UyVrJ4xmRBJxPP0+Se5BprB6kqvV5kCRq2JjCNz820vnxu587yEK4SNQjLoeC
	o1HHlbrP1sjmeWb/Jh+WXhW76Hp81cJFErw==
X-ME-Sender: <xms:Vv2yaTcBFQZSy2ain8KtusU6ERc0RlDhgSSZMDnp_InJPWUAArFS9g>
    <xme:Vv2yaXD83B-dSGVMWoy4Hyg7ixuK_SD14hf0DdHK43nxC4HdpNG76DBFf1mQn_LKY
    79Sb_V5Y2HIhJRBYxtAGtaQc2Csw0jPFZV0DxF71IEF-7Xy>
X-ME-Received: <xmr:Vv2yaW9RZaAGyVJOti5QElDr6JNAdZYJScUH1UKz6XTlQ7JyiT7wCmVYOjd6m68AqRzFbR5PMb10VZXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeejgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduieffvd
    dufeefleevtddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegsuhhgiihilhhlrgdquggrvghmohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Vv2yaSK0N_XtE-d-rxvw4cLNHtjW82s2t2ejZLFAoyiUpUXzbMLcsA>
    <xmx:Vv2yafhR0YdawOvBPrLwjoR-XuYdWZMWy5-zckjfG8lO_6RM41DCHQ>
    <xmx:Vv2yaS6dkZ9yonSTJBaoAckj9oQdKc25E3_cVbsWl3ks-wvvhdoTFw>
    <xmx:Vv2yaXbTsTG2698XVPuAgrvWLcrMWlY3xd5V5-T9ah0q-XCdnHvXug>
    <xmx:Vv2yaeaKjQJcGfnNxLI6IMYwt5n4jqKmCE96XHc4cn2TdbzoA-fWTAtT>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Mar 2026 13:52:21 -0400 (EDT)
Date: Thu, 12 Mar 2026 18:52:17 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 221216] ezcap401 needs USB_QUIRK_NO_BOS to function on
 10gbs usb speed
Message-ID: <2026031253-alumni-squad-0a6d@gregkh>
References: <bug-221216-208809@https.bugzilla.kernel.org/>
 <bug-221216-208809-jEtkjEvhdA@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-221216-208809-jEtkjEvhdA@https.bugzilla.kernel.org/>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34702-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 7A5A3276D3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 05:36:27PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221216
> 
> --- Comment #3 from Vyacheslav (vahnenko2003@gmail.com) ---
> Created attachment 309633
>   --> https://bugzilla.kernel.org/attachment.cgi?id=309633&action=edit
> edited file

Can you send this to the linux-usb@vger.kernel.org list?  We can't take
patches from bugzilla directly :(

thanks,

greg k-h

