Return-Path: <linux-usb+bounces-16354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 884239A1AD9
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 08:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9D11F2196F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2024 06:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0532B192594;
	Thu, 17 Oct 2024 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Br7ET8wE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4D18E04E
	for <linux-usb@vger.kernel.org>; Thu, 17 Oct 2024 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729147395; cv=none; b=A9iirhOVPWe398c6I2MHJlLtkP5Q6SYuZdEePuLxXYOg7iIb7z1H+wkGv6LgkEABUYdAB1edMv4QG5NHT03LCM59LxMuUcP9O2Fkrs0nJPX7l1Hf8zHPXy67v7h1NpILHnByBGDAW1M8t/ozUMfKh2kGAzoYQw/TzJdBYOzupPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729147395; c=relaxed/simple;
	bh=iGjeDlxTBiPPB4AGJQHEuwATpp5oluypm7fswh60SgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZpTST62BaDTvGHjdi7eQPHGa140ptdk2vPO1lWAukgp817KNuiX4meFYDshyUU8d/drgdKmy72oZwXPlAoxgi4AO/WTK+b8ceW/E8clWvcjhDBOIn8TUX8g9A5iHiXIgRFvvg4K/40SaW8rVF4BJ4x+g/w67dlmswjzu2vkHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Br7ET8wE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31B1C4CEC3;
	Thu, 17 Oct 2024 06:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729147394;
	bh=iGjeDlxTBiPPB4AGJQHEuwATpp5oluypm7fswh60SgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Br7ET8wE9uhsRV1mBrm7pS5i4Pp9h/iKPq1blOjT+w8xm6EcRRXMKI7x7cw6mvnYg
	 bqrTTyVVd9VGo0esn/xW4kHJvuLgmfUuPL+iBc2PH+1Xs0iT5HLsWfV8kRQRkr0iBk
	 i/TmNq14W3X0sob3Y58fZlr8ssgRaO1cV0UKbnDM=
Date: Thu, 17 Oct 2024 08:43:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Marcello Sylvester Bauer <sylv@sylv.io>,
	USB mailing list <linux-usb@vger.kernel.org>,
	syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: dummy-hcd: Fix "task hung" problem
Message-ID: <2024101747-sudoku-stout-9ab9@gregkh>
References: <c1145389-2695-41d9-ac30-f8819c2ff679@rowland.harvard.edu>
 <670fd56c.050a0220.d9b66.016d.GAE@google.com>
 <2dab644e-ef87-4de8-ac9a-26f100b2c609@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dab644e-ef87-4de8-ac9a-26f100b2c609@rowland.harvard.edu>

On Wed, Oct 16, 2024 at 11:44:45AM -0400, Alan Stern wrote:
> The syzbot fuzzer has been encountering "task hung" problems ever
> since the dummy-hcd driver was changed to use hrtimers instead of
> regular timers.  It turns out that the problems are caused by a subtle
> difference between the timer_pending() and hrtimer_active() APIs.
> 
> The changeover blindly replaced the first by the second.  However,
> timer_pending() returns True when the timer is queued but not when its
> callback is running, whereas hrtimer_active() returns True when the
> hrtimer is queued _or_ its callback is running.  This difference
> occasionally caused dummy_urb_enqueue() to think that the callback
> routine had not yet started when in fact it was almost finished.  As a
> result the hrtimer was not restarted, which made it impossible for the
> driver to dequeue later the URB that was just enqueued.  This caused
> usb_kill_urb() to hang, and things got worse from there.
> 
> Since hrtimers have no API for telling when they are queued and the
> callback isn't running, the driver must keep track of this for itself.
> That's what this patch does, adding a new "timer_pending" flag and
> setting or clearing it at the appropriate times.
> 
> Reported-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-usb/6709234e.050a0220.3e960.0011.GAE@google.com/
> Tested-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler")
> Cc: Marcello Sylvester Bauer <sylv@sylv.io>
> Cc: stable@vger.kernel.org
> 
> ---
> 
> I expect this will fix a lot of the bugs that syzbot has found in the 
> last few months.

Nice!  Thanks for tracking this down and fixing it.

greg k-h

