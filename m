Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4FF26A1D9
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 11:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgIOJOo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 05:14:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:33188 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgIOJOn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 05:14:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5D98AACB7;
        Tue, 15 Sep 2020 09:14:57 +0000 (UTC)
Message-ID: <1600161279.2424.5.camel@suse.com>
Subject: Re: [RFC 0/5] fix races in CDC-WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Tue, 15 Sep 2020 11:14:39 +0200
In-Reply-To: <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
References: <20200812132034.14363-1-oneukum@suse.com>
         <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
         <1599728957.10822.9.camel@suse.com>
         <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 10.09.2020, 19:01 +0900 schrieb Tetsuo Handa:
> On 2020/09/10 18:09, Oliver Neukum wrote:
> > > Does it make sense to wait for response of someone else's usb_submit_urb() when
> > > someone is calling close(), for there is no guarantee that failure notice received
> > > via wdm_flush() via some file descriptor corresponds to usb_submit_urb() request from
> > > wdm_write() call from that file descriptor?
> > 
> > Well, user space may do multithreading. Whether it makes sense is
> > another question. We just need to return results confirming to the
> > standards. You noticed bugs. I think the next version will fix them.
> 
> My question is how do you handle if App1 and App2 (not multithreading but
> multiprocessing) shares the "desc" ? Unless

Well, device locking is a function of user space. This is Unix. If you
have two uncoordinated writers to a device, you cannot expect sensible
results. You can expect that the driver does not hang, of course.

> > > In patch "[RFC 3/5] CDC-WDM: making flush() interruptible", it is legal to return -EINTR
> > >  from close(). But I think that returning -EINTR from close() is not recommended because
> > > it can confuse multithreaded application (retrying close() upon -EINTR is not safe).
> > 
> > Well, but what is the alternative? Should we ignore signals?
> > 
> 
> we return the error from write() request (i.e. give up trying to report errors from
> close() event), we can't pass results to the intended recipients.

That means

* harming the single threaded for the sake of the few multithreaded
* it would not work for O_NONBLOCK
* if you use a device from multiple threads or tasks, locking is your
problem

Is there something we can do in flush()?

	Regards
		Oliver

