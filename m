Return-Path: <linux-usb+bounces-2274-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 520157D98DF
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 14:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CD071C20E9B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB072DF6A;
	Fri, 27 Oct 2023 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="tIrFEQyQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FV/6OOgt"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F832D789
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 12:47:02 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90833121
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 05:47:01 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 06DF932009CC;
	Fri, 27 Oct 2023 08:46:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 27 Oct 2023 08:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1698410815; x=1698497215; bh=S7
	YU3Vvyt4r4NmuvNnIzU8H6fMpanAG5nb0kLJ2J5EA=; b=tIrFEQyQrrvE5Guhs3
	J4dL8eQiBW7zApVwHRqMcTVMdRxZB60tAi9KENWYp15uzEK7mxUo7h+UrhvxsX9K
	nbUDoK1nd6eVpAlRAZfMGQqVxVia2wNgW1Yj5QOEcmNSgULpD8YEwmqylyoe62pj
	KV/gGQ+tvr9+lEyvM/hqqarbvzFZ5LUdIhOjxWqKde2uj3L8wgH9K58lIVYly/pw
	kwPK4EoEJBpoQDw06kN9DUAFJsIvdTT5jtiUhjOYg+L7agaBhVMyLjNtakGDvI2A
	0GQx2XQ38XRtKLvG7+Lp1khwYVQ3btgZXyEmfB2CpxoLMYWxaqvZ4+nSRefch4f4
	4UJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698410815; x=1698497215; bh=S7YU3Vvyt4r4N
	muvNnIzU8H6fMpanAG5nb0kLJ2J5EA=; b=FV/6OOgtB8uPzQ/UD3rP4QX9qsYT6
	OT4l1kDU44ZGIWrcsSEx9AZU9le8xJ8SvH4clxfJ7OiDZVK+4t4dtJs9ElLQ0bNl
	cJsq5YiEm7+M7uVJV4DWW7IvR7c1jBNHOCMsObfNCpWBfSkxrVuM6XFwXTeCfO+1
	ZQEKfFECJ6griVPf6WNrNTTypt6VKNV+aAHRK4RO//GbKsABeayRJzznZ2r9LeoZ
	c9jM/esDReOdVAwCxhwA4PoYpIzNuB92egRYut2ldWgjdzt7k4dS+/SxNfzUp2kx
	cfS2N3JKn8ulAebyN+KsMYZfM0w7YPKst+2Uy7MYkBQZmLJulrn/FDWfg==
X-ME-Sender: <xms:P7E7ZU4AAHMGSxnQquUs6UI2xhOI-snxJ2_3uhUywNi8P28hVSGGag>
    <xme:P7E7ZV5RJCsBSDTD8hqOaLyXWhKQP0ynNSZKY0N5MCMsDNnw90g5uRd7uZZ2qYm6g
    ddMQWBgz4c8dw>
X-ME-Received: <xmr:P7E7ZTdxmX1-W66Mb-bhrLlFZr58jzl0uZ3E2MU64TdgvrEgvPoYUPeHHgxO0s1OMLfvTH8B-q7yR_3P2QJpVi8i97zkHw4ioXgKXgS5sw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleeggdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:P7E7ZZIKpKtu1NM0nIYi4SkZEfOyodf1V9D0wFoF_htvkNGEjzaP0A>
    <xmx:P7E7ZYJwMw2tQrYTIMU1L7KrBdcUCaczgcY7QQsiC5ksORjWsxXCoA>
    <xmx:P7E7ZaxPusqpxrdUUsye1EJAv7WzKSxwKqyxDLRV0wGJcvubMkG_tQ>
    <xmx:P7E7ZfVLF2TIbWGlaUpBuqgPcB_wQypU58dSRi2qLK75XxML0jUKPw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Oct 2023 08:46:54 -0400 (EDT)
Date: Fri, 27 Oct 2023 14:46:52 +0200
From: Greg KH <greg@kroah.com>
To: LihaSika <lihasika@gmail.com>
Cc: Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] set 1.50 as the lower bcdDevice value for "Super
 Top"-device in drivers/usb/storage/unusual_cypress.h
Message-ID: <2023102729-spent-ninja-7e39@gregkh>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>

On Fri, Oct 27, 2023 at 03:37:51PM +0300, LihaSika wrote:
> > - Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
> >    and can not be applied.  Please read the file,
> >    Documentation/process/email-clients.rst in order to fix this.
> > 
> 
> Oh right, Thunderbird wrapped the first line of the patch file -.-
> 
> Disabled wrapping, another attempt:
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Liha Sikanen <lihasika@gmail.com>
> ---

Sorry, still needs a valid changelog and subject line.  read all the
errors that my patch-bot sent you.

thanks,

greg k-h

