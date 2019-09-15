Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52641B2FFF
	for <lists+linux-usb@lfdr.de>; Sun, 15 Sep 2019 14:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbfIOMwP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Sep 2019 08:52:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbfIOMwO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Sep 2019 08:52:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89E9F21479;
        Sun, 15 Sep 2019 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568551934;
        bh=0/zik35DF+tVxlXBl6Nh1J/e9Clns1rAsI9brW5ghaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GdcVKQ+rbVxOcX08gT62qDJxS+8VNaosNyj80VFEP1Mv/VuLT5JuEiROMPvqSa0d5
         J9jtisP1QAZCmAawPYz69GitkhrJnaTAZTIJCyYuCmc0ChN1zL7WHbXxuXw61UrIMy
         LwuF/6ngrTnH6rq3+RW7arX0KSRdLwQRcV8PNRJM=
Date:   Sun, 15 Sep 2019 14:52:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usbip: vhci_hcd indicate failed message
Message-ID: <20190915125211.GA527125@kroah.com>
References: <20190915034332.21168-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190915034332.21168-1-maowenan@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 15, 2019 at 11:43:32AM +0800, Mao Wenan wrote:
> If the return value of vhci_init_attr_group and
> sysfs_create_group is non-zero, which mean they failed
> to init attr_group and create sysfs group, so it would
> better add 'failed' message to indicate that.
> 
> Fixes: 0775a9cbc694 ("usbip: vhci extension: modifications to vhci driver")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/usb/usbip/vhci_hcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 000ab7225717..dd54c95d2498 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1185,12 +1185,12 @@ static int vhci_start(struct usb_hcd *hcd)
>  	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
>  		err = vhci_init_attr_group();
>  		if (err) {
> -			pr_err("init attr group\n");
> +			pr_err("init attr group failed\n");

dev_err() would also be good to use here.

>  			return err;
>  		}
>  		err = sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
>  		if (err) {
> -			pr_err("create sysfs files\n");
> +			pr_err("create sysfs failed\n");

Same here.

thanks,

greg k-h
