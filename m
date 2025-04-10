Return-Path: <linux-usb+bounces-22909-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F142A84495
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AAE318959BC
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 13:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC542853E1;
	Thu, 10 Apr 2025 13:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UBhJ0jLv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BFF2580D3
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291188; cv=none; b=d1Ip5/19VDphCo5CeOZWeobMJhc8EW6+6w+2aZYYa9Jk14UFsIcjfYLI5yJYWqteNiPGy1hETSwrkOM74f7cUe+SunMAZkmNmn1tLy69drSf3yLw+LbVJ2VyqSpZD9Y9iwSW1KMBaanGiQnNwi+CpZ0PtrrCLi+zAlBvnF+7KfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291188; c=relaxed/simple;
	bh=KaxByU+XFcueAPpLxAyrUTpEks2C8Z2eaHmhZDYZSMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQGc1M+oOShCFlZdzqR+GN7JVS+dyu7ZMCbNlku3uVzbS4kplglip5rOQ6rtAF2ir4ihVtHR2z3Rz+fY8bzhBfeU5jDzfL3U+NAD55qmLUu5HvuAHk6jUhS1eWfRqoGEmyxK4cMbPl4lUMWVJ1sLpv2JBNXwE7aX7I4SfZPlmkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UBhJ0jLv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4066C4CEDD;
	Thu, 10 Apr 2025 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744291187;
	bh=KaxByU+XFcueAPpLxAyrUTpEks2C8Z2eaHmhZDYZSMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBhJ0jLvoCfUM9c8jNDfNpWzkqV0t6gpnqODKoKiT6JpyfYI9UgNoXE7aQh1/vLGp
	 QV5oJ5ClPD11hA7tJFIbS6qJ6FDXVJSoCQIHI/ybySnbw4CbfqJV8OG1QsJMG8xtKV
	 7ctpBuooChTsgmXhVeQ1YpSPMT86JdrxbFYYOlKA=
Date: Thu, 10 Apr 2025 15:18:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH 2/3] thunderbolt: Notify userspace about software CM
 tunneling events
Message-ID: <2025041001-baritone-flaccid-8306@gregkh>
References: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
 <20250410125600.3074417-3-mika.westerberg@linux.intel.com>
 <2025041035-jailbird-washed-c866@gregkh>
 <20250410131350.GW3152277@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410131350.GW3152277@black.fi.intel.com>

On Thu, Apr 10, 2025 at 04:13:50PM +0300, Mika Westerberg wrote:
> On Thu, Apr 10, 2025 at 03:01:54PM +0200, Greg KH wrote:
> > On Thu, Apr 10, 2025 at 03:55:59PM +0300, Mika Westerberg wrote:
> > > From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > 
> > > This adds notification whenever software connection manager activates,
> > > changes or deactivates a tunnel, and also if there is limitation in
> > > bandwidth.
> > > 
> > > The notification looks like below:
> > > 
> > >   TUNNEL_EVENT=activated|changed|deactivated|low bandwidth|
> > >   	       insufficient bandwidth
> > >   TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
> > > 
> > > Userspace can then listen these and inform user if needed. For example
> > > if there is not enough bandwidth, it can show warning dialog to the user.
> > > 
> > > Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > 
> > You didn't sign off on this?  :(
> 
> Oops, sorry missed it completely. I'll fix this in v2.
> 
> > Also, you are adding a new user/kernel api here, where is it documented?
> 
> Hm, where uevent documentation lives? I know for sysfs is under
> Documentation/ABI/* but not sure for uevents.

Maybe in your Documentation/admin-guide/thunderbolt.rst file?

