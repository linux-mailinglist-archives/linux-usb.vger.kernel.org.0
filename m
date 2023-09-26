Return-Path: <linux-usb+bounces-607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618E7AF47C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 21:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id A2147281B23
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 19:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF734998A;
	Tue, 26 Sep 2023 19:54:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B7433E5
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 19:54:09 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 43727F3
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 12:54:07 -0700 (PDT)
Received: (qmail 1473364 invoked by uid 1000); 26 Sep 2023 15:54:06 -0400
Date: Tue, 26 Sep 2023 15:54:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Francesco Dolcini <francesco.dolcini@toradex.com>,
  Badhri Jagan Sridharan <badhri@google.com>,
  Michael Grzeschik <m.grzeschik@pengutronix.de>,
  Ivan Orlov <ivan.orlov0322@gmail.com>, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
  quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH v4] usb: gadget: udc: Handle gadget_connect failure
 during bind operation
Message-ID: <2178cf29-5e5c-4ed6-8d1c-916bc7036589@rowland.harvard.edu>
References: <20230926193708.22405-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926193708.22405-1-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Sep 27, 2023 at 01:07:08AM +0530, Krishna Kurapati wrote:
> In the event, gadget_connect call (which invokes pullup) fails,

s/event,/event/

> propagate the error to udc bind operation which inturn sends the

s/inturn/in turn/

> error to configfs. The userspace can then retry enumeartion if

s/enumeartion/enumeration/

> it chooses to.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
> Changes in v4: Fixed mutex locking imbalance during connect_control
> failure
> Link to v3: https://lore.kernel.org/all/20230510075252.31023-3-quic_kriskura@quicinc.com/
> 
>  drivers/usb/gadget/udc/core.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 7d49d8a0b00c..53af25a333a1 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1125,12 +1125,16 @@ EXPORT_SYMBOL_GPL(usb_gadget_set_state);
>  /* ------------------------------------------------------------------------- */
>  
>  /* Acquire connect_lock before calling this function. */
> -static void usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
> +static int usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
>  {
> +	int ret;
> +
>  	if (udc->vbus)
> -		usb_gadget_connect_locked(udc->gadget);
> +		ret = usb_gadget_connect_locked(udc->gadget);
>  	else
> -		usb_gadget_disconnect_locked(udc->gadget);
> +		ret = usb_gadget_disconnect_locked(udc->gadget);
> +
> +	return ret;

You don't actually need the new variable ret.  You can just do:

	if (udc->vbus)
		return usb_gadget_connect_locked(udc->gadget);
	else
		return usb_gadget_disconnect_locked(udc->gadget);

>  }
>  
>  static void vbus_event_work(struct work_struct *work)
> @@ -1604,12 +1608,23 @@ static int gadget_bind_driver(struct device *dev)
>  	}
>  	usb_gadget_enable_async_callbacks(udc);
>  	udc->allow_connect = true;
> -	usb_udc_connect_control_locked(udc);
> +	ret = usb_udc_connect_control_locked(udc);
> +	if (ret) {
> +		mutex_unlock(&udc->connect_lock);
> +		goto err_connect_control;
> +	}
> +
>  	mutex_unlock(&udc->connect_lock);
>  
>  	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>  	return 0;
>  
> + err_connect_control:
> +	usb_gadget_disable_async_callbacks(udc);
> +	if (gadget->irq)
> +		synchronize_irq(gadget->irq);
> +	usb_gadget_udc_stop_locked(udc);

Not good -- usb_gadget_udc_stop_locked() expects you to be holding 
udc->connect_lock, but you just dropped the lock!  Also, you never set 
udc->allow_connect back to false.

You should move the mutex_unlock() call from inside the "if" statement 
to down here, and add a line for udc->allow_connect.

Alan Stern

> +
>   err_start:
>  	driver->unbind(udc->gadget);
>  
> -- 
> 2.42.0
> 

