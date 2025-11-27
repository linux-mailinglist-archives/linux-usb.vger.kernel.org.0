Return-Path: <linux-usb+bounces-31005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7575C8E3BE
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 13:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3806A3A157B
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 12:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF1A330305;
	Thu, 27 Nov 2025 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="az0Jui6S";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qk/pU+f8"
X-Original-To: linux-usb@vger.kernel.org
Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE432FA3A;
	Thu, 27 Nov 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764246010; cv=none; b=F847/ieXb+VAfN+OSCtLEi/3UuMSi0VPBuQD7okFF5pboelZz3Kioy+JSGXC+YXXTfcPpBWPKayJMaJj7jHnFLA9Pchu6bbXR/QoGB2eOZe8f6WPPQ3LHEB1rvGaeixQ+74IjzL2cDuyJH69STApyt+AnuzvOar3VMIkl4PPDb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764246010; c=relaxed/simple;
	bh=d4jD9AOTsm+ieImUBdhYbb2Qb9QXDpy5qV6Gu6PVHos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btsqGRsBwGS7DRwA4NU/SubeQXPaGqNjKtQm2cVwcR1qHkk6Ndlw4E8DIqEBEgEFf8FBA+hn7Xu8xzxCEIak13Mdr6a/xdh2mLLFurrH2bxmJnpDuh1ICKNMmdGTVMh2fTniSkUkQZhBaLydg68S6W3PJrUvfOGet/uFronTnYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=az0Jui6S; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qk/pU+f8; arc=none smtp.client-ip=202.12.124.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.stl.internal (Postfix) with ESMTP id D324F13003D7;
	Thu, 27 Nov 2025 07:20:05 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 27 Nov 2025 07:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1764246005;
	 x=1764253205; bh=sM3zD+mOnITtJ9F2JG0yeMKEXacWXE8JL0HxA96TrJI=; b=
	az0Jui6SJVlGY1WQSktongf+DQpnFhjn5+MDJKbtn6yUmbdYYWjXaRed33+9SNKP
	YfPpU5/v60Ncn0T/CPmv9z0lwJrD/pcQ8sYrOyG+6kZu3LrIf4GdrrWOAdZHVlDq
	4uFgwwvA9ktHNIjIzbzdbLoq6Fu0Qb0e1m3I93J+wA9p+iuNOTx0Hbb+Zt9ahTB4
	1m6o92dI9fg2zcKaDqXUtrfYX38D+inI7FsW9FUhHST734Lmmg+HVk4T6ypHXzeU
	J113+bVZ7uyrVvybwlqYRveDtcMzzRJR1WPGw5Ka51n1WVwLK0K9fV0XxZwujeIv
	e1fnHB4tqTe5hMS/i31jtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764246005; x=
	1764253205; bh=sM3zD+mOnITtJ9F2JG0yeMKEXacWXE8JL0HxA96TrJI=; b=q
	k/pU+f8o2xuvEXHdHdJF/ptzEA56RCHHXJFuBExVSC8orUPlqJw/AIPLOFw8TBZJ
	/d4ZbTGl8TcQ4G26SeY2rd8ZrwiwnW8TuzkWDWtLFjrQLgatRFrn+bYpFWxLrNWC
	RRrGH/ccH5CeNPRZlYRoHB0mHLc60HXvrkIZ0QrecCPGC0ndV3RkN/jI3FIdzGaG
	QelOYE5w20xRoJO1Qba/AVOcH1lslfT6FBNw7AD14z6CjJg+99Dv6TsGVhVBwTz+
	nTS5Dfou2ALinWBhBKHYOn5qoRJLVR+d1mDQcYzNzM0HVUh1/sF8b61yzptpbKu5
	cpiM+onI2AczDgK7mtLlQ==
X-ME-Sender: <xms:9EEoaTOc2bZJ-bMzEJnVO9g6PT6lYvMPaH0WOzoto2IeFupDyHyxmw>
    <xme:9EEoaWyQwaC1VYn-V06WincYJzQ-kdxtwgiWCuzJmLzMwEpCWNWnXBatacX7AefDO
    vkqQrEKflhEKCGxw7ywfES45v9oad-dRZHiZTQ_7ShbiD-CHA>
