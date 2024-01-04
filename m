Return-Path: <linux-usb+bounces-4719-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B9823D4C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 09:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A5B1F2552A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 08:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE9D1E4B2;
	Thu,  4 Jan 2024 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="R/kXja8l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="An2sFedS"
X-Original-To: linux-usb@vger.kernel.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A54200C6
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 08:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 547CD3200B2C;
	Thu,  4 Jan 2024 03:19:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 04 Jan 2024 03:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1704356388; x=1704442788; bh=f1Bfd2d5cV
	/gqydNKEAHaOK+K0MU+CMUOdj0zAhLf28=; b=R/kXja8lZI3qSaT7sytgfrmVNQ
	o1WLVw+1acKjEZUgY294U8xKSDpl3LrksTt86qW2e4DA8udOuTpXwk3JwYua+BGJ
	ifE6RUHi/vV/pBkWPTYthbc8tiU08agZSREPh87m5dDk8Ks/iv+weal9UU9Md5Bc
	STWHQJKXMGcZJ5cz9FiQlle/KI3G9N1uaw7cCc7meG2oecAx0iBSJbYB2dJC1jgs
	nttestob2ak4XObhZwxlB9vF+blAfmp7+VgFNVaTrFobh+YKMWbPvqJXzUYmyOXU
	XSoNMzlU5iORaeIV3sYr4pbNFaVhlLHF3gI2n9ky+vNFA3kUmrRAhCUYtN9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704356388; x=1704442788; bh=f1Bfd2d5cV/gqydNKEAHaOK+K0MU
	+CMUOdj0zAhLf28=; b=An2sFedSNHyEFjcRT8Cq8Aeii5Hysx83GODCyLZj6I24
	DfbjWgVIYx28Qj0e1T4dXeRhhQWB+NX49DjZKVzrl1ryjoOa9N0wNSx4+nHkCHxJ
	hsSGR7ZoSUHWCFfvd6OkjsQyY6mjA6aMBfnh9BwDfTI152I4p0/XRA8wksul2G7K
	EX42tTxOluFa+OQU9ItWVKHdjXvkQ+U2+I4XxdrpauCrQpENLmEs6mZcSed0eSRv
	OmkD/rbg4WLZjdzLUIMro4wIPXsrLjVV9TC0fpTFVIO6uK7t54n/t2y4/TYljm16
	6v1dzwICT41PJIH8dyIufzWtmDuAonbHUDqhZPxQ7Q==
X-ME-Sender: <xms:JGqWZYfYPqtQ2c--3RzNbmRtc3iEjb1JFESYiIlGa4xTxDtmshBnaQ>
    <xme:JGqWZaOXtVbNF94RzUnd0hACHobFluX4mIpW9eKazE6OLZvizae7v6QjdqDwawpep
    MUBBSBUO6tp-w>
X-ME-Received: <xmr:JGqWZZhaMi24rUUqNmVV6K9R5qj-j-FBOg3sr0hfRBIPaLFzqA-QlOmRGcBwz6m1u5bCuHN2ZMaPWXP3HvbdqG4csqsZlNEaLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegiedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesth
    dtredttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtgho
    mheqnecuggftrfgrthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefud
    eiffdvudeffeelvedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:JGqWZd-O2BTJBzB4LI65WxZ4kRVGHLlQCL3T0QvfYtJrx7j7jX9WSA>
    <xmx:JGqWZUvzaMS7cILxSvhmpevstCDlkxhagqvvk3aG-vCJNFuUi-IoLA>
    <xmx:JGqWZUGVT79kLoJ3YF0Q59IcD7lpmSSvdkHUSS9RHCgJt_-5N6ufFg>
    <xmx:JGqWZd7-RPwqChMSi5ZGlchX1w4VX9mLWmNCU7IOhbuOJB_dlMVRTA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jan 2024 03:19:48 -0500 (EST)
Date: Thu, 4 Jan 2024 09:19:45 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 218338] New: usb: cdc_acm: Support for Uniden BC125AT radio
 scanner
Message-ID: <2024010455-rigid-reenter-3a11@gregkh>
References: <bug-218338-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-218338-208809@https.bugzilla.kernel.org/>

On Thu, Jan 04, 2024 at 01:23:18AM +0000, bugzilla-daemon@kernel.org wrote:
> The code to add in /drivers/usb/class/cdc-acm.c
> 
> ~~~
>   { USB_DEVICE(0x1965, 0x0017), /* Uniden BC125AT */
>   .driver_info = NO_UNION_NORMAL, /* has no union descriptor */
>   },
> ~~~
> 
> Reference:
> https://lore.kernel.org/lkml/20180706054524.670321998@linuxfoundation.org/

Can you submit a patch to the mailing list, as documented, that adds
this change in this same format?

Otherwise we can't do much with just this bug report as-is, sorry.

thanks,

greg k-h

