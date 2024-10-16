Return-Path: <linux-usb+bounces-16300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1B9A03D2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 10:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D6C928AA72
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 08:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AF21C7B75;
	Wed, 16 Oct 2024 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="vjKQAfok";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m06wE/9/"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3FE187850
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729066281; cv=none; b=NzTVEd1puW1CLGU5UZcySVQT136SVIt6FzhWUhq7poLNEHa4CH3KY6qwzMikij2mVpytt4mtOL2geC3EU+5bQUu9R/HwUvhOa/7a/bmWGww7gicMlMcn1TmdbpqsnwvjWcJCh0F/nfUdbWGh6O+iFxERuCPkIQikFcB5yaP74hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729066281; c=relaxed/simple;
	bh=6kFnq4JNHXGSAvXmYCOvF1VDm9ALNtpwRNhD1VRo8GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmEsjkjHnRbOK+Yw9IyHfDqtsfhvIFNPVx1/EHVR2V660ESfqAcZb0CBIpmmFVWTm6zIZcMpVrOTXuZGSqTxlsejAaSpVL/4UqIBVgif0qmyfGZEKnFYjCC6wanU27APoJ61lr2t9Ok4T2FNEZMkFaHR4ilaS2O7ozzouS/oqhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=vjKQAfok; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m06wE/9/; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D090411400AD;
	Wed, 16 Oct 2024 04:11:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 16 Oct 2024 04:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1729066278; x=1729152678; bh=gRfA+IEdlJ
	qraO3xpVRWRey2Z3IOyPT485pP7zuo1dc=; b=vjKQAfok4vQ5nNh+6zCGNokJCm
	hz3/DCUYe6C7JkIfZeetxS6IwVZI10TvH7xSgVNKDYIu0ouJuTOWB+YCe/lbE91t
	E6x46moBqa9JgYG910Ou3S6V+k3ojT+VdlGdUNyLjpXvfElFnAMSi2jAunCo1DUS
	pExHyDHzWdIBvcDcNtKnItQyl2MGAIauBNf4InHK7JVLuIU+tuJTO3SKaGPvhbgw
	FN/9vWpbLdRpERqClbmrTPiva+y1C90GdV3cT3XXX2aAVg+zgHrzptUIC0nxjZY2
	2qfsAPXAE5yTl2ZY4jTDmoJbUXwYSvNO1JMzuNewqa/i1GxTUKwmFhXucp5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729066278; x=1729152678; bh=gRfA+IEdlJqraO3xpVRWRey2Z3IO
	yPT485pP7zuo1dc=; b=m06wE/9/LTWJtJr/Sf3NzTopZbpgDklI2l5LvRKW6buP
	eOdLjHRFpSI6UUcNIPa/MBpc53xReF20NhLJX6uSZjzKNztz/4uJzhvx1YCWGnVW
	facnsFPZkdg0QiU7HDtwoy5bVhqGGpHxzhwyTIF1+g2AjQJqgwuepSk/jijCt9Um
	WHUBdfLtPVWso9Hon/YNQCfOBLZd9bHf9lX+l/I+N+3vZRhfz6KdPLuqB69yYDci
	z7p8PgUVIFmGiBFdrp3Y1yFR5F66Th9yXRBAuV20AMFweU9G32h7zyAS8Red6GRm
	Z9vZLninjIOpouBedak2cS+Cy8qnX4kcNYyZBi8i+Q==
X-ME-Sender: <xms:JnUPZ9vzZkJLKiDJhBDEWf3HZU37APg6SE1BCiOYZNLRj907zDqENg>
    <xme:JnUPZ2eyxsRsCBDDwoF80k1l8P2Z4K0eO-j1tczCdUT5Hzt_KJajKXc0enoRN2F1p
    A9yFStR8yK_jg>
X-ME-Received: <xmr:JnUPZwzYNg2TrXL77o4Vb8YUT4nnpSZX-NSvCREM_4CM8L9T3yAONFoouxPe7Vtd35CSdi-t3AO79Te86bGIkYb5VgJ2vRVAe066yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegledgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghg
    sehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduud
    fhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspg
    hrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhdrlhgrnhhg
    uhhfohdrlhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhushgssehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhnvghukhhumhesshhushgvrdgt
    ohhm
X-ME-Proxy: <xmx:JnUPZ0MxaL5CttilDRFWODvraMxuLjXFa14UPP11-_kvNShNqYU4zg>
    <xmx:JnUPZ9_vpm6GxvdQ-qYctucAob-_QNr1EJIMV-Ibdh5kcKkBuLVKfA>
    <xmx:JnUPZ0UYER240VNTPQQez3R1fn9LafkpEI6U1nDMaTfLDyNztWS_qQ>
    <xmx:JnUPZ-fkTmSZ_UlNjYJQBjeXmIxhxOxoxy9TzKsJvw1nnvjOQTYhvg>
    <xmx:JnUPZ9wFtfQgvf0-cJ-a0k63uQIF0Krl-NEXcH50OZrMIh8UhO4yN0NR>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 04:11:18 -0400 (EDT)
Date: Wed, 16 Oct 2024 10:11:15 +0200
From: Greg KH <greg@kroah.com>
To: Fabio Luongo <f.langufo.l@gmail.com>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com
Subject: Re: [PATCH] Add support for JULABO PRESTO to cdc_acm
Message-ID: <2024101624-stimulate-unbend-89a8@gregkh>
References: <20240927134404.110284-1-f.langufo.l@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927134404.110284-1-f.langufo.l@gmail.com>

On Fri, Sep 27, 2024 at 03:44:04PM +0200, Fabio Luongo wrote:
> JULABO PRESTO chillers on Windows use the usbser.sys driver
> for communication, so the same functionality should be achievable
> on Linux using the cdc_acm driver.
> 
> However, cdc_acm does not accomodate the quirkness of these devices,
> as they fail normal probing ("Zero length descriptor references"),
> but they also feature a single USB interface instead of two.
> 
> This patch extends the effect of the `NO_UNION_NORMAL` quirk
> to cover the features of JULABO PRESTO devices.
> 
> Signed-off-by: Fabio Luongo <f.langufo.l@gmail.com>
> ---
>  drivers/usb/class/cdc-acm.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index 605fea461102..d77c84c6e878 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -1210,6 +1210,8 @@ static int acm_probe(struct usb_interface *intf,
>  	if (quirks == NO_UNION_NORMAL) {
>  		data_interface = usb_ifnum_to_if(usb_dev, 1);
>  		control_interface = usb_ifnum_to_if(usb_dev, 0);
> +		if (!data_interface)
> +			data_interface = control_interface;

That feels wrong, how can we send data out both for different things?

>  		/* we would crash */
>  		if (!data_interface || !control_interface)
>  			return -ENODEV;
> @@ -1284,6 +1286,8 @@ static int acm_probe(struct usb_interface *intf,
>  	if (data_intf_num != call_intf_num)
>  		dev_dbg(&intf->dev, "Separate call control interface. That is not fully supported.\n");
>  
> +skip_normal_probe:
> +
>  	if (control_interface == data_interface) {
>  		/* some broken devices designed for windows work this way */
>  		dev_warn(&intf->dev,"Control and data interfaces are not separated!\n");
> @@ -1303,8 +1307,6 @@ static int acm_probe(struct usb_interface *intf,
>  		goto made_compressed_probe;
>  	}
>  
> -skip_normal_probe:

Why the movement of the goto tag?

thanks,

greg k-h

