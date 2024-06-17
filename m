Return-Path: <linux-usb+bounces-11359-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5926C90A5C0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 08:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CED0D289BD2
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 06:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9061836FC;
	Mon, 17 Jun 2024 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="DQwm14HR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FGL/KRsQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEEEDDAD
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718605758; cv=none; b=f04vo0k5PLevhu14TTzobkLTmZZodZF80XYO2UniiV1afiwNVXS54pgcGzaRThBKE3ZUkjWRp85hWM3i8QkVRh/5wvkd8jOIgd3Zog1wVr2c42Q/0wCq05uj6CMX4oMyrOT73JIMOwk5MIVBXZAcnso1Fi90w6HrGUkHQMHrdT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718605758; c=relaxed/simple;
	bh=sa19lse/BLF5Oa1zDoB7FizrBrDnk0AAOj9pHgGQKQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGPmmXDaSTYqwHRxqJuszD4303mGhK0LHQEbfqHTiekv/BloZ2T74LMZHx80nO/DZABHBUSmpne2q2xfVgvPg3950I04nGP7/aKq134nt+aHU2Z4lWswDyx2qyMxCXDMpLAaM3dQAD+UUpSBt7jf6yxh3qNUq6vIoQn0a7IvK6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=DQwm14HR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FGL/KRsQ; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6FA86138023D;
	Mon, 17 Jun 2024 02:29:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 17 Jun 2024 02:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718605755; x=1718692155; bh=OcT44IexPE
	5bwlnDah0LitSAkFtKbkVELKWsyFRZTNY=; b=DQwm14HRW1G2m18wULEJ20R6Dj
	FF348JyCjjFPIhxVmWktHbthPmuc2YVcSxeQ/HX3WCtqFiRSEubaxEDnhaW8SvZW
	pyN6hTmxQwI/1Rl8+qdkoSHDza2wlu8J2qZs5FnH2RQthuLz6/iLQ08EozoWHIXG
	cC1L0NAW6GqAedJkX6wo9S7sawU7ZzFL+KOTiJiPV5gdSGDSXgfhW0C4MLeKp7++
	qIGtW9Vnx+08COgizgJpx3WY8SKDqv9qZcw4SobeDtWnsj9GBrqDuEyACPSrUIZc
	RgK7mr7DZY8XG/m9B6EhZiXl1TMrY+M/hR2ohPDJWURVbjfLVZ6LCz0XeZ1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718605755; x=1718692155; bh=OcT44IexPE5bwlnDah0LitSAkFtK
	bkVELKWsyFRZTNY=; b=FGL/KRsQVwbxF15n1S1WJuEioYYx+OH724shsXSe/LXb
	NBqe8NAdb1V8B1Ik1nw5vacrLCzdT6aJ9qgYXA0mYJZFYssHm4TGQhbbm0UTc3TX
	yNJkS/AlrrugH314h+wxUen/v9PU7wJARrzZC1wSZFtH5L5D83nkGEvczYIMj5BN
	hb8K4qsSh6I++KE3t+FERiRvHuYT4NkwuK7ou8LnzMpvcvurbfzjQpHwiaO2br92
	lNmE0vAdpoeHoxb6WDIuGwK62GDKg2NF3E1V9Z0LnY18ilfm2kj3hKBmmkyp/uIL
	Uy46TY7jMvf28391+h8mhDXAAyp9uyiY2naA7g1Zvw==
X-ME-Sender: <xms:u9dvZrr9GR1ggxuqSRfuuG8Ru2U8H3H0LtdUNOa-iWfSDR7y-Asy3g>
    <xme:u9dvZlpAdDmFDfmFRc0EBRxjpvH4Ny7BX3SmoXCi8F4e9WTSv58FOiY7317ElZl_6
    7bF20Lh_m1dRg>
X-ME-Received: <xmr:u9dvZoOaqD58RFJ5lTcm_OrGpGiemWJBW3EOVPz0cGi4v4r6Ug82Kg4X1aUvuBL2BD_6l967MObRWSpaEYa_bU73E7_fhb2f47rXHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvgedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepgeehue
    ehgfdtledutdelkeefgeejteegieekheefudeiffdvudeffeelvedttddvnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:u9dvZu7nQniBnrnag71wSOoI5MOG0Z9BTL8qLGkgvni-blw-zLwA5g>
    <xmx:u9dvZq5YiMBM8htf2943p9XjeUwYMj3nptfvRRcryjldo3wEgNrJQA>
    <xmx:u9dvZmiyCJ9c3MjWO28dNrdoJyVt-0BVme4BqjTl-8g7hXJf-zuh0A>
    <xmx:u9dvZs73eqEwDlReKwmv6s2qd0lhuzV0lkb9_pSAJHKLzJ31B2_G2g>
    <xmx:u9dvZsspD5VD5tM9VczRUr47p3ba_KBjo4Vzn-R-8jJbRQxO503Wrd8R>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 02:29:14 -0400 (EDT)
Date: Mon, 17 Jun 2024 08:29:12 +0200
From: Greg KH <greg@kroah.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	USB list <linux-usb@vger.kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
Message-ID: <2024061736-bagginess-raffle-7e1e@gregkh>
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
 <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
 <CA+fCnZetfWWhO+Fufg_Q=MOFtyN+g6nBrLJ29HGrGc0znsQTGQ@mail.gmail.com>
 <762b8751-16d5-4ce5-8504-efcb6440585c@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <762b8751-16d5-4ce5-8504-efcb6440585c@rowland.harvard.edu>

On Sun, Jun 16, 2024 at 10:10:33PM -0400, Alan Stern wrote:
> However, it's another thing I have lost track of.  It may have been 
> posted to linux-usb at one point, but that would have been quite some 
> time ago.  Probably before well lore.kernel.org existed.  (I vaguely 
> remember working on it before moving to my current home, which means 
> in 2008 or earlier.)

I think lore is populated with all of the linux-usb mailing list
archives, but we might have missed from before when there was -user and
-devel versions of the list.

If needed, I can try to dig up my older archives from cold storage and
get Konstantin to import them.

thanks,

greg k-h

