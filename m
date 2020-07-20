Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D997225553
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 03:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgGTBVb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 21:21:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48931 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726225AbgGTBVa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jul 2020 21:21:30 -0400
Received: (qmail 1212751 invoked by uid 1000); 19 Jul 2020 21:21:29 -0400
Date:   Sun, 19 Jul 2020 21:21:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Guillen Fandos <david@davidgf.net>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        dnlplm@gmail.com
Subject: Re: System crash/lockup after plugging CDC ACM device
Message-ID: <20200720012129.GA1212481@rowland.harvard.edu>
References: <20200715093029.GB2759174@kroah.com>
 <867592c41350b09a0cb67e9a3924f8a2f758d79a.camel@davidgf.net>
 <20200715105034.GB2880893@kroah.com>
 <956ec3169eec6b121339ed6c1aedd0f7ca08db43.camel@davidgf.net>
 <20200715111210.GA2892661@kroah.com>
 <ed743fe1e0ede6d37bc4a62ba704f51c54c2f5bf.camel@davidgf.net>
 <20200715122403.GC2937397@kroah.com>
 <8ebe3fb975db65531e71fdf8a298e3b3f68ae3ca.camel@davidgf.net>
 <5725602de85c43497e326ff745db01ba36caeac1.camel@davidgf.net>
 <ae6813ea0d4144a624a7e98cbba87070d3ae6f30.camel@davidgf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae6813ea0d4144a624a7e98cbba87070d3ae6f30.camel@davidgf.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 20, 2020 at 01:36:58AM +0200, David Guillen Fandos wrote:
> Hey there again!
> 
> I managed to get a PCAP capture for this. Note that NetworkManager was
> running and actively probing the ttyACM* devices for a modem, hence why
> you can see "AT\n" commands being sent to the four devices.
> 
> As you can also probably see is that the device currently ignores any
> control requests (like Set Line Coding).
> 
> Hope it can help your debugging.

What's the story with all the -EPROTO errors on the bulk endpoints in
the trace?  It looks like your device hasn't enabled a bunch of
endpoints that are supposed to be active.

Alan Stern
