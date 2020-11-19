Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079672B96D9
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 16:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgKSPuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 10:50:12 -0500
Received: from netrider.rowland.org ([192.131.102.5]:35391 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728665AbgKSPuL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 10:50:11 -0500
Received: (qmail 573920 invoked by uid 1000); 19 Nov 2020 10:50:09 -0500
Date:   Thu, 19 Nov 2020 10:50:09 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     peter.chen@nxp.com, balbi@kernel.org, gregkh@linuxfoundation.org,
        sergei.shtylyov@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: Fix memleak in gadgetfs_fill_super
Message-ID: <20201119155009.GA573796@rowland.harvard.edu>
References: <20201117021629.1470544-1-zhangqilong3@huawei.com>
 <20201117021629.1470544-3-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117021629.1470544-3-zhangqilong3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 17, 2020 at 10:16:29AM +0800, Zhang Qilong wrote:
> usb_get_gadget_udc_name will alloc memory for CHIP
> in "Enomem" branch. we should free it before error
> returns to prevent memleak.
> 
> Fixes: 175f712119c57 ("usb: gadget: provide interface for legacy gadgets to get UDC name")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Changelog:
> v2
> - replace free with kfree.
> ---
>  drivers/usb/gadget/legacy/inode.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index 1b430b36d0a6..71e7d10dd76b 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -2039,6 +2039,9 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
>  	return 0;
>  
>  Enomem:
> +	kfree(CHIP);
> +	CHIP = NULL;
> +
>  	return -ENOMEM;
>  }
>  

