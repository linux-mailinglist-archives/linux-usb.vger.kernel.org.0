Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDBD40FA21
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 16:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241989AbhIQO3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 10:29:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:44864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241976AbhIQO32 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 10:29:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C4DE611C8;
        Fri, 17 Sep 2021 14:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631888886;
        bh=+SIC8R+Fdj6ZV0cHf2K3KJw06p7qSyHtOS5C4HYuDO8=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=JnPW6tCmLtomIJ7kBfWltIm4n+9ZTu4bz55Uni5QTC4wdOf+MQsEmbi40NT6LJr8K
         5CCEE/ZZQClVDET1jT3PIAFhycJMYYZfVkABgIhe+Qst5v8GVemBm9+UmqDKOhrYJB
         wwEWqlXgIw+jRUqJT+t7zvQQG4kkYsoAUiEeuen5zWAbgbf2mPH23LzCPPXLWsxhFv
         wpr2S7NpSkooHid+ipZ8sJmL4kFzudHFOivWSp2gOsR/o+7GWjfF1g5GUBcUlt4lrA
         b81ms79K7NkjSC0XnGerKQpoVnsf5ZE6rBvelFAiJ9qItdRsoMBNeTtbttZ82D6p2Q
         lyrX8p2lKH5UA==
References: <20210818094726.3295093-1-shubhrajyoti.datta@xilinx.com>
 <87v943f57a.fsf@kernel.org>
 <MN2PR02MB66409E4F304BE48BBB76A2D0AADD9@MN2PR02MB6640.namprd02.prod.outlook.com>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Shubhrajyoti Datta <shubhraj@xilinx.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Michal Simek <michals@xilinx.com>, git <git@xilinx.com>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Add clock support
Date:   Fri, 17 Sep 2021 17:27:36 +0300
In-reply-to: <MN2PR02MB66409E4F304BE48BBB76A2D0AADD9@MN2PR02MB6640.namprd02.prod.outlook.com>
Message-ID: <87czp79szw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Shubhrajyoti Datta <shubhraj@xilinx.com> writes:
>> -----Original Message-----
>> From: Felipe Balbi <balbi@kernel.org>
>> Sent: Wednesday, August 18, 2021 3:24 PM
>> To: Shubhrajyoti Datta <shubhraj@xilinx.com>
>> Cc: linux-usb@vger.kernel.org; gregkh@linuxfoundation.org; Michal Simek
>> <michals@xilinx.com>; git <git@xilinx.com>
>> Subject: Re: [PATCH] usb: gadget: udc-xilinx: Add clock support
>> 
>> 
>> Hi,
>> 
>> Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> writes:
>> > Currently the driver depends on the  bootloader to enable the clocks.
>> > Add support for clocking. The patch enables the clock at  probe and
>> > disables them at remove.
>> >
>> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>> > ---
>> >  drivers/usb/gadget/udc/udc-xilinx.c | 24 ++++++++++++++++++++++++
>> >  1 file changed, 24 insertions(+)
>> >
>> > diff --git a/drivers/usb/gadget/udc/udc-xilinx.c
>> > b/drivers/usb/gadget/udc/udc-xilinx.c
>> > index fb4ffedd6f0d..30070a488c87 100644
>> > --- a/drivers/usb/gadget/udc/udc-xilinx.c
>> > +++ b/drivers/usb/gadget/udc/udc-xilinx.c
>> > @@ -11,6 +11,7 @@
>> >   * USB peripheral controller (at91_udc.c).
>> >   */
>> >
>> > +#include <linux/clk.h>
>> >  #include <linux/delay.h>
>> >  #include <linux/device.h>
>> >  #include <linux/dma-mapping.h>
>> > @@ -171,6 +172,7 @@ struct xusb_ep {
>> >   * @addr: the usb device base address
>> >   * @lock: instance of spinlock
>> >   * @dma_enabled: flag indicating whether the dma is included in the
>> > system
>> > + * @clk: pointer to struct clk
>> >   * @read_fn: function pointer to read device registers
>> >   * @write_fn: function pointer to write to device registers
>> >   */
>> > @@ -188,6 +190,7 @@ struct xusb_udc {
>> >  	void __iomem *addr;
>> >  	spinlock_t lock;
>> >  	bool dma_enabled;
>> > +	struct clk *clk;
>> >
>> >  	unsigned int (*read_fn)(void __iomem *);
>> >  	void (*write_fn)(void __iomem *, u32, u32); @@ -2092,6 +2095,26 @@
>> > static int xudc_probe(struct platform_device *pdev)
>> >  	udc->gadget.ep0 = &udc->ep[XUSB_EP_NUMBER_ZERO].ep_usb;
>> >  	udc->gadget.name = driver_name;
>> >
>> > +	udc->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
>> > +	if (IS_ERR(udc->clk)) {
>> > +		if (PTR_ERR(udc->clk) != -ENOENT) {
>> > +			ret = PTR_ERR(udc->clk);
>> > +			goto fail;
>> > +		}
>> > +
>> > +		/*
>> > +		 * Clock framework support is optional, continue on,
>> > +		 * anyways if we don't find a matching clock
>> > +		 */
>> > +		udc->clk = NULL;
>> 
>> should it be, though? Might be a good idea to add fixed-clock instances to the
>> boards still depending on clock framework. Maybe that can be done over time,
>> but worth considering anyhow.
>
> But for backward compatibility , I think it will be good to have the
> support instead of forcing the fixed-clock node.

you gotta explain that a little better. Care to do so?

-- 
balbi
