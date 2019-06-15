Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96C294727C
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jun 2019 00:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfFOW4m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Jun 2019 18:56:42 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42229 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfFOW4m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Jun 2019 18:56:42 -0400
Received: by mail-lf1-f67.google.com with SMTP id y13so4025004lfh.9;
        Sat, 15 Jun 2019 15:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n2DQBVrln0MwhBv4JgzwT4om+8exV6Welyf2vHqyM8U=;
        b=IAe+THuZeMO5V6AewOExj69XW3ca4njniQ+9BiK0BzvKRl8BqSngEFQCo4nKkUd2FG
         oFTFIzceMw8gSkJSgzMebv9CFDo8LsQ2q7u0AHtF5RQlDwZiJ35LOZNZm+qfTyzyWueM
         beSP4hOOUhucczxeQcuGvI5LwZFgierKTt8ssmXScVmugiF7okU3V73Fd480cS8B9mT7
         h9m1FDf/fa8bKa+wnTa7DOC1ys3k8jCSqS15c7I1EE0WjblrWLYddxHz+AoSx+dsPttp
         DpQ5OPrI6tT0dlIfiB7KbY3HeRVmsmNhMJqd7VV3mpwc2V46NV82JdBAG4kVmGYngGP9
         v1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n2DQBVrln0MwhBv4JgzwT4om+8exV6Welyf2vHqyM8U=;
        b=DWb3ShhfRhSvC3FoBNtkpvQMU8nBFrS76zcfCkv2AKswKdhTSrsEVtuqrgRBvSz6Cp
         ySv7UslLsgtpDkgUfVNnmY8ubiBMMkggDPS0f8P59sFibIQWSZ39ZG0RZK1CNixX0tUS
         HDj/hFX/PaFQaMPp1EcvoFtQtkc7zC5YhdzImg8E+/TVOxC0fiw6u19bKL4V00KI4ymO
         WBegQdxwEazwssC9KsbrR9YkaaGhJo+3LFuCCrU+xh8pBb9bmr1Yp/3PqSFne0cRRuYU
         DFJwyWgbmCA4n5JDhZZ7GkSzrQs0OkFdPXyzwS0K2iDJxgoSJUmZx+6beecT4qzJk3pS
         tx0A==
X-Gm-Message-State: APjAAAW1qOezsVNRBD3hRuIZMI5XK9QoZxGu3hQe2n62mutRXAFhr9m6
        UcXSEHwt+r31rhq+Al4gAsY=
X-Google-Smtp-Source: APXvYqxxlWc+hIZdajut1715GTvfD1Ks7S+6dgNWVxlhFa+QZF307qnSKRuwwhy0qOnq944W0ONXGQ==
X-Received: by 2002:ac2:5636:: with SMTP id b22mr22204214lff.2.1560639399081;
        Sat, 15 Jun 2019 15:56:39 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id t21sm1026630lfd.85.2019.06.15.15.56.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 15 Jun 2019 15:56:38 -0700 (PDT)
Date:   Sun, 16 Jun 2019 01:56:36 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cp210x: Add cp2108 GPIOs support
Message-ID: <20190615225634.fyckt4e7gpnd5fid@mobilestation>
References: <20190514105358.18818-1-fancer.lancer@gmail.com>
 <20190603125205.GC3668@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603125205.GC3668@localhost>
User-Agent: NeoMutt/20180716
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Johan

On Mon, Jun 03, 2019 at 02:52:05PM +0200, Johan Hovold wrote:
> On Tue, May 14, 2019 at 01:53:57PM +0300, Serge Semin wrote:
> > Each chip from the cp210x series got GPIOs on board. This commit
> > provides the support for sixteen ones placed on the cp2108 four-ports
> > serial console controller. All of the GPIOs are equally distributed
> > to four USB interfaces in accordance with GPIOs alternative functions
> > attachment.
> > 
> > cp2108 GPIOs can be either in open-drain or push-pull modes setup once
> > after reset was cleared. In this matter it doesn't differ from the rest
> > of cp210x devices supported by the driver. So with minor alterations the
> > standard output/intput GPIO interface is implemented for cp2108.
> > 
> > Aside from traditional GPIO functions like setting/getting pins value,
> > each GPIO is also multiplexed with alternative functions: TX/RX LEDs, RS485
> > TX-enable and Clocks source. These functions can't be activated on-fly.
> > Instead the chips firmware should be properly setup, so they would be
> > enabled in the ports-config structure at the controller logic startup.
> > Needless to say, that when the alternative functions are activated,
> > the GPIOs can't be used. Thus we need to check the GPIO pin config in the
> > request callback and deny the request if GPIO standard function is
> > disabled.
> 
> Thanks for the patch.
> 
> I'm a bit worried about the logic getting too convoluted when dealing
> with the cp2108 and cp2105 differences. Please see if you can do
> something about that.
> 
> Other than that, just some minor comments and request for
> clarifications.
> 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> >  drivers/usb/serial/Kconfig  |   2 +-
> >  drivers/usb/serial/cp210x.c | 158 ++++++++++++++++++++++++++++++++----
> >  2 files changed, 143 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
> > index 7d031911d04e..20bd4c0632c7 100644
> > --- a/drivers/usb/serial/Kconfig
> > +++ b/drivers/usb/serial/Kconfig
> > @@ -138,7 +138,7 @@ config USB_SERIAL_DIGI_ACCELEPORT
> >  config USB_SERIAL_CP210X
> >  	tristate "USB CP210x family of UART Bridge Controllers"
> >  	help
> > -	  Say Y here if you want to use a CP2101/CP2102/CP2103 based USB
> > +	  Say Y here if you want to use a CP2101/2/3/4/5/8 based USB
> 
> Please drop this since it's a separate change. If anything we should
> probably just change this to "CP210X" not have to worry about it getting
> outdated again.
> 

