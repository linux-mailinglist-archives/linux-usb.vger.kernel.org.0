Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1630F4E4CF2
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 07:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbiCWG5F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 02:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbiCWG5F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 02:57:05 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26015710C2
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 23:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648018535; x=1679554535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AId1P11Ml22Q0miFpHuiwZ6zcrehec+l1YKKCdQAxbA=;
  b=zWg9LCHpeZJant8cn90/0I6/9BsSz4+A+VuYpTjK3djRKvVODy+mxwyf
   JpZSjKAin6SqEE6sw4tDEFoE8BqZ8DQlg5diKaMw8/nNYj8aXj6CMoFZS
   8kA+PQ9CEEDLFEsyZgJVdKkQWFWqHAe9XGeWbh6uwJg8tDA22wyZ1/M/p
   Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Mar 2022 23:55:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 23:55:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 22 Mar 2022 23:55:34 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 22 Mar 2022 23:55:32 -0700
Date:   Wed, 23 Mar 2022 12:25:28 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        "USB mailing list" <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH 4/4] USB: gadget: Add a new bus for gadgets
Message-ID: <20220323065528.GA32029@hu-pkondeti-hyd.qualcomm.com>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YjeEwspj0V3JaV1L@rowland.harvard.edu>
 <YjeFImy6hY+2MHe2@rowland.harvard.edu>
 <YjeFaCijdcfw5fdc@rowland.harvard.edu>
 <YjeFqK+ZrcHx9HZh@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YjeFqK+ZrcHx9HZh@rowland.harvard.edu>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Sun, Mar 20, 2022 at 03:51:04PM -0400, Alan Stern wrote:
> This patch adds a "gadget" bus and uses it for registering gadgets and
> their drivers.  From now on, bindings will be managed by the driver
> core rather than through ad-hoc manipulations in the UDC core.
> 
> As part of this change, the driver_pending_list is removed.  The UDC
> core won't need to keep track of unbound drivers for later binding,
> because the driver core handles all of that for us.
> 
> However, we do need one new feature: a way to prevent gadget drivers
> from being bound to more than one gadget at a time.  The existing code
> does this automatically, but the driver core doesn't -- it's perfectly
> happy to bind a single driver to all the matching devices on the bus.
> The patch adds a new bitflag to the usb_gadget_driver structure for
> this purpose.
> 
> A nice side effect of this change is a reduction in the total lines of
> code, since now the driver core will do part of the work that the UDC
> used to do.
> 
> A possible future patch could add udc devices to the gadget bus, say
> as a separate device type.

Can you please elaborate on this? This UDC device will be added to gadget bus
but not bound to any driver, correct?

> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> ---
> 
>  drivers/usb/gadget/udc/core.c |  248 +++++++++++++++++++-----------------------
>  include/linux/usb/gadget.h    |   26 ++--
>  2 files changed, 135 insertions(+), 139 deletions(-)
> 

<snip>

>  
>  /* ------------------------------------------------------------------------- */
>  
> -static int udc_bind_to_driver(struct usb_udc *udc, struct usb_gadget_driver *driver)
> +static int gadget_match_driver(struct device *dev, struct device_driver *drv)
>  {
> -	int ret;
> +	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> +	struct usb_udc *udc = gadget->udc;
> +	struct usb_gadget_driver *driver = container_of(drv,
> +			struct usb_gadget_driver, driver);
>  
> -	dev_dbg(&udc->dev, "registering UDC driver [%s]\n",
> -			driver->function);
> +	/* If the driver specifies a udc_name, it must match the UDC's name */
> +	if (driver->udc_name &&
> +			strcmp(driver->udc_name, dev_name(&udc->dev)) != 0)
> +		return 0;
>  
> +	/* Otherwise any gadget driver matches any UDC */
> +	return 1;
> +}
> +

Would it be better if we add the driver->is_bound check here so that probe is
not invoked? your patch checks it later at the probe.

Thanks,
Pavan
