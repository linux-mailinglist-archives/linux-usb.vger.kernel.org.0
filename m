Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBC1F142CC8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 15:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgATOFp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 09:05:45 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:42159 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgATOFp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 09:05:45 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 481YNQ6J6jz5Y;
        Mon, 20 Jan 2020 15:05:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1579529143; bh=UttGkM4lKy1cVnEi2fPzcIVdzsgtM5DrsP9uvDo15bc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UZSSKUO8b7miiXYU78hVZh2ji14WEqBZ0b9wSwuzO/vxH+nowzZtdNjkitbvRXtDW
         EId2WvdFy1NozUMIF9ZRrEZqVJz7Zw31Mdt2NzOQhIdSAfUwJhIB2TGbaAghvxYG71
         tDLARonvWj0k2YMGPQndpXpB6Gg5gjY0SuSDl0+YrFVBOiOtTZGz8w8dhFrv1zrhXp
         C3o8I9ef0dPCchuSsLEttKpBFl23V6xBu0jzjvwJIyK82ZZnzBwQoZA0YAvu97lEZY
         5Sk7ItWmgUAj725Xu40KL5Z4VmWrExaSbbfTLUSpvirh9yAF5V/355Zxthc8ix5SLm
         CGsb5ehJDyD+w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Mon, 20 Jan 2020 15:05:40 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Sergey Organov <sorganov@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: serial: fix Tx stall after buffer overflow
Message-ID: <20200120140540.GA31291@qmqm.qmqm.pl>
References: <87pnfi8xc2.fsf@osv.gnss.ru>
 <20200117203414.GA11783@qmqm.qmqm.pl>
 <87sgkak6g5.fsf@osv.gnss.ru>
 <20200120094551.GA14000@qmqm.qmqm.pl>
 <87ftgagsdz.fsf@osv.gnss.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ftgagsdz.fsf@osv.gnss.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 20, 2020 at 04:38:16PM +0300, Sergey Organov wrote:
> Micha� Miros�aw <mirq-linux@rere.qmqm.pl> writes:
> 
> > On Mon, Jan 20, 2020 at 09:06:18AM +0300, Sergey Organov wrote:
> >> Micha� Miros�aw <mirq-linux@rere.qmqm.pl> writes:
> >> > The pr_debug() in other callers of gs_start_tx() say:
> >> > "caller: start ttyGS%d".
> >> 
> >> ???
> >> 
> >> $ git co gregkh/tty-next && grep -r 'caller: start tty' .
> >> HEAD is now at 7788f54... serial_core: Remove unused member in uart_port
> >> $ 
> >
> > Replace 'caller' with a function calling gs_start_io().
> 
> Thanks, now I see... Do you prefer:
> 
>    pr_debug("gs_start_io: start Tx on ttyGS%d\n", port->port_num);
> 
> then?
> 
> Alternatively, I'm OK with removing this new debug print.

Let's remove it. I was convinced that this is a caller of gs_start_io()
and not the function itself.  In this case callers already do the print.

BTW, the callers silently ignore (error) returns from this function. It
might be useful to add pr_err() catching the errors.

Best Regards,
Micha� Miros�aw
