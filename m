Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295627268B3
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 20:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbjFGS1f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 14:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbjFGS12 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 14:27:28 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3AEDB2113
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 11:27:05 -0700 (PDT)
Received: (qmail 235645 invoked by uid 1000); 7 Jun 2023 14:26:06 -0400
Date:   Wed, 7 Jun 2023 14:26:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     gregkh@linuxfoundation.org, colin.i.king@gmail.com,
        xuetao09@huawei.com, quic_eserrao@quicinc.com,
        water.zhangjiantao@huawei.com, peter.chen@freescale.com,
        balbi@ti.com, francesco@dolcini.it, alistair@alistair23.me,
        stephan@gerhold.net, bagasdotme@gmail.com, luca@z3ntu.xyz,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: gadget: udc: core: Prevent
 soft_connect_store() race
Message-ID: <0bea99f1-cf66-4e80-b89b-41007c2ccfee@rowland.harvard.edu>
References: <20230601031028.544244-1-badhri@google.com>
 <20230601031028.544244-2-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601031028.544244-2-badhri@google.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch looks basically okay.  Most of the comments below are 
concerned only with style or presentation.

On Thu, Jun 01, 2023 at 03:10:28AM +0000, Badhri Jagan Sridharan wrote:
> usb_udc_connect_control(), soft_connect_store() and
> usb_gadget_deactivate() can potentialy race against each other to invoke

"potentially" has two 'l's.

> usb_gadget_connect()/usb_gadget_disconnect(). To prevent this, guarding

s/guarding/guard/

> udc->vbus, udc->started, gadget->allow_connect, gadget->deactivate with

Insert "and" before "gadget->deactivate".

Also, I don't think the patch guards udc->vbus.  After all, that flag 
can be changed in usb_udc_vbus_handler() without the protection of the 
mutex.

> connect_lock so that ->pullup() is only invoked when gadget driver is
> bound, not deactivated and started.

"when the gadget", not "when gadget driver".  The driver isn't what gets 
deactivated or started; the gadget is.

This would be easier to understand if the last two items were switched:

	bound, started, and not deactivated.

Also, it would help readers if there were some additional text to help 
separate the end of this sentence from the start of the next one.  For 
example, you might insert "The routines" at the beginning of the next 
sentence.

>  usb_gadget_connect_locked(),
> usb_gadget_disconnect_locked(), usb_udc_connect_control_locked(),
> usb_gadget_udc_start_locked(), usb_gadget_udc_stop_locked() are called
> with this lock held.
> 
> This commit was reverted due to the crash reported in

An earlier version of this commit...

> https://lore.kernel.org/all/ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com/.
> commit 16737e78d190 ("usb: gadget: udc: core: Offload usb_udc_vbus_handler processing")
> addresses the crash reported.
> 
> Cc: stable@vger.kernel.org
> Fixes: 628ef0d273a6 ("usb: udc: add usb_udc_vbus_handler")
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
> v5 is the first version in this series.
> Changes since v5:
> ** Fixed up commit message
> ** Wrapped comments at 76.
> ---
>  drivers/usb/gadget/udc/core.c | 151 ++++++++++++++++++++++++----------
>  1 file changed, 109 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index d2e4f78c53e3..b53f74fcad60 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -40,6 +40,11 @@ static const struct bus_type gadget_bus_type;
>   * @allow_connect: Indicates whether UDC is allowed to be pulled up.
>   * Set/cleared by gadget_(un)bind_driver() after gadget driver is bound or
>   * unbound.
> + * @connect_lock: protects udc->vbus, udc->started, gadget->connect,
> + * gadget->deactivate. usb_gadget_connect_locked,

Again, separate the two sentences with some extra text.  Otherwise the 
period looks too much like a comma for people to see it easily.

