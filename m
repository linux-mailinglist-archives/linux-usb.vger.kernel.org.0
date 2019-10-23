Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA4DE1394
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 10:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390032AbfJWIGG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 04:06:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:48475 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389982AbfJWIGG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 04:06:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 01:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="scan'208";a="209870723"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 23 Oct 2019 01:06:03 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 23 Oct 2019 11:06:03 +0300
Date:   Wed, 23 Oct 2019 11:06:03 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 00/18] usb: typec: API improvements
Message-ID: <20191023080603.GA8828@kuha.fi.intel.com>
References: <20191021112524.79550-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB27275D13BB62F9120EBB9054DC690@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20191022074110.GD28049@kuha.fi.intel.com>
 <BYAPR12MB2727707263883A987D12D39FDC680@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2727707263883A987D12D39FDC680@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 22, 2019 at 08:43:40PM +0000, Ajay Gupta wrote:
> Hi Heikki,
> 
> > -----Original Message-----
> > From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> > On Behalf Of Heikki Krogerus
> > Sent: Tuesday, October 22, 2019 12:41 AM
> > To: Ajay Gupta <ajayg@nvidia.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Guenter Roeck
> > <linux@roeck-us.net>; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH 00/18] usb: typec: API improvements
> > 
> > On Mon, Oct 21, 2019 at 08:41:16PM +0000, Ajay Gupta wrote:
> > > Hi Heikki,
> > >
> > > > -----Original Message-----
> > > > From: linux-usb-owner@vger.kernel.org
> > > > <linux-usb-owner@vger.kernel.org> On Behalf Of Heikki Krogerus
> > > > Sent: Monday, October 21, 2019 4:25 AM
> > > > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: Guenter Roeck <linux@roeck-us.net>; Ajay Gupta
> > > > <ajayg@nvidia.com>; linux-usb@vger.kernel.org
> > > > Subject: [PATCH 00/18] usb: typec: API improvements
> > > >
> > > > Hi,
> > > >
> > > > The first patches in this series (patches 1-8) introduce a small
> > > > change to the USB Type-C Connector Class API. Guenter was kind
> > > > enough to go over those already.
> > > >
> > > > Patches 10-15 improve the ucsi driver API by introducing more
> > > > traditional read and write routines, and the rest is more generic
> > > > optimisations and improvements to the ucsi drivers.
> > > >
> > > > Let me know if there is anything you want to be changed.
> > > This patch set is not taking care of issues discussed at following thread.
> > > https://marc.info/?l=linux-usb&m=156995500624107&w=2
> > > https://marc.info/?l=linux-usb&m=157012261301682&w=2
> > >
> > > We need fixes for above issues so that we can easily manage ppms which
> > > has multiple DP altmodes as discussed in below link.
> > > https://marc.info/?l=linux-usb&m=156778906010780&w=2
> > 
> > The goal of this series is not to solve that "issue".
> > 
> > This series is the base work that really has to be done in any case before we
> > add any kind of solution for the multi DP alt mode case.
> > Rest assured that we will have support for that soon enough, but let's just
> > move one step at a time.
> Ok, sounds good. I tested the series on NVIDIA GPU for ucsi_ccg and it works fine.

Thanks Ajay. So can I use your "Tested-by" tag?

Br,

-- 
heikki