Ok. Moved to a separate patch.

> >  	  to RS232 converters.
> >  
> >  	  To compile this driver as a module, choose M here: the
> > diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> > index 979bef9bfb6b..a97f04d9e99f 100644
> > --- a/drivers/usb/serial/cp210x.c
> > +++ b/drivers/usb/serial/cp210x.c
> > @@ -505,6 +505,56 @@ struct cp210x_gpio_write {
> >  	u8	state;
> >  } __packed;
> >  
> > +/* CP2108 interfaces, gpio (per interface), port-blocks number, GPIO block. */
> > +#define CP2108_IFACE_NUM		4
> > +#define CP2108_GPIO_NUM			4
> > +#define CP2108_PB_NUM			5
> > +#define CP2108_GPIO_PB			1
> 
> Please try to give these more descriptive names; I'd prefer COUNT over
> NUM when used as a suffix.
> 
> Perhaps slap an INDEX suffix on CP2108_GPIO_PB etc.
> 

Ok. Added CNT and IDX suffixes.

> > +/*
> > + * CP2108 default pins state. There are five PBs. Each one is with its specific
> > + * pins-set (see USB Express SDK sources or SDK-based smt application
> > + * https://github.com/fancer/smt-cp210x for details).
> > + */
> > +struct cp2108_state {
> > +	__le16	mode[CP2108_PB_NUM];	/* 0 - Open-Drain, 1 - Push-Pull */
> > +	__le16	low_power[CP2108_PB_NUM];
> > +	__le16	latch[CP2108_PB_NUM];	/* 0 - Logic Low, 1 - Logic High */
> > +} __packed;
> 
> Ok, so you use mode[CP2108_GPIO_PB] to get the pin modes below;
> what are the other "PB"s used for? Why is it a "port" block, if all 16
> pins allocated to four different ports are accessible through one block?
> 
> Please try to make the comment self-contained (even if you leave some
> details out). And perhaps we shouldn't refer to proprietary code in
> here, and in any case the link may go away.
> 

Ok added a bit more detailed information regarding the port blocks. But
I'd prefer to keep the link. First of all I can't provide the complete
description of the fields here because it would take too much space and
in fact is pointless since only a single port block with GPIOs is utilized.
So the link and the SDK info are a good reference to find some details
(especially due to lacking such an info in the chip datasheet). Secondly
even though the code is distributed under the Silicon Labs specific license
it is open-source. Finally the link may go away only if I removed the
application from my github account, which I don't intend to.

> > +/*
> > + * CP210X_VENDOR_SPECIFIC, CP210X_GET_PORTCONFIG call reads these 73 bytes.
> > + * Reset/Suspend latches describe default states after reset/suspend of the
> > + * pins. The rest are responsible for alternate functions settings of the
> > + * chip pins (see USB Express SDK sources or SDK-based smt application
> > + * https://github.com/fancer/smt-cp210x for details).
> > + */
> > +struct cp2108_config {
> > +	struct cp2108_state reset_latch;
> > +	struct cp2108_state suspend_latch;
> > +	u8	ip_delay[CP2108_IFACE_NUM];
> > +	u8	enhanced_fxn[CP2108_IFACE_NUM];
> > +	u8	enhanced_fxn_dev;
> > +	u8	ext_clock_freq[CP2108_IFACE_NUM];
> > +} __packed;
> > +
> > +/* CP2108 port alternate functions fields */
> > +#define CP2108_GPIO_TXLED_MODE		BIT(0)
> > +#define CP2108_GPIO_RXLED_MODE		BIT(1)
> > +#define CP2108_GPIO_RS485_MODE		BIT(2)
> > +#define CP2108_GPIO_RS485_LOGIC		BIT(3)
> > +#define CP2108_GPIO_CLOCK_MODE		BIT(4)
> > +#define CP2108_DYNAMIC_SUSPEND		BIT(5)
> 
> No GPIO infix?
> 

