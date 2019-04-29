Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E093E00B
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 12:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfD2KDl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 06:03:41 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43228 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbfD2KDl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 06:03:41 -0400
Received: by mail-lf1-f67.google.com with SMTP id i68so7349247lfi.10
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 03:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PuNazoOHqlFL3cHEewE98dxi0W9UyYVBBah0gZS//q8=;
        b=mEezCxuJcq4dSfMrAnEDyUjkwY27FB6Lj3GLiktICdAfQOr5B6GwFwyeINrvCyJvdT
         LmsKAsUaN1PPOsNx4HCRxT56sPg6SwLv6s0YM3PlkoK0uIVvncVGvtr4bEu44SdquPII
         fb3A9hfHNQMIMQd5RrYpfTyJIq4JanIFQYMrq3qMcVxgW/xNwH7DJP/Nd/fZ6du1NJsg
         V4N5p6cY1WkmuwMaPsQmwyxVDnmIF6bIuBTxCjnK0+hWbgZ1x9nNpLuYmIp8bJ8jtkjT
         0SAA7zfI332od4mTUtcRwHfiSafFIl0hCAuH7qG5b5Kh++p7sW+ohewyCltZJ1tMI7xz
         zzJw==
X-Gm-Message-State: APjAAAWmxElPAxWfvtz2ztqcUc098pvnTd62SqW40HzRln1WcPsWX+pa
        BKuh+9Iwmju7tuDjydDZ/Dhl2fqo
X-Google-Smtp-Source: APXvYqxCIcyN5o5tUJb15WU8sb7m0R3iS5VzUA2oDhEm8NiywWk8rBigpDIMYx4Z63daKmiqDOPxfA==
X-Received: by 2002:ac2:5487:: with SMTP id t7mr7275592lfk.41.1556532219489;
        Mon, 29 Apr 2019 03:03:39 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id j13sm3481049lfb.34.2019.04.29.03.03.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 03:03:38 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hL38M-0003E7-PF; Mon, 29 Apr 2019 12:03:38 +0200
Date:   Mon, 29 Apr 2019 12:03:38 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] USB: serial: fix unthrottle races
Message-ID: <20190429100338.GJ26546@localhost>
References: <20190425160540.10036-1-johan@kernel.org>
 <20190425160540.10036-2-johan@kernel.org>
 <1556531458.20085.8.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556531458.20085.8.camel@suse.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 29, 2019 at 11:50:58AM +0200, Oliver Neukum wrote:
> On Do, 2019-04-25 at 18:05 +0200, Johan Hovold wrote:
> > @@ -484,6 +503,12 @@ void usb_serial_generic_unthrottle(struct tty_struct *tty)
> >         port->throttled = port->throttle_req = 0;
> >         spin_unlock_irq(&port->lock);
> >  
> > +       /*
> > +        * Matches the smp_mb__after_atomic() in
> > +        * usb_serial_generic_read_bulk_callback().
> > +        */
> > +       smp_mb();
> > +
> >         if (was_throttled)
> >                 usb_serial_generic_submit_read_urbs(port, GFP_KERNEL);
> 
> 
> Doesn't the spin_unlock_irq() imply smp_mb()?
> Otherwise it looks correct to me.

No, spin_unlock_irq() is only a one-way barrier, and doesn't prevent
later accesses from "moving" into the locked section.

Johan
