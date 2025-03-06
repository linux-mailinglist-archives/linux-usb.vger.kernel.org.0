Return-Path: <linux-usb+bounces-21454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22237A54FF5
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 17:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AEE116F4CA
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 16:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27F01991CF;
	Thu,  6 Mar 2025 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H635LqcC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F5EC2
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276852; cv=none; b=tBog5vwXxWHm5eWWXBxHWZiOC40/JQ6me9PXn5FvRTOgzIGLrqJ36KYRZ5ornHIztgSWfWWkXq8TPilZJDsPCo6KNOtgYR1n4nbxp0ow1AUeMc7RamZAq5f7hrtTsdrXptRsUU6Sz2YwFWi7S3YEG+MeuDj8W87rhG0yigN4RsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276852; c=relaxed/simple;
	bh=LwJDGiSsSBRJ0hdXKaK7GyXIyt8zaT8LzCWVP7ie9nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua8vxEOoCwjQB8mv+JtH8QA0CjseaR6D0vC07ZsWM/UhMU7xPbAWwpmyY9zYXKBIrkf5A0PwYANAjbKqeKpKRYO+O3MctzFkHpfw8eog3v4a5DKlFtcrer4zqjh4p3V+XtnGxFab3xGWzmUBg9wTyNz0SNU8WVnQPfST6P6zt/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H635LqcC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741276850; x=1772812850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LwJDGiSsSBRJ0hdXKaK7GyXIyt8zaT8LzCWVP7ie9nc=;
  b=H635LqcC3OKAUTD87FjOcm/JyuVNbSStYdOmG6O9cEz/VoO0DlhHUaqI
   q9S+KvUZbKZzRPm7S2fVahjHnAbyWDbk+mN5YKmmHpFWmfBTU0Peq+qNV
   lrpfNPlwRsUUPhifCZ6VCiHLQqXkFEpcUwEofIXCKuh6+qUPAzaXmjbqY
   fgMilRFi/CYFotkqNzrETukamEmOn12Z7j5jtKx/NhYaNqK3sd9pyOvVO
   YtugYlee+7aL2W306pYqIjl+12FjbPOE2mIJZhspbxphSLh7bAuRcDdXn
   0o9X4DYwfgUkSsJN0AjJWOmxH6t+E7Ls1dUP16FgrmqfTgqKBuflnqwfo
   w==;
X-CSE-ConnectionGUID: NrsRu3J2T92UhoAgc79zaA==
X-CSE-MsgGUID: UNvLbUtFQU6jB3AZWCNw+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41546000"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="41546000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 08:00:50 -0800
X-CSE-ConnectionGUID: RHv2kHYzTcm6YFZ7wSzSPA==
X-CSE-MsgGUID: O8SO9GmTRJyZxeK1gtH9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124274694"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2025 08:00:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9FDDB1FC; Thu, 06 Mar 2025 18:00:46 +0200 (EET)
Date: Thu, 6 Mar 2025 18:00:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Kenneth Crudup <kenny@panix.com>
Subject: Re: [PATCH] thunderbolt: Prevent use-after-free in resume from
 hibernate
Message-ID: <20250306160046.GW3713119@black.fi.intel.com>
References: <20250306084145.373237-1-mika.westerberg@linux.intel.com>
 <2025030644-unbraided-drool-647f@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025030644-unbraided-drool-647f@gregkh>

On Thu, Mar 06, 2025 at 04:45:22PM +0100, Greg KH wrote:
> On Thu, Mar 06, 2025 at 10:41:45AM +0200, Mika Westerberg wrote:
> > Kenneth noticed that his laptop crashes randomly when resuming from
> > hibernate if there is device connected and display tunneled. I was able
> > to reproduce this as well with the following steps:
> > 
> >   1. Boot the system up, nothing connected.
> >   2. Connect Thunderbolt 4 dock to the host.
> >   3. Connect monitor to the Thunderbolt 4 dock.
> >   4. Verify that there is picture on the screen.
> >   5. Enter hibernate.
> >   6. Exit hibernate.
> >   7. Wait for the system to resume.
> > 
> >   Expectation: System resumes just fine, the connected monitor still
> >                shows screen.
> >   Actual result: There is crash during resume, screen is blank.
> > 
> > What happens is that during resume from hibernate we tear down any
> > existing tunnels created by the boot kernel and this ends up calling
> > tb_dp_dprx_stop() which calls tb_tunnel_put() dropping the reference
> > count to zero even though we never called tb_dp_dprx_start() for it (we
> > never do that for discovery). This makes the discovered DP tunnel memory
> > to be released and any access after that causes use-after-free and
> > possible crash.
> > 
> > Fix this so that we only stop DPRX flow if it has been started in the
> > first place.
> > 
> > Reported-by: Kenneth Crudup <kenny@panix.com>
> > Closes: https://lore.kernel.org/linux-usb/8e175721-806f-45d6-892a-bd3356af80c9@panix.com/
> > Cc: stable@vger.kernel.org
> > Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation asynchronously")
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/thunderbolt/tunnel.c | 11 ++++++++---
> >  drivers/thunderbolt/tunnel.h |  2 ++
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> Want me to take this now?  Or are you going to send it on in a later
> pull request to me?  Whichever is easier for you is fine with me.

I will send it later in a pull request, thanks!