No, because this refers to all pins state when the chip being suspended
(whether the suspend_latch state is pushed to the pins at the suspend USB
state), while the rest of the macros are defined for the GPIOs alternative
functions. I'll add the MODE suffix though.

> > +
> > +/*
> > + * CP210X_VENDOR_SPECIFIC, CP210X_WRITE_LATCH call writes these 0x4 bytes
> > + * to CP2108 controller.
> > + */
> > +struct cp2108_gpio_write {
> > +	__le16	mask;
> > +	__le16	state;
> > +} __packed;
> 
> No need for __packed (yes, I know there are other unnecessary __packed
> in this file).
> 

Ok.

> >  /*
> >   * Helper to get interface number when we only have struct usb_serial.
> >   */
> > @@ -1366,10 +1416,15 @@ static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> >  	struct usb_serial *serial = gpiochip_get_data(gc);
> >  	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
> >  	u8 req_type = REQTYPE_DEVICE_TO_HOST;
> > -	int result;
> > -	u8 buf;
> > -
> > -	if (priv->partnum == CP210X_PARTNUM_CP2105)
> > +	union {
> > +		u8 single;
> > +		__le16 dual;
> > +	} buf;
> 
> I wonder if this would become more readable if you just use u16,
> initialise to zero, read one byte unless cp2108, and then
> unconditionally do le16_to_cpus() before applying the mask.
> 
> I want to keep the number of conditionals down, but if the logic is
> getting to hard to follow because cp2105 and cp2108 doing things
> differently we may need to add dedicated cp2108 (and maybe cp2105)
> get/set callbacks instead.
> 

Ok. Replaced the union with u16 buffer.

> > +	int result, bufsize = sizeof(buf.single);
> 
> One declaration per line please, especially when initialising.
> 

Done. Though I can't remember this being requirement in the kernel
coding style. Could you give me a link to the corresponding statement?

