Return-Path: <linux-usb+bounces-29526-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC34BFCACA
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 16:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B84FC358245
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 14:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D0434C15D;
	Wed, 22 Oct 2025 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zaO+cCfD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F35726ED33
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144609; cv=none; b=ZnScqW1eE6rkcs2xgB2G6f9Zk/itQr07w6bRKcYQyrBNxQuYEBFShfnekAS9PyDdCHHE7nJRQQJEZrW/2h6cvUAV1tpJoaelusXRQvNtYcLJPkYQijVBh6TUT8dJg1r8Rg0IDQfmN8q6rId5LVo0vBFddFYUAxiu1nEbOmtPIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144609; c=relaxed/simple;
	bh=ZQ5XvRcl4K02isb3AVUE88kbGTIsphk0beHEtOh+kJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upLrnYnRISlMI8b5nVsF9gGYepBpDxGk8m10ZAePHFkMWft2Y2btY/ZI6h5ehe10F6XSko8jg49FOZv9tthqiW4BFMJaZ+s8QN0nocTQSAs9k/dz2uLpgKCHGnTPaV7Qyb8r795rm1D/XiL8gevq5Q2INVSonVDEI4Si1TCzlIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zaO+cCfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB145C4CEF5;
	Wed, 22 Oct 2025 14:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761144608;
	bh=ZQ5XvRcl4K02isb3AVUE88kbGTIsphk0beHEtOh+kJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zaO+cCfDl6Ga0eifOaTnXUXNTHOz1O2qrGCFAbnI046+6m5mKnVjtd+eJBvPHr+UC
	 LZKe5Q3YpQPAQj7Q68VHUniMLj1EK1REElvka1rzuyzgP4V1EcrKDzQiut12csnmIq
	 UGtl9FAhXZ48taQjpfFAmBZS0yt0vXdWGofqEWwk=
Date: Wed, 22 Oct 2025 16:50:05 +0200
From: 'Greg KH' <gregkh@linuxfoundation.org>
To: Terry Moore <tmm@mcci.com>
Cc: "'Ruinskiy, Dima'" <dima.ruinskiy@intel.com>,
	'Oliver Neukum' <oliver@neukum.org>,
	'Oliver Neukum' <oneukum@suse.com>,
	'Maciej =?utf-8?Q?=C5=BBenczykowski'?= <maze@google.com>,
	linux-usb@vger.kernel.org
Subject: Re: cdc_ncm driver and NCM 1.1 revision
Message-ID: <2025102208-copper-aspirin-b1bb@gregkh>
References: <6c22b4d5-7d6d-41ab-9b00-9dccf3ec8963@intel.com>
 <2025102259-purebred-amulet-b6d2@gregkh>
 <00f101dc4361$7a5b8860$6f129920$@mcci.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00f101dc4361$7a5b8860$6f129920$@mcci.com>

On Wed, Oct 22, 2025 at 10:38:05AM -0400, Terry Moore wrote:
> Thanks Greg, Oliver,
> 
> I'm the NCM committee chair. 

Great!

> Of course, if people can get funding, patches will be pushed. That's not
> really the reason for establishing the connection.

We work off of patches, you all know this :)

> We're working on an interop test in December. We really hope to find any
> active open-source developers so we get them involved in the interop
> testing. 

Do you have devices that we can test changes with?  Without that, it's
going to be hard to implement anything.

thanks,

greg k-h

