Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8528C26BEAB
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 10:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgIPIAA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 04:00:00 -0400
Received: from mga18.intel.com ([134.134.136.126]:37368 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726381AbgIPH75 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 03:59:57 -0400
IronPort-SDR: PvWuKAjmzWfqddrw6pbWJ8Ox+3R/XU97fOJnGrjB9tj6PjKRL9MOUMsMd6DkTYkXkbtjPRo+Q0
 gMIZa2cHTuiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147171653"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="147171653"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 00:59:55 -0700
IronPort-SDR: WnCA8dubVasgyBTB8n5q/e1gHmS5+h9EwI/Ah37hj5JpYyuKng+7gvC+Lg1hYiGfWu6MdZ9cV+
 pT75Us6sCJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409467952"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2020 00:59:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 16 Sep 2020 10:59:52 +0300
Date:   Wed, 16 Sep 2020 10:59:52 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Zwane Mwaikambo <zwanem@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
Message-ID: <20200916075952.GB1358028@kuha.fi.intel.com>
References: <20200828123328.GF174928@kuha.fi.intel.com>
 <alpine.DEB.2.21.2008300220350.37231@montezuma.home>
 <20200903111047.GH1279097@kuha.fi.intel.com>
 <20200909131059.GB3627076@kuha.fi.intel.com>
 <alpine.DEB.2.21.2009100030340.31932@montezuma.home>
 <20200910125018.GA3946915@kuha.fi.intel.com>
 <alpine.DEB.2.21.2009101912020.31932@montezuma.home>
 <20200911135618.GA4168153@kuha.fi.intel.com>
 <20200914134942.GB810499@kuha.fi.intel.com>
 <alpine.DEB.2.21.2009140907410.42407@montezuma.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2009140907410.42407@montezuma.home>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 14, 2020 at 10:56:56AM -0700, Zwane Mwaikambo wrote:
> On Mon, 14 Sep 2020, Heikki Krogerus wrote:
> 
> > Hi,
> > 
> > On Fri, Sep 11, 2020 at 04:56:22PM +0300, Heikki Krogerus wrote:
> > > Looks like the firmware does not terminate the list of alternate modes
> > > at all. It's just returning the two supported modes over and over
> > > again, regardless of the requested mode offset... I need to think how
> > > that should be handled.
> > 
> > Since we can't rely on the data that the firmware returns, we also
> > have to check that the mode index does not exceed MODE_DISCOVER_MAX.
> > Can you test if the attached patch fixes the issue for you?
> 
> Sadly that's not entirely surprising :/ i tested your patch and i was able 
> to plugin and unplug the USB-C dock with a working display multiple 
> times.

OK. Let's fix the issue with this at this stage.

thanks,

-- 
heikki
