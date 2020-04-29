Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1BA1BD9AD
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 12:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgD2KeM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 06:34:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:47486 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726516AbgD2KeL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 06:34:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0327DABAD;
        Wed, 29 Apr 2020 10:34:09 +0000 (UTC)
Message-ID: <1588156428.8672.1.camel@suse.com>
Subject: Re: [PATCH] UAS: add quirk for LaCie 2Big Quadra
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 29 Apr 2020 12:33:48 +0200
In-Reply-To: <20200429093344.GA2080215@kroah.com>
References: <20200429083204.21428-1-oneukum@suse.com>
         <20200429093344.GA2080215@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 29.04.2020, 11:33 +0200 schrieb Greg KH:
> On Wed, Apr 29, 2020 at 10:32:04AM +0200, Oliver Neukum wrote:
> > This device needs US_FL_NO_REPORT_OPCODES to avoid going
> > through prolonged error handling on enumeration.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > Cc: stable <stable@vger.kernel.org>
> > Reported-by: Julian Groß <julian.g@posteo.de>
> > ---
> >  drivers/usb/storage/unusual_uas.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> > index cfdec74e0f4a..d6c54b5bde75 100644
> > --- a/drivers/usb/storage/unusual_uas.h
> > +++ b/drivers/usb/storage/unusual_uas.h
> > @@ -73,6 +73,13 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
> >  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> >  		US_FL_BROKEN_FUA),
> >  
> > +/* Reported-by: Julian Groß <julian.g@posteo.de> */
> > +UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
> > +		"LaCie",
> > +		"2Big Quadra USB3",
> > +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> > +		US_FL_NO_REPORT_OPCODES),
> > +
> 
> Can you please keep these in sorted order by vendor/product id as the
> comment in the file suggests to do so?

Sorry, skipped a position. Resending.

	Regards
		Oliver

