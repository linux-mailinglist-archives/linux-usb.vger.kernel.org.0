Return-Path: <linux-usb+bounces-29083-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71771BC8EB8
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 13:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BBF64EF7C0
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 11:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058DC2E11BC;
	Thu,  9 Oct 2025 11:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bGrU3WEO"
X-Original-To: linux-usb@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE0F2E0909;
	Thu,  9 Oct 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760010994; cv=none; b=MsyP2W7EENUHB8PAoLj4+zfYMU+lZRlKT5cSjUeqsu2aJubYHMFCnUUOagD4DIIiedBKHfRslgW7qfJiT2MccSKiZD0vs7BjgCeqnPF+WIju3gi2WkzEzPFyf7rA8M9VlUO8UU3z5yrYK5/htey2Lpbmt/cdd4J6lCnA/2tYrVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760010994; c=relaxed/simple;
	bh=RhuPp5y09vvcpVIhHebwqLJL9oUt7V6HsnDUYWAI+Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sK2yeyYb6L7tzAPjJNI7EVQ1Us9Yayk1LpunqIwiBiUGrc2dAI1DqMeQ0bApg91yCPsNmXiERm2B/uxROJ1N1FkWhhUIL9BQTTmkj9P4a5MmpEMANLJo9bCO1cFexvogaETB/JJXePGl4Q6G7TG/0JLwypzmIsztwSUP4XJueVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=bGrU3WEO; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6O5KZhZxnuokrRQeO8RQoftrv8w21jBw/piVrU0xGIE=; b=bGrU3WEOHC22yuckDYEU1SZKEj
	1qhJJo+8qLPErCOS+l/K/urZAcL9Cv27ldJDMxpkPqiis6uwuaqSmaVyq0iX0LEvMeILwl2IQxYdX
	FBN9Kgce6nxQNV0TASCUDavRRcvppqkQm91sAeyl1zF4Kh2mz3tqgNyu+5EI1pYL07t8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6pFl-00AWaM-5H; Thu, 09 Oct 2025 13:56:13 +0200
Date: Thu, 9 Oct 2025 13:56:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: yicongsrfy@163.com
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
	marcan@marcan.st, netdev@vger.kernel.org, pabeni@redhat.com,
	yicong@kylinos.cn
Subject: Re: [PATCH v4 3/3] net: usb: ax88179_178a: add USB device driver for
 config selection
Message-ID: <2455d227-6008-4b7d-802e-54f0d265c68d@lunn.ch>
References: <666ef6bf-46f0-4b3e-9c28-9c9b7e602900@suse.com>
 <20251009073450.87902-1-yicongsrfy@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009073450.87902-1-yicongsrfy@163.com>

On Thu, Oct 09, 2025 at 03:34:50PM +0800, yicongsrfy@163.com wrote:
> Hi, Oliver:
> Thank you for your reply!
> 
> The issues you mentioned above, I will fix them one by one in new patch
> versions. However, I'm a bit confused about the following comment:
> 
> > > +
> > > +static void __exit ax88179_driver_exit(void)
> > > +{
> > > +	usb_deregister(&ax88179_178a_driver);
> >
> > The window for the race
> >
> > > +	usb_deregister_device_driver(&ax88179_cfgselector_driver);
> >
> > Wrong order. I you remove ax88179_178a_driver before you remove
> > ax88179_cfgselector_driver, you'll leave a window during which
> > devices would be switched to a mode no driver exists for.
> 
> In my init function, I first call usb_register_device_driver and then call
> usb_register; in exit, I reverse the order by calling usb_deregister first,
> then usb_deregister_device_driver. Why is this sequence considered incorrect?

This is not about the order you do things in this patch. It is about
the order of the patches.

It is assumed that this hardware somewhat works with the old
driver. But without this patch the hardware does not work?

Anybody doing a git bisect could land on the first patch, and have
broken networking. So you need the patches in the opposite order. Make
sure the driver will work before swapping to it.

	Andrew