X-ME-Received: <xmr:9EEoaYnOJLlI5EAeMtv8qMAs7sK02YvihQmnHSMGJvyu9PVcz5vBUisExBRccud3aK_QDJNZhQeMaJrKRNZhXb3Pam7YcA6ONqAP8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeejvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefhteefve
    dtvdfgkefhvedvvedvudefuedvueetueduteejgeekveegffekfefgkeenucffohhmrghi
    nhepsghoohhtlhhinhdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
    pdhnsggprhgtphhtthhopeefgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplh
    hutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgv
    ohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvhhkohhulheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhishhhohhnsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepfihulhhfse
    hrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehkvghvvghrrdihrghnghesrhho
    tghkqdgthhhiphhsrdgtohhmpdhrtghpthhtohepmhhinhgrshdrhhgrrhhuthihuhhnhi
    grnhesshihnhhophhshihsrdgtohhmpdhrtghpthhtohepshhtvghrnhesrhhofihlrghn
    ugdrhhgrrhhvrghrugdrvgguuh
X-ME-Proxy: <xmx:9EEoaeV7EwwzsZ2HQiAo2fEQpvlsJ1wGGAwchd69fZLf4ph6yCS7EQ>
    <xmx:9EEoaZ0ftNEmtV8XNHZl6FoPmPZ0kjOVy9fn2Ig4vUb-pQWdja5bpg>
    <xmx:9EEoaekYNad9XVy-y5CM2nw3630vz52mOwK6EVZIt6dlvXe1ZNYs8g>
    <xmx:9EEoaQEquoa2rwLVTrZyXXq93MF1NaDgoBkI5tDhXCeRP_-XFBG1XQ>
    <xmx:9UEoaUaKdpX-AbibV2W5OQy1HlJC2U05OYLnsD2QWCahwORmfif_J7oU>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Nov 2025 07:20:04 -0500 (EST)
Date: Thu, 27 Nov 2025 13:20:02 +0100
From: Greg KH <greg@kroah.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, William Wu <wulf@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
Message-ID: <2025112725-enviably-ground-9342@gregkh>
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com>
 <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com>
 <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com>
 <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com>
 <DEJDSE73CJES.2AB8YSKLW6VE1@bootlin.com>
 <DEJEFLKA9IJR.237ZLV8HBD2VS@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DEJEFLKA9IJR.237ZLV8HBD2VS@bootlin.com>

On Thu, Nov 27, 2025 at 11:18:45AM +0100, Luca Ceresoli wrote:
> Hi Théo,
> 
> On Thu Nov 27, 2025 at 10:48 AM CET, Théo Lebrun wrote:
> > On Thu Nov 27, 2025 at 10:22 AM CET, Luca Ceresoli wrote:
> >> On Tue Nov 25, 2025 at 4:28 PM CET, Théo Lebrun wrote:
> >>>> The code already checks for !rport->suspended, so add a guard for VBUS as
> >>>> well to avoid a disconnection when a cable is connected.
> >>>
> >>> Your commit message was clear but I was missing one key point: what
> >>> rport->suspended means. It isn't what I first thought. Instead it means
> >>> phy is powered off. Naming is bad but unrelated to your series. Maybe
> >>> add a comment to your commit message like the following?
> >>>
> >>>   The code already checks for !rport->suspended (PHY is powered on), ...
> >>
> >> You are right. I have added a slightly longer text:
> >>
> >>   The code already checks for !rport->suspended (which, somewhat
> >>   counter-intuitively, means the PHY is powered on), ...
> >>
> >> Still worth your Reviewed-by?
> >
> > Even more so.
> 
> Thanks, v2 on its way.
> 
> >> I also added the Cc: stable@vger.kernel.org line, which I noticed being
> >> missing.
> >
> > I never add that Cc trailer and only rely on `Fixes:`. I thought it
> > used to be documented as an alternative to that Cc trailer but it does
> > not show up in `git log -p Documentation/process/stable-kernel-rules.rst`
> >
> > There is one indirect mention of "scripts that look for commits
> > containing a 'Fixes:' tag":
> > https://elixir.bootlin.com/linux/v6.17.9/source/Documentation/process/stable-kernel-rules.rst#L132-L134
> >
> > Anyway, you do right by explicitly tagging `Cc: stable@...`.
> 
> Theory says Cc: is needed:
> 
> > Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> > process nor the requirement to Cc: stable@vger.kernel.org on all stable
> > patch candidates.
> (https://docs.kernel.org/process/submitting-patches.html#reviewer-s-statement-of-oversight)
> 
> But in the practice I happened to forget Cc: stable in the past, the patch
> got applied and the Fixes: tag was enough for correct cherry-pick in stable
> branches.

That is never guaranteed, it is a "best effort only when the stable
maintainers are bored" type of thing.  Always be explicit, and use cc:
stable, as the documentation has stated for the last 17+ years :)

thanks,

greg k-h

