Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC0B141257
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 21:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729714AbgAQUeT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 15:34:19 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:22392 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727519AbgAQUeT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jan 2020 15:34:19 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47zt880ttBz2d;
        Fri, 17 Jan 2020 21:34:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1579293257; bh=ILDe4z5LcJ6n//mzN7ERVEkxUtx3fbu1ra9gRDTa9Bg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ojxkGV3WZYcrzZ1+np+UUVZcCkm0a1CrGwLN7xCq57We71afuEqptu4nMv6/fcaZv
         ju5pwl6dtATPDCOK4yCbBQVy2knZpdfxoDLZhaNEiuqB+RAQl5TSSknkRXctm5juO3
         vRtSnydyLIrx+xQziJntUmU1C9upEs9ff7BfNTi1mI05AUH1ZKYBANUzZxBPc6Nrg5
         4fOG0GPSLA5cjWWX+sFuj5B6A896Th6/PK3/zxExbjUCCaN5iPEY+c+0Mwz7dVPGTt
         I4uJk0IUCJk+A8PexhGOj3b8fLcGl9f7JNq3LnLvSh6mdedm6Sq2inMDuvcXQQOEOm
         IXTloBFoTE+Xg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Fri, 17 Jan 2020 21:34:14 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Sergey Organov <sorganov@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: serial: fix Tx stall after buffer overflow
Message-ID: <20200117203414.GA11783@qmqm.qmqm.pl>
References: <87pnfi8xc2.fsf@osv.gnss.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pnfi8xc2.fsf@osv.gnss.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 17, 2020 at 08:29:33AM +0300, Sergey Organov wrote:
[...]
> NOTE: current version of the driver leaks data from one connection to
> another through its internal circular buffer. It might be a good idea
> to clear the buffer on open/close/connect/disconnect, in which case
> the problem this patch solves would have been fixed in a different
> manner. However, not only that's a more dramatic change, but to do it
> right TTY-layer buffers are to be considered as well.

This is normal for serial devices, as they don't have any means to
signal connection and will usually transmit anyway when not connected.
In case of a console on the USB gadget-emulated serial port, it might
actually be convenient that the data is kept until connection.

> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -563,6 +563,8 @@ static int gs_start_io(struct gs_port *port)
>  
>         /* unblock any pending writes into our circular buffer */
>         if (started) {
> +               pr_debug("gs_start_tx: ttyGS%d\n", port->port_num);
> +               gs_start_tx(port);
>                 tty_wakeup(port->port.tty);

The tty_wakeup() will be called from gs_start_tx(), so should be removed
from here.

The pr_debug() in other callers of gs_start_tx() say:
"caller: start ttyGS%d".

Best Regards,
Micha� Miros�aw
