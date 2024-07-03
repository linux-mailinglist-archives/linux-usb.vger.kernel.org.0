Return-Path: <linux-usb+bounces-11965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D593926255
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 15:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 499C91F235BE
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2024 13:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5158717B4E8;
	Wed,  3 Jul 2024 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Vt6aatF6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FquwXcBm"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9133217084B
	for <linux-usb@vger.kernel.org>; Wed,  3 Jul 2024 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014826; cv=none; b=B0XlbaeGDCiKFvxt3EzKlXU1jGur6MY4PHvYhqMEBY8HbX/mRzYmcNjRkxcZ6rd+5Vn6aqy98U38CXzactMHHGxF7oSKR4MB/4upvodXM2bh403b1mecHZqmjFpP582AJlK5xdUvgfSosB4I9FfG9ce92agZgMFHDo5E076BPJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014826; c=relaxed/simple;
	bh=IlUqf7tBZHK7qjTmXCmr0+qCZg+7AVOdaOYBMQKNk5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVPFOxYXLW10Ub6Rqhs16JDdIElpTaHHbl0Xt+Awy/+SUUQMEY6Fvg9L1evyOZs1G1eknUNZxyyM0YIwg3OYS6IKYDJcjEg19otKVfAJgM/rCYPnJzx7jtJVWd51WjHsqhU8j0ie8W2YSFN5J6CHrzGTqpgLh4/agWMD+wxxdgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Vt6aatF6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FquwXcBm; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 82B4D11401B2;
	Wed,  3 Jul 2024 09:53:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Wed, 03 Jul 2024 09:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720014823; x=1720101223; bh=7CyqDQ3Md9
	TuknspqOsoAyYjEX9JlfZpNaLVaYf1uJ0=; b=Vt6aatF6PQ2TTFIf5rkq+/avM1
	cqNkyVlqjEAipVbOCz6IvSubWJ+3BQ5Setj6+XTVkW6VSsUJemCbPbTUa8XK2nqH
	/uoI6kFkv8UAsQXPmUztW/IjiW14PC3IhYsZKqKJ+N/rOFBLLJg9KqFHGxELSUXy
	2CiRBxdZgkq1r8HI5S7NEQLKDSn36rqnCnSczDX7iyuVqvRlzL7aUhtXP/af3cMm
	yxzNIXBmynEF00yA3JuttzgxS6Ov/V2gIKkhtS6p8bZx4guWKDJTNCEWn+jAboPG
	WA0o2r9cfL6Y80x2HQpVGcsH+G6HnxFpoTvzGh6CPN+mEnlqj0/t4rxYmGDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720014823; x=1720101223; bh=7CyqDQ3Md9TuknspqOsoAyYjEX9J
	lfZpNaLVaYf1uJ0=; b=FquwXcBmAIssElkR9ggnyoLzLgPQqdYa4BlWxGdgJbml
	O9Rel8HWw2HclwO7nqmYI1mNl1sIB08dWViWT/7iex3prGrT+QwF+wcI6EE9l+ut
	CxdC6ZpN6iMazx722RJe5Pva7JB3gO/uaRqYxSomgDjQCpOqB41lBpGV0QZjEJkK
	O27warYtHUZpd0goXFpNVwou6EFG2QlrZu7PfoW7ieTavEGi/Z+5sIFhPAsLjsnU
	AuwDiCTTJEIb6PvH4u5KaYcKLaNhfW3CQl+Yhmva6Ll7b/ilD3IjZyKBgqZeGSCs
	aSomCBYlB/kzVlZQK/DX2uPSEjsb8QJW3lMpegQy/w==
X-ME-Sender: <xms:51eFZpLUpWRFvfRLeIgFVFc_PBPeUGQ40VwqTvcqrKIQYYE0LdcjIw>
    <xme:51eFZlLKJLKVd6LbxqPUuIc-u7HYNNHDrpyvOwSOe0Y4vKC9n1E3vdYKAd3Zp_bm_
    DcqLrzxiA2y_w>
X-ME-Received: <xmr:51eFZhspaH4IQDsb1s3FwS-RAw3fMg0zDfEOypWCGWcsazYv0spD55AvI7A43s3wnYX01uq1p6yelEcEkmLe8TM_rmcor0ZCE3Mk2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:51eFZqYuD_uPeUCYF4fgwCfZTna7Uo7tq8PMYjHOcumm6b-ZpWMbqQ>
    <xmx:51eFZgbFq7oPdR60BCbkmvtYtm-Jb9jvGW9F-OFnM0RzHBbRKbZ58g>
    <xmx:51eFZuDjlCTgP51fY8kAty1fyM37unWWEgqi1qnX9uBlJEJL0A7ANA>
    <xmx:51eFZubXPR3iWQY6vDoe5I_T-p7Co-b_0-zbNnk2R2o4mQVvM23_ow>
    <xmx:51eFZsSdR6O_50WWYhYn__jeleStFLWzxkWW0Ukoa_fdKR-9hyZ_ZhwZ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 09:53:42 -0400 (EDT)
Date: Wed, 3 Jul 2024 15:53:40 +0200
From: Greg KH <greg@kroah.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: USB4/Thunderbolt maintenance on vacation during July
Message-ID: <2024070333-deplored-patrol-a4a2@gregkh>
References: <20240628090736.GC1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628090736.GC1532424@black.fi.intel.com>

On Fri, Jun 28, 2024 at 12:07:36PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> It is that time of the year again. Finland closes up due to vacations
> and so does USB4/Thunderbolt maintenance. I will be offline during the
> whole July but will be back in August. Everyone have a nice, relaxing
> summer. See you again in August! :)
> 

Have a great vacation!

