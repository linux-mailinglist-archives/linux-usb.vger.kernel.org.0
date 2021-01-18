Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC112FA03C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 13:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404270AbhARMoB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 07:44:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:53374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404258AbhARMnn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 07:43:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E68D4224B8;
        Mon, 18 Jan 2021 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610973782;
        bh=cnYltJ7zUV+fZqR6uHbvvuu1Kt2sdtSKH8lV9MldO9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pe0tZDZ9HpTSaSWYPslmezr5rJkdmANyDW5cK8qWRMpSBoJz6YTJ7tmS4rAmRZvLd
         j6g8Ne5APyTRlaviyNw5EtoMvam3T9sosOErFLhbVncpMub43A11wxHJRR8sond29C
         RWhlpbW80zGhPhlXEJRiouHXKa0AicosLvH/1g+8=
Date:   Mon, 18 Jan 2021 13:42:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>
Subject: Re: [PATCH 1/6] USB: serial: cp210x: add support for software flow
 control
Message-ID: <YAWCU9D+FTHgW5wj@kroah.com>
References: <20210118111331.5048-1-johan@kernel.org>
 <20210118111331.5048-2-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118111331.5048-2-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 18, 2021 at 12:13:26PM +0100, Johan Hovold wrote:
> From: Wang Sheng Long <shenglong.wang.ext@siemens.com>
> 
> When data is transmitted between two serial ports, the phenomenon of
> data loss often occurs. The two kinds of flow control commonly used in
> serial communication are hardware flow control and software flow
> control.
> 
> In serial communication, If you only use RX/TX/GND Pins, you can't do
> hardware flow. So we often used software flow control and prevent data
> loss. The user sets the software flow control through the application
> program, and the application program sets the software flow control mode
> for the serial port chip through the driver.
> 
> For the cp210 serial port chip, its driver lacks the software flow
> control setting code, so the user cannot set the software flow control
> function through the application program. This adds the missing software
> flow control.
> 
> Signed-off-by: Wang Sheng Long <shenglong.wang.ext@siemens.com>
> Link: https://lore.kernel.org/r/20210104094502.3942-1-china_shenglong@163.com
> [ johan: rework properly on top of recent termios changes ]
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/cp210x.c | 67 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index fbb10dfc56e3..5bd14770065b 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -377,6 +377,16 @@ static struct usb_serial_driver * const serial_drivers[] = {
>  #define CONTROL_WRITE_DTR	0x0100
>  #define CONTROL_WRITE_RTS	0x0200
>  
> +/* CP210X_(GET|SET)_CHARS */
> +struct cp210x_special_chars {
> +	u8	bEofChar;
> +	u8	bErrorChar;
> +	u8	bBreakChar;
> +	u8	bEventChar;
> +	u8	bXonChar;
> +	u8	bXoffChar;
> +};
> +
>  /* CP210X_VENDOR_SPECIFIC values */
>  #define CP210X_READ_2NCONFIG	0x000E
>  #define CP210X_READ_LATCH	0x00C2
> @@ -1074,11 +1084,38 @@ static void cp210x_disable_event_mode(struct usb_serial_port *port)
>  	port_priv->event_mode = false;
>  }
>  
> +static int cp210x_set_chars(struct usb_serial_port *port,
> +		struct cp210x_special_chars *chars)
> +{
> +	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	void *dmabuf;
> +	int result;
> +
> +	dmabuf = kmemdup(chars, sizeof(*chars), GFP_KERNEL);
> +	if (!dmabuf)
> +		return -ENOMEM;
> +
> +	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
> +				CP210X_SET_CHARS, REQTYPE_HOST_TO_INTERFACE, 0,
> +				port_priv->bInterfaceNumber,
> +				dmabuf, sizeof(*chars), USB_CTRL_SET_TIMEOUT);
> +
> +	kfree(dmabuf);
> +
> +	if (result < 0) {
> +		dev_err(&port->dev, "failed to set special chars: %d\n", result);
> +		return result;
> +	}

This is an "open coded" usb_control_msg_send() call :)

Other than that minor thing:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

