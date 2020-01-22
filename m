Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D71144C3B
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 08:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgAVHB7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 02:01:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:47738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgAVHB7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jan 2020 02:01:59 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EA822465B;
        Wed, 22 Jan 2020 07:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579676518;
        bh=VsJReUCsDECf5eSNGuW9Acmym/V9rBnT4Ux0BaMEgik=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vOZ1DgAh4Q1eLWJEGVryD8BaY6svtXMZnkaGSbFRU5aoLzAY8qE0Z6IBA3gLeU9Bj
         m14Dr2R6Zm9GOPsWm8hgQel5Um54GY00puCM9lNwTqdyfAvMqWMuEUhIO5xrV9KMJ+
         m7WHeqHpwW8ps/KtwyiyiF0SRDHdGNzOi+MXRqfw=
Date:   Wed, 22 Jan 2020 08:01:56 +0100
From:   'Greg KH' <gregkh@linuxfoundation.org>
To:     ansuelsmth@gmail.com
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: fix implicit declaration error
Message-ID: <20200122070156.GA2068857@kroah.com>
References: <20200118235828.14131-1-ansuelsmth@gmail.com>
 <20200119125315.GA149506@kroah.com>
 <000f01d5cecb$1ead1440$5c073cc0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000f01d5cecb$1ead1440$5c073cc0$@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 19, 2020 at 02:19:45PM +0100, ansuelsmth@gmail.com wrote:
> > On Sun, Jan 19, 2020 at 12:58:28AM +0100, Ansuel Smith wrote:
> > > If USB_PCI is not enabled, this error is triggered.
> > > drivers/usb/host/ehci-pci.c:152:7:
> > > error: implicit declaration of function 'usb_amd_quirk_pll_check';
> > >   152 |   if (usb_amd_quirk_pll_check())
> > >       |       ^~~~~~~~~~~~~~~~~~~~~~~
> > >       |       usb_amd_quirk_pll_enable
> > >
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > 
> > Is this a new issue?  What commit caused this problem?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Looks like this is caused by 4fbb8aa75836c3361987f431d9451aecc1830bdd
> and ad93562bdeecdded7d02eaaaf1aa5705ab57b1b7.
> Looks like it was never added to the header file else condition.
> 

So this has been a problem since 2011?  What config actually causes this
build problem to occur?

thanks,

greg k-h
