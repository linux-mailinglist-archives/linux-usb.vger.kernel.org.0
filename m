Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0EF55CF6C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 14:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbfGBM3N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 08:29:13 -0400
Received: from gate.crashing.org ([63.228.1.57]:40024 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbfGBM3N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 08:29:13 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x62CT1H2012233;
        Tue, 2 Jul 2019 07:29:02 -0500
Message-ID: <e90076897577e2b4d2ad864eff85406b19f88dd3.camel@kernel.crashing.org>
Subject: Re: Aspeed vhub configuration
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Greg KH <greg@kroah.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Date:   Tue, 02 Jul 2019 22:29:01 +1000
In-Reply-To: <20190702122430.GC12019@kroah.com>
References: <44bb150fb8b283a3036a382fa7e821b045554c15.camel@kernel.crashing.org>
         <20190702122430.GC12019@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-07-02 at 14:24 +0200, Greg KH wrote:
> 
> > That leaves me with two approaches, that aren't mutually exclusive, but
> > I'd like to run them past the folks here before I start coding:
> > 
> >  - The defaults, currently hard coded, could be replaced with Kconfig
> > options.
> > 
> >  - The device-tree node could contain optional override of those
> > defaults, allowing a vendor to customize the hub for a given board.
> > It's not per-se a HW description, but the device-tree is also fairly
> > commonly used for HW configuration, even if some people disagree with
> > me on that one (hint: they are wrong :-)
> > 
> >  - I could add sysfs properties underneath the vhub device instance to
> > customize it. This would also allow userspace to control whether the
> > hub is "connected" to the host or not, which could be useful, some
> > systems don't want it to always be there. Today there's no choice.
> > 
> > Any other option ? If somebody says netlink I will scream :)
> 
> DT seems like the logical choice, I'll not object to that.

DT for defaults sounds good yes. I'm still toying with also having
sysfs properties. There have been people wanting to connect or
disconnect the hub from the host programatically, a property in the
device node would be best for that. Being able to override the serial
number as well. The DT isn't a great place for that.

Cheers,
Ben.


