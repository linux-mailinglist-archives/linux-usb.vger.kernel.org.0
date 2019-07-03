Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDF35EF45
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 00:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfGCWwx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 18:52:53 -0400
Received: from gate.crashing.org ([63.228.1.57]:34059 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726902AbfGCWwx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 18:52:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x63MqdIc012217;
        Wed, 3 Jul 2019 17:52:41 -0500
Message-ID: <0a95c8316eb01848d73098199237953108297339.camel@kernel.crashing.org>
Subject: Re: Aspeed vhub configuration
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Thu, 04 Jul 2019 08:52:39 +1000
In-Reply-To: <87h883d4ah.fsf@linux.intel.com>
References: <44bb150fb8b283a3036a382fa7e821b045554c15.camel@kernel.crashing.org>
         <20190702122430.GC12019@kroah.com>
         <e90076897577e2b4d2ad864eff85406b19f88dd3.camel@kernel.crashing.org>
         <8736jobnnb.fsf@linux.intel.com>
         <3cea94e3f461c44c0799c2d494b174d20895cc08.camel@kernel.crashing.org>
         <87h883d4ah.fsf@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-07-03 at 09:24 +0300, Felipe Balbi wrote:
> Hi,
> 
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> 
> > On Tue, 2019-07-02 at 15:56 +0300, Felipe Balbi wrote:
> > > We already have an interface for disconnecting from the host
> > > programatically by disconnecting data pullup.
> > > 
> > > static ssize_t soft_connect_store(struct device *dev,
> > >                 struct device_attribute *attr, const char *buf,
> > > size_t n)
> > 
> >  .../...
> > 
> > I could reproduce the same interface for the vhub, at least it
> > would
> > provide consistency...
> > 
> > The vhub itself is not an UDC device. It provides UDC devices that
> > are
> > the hub "ports".
> 
> Right, if you have your UDC devices and you implement ->udc_start(),
> ->udc_stop() and ->pullup(), you *already* have this interface for
> you.

I have that interface for the hub ports. What I want is a way for
userspace to connect/disconnect the hub itself from the host though.

Cheers,
Ben.




