Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA491E3BEE
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 10:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbgE0I2v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 04:28:51 -0400
Received: from smtp2.math.uni-bielefeld.de ([129.70.45.13]:53600 "EHLO
        smtp2.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729349AbgE0I2u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 04:28:50 -0400
Received: from math.uni-bielefeld.de (kvm01.math.uni-bielefeld.de [129.70.45.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 2DF9F6029A;
        Wed, 27 May 2020 10:28:49 +0200 (CEST)
Date:   Wed, 27 May 2020 10:28:47 +0200
From:   Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Kernel Oops in cdc_acm
Message-ID: <20200527082847.GA8044@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
 <1590409690.2838.7.camel@suse.com>
 <20200525191624.GA28647@math.uni-bielefeld.de>
 <1590491586.2838.38.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590491586.2838.38.camel@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum wrote on Tue 26/05/20 13:13:
> 
> Hi,
> 
> may I ask whether you did the test with removing the battery twice with
> an older kernel? Could you please go back to
> f6cc6093a729ede1ff5658b493237c42b82ba107
> and repeat the test of a second battery removal with that state?
> I just cannot find anything pointing to a change that could cause
> this issue within that time.


Hi,

I tested again with 5.7-rc6 and the following applied to drivers/usb/class/cdc-acm.c :

--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -579,8 +579,8 @@ static void acm_softint(struct work_struct *work)
                                usb_kill_urb(acm->read_urbs[i]);
                        usb_clear_halt(acm->dev, acm->in);
                        acm_submit_read_urbs(acm, GFP_KERNEL);
-                       clear_bit(EVENT_RX_STALL, &acm->flags);
                }
+               clear_bit(EVENT_RX_STALL, &acm->flags);
        }

        if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {

This in addtion to your earlier patch :

> > > diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> > > index 7678ae4afd53..be4543569822 100644
> > > --- a/drivers/usb/class/cdc-acm.c
> > > +++ b/drivers/usb/class/cdc-acm.c
> > > @@ -585,7 +585,7 @@ static void acm_softint(struct work_struct *work)
> > >   }
> > >
> > >   if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
> > > -         for (i = 0; i < ACM_NR; i++)
> > > +         for (i = 0; i < acm->rx_buflimit; i++)
> > >                   if (test_and_clear_bit(i, &acm->urbs_in_error_delay))
> > >                                   acm_submit_read_urb(acm, i, GFP_NOIO);


And with these patches the behaviour seems to me like with
f6cc6093a729ede1ff5658b493237c42b82ba10. I'm not sure if this is correct
but to me it looked odd that before 0afccd7601514c4b83d8cc58c740089cc447051d the function

   clear_bit(EVENT_RX_STALL, &acm->flags);


was always called when the block of

   if (test_bit(EVENT_RX_STALL, &acm->flags)) {

was entered.

But since 0afccd7601514c4b83d8cc58c740089cc447051d
only when condition

   if (!acm->susp_count) {

was also fulfilled:

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 84d6f7df09a4..4ef68e6671aa 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -557,14 +557,14 @@ static void acm_softint(struct work_struct *work)
        struct acm *acm = container_of(work, struct acm, work);

        if (test_bit(EVENT_RX_STALL, &acm->flags)) {
-               if (!(usb_autopm_get_interface(acm->data))) {
+               smp_mb(); /* against acm_suspend() */
+               if (!acm->susp_count) {
                        for (i = 0; i < acm->rx_buflimit; i++)
                                usb_kill_urb(acm->read_urbs[i]);
                        usb_clear_halt(acm->dev, acm->in);
                        acm_submit_read_urbs(acm, GFP_KERNEL);
-                       usb_autopm_put_interface(acm->data);
+                       clear_bit(EVENT_RX_STALL, &acm->flags);
                }
-               clear_bit(EVENT_RX_STALL, &acm->flags);
        }

        if (test_and_clear_bit(EVENT_TTY_WAKEUP, &acm->flags))

Regards,
Jean Rene

