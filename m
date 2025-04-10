Return-Path: <linux-usb+bounces-22871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB5A837D4
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 06:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB6FF8A44F3
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 04:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8401F0E56;
	Thu, 10 Apr 2025 04:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R++rCazk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0191C8609
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 04:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744259249; cv=none; b=G5Xy0D2KcajiWm9oFESatrMRjI0qsWKLBCbhF9n9UXw/T4dZjhMO7tn+GIQb1XSl8EVKadITJzTp7iA2R1S6sQft8mwT255J72s1fCwYXpKkrLiR+1g5mKNRCOh0Fbpf87N0bO/aWtH4iCv5B0dqUkCO2Xzrpr9QZo+hgXxhuT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744259249; c=relaxed/simple;
	bh=ajQyQf55NxToaWLCpRFts55GQKwV/RZ13SoSKFq4O8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5pqyPmkG4M5lJITgoHM4AqdYx0LJsaCZBX7+6DSBjzLgfiMNq/in2cnqjOxjtWyindAXjDzSet0MWzNK3F1aN9UjUs99BK5wrToXK5LjgkBKKOoAKUS7q1DYIO5zgCCq/6lXvFiB39sDXHh0hUNL/1VDtipssByLmYfLmmOt4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R++rCazk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744259247; x=1775795247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ajQyQf55NxToaWLCpRFts55GQKwV/RZ13SoSKFq4O8c=;
  b=R++rCazkqeXd8HlOkrH8YfbiMIWxSLOPfW0hrGWv+F4gpmm5di2hin7u
   YO3vJGOg7IYFOytbOEXhylL+ZdRHwXyOKXP7aHVzKzd9cijtX6URVZQ7B
   6ne/+GfAaZm48GDquVo4Wus4lQcUsGZI/fpRDS8sAmdb8oPCR99WL68W/
   6UDyQIQzNPS8ZT6k7aYPfsLzGb3ThF4UnIlm+4RpWCVzrfKaxHPqPMRyp
   HX5u2thHJwErEFYUzW9bWpVEa5dnTfxHxHhFQweMLeX33nwyL8627cnZd
   mMh9+2qhj3QrEkP0U3nlsEohwQgtR0WR1zM0CqYFfNme9zcJUH2XyDhfB
   Q==;
X-CSE-ConnectionGUID: kBkOB+scRtirP8pgrMf17g==
X-CSE-MsgGUID: Tu1w+OhMSqynEyld16daeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45851297"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45851297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 21:27:27 -0700
X-CSE-ConnectionGUID: ds1yBOCdQBuxOvO5d6WcDA==
X-CSE-MsgGUID: 6WcNiw5CSIOMwG63SjqSnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128639146"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2025 21:27:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 462B2368; Thu, 10 Apr 2025 07:27:24 +0300 (EEST)
Date: Thu, 10 Apr 2025 07:27:23 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
	Opal Voravootivat <puthik@google.com>,
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: Re: Wake on connect / wake on disconnect
Message-ID: <20250410042723.GU3152277@black.fi.intel.com>
References: <20250404060203.GM3152277@black.fi.intel.com>
 <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
 <20250404115346.GN3152277@black.fi.intel.com>
 <98539971-3b43-4d64-a105-6790198c46d1@amd.com>
 <20250404161008.GO3152277@black.fi.intel.com>
 <f9806a24-875f-4c44-9694-96b62a6aefd9@gmail.com>
 <5f9004aa-9b51-474d-9cb0-c8c4e23b19f4@kernel.org>
 <CAHQZ30C=7d1DkHYTixrgmArCwKHzhxBn602P=YY5rP6OcAXuVw@mail.gmail.com>
 <20250407055520.GP3152277@black.fi.intel.com>
 <dcf41124-d693-4b0f-a1d1-7ad7cd914449@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcf41124-d693-4b0f-a1d1-7ad7cd914449@kernel.org>

