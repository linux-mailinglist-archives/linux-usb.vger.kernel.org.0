Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7685547C3CC
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 17:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239819AbhLUQaP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 11:30:15 -0500
Received: from mga02.intel.com ([134.134.136.20]:18777 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239808AbhLUQaO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Dec 2021 11:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640104214; x=1671640214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qZx9A+r88N5Dr6jodm0G/xVEV6w7bO+RDCdt6PPCpFY=;
  b=J67hejayVSm1EdEzQW1uatBRq1+dqFlxsNSarrSVvjKVPQfIZW2juzDP
   ghfNUTkBeXhytAiRZ0U/QDyeRIpRij7usZv2xcyhINtdELzAXIl81Nj35
   DdKo63MvymCLtkM5VZt7KFigsVWdWItMdekhOsvBdnIbEvkWTxqVnTEPe
   VGUXlBRS+PdUf6VF9Gjtr/ePq2CO9YaCj7OB7z6dj4j5ox0ssLFwb7pqH
   UEt6fWfhSyLp35gLUbQnNyq/e9XKTdbje7BMmXo5JSrQw0ooIGuXY+iZr
   eSdK1cKNlaBKeqCnKSs8eilzg40f7q6E3YNaAFNZWLKJi8ALecKO+qPBE
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227720717"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="227720717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 08:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="663991460"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Dec 2021 08:30:11 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Dec 2021 18:30:10 +0200
Date:   Tue, 21 Dec 2021 18:30:10 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Chris Hixon <linux-kernel-bugs@hixontech.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Only check the contract if there is
 a connection
Message-ID: <YcIBEts8NXEhXzSP@kuha.fi.intel.com>
References: <20211221140352.45501-1-heikki.krogerus@linux.intel.com>
 <2723c9a3-a932-3634-422b-3fbd93550bf8@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2723c9a3-a932-3634-422b-3fbd93550bf8@leemhuis.info>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thorsten,

Tue, Dec 21, 2021 at 03:39:04PM +0100, Thorsten Leemhuis kirjoitti:
> On 21.12.21 15:03, Heikki Krogerus wrote:
> > The driver must make sure there is an actual connection
> > before checking details about the USB Power Delivery
> > contract. Those details are not valid unless there is a
> > connection.
> > 
> > This fixes NULL pointer dereference that is caused by an
> > attempt to register bogus partner alternate mode that the
> > firmware on some platform may report before the actual
> > connection.
> > 
> > Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
> > Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=215117
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> > 
> > Hi,
> > 
> > Instead of using the "BugLink" tag, I'm now using "Link" tag with the
> > link to the bug as requested.
> 
> Thx!
> 
> > There was a request to have also another Link tag pointing to some
> > other discussion on the mailing list, but I failed to understand what
> > was the point with that - I also didn't find any commits where
> > something like that had been used before.
> 
> There are quite a few commits that use more that two "Link" tags, as
> they should point to "related discussions or any other background
> information behind the change" that "can be found on the web" (Quotes
> from Documentation/process/submitting-patches.rst) -- hence there is no
> limit. That being said:
> 
> > I may be mistaken here, but I got the impression that you create the
> > mailing list discussion
> 
> You are mistaken: I created it because the bugzilla ticket was ignored
> in bugzilla for weeks and might have forgotten otherwise -- no wonder,
> was bugzilla.kernel.org is not the official place to report USB bugs
> according to the MAINTAINERS file.
> 
> > just so you can have the extra Link tag
> > pointing to it, and that Link tag you want only because you have made
> > your scripts rely on it.
> 
> They rely on it as almost all subsystems expect bug to be reported by
> mail, as they are instructed by
> Documentation/admin-guide/reporting-issues.rst
> 
> > The extra email thread in any case does not seem to contain any real
> > additional information that the bug report does not have, so the extra
> > Link tag pointing to it does not provide any real value on top of the
> > link to bug itself.
> 
> In this case that's true, as I have to tell regzbot about the fix then
> manually (the plan it to make regzbot also detect links to
> bugzilla.kernel.org, but I fear I have no time to work on that in the
> next few weeks :-/ ). But in similar cases it's different, as there the
> developers continued discussing the issue by mail -- then it's
> definitely worth linking there as well.

Thanks for the explanation. My concern was that we are expected to
supply duplicated information just so the bot is satisfied, but
that's clearly not the case. I misunderstood.

thanks,

-- 
heikki