> > +
> > +	if (priv->partnum == CP210X_PARTNUM_CP2108)
> > +		bufsize = sizeof(buf.dual);
> > +	else if (priv->partnum == CP210X_PARTNUM_CP2105)
> >  		req_type = REQTYPE_INTERFACE_TO_HOST;
> >  
> >  	result = usb_autopm_get_interface(serial->interface);
> > @@ -1377,39 +1432,51 @@ static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> >  		return result;
> >  
> >  	result = cp210x_read_vendor_block(serial, req_type,
> > -					  CP210X_READ_LATCH, &buf, sizeof(buf));
> > +					  CP210X_READ_LATCH, &buf, bufsize);
> >  	usb_autopm_put_interface(serial->interface);
> >  	if (result < 0)
> >  		return result;
> >  
> > -	return !!(buf & BIT(gpio));
> > +	if (priv->partnum == CP210X_PARTNUM_CP2108)
> > +		result = !!(le16_to_cpu(buf.dual) & BIT(gpio));
> > +	else
> > +		result = !!(buf.single & BIT(gpio));
> > +
> > +	return result;
> >  }
> >  
> >  static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
> >  {
> >  	struct usb_serial *serial = gpiochip_get_data(gc);
> >  	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
> > -	struct cp210x_gpio_write buf;
> >  	int result;
> >  
> > -	if (value == 1)
> > -		buf.state = BIT(gpio);
> > -	else
> > -		buf.state = 0;
> > -
> > -	buf.mask = BIT(gpio);
> > -
> >  	result = usb_autopm_get_interface(serial->interface);
> >  	if (result)
> >  		goto out;
> >  
> > -	if (priv->partnum == CP210X_PARTNUM_CP2105) {
> > +	if (priv->partnum == CP210X_PARTNUM_CP2108) {
> > +		struct cp2108_gpio_write buf;
> > +
> > +		buf.state = ((value == 1) ? cpu_to_le16(BIT(gpio)) : 0);
> > +		buf.mask = cpu_to_le16(BIT(gpio));
> > +
> > +		result = cp210x_write_vendor_block(serial,
> > +						   REQTYPE_HOST_TO_DEVICE,
> > +						   CP210X_WRITE_LATCH, &buf,
> > +						   sizeof(buf));
> > +	} else if (priv->partnum == CP210X_PARTNUM_CP2105) {
> > +		struct cp210x_gpio_write buf;
> > +
> > +		buf.state = ((value == 1) ? BIT(gpio) : 0);
> > +		buf.mask = BIT(gpio);
> > +
> >  		result = cp210x_write_vendor_block(serial,
> >  						   REQTYPE_HOST_TO_INTERFACE,
> >  						   CP210X_WRITE_LATCH, &buf,
> >  						   sizeof(buf));
> >  	} else {
> > -		u16 wIndex = buf.state << 8 | buf.mask;
> > +		u16 wIndex = ((value == 1) ? BIT(gpio) : 0) << 8 | BIT(gpio);
> 
> This is way I try to avoid the ternary operator; too easy to write
> overly compact code. Please untangle again.
> 

Ok. Untangled all the ternary operations utilized in this function.

> >  		result = usb_control_msg(serial->dev,
> >  					 usb_sndctrlpipe(serial->dev, 0),
> > @@ -1489,6 +1556,62 @@ static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
> >  	return -ENOTSUPP;
> >  }
> >  
> > +/*
> > + * CP2108 got 16 GPIOs, each of which can be configured either as input, or
> > + * as open-drain with weak pulling up to VIO or as push-pull with strong
> > + * pulling up to VIO. Similar to the rest of devices the open-drain mode
> > + * with latch set high is treated as input mode. All GPIOs are equally
> > + * distributed between four interfaces. Thanks to the mask-state based
> > + * write-latch control message we don't need to worry about possible races.
> > + */
> > +static int cp2108_gpioconf_init(struct usb_serial *serial)
> > +{
> > +	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
> > +	struct cp2108_config config;
> > +	u16 mode, latch;
> > +	u8 intf_num;
> > +	int result;
> > +
> > +	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
> > +					  CP210X_GET_PORTCONFIG, &config,
> > +					  sizeof(config));
> > +	if (result < 0)
> > +		return result;
> > +
> > +	/*
> > +	 * There are four interfaces with four GPIOs for each port. Here we
> > +	 * parse the device config data to comply with the driver interface.
> > +	 * Note that the mode can be changed only after reset, which cause
> > +	 * the driver reloading anyway. So we can safely read the config just
> > +	 * once at attach procedure.
> > +	 */
> > +	intf_num = cp210x_interface_num(serial);
> > +	mode = le16_to_cpu(config.reset_latch.mode[CP2108_GPIO_PB]);
> > +	latch = le16_to_cpu(config.reset_latch.latch[CP2108_GPIO_PB]);
> > +
> > +	priv->gpio_altfunc = config.enhanced_fxn[intf_num];
> 
> Missing sanity check on intf_num.
> 

Done.

> > +	priv->gpio_pushpull = (mode >> (intf_num*CP2108_GPIO_NUM)) & 0x0f;
> > +	priv->gpio_input = (latch >> (intf_num*CP2108_GPIO_NUM)) & 0x0f;
> 
> Missing spaces around multiplication operators.
> 

Done.

> > +
> > +	/*
> > +	 * Move the GPIO clock alternative function bit value to the fourth bit
> > +	 * as the corresponding GPIO pin reside. It shall make the generic
> > +	 * cp210x GPIO request method being suitable for cp2108 as well.
> > +	 */
> 
> This isn't entirely clear, please try to rephrase.
> 
> Which functions are available on which pins? Do the function defines
> need to be renamed to reflect the pin numbers as for CP2104?
> 

I wouldn't rename the macros'es, since they describe the functions of
enhanced_fxn bits. BTW CP2104 doesn't do any renaming anyway, while it
is doing the same thing as I am here. Instead I added a more descriptive
comment, so the code hackers would see the reason of the BITs copy-pasting.

> > +	priv->gpio_altfunc &= ~BIT(3);
> > +	if (priv->gpio_altfunc & CP2108_GPIO_CLOCK_MODE)
> > +		priv->gpio_altfunc |= BIT(3);
> > +
> > +	/*
> > +	 * Open-drain mode in combination with a high latch value is used
> > +	 * to emulate the GPIO input pin.
> > +	 */
> > +	priv->gpio_input &= ~priv->gpio_pushpull;
> 
> Input mode should only be set when the reset latch value is 1 (see
> cp2104).
> 

Yes, and this code does the same thing as the loop in cp2104, but in a single
line. BTW the cp2104 cp2104_gpioconf_init() method can be simplified in the
same way.stash@{0}stash@{0}

> > +	priv->gc.ngpio = CP2108_GPIO_NUM;
> 
> Probably better to just use 4 directly instead of this define in this
> function (e.g. your mask above implicitly depends on it anyway).
> 

Ok. Removed the macro from this function.

It should be also noted that in v2 I fixed a cp2108-related bug in the
cp210x_gpio_get()/cp210x_gpio_set() methods. So aside from the requested
alterations the logic of the cp2108 GPIOs setter/getter is bit different
now.

Regards,
-Sergey

> > +	return 0;
> > +}
> 
> Johan
