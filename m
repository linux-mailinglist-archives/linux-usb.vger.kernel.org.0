Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6D8248CF2
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 19:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgHRR3E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 13:29:04 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46283 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726715AbgHRR3D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 13:29:03 -0400
Received: (qmail 153514 invoked by uid 1000); 18 Aug 2020 13:29:01 -0400
Date:   Tue, 18 Aug 2020 13:29:01 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8 3/3] USB: Fix device driver race
Message-ID: <20200818172901.GA152667@rowland.harvard.edu>
References: <20200818110445.509668-1-hadess@hadess.net>
 <20200818110445.509668-3-hadess@hadess.net>
 <fdfc0146-5b7f-1805-3c35-68c662b2651d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdfc0146-5b7f-1805-3c35-68c662b2651d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 08:06:20PM +0300, Sergei Shtylyov wrote:
> On 8/18/20 2:04 PM, Bastien Nocera wrote:

> > +	} else {
> >  		printk(KERN_ERR "%s: error %d registering device "
> >  			"	driver %s\n",
> 
>    Unrelated but... hm, this string literal seems weird. GregKH, would it be OK if we fix it?
> 
> >  			usbcore_name, retval, new_udriver->name);

Indeed, an extra tab character snuck in there by mistake.  It has been 
present ever since 2006, when the routine was originally added by commit 
8bb54ab573ec ("usbcore: add usb_device_driver definition").

It's perfectly okay with me if someone wants to remove the extra tab.  
In fact, nowadays we'd remove the line break entirely.

Alan Stern
