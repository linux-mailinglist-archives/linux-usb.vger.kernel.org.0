Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBA22494B1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 07:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgHSFyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 01:54:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:34940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbgHSFyl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 01:54:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5922D20772;
        Wed, 19 Aug 2020 05:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597816480;
        bh=u1pQ/vhujwi7PrpNVhL2hvhkSG1EjCkasQq0Cr89ZSI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IlZgRlBZy9qn8Svn9SKKIIwa8W7XtO6ZqQlu6UBqT+UpneuEHI5SGpAf8t9TIJdDE
         QeNgNH2PHPR7gBhWceO7Cgj7f+hws62EdjUkxwkL+/vcQJY4pu1k21/fBiqfaWkfTQ
         oz0+KFO+zxd+khx9qyRl8AwFaKCHmf+OT80b37/Q=
Date:   Wed, 19 Aug 2020 07:55:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 3/3] USB: Fix device driver race
Message-ID: <20200819055503.GC853200@kroah.com>
References: <20200818110445.509668-1-hadess@hadess.net>
 <20200818110445.509668-3-hadess@hadess.net>
 <fdfc0146-5b7f-1805-3c35-68c662b2651d@gmail.com>
 <20200818172901.GA152667@rowland.harvard.edu>
 <a4e87e78-7ce4-efaa-55a7-7fe7c33094c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4e87e78-7ce4-efaa-55a7-7fe7c33094c5@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 11:49:43PM +0300, Sergei Shtylyov wrote:
> On 8/18/20 8:29 PM, Alan Stern wrote:
> 
> >>> +	} else {
> >>>  		printk(KERN_ERR "%s: error %d registering device "
> >>>  			"	driver %s\n",
> >>
> >>    Unrelated but... hm, this string literal seems weird. GregKH, would it be OK if we fix it?
> >>
> >>>  			usbcore_name, retval, new_udriver->name);
> > 
> > Indeed, an extra tab character snuck in there by mistake.  It has been 
> > present ever since 2006, when the routine was originally added by commit 
> > 8bb54ab573ec ("usbcore: add usb_device_driver definition").
> 
>    And meanwhile it got copied to another function, usb_register_driver().
> I guess it's OK to fix both w/one patch?

Yes.
