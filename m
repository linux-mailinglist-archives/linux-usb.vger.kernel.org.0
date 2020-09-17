Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6DE26E70F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 23:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgIQVDt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 17:03:49 -0400
Received: from cmta19.telus.net ([209.171.16.92]:56724 "EHLO cmta19.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbgIQVDt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 17:03:49 -0400
X-Greylist: delayed 487 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 17:03:48 EDT
Received: from montezuma.home ([154.5.226.127])
        by cmsmtp with SMTP
        id J0wMkWX9hJSCdJ0wNkg8Ye; Thu, 17 Sep 2020 14:55:41 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=GaZpYjfL c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10
 a=qMtNfzp5Xp0zt5On6f8A:9 a=CjuIK1q_8ugA:10
Date:   Thu, 17 Sep 2020 13:55:38 -0700 (PDT)
From:   Zwane Mwaikambo <zwanem@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
In-Reply-To: <20200916075952.GB1358028@kuha.fi.intel.com>
Message-ID: <alpine.DEB.2.21.2009171355050.41832@montezuma.home>
References: <20200828123328.GF174928@kuha.fi.intel.com> <alpine.DEB.2.21.2008300220350.37231@montezuma.home> <20200903111047.GH1279097@kuha.fi.intel.com> <20200909131059.GB3627076@kuha.fi.intel.com> <alpine.DEB.2.21.2009100030340.31932@montezuma.home>
 <20200910125018.GA3946915@kuha.fi.intel.com> <alpine.DEB.2.21.2009101912020.31932@montezuma.home> <20200911135618.GA4168153@kuha.fi.intel.com> <20200914134942.GB810499@kuha.fi.intel.com> <alpine.DEB.2.21.2009140907410.42407@montezuma.home>
 <20200916075952.GB1358028@kuha.fi.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CMAE-Envelope: MS4wfK8RI0fipMeTIud1EvyG3Ag5r/P7uySQiqqRQtZwI//0b8Xbple6s9Xgcg3RuNbHwOONBWM3fjpI5ftQPD5NIeo0jarHd3D1Xce3kOicfUgSB3XWLFN8
 7m+FEPegW0HEeO5bFW/sVa5XtZh07pkbz+UJiia0eWsL+WpnOUOulvQJzovOJG6HyQFdurFZ5oxjBXie6spiWBjv0Ex2ZVWvTBDfM3oOmEfMf14KFixGfw7l
 kosM2+yqKgEnUkvnJKrmom+KQGt4pxdJMt/LsPFPzCUMtwief3B7xfG2DZLYak/zdsNpivy+Gueog+u401FGng==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 16 Sep 2020, Heikki Krogerus wrote:

> On Mon, Sep 14, 2020 at 10:56:56AM -0700, Zwane Mwaikambo wrote:
> > On Mon, 14 Sep 2020, Heikki Krogerus wrote:
> > 
> > > Hi,
> > > 
> > > On Fri, Sep 11, 2020 at 04:56:22PM +0300, Heikki Krogerus wrote:
> > > > Looks like the firmware does not terminate the list of alternate modes
> > > > at all. It's just returning the two supported modes over and over
> > > > again, regardless of the requested mode offset... I need to think how
> > > > that should be handled.
> > > 
> > > Since we can't rely on the data that the firmware returns, we also
> > > have to check that the mode index does not exceed MODE_DISCOVER_MAX.
> > > Can you test if the attached patch fixes the issue for you?
> > 
> > Sadly that's not entirely surprising :/ i tested your patch and i was able 
> > to plugin and unplug the USB-C dock with a working display multiple 
> > times.
> 
> OK. Let's fix the issue with this at this stage.

Thanks for digging into the issue and resolving it!

	Zwane
