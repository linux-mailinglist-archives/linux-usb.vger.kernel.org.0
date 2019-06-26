Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDC4567D7
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 13:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfFZLlo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 07:41:44 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35542 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfFZLlo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jun 2019 07:41:44 -0400
Received: by mail-lf1-f68.google.com with SMTP id a25so1356987lfg.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2019 04:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4HE6ziFQJhIceyHT13zKToUqAcftLDKJ+TU0RtxjOo0=;
        b=m3E5Hn1/CGpT8DB+rwl8ytp70VlIYpudH1QiPUlvu4GA+oilYZHva6l+adX4QD8P4E
         bPTwDhxBBQXUivVg24UP+IwpvRluNf38cIsWFm2BXj6aeu9NyDE/VLBIwFEFFJH2Vofh
         EC1/uRrLUuxZErQqflfleWQokXsz3xIuO+rUbLNqab3wRLciDxKxuuMUcs4eWj0aiwCb
         tnDqpMkI2qTmUgfsH+HZTS4Acat+RRexQ1twhwCyyNsrNw6WWF7aWg+vvMAsAtGQXtF5
         jbmUkNNkSqjMVeKN6V8b0LrnMC2UZuShnS1CUe4SpLz+YJ3Ohr3EXcpjt2S+EbfBSCR4
         FNdA==
X-Gm-Message-State: APjAAAXux8DTL0N/CV6Ul87OO81qY920ouSan2Tv1Yl6Yz4NG6N6ss7r
        RFmhPq5Y761gTYwpX3f54SNFfbd/
X-Google-Smtp-Source: APXvYqz5k5BVxKbP3RezwAnOQbI0y3WAWiTgwRfA5Qi04tBN7Y4haD2AVSL+qEn1ZGjqX4Wl6xV8wg==
X-Received: by 2002:a19:6e4d:: with SMTP id q13mr2469893lfk.6.1561549302092;
        Wed, 26 Jun 2019 04:41:42 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id r70sm990977ljr.26.2019.06.26.04.41.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 04:41:41 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hg6J1-0000aj-6r; Wed, 26 Jun 2019 13:41:39 +0200
Date:   Wed, 26 Jun 2019 13:41:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] gpss: core: no waiters left behind on deregister
Message-ID: <20190626114139.GC508@localhost>
References: <20190624083323.11876-1-oneukum@suse.com>
 <20190625070436.GC14867@localhost>
 <1561547047.23604.15.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561547047.23604.15.camel@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 26, 2019 at 01:04:07PM +0200, Oliver Neukum wrote:
> Am Dienstag, den 25.06.2019, 09:04 +0200 schrieb Johan Hovold:
> > On Mon, Jun 24, 2019 at 10:33:23AM +0200, Oliver Neukum wrote:
> > > If you deregister a device you need to wake up all waiters
> > > as there will be no further wakeups.
> > > 
> > > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > > ---
> > >  drivers/gnss/core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
> > > index e6f94501cb28..0d13bd2cefd5 100644
> > > --- a/drivers/gnss/core.c
> > > +++ b/drivers/gnss/core.c
> > > @@ -303,7 +303,7 @@ void gnss_deregister_device(struct gnss_device *gdev)
> > >  	down_write(&gdev->rwsem);
> > >  	gdev->disconnected = true;
> > >  	if (gdev->count) {
> > > -		wake_up_interruptible(&gdev->read_queue);
> > > +		wake_up_interruptible_all(&gdev->read_queue);
> > 
> > GNSS core doesn't have any exclusive waiters, so no need to use use the
> > exclusive wake-up (all) interface.
> 
> Well, yes, but that is the problem. In gnss_read() you drop the lock:

> That means that an arbitrary number of tasks can get here.
> 
>                 ret = wait_event_interruptible(gdev->read_queue,
>                                 gdev->disconnected ||
>                                 !kfifo_is_empty(&gdev->read_fifo));
> 
> Meaning that an arbitrary number can be sleeping here.

I understand wait you're getting at, but I think your mistaken regarding
exclusive wait. Note that wait_event_interruptible() uses nonexclusive
wait.

> Yet in gnss_deregister_device() you use a simple wake_up:
> 
> void gnss_deregister_device(struct gnss_device *gdev)
> 
> {
> 
>         down_write(&gdev->rwsem);
>         gdev->disconnected = true;
>         if (gdev->count) {
>                 wake_up_interruptible(&gdev->read_queue);
> 
> 
> wake_up_interruptible() will wake up one waiting task. But after that
> the device is gone. There will be no further events. The other tasks
> will sleep forever.

No, wake_up_interruptible() will wake up all nonexclusive waiters,
which is all we care about here.

Johan
