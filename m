Return-Path: <linux-usb+bounces-2058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676197D25E3
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 22:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A31EC28146B
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 20:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3078A10977;
	Sun, 22 Oct 2023 20:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="NhuAjGG9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lenZ7wiu"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9F62B
	for <linux-usb@vger.kernel.org>; Sun, 22 Oct 2023 20:39:16 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8115E8;
	Sun, 22 Oct 2023 13:39:13 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 986E55C026F;
	Sun, 22 Oct 2023 16:39:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 22 Oct 2023 16:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1698007150; x=1698093550; bh=doL/WjX8M9OyqFyRATCQp2eBX
	behjhN+IYh+66J1hmg=; b=NhuAjGG9FwuP9gm+RnTkX0YLlCpkZgAyE6bSYV38y
	w9wdv0hpAsdyShAodEsnr/OtCLMcKiOTDEWfbqq7VeVf+JS9G3jfOO8Zwbw5fD6A
	iua+zPAhfEkGJMflRn5Q0ycO6agEUYMJSqcCDL2Ola+KA+c3CBazhRqGcBmUF0iW
	PS3yjF8BI8kEkiWLLOoicgy/YejYrAg9bGl+rEpV8Z+ouUG4T+fXZKOJTbcMbtsa
	xShVXqDvkNTyJi6LHUHY0jh3zrOCReiDSnxhcf0vpF7HWLCn6p/fkPycG68I/Jq4
	wgP0RQmX96CBMo/a755JacDuodu+FoFmkgRHTZmzFqxtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1698007150; x=1698093550; bh=doL/WjX8M9OyqFyRATCQp2eBXbehjhN+IYh
	+66J1hmg=; b=lenZ7wiurBSbCpf+zohCXtsTK+mugurgBocRWBkqcn32l4fWOmz
	CboJA52bXNVFC6aPXBieczqJsdNa9ga6TtRJ3hz1QCuxXCWZI6Ie+EqVMsRcwkN/
	0cxMrkYZMtcRLdrj2t1/VYSuP0vgCE1yDGb8JhE0uZalcarOtQidKM37jTbp6o/h
	Jif/+SgNhdG3J8wu46jE4u8z9CDf9ykqBQ5+cL3UNCt9rDfZ4ZfzkmzsSCSU1ajq
	gF+kzMcvgr3iNbIiSQyVfTbE3HsSBQfllS3qwGGAq3yNfup0q5vX8wgMncQToG5D
	++bIZFKNE36Lb6N21XzaYfFt3EH1j4PPYHQ==
X-ME-Sender: <xms:bog1ZcEgQcs6WpGiO0dvuUvU5VVxs6ZxVNWD7EMTrpkmODyDg0MKpQ>
    <xme:bog1ZVV0Cuaa3FjuQ6-m87gOQNEWwaq2jVGsZ2VH0d92-Tkw_fhHBsQEURaqJK4XW
    wJY4bSglhcwtQ>
X-ME-Received: <xmr:bog1ZWI-tEKvEBtSOoB2tNWM6I3EKkXAH6x55aDJT6u7ePYJ9FhJRuH64CBSu3JLdfWD0EoYi56XJp6j4HZj-ryfs4OEaQpPGeoYaMK-5Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeeggdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkgggtugesthdtredttd
    dtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfehjeeuudeutefggffgteefffduvddvtefgueetueffueeiie
    dugfeigfevkeefnecuffhomhgrihhnpehkrhhorghhrdgtohhmpdhgihhthhhusgdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
    gvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:bog1ZeEHBhokfRUdIDYmOeifOYRpWswtwUkxUmTLf4MViJOZ34hP3g>
    <xmx:bog1ZSVFVR3Px6GrXXwN1OLOSOxnSqotqV3NywP32Be84ciuLlwERg>
    <xmx:bog1ZRNLcG5R5qyPthdWjJctRzJkdMPN5Q9z4UmbNnWM_SMMS3HiLg>
    <xmx:bog1ZfjxE3RBWpg-wR9tAGy3uH0qo-S3D02U5FcSIC-WruqalXN9lg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Oct 2023 16:39:09 -0400 (EDT)
Date: Sun, 22 Oct 2023 22:39:08 +0200
From: Greg KH <greg@kroah.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: usbview 3.1 release
Message-ID: <ZTWIbP7NcKkIRDIH@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As it seems to be "release usb tools day", here is the announcement for
the 3.1 release of usbview.

Nothing really fancy happened since the 3.0 release earlier this year,
just some packaging helpers for distros, and some gtk+ fixes for dark
themes and tooltip cleanups.

The package can be downloaded at:
	http://www.kroah.com/linux/usb/usbview-3.0.tar.gz
and the git tree can be found at:
	http://github.com/gregkh/usbview

The shortlog is below.

thanks,

greg k-h

------

Barak A. Pearlmutter (1):
      perform radical pkexecectomy

FeRD (Frank Dana) (1):
      Let Gtk handle tooltips

Greg Kroah-Hartman (5):
      usbview 3.1 release

Matthias Klumpp (2):
      Display correctly when a dark GTK+ theme is used
      Add AppStream metadata

