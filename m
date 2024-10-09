Return-Path: <linux-usb+bounces-15916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C6996760
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 12:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 832EC1F233D5
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F72918F2C1;
	Wed,  9 Oct 2024 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vEhFstzC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F34218E351
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728470077; cv=none; b=sYn/or8z9J5AP0ErLzqJ9pUq4LXEZ22pJ67t7ZjtGDfuBzuK5SHzKEVs/yaabI2o+3Lj1q3e3/a25e+6pobrsszn0xZMA2kWnbRHX1aW7WvSW9KG0TDgIa4vvRu3FefQuwA/TpDTwK5Nb1qHO0BQcbtmwrI5rGhPsG3Em7oVslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728470077; c=relaxed/simple;
	bh=xo31R4i50/S2gbZGEhD29cQL/EtQJDogpwPQTpx+viU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLzZu/lOFw+4o8lT24x4KpGJRoaYZIIm1g9ucKWMK6sax0IjOvEZrE1J6PLaEIWsf4JZOdBOgU4yr0/tEEj0TJcCW4YiJyN1UHdSs7nZvittO+VA8XxyukOxP61h2mzhXk5C7W/GKLZHuqTMEIgOzRFUaVEzW2HzZQ0jSfTJL+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vEhFstzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4CAC4CEC5;
	Wed,  9 Oct 2024 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728470077;
	bh=xo31R4i50/S2gbZGEhD29cQL/EtQJDogpwPQTpx+viU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEhFstzCR6YIP2mgfxJPLYk3YbNzIs+vZtpX9jd7v2r6whB/k/x55i3/NFy9rWWij
	 3/6GdyIU/8ZrPtlvXt35WfrVnoj84hGpTZA/6mdh4MNGiUUx2AWrHk5AMXmfKnJ32E
	 Hg4LJASsm7/GJ5+37pSAzgeac6vrK9O0I+8sm7GU=
Date: Wed, 9 Oct 2024 12:34:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Message-ID: <2024100901-earthlike-boxcar-da22@gregkh>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
 <bug-219362-208809-PS6oMieydH@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-219362-208809-PS6oMieydH@https.bugzilla.kernel.org/>

On Wed, Oct 09, 2024 at 10:08:41AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=219362
> 
> --- Comment #10 from Tomas Mudrunka (harviecz@gmail.com) ---
> Would it be appropriate solution to add new sysrq command to call
> device_shutdown().
> defined in drivers/base/core.c

That is the normal shutdown path (i.e. the syscall), please use that
instead if you wish to have devices shutdown correctly.

sysrq sync and shutdown is for extraordinary situations where the system
is broken and you are attempting to shut it down in a way that is better
than just pulling the power at that point in time.  Don't attempt to
turn it into something else.

thanks,

greg k-h

