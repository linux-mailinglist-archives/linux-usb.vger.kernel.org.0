Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A96AC135973
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 13:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgAIMpq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 07:45:46 -0500
Received: from bmailout2.hostsharing.net ([83.223.78.240]:36891 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgAIMpp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 07:45:45 -0500
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Jan 2020 07:45:44 EST
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id A0E8B2801F613;
        Thu,  9 Jan 2020 13:36:17 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 65D44351CB; Thu,  9 Jan 2020 13:36:17 +0100 (CET)
Date:   Thu, 9 Jan 2020 13:36:17 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Message-ID: <20200109123617.5ovxwkfnmf7ou4z4@wunner.de>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

just a gentle ping:  The below patch was submitted more than 8 weeks ago
and I'm neither seeing it on one of your branches nor have there been
any comments on the list.  Are there objections to this patch?

Thanks,

Lukas

On Wed, Nov 20, 2019 at 11:15:15AM +0100, Lukas Wunner wrote:
> The original dwc_otg driver used a DWC_WORKQ_SCHEDULE() wrapper to queue
> work items.  Because that wrapper acquired the driver's global spinlock,
> an unlock/lock dance was necessary whenever a work item was queued up
> while the global spinlock was already held.
> 
> The dwc2 driver dropped DWC_WORKQ_SCHEDULE() in favor of a direct call
> to queue_work(), but retained the (now gratuitous) unlock/lock dance in
> dwc2_handle_conn_id_status_change_intr().  Drop it.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  drivers/usb/dwc2/core_intr.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index 6af6add3d4c0..876ff31261d5 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -288,14 +288,9 @@ static void dwc2_handle_conn_id_status_change_intr(struct dwc2_hsotg *hsotg)
>  
>  	/*
>  	 * Need to schedule a work, as there are possible DELAY function calls.
> -	 * Release lock before scheduling workq as it holds spinlock during
> -	 * scheduling.
>  	 */
> -	if (hsotg->wq_otg) {
> -		spin_unlock(&hsotg->lock);
> +	if (hsotg->wq_otg)
>  		queue_work(hsotg->wq_otg, &hsotg->wf_otg);
> -		spin_lock(&hsotg->lock);
> -	}
>  }
>  
>  /**
> -- 
> 2.24.0
