Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2335B178E6D
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 11:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387863AbgCDK32 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 05:29:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:59564 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387859AbgCDK32 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 05:29:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 311D8AEB1;
        Wed,  4 Mar 2020 10:29:26 +0000 (UTC)
Message-ID: <1583317751.12738.22.camel@suse.com>
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
From:   Oliver Neukum <oneukum@suse.com>
To:     Jonas Karlsson <jonas.karlsson@actia.se>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 04 Mar 2020 11:29:11 +0100
In-Reply-To: <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
         <20200303163945.GB652754@kroah.com>
         <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 03.03.2020, 20:08 +0000 schrieb Jonas Karlsson:

Hi,

> > > If I pull the reset pin of the USB hub and keep it in reset state at
> > > this point, the event loop of failing transfers continues despite
> > > there is nothing on the USB bus any longer. The only way to get out of that

Well, if nothing is on the bus, CDC-ACM's disconnect() should be
called. Is the HC so broken, that even that does not work?

> > loop is to either unbind the usb driver or power cycle the board.
> > > 
> > > Is this the expected behavior when USB transaction error happens for all
> > 
> > transfers when using cdc-acm class driver?

Well, it will happen on a lot of drivers. Generally the higher level
drivers are written under the assumption that you can submit URBs as
often as you want.

> The reason I posted on this mailing list was that I was afraid that the cdc-acm driver could
> be causing new transfers to be started when the previous fails due to USB transaction errors and
> then trigger this event storm.

It does. However it does so in a way that the lower layers
should survive. You may argue that cdc_acm should do error handling.
The question is which handling. If a reset does not help as you
said, I do not see what cdc_acm can do.

> The acm_ctrl_irq() function seems to submit a new urb directly if the previous fails, but I cannot

Yes. There is no error handling in the CDC specification.
Unless you want to reset the whole device you are stuck.
The device is free to respond with a control message any time
it wants. You need to keep that URB running if you want the
device to remain fully functional.

> say that I understand that code very well yet. The acm_read_bulk_callback() function also seem
> to submit a new read urb on USB transaction Errors. But If you think this could not cause this
> behavior I will ask our supplier to fix the cdns driver.

This has the same issue as the irq endpoint. We need to keep the data
pump running while the device is operational.

	Regards
		Oliver

