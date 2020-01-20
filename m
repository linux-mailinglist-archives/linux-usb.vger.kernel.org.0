Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 436F2142790
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 10:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgATJp4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 04:45:56 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:38785 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgATJp4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 04:45:56 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 481Rcf1pLhzGL;
        Mon, 20 Jan 2020 10:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1579513554; bh=XY40UEV8GcMUmd/gE9EtHctgSmyhaOMMvscY4KspYKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qYsLYA78hKXkXaFYjYVOLQvraZowVVzL4fKPkxP9SL7zhyr33O8hlQiaKLJ5qiXPd
         3AcpGsrVXtopU5tMNySffQ2NvCPMx45+H/Hjay0tzSIqmQdHHImIQnaM3fNsOpOblI
         COeML6FExq5W6X0m46Ey2/N8CDu9ULUoPTIwzlOYpSkJyz8aX2X3hkKsedovZWEWej
         yaQpocdgNDEp+QmNVZbebwDOV+LtHNU3v9Xfd/CP+weUJ50bHIVtvT2snx6kt/rbUP
         QoXYNPA8pUJF+4kKl0FPklm1YamJGIKBGX2bIlircJDXjKFJ0qlwKtlwNf2psJ5wcu
         hW4IYuPKDIZqw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Mon, 20 Jan 2020 10:45:51 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Sergey Organov <sorganov@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: serial: fix Tx stall after buffer overflow
Message-ID: <20200120094551.GA14000@qmqm.qmqm.pl>
References: <87pnfi8xc2.fsf@osv.gnss.ru>
 <20200117203414.GA11783@qmqm.qmqm.pl>
 <87sgkak6g5.fsf@osv.gnss.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sgkak6g5.fsf@osv.gnss.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 20, 2020 at 09:06:18AM +0300, Sergey Organov wrote:
> Micha� Miros�aw <mirq-linux@rere.qmqm.pl> writes:
> 
> > On Fri, Jan 17, 2020 at 08:29:33AM +0300, Sergey Organov wrote:
> >> --- a/drivers/usb/gadget/function/u_serial.c
> >> +++ b/drivers/usb/gadget/function/u_serial.c
> >> @@ -563,6 +563,8 @@ static int gs_start_io(struct gs_port *port)
> >>  
> >>         /* unblock any pending writes into our circular buffer */
> >>         if (started) {
> >> +               pr_debug("gs_start_tx: ttyGS%d\n", port->port_num);
> >> +               gs_start_tx(port);
> >>                 tty_wakeup(port->port.tty);
> >
> > The tty_wakeup() will be called from gs_start_tx(), so should be removed
> > from here.
> 
> Not exactly. tty_wakeup() will be called from gs_start_tx() only when
> there has been something actually transferred from the buffer. I didn't
> want to change behavior when the buffer is empty, so I kept the explicit
> tty_wakeup() call in place, intentionally. Please let me know if you
> still think it should be removed.

Indeed it is as you describe. You might add an argument that initializes
do_tty_wake, but I'm not sure saving one tty_wakeup() on open is worth
the trouble.

> > The pr_debug() in other callers of gs_start_tx() say:
> > "caller: start ttyGS%d".
> 
> ???
> 
> $ git co gregkh/tty-next && grep -r 'caller: start tty' .
> HEAD is now at 7788f54... serial_core: Remove unused member in uart_port
> $ 

Replace 'caller' with a function calling gs_start_io().

Best Regards,
Micha� Miros�aw
