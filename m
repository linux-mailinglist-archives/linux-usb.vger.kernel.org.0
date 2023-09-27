Return-Path: <linux-usb+bounces-642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2897B059A
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 15:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1AD2D282AF3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 13:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F3534CF1;
	Wed, 27 Sep 2023 13:39:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AAF328CB
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 13:39:01 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 6B3CF126
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 06:38:58 -0700 (PDT)
Received: (qmail 1499780 invoked by uid 1000); 27 Sep 2023 09:38:57 -0400
Date: Wed, 27 Sep 2023 09:38:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Francesco Dolcini <francesco.dolcini@toradex.com>,
  Badhri Jagan Sridharan <badhri@google.com>,
  Michael Grzeschik <m.grzeschik@pengutronix.de>,
  Ivan Orlov <ivan.orlov0322@gmail.com>, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
  quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH v5] usb: gadget: udc: Handle gadget_connect failure
 during bind operation
Message-ID: <aa8db441-766c-4b2f-8062-ec3dd9067789@rowland.harvard.edu>
References: <20230927073027.27952-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927073027.27952-1-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Sep 27, 2023 at 01:00:27PM +0530, Krishna Kurapati wrote:
> In the event gadget_connect call (which invokes pullup) fails,
> propagate the error to udc bind operation which in turn sends the
> error to configfs. The userspace can then retry enumeration if
> it chooses to.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
> Changes in v5: Addressed proper unlocking of control_lock mutex

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/core.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 7d49d8a0b00c..824fe64e078a 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1125,12 +1125,12 @@ EXPORT_SYMBOL_GPL(usb_gadget_set_state);
>  /* ------------------------------------------------------------------------- */
>  
>  /* Acquire connect_lock before calling this function. */
> -static void usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
> +static int usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
>  {
>  	if (udc->vbus)
> -		usb_gadget_connect_locked(udc->gadget);
> +		return usb_gadget_connect_locked(udc->gadget);
>  	else
> -		usb_gadget_disconnect_locked(udc->gadget);
> +		return usb_gadget_disconnect_locked(udc->gadget);
>  }
>  
>  static void vbus_event_work(struct work_struct *work)
> @@ -1604,12 +1604,23 @@ static int gadget_bind_driver(struct device *dev)
>  	}
>  	usb_gadget_enable_async_callbacks(udc);
>  	udc->allow_connect = true;
> -	usb_udc_connect_control_locked(udc);
> +	ret = usb_udc_connect_control_locked(udc);
> +	if (ret)
> +		goto err_connect_control;
> +
>  	mutex_unlock(&udc->connect_lock);
>  
>  	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>  	return 0;
>  
> + err_connect_control:
> +	udc->allow_connect = false;
> +	usb_gadget_disable_async_callbacks(udc);
> +	if (gadget->irq)
> +		synchronize_irq(gadget->irq);
> +	usb_gadget_udc_stop_locked(udc);
> +	mutex_unlock(&udc->connect_lock);
> +
>   err_start:
>  	driver->unbind(udc->gadget);
>  
> -- 
> 2.42.0
> 

