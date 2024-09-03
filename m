Return-Path: <linux-usb+bounces-14544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE274969B8A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 13:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93CA3284F87
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 11:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B2E1A42B2;
	Tue,  3 Sep 2024 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Ao07F+Mo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aGsHTC3N"
X-Original-To: linux-usb@vger.kernel.org
Received: from pfhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E2A1A2621
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725362621; cv=none; b=KO8ard8vBefRh6KyNAbjEnFTdsjXWwhQOH2TOsuJfB5ZhGNyGtaxYuM0XaAfKR0tccDXRGLCIh4zp11tS7IMMptI0T6BkXG2Q4F//6BW4wzO4z/kLdvCfM4zrFHf+qe76z4k1xdGCsll5mGG54miyONbLiM7YDIPIjVfcZRJ2jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725362621; c=relaxed/simple;
	bh=gNwFbvWyRZ6yFax8rjmdqCliffmZyH+WUKdxfLy3NQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udslo26FiZTcDXjpbmttw7wAedz6rHpXBI/ZAMuYj2P68K5PY6SEjd6cp5gwTKU5MQrDyr0QXD7NV9gfe0ytUePjz0kW5pTA+H8BvXOlDGMbR6cN49ye/GQpxxvyc6gKXdgMoc7XHxKCxNnV3ycl71jCswN15RrfsTo5FLajDaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Ao07F+Mo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aGsHTC3N; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6913D114038C;
	Tue,  3 Sep 2024 07:23:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 03 Sep 2024 07:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1725362618;
	 x=1725449018; bh=5bo0X494kUqH46bacpHWSVNT4YBROPr6lS5yOClb+R4=; b=
	Ao07F+Mo82pJoimfMm778SzbhPHgu7zVNhCXsgpWi5pmAcTSFuFgWRH56/zoSAFL
	OsE/Ayk2FCBECjjfxVIxofYb0BfFtZt/cOQmn8LNG+LKyksNWidwaiGA4AZQxEmK
	SSgUXs9EAjlLAtlwKkVLkhcWBMBdWDIt4jo6bJT9lrqyuLgZPvE+CG3F5030XHmQ
	3HgRG+4Z6sPJpKleDrrIhrNa5iMXOAG8OdXun76BOHXdzdsZ5nJsevQedse1D2VW
	6z+2YIedlhOPyhjOVfd489XPm02cNXIKoeIKKo3lMsDKT3CF49hB7niS8MKj8rqX
	SurdYJhsKD6Ty0XqKLuU2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725362618; x=
	1725449018; bh=5bo0X494kUqH46bacpHWSVNT4YBROPr6lS5yOClb+R4=; b=a
	GsHTC3NirZUogNF23LHk0PcvXxHJFakl6ybFOcfqrBBW6rTRJ/zfNZVKPT2gIul+
	OsF2fl1BVue5k+JoJua26oXF1j+AIz7WK3RymrSISK12kZW9yJap1MuSD+DxLTt6
	l/Z5Adgo4cQRe4ckJC0U6wrMfStr4oxOVI3PJ2Z6tkvzKjBhqJvv0V8G+U06tCy+
	mjRkMsDJYHDaFa0Xkk4n4ja1fWC/mdQDoafjtmEm10orhQsSu8Gl6hx0ztVkWpWX
	Ze1lbFI9wmp7ugsylUNEIDUl6xGzCzk8VvLxl8IYtHOX0zRJvHFhbaKlQ3DwuVNl
	/ONmURKTEfbtqE3fVwVHw==
X-ME-Sender: <xms:uvHWZgNoE3Zzej6ZvGWipWCwiIs25w04Waw285GHNsaNwTgSHL6_HQ>
    <xme:uvHWZm8XcHoJ3spLv_86kQTw17U0CoXa5Poe18qZXPuzlUl0z2Wol0649G6birwQN
    _M3y8VrkJ2Zeg>
X-ME-Received: <xmr:uvHWZnQMfKryQpr4fYrWSydrFdjrUzHtjK8icRS2G__n9J6RzmEHh2qGjywJHuZhaQydO0vdlYUOiJyy68Qvce_Eb_XUr_sTpcIwyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehhedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddu
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeelheehudduueeggeejgfehueduffehveeukefgkeeufeeltdejteei
    uedtkeekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepmhhitghhrghlrdhvrhgrshhtihhlsehhihgughhloh
    gsrghlrdgtohhmpdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:uvHWZovx1GHwARMGNidIKE3hOVGXX6vITyYxKACRPPsxGMGlLUZDzA>
    <xmx:uvHWZod-FWts1DO9YrmfQ2Aaue8mICnVsF-hmwdc9mVPe7l2OkVdLQ>
    <xmx:uvHWZs3FLh8W3v4Vmc4nr4rn2VEESYSMUluKpgKteO5i8oTki3iEYQ>
    <xmx:uvHWZs_3Od5FRGfRddiZ6sbvPk8uBxpbUJug9476e8gkKNSbHv__2w>
    <xmx:uvHWZn4RP13KGcijlZsm2ajmDaw1EQNmDLuiQqfII10XCQ875u8Brbga>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 07:23:37 -0400 (EDT)
Date: Tue, 3 Sep 2024 13:23:30 +0200
From: Greg KH <greg@kroah.com>
To: "Vrastil, Michal" <michal.vrastil@hidglobal.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: composite: fix OS descriptors w_value logic
Message-ID: <2024090305-harmonica-strained-ed09@gregkh>
References: <AS8PR05MB84857AB3DC49395AEC7C235990932@AS8PR05MB8485.eurprd05.prod.outlook.com>
 <AS8PR05MB848522189AE458978C5F231490932@AS8PR05MB8485.eurprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR05MB848522189AE458978C5F231490932@AS8PR05MB8485.eurprd05.prod.outlook.com>

On Tue, Sep 03, 2024 at 11:14:39AM +0000, Vrastil, Michal wrote:
> >From 118f8c8b72d633c0daa65e564e48cbf4964977ab Mon Sep 17 00:00:00 2001
> From: Michal Vrastil <michal.vrastil@hidglobal.com>
> Date: Tue, 3 Sep 2024 10:55:15 +0200
> Subject: [PATCH] Revert "usb: gadget: composite: fix OS descriptors w_value
> logic"

This looks odd, did you mean to put the whole commit in the mail?

Also, all tabs are gone, meaning you probably did a cut/paste thing,
please read the kernel documentation for how to use 'git send-email' to
make this simpler?

> 
> This reverts commit ec6ce7075ef879b91a8710829016005dc8170f17.
> 
> Fix install of WinUSB dsriver using OS descriptors. Without the fix the drivers are not installed correctly
> and the property 'DeviceInterfaceGUID' is missing on host side.
> 
> The original change was based on assumption that the interface number is in the high byte of wValue but it is in the low byte, instead.
> Unfortunately, the fix is based on MS documentation which is also wrong.

Please wrap your changelog text at 72 columns like your editor tried to
get you to do :)
> 
> The actual USB request for OS descriptors (using USB analyzer) looks like:
> 
> Offset  0   1   2   3   4   5   6   7
> 0x000   C1  A1  02  00  05  00  0A  00
> 
> C1: bmRequestType (device to host, vendor, interface)
> A1: nas magic number
> 0002: wValue (2: nas interface)
> 0005: wIndex (5: get extended property i.e. nas interface GUID)
> 008E: wLength (142)
> 
> The fix was tested on Windows 10 and Windows 11.
> 
> Signed-off-by: Michal Vrastil <michal.vrastil@hidglobal.com>

What commit id does this fix?

thanks,

greg k-h

