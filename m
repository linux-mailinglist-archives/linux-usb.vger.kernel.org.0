Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47789E043
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 12:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfD2KJi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 06:09:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:60222 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727428AbfD2KJi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 06:09:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C8794AC50;
        Mon, 29 Apr 2019 10:09:36 +0000 (UTC)
Message-ID: <1556532564.20085.10.camel@suse.com>
Subject: Re: [PATCH 4/5] USB: cdc-acm: fix unthrottle races
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 29 Apr 2019 12:09:24 +0200
In-Reply-To: <20190425160540.10036-5-johan@kernel.org>
References: <20190425160540.10036-1-johan@kernel.org>
         <20190425160540.10036-5-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Do, 2019-04-25 at 18:05 +0200, Johan Hovold wrote:
> Fix two long-standing bugs which could potentially lead to memory
> corruption or leave the port throttled until it is reopened (on weakly
> ordered systems), respectively, when read-URB completion races with
> unthrottle().
> 
> First, the URB must not be marked as free before processing is complete
> to prevent it from being submitted by unthrottle() on another CPU.
> 
>         CPU 1                           CPU 2
>         ================                ================
>         complete()                      unthrottle()
>           process_urb();
>           smp_mb__before_atomic();
>           set_bit(i, free);               if (test_and_clear_bit(i, free))
>                                                   submit_urb();
> 
> Second, the URB must be marked as free before checking the throttled
> flag to prevent unthrottle() on another CPU from failing to observe that
> the URB needs to be submitted if complete() sees that the throttled flag
> is set.
> 
>         CPU 1                           CPU 2
>         ================                ================
>         complete()                      unthrottle()
>           set_bit(i, free);               throttled = 0;
>           smp_mb__after_atomic();         smp_mb();
>           if (throttled)                  if (test_and_clear_bit(i, free))
>                   return;                         submit_urb();
> 
> Note that test_and_clear_bit() only implies barriers when the test is
> successful. To handle the case where the URB is still in use an explicit
> barrier needs to be added to unthrottle() for the second race condition.
> 
> Also note that the first race was fixed by 36e59e0d70d6 ("cdc-acm: fix
> race between callback and unthrottle") back in 2015, but the bug was
> reintroduced a year later.
> 
> Fixes: 1aba579f3cf5 ("cdc-acm: handle read pipe errors")
> Fixes: 088c64f81284 ("USB: cdc-acm: re-write read processing")
> Signed-off-by: Johan Hovold <johan@kernel.org>
Acked-by: Oliver Neukum <oneukum@suse.com>
