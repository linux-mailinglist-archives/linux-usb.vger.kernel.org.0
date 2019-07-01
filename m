Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7B934725
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 14:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbfFDMn6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 08:43:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:50730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726994AbfFDMn6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Jun 2019 08:43:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A13B24C04;
        Tue,  4 Jun 2019 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559652238;
        bh=nPRw0HfETQMVcRD5ybRNmzTgeO8OxtSmoQqELkBM3uo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z9hbEB1IUVetlT27vitYUzRjwW/0AcgjeKWtZ8vrtzZa9RkfdAyq8RjoarqxM06og
         XJzP21fmq9Siqce4ULswG2d3mXAha3TKIt0fkw4fqbs5yGzNp3jkKo5/QoCYuNkKQ9
         rfqP07Ih5LBpto9QA/EvKL/xDyeqG1EV3i0DwXys=
Date:   Tue, 4 Jun 2019 14:43:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] USB: move usb debugfs directory creation to the usb
 common core
Message-ID: <20190604124349.GA10203@kroah.com>
References: <20190604093258.GB30054@kroah.com>
 <87tvd5illh.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tvd5illh.fsf@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 04, 2019 at 03:25:14PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> > index 7fcb9f782931..f3d6b1ab80cb 100644
> > --- a/drivers/usb/core/usb.c
> > +++ b/drivers/usb/core/usb.c
> > @@ -1185,19 +1185,17 @@ static struct notifier_block usb_bus_nb = {
> >  	.notifier_call = usb_bus_notify,
> >  };
> >  
> > -struct dentry *usb_debug_root;
> > -EXPORT_SYMBOL_GPL(usb_debug_root);
> > +static struct dentry *usb_devices_root;
> >  
> >  static void usb_debugfs_init(void)
> >  {
> > -	usb_debug_root = debugfs_create_dir("usb", NULL);
> > -	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
> > -			    &usbfs_devices_fops);
> > +	usb_devices_root = debugfs_create_file("devices", 0444, usb_debug_root,
> 
> don't we have a race now? Can usbcore ever probe before usb common?

How can that happen if usb_debug_root is in usb common?  The module
loader will not let that happen.  Or it shouldn't :)

thanks,

greg k-h
