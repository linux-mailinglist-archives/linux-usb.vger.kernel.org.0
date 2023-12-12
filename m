Return-Path: <linux-usb+bounces-4039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FEE80EAD1
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 12:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 845DF281DF8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 11:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1215DF12;
	Tue, 12 Dec 2023 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0WDPurv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD24BAF
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 03:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702381864; x=1733917864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=P0t1t57IX7xVKLKYoBkVVsDdvO73laF8MKVFZwCwRVI=;
  b=V0WDPurvxlKsKiosqdteAXhD4BkBIfz2qN1zqDTAIt6c79/y0i+DjxLR
   89lovolTWcjigTkPjBTov85qa4Zw4jOS9bFLwmfXiXXKAsNIdpi95UHu+
   XRE3gm3NuK7SXa3WAH37Oi6yy1C9gDm2YuRLieq7PRIUsEup8Vn+6Cq/W
   w+NZ23IxB+3mYQJFu0LRLW1eGJ9CLoo481QtxRDRI6y1CCPm1aGt/zRcF
   Z+HSjfcCpLeS3jUT3S4gVgMmnzIsJ5O2eXQGqlcWDyddUjzKe2WoK7kQv
   +aeqFetMsnIAq1/bTQaSla6JxRPsmRcKc9KXFj4in/Bh0AwjgOFY57ggj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1654366"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1654366"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 03:51:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="864183103"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="864183103"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by FMSMGA003.fm.intel.com with SMTP; 12 Dec 2023 03:51:02 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 12 Dec 2023 13:51:01 +0200
Date: Tue, 12 Dec 2023 13:51:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rajaram R <rajaram.officemail@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-usb@vger.kernel.org
Subject: Re: Test USB Type-C port?
Message-ID: <ZXhJJY8RTbaRLHNe@kuha.fi.intel.com>
References: <7ac2c860-3ee4-4431-b52b-904cafd7f213@molgen.mpg.de>
 <ZVy3wnSc0i4jGYh2@kuha.fi.intel.com>
 <d5eb3cd6-763e-4dce-bbb6-3af0e96077db@molgen.mpg.de>
 <CAOiXha+pofkzjaEEFf7=mSENaoFokG_apAfMDi+v4bPugWRE-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOiXha+pofkzjaEEFf7=mSENaoFokG_apAfMDi+v4bPugWRE-w@mail.gmail.com>

On Tue, Dec 12, 2023 at 10:54:14AM +0530, Rajaram R wrote:
> On Tue, Dec 12, 2023 at 10:03 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> >
> > Dear Heikki,
> >
> >
> > Thank you for your reply.
> >
> > Am 21.11.23 um 14:59 schrieb Heikki Krogerus:
> >
> > > On Tue, Nov 21, 2023 at 12:30:34AM +0100, Paul Menzel wrote:
> > >> To test a USB Type-C port for conformance to the specification, is it
> > >> possible to connect two Linux devices using a USB Type-C cable, and run some
> > >> programs on each?US
> > >>
> > >> (I started using a Dell XPS 13 9360 from 2016, and sometimes experience
> > >> troubles with USB Type-C adapters/port replicators and want to verify that
> > >> the USB Type-C port works according to the specification.)
> > >
> > > Unfortunately USB Type-C is handled in firmware on those computers. We
> > > can only query the status of some basic things using an interface
> > > called UCSI, but most details are completely hidden from the
> > > operating system.
> >
> > Interesting. Although now not necessary Linux kernel related, there
> > should be such test frameworks to test such a port “for compliance”. Can
> > you recommend the one you or Intel are using?
> >
> 
> You could use this debugfs infra to test PD Controller flows between
> two systems: https://www.spinics.net/lists/linux-usb/msg244979.html
> We also have a wrapper for this debugfs here :
> https://github.com/Rajaram-Regupathy/libtypec/commit/ac3e1d07e3bae338fdb73e2bfd3151f5a9a09a57

So that is for UCSI.

USB Type-C and USB PD compliance can be tested using oscilloscopes and
analysers that supply some kind of USB Type-C/PD compliance test suite
software, and there are also dedicated USB Type-C/PD tester systems.
These just as an example:

https://cdn.teledynelecroy.com/files/pdf/grl-usb-pd-lecroy-datasheet.pdf
https://www.graniteriverlabs.com/en-us/test-solutions/protocol-power-test-solutions/usb-pd-c2
https://www.keysight.com/us/en/lib/software-detail/computer-software/s94usbcb-usb-type-c-interconnects-compliance-test-software.html

If you were wondering is there something like a command verifier tool
that can be used to test the USB Power Delivery specification
compliance (like what we have for USB - USB2CV and USB3CV) then there
is no such thing. We can not tap into the actual communication in the
operating system using UCSI. You will need an external analyser if you
want to do compliance testing I'm afraid.

> > > There have been a lot of problems with the UCSI interface on older XPS
> > > 13 and Latitude systems. Some of those problems have a workaround in
> > > the driver, but not everything.
> >
> > Do you know, how Microsoft Windows handles these problems? Also with quirks?

I don't know...

I know some of the issues did not affect Microsoft Windows at least in
the past, because the problematic UCSI commands were quite simply not
required/used in Windows. But for example the issue where the firmware
generates UCSI event before making the data available, that I really
would have assumed affects also Windows. Maybe there is some delay in
the Windows driver (that is not in the specification) that hides this
and many other issues (I'm only guessing).

There are also issues that are caused because the UCSI firmware side
is implemented so that it just passes validation tests without paying
attention on the actual features. So for example, some laptops will
report the port alternate modes correctly, but not the partner
alternate modes. The validation test suite in Windows most likely only
checks the port alternate modes, so test passed.

thanks,

-- 
heikki

