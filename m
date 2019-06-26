Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF1F256756
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 13:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfFZLEK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 07:04:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:36732 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725930AbfFZLEK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Jun 2019 07:04:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9CBE9AD78;
        Wed, 26 Jun 2019 11:04:09 +0000 (UTC)
Message-ID: <1561547047.23604.15.camel@suse.com>
Subject: Re: [PATCH] gpss: core: no waiters left behind on deregister
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 26 Jun 2019 13:04:07 +0200
In-Reply-To: <20190625070436.GC14867@localhost>
References: <20190624083323.11876-1-oneukum@suse.com>
         <20190625070436.GC14867@localhost>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 25.06.2019, 09:04 +0200 schrieb Johan Hovold:
> On Mon, Jun 24, 2019 at 10:33:23AM +0200, Oliver Neukum wrote:
> > If you deregister a device you need to wake up all waiters
> > as there will be no further wakeups.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > ---
> >  drivers/gnss/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
> > index e6f94501cb28..0d13bd2cefd5 100644
> > --- a/drivers/gnss/core.c
> > +++ b/drivers/gnss/core.c
> > @@ -303,7 +303,7 @@ void gnss_deregister_device(struct gnss_device *gdev)
> >  	down_write(&gdev->rwsem);
> >  	gdev->disconnected = true;
> >  	if (gdev->count) {
> > -		wake_up_interruptible(&gdev->read_queue);
> > +		wake_up_interruptible_all(&gdev->read_queue);
> 
> GNSS core doesn't have any exclusive waiters, so no need to use use the
> exclusive wake-up (all) interface.

Well, yes, but that is the problem. In gnss_read() you drop the lock:

        mutex_lock(&gdev->read_mutex);

        while (kfifo_is_empty(&gdev->read_fifo)) {
                mutex_unlock(&gdev->read_mutex);

                if (gdev->disconnected)
                        return 0;

                if (file->f_flags & O_NONBLOCK)
                        return -EAGAIN;

That means that an arbitrary number of tasks can get here.

                ret = wait_event_interruptible(gdev->read_queue,
                                gdev->disconnected ||
                                !kfifo_is_empty(&gdev->read_fifo));

Meaning that an arbitrary number can be sleeping here. Yet in
gnss_deregister_device() you use a simple wake_up:

void gnss_deregister_device(struct gnss_device *gdev)

{

        down_write(&gdev->rwsem);
        gdev->disconnected = true;
        if (gdev->count) {
                wake_up_interruptible(&gdev->read_queue);


wake_up_interruptible() will wake up one waiting task. But after that
the device is gone. There will be no further events. The other tasks
will sleep forever.

	Regards
		Oliver

		

