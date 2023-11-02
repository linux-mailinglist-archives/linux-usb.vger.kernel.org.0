Return-Path: <linux-usb+bounces-2473-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B287DF9B2
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 19:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AB62B21327
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 18:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FC22111A;
	Thu,  2 Nov 2023 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="koLb2Fq5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F94E210ED
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 18:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5843C433C9;
	Thu,  2 Nov 2023 18:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698948816;
	bh=Tvtyqg7IcGUInQqwST4VMB42spLexh8JO2MCVWKGPG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koLb2Fq5s+HfW90KJKCguiuXWYPN9Eh5ujRJpkIg5C/hLTSsMGfUCdvE/WnR0ou04
	 Rwk6t3veid53NPdJHb5W52gV4HObtbYrscx62uT3jVz0xNq02LFo7LnX4O6WumXt/k
	 OYyLsYtGykCgaN7fdkiRkQCF6haYSJsNjDL4fkWo=
Date: Thu, 2 Nov 2023 19:13:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wentong Wu <wentong.wu@intel.com>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: misc: ljca: Fix enumeration error on Dell Latitude
 9420
Message-ID: <2023110216-straggler-marbles-b760@gregkh>
References: <20231102164817.547128-1-hdegoede@redhat.com>
 <1027800d-7740-c52e-e372-9993888ecd8e@gmail.com>
 <841a0653-15ed-268f-d702-c97be7482ca8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <841a0653-15ed-268f-d702-c97be7482ca8@redhat.com>

On Thu, Nov 02, 2023 at 07:05:33PM +0100, Hans de Goede wrote:
> > 
> >>  	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
> >>  			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
> >>  	if (ret < 0)
> >> -		return ret;
> >> +		return (ret == -ETIMEDOUT) ? 0 : ret;
> > 
> >    I don't think the parens are necessary.
> 
> They are not strictly necessary, but IMHO the code is more readable with
> the parens.

I agree, please leave it in.

thanks,

greg k-h

