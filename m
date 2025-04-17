Return-Path: <linux-usb+bounces-23193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EE5A9199D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 12:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7872461528
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 10:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F172B22CBC1;
	Thu, 17 Apr 2025 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dn9l+oDi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EDC2DFA42
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744886777; cv=none; b=nnxGnFFUAuAuwo+mcJ1ChoXmuz2JSxc74gfFCot3Ije6jd9TUsuDLXJjjMlDJMxk4LadcY11fevFlqiNGTzC0Z72F2aUTIsmnFBX92dxRlCfmFPIWc106+v6xuDtE+OF7Ec+wHDNuB5abQMriQSUDxvtS+sfQ14DXJUAmv4GewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744886777; c=relaxed/simple;
	bh=srGZgaumkYLmFBTMjgjNZU8L4VBsvSnD/ouHqchIPb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptZpCr+9AuUpWijVo9JQc4NXgqWcGNohLWnl/vc04w4XINIB2Vm8FZFUF/n2k493xd6DSXfg+1wm5eCx/51mVic39T+3yT+rbRK1V4XeDD0mX8wiDyKtLv/MEmNzzjzzrUtO61w7rW9yIynEcjrkWWaE0dMPWVhwT/qB0GWF3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dn9l+oDi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744886776; x=1776422776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=srGZgaumkYLmFBTMjgjNZU8L4VBsvSnD/ouHqchIPb4=;
  b=dn9l+oDil99uzOeysMHKwEPbtXEnHRwB8c9MXGMRGS5BXPBelN99raMt
   91pUiL1xJPFCvs3USipKs6a1Mirz7bt5LkfdKV8zjfZumF6dGB7IKxdoS
   nqImrZFH9wF0psaqUclSeMbWsMPaGBeG1KfD8XWcYRoE2FdZAGHh8K1lK
   Aiwe7GIAwi1mfcvzEChuGyJMkAEpYw8OOiscpxl5RgyXqngTH7dAA5CoB
   PHaDADb4utbO3T4h+XE14pSno5n8eNZ6cojIsZBRKLFQNtzfH8tH4rfUr
   vxAOC9urB5S5o6qTsHUAz7Dbo01Y3YkiDYDy7roYP9yQEPHnlYOmJYDvH
   A==;
X-CSE-ConnectionGUID: mPfVfHBzSXWbFea09Do3yw==
X-CSE-MsgGUID: wYodaZCZS6id44DdmDIE4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68959169"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="68959169"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:46:15 -0700
X-CSE-ConnectionGUID: dyB+MRzOQOeMhVkNvYqQyg==
X-CSE-MsgGUID: Ozla6RslTFCWobgeoV7R+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130727291"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2025 03:46:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E8330170; Thu, 17 Apr 2025 13:46:11 +0300 (EEST)
Date: Thu, 17 Apr 2025 13:46:11 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH v2 4/4] Documentation/admin-guide: Document
 Thunderbolt/USB4 tunneling events
Message-ID: <20250417104611.GE88033@black.fi.intel.com>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
 <20250417090426.221773-5-mika.westerberg@linux.intel.com>
 <2025041759-slimy-subzero-a6ba@gregkh>
 <20250417100456.GC88033@black.fi.intel.com>
 <2025041712-cupbearer-playhouse-d035@gregkh>
 <20250417103327.GD88033@black.fi.intel.com>
 <2025041722-untidy-cannot-40d4@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025041722-untidy-cannot-40d4@gregkh>

On Thu, Apr 17, 2025 at 12:41:57PM +0200, Greg KH wrote:
> On Thu, Apr 17, 2025 at 01:33:27PM +0300, Mika Westerberg wrote:
> > On Thu, Apr 17, 2025 at 12:25:19PM +0200, Greg KH wrote:
> > > On Thu, Apr 17, 2025 at 01:04:56PM +0300, Mika Westerberg wrote:
> > > > On Thu, Apr 17, 2025 at 11:39:38AM +0200, Greg KH wrote:
> > > > > On Thu, Apr 17, 2025 at 12:04:26PM +0300, Mika Westerberg wrote:
> > > > > > From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > > > > 
> > > > > > Add documentation about the Thunderbolt/USB4 tunneling events to the
> > > > > > user’s and administrator’s guide.
> > > > > > 
> > > > > > Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > > > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > > > ---
> > > > > >  Documentation/admin-guide/thunderbolt.rst | 33 +++++++++++++++++++++++
> > > > > >  1 file changed, 33 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
> > > > > > index d0502691dfa1..f0368ab6bd1f 100644
> > > > > > --- a/Documentation/admin-guide/thunderbolt.rst
> > > > > > +++ b/Documentation/admin-guide/thunderbolt.rst
> > > > > > @@ -296,6 +296,39 @@ information is missing.
> > > > > >  To recover from this mode, one needs to flash a valid NVM image to the
> > > > > >  host controller in the same way it is done in the previous chapter.
> > > > > >  
> > > > > > +Tunneling events
> > > > > > +----------------
> > > > > > +The driver sends ``KOBJ_CHANGE`` events to userspace when there is a
> > > > > > +tunneling change in the ``thunderbolt_domain``. The notification carries
> > > > > > +following environment variables::
> > > > > > +
> > > > > > +  TUNNEL_EVENT=<EVENT>
> > > > > > +  TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
> > > > > 
> > > > > I'm ok with this, but wow TUNNEL_DETAILS is going to be hard to parse by
> > > > > userspace, right?  Is this something that it is supposed to do something
> > > > > with?
> > > > 
> > > > Yes, the reason it looks like that is because it matches the "format" we
> > > > use in the logging (in dmesg). For instance:
> > > > 
> > > > [   35.400488] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): activating
> > > > [   35.401237] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> > > > [   35.401239] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> > > > [   35.401493] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): bandwidth allocation mode supported
> > > > [   35.402528] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
> > > > [   35.402773] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): maximum bandwidth through allocation mode 20000 Mb/s x4 = 77575 Mb/s
> > > > [   35.402775] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): granularity 500 Mb/s
> > > > [   35.403029] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): estimated bandwidth 103500 Mb/s
> > > > [   35.404693] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): bandwidth allocation mode enabled
> > > 
> > > Kernel logs are not supposed to always be parsable, so this is fine :)
> > > 
> > > > This allows matching the event with dmesg tunnel logs. If you think this is
> > > > not good we can change it.
> > > 
> > > It depends on what you are expecting userspace to do with this
> > > information.  If it's a simple "here's some debugging information you
> > > might like to look at" then it's fine.  If it is "here is some
> > > information that you need to take a programatic action based on", then
> > > that's different.
> > 
> > It's purely informative. Userspace cannot take any programmatic action
> > based on this but it can use this to display user "more details" for
> > example if there is an error allocating bandwidth for DisplayPort.
> 
> Ok, that's fine then, hopefully no one tried to parse it in the future.

;-)

> You might say "the format of this string may change over time" or
> something like that?

Good idea, We'll do that.

