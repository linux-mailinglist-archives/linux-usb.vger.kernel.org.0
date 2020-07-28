Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A93C230844
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 13:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgG1LAk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 07:00:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:3711 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728688AbgG1LAk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 07:00:40 -0400
IronPort-SDR: QSIbgosfnAraIZBLaGmxehaK7gqegovzJUJR4l46YxK6+ht4dQ5dQE9qT3bMTt4eVBEM2PplVq
 eFYRLB/ir0Uw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="151172912"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="151172912"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 04:00:39 -0700
IronPort-SDR: BsdRJGO9GLrL/nvLlY0fh+tl6oLVaU9Gn+Z0EK1+YvR3eJoGWIVkmSNv7wq5NBFSYR5Zyg/iLI
 UL+/V6aITpSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="394297867"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Jul 2020 04:00:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jul 2020 14:00:35 +0300
Date:   Tue, 28 Jul 2020 14:00:35 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: AB BA lock inversion in ucsi driver caused by "usb: typec: ucsi:
 displayport: Fix a potential race during registration"
Message-ID: <20200728110035.GC883641@kuha.fi.intel.com>
References: <734333be-aa48-d2fc-0463-6334115e3c12@redhat.com>
 <20200727123735.GA883641@kuha.fi.intel.com>
 <95664b27-19c5-7cf8-2cd8-98ae956a6d31@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95664b27-19c5-7cf8-2cd8-98ae956a6d31@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 02:54:00PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 7/27/20 2:37 PM, Heikki Krogerus wrote:
> > Hi Hans,
> > 
> > Sorry about the late reply. I just returned from vacation.
> 
> NP. I hope you've enjoyed your vacation.
> 
> > On Fri, Jul 17, 2020 at 12:04:58PM +0200, Hans de Goede wrote:
> > > Hi Heikki,
> > > 
> > > I've been running my personal kernel builds with lockdep enabled
> > > (more people should do that) and it found an AB BA lock inversion in the
> > > ucsi driver. This has been introduced by commit 081da1325d35 ("usb: typec:
> > > ucsi: displayport: Fix a potential race during registration").
> > > 
> > > The problem is as follows:
> > > 
> > > AB order:
> > > 
> > > 1. ucsi_init takes ucsi->ppm_lock (it runs with that locked for the duration of the function)
> > > 2. usci_init eventually end up calling ucsi_register_displayport, which takes
> > >     ucsi_connector->lock
> > > 
> > > BA order:
> > > 
> > > 1. ucsi_handle_connector_change work is started, takes ucsi_connector->lock
> > > 2. ucsi_handle_connector_change calls ucsi_send_command which takes ucsi->ppm_lock
> > > 
> > > I think this can be fixed by doing the following:
> > > 
> > > a. Make ucsi_init drop the ucsi->ppm_lock before it starts registering ports; and
> > >     replacing any ucsi_run_command calls after this point with ucsi_send_command
> > >     (which is a wrapper around run_command taking the lock while handling the command)
> > > 
> > > b. Move the taking of the ucsi_connector->lock from ucsi_register_displayport into
> > >     ucsi_register_port() to make sure that nothing can touch the connector/port until
> > >     ucsi_register_port() has completed.
> > > 
> > > 
> > > b. is not stricly necessary but it brings the locking during init more inline
> > > with locking done during runtime so this seems like a good idea.
> > 
> > Makes sense. So b. it is. Can you prepare the patch for that?
> 
> b. is just a cleanup / extra step on top of a. we need a. to fix the inversion.
> 
> If you are ok with that I can try to make some time for this...

That would be great!

thanks,

-- 
heikki
