Return-Path: <linux-usb+bounces-23189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11EA918BE
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 12:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A19C3BEBF4
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E64422A7E3;
	Thu, 17 Apr 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBEuwu+2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002C71D63D6
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884301; cv=none; b=AyJn4ZJddcfB2F+AeeUu1njN7ajgjhXP//Lue5E952SuzUO1Ldmg1EcNaR+6yB1ErsUlr3q40J8asQ6BKyHSLV3i6lmP5qwcto1VDq93h5bmH+4vKugMFoO9PV/6UJ0cRN4QjsYGr1MhrgVbLPmwHk9Bb6SZJqlRbsHY/9jT7/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884301; c=relaxed/simple;
	bh=kwIIERLWXa4xim4gvIc4j0lN0Do6J0awtVSCRHVbBHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AztSF256/e8IuRyZktXead4BPU4NBw3eu9rJyM9o7F99Zkxf6oeas22TXddPRNgaUFyXAgQlUGK02zAPeQaw4eXoWwdwvf1QeI7BUEzqaHnFJQD26WQxMEv8iDGfZ9MPRP0eykOEtWnOGdhN5UCIe0nbyDeVSMdPbKtbrcIoxAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBEuwu+2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744884300; x=1776420300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kwIIERLWXa4xim4gvIc4j0lN0Do6J0awtVSCRHVbBHI=;
  b=SBEuwu+2xK3r1vjdp2RWWpM56Ly0PerSbTEXNYyOCLAQqxYRDFSM1zMC
   dKnJ1ug1xgtCat+VdDbd9YFF+734TvQ3ZBV8IafudMSI6eAP4fv60s5ax
   AdMwvjTlw9qI6qe1Dy2afBmFb/sgDlnE79oIEjtO36VonOCLZuaMIi9F+
   wQnaZR22/+XMM9RCVe9kcWzSWW0ZHwxqWlqn1ACvbKQEuVhCW2FN/8+cG
   o/ZLesvGoB8Wk7VEUz4VymJB6n8xSfJqj5Qah5ezxbA0TLB0qjCm7zZY5
   m3WbG/Lwr6Nagvk1jq0UabKYPNAZ2BX/lHOI0M2WSj0iWlGt5FjyzGukV
   Q==;
X-CSE-ConnectionGUID: 8nJAF427Sn228z2FF7wJSg==
X-CSE-MsgGUID: sRyzuLQkQ5y0zYMyG5SQaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="71850164"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="71850164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:04:59 -0700
X-CSE-ConnectionGUID: 6nEnFbLzTrSb9fKLqsUKTQ==
X-CSE-MsgGUID: g51ET1paTOWu1RfmFbbruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131292776"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 03:04:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5B091170; Thu, 17 Apr 2025 13:04:56 +0300 (EEST)
Date: Thu, 17 Apr 2025 13:04:56 +0300
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
Message-ID: <20250417100456.GC88033@black.fi.intel.com>
References: <20250417090426.221773-1-mika.westerberg@linux.intel.com>
 <20250417090426.221773-5-mika.westerberg@linux.intel.com>
 <2025041759-slimy-subzero-a6ba@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025041759-slimy-subzero-a6ba@gregkh>

On Thu, Apr 17, 2025 at 11:39:38AM +0200, Greg KH wrote:
> On Thu, Apr 17, 2025 at 12:04:26PM +0300, Mika Westerberg wrote:
> > From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > 
> > Add documentation about the Thunderbolt/USB4 tunneling events to the
> > user’s and administrator’s guide.
> > 
> > Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  Documentation/admin-guide/thunderbolt.rst | 33 +++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> > 
> > diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
> > index d0502691dfa1..f0368ab6bd1f 100644
> > --- a/Documentation/admin-guide/thunderbolt.rst
> > +++ b/Documentation/admin-guide/thunderbolt.rst
> > @@ -296,6 +296,39 @@ information is missing.
> >  To recover from this mode, one needs to flash a valid NVM image to the
> >  host controller in the same way it is done in the previous chapter.
> >  
> > +Tunneling events
> > +----------------
> > +The driver sends ``KOBJ_CHANGE`` events to userspace when there is a
> > +tunneling change in the ``thunderbolt_domain``. The notification carries
> > +following environment variables::
> > +
> > +  TUNNEL_EVENT=<EVENT>
> > +  TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
> 
> I'm ok with this, but wow TUNNEL_DETAILS is going to be hard to parse by
> userspace, right?  Is this something that it is supposed to do something
> with?

Yes, the reason it looks like that is because it matches the "format" we
use in the logging (in dmesg). For instance:

[   35.400488] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): activating
[   35.401237] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
[   35.401239] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
[   35.401493] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): bandwidth allocation mode supported
[   35.402528] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
[   35.402773] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): maximum bandwidth through allocation mode 20000 Mb/s x4 = 77575 Mb/s
[   35.402775] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): granularity 500 Mb/s
[   35.403029] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): estimated bandwidth 103500 Mb/s
[   35.404693] thunderbolt 0000:07:00.0: 0:13 <-> 1:19 (DP): bandwidth allocation mode enabled

This allows matching the event with dmesg tunnel logs. If you think this is
not good we can change it.

