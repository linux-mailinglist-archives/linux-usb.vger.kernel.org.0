Return-Path: <linux-usb+bounces-2335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2587DB451
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 08:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6B271F21225
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 07:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79758612B;
	Mon, 30 Oct 2023 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQz0Z++h"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0266AA6
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 07:30:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEE2C0;
	Mon, 30 Oct 2023 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698651038; x=1730187038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gXWZpt2Baaec3XxSr1059DajNSiecR9cDaFSnzG5vok=;
  b=PQz0Z++h+BP1Pp3w2Bxw6+Qo1Y2ZSKqN73ddO+qj6NXCK/A+weiygUyd
   bz40V9A4bvaZd5ikDMyW8IdpqiMTKi8asPWSTwKx5VuqCMLx3u7QrFiTK
   toLrlTePKCeH+YgDM6K6SJF3pJ6oMNr3yLg1eipwjfMW5wbcz5hUr8rzQ
   sXWRgZ99C/5D6IWseIAAEL6F71ZPrfqk2Ix4IASG87PYDilYSiaewppk4
   VsL12DYGbf8TCX6z4x4x5C6BRIB866W/cUK79jpoxUwtwuoMSHyO0bSlJ
   2AkfKEC3vbH85bRQmSg9Jf4CTZd5Z2IQUgQfdUrVvyIyD8/fTR8+z7aUb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="390884489"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="390884489"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 00:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="736661418"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="736661418"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga006.jf.intel.com with SMTP; 30 Oct 2023 00:30:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 30 Oct 2023 09:30:34 +0200
Date: Mon, 30 Oct 2023 09:30:34 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: gregkh@linuxfoundation.org, linux@roeck-us.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	badhri@google.com, stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: tcpm: only discover modes the port
 supports svids for
Message-ID: <ZT9bBnKPMTDqy6aW@kuha.fi.intel.com>
References: <20231016232816.3355132-2-rdbabiera@google.com>
 <ZTDkIGLmjmL9HwJP@kuha.fi.intel.com>
 <CALzBnUF-EZjFEHCc4XRLdFr5yP8dCq7De4SaNif32LcL5=tMYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALzBnUF-EZjFEHCc4XRLdFr5yP8dCq7De4SaNif32LcL5=tMYA@mail.gmail.com>

Hi,

I'm sorry to keep you waiting.

<snip>

> > If you need the modes to be discovered in some specific order, then we
> > need the framework to allow you to do that. So perhaps the tcpci
> > drivers should be able to supply the preferred order to the tcpm?
> >
> > But as such, unless I'm mistaken, this patch will change the logic so
> > that only the partner alt modes that the port supports get registered,
> > and that way are exposed to the user. You can't do that - right now
> > it's the only way we can inform the user about them. All partner
> > alternate modes (at least the SVIDs) must be exposed to the user one
> > way or the other, regardless does the port support them or not.
> 
> The test this patch tries to fix could just be written without consideration
> of this. My guess is that the test was designed such that the SVIDs before
> the DisplayPort SVID are unknown to the port under test so the mentality
> could have been "why should a port care about SVIDs it doesn't know
> about?"
> 
> A defense I could make for it is that the USB PD CTS doesn't test
> to see if a port under test sends Discover Modes for every SVID returned
> in a Discover SVIDs ACK, so the interpretation isn't invalid. I've seen other
> tcpm implementations handle Discover Modes this way as well.
> 
> Regardless, you're definitely right that the user should know about all
> Alt Modes/SVIDs - the port would lose SVID information without
> registering a partner altmode for it. Currently I think the approaches to pass
> this test look like:
>     1. Your suggestion - let the tcpci decide if there should be a
> discovery order.
> Alternatively, let the tcpci decide if it wants to opt into this
> patch's behavior of
> only discovering modes for known SVIDs - a strict discovery flag.
>     2. Send a Discover Mode message to known SVIDs first in the order
> they come in, and then to unknown SVIDs. The test passes and no information
> is lost, but it's unnecessary refactoring just to pass one test for
> one Alt Mode.
>     3. Don't send a Discover Mode message to unknown SVIDs, but do register
> an Alt Mode with blank info for that SVID. It passes the test without having to
> do any reordering compared to the first option and it preserves supported
> SVIDs. But, the port would lose information such as each SVID's Alt Modes
> VDO plus each SVID can support more than one Alt Mode.
> 
> Let me know if any of these approaches sound worth pursuing; I do think
> Option 1 does make more sense than the others.

I would like to hear what Guenter thinks. Guenter, do you have time to
take a look at this?

thanks,

-- 
heikki

