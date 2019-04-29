Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3863DFCA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 11:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727616AbfD2Jva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 05:51:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:57134 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727514AbfD2Jv3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 05:51:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 17967ADE6;
        Mon, 29 Apr 2019 09:51:10 +0000 (UTC)
Message-ID: <1556531458.20085.8.camel@suse.com>
Subject: Re: [PATCH 1/5] USB: serial: fix unthrottle races
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 29 Apr 2019 11:50:58 +0200
In-Reply-To: <20190425160540.10036-2-johan@kernel.org>
References: <20190425160540.10036-1-johan@kernel.org>
         <20190425160540.10036-2-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Do, 2019-04-25 at 18:05 +0200, Johan Hovold wrote:
> @@ -484,6 +503,12 @@ void usb_serial_generic_unthrottle(struct tty_struct *tty)
>         port->throttled = port->throttle_req = 0;
>         spin_unlock_irq(&port->lock);
>  
> +       /*
> +        * Matches the smp_mb__after_atomic() in
> +        * usb_serial_generic_read_bulk_callback().
> +        */
> +       smp_mb();
> +
>         if (was_throttled)
>                 usb_serial_generic_submit_read_urbs(port, GFP_KERNEL);


Doesn't the spin_unlock_irq() imply smp_mb()?
Otherwise it looks correct to me.

	Regards
		Oliver

