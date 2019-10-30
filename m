Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63017E9AF0
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 12:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfJ3LkJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 07:40:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:19024 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726065AbfJ3LkJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Oct 2019 07:40:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 04:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="205765879"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2019 04:40:06 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Sanket Parmar <sparmar@cadence.com>, gregkh@linuxfoundation.org
Cc:     sparmar@cadence.com, pawell@cadence.com, linux-usb@vger.kernel.org,
        rogerq@ti.com, linux-kernel@vger.kernel.org, kurahul@cadence.com,
        peter.chen@nxp.com, nsekhar@ti.com
Subject: Re: [PATCH] usb: cdns3: gadget: reset EP_CLAIMED flag while unloading
In-Reply-To: <20191029122441.5816-1-sparmar@cadence.com>
References: <20191029122441.5816-1-sparmar@cadence.com>
Date:   Wed, 30 Oct 2019 13:40:05 +0200
Message-ID: <8736fafomi.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Greg,

Sanket Parmar <sparmar@cadence.com> writes:

> EP_CLAIMED flag is used to track the claimed endpoints. While unloading the
> module, Reset EP_CLAIMED flag for all enabled endpoints. So that it can be
> reused.
>
> Signed-off-by: Sanket Parmar <sparmar@cadence.com>

if you want to take this as a patch:

Acked-by: Felipe Balbi <balbi@kernel.org>

> ---
> Hi Greg/Felipe,
>
> This can be used for -rc as it is bug fix.
>
> Regards,
> Sanket
>
>  drivers/usb/cdns3/gadget.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 9050b380ab83..2fb78322ed3c 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -2381,6 +2381,8 @@ static int cdns3_gadget_udc_stop(struct usb_gadget *gadget)
>  		writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
>  		readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
>  					  !(val & EP_CMD_EPRST), 1, 100);
> +
> +		priv_ep->flags &= ~EP_CLAIMED;
>  	}
>  
>  	/* disable interrupt for device */
> -- 
> 2.17.1
>

-- 
balbi
