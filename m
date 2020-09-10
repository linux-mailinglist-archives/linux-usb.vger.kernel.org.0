Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E080A2640F3
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbgIJJJj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:09:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:37676 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729161AbgIJJJX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:09:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3F27FB1E6;
        Thu, 10 Sep 2020 09:09:37 +0000 (UTC)
Message-ID: <1599728957.10822.9.camel@suse.com>
Subject: Re: [RFC 0/5] fix races in CDC-WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Thu, 10 Sep 2020 11:09:17 +0200
In-Reply-To: <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
References: <20200812132034.14363-1-oneukum@suse.com>
         <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 12.08.2020, 23:29 +0900 schrieb Tetsuo Handa:
> On 2020/08/12 22:20, Oliver Neukum wrote:
> > CDC-WDM was not written with multithreaded users or
> > uncooperative devices in mind.
> > This leads to race conditions and hangs in flush(). 


Hi,

thank you for waiting. Family emergency.

> In patch "[RFC 2/5] CDC-WDM: introduce a timeout in flush()", since multiple users can
> share "desc", wouldn't someone's usb_submit_urb() from wdm_write() gets unexpectedly
> interfered by someone else's usb_kill_urb(desc->command) from wdm_open() ?

Yes. Fixed.

> In patch "[RFC 2/5] CDC-WDM: introduce a timeout in flush()", don't we need to similarly
> apply timeout to wait_event_interruptible() in wdm_write(), for the same problem will
> happen if hardware remained silent forever?

Technically a device may take forever. Interrupting a wait in write()
is not problematic.

> In patch "[RFC 3/5] CDC-WDM: making flush() interruptible", it is legal to return -EINTR
>  from close(). But I think that returning -EINTR from close() is not recommended because
> it can confuse multithreaded application (retrying close() upon -EINTR is not safe).

Well, but what is the alternative? Should we ignore signals?

> In patch "[RFC 5/5] CDC-WDM: remove use of intf->dev after potential disconnect",
> 
>         /* cannot dereference desc->intf if WDM_DISCONNECTING */
>         if (test_bit(WDM_DISCONNECTING, &desc->flags))
>                 return -ENODEV;
> 
> can be also removed, for this check is meant for not to dereference desc->intf
> after disconnect ?

It can be removed, but that would make error reporting worse.

> Guessing from symmetry, do we need to check WDM_DISCONNECTING or WDM_RESETTING
> in wait_event_interruptible_timeout() from wdm_flush() when wait_event_interruptible()
> in wdm_write() is not checking WDM_DISCONNECTING nor WDM_RESETTING ?

Added

> Does it make sense to wait for response of someone else's usb_submit_urb() when
> someone is calling close(), for there is no guarantee that failure notice received
> via wdm_flush() via some file descriptor corresponds to usb_submit_urb() request from
> wdm_write() call from that file descriptor?

Well, user space may do multithreading. Whether it makes sense is
another question. We just need to return results confirming to the
standards. You noticed bugs. I think the next version will fix them.

What else would we do?

	Regards
		Oliver


