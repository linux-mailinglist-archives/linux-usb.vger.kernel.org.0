Return-Path: <linux-usb+bounces-23191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC4A91974
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 12:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FEBF19E3F49
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 10:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D4D1FCFDB;
	Thu, 17 Apr 2025 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edRX0BOe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4103D994
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744886013; cv=none; b=uS31n1wk8kgjd2MI73Nv9efsgCssDd/S4iKpbqb4Ed5wUXrLDhT+kG3EAnACSizHSx2cdTMEitM72ShJaQEoQjgKp6bwqpyKOB7g16hwVrVK21BdEvvpxzqA3VTE8J5dYyKrdY0Hg+5I8r3rE0Uig07FMZmIoUm5y63mal4FPbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744886013; c=relaxed/simple;
	bh=1k5oeOr6MU5KrFL0jRdVFbKJGabzvU03KuPm3VMuiNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWBR8qT7Hjcb8UwKMYf0IMgZcWVz/fOhXQfZKS5E0ZltGY42bkRbTIWa40b5Xk7hFqnhGIthhq55at8KE4xv/06j6FQ9hckFzL8qh4VMCrAEgdfVKq6vZqMzsTm78B3OtptCf/hkP98whMyXmIM4jTQY0yzp5I+bewlnt5hAWkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edRX0BOe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744886012; x=1776422012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1k5oeOr6MU5KrFL0jRdVFbKJGabzvU03KuPm3VMuiNI=;
  b=edRX0BOeoJa/cI2ZcOgkXKGAKyuNetPnQr3KdI7srUvZrbwdj+rE2/oi
   38vVFHAdI4CY0cj8yCgN10MZ6JG15Oz61tyovZSqaEBAMK/m+rJ5DyQGM
   N/VbfoSaPJECbAKbPUgOwfpOsNoeGQfsd+QFBRnOhFuuWQ+YtrBZ2j47+
   DS0xJFuDIVIubK7G5urci/MBWOH4TN0ag2uGt4RiL59QY57Q+U/oTgqKP
   +lT/yU0YwodoQDZPrEXxYZpnsj3Gdt76l5Ozz3/LtNRa/Amn20bdarM0W
   aiYQu9G9kZsMNAE2d+5YUVrMiFax/9FgSWeax34rFeaS6nn0UgTJ3mvmU
   g==;
X-CSE-ConnectionGUID: jKuli8Z4QA6oQFzTpsxjgg==
X-CSE-MsgGUID: j5nAbjmNSNG6nCbJvsr8MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57838004"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57838004"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:33:31 -0700
X-CSE-ConnectionGUID: qduu274EStG5mkfoBFfCeQ==
X-CSE-MsgGUID: Pj4LuqR+QyaHauz6QEFaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130712582"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2025 03:33:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 33309170; Thu, 17 Apr 2025 13:33:27 +0300 (EEST)
Date: Thu, 17 Apr 2025 13:33:27 +0300
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
Message-ID: <20250417103327.GD88033@black.fi.intel.com>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
 <20250417090426.221773-5-mika.westerberg@linux.intel.com>
 <2025041759-slimy-subzero-a6ba@gregkh>
 <20250417100456.GC88033@black.fi.intel.com>
 <2025041712-cupbearer-playhouse-d035@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025041712-cupbearer-playhouse-d035@gregkh>

On Thu, Apr 17, 2025 at 12:25:19PM +0200, Greg KH wrote:
> On Thu, Apr 17, 2025 at 01:04:56PM +0300, Mika Westerberg wrote:
> > On Thu, Apr 17, 2025 at 11:39:38AM +0200, Greg KH wrote:
> > > On Thu, Apr 17, 2025 at 12:04:26PM +0300, Mika Westerberg wrote:
> > > > From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > > 
> > > > Add documentation about the Thunderbolt/USB4 tunneling events to the
> > > > user’s and administrator’s guide.
> > > > 
> > > > Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > ---
> > > >  Documentation/admin-guide/thunderbolt.rst | 33 +++++++++++++++++++++++
> > > >  1 file changed, 33 insertions(+)
> > > > 
> > > > diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
> > > > index d0502691dfa1..f0368ab6bd1f 100644
> > > > --- a/Documentation/admin-guide/thunderbolt.rst
> > > > +++ b/Documentation/admin-guide/thunderbolt.rst
> > > > @@ -296,6 +296,39 @@ information is missing.
> > > >  To recover from this mode, one needs to flash a valid NVM image to the
> > > >  host controller in the same way it is done in the previous chapter.
> > > >  
> > > > +Tunneling events
> > > > +----------------
> > > > +The driver sends ``KOBJ_CHANGE`` events to userspace when there is a
> > > > +tunneling change in the ``thunderbolt_domain``. The notification carries
> > > > +following environment variables::
> > > > +
> > > > +  TUNNEL_EVENT=<EVENT>
> > > > +  TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
> > > 
> > > I'm ok with this, but wow TUNNEL_DETAILS is going to be hard to parse by
> > > userspace, right?  Is this something that it is supposed to do something
> > > with?
> > 
> > Yes, the reason it looks like that is because it matches the "format" we
> > use in the logging (in dmesg). For instance:
> > 
> > [   35.400488] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): activating
> > [   35.401237] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> > [   35.401239] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> > [   35.401493] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): bandwidth allocation mode supported
> > [   35.402528] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
> > [   35.402773] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): maximum bandwidth through allocation mode 20000 Mb/s x4 = 77575 Mb/s
> > [   35.402775] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): granularity 500 Mb/s
> > [   35.403029] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): estimated bandwidth 103500 Mb/s
> > [   35.404693] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): bandwidth allocation mode enabled
> 
> Kernel logs are not supposed to always be parsable, so this is fine :)
> 
> > This allows matching the event with dmesg tunnel logs. If you think this is
> > not good we can change it.
> 
> It depends on what you are expecting userspace to do with this
> information.  If it's a simple "here's some debugging information you
> might like to look at" then it's fine.  If it is "here is some
> information that you need to take a programatic action based on", then
> that's different.

It's purely informative. Userspace cannot take any programmatic action
based on this but it can use this to display user "more details" for
example if there is an error allocating bandwidth for DisplayPort.

