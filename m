Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065FB1E20B8
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 13:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388767AbgEZLNK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 07:13:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:56454 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388683AbgEZLNK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 07:13:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A1DB8ACC3;
        Tue, 26 May 2020 11:13:11 +0000 (UTC)
Message-ID: <1590491586.2838.38.camel@suse.com>
Subject: Re: Kernel Oops in cdc_acm
From:   Oliver Neukum <oneukum@suse.com>
To:     Jean Rene Dawin <jdawin@math.uni-bielefeld.de>,
        linux-usb@vger.kernel.org
Date:   Tue, 26 May 2020 13:13:06 +0200
In-Reply-To: <20200525191624.GA28647@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
         <1590409690.2838.7.camel@suse.com>
         <20200525191624.GA28647@math.uni-bielefeld.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 25.05.2020, 21:16 +0200 schrieb Jean Rene Dawin:
> Oliver Neukum wrote on Mon 25/05/20 14:28:
> > 
> > Hi,
> > 
> > it looks to me like I made a mistake in fixing the error handling for
> > some devices. Could you test the attached patch?
> > 
> > 	Regards
> > 		Oliver
> > From 338fe738603d2612a317c9bec98236eb094ae109 Mon Sep 17 00:00:00 2001
> > From: Oliver Neukum <oneukum@suse.com>
> > Date: Mon, 25 May 2020 14:21:44 +0200
> > Subject: [PATCH] CDC-ACM: heed quirk also in error handling
> > 
> > If buffers are iterated over in the error case, the lower limits
> > for quirky devices must be heeded.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > ---
> >  drivers/usb/class/cdc-acm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> > index 7678ae4afd53..be4543569822 100644
> > --- a/drivers/usb/class/cdc-acm.c
> > +++ b/drivers/usb/class/cdc-acm.c
> > @@ -585,7 +585,7 @@ static void acm_softint(struct work_struct *work)
> >  	}
> >  
> >  	if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
> > -		for (i = 0; i < ACM_NR; i++) 
> > +		for (i = 0; i < acm->rx_buflimit; i++) 
> >  			if (test_and_clear_bit(i, &acm->urbs_in_error_delay))
> >  					acm_submit_read_urb(acm, i, GFP_NOIO);
> >  	}
> > -- 
> > 2.16.4
> > 
> 
> Hi,
> 
> thanks for the quick reply and the patch.
> 
> With the patch it is a different behaviour:
> 
> The first time the battery is removed and inserted again, everything is
> quite fine. Except that the USB cable has to be plugged out and in for the
> connection to be re-established. But that was needed in previous
> kernels, too.
> 
> But if the battery is removed a second time, and inserted again and the
> phone is turned on, it results in the traces below:

Hi,

may I ask whether you did the test with removing the battery twice with
an older kernel? Could you please go back to
f6cc6093a729ede1ff5658b493237c42b82ba107
and repeat the test of a second battery removal with that state?
I just cannot find anything pointing to a change that could cause
this issue within that time.

	Regards
		Oliver

