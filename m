Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1DF598A9E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 06:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731153AbfHVE63 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 00:58:29 -0400
Received: from gate.crashing.org ([63.228.1.57]:36151 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731146AbfHVE63 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 00:58:29 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7M4wNMJ022490;
        Wed, 21 Aug 2019 23:58:24 -0500
Message-ID: <cc5030dcc06868fe93af4899be004c5a802d783b.camel@kernel.crashing.org>
Subject: Re: f_mass_storage vs drivers/target
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>
Date:   Thu, 22 Aug 2019 14:58:23 +1000
In-Reply-To: <9c7090713374e80b6c26a9dabb753c5b35b9c93d.camel@kernel.crashing.org>
References: <Pine.LNX.4.44L0.1908211024380.1816-100000@iolanthe.rowland.org>
         <9c7090713374e80b6c26a9dabb753c5b35b9c93d.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-08-22 at 10:10 +1000, Benjamin Herrenschmidt wrote:
> On Wed, 2019-08-21 at 10:25 -0400, Alan Stern wrote:
> > On Wed, 21 Aug 2019, Benjamin Herrenschmidt wrote:
> > 
> > > Hi folks !
> > > 
> > > It seems that f_mass_storage duplicates (well maybe predates too..)
> > 
> > a
> > > lot of what's in drivers/target.
> > > 
> > > Anybody working on implementing a new version of f_mass_storage
> > 
> > that
> > > is layered upon drivers/target instead ? That would bring quite a
> > 
> > lot
> > > of additional functionality.
> > 
> > That's what f_tcm does.
> > 
> > Alan Stern
> 
> Haha nice, I never noticed it :-)

Ah lovely ... the 338x fails in EP autoconf with f_tcm, digging...

While digging I found this gem:

	/* USB3380: use same address for usb and hardware endpoints */
	snprintf(name, sizeof(name), "ep%d%s", usb_endpoint_num(desc),
			usb_endpoint_dir_in(desc) ? "in" : "out");
	ep = gadget_find_ep_by_name(_gadget, name);
	if (ep && usb_gadget_ep_match_desc(_gadget, ep, desc, ep_comp))
		return ep;

Any idea what's that supposed to achieve ?

When ep_match is called, usb_endpoint_num() hasn't been set yet so
it's always 0 and always fails... or am I missing something ?

Cheers,
Ben.

