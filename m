Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E941BDAE3
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 13:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgD2LnR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 07:43:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:59946 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgD2LnR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 07:43:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 13C44ABAD;
        Wed, 29 Apr 2020 11:43:15 +0000 (UTC)
Message-ID: <1588160573.8672.2.camel@suse.com>
Subject: Re: [PATCH v2] UAS: add quirk for LaCie 2Big Quadra
From:   Oliver Neukum <oneukum@suse.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 29 Apr 2020 13:42:53 +0200
In-Reply-To: <20200429111856.GA2117211@kroah.com>
References: <20200429103441.20107-1-oneukum@suse.com>
         <20200429111856.GA2117211@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 29.04.2020, 13:18 +0200 schrieb Greg KH:
> On Wed, Apr 29, 2020 at 12:34:41PM +0200, Oliver Neukum wrote:
> > This device needs US_FL_NO_REPORT_OPCODES to avoid going
> > through prolonged error handling on enumeration.
> > 
> > v2: correct sorting order
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > Reported-by: Julian Groß <julian.g@posteo.de>
> > ---
> >  drivers/usb/storage/unusual_uas.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> > index cfdec74e0f4a..22aeb6a45e57 100644
> > --- a/drivers/usb/storage/unusual_uas.h
> > +++ b/drivers/usb/storage/unusual_uas.h
> > @@ -45,6 +45,13 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
> >  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> >  		US_FL_NO_REPORT_LUNS),
> >  
> > +/* Reported-by: Julian Groß <julian.g@posteo.de> */
> > +UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
> 
> So 0x059f is greater than 0x0bc2?

I need more sleep. On the way.

	Sorry
		Oliver
