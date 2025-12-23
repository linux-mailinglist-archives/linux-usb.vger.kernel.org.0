Return-Path: <linux-usb+bounces-31707-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54DCD99C8
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 15:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ADE883018903
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 14:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A0C325495;
	Tue, 23 Dec 2025 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WVx7kfvY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6197830BF6C;
	Tue, 23 Dec 2025 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499868; cv=none; b=fcNgfZwbB+QU/79Pgdeb8MSepGNntX3QcUyJS1GAJZD9kGOrBBBR43BswED18LK72SKf0xNnN7fhcZLovTZxmBuoUOg9JA/A1eymb5SQ3wv1rxif0e42i0KF4Yx0HU1vMl35ohOg5l3/j4W/d9WwYWBpNstG57U87GEUl+9Y79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499868; c=relaxed/simple;
	bh=9Ap3jdMoLYof3AgrL//q1oyKp3J7iaaqb4vJtzM6pvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbPvn0VWyWzL64lYP6VrvFuQfgXvwR3DK80iOfEla3S263jxE61qnK9MBfqsJKTQOhISPSmk6m6RfVNN/r9x/RNqlgJ9TC+/xDkZqjzC3WI9HNgpRIe7rOFZKCsNX2Tn1r9XI2d+EbPtdSCHE0DaWOPI28ai8SO2EGdmPsYHkz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WVx7kfvY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29FFC113D0;
	Tue, 23 Dec 2025 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766499868;
	bh=9Ap3jdMoLYof3AgrL//q1oyKp3J7iaaqb4vJtzM6pvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVx7kfvY1u1UB8aDmsqyTL8Fflwtg4rOcN5LCeDbk7uIRIIcPZ1Ts2CnwdCeIQaIP
	 DjhA+70VfiM0DW2yCS5dKOzAEcwYwxTqwnUqwdN5h2iwYtnmwLhfET485L9LLoq/7K
	 bWmJr9kkxwgxJEW49VyosgePuuzz/sL1sHK76/Gg=
Date: Tue, 23 Dec 2025 15:24:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: typec: ucsi: revert broken buffer management
Message-ID: <2025122344-purely-subsonic-4b97@gregkh>
References: <20251222152204.2846-1-johan@kernel.org>
 <a6073f4f-edb3-470c-be63-4c3054d497a0@linux.intel.com>
 <aUqhgbxGIbq_V9Cz@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUqhgbxGIbq_V9Cz@hovoldconsulting.com>

On Tue, Dec 23, 2025 at 03:04:49PM +0100, Johan Hovold wrote:
> On Mon, Dec 22, 2025 at 02:15:10PM -0800, Katiyar, Pooja wrote:
> > On Mon, Dec 22, 2025 at 07:22:00AM -0800, Johan Hovold wrote:
> > > The new buffer management code has not been tested or reviewed properly
> > > and breaks boot of machines like the Lenovo ThinkPad X13s.
> > > 
> > > Fixing this will require designing a proper interface for managing these
> > > transactions, something which most likely involves reverting most of the
> > > offending commit anyway.
> > > 	    
> > > Revert the broken code to fix the regression and let Intel come up with
> > > a properly tested implementation for a later kernel.
> > > 
> > 
> > Thanks! A fix patch addressing the race condition has been identified and
> > is being tested right now. It will be submitted for review shortly.
> > 
> > Here’s the discussion on same - 
> > https://lore.kernel.org/all/349e1f70-7e40-4e3e-b078-6e001bbb5f1a@oss.qualcomm.com/
> 
> Yes, I'm aware that discussion and I still think this needs to be
> reverted. Then you can propose a redesigned and tested implementation
> that we can help you review as that kind of work is not something that
> should be done as part of rc stabilisation.

I agree, I don't see a submitted patch yet so I'll go take your reverts
at this point in time.  That way people have more time to get this
correct instead of being rushed this time of the year.

thanks,

greg k-h

