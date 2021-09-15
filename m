Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8413A40C71B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Sep 2021 16:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237791AbhIOOM0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Sep 2021 10:12:26 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55915 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237734AbhIOOM0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Sep 2021 10:12:26 -0400
Received: (qmail 191572 invoked by uid 1000); 15 Sep 2021 10:11:06 -0400
Date:   Wed, 15 Sep 2021 10:11:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: host: ohci-tmio: check return value after calling
 platform_get_resource()
Message-ID: <20210915141106.GB191140@rowland.harvard.edu>
References: <20210915034544.2398636-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915034544.2398636-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 15, 2021 at 11:45:44AM +0800, Yang Yingliang wrote:
> It will cause null-ptr-deref if platform_get_resource() returns NULL,
> we need check the return value.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/usb/host/ohci-tmio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/ohci-tmio.c b/drivers/usb/host/ohci-tmio.c
> index 08ec2ab0d95a..68e769b82061 100644
> --- a/drivers/usb/host/ohci-tmio.c
> +++ b/drivers/usb/host/ohci-tmio.c
> @@ -202,6 +202,9 @@ static int ohci_hcd_tmio_drv_probe(struct platform_device *dev)
>  	if (!cell)
>  		return -EINVAL;
>  
> +	if (!regs || !config || !sram)
> +		return -EINVAL;

Why don't you combine this test with the test immediately above it?

Alan Stern

> +
>  	if (irq < 0)
>  		return irq;
>  
> -- 
> 2.25.1
> 
