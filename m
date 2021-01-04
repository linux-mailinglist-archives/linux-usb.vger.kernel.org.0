Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5CA2E91B9
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 09:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbhADIZy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 03:25:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:35764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbhADIZy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Jan 2021 03:25:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 919A4207B6;
        Mon,  4 Jan 2021 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609748713;
        bh=V7amTIWrOc9uWPWSkmJ1lXtRvVHV5LT1tw8BcYqoNlM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EDNK8hiQMEeiksgqQLF7f7JXrQC3Lv6k5uHf7HjEX/+irf43o/NROD80hVyIjU8wx
         y+3u0OKix32OOqLpiln+D2jvuUGhi/KsNAMxdHsmmCWYjGUjopn+oAZbgY250mLk/P
         x00/mmx34YgFAafzS95AbroKd4DElO4HdG9s6fWw=
Date:   Mon, 4 Jan 2021 09:25:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RESEND PATCH v6 3/3] usb: dwc3: Pass quirk as platform data
Message-ID: <X/LQ5ZWLUCGzC8vz@kroah.com>
References: <cover.1606149078.git.joglekar@synopsys.com>
 <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b96cb765bb154cf0e83a436e7fed8882f566cf9.1606149078.git.joglekar@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 04, 2021 at 01:38:43PM +0530, Tejas Joglekar wrote:
> This commit adds the platform device data to setup
> the XHCI_SG_TRB_CACHE_SIZE_QUIRK quirk. DWC3 hosts
> which are PCI devices does not use OF to create platform device
> but create xhci-plat platform device at runtime. So
> this patch allows parent device to supply the quirk
> through platform data.
> 
> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> ---
>  drivers/usb/dwc3/host.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

What changed from previous versions?

> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index e195176580de..0434bc8cec12 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -11,6 +11,11 @@
>  #include <linux/platform_device.h>
>  
>  #include "core.h"
> +#include "../host/xhci-plat.h"

That feels really wrong.  Are you sure about that?

thanks,

greg k-h
