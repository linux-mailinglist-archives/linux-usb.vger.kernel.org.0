Return-Path: <linux-usb+bounces-26054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A0B0C7C6
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 17:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59B3B7AEC36
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 15:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7DE2DEA67;
	Mon, 21 Jul 2025 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="3c0tPOlv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NofmV0R5"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10428F95E
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112274; cv=none; b=ma6MabJi6Xpzy7w/DSAKJ7u/1S/lU4Wh+7opQGRIs8FlkngJY9YjwU4dCTYfa6phPrL6nPz9Nu8UpQyIgs2/DprgZclF6AAqpntQPu/zG5R4Edn5VM1/Sk+qTCKY/Y58Wm4uFaFr7vqA05tMpXHrKduNqeqYfq/4zGmFk669J54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112274; c=relaxed/simple;
	bh=It6Au9H0cLuBJBXTtJnK9hJNv7CRDK7N7t1KoQUNA/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lW4dL3QRZiizHPMY83YyAeRUqAs2t5W3gA+04V8trPdSRBr15D7FZqMDdrhxR+crtTvzWJBhAZF2RedpVvQrtejJ/KDmjCOj+8C2upGhflJeDrl5ZCSxxWPwuoq228YY0HpNdjGJgQEaYxTz3wOkJf3vMh4JqlAdGg60vWTYLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=3c0tPOlv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NofmV0R5; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id D9BEE1D00150;
	Mon, 21 Jul 2025 11:37:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 21 Jul 2025 11:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1753112270; x=1753198670; bh=It6Au9H0cL
	uBJBXTtJnK9hJNv7CRDK7N7t1KoQUNA/A=; b=3c0tPOlvgt3CeybKKApmeUvm9Q
	OOE5wGgrUg5cPXkOMMQQ45u3r6CmDXcQCNBG494kq1XpcZW/eHeubS7esjqhac3q
	M7ddoEsADEU5qWwZp0blLjo5Auf5MYdDO1WW/EGLBU6vWj0RSIdkLfFJl4Pv3zCM
	f1QeYW/2O4e6vJnpn8j5YGxRTe0wfdYkBdbGszfn39Tm/5ZAHLe7NTDb7JUh89hT
	qG16tU4/oWw9Pi9kGrV7p+PMREbPSAP/nWEUo2xm5XwPSUdC3AV2s9xEDPrBg4D7
	LZfMhSnBRBC+YTzIlwTETroUo4rHxbtcxxVPL7wZ36q40LVjBMEtiae7O3uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1753112270; x=1753198670; bh=It6Au9H0cLuBJBXTtJnK9hJNv7CRDK7N7t1
	KoQUNA/A=; b=NofmV0R5WG6hCek9ejLO4csYnT9X20HtN/uk02A2hRZbGKgqGp6
	VnbjrnTr4vrUq2s0IFvXC9vJmeNRxgpyotpA6sQBpf9u1TOA9pjtEiwxavI3J5+l
	gDpVd1vMxPvchEu5JJM6dsSqxpkOWA4yg6tFJLMFaCezyoMs1Owh8GF9A3d5nvmA
	JcRxEDLJb9BuYTC+4wQMwznO4+g0hSDupZ5Nz4nRdUhe4oMO3n0YZz/c3qKrzjWZ
	3ZzzBFn+EpAt12q2HB7MML9hnGGGpNznw4W/3uOjGttxrHzE+m6Qo1AG9oXwwkfR
	X7bs+QohhYE6jjEE790zDHtjW4KnK7i2JbA==
X-ME-Sender: <xms:zl5-aC0q5hb7NR9ykAj19gsOLqH2eG-orDBZhw9dLHujWvppEo6ugw>
    <xme:zl5-aOiYoR5U4XY2XlZL4HoBtvu_oHX6hPAPDn8trqN0CDoAVvqeQ_TiS7YywtLfC
    4d1c9Pf3cYpzg>
X-ME-Received: <xmr:zl5-aKfYpK6_oBF6062wKkU2mQRzmeu4iFTbj0bNLmktPwRn3hd23sHUCoY4jL_1De6rrwt4mon5Kq16QobHj_dtdYHQvKmPI3iFJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvdegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttd
    dtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecu
    ggftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtd
    eufefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegsuhhgiihilhhlrgdquggrvghmohhnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:zl5-aJlctYqc2dvxsQ8ePOorPNOKL7gBkcKDdSAGStEymj2KaWOT9A>
    <xmx:zl5-aLvJoibMIYWPze22_MpwEEnCYytB1BydLYX1cfhsKzSN2IrQvw>
    <xmx:zl5-aH95BHpSuOESc6cG-yvgvrsskm40WB8z4h16VbL4w4hY7NJivQ>
    <xmx:zl5-aFP_xKEWNTaavUISxBdmimff7a4SHa3NZV14ocwErgXM63nLGg>
    <xmx:zl5-aHaTVQhGqM5Piq3kz-IzWSM7DMN-FHmPUjnXjZ0oHmi0fAR5YaSV>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jul 2025 11:37:49 -0400 (EDT)
Date: Mon, 21 Jul 2025 17:37:46 +0200
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 220331] FTDI serial IO - unknown device type: 0x8312
Message-ID: <2025072130-confusion-canning-8af6@gregkh>
References: <bug-220331-208809@https.bugzilla.kernel.org/>
 <bug-220331-208809-YidEqlYeGQ@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220331-208809-YidEqlYeGQ@https.bugzilla.kernel.org/>

On Mon, Jul 21, 2025 at 02:58:05PM +0000, bugzilla-daemon@kernel.org wrote:
> ad 1. The device is not recognized even in latest kernel 6.15.7 .
> ad 2. Where should requests for a newer hadrware support be placed then?

On the linux-usb@vger.kernel.org mailing list.

