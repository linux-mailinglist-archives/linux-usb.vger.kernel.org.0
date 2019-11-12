Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F200AF8D6D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 12:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfKLLAf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 06:00:35 -0500
Received: from mga02.intel.com ([134.134.136.20]:25004 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbfKLLAe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Nov 2019 06:00:34 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 03:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; 
   d="scan'208";a="214056673"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 12 Nov 2019 03:00:31 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 12 Nov 2019 13:00:30 +0200
Date:   Tue, 12 Nov 2019 13:00:30 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 00/18] usb: typec: API improvements
Message-ID: <20191112110030.GA4013@kuha.fi.intel.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB27275D13BB62F9120EBB9054DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191022074110.GD28049@kuha.fi.intel.com>
 <BYAPR12MB2727707263883A987D12D39FDC680@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191023080603.GA8828@kuha.fi.intel.com>
 <BYAPR12MB27273BEE5E6EC8F290BF8CFFDC6B0@BYAPR12MB2727.namprd12.prod.outlook.com>
 <BYAPR12MB2727DC214FE8D4AA1CC50E83DC740@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2727DC214FE8D4AA1CC50E83DC740@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

On Mon, Nov 11, 2019 at 04:51:05PM +0000, Ajay Gupta wrote:
> Hi Heikki,
> > > > > > > The first patches in this series (patches 1-8) introduce a
> > > > > > > small change to the USB Type-C Connector Class API. Guenter
> > > > > > > was kind enough to go over those already.
> > > > > > >
> > > > > > > Patches 10-15 improve the ucsi driver API by introducing more
> > > > > > > traditional read and write routines, and the rest is more
> > > > > > > generic optimisations and improvements to the ucsi drivers.
> > > > > > >
> > > > > > > Let me know if there is anything you want to be changed.
> > > > > > This patch set is not taking care of issues discussed at following thread.
> > > > > > https://marc.info/?l=linux-usb&m=156995500624107&w=2
> > > > > > https://marc.info/?l=linux-usb&m=157012261301682&w=2
> > > > > >
> > > > > > We need fixes for above issues so that we can easily manage ppms
> > > > > > which has multiple DP altmodes as discussed in below link.
> > > > > > https://marc.info/?l=linux-usb&m=156778906010780&w=2
> > > > >
> > > > > The goal of this series is not to solve that "issue".
> > > > >
> > > > > This series is the base work that really has to be done in any
> > > > > case before we add any kind of solution for the multi DP alt mode case.
> > > > > Rest assured that we will have support for that soon enough, but
> > > > > let's just move one step at a time.
> Since this series is gone so what is the plan for updated changes as
> discussed at
> https://marc.info/?l=linux-usb&m=157079026214073&w=2 
> 
> This is needed to support ppms which has multiple DP altmodes as 
> discussed at
> https://marc.info/?l=linux-usb&m=156778906010780&w=2 

Give me a few more weeks. I'm sorry for the delay, but I have to
finish some other tasks. Can you work on this in the mean time?


thanks,

-- 
heikki
