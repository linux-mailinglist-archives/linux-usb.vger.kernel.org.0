Return-Path: <linux-usb+bounces-9268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A128A17FA
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 16:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F07C4B2267A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4794BDDDC;
	Thu, 11 Apr 2024 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="nHzopvCQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N1DpaRSt"
X-Original-To: linux-usb@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD553D520
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712847500; cv=none; b=jsrLr2HZ8b9dmO2W02c+3ojhpfXCHv8NkbPuWXu0WBl8rgEOmSiz5IRJ9u4mixONdhCcvxxEbP73vO3xs5N9AZylgYumM1ThTWtUwi2ueivt+zOqkLDZ231qKhc3VjHYyvTDjvK+I/TAoo4U/VG42oIRDs9QnFTptjFaOPEefj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712847500; c=relaxed/simple;
	bh=mnMbwbh9zbrpgerR1l4mslSY+NKs2ebjXY4qhWv0jsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1CfOuI5v3r6Oe9oz8LJBamMk0s+w4wUJA6mR1G/V0d1Qhws2Lqtu5b+loB7yFh/o4UtG50+QUT2UW6bsrAPjGSFlPrTZYTrOBWgpHC19910BN8HkhDV0H5xAIeQ4q7P9wARqTHMcSlifajozE8zDDRGDq4WYfui+YSP6rRqcLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=nHzopvCQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N1DpaRSt; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id A09D91C000EE;
	Thu, 11 Apr 2024 10:58:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 11 Apr 2024 10:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1712847497; x=1712933897; bh=FYTjA6RY2B
	XWjIRxr3W8fDZE75oAjF9LOQCvuOdR5Mk=; b=nHzopvCQ4Ef12+BanmWPXoiV1+
	4uQv7lRmSfe0Fcq4twPCSBaGkzlDMe1zTbXhnjxbVUFHY3izXKSn89W1nLIWSXGF
	Fdc5AwpTlPGFh2Vi0tNXoMHAbrlxCvgliPjLVi4XuLPI/bpYKpyOS9tuN8U3bhxs
	RH/kdIHVi+l0AEPWVpEdw/eaYJ54Kjp9ekTsSang9SC9pIO+YR1tSnclivUar6Bf
	T9xiXEf/P0xRyq0HVqnTOncZXh/HEeYIa3i21Gm04scZwJAz5KTY77KTNrYOQQr2
	YphspNOnt6kYuokwjNvnjifc66QlTl3bkkKaogvQnp9UDL+7M+w3MEjOjfqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712847497; x=1712933897; bh=FYTjA6RY2BXWjIRxr3W8fDZE75oA
	jF9LOQCvuOdR5Mk=; b=N1DpaRStH+2+aIK1jlZZlLVoeS4IieaSkLQGzHZBBZUr
	qmZ/KMkdW5s7Z9yuRljz5P+X8cczv77F9tAi+KgJzSly0ttKVlX//PPOCNC0yiKp
	rcy1u2hqk6s3cSDSYm7O1zIHniVmM+vx2wNv/cdITlTVOUyZqH719Yk5Hq8m6IZ4
	1BTiY0UxyE2faBVIoGd5IdppDh413CPJedvqgpi4bysHX9pvDyjQcC59VLSTFmpT
	/cOQPeIS+AZAr1dLwiRpj77atUo3lkkfEQLsIn2HDqEQgdEc5vdxytSu38KuCQNg
	Eg8SNn4QcDN2Zp6husYAPgRSr085KY7SmJxqzcrFZw==
X-ME-Sender: <xms:iPoXZvCdRwCudTj6Ar0KAF-jjgkS2lm8I_GdWYxSY8EO6711Yvr_LA>
    <xme:iPoXZlj7mXd6JKy64LRiUnWvB8zI5x4ylQ84-x3nyEmfle64gibmxCoswsljkv3Q8
    WWMLg_iZIUJDA>
X-ME-Received: <xmr:iPoXZqls4UDjO7fSrnVl6GiR-A04PFXfMp9Gb6pZP5YIQpvhrXgnT01XYSVcX7YbBTlZZpNaHalx3b2Ga9jLEbKlwX1Rm5WDaug0uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:iPoXZhyGSiYh81Ex8q3lIiblhkE2SSoW6jxqm3ZIhdXksgV9I9euTQ>
    <xmx:iPoXZkQGTGhzHxiav3QYaHVhnRVtXRRyLLWl8HTQfvWORy2osdpvUQ>
    <xmx:iPoXZkZflvW5OjaItZTbrY-wnJmwaWteWBJFSdA9fd0evCPxH2fsug>
    <xmx:iPoXZlQGxaX73xandd3NtYFjHqpmwux6qS2txjT0YrYguRsYil9PZA>
    <xmx:ifoXZqOLaSjIiNpkkbMpMbILw7vzoMxkUw-SSJiEODQH3cnW5U0xmJm5>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Apr 2024 10:58:16 -0400 (EDT)
Date: Thu, 11 Apr 2024 16:58:14 +0200
From: Greg KH <greg@kroah.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 1/6] usb: usb_parse_endpoint ignore reserved bits
Message-ID: <2024041102-freestyle-consent-e96a@gregkh>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-2-oneukum@suse.com>
 <2024041115-aging-mankind-e69e@gregkh>
 <4c761c2f-76b7-490e-ad1c-ecf1376aab74@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c761c2f-76b7-490e-ad1c-ecf1376aab74@suse.com>

On Thu, Apr 11, 2024 at 04:27:26PM +0200, Oliver Neukum wrote:
> On 11.04.24 16:11, Greg KH wrote:
> > On Thu, Apr 11, 2024 at 02:42:59PM +0200, Oliver Neukum wrote:
> > > We have to ignore the higher bits in bEndpointAddress
> > 
> > Why?
> 
> Because if we do not, we are breaking compatibility with all future
> standards that use those bits in backwards compatible manner.

Ok, that's great, then say that in the changelog please :)

thanks,

greg k-h

