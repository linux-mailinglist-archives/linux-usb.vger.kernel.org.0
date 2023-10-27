Return-Path: <linux-usb+bounces-2286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A57D9A7B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 15:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F38EF2824D7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 13:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73C9358A1;
	Fri, 27 Oct 2023 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="gjtR9GN3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PtKa1BPV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95F34CCD
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:53:12 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18ABE18F
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 06:53:11 -0700 (PDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id 4749032009DF;
	Fri, 27 Oct 2023 09:53:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 27 Oct 2023 09:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1698414789; x=1698501189; bh=nz
	UKPpfI+St0iBuzrFAMO6Du+PJNWCmJ85GIelszK0M=; b=gjtR9GN3TsQ92OzB5V
	vD1WrlEUzkywKbvDy2CPDsE9DK7kItTba43JDEfNW+5N9FslVMJIeIFbL9Y0aKOy
	5Mx98gYve1d0bE+xPlCDLsh+jmCtuyZOHbXLZRdnRRnIR18KivwdhnCyT8+Q4vJY
	+DKG+wjq3pndpTZaPPfA9lW/RHXOcFaGMY7/zAemlA0bKnCcrNN/a7ydaQLI9DU+
	ASGpkAnn3d8XX8plFLZATuugCeo2Xn1nHIrxiCmsh91kpXSv1IYRI6Ne+/vP8IV/
	Z6q0Xl5U7rdegRBjfffYwkKOMyzY18YsKkt9rw1JMaVZfYGZshO3wmPV0DFev1P7
	HakA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698414789; x=1698501189; bh=nzUKPpfI+St0i
	BuzrFAMO6Du+PJNWCmJ85GIelszK0M=; b=PtKa1BPVQ9RM2jkVhkoPy52UQhxwD
	O99BCKX+3PLY17MDymm72OYvMnkmr83xHj+mqm723BkYRvBv55z3I9W+dghvXfY1
	4V4ODja6VuWTARIjrEjRJJK4Jus2RqnCM4ggiBvN+jPD9jv8+Z3XydP41QOOSJJQ
	eKo6AuIEReg1fGcX0CwBAYzTDrKNBe/y3evCkYze3MtCjK6FxPb3D34AC0J6irot
	hYUsEKYxg/fN/9UxDxTs2USAwt4uXa6MgJBsaw4512XA5nYcVkqDY+dR1wOgj6/q
	pb6iNJW9gFtNqnxb0es7AxlL4uYXE+P/nwgGqBMe/xl/UTFlw3hQeSX6A==
X-ME-Sender: <xms:xcA7ZYpFO4a304MkPiDHXDDN3j7yTQuG_5pvUXaN8ARDs_x4gH-VZw>
    <xme:xcA7Zeqz5HaKEezi7M7-K1lMl76_4vkT3MtjeK_t5E0mUNUcYQT1zph0jFTubvtwj
    JgzK_s7ffHK3A>
X-ME-Received: <xmr:xcA7ZdMuHdg2ZW2V-leuTclox2ya8jh9fOioechpDQBYYyQgIzf-Admz9DBstsyCz7C_AmNo_5sqpb_r3yJ-faI2TL7xSE-WhfAKMnvIjzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleeggdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:xcA7Zf7t5aXDD82VJQTijWYP324w-6stxt7rsR083DDINHZceVvmJA>
    <xmx:xcA7ZX5NJB23JSjzzWIJZsk4wCei7JGF9afqQj-POA0h2oprWjB8vA>
    <xmx:xcA7ZfjOIjvpzOKyrCV5RRAJrHPjbSEYIlIKxFPzDA20hx63UlUC_A>
    <xmx:xcA7ZXFM0H-trzU6ffleNjCaV6cPy6kTZNo7ail9Cm3klVPq_p-Hqg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Oct 2023 09:53:09 -0400 (EDT)
Date: Fri, 27 Oct 2023 15:53:07 +0200
From: Greg KH <greg@kroah.com>
To: LihaSika <lihasika@gmail.com>
Cc: Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: storage: set 1.50 as the lower bcdDevice for older
 "Super Top" compatibility
Message-ID: <2023102720-emotion-overlying-9bb4@gregkh>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
 <2023102729-spent-ninja-7e39@gregkh>
 <037e5af2-3afd-4a37-a4d7-6dc87af605c7@gmail.com>
 <21c2b8ee-7753-413e-98f9-d1401edf5c73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21c2b8ee-7753-413e-98f9-d1401edf5c73@gmail.com>

On Fri, Oct 27, 2023 at 04:41:23PM +0300, LihaSika wrote:
> Change lower bcdDevice value for "Super Top USB 2.0  SATA BRIDGE" to match
> 1.50. I have such an older device with bcdDevice=1.50 and it will not work
> otherwise.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Liha Sikanen <lihasika@gmail.com>
> ---
> 
> diff --git a/drivers/usb/storage/unusual_cypress.h b/drivers/usb/storage/unusual_cypress.h
> index 0547daf..7b3d5f0 100644
> --- a/drivers/usb/storage/unusual_cypress.h
> +++ b/drivers/usb/storage/unusual_cypress.h
> @@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
>           "Cypress ISD-300LP",
>           USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
> 
> -UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
> +UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
>           "Super Top",
>           "USB 2.0  SATA BRIDGE",
>           USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
> 

Much better, thanks, the subject and changelog text are great!

But the patch is still corrupted, with tabs turned into spaces, and we
can't apply it at all :(

Can you fix that up and resend?

thanks,

greg k-h

