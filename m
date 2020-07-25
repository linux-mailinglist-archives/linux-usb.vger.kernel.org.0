Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD3E22D86D
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 17:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgGYPYX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 11:24:23 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53741 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYPYX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 11:24:23 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 70EA6240004;
        Sat, 25 Jul 2020 15:24:21 +0000 (UTC)
Message-ID: <fa8f94ff5d62b42569b559a10638f952b2037145.camel@hadess.net>
Subject: Re: [PATCH 3/3 v5] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Sat, 25 Jul 2020 17:24:20 +0200
In-Reply-To: <20200725145922.GC1421097@rowland.harvard.edu>
References: <ab1fcd9c7e8f4aecd1f709a74a763bcc239fe6c4.camel@hadess.net>
         <20200725145922.GC1421097@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2020-07-25 at 10:59 -0400, Alan Stern wrote:
<snip>
> > +	udev = to_usb_device(dev);
> > +	if (usb_device_match_id(udev, new_udriver->id_table) == NULL &&
> > +	    (!new_udriver->match || new_udriver->match(udev) != 0))
> > +		return 0;
> > +
> > +	(void)!device_reprobe(dev);
> 
> What's that '!' doing hiding in there?  It doesn't affect the final 
> outcome, but it sure looks weird -- if people notice it at all.

It's how we stop gcc from complaining about the warn_unused_result
attribute on device_reprobe()... (void) is enough with clang, but not
with gcc.

> Aside from that,
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

Thanks!


