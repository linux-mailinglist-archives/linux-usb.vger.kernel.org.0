Return-Path: <linux-usb+bounces-21498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757E8A56774
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 13:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F2E83B6E1B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 12:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB82217F31;
	Fri,  7 Mar 2025 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRfrv76M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A5621771F
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348977; cv=none; b=O3s2NJXbF4YBlJuVbCQrsGMpei9fFjy7inb7cjK8Y+SK/2XSkaIM4p/kKWqtk5rfgXNZOSqPpJ1j4d7/wW8ZA9rOl139muqH+DWna+JOFyAHYRS74YaW9wXyZ5EB8ofFAeLhzfvaJyh1dZ5gSg+sXuUswGRLbpttZX+SglHbFek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348977; c=relaxed/simple;
	bh=WDQ/J35VeQiU6EiLcZEAtMBmE6VPU7FDeMEznRUQJf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3t08tJWyYoh8w0eiDwX9Pixdnq15ZOPD8ZJhf9zjmpJqhqBPf2vOTS6MWOXmqejo2hCEzB8MKhM6TDUGEHvxEd1+e4Kh0ev8iVcxNxZJqlp8vWe0rYi1REfjbL4HOhe9DOosNOZB4BMgyvHpc8PnwQED7AqZ7v8qjaMD+ciULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRfrv76M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741348975; x=1772884975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WDQ/J35VeQiU6EiLcZEAtMBmE6VPU7FDeMEznRUQJf4=;
  b=hRfrv76MjHLuWVeUaZUXHfUDlVvkz5YUCVdxIVbBbl6LJ9aCXPPAIEld
   6CzzlB4RbS9iEPe6Yto/Zl/iTWpu+Ss6fstFt2Gp+76rGdj07AVLtEmmS
   hWNzxpK41x8GniPCr/J6C+F3b44j+UpWWRs/X2BIxwVUua4HrydwlWB0d
   5m6umDlMsgt3+ZrA5sDDE/De42ICP/Wa2TT6e0yHdUUzv/m2Dz85LtW/u
   UBZ4zApye/F8ZZI5LnH5yECSZL0lHRuruqSAKkusk1wfpIp10sdYlgahr
   SXEFzPyDbnymOXs95fImq9OBvQMlSC6q3X28YNiOjAnQjIA0A692N0MgK
   A==;
X-CSE-ConnectionGUID: 5raeXew4TWiznlrR0+E6qQ==
X-CSE-MsgGUID: 7Usj3ngLRUia9v/5tBcS4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42306631"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42306631"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 04:02:55 -0800
X-CSE-ConnectionGUID: sKUhsPegTrS3P/O64P4NKQ==
X-CSE-MsgGUID: z+2sClncRuSnbmbwFuTOeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119809832"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 07 Mar 2025 04:02:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D0F40224; Fri, 07 Mar 2025 14:02:51 +0200 (EET)
Date: Fri, 7 Mar 2025 14:02:51 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <yehezkelshb@gmail.com>
Cc: linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Kenneth Crudup <kenny@panix.com>
Subject: Re: [PATCH] thunderbolt: Prevent use-after-free in resume from
 hibernate
Message-ID: <20250307120251.GY3713119@black.fi.intel.com>
References: <20250306084145.373237-1-mika.westerberg@linux.intel.com>
 <CA+CmpXtBaaqzyJ8E8G7f5DA4AQ=6XFGk28h7LvNLHaG2ubwjKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CmpXtBaaqzyJ8E8G7f5DA4AQ=6XFGk28h7LvNLHaG2ubwjKw@mail.gmail.com>

On Thu, Mar 06, 2025 at 12:29:14PM +0200, Yehezkel Bernat wrote:
> On Thu, Mar 6, 2025 at 10:41 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
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
> 
> Reviewed-by: Yehezkel Bernat <YehezkelShB@gmail.com>

Thanks! Applied to thunderbolt.git/fixes.

