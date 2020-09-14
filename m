Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4EA269440
	for <lists+linux-usb@lfdr.de>; Mon, 14 Sep 2020 19:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgINR5F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Sep 2020 13:57:05 -0400
Received: from cmta18.telus.net ([209.171.16.91]:34323 "EHLO cmta18.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbgINR5C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Sep 2020 13:57:02 -0400
Received: from montezuma.home ([154.5.226.127])
        by cmsmtp with SMTP
        id HsimkbHKpiMStHsiokUAPv; Mon, 14 Sep 2020 11:56:59 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=X7os11be c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=kj9zAlcOel0A:10 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10
 a=53Pd975QBpgh9OEATY8A:9 a=CjuIK1q_8ugA:10
Date:   Mon, 14 Sep 2020 10:56:56 -0700 (PDT)
From:   Zwane Mwaikambo <zwanem@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
In-Reply-To: <20200914134942.GB810499@kuha.fi.intel.com>
Message-ID: <alpine.DEB.2.21.2009140907410.42407@montezuma.home>
References: <alpine.DEB.2.21.2008271058220.37762@montezuma.home> <alpine.DEB.2.21.2008271131570.37762@montezuma.home> <20200828123328.GF174928@kuha.fi.intel.com> <alpine.DEB.2.21.2008300220350.37231@montezuma.home> <20200903111047.GH1279097@kuha.fi.intel.com>
 <20200909131059.GB3627076@kuha.fi.intel.com> <alpine.DEB.2.21.2009100030340.31932@montezuma.home> <20200910125018.GA3946915@kuha.fi.intel.com> <alpine.DEB.2.21.2009101912020.31932@montezuma.home> <20200911135618.GA4168153@kuha.fi.intel.com>
 <20200914134942.GB810499@kuha.fi.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CMAE-Envelope: MS4wfLGjFCtjCPdVPyLfjI5rNDby1jgkYkY08/qYk32Ujf8C+TnyUoiwxRDOl98WHxTb9cYCn9I4xFsI7/KEsbq5PsRWOW+PfVhtDGFzmzJvLTwNekthSa2g
 NBPOZzKyjGbyDTNjIrBE2a1MVYvQzEmR1gHm6P3tuReAFRt1Yj/nxQ/EpykM6Uc4yN/lTokd72b4YiCqV9BgRN2nqetFjX/dcALpyuAUi9xWR/9IFiyGr3qJ
 f23nnfCQdHW7ydPbSr0DDt4d9rb/rFkjcUr0bxgacQqNCBBi0k/uNZmBy7ThQYvxWzIlZcbBQKdra6D3ZzwKhw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 14 Sep 2020, Heikki Krogerus wrote:

> Hi,
> 
> On Fri, Sep 11, 2020 at 04:56:22PM +0300, Heikki Krogerus wrote:
> > Looks like the firmware does not terminate the list of alternate modes
> > at all. It's just returning the two supported modes over and over
> > again, regardless of the requested mode offset... I need to think how
> > that should be handled.
> 
> Since we can't rely on the data that the firmware returns, we also
> have to check that the mode index does not exceed MODE_DISCOVER_MAX.
> Can you test if the attached patch fixes the issue for you?

Sadly that's not entirely surprising :/ i tested your patch and i was able 
to plugin and unplug the USB-C dock with a working display multiple 
times.

Thanks!

	Zwane
