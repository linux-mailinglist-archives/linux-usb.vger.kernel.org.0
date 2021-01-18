Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A302FA21F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 14:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392315AbhARNev (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 08:34:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:36088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730796AbhARNe2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 08:34:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50B7A21D93;
        Mon, 18 Jan 2021 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610976828;
        bh=jHHQV6dbIJ9v2eZ4J7iBy1Y2Qc19JplunFt64jt8TXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=njE8n+ES6+OGG2qSlslHJvl5yETrXlrnbPg/ceTCr5U2ySyavV2TL/NvNeK622CFL
         8o2R9rq9XiPc54eIz0wguFaI+ezrZ8v+jwc4WuRutKA6MUOZgSBc5vXYJWev4OP7my
         e5GkImV9VusKo3EOTtscglKIcnLuaXfhWfk8me5BdokUtFkkEYlI6ZQFMleqXqMRuF
         qkiKP7KKuSrVmMN5rswnY3OfLgLR8ArSiGo8MjokeC289QQbsedh27cwX1U+155RZn
         cAuzYr2oUChHSftEX1rLhJVx/AVnWOd+jJEvenT/FjmKs8OMGoUR8X3q4wREi0Z6nM
         tfrq/j6/k7IiQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1UfK-0004ZC-8f; Mon, 18 Jan 2021 14:33:55 +0100
Date:   Mon, 18 Jan 2021 14:33:54 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>
Subject: Re: [PATCH 1/6] USB: serial: cp210x: add support for software flow
 control
Message-ID: <YAWOQpoN9oDfvFo9@hovoldconsulting.com>
References: <20210118111331.5048-1-johan@kernel.org>
 <20210118111331.5048-2-johan@kernel.org>
 <YAWCU9D+FTHgW5wj@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAWCU9D+FTHgW5wj@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 18, 2021 at 01:42:59PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 18, 2021 at 12:13:26PM +0100, Johan Hovold wrote:
> > From: Wang Sheng Long <shenglong.wang.ext@siemens.com>

> > +static int cp210x_set_chars(struct usb_serial_port *port,
> > +		struct cp210x_special_chars *chars)
> > +{
> > +	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
> > +	struct usb_serial *serial = port->serial;
> > +	void *dmabuf;
> > +	int result;
> > +
> > +	dmabuf = kmemdup(chars, sizeof(*chars), GFP_KERNEL);
> > +	if (!dmabuf)
> > +		return -ENOMEM;
> > +
> > +	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
> > +				CP210X_SET_CHARS, REQTYPE_HOST_TO_INTERFACE, 0,
> > +				port_priv->bInterfaceNumber,
> > +				dmabuf, sizeof(*chars), USB_CTRL_SET_TIMEOUT);
> > +
> > +	kfree(dmabuf);
> > +
> > +	if (result < 0) {
> > +		dev_err(&port->dev, "failed to set special chars: %d\n", result);
> > +		return result;
> > +	}
> 
> This is an "open coded" usb_control_msg_send() call :)

Right, but there are a few more functions like this one in this driver
so I kept it for consistency for now.

> Other than that minor thing:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing all of these. Now applied.

Johan
