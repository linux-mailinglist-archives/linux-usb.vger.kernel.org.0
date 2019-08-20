Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFB395E6B
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 14:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbfHTM1D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 08:27:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:38036 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728366AbfHTM1D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 08:27:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6278FAEBF;
        Tue, 20 Aug 2019 12:27:02 +0000 (UTC)
Message-ID: <1566304021.11678.13.camel@suse.com>
Subject: Re: WARNING in wdm_write/usb_submit_urb
From:   Oliver Neukum <oneukum@suse.com>
To:     =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc:     gustavo@embeddedor.com, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org
Date:   Tue, 20 Aug 2019 14:27:01 +0200
In-Reply-To: <87sgpw5d6j.fsf@miraculix.mork.no>
References: <000000000000719222059081d6f2@google.com>
         <1566297095.11678.11.camel@suse.com><1566297095.11678.11.camel@suse.com>
         (Oliver Neukum's message of "Tue, 20 Aug 2019 12:31:35 +0200") <87sgpw5d6j.fsf@miraculix.mork.no>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 20.08.2019, 12:44 +0200 schrieb Bjørn Mork :
> Oliver Neukum <oneukum@suse.com> writes:
> 
> > diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> > index 1656f5155ab8..a341081a5f47 100644
> > --- a/drivers/usb/class/cdc-wdm.c
> > +++ b/drivers/usb/class/cdc-wdm.c
> > @@ -588,14 +588,24 @@ static int wdm_flush(struct file *file, fl_owner_t id)
> >  {
> >  	struct wdm_device *desc = file->private_data;
> >  
> > -	wait_event(desc->wait, !test_bit(WDM_IN_USE, &desc->flags));
> > +	wait_event(desc->wait,
> > +			/*
> > +			 * needs both flags. We cannot do with one
> > +			 * because resetting it would cause a race
> > +			 * with write() yet we need to signal
> > +			 * a disconnect
> > +			 */
> > +			!test_bit(WDM_IN_USE, &desc->flags) &&
> > +			!test_bit(WDM_DISCONNECTING, &desc->flags));
> 
> 
> Makes sense.  But isn't the WDM_DISCONNECTING test inverted?

You are right. I am making V3.

> >  	/* cannot dereference desc->intf if WDM_DISCONNECTING */
> >  	if (desc->werr < 0 && !test_bit(WDM_DISCONNECTING, &desc->flags))
> >  		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
> >  			desc->werr);
> >  
> > -	return usb_translate_errors(desc->werr);
> > +	return test_bit(WDM_DISCONNECTING, &desc->flags) ? 
> > +			-ENODEV : 
> > +			usb_translate_errors(desc->werr);
> >  }
> 
> Minor detail, but there's an awful lot of test_bit(WDM_DISCONNECTING)
> here.  How about
> 
>   if (test_bit(WDM_DISCONNECTING, &desc->flags))
>     return -ENODEV;
>   if (desc->werr < 0)
>     dev_err(&desc->intf->dev, "Error in flush path: %d\n", desc->werr);
>   return usb_translate_errors(desc->werr);

Much better.

	Regards
		Oliver

