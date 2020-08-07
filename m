Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F97C23EB9D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 12:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgHGKgy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 06:36:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:54594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgHGKgy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 06:36:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B9742075D;
        Fri,  7 Aug 2020 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596796613;
        bh=F0K6LJGkZfyqbux2jSIoh8HvDGyzM8YFaNJW6MnYlnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CMwQBpjejIIJcZIoG+VOne2a4rDQPIlv5k6xNIog9oPHbXadG/bJT5yA1WDUhAsZD
         JgUJKROrn/n/NYMOGnkUX9qaS8U3CsplVAOVLWJx6A6qwZ2zaivBp1b0HsXbyy6zg2
         72F4QMDMUxI8xJJ2k2TF9N3SURSoqKsZZGH59iW8=
Date:   Fri, 7 Aug 2020 12:37:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 1/6] USB: UDC: Expand device model API interface
Message-ID: <20200807103706.GA3096754@kroah.com>
References: <20200807094151.13526-1-peter.chen@nxp.com>
 <20200807094151.13526-2-peter.chen@nxp.com>
 <20200807095221.GA3071081@kroah.com>
 <AM7PR04MB7157A52930B8F6D0CD38BE2A8B490@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7157A52930B8F6D0CD38BE2A8B490@AM7PR04MB7157.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 07, 2020 at 10:21:53AM +0000, Peter Chen wrote:
>  
> > 
> > On Fri, Aug 07, 2020 at 05:41:46PM +0800, Peter Chen wrote:
> > > From: Alan Stern <stern@rowland.harvard.edu>
> > >
> > > The routines used by the UDC core to interface with the kernel's
> > > device model, namely usb_add_gadget_udc(),
> > > usb_add_gadget_udc_release(), and usb_del_gadget_udc(), provide access
> > > to only a subset of the device model's full API.  They include
> > > functionality equivalent to device_register() and device_unregister()
> > > for gadgets, but they omit device_initialize(), device_add(),
> > > device_del(), get_device(), and put_device().
> > >
> > > This patch expands the UDC API by adding usb_initialize_gadget(),
> > > usb_add_gadget(), usb_del_gadget(), usb_get_gadget(), and
> > > usb_put_gadget() to fill in the gap.  It rewrites the existing
> > > routines to call the new ones.
> > >
> > > CC: Anton Vasilyev <vasilyev@ispras.ru>
> > > CC: Evgeny Novikov <novikov@ispras.ru>
> > > CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> > You can not forward on patches from someone else without also signing off on
> > them.
> > 
>  
> So, even without contribution for the patch, we also need to add signing off when
> submit?

Please read the DCO, you are submitting some else's work here, it is
passing through you, you need to add your s-o-b to it.  It's only been
this way since the very beginning :)

thanks,

greg k-h
