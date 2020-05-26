Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B107E1CB1D8
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 16:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgEHObO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 10:31:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:57206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbgEHObN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 May 2020 10:31:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B3C622083B;
        Fri,  8 May 2020 14:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588948273;
        bh=rxJGu5drzSYlySe9vqiHE3VHx5o1VcEOkPGlZR8Lo3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wZktF9m7g8nYEa9ZRPbOPppcX55CdaEXNGt4tq/QwNaZjeCd3Cx9CY1afEGvZbEy/
         5VqH9lwxCpoFVdnXPDOTHakZAl448yXKr/oFjO6K3GMG5lHxpfgA2cIE4ZHTqXrs7A
         J9uT/dzg4LEAEYZUZ3rPBSdjCD2CNsjk8P3MYEbg=
Date:   Fri, 8 May 2020 16:31:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH] USB: host: ehci: Add error handling
 inehci_mxc_drv_probe()
Message-ID: <20200508143110.GA447591@kroah.com>
References: <20200508114453.15436-1-tangbin@cmss.chinamobile.com>
 <20200508114858.GA4085349@kroah.com>
 <fb147bdf-faaa-8919-407e-89b4fe1337a6@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb147bdf-faaa-8919-407e-89b4fe1337a6@cmss.chinamobile.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 08, 2020 at 09:55:53PM +0800, Tang Bin wrote:
> Hi, Greg:
> 
> On 2020/5/8 19:48, Greg KH wrote:
> > On Fri, May 08, 2020 at 07:44:53PM +0800, Tang Bin wrote:
> > > The function ehci_mxc_drv_probe() does not perform sufficient error
> > > checking after executing platform_get_irq(), thus fix it.
> > > 
> > > Fixes: 7e8d5cd93fa ("USB: Add EHCI support for MX27 and MX31 based boards")
> > > Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> > > Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> > > ---
> > >   drivers/usb/host/ehci-mxc.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/usb/host/ehci-mxc.c b/drivers/usb/host/ehci-mxc.c
> > > index a1eb5ee77..a0b42ba59 100644
> > > --- a/drivers/usb/host/ehci-mxc.c
> > > +++ b/drivers/usb/host/ehci-mxc.c
> > > @@ -50,6 +50,8 @@ static int ehci_mxc_drv_probe(struct platform_device *pdev)
> > >   	}
> > >   	irq = platform_get_irq(pdev, 0);
> > > +	if (irq < 0)
> > > +		return irq;
> > <= ?
> 
> In the file 'drivers/base/platform.c'， the function platform_get_irq() is
> explained and used as follows:
> 
>      * Gets an IRQ for a platform device and prints an error message if
> finding the
>      * IRQ fails. Device drivers should check the return value for errors so
> as to
>      * not pass a negative integer value to the request_irq() APIs.
>      *
>      * Example:
>      *        int irq = platform_get_irq(pdev, 0);
>      *        if (irq < 0)
>      *            return irq;
>      *
>      * Return: IRQ number on success, negative error number on failure.
> 
> And in my hardware experiment, even if I set the irq failed deliberately in
> the DTS, the returned value is negative instead of zero.

Please read the thread at
	https://lore.kernel.org/r/20200501224042.141366-1-helgaas%40kernel.org
for more details about this.

thanks,

greg k-h
