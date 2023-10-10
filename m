Return-Path: <linux-usb+bounces-1329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4A97BF28B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 07:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0813D1C20C3B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 05:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58ED8F65;
	Tue, 10 Oct 2023 05:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="xNNRfX7r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r1vMkw/j"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EECF9442
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 05:57:54 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F127B6
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 22:57:52 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id 4AA803200BC3;
	Tue, 10 Oct 2023 01:57:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 10 Oct 2023 01:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696917468; x=1697003868; bh=5A
	KFdt/3iV1fubpMu4B4EfoivMQ+/ZX+Olv4VrIvjjY=; b=xNNRfX7r+ElMiPOgXs
	Tt5lTBE7BmHjUe4jvDoPX4DMum/0HMeISJXnLWVzQa5RMsJ/1XEjNbPq07mXESSL
	Grkk/OAuShlFXLDj2uce0Xt56o1A3pBG1ry3m8MSmHbHVDA3KdkLTHZzvc7L+Oom
	ctmVcWqWCa7AA3j80UyS8o4TKBitdhbfT57N8JlgPnlRzKhA1mE3+8smb6QTjZSx
	kmZQxNvq0DzuupYa2gZrVryE5KnZ2oOI3ykhu6C/x5Yiaisn+WNeJ8p9GdC9GTF6
	pNDWbkWCPZMH1ZpnH5kBAuZfBYfqI8ofsX9ByJzqynfiAzUYHj+0qN/o9UejB4Kh
	Bgug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696917468; x=1697003868; bh=5AKFdt/3iV1fu
	bpMu4B4EfoivMQ+/ZX+Olv4VrIvjjY=; b=r1vMkw/jfEtCTjvzXEUo3gZde5PtN
	klBiWN/9I4bV1WY4OQ/hXjwrxzyrvcqobZzXouqUW04M0SKTCFwsT1fw3LCdNQAf
	ERBjz6tk4Z9C9orzQJy04y1GOggaBTUhnyLB+l9vuGHjLzVY955kWHx/mC0uFGgX
	P5IsoET6wzGv6UdDXtvzrmRW8R0M9Gd+kII9mQE/zLajfFJ49obvvrAGkm8gM+P7
	rpBuDhzpXDXuF4buDyuvhRqYCF3F0T1deSAAZ0zoEOAYlrvznel9x22cvLo62ytp
	WrdBqvm2DynmF5hSBNNgDcbSVjrfk9IuvFxC1VASw9IXReoo6Toy7UTVg==
X-ME-Sender: <xms:3OckZXgHxyqyu-isOnyp6bDaA0r7MYPaE_HlYvlr5LEqxWOQdPk5tQ>
    <xme:3OckZUAaCkKtVYPLB_mqAFK42KB42Q10_DRcHOSIEHUQjlsrCxDahjExh-BlUfjd-
    MAG4pcnnx4ZZg>
X-ME-Received: <xmr:3OckZXEFQ9yW8xz3BQQas_nT3dePW0uSCigi39GiaRvLNEqys9QwhsTgpCkNApuNBJmiba1v6GAkxQMSVGD0yPHDO-3B0SnCDzYyX2Tu4YA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheeggddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekje
    euhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:3OckZURDfEbNeqQC4TScA4tZwAgJvkVCnaI4HcYvk_rDzUcV3AlEmQ>
    <xmx:3OckZUyAS96WIimVYLAupW4UZbQRUr5XlK_5NvZSRgD-j9KgImzB-A>
    <xmx:3OckZa6EYCpHpTy3AcMb47aTQoXHHs05694zFQ4yMxIxSNaU2dZWlg>
    <xmx:3OckZbk6ZXjaPlamlw5Qu26WOh5LbS9LLYo80o49UzT2GBL8deVU8w>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Oct 2023 01:57:47 -0400 (EDT)
Date: Tue, 10 Oct 2023 07:57:44 +0200
From: Greg KH <greg@kroah.com>
To: dean@sensoray.com
Cc: linux-dev@sensoray.com, balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb/gadget: function fs req_match endpoint address fix
Message-ID: <2023101029-granny-defy-c4ac@gregkh>
References: <20231003221103.1607964-1-linux-dev@sensoray.com>
 <2023100506-veteran-foil-cec0@gregkh>
 <b08c24f9021b5c2fe1917cac18d65422@sensoray.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b08c24f9021b5c2fe1917cac18d65422@sensoray.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09, 2023 at 04:29:48PM -0500, dean@sensoray.com wrote:
> > >  static int ffs_func_revmap_ep(struct ffs_function *func, u8 num)
> > >  {
> > > -	num = func->eps_revmap[num & USB_ENDPOINT_NUMBER_MASK];
> > > +	u8 addr = ((num & USB_ENDPOINT_DIR_MASK) >> 3)
> > > +		| (num & USB_ENDPOINT_NUMBER_MASK);
> > > +	num = func->eps_revmap[addr];
> > 
> > That's messy, again, 2 arrays would make this much simpler I think?
> 
> It's similar to the approach in composite.c. v6.6-rc4, line 1013, but yes 2
> arrays would be simpler.
> 
> BTW, should composite.c at least get rid of the magic numbers?
> 
> composite.c commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
> line: 1013
> 
> addr = ((ep->bEndpointAddress & 0x80) >> 3)
>      |  (ep->bEndpointAddress & 0x0f);

Yes, it should.

thanks,

greg k-h

