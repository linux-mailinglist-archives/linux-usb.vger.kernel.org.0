Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AB23429FE
	for <lists+linux-usb@lfdr.de>; Sat, 20 Mar 2021 03:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhCTCYz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Mar 2021 22:24:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43981 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229756AbhCTCYp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Mar 2021 22:24:45 -0400
Received: (qmail 592383 invoked by uid 1000); 19 Mar 2021 22:24:43 -0400
Date:   Fri, 19 Mar 2021 22:24:43 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jay Fang <f.fangjian@huawei.com>
Cc:     linux-usb@vger.kernel.org, tangzihao1@hisilicon.com,
        dan.carpenter@oracle.com, huangdaode@huawei.com
Subject: Re: [PATCH] usb: ohci: remove unreachable
 platform_driver_unregister() call
Message-ID: <20210320022443.GA591964@rowland.harvard.edu>
References: <1616203911-4207-1-git-send-email-f.fangjian@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616203911-4207-1-git-send-email-f.fangjian@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 20, 2021 at 09:31:51AM +0800, Jay Fang wrote:
> From: Zihao Tang <tangzihao1@hisilicon.com>
> 
> Fix the following smatch warnings:
> 
> drivers/usb/host/ohci-hcd.c:1318 ohci_hcd_mod_init() warn:
> ignoring unreachable code.
> 
> platform_driver_register(&TMIO_OHCI_DRIVER) is the last
> platform_driver_register() call in ohci_hcd_mod_init(), so if it
> failed, there's no need to unregister it, but just goto error_tmio.
> 
> So remove the unreachable platform_driver_unregister(&TMIO_OHCI_DRIVER).
> No functionality change.

Doesn't the compiler realize that the call is unreachable, and 
therefore avoid generating any object for it?

It's true that the function call is, strictly speaking, unnecessary.  
However, it provides a pleasing symmetry and it acts as a guide in the 
unlikely event that anyone wants to add another platform-specific 
driver in the future.

Also, consider what would happen if somebody ever removes the TMIO_OHCI 
platform driver entirely.  They certainly would remove the corresponding
#ifdef...#endif block.  But by your way of thinking, they should remove 
as well the following platform_driver_unregister(&SM501_OHCI_DRIVER) 
call -- something that is not immediately obvious and is likely to be 
overlooked.

On the whole, I prefer to keep the code as it is.  However, if you would 
like to submit a different patch, adding a comment which explains that 
the call is known to be unreachable but is retained nonetheless because 
the maintainer is a crotchety old formalist, I would be willing to apply 
that.

Alan Stern

PS: A #ifdef...#endif block containing nothing but a statement label 
looks a little weird, don't you agree?

> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>
> ---
>  drivers/usb/host/ohci-hcd.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index 1f5e693..2d09ef2 100644
> --- a/drivers/usb/host/ohci-hcd.c
> +++ b/drivers/usb/host/ohci-hcd.c
> @@ -1319,7 +1319,6 @@ static int __init ohci_hcd_mod_init(void)
>  
>  	/* Error path */
>  #ifdef TMIO_OHCI_DRIVER
> -	platform_driver_unregister(&TMIO_OHCI_DRIVER);
>   error_tmio:
>  #endif
>  #ifdef SM501_OHCI_DRIVER
> -- 
> 2.7.4
> 
