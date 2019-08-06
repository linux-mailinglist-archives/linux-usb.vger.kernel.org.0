Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F40D882CEB
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 09:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731787AbfHFHh7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 03:37:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:42704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728798AbfHFHh7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 03:37:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0080E20B1F;
        Tue,  6 Aug 2019 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565077078;
        bh=eXqquLCiXReR3xQN680K9YcA6m4LxHXmEELvff+wep0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tRXL5XVeLNpB8owmik6UElrJZta88y8oEn4ZSz/tYznfwnEa3JynlwHkeQs9oZG1w
         j5F+gaj62hWDXTJdPSyH2Jy3BJmB4xS9a6tEZX00F1fELh3ZVHbvdGaO+Ay0kMYZyE
         XWnGVLR9ZKk8CqYB663UktdokmGCMt0ouEnOPyZw=
Date:   Tue, 6 Aug 2019 09:37:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     shuah <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: [PATCH] USB: usbip: convert platform driver to use dev_groups
Message-ID: <20190806073756.GA25825@kroah.com>
References: <20190805193636.25560-5-gregkh@linuxfoundation.org>
 <06d3e73f-ac2f-9ba5-047e-e99834b4860b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06d3e73f-ac2f-9ba5-047e-e99834b4860b@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 05, 2019 at 02:22:18PM -0600, shuah wrote:
> On 8/5/19 1:36 PM, Greg Kroah-Hartman wrote:
> > Platform drivers now have the option to have the platform core create
> > and remove any needed sysfs attribute files.  So take advantage of that
> > and do not register "by hand" any sysfs files.
> > 
> > Cc: Valentina Manea <valentina.manea.m@gmail.com>
> > Cc: Shuah Khan <shuah@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >   drivers/usb/usbip/vudc.h       | 2 +-
> >   drivers/usb/usbip/vudc_dev.c   | 9 ---------
> >   drivers/usb/usbip/vudc_main.c  | 1 +
> >   drivers/usb/usbip/vudc_sysfs.c | 7 ++++++-
> >   4 files changed, 8 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
> > index cf968192e59f..1bd4bc005829 100644
> > --- a/drivers/usb/usbip/vudc.h
> > +++ b/drivers/usb/usbip/vudc.h
> > @@ -115,7 +115,7 @@ struct vudc_device {
> >   	struct list_head dev_entry;
> >   };
> > -extern const struct attribute_group vudc_attr_group;
> > +extern const struct attribute_group *vudc_groups[];
> >   /* visible everywhere */
> > diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> > index a72c17ff1c6a..c8eeabdd9b56 100644
> > --- a/drivers/usb/usbip/vudc_dev.c
> > +++ b/drivers/usb/usbip/vudc_dev.c
> > @@ -616,18 +616,10 @@ int vudc_probe(struct platform_device *pdev)
> >   	if (ret < 0)
> >   		goto err_add_udc;
> > -	ret = sysfs_create_group(&pdev->dev.kobj, &vudc_attr_group);
> > -	if (ret) {
> > -		dev_err(&udc->pdev->dev, "create sysfs files\n");
> > -		goto err_sysfs;
> > -	}
> > -
> >   	platform_set_drvdata(pdev, udc);
> >   	return ret;
> > -err_sysfs:
> > -	usb_del_gadget_udc(&udc->gadget);
> >   err_add_udc:
> >   	cleanup_vudc_hw(udc);
> >   err_init_vudc_hw:
> > @@ -640,7 +632,6 @@ int vudc_remove(struct platform_device *pdev)
> >   {
> >   	struct vudc *udc = platform_get_drvdata(pdev);
> > -	sysfs_remove_group(&pdev->dev.kobj, &vudc_attr_group);
> >   	usb_del_gadget_udc(&udc->gadget);
> >   	cleanup_vudc_hw(udc);
> >   	kfree(udc);
> > diff --git a/drivers/usb/usbip/vudc_main.c b/drivers/usb/usbip/vudc_main.c
> > index 390733e6937e..678faa82598c 100644
> > --- a/drivers/usb/usbip/vudc_main.c
> > +++ b/drivers/usb/usbip/vudc_main.c
> > @@ -22,6 +22,7 @@ static struct platform_driver vudc_driver = {
> >   	.remove		= vudc_remove,
> >   	.driver		= {
> >   		.name	= GADGET_NAME,
> > +		.dev_groups = vudc_groups,
> >   	},
> >   };
> > diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
> > index 6dcd3ff655c3..100f680c572a 100644
> > --- a/drivers/usb/usbip/vudc_sysfs.c
> > +++ b/drivers/usb/usbip/vudc_sysfs.c
> > @@ -215,7 +215,12 @@ static struct bin_attribute *dev_bin_attrs[] = {
> >   	NULL,
> >   };
> > -const struct attribute_group vudc_attr_group = {
> > +static const struct attribute_group vudc_attr_group = {
> >   	.attrs = dev_attrs,
> >   	.bin_attrs = dev_bin_attrs,
> >   };
> > +
> > +const struct attribute_group *vudc_groups[] = {
> > +	&vudc_attr_group,
> > +	NULL,
> > +};
> > 
> 
> Looks good to me.
> 
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Thanks for the review!

greg k-h