On Wed, Apr 09, 2025 at 12:03:52PM -0500, Mario Limonciello wrote:
> On 4/7/2025 12:55 AM, Mika Westerberg wrote:
> > On Fri, Apr 04, 2025 at 10:55:35AM -0600, Raul Rangel wrote:
> > > On Fri, Apr 4, 2025 at 10:20 AM Mario Limonciello <superm1@kernel.org> wrote:
> > > > 
> > > > 
> > > > 
> > > > On 4/4/25 11:16, Mario Limonciello wrote:
> > > > > 
> > > > > 
> > > > > On 4/4/25 11:10, Mika Westerberg wrote:
> > > > > > On Fri, Apr 04, 2025 at 10:03:18AM -0500, Mario Limonciello wrote:
> > > > > > > On 4/4/2025 6:53 AM, Mika Westerberg wrote:
> > > > > > > > On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote:
> > > > > > > > > On 4/4/25 01:02, Mika Westerberg wrote:
> > > > > > > > > > Hi Mario,
> > > > > > > > > > 
> > > > > > > > > > On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
> > > > > > > > > > > Mika,
> > > > > > > > > > > 
> > > > > > > > > > > Recently there are some conversations about wake-up from connect/
> > > > > > > > > > > disconnect
> > > > > > > > > > > happening and I wanted to get some background from you about the
> > > > > > > > > > > current
> > > > > > > > > > > policy set in tb_switch_suspend().
> > > > > > > > > > > 
> > > > > > > > > > > Wake on connect and disconnect are only used for runtime, not for
> > > > > > > > > > > system
> > > > > > > > > > > suspend.  Would you be open to adding wake on connect as well for
> > > > > > > > > > > system
> > > > > > > > > > > suspend?  This should help enable use cases like plugging in a
> > > > > > > > > > > closed laptop
> > > > > > > > > > > to a dock (which works on Windows).
> > > > > > > > > > 
> > > > > > > > > > Don't we already have a similar for all usb4_portX devices? That
> > > > > > > > > > does not
> > > > > > > > > > work for you?
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > I think that will functionally work - but I'll double check.
> > > > > > > > > 
> > > > > > > > > However usb_portX power/wakeup defaults are 'disabled' so this
> > > > > > > > > would need a
> > > > > > > > > udev rule.  Could we set the kernel default for those to 'enabled'
> > > > > > > > > instead?
> > > > > > > > 
> > > > > > > > No because that would trigger wakeup each time you unplug/plug and
> > > > > > > > this is
> > > > > > > > certainly not good if you close the lid, unplug from dock and throw the
> > > > > > > > laptop to your backpack. Chrome uses this with "dark resume" so if
> > > > > > > > this is
> > > > > > > > supported by the userspace then it can also enable these.
> > > > > > > 
> > > > > > > Ahhh.  I was thinking specifically with wake on connect that's not a
> > > > > > > problem, but the sysfs knob for the port changes both wake on connect
> > > > > > > and
> > > > > > > wake on disconnect.
> > > > > > > 
> > > > > > > Is there actually a use case for chrome with wake on disconnect?  IE
> > > > > > > if we
> > > > > > > didn't turn on wake on disconnect but defaulted to wake on connect would
> > > > > > > things be OK?  Or made the sysfs knob control only wake on disconnect?
> > > > > > 
> > > > > > Good guestion - I don't know ;-) The Chrome folks wanted this so I
> > > > > > suppose
> > > > > > their usecase is specifically that dark resume and I think that's when
> > > > > > you
> > > > > > unplug a device so disconnect. Not so sure about wake on connect.
> > > > > 
> > > > > I found the original patch from Rajat [1].
> > > > > 
> > > > > Rajat, any comments?  Could you loop in the right people from the Chrome
> > > > > side to ask?    I think my "preference" would be that we make "wake on
> > > > > connect" always enabled and then let the sysfs knob control "wake on
> > > > > disconnect".
> > > > > 
> > > > > [1] https://lore.kernel.org/linux-usb/20221101115042.248187-1-
> > > > > rajat.khandelwal@intel.com/
> > > > 
> > > > Oh Rajat's email bounced.  The only person I know that I've worked on
> > > > wakeup related stuff is Raul.  I'll add him.
> > > > 
> > > > Mika, Raul,
> > > > 
> > > > Could you pull in current Chrome people from Intel and Google that could
> > > > comment here?
> > > 
> > > + Opal who should be able to answer the question regarding wake on
> > > connect/disconnect.
> > 
> > Added Utkarsh from Intel side.
> 
> I had another look at usb4_port.c the flows used.  This is the call path:
> 
> tb_switch_suspend()
> ->tb_switch_set_wake()
> ->->usb4_switch_set_wake()
> 
> The flags for wakeup policy are set in tb_switch_suspend() and then passed
> as arguments down to usb4_switch_set_wake().  This enumerates whether wake
> is set for any usb4_port device and applies the flags to that device.

Indeed. So this actually never worked.

> So AFAICT that means that even on ChromeOS there won't be a wake on connect
> or wake on disconnect event for suspend/resume no matter what the sysfs
> files for each port are set to.
> 
> In summary; my ask is whether we can do this:
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 6a2116cbb06f9..f2f6a085a742b 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -3599,6 +3599,7 @@ void tb_switch_suspend(struct tb_switch *sw, bool
> runtime)
>                 flags |= TB_WAKE_ON_USB4;
>                 flags |= TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE | TB_WAKE_ON_DP;
>         } else if (device_may_wakeup(&sw->dev)) {
> +               flags |= TB_WAKE_ON_CONNECT;
>                 flags |= TB_WAKE_ON_USB4 | TB_WAKE_ON_USB3 |
> TB_WAKE_ON_PCIE;
>         }
> 
> That would allow the use case of "plug in a closed laptop to a dock" and it
> wakes up.

I think we should set both here. Someone will want the unplug to behave the
same and at that point it is hard to change anymore to avoid breaking
things. Then it is up to the userspace to enable per USB4 port, and deal
with (e.g dark resume).

