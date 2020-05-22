Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4631DE17C
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 10:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgEVIEv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 04:04:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:50750 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbgEVIEu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 May 2020 04:04:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D0123BCAA;
        Fri, 22 May 2020 08:04:50 +0000 (UTC)
Message-ID: <1590134662.19681.12.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg KH <greg@kroah.com>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
In-Reply-To: <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
         <20200521073323.GA2579717@kroah.com>
         <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
         <1590090636.6470.12.camel@suse.com>
         <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Date:   Fri, 22 May 2020 10:04:22 +0200
Mime-Version: 1.0
X-Mailer: Evolution 3.26.6 
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 22.05.2020, 07:48 +0900 schrieb Tetsuo Handa:


Hi,

I looked at your patch again and I am impressed and I need to
apologize. I looked at only the intended use, but overlooked
the unintended use.

I think we need to work on the description of the patch though.

> On 2020/05/22 4:50, Oliver Neukum wrote:
> > interesting. Do you have a test case for these patches working?
> 
> No.

Yes, going through the logs it looks that you need to trigger
an error case for this race to strike.

> > > 	wait_event(desc->wait,
> > > 			/*
> > > 			 * needs both flags. We cannot do with one
> > > 			 * because resetting it would cause a race
> > > 			 * with write() yet we need to signal
> > > 			 * a disconnect
> > > 			 */
> > > 			!test_bit(WDM_IN_USE, &desc->flags) ||
> > > 			test_bit(WDM_DISCONNECTING, &desc->flags));
> > > 
> > > but wdm_write() is not calling wake_up(&desc->wait) after
> > > clear_bit(WDM_IN_USE, &desc->flags) when usb_submit_urb() failed.
> > 
> > Yes, because desc->wlock is held. There can be nobody sleeping here.
> 
> Then, this patch is not needed. (But adding some comment is welcomed.)

OK and here I screwed up. wlock is held in wdm_write(), but not in
wdm_flush()

So may I suggest the following log:

--

WDM_IN_USE is used in wdm_write() to protect against concurrent writes
and in wdm_flush() to wait for all messages to flush, so that errors
are not lost. The former use is guarded by a mutex, the later, as
it does no IO, is not.
In the error case of wdm_write(), however, there is a race, which
can make wdm_flush() wait for IO that was supposed to be started
but was never started due to an error condition.
Hence if an error is detected in wdm_write() after WDM_IN_USE was
toggeled, all potential waiters must be woken. As multiple tasks
can be in wdm_flush, wake_up_all() must be used in all cases
WDM_IN_USE is reset.

--

May I ask you to redo the patch with comments added stating
that the wake up is done for the sake of wdm_flush(), change
the description and add the link to syzkaller?

> > > > And is this a bugfix?  For what?  Does it need to go to stable kernels?

Yes, it is. The bug is ancient. It goes back to afba937e540c9,
which introduced the driver.


Again, thank you for this impressive piece of debugging.

	Regards
		Oliver


