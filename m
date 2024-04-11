Return-Path: <linux-usb+bounces-9265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55D8A16D1
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 16:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E3C28CFBC
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013E414D45D;
	Thu, 11 Apr 2024 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="LxZC8FX9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pJwti5Ng"
X-Original-To: linux-usb@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D5E8C09
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712844707; cv=none; b=ptTPBIqXLagyLiBT9/jPGQnZsk+6rU59x3cHh8cSvZjk8Z+xEYYEjdfql04/0X32EKPspvgjA0b6EDdoH1/qadD7SlPlmZJK/LGkt2DwRzH2rLvfVekv7BiHfpvy7nQpDa3klIXdNZZ0F0k5Cl9hlYnSWb33nqYtrfr6wshKS7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712844707; c=relaxed/simple;
	bh=Db/ALHA0x8gVdRaYwPZdL8QfyzZzkP6kHv2e/Y+rTQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+ElBi9Q+v5awAgtKHub6LRKOhks8RZ0vXugBW4NfjvzaCEnv0EVoYU9a85Z6r8RsTTXfDmEA37MjGucHHB18YFqOw3ecv6QaZEIzWMmzV+rc2VTtlLO9MHyNwZgFU2tQrskLwa4kbJG2bE6vzNsKoWjMeCIF8sv4uUdpLB3yVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=LxZC8FX9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pJwti5Ng; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id CC7A618000E4;
	Thu, 11 Apr 2024 10:11:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 11 Apr 2024 10:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1712844703; x=1712931103; bh=cbAdL22/WJ
	p6OqQWmrzqrYUNIeYSAZ2I9d0Mo29QVes=; b=LxZC8FX98AIVR3g1R02/f490vV
	xWjuK3JC15JpcMFUTuJ74o5shtM2v9NKAaW/IFctZ/oiOjnXrkVAECP2CK7kdGe3
	ss9Le45WsFJO7yqkp/nd4X+2LOp3HN6FOKm52CcN6s4VFWSlAFH1rrDTucocAtzG
	0EMpuzDE+vVttfQZzgEWtIwQuzRHjzLuAP3GF7HX6rKje98/cO1yJgk8it5qU13O
	XZABs7umI1u5IOEsLDk4Rqz03Gxnva2P1NZiwRsnL3wSGemS7SBktL3zBCad+COj
	Esz8hsU6LB3aRlT9EqQW4CRp/YTqanOR3XmHEGR9cFVZKJFG9GWdQhRiKEsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712844703; x=1712931103; bh=cbAdL22/WJp6OqQWmrzqrYUNIeYS
	AZ2I9d0Mo29QVes=; b=pJwti5NgLIsszkuK2HwiZkzu+igmx/p0za3RQ2tRtWJU
	MIEQch1WU/xgnTKrGWyW3pDgz0ZwN0xAVkNICwjKHaAK/Hyq/exKG6OEeI5kXkXz
	YmitoE42hVKqXr5Oo9TWwibTPCQCcZbx1+LAHwOZs0SsYw1PkvUYrg+cC9wb4qGm
	VoaReDpa67DXfud9fxvWYLso+60xpZkNB1vgMd00+4ftPJ/6nqTFG+1+xdGfBiTK
	naD/LzEESa9RYubRS7SnyIHeglWpWXKuWXgdUASlZO4WXXpVsV6XdujuaeXEN/jm
	cm0AfaHskSiSTrxBqJ9+AxT/DtyWPrB6BiA2UAoqwA==
X-ME-Sender: <xms:nu8XZnDkLxDj2FnYZ7lv93rOL9ENh7g9f9sk0S0hRrUAi2GsSVR4bg>
    <xme:nu8XZtj_1upU1aZFSW0mqa2VWGf5DUxEFoTql8GMTuHQY5ltDSbRC7SR848FP1oFY
    7qQ9Sjc3RkEJw>
X-ME-Received: <xmr:nu8XZilX50kmWTCQ6ZGavAp0ketO2M-6goVOlQ23Qgrq8oXlT3_kXXD_2SpE1LpjcukBW0J5K7I7IJxCRfp1ILI2ppTORvLXNMs0gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:nu8XZpxefnwD_02Py6mtknzwiUcIMwa5lDIHmHU7Rp2OwwuIJr8dKA>
    <xmx:nu8XZsQ04kbV6Q_SXWRtqk-gw5FcibZ6JPFo3Kw8fcnWdpTpYPwI3A>
    <xmx:nu8XZsYrT4f7iq5XCoUm6LTWtJPv7l8r8iMMXF_1Z9y0iecdxVc9Bg>
    <xmx:nu8XZtQYLz-FB-n4XlxevkgzsmD8Z_QL0OntGkqJ2TPndWNNASQ8jg>
    <xmx:n-8XZiNuE_0VqzpzBagMa1i-_VAizKiPS1gw9QjslW3AjNOxW9OWAuck>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Apr 2024 10:11:42 -0400 (EDT)
Date: Thu, 11 Apr 2024 16:11:40 +0200
From: Greg KH <greg@kroah.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC 1/6] usb: usb_parse_endpoint ignore reserved bits
Message-ID: <2024041115-aging-mankind-e69e@gregkh>
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-2-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411124722.17343-2-oneukum@suse.com>

On Thu, Apr 11, 2024 at 02:42:59PM +0200, Oliver Neukum wrote:
> We have to ignore the higher bits in bEndpointAddress

Why?

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/config.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 7f8d33f92ddb..c7056b123d46 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -279,11 +279,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
>  		goto skip_to_next_endpoint_or_interface_descriptor;
>  	}
>  
> -	i = d->bEndpointAddress & ~USB_ENDPOINT_DIR_MASK;
> -	if (i >= 16 || i == 0) {
> +	i = d->bEndpointAddress & 0x0f;
> +	if (i == 0) {
>  		dev_notice(ddev, "config %d interface %d altsetting %d has an "
> -		    "invalid endpoint with address 0x%X, skipping\n",
> -		    cfgno, inum, asnum, d->bEndpointAddress);
> +		    "invalid descriptor for the common control endpoint, skipping\n",
> +		    cfgno, inum, asnum);

So now we just ignore invalid descriptors here and let them pass?

confused,

greg k-h

