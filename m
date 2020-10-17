Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7992B2914E3
	for <lists+linux-usb@lfdr.de>; Sun, 18 Oct 2020 00:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439691AbgJQWNy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Oct 2020 18:13:54 -0400
Received: from l2mail1.panix.com ([166.84.1.75]:64046 "EHLO l2mail1.panix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439503AbgJQWNx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 17 Oct 2020 18:13:53 -0400
X-Greylist: delayed 910 seconds by postgrey-1.27 at vger.kernel.org; Sat, 17 Oct 2020 18:13:53 EDT
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
        by l2mail1.panix.com (Postfix) with ESMTPS id 4CDH383Z6wzDRQ
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 17:58:44 -0400 (EDT)
Received: from xps-7390 (cpe-23-242-39-94.socal.res.rr.com [23.242.39.94])
        by mailbackend.panix.com (Postfix) with ESMTPSA id 4CDH3664cSzrL4;
        Sat, 17 Oct 2020 17:58:42 -0400 (EDT)
Date:   Sat, 17 Oct 2020 14:58:40 -0700 (PDT)
From:   "Kenneth R. Crudup" <kenny@panix.com>
Reply-To: "Kenneth R. Crudup" <kenny@panix.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: I get a new Thunderbolt domain UUID on every boot
In-Reply-To: <20200721102812.GX5180@lahna.fi.intel.com>
Message-ID: <bf92cfbb-5d99-5627-734-622146bcda25@panix.com>
References: <alpine.DEB.2.23.453.2007051446170.4280@xps-7390> <20200720100723.GW5180@lahna.fi.intel.com> <alpine.DEB.2.23.453.2007200527070.3171@xps-7390> <20200721102812.GX5180@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> > Finally, every now and then on a reboot, my TB dock "flaps" (repeatedly
> > connects and disconnects) and I have to either connect/reconnect the TB3
> > cable, or initate a power-off. I suspect this is a BIOS bug ...
> > Have you seen this before or have any ideas?

On Tue, 21 Jul 2020, Mika Westerberg wrote:

> Not seen before, but IIRC some laptops require more power than what the
> dock can supply and the symptoms for that are similar that the
> connection goes down and then back up several times.

BTW, apparently this was a Dell BIOS bug- they'd released version 1.6.2 a
couple of weeks ago for my machine (XPS 7390 2-in-1) and I haven't seen it
since. Considering this thing's a year old, I'm not confident in Dell's
ability to be proactive about bugs (but I guess in their defense that did
solve the the last issue I had with this thing).

	-Kenny

-- 
Kenneth R. Crudup  Sr. SW Engineer, Scott County Consulting, Orange County CA