> + * usb_gadget_disconnect_locked, usb_udc_connect_control_locked,
> + * usb_gadget_udc_start_locked, usb_gadget_udc_stop_locked are called with
> + * this lock held.
>   *
>   * This represents the internal data structure which is used by the UDC-class
>   * to hold information about udc driver and gadget together.
> @@ -53,6 +58,7 @@ struct usb_udc {
>  	bool				started;
>  	bool				allow_connect;
>  	struct work_struct		vbus_work;
> +	struct mutex			connect_lock;
>  };
>  
>  static struct class *udc_class;
> @@ -692,17 +698,12 @@ int usb_gadget_vbus_disconnect(struct usb_gadget *gadget)
>  }
>  EXPORT_SYMBOL_GPL(usb_gadget_vbus_disconnect);
>  
> -/**
> - * usb_gadget_connect - software-controlled connect to USB host
> - * @gadget:the peripheral being connected
> - *
> - * Enables the D+ (or potentially D-) pullup.  The host will start
> - * enumerating this gadget when the pullup is active and a VBUS session
> - * is active (the link is powered).
> - *
> - * Returns zero on success, else negative errno.
> +/*
> + * Internal version of usb_gadget_connect needs to be called with
> + * connect_lock held.

I'm not sure you need to say this; it's pretty obvious from the 
__must_hold() annotation a few lines later.  Consider removing this 
paragraph and the similar paragraphs in the other new internal routines.

>   */
> -int usb_gadget_connect(struct usb_gadget *gadget)
> +static int usb_gadget_connect_locked(struct usb_gadget *gadget)
> +	__must_hold(&gadget->udc->connect_lock)
>  {
>  	int ret = 0;
>  
> @@ -711,10 +712,12 @@ int usb_gadget_connect(struct usb_gadget *gadget)
>  		goto out;
>  	}
>  
> -	if (gadget->deactivated || !gadget->udc->allow_connect) {
> +	if (gadget->deactivated || !gadget->udc->allow_connect || !gadget->udc->started) {
>  		/*
>  		 * If gadget is deactivated we only save new state.
>  		 * Gadget will be connected automatically after activation.

This comment is now inaccurate.  Change it to say:

		 * If the gadget isn't usable (because it is deactivated,
		 * unbound, or not yet started), we only save the new state.
		 * The gadget will be connected automatically when it is
		 * activated/bound/started.

> +		 *
> +		 * udc first needs to be started before gadget can be pulled up.

And then this sentence won't be needed.

>  		 */
>  		gadget->connected = true;
>  		goto out;
> @@ -729,22 +732,35 @@ int usb_gadget_connect(struct usb_gadget *gadget)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(usb_gadget_connect);
>  
>  /**
> - * usb_gadget_disconnect - software-controlled disconnect from USB host
> - * @gadget:the peripheral being disconnected
> - *
> - * Disables the D+ (or potentially D-) pullup, which the host may see
> - * as a disconnect (when a VBUS session is active).  Not all systems
> - * support software pullup controls.
> + * usb_gadget_connect - software-controlled connect to USB host
> + * @gadget:the peripheral being connected
>   *
> - * Following a successful disconnect, invoke the ->disconnect() callback
> - * for the current gadget driver so that UDC drivers don't need to.
> + * Enables the D+ (or potentially D-) pullup.  The host will start
> + * enumerating this gadget when the pullup is active and a VBUS session
> + * is active (the link is powered).
>   *
>   * Returns zero on success, else negative errno.
>   */
> -int usb_gadget_disconnect(struct usb_gadget *gadget)
> +int usb_gadget_connect(struct usb_gadget *gadget)
> +{
> +	int ret;
> +
> +	mutex_lock(&gadget->udc->connect_lock);
> +	ret = usb_gadget_connect_locked(gadget);
> +	mutex_unlock(&gadget->udc->connect_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(usb_gadget_connect);
> +
> +/*
> + * Internal version of usb_gadget_disconnect needs to be called with
> + * connect_lock held.
> + */
> +static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
> +	__must_hold(&gadget->udc->connect_lock)
>  {
>  	int ret = 0;
>  
> @@ -756,10 +772,12 @@ int usb_gadget_disconnect(struct usb_gadget *gadget)
>  	if (!gadget->connected)
>  		goto out;
>  
> -	if (gadget->deactivated) {
> +	if (gadget->deactivated || !gadget->udc->started) {

Do you really need to add this extra test?  After all, if the gadget 
isn't started then how could the previous test of gadget->connected 
possibly succeed?

In fact, I suspect this entire section of code was always useless, since 
the gadget couldn't be connected now if it was already deactivated.

>  		/*
>  		 * If gadget is deactivated we only save new state.
>  		 * Gadget will stay disconnected after activation.
> +		 *
> +		 * udc should have been started before gadget being pulled down.

No need to mention this.

>  		 */
>  		gadget->connected = false;
>  		goto out;
> @@ -779,6 +797,30 @@ int usb_gadget_disconnect(struct usb_gadget *gadget)
>  
>  	return ret;
>  }
> +
> +/**
> + * usb_gadget_disconnect - software-controlled disconnect from USB host
> + * @gadget:the peripheral being disconnected
> + *
> + * Disables the D+ (or potentially D-) pullup, which the host may see
> + * as a disconnect (when a VBUS session is active).  Not all systems
> + * support software pullup controls.
> + *
> + * Following a successful disconnect, invoke the ->disconnect() callback
> + * for the current gadget driver so that UDC drivers don't need to.
> + *
> + * Returns zero on success, else negative errno.
> + */
> +int usb_gadget_disconnect(struct usb_gadget *gadget)
> +{
> +	int ret;
> +
> +	mutex_lock(&gadget->udc->connect_lock);
> +	ret = usb_gadget_disconnect_locked(gadget);
> +	mutex_unlock(&gadget->udc->connect_lock);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL_GPL(usb_gadget_disconnect);
>  
>  /**
> @@ -799,10 +841,11 @@ int usb_gadget_deactivate(struct usb_gadget *gadget)
>  	if (gadget->deactivated)
>  		goto out;
>  
> +	mutex_lock(&gadget->udc->connect_lock);

The mutex should be acquired _before_ the test of gadget->deactivated.  
Otherwise the the state could change between the time of the test and 
the time of the mutex_lock().

>  	if (gadget->connected) {
> -		ret = usb_gadget_disconnect(gadget);
> +		ret = usb_gadget_disconnect_locked(gadget);
>  		if (ret)
> -			goto out;
> +			goto unlock;
>  
>  		/*
>  		 * If gadget was being connected before deactivation, we want
> @@ -812,6 +855,8 @@ int usb_gadget_deactivate(struct usb_gadget *gadget)
>  	}
>  	gadget->deactivated = true;
>  
> +unlock:
> +	mutex_unlock(&gadget->udc->connect_lock);
>  out:
>  	trace_usb_gadget_deactivate(gadget, ret);
>  
> @@ -835,6 +880,7 @@ int usb_gadget_activate(struct usb_gadget *gadget)
>  	if (!gadget->deactivated)
>  		goto out;
>  
> +	mutex_lock(&gadget->udc->connect_lock);
>  	gadget->deactivated = false;

Again, lock the mutex before testing the flag.

>  
>  	/*
> @@ -842,7 +888,8 @@ int usb_gadget_activate(struct usb_gadget *gadget)
>  	 * while it was being deactivated, we call usb_gadget_connect().
>  	 */
>  	if (gadget->connected)
> -		ret = usb_gadget_connect(gadget);
> +		ret = usb_gadget_connect_locked(gadget);
> +	mutex_unlock(&gadget->udc->connect_lock);
>  
>  out:
>  	trace_usb_gadget_activate(gadget, ret);
> @@ -1083,19 +1130,22 @@ EXPORT_SYMBOL_GPL(usb_gadget_set_state);
>  
>  /* ------------------------------------------------------------------------- */
>  
> -static void usb_udc_connect_control(struct usb_udc *udc)
> +/* Acquire connect_lock before calling this function. */
> +static void usb_udc_connect_control_locked(struct usb_udc *udc) __must_hold(&udc->connect_lock)
>  {
>  	if (udc->vbus)
> -		usb_gadget_connect(udc->gadget);
> +		usb_gadget_connect_locked(udc->gadget);
>  	else
> -		usb_gadget_disconnect(udc->gadget);
> +		usb_gadget_disconnect_locked(udc->gadget);
>  }
>  
>  static void vbus_event_work(struct work_struct *work)
>  {
>  	struct usb_udc *udc = container_of(work, struct usb_udc, vbus_work);
>  
> -	usb_udc_connect_control(udc);
> +	mutex_lock(&udc->connect_lock);
> +	usb_udc_connect_control_locked(udc);
> +	mutex_unlock(&udc->connect_lock);
>  }
>  
>  /**
> @@ -1144,7 +1194,7 @@ void usb_gadget_udc_reset(struct usb_gadget *gadget,
>  EXPORT_SYMBOL_GPL(usb_gadget_udc_reset);
>  
>  /**
> - * usb_gadget_udc_start - tells usb device controller to start up
> + * usb_gadget_udc_start_locked - tells usb device controller to start up
>   * @udc: The UDC to be started
>   *
>   * This call is issued by the UDC Class driver when it's about
> @@ -1155,8 +1205,11 @@ EXPORT_SYMBOL_GPL(usb_gadget_udc_reset);
>   * necessary to have it powered on.
>   *
>   * Returns zero on success, else negative errno.
> + *
> + * Caller should acquire connect_lock before invoking this function.
>   */
> -static inline int usb_gadget_udc_start(struct usb_udc *udc)
> +static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
> +	__must_hold(&udc->connect_lock)
>  {
>  	int ret;
>  
> @@ -1173,7 +1226,7 @@ static inline int usb_gadget_udc_start(struct usb_udc *udc)
>  }
>  
>  /**
> - * usb_gadget_udc_stop - tells usb device controller we don't need it anymore
> + * usb_gadget_udc_stop_locked - tells usb device controller we don't need it anymore
>   * @udc: The UDC to be stopped
>   *
>   * This call is issued by the UDC Class driver after calling
> @@ -1182,8 +1235,11 @@ static inline int usb_gadget_udc_start(struct usb_udc *udc)
>   * The details are implementation specific, but it can go as
>   * far as powering off UDC completely and disable its data
>   * line pullups.
> + *
> + * Caller should acquire connect lock before invoking this function.
>   */
> -static inline void usb_gadget_udc_stop(struct usb_udc *udc)
> +static inline void usb_gadget_udc_stop_locked(struct usb_udc *udc)
> +	__must_hold(&udc->connect_lock)
>  {
>  	if (!udc->started) {
>  		dev_err(&udc->dev, "UDC had already stopped\n");
> @@ -1342,6 +1398,7 @@ int usb_add_gadget(struct usb_gadget *gadget)
>  
>  	udc->gadget = gadget;
>  	gadget->udc = udc;
> +	mutex_init(&udc->connect_lock);
>  
>  	udc->started = false;
>  
> @@ -1545,12 +1602,16 @@ static int gadget_bind_driver(struct device *dev)
>  	if (ret)
>  		goto err_bind;
>  
> -	ret = usb_gadget_udc_start(udc);
> -	if (ret)
> +	mutex_lock(&udc->connect_lock);
> +	ret = usb_gadget_udc_start_locked(udc);
> +	if (ret) {
> +		mutex_unlock(&udc->connect_lock);
>  		goto err_start;
> +	}
>  	usb_gadget_enable_async_callbacks(udc);
>  	udc->allow_connect = true;
> -	usb_udc_connect_control(udc);
> +	usb_udc_connect_control_locked(udc);
> +	mutex_unlock(&udc->connect_lock);
>  
>  	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>  	return 0;
> @@ -1583,12 +1644,14 @@ static void gadget_unbind_driver(struct device *dev)
>  
>  	udc->allow_connect = false;
>  	cancel_work_sync(&udc->vbus_work);
> -	usb_gadget_disconnect(gadget);
> +	mutex_lock(&udc->connect_lock);
> +	usb_gadget_disconnect_locked(gadget);
>  	usb_gadget_disable_async_callbacks(udc);
>  	if (gadget->irq)
>  		synchronize_irq(gadget->irq);
>  	udc->driver->unbind(gadget);
> -	usb_gadget_udc_stop(udc);
> +	usb_gadget_udc_stop_locked(udc);
> +	mutex_unlock(&udc->connect_lock);
>  
>  	mutex_lock(&udc_lock);
>  	driver->is_bound = false;

In both these routines, you are careful not to hold the 
udc->connect_lock and the udc_lock at the same time.  Good.

> @@ -1674,11 +1737,15 @@ static ssize_t soft_connect_store(struct device *dev,
>  	}
>  
>  	if (sysfs_streq(buf, "connect")) {
> -		usb_gadget_udc_start(udc);
> -		usb_gadget_connect(udc->gadget);
> +		mutex_lock(&udc->connect_lock);
> +		usb_gadget_udc_start_locked(udc);
> +		usb_gadget_connect_locked(udc->gadget);

Interesting change of behavior here.  Before this patch the connect 
operation would succeed, even if no gadget driver was bound.  Now it 
won't, which is how it ought to behave.

> +		mutex_unlock(&udc->connect_lock);
>  	} else if (sysfs_streq(buf, "disconnect")) {
> -		usb_gadget_disconnect(udc->gadget);
> -		usb_gadget_udc_stop(udc);
> +		mutex_lock(&udc->connect_lock);
> +		usb_gadget_disconnect_locked(udc->gadget);
> +		usb_gadget_udc_stop_locked(udc);
> +		mutex_unlock(&udc->connect_lock);
>  	} else {
>  		dev_err(dev, "unsupported command '%s'\n", buf);
>  		ret = -EINVAL;

Alan Stern
