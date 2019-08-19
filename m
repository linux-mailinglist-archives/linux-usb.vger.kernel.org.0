Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E54594963
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 18:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfHSQEv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 12:04:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58776 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727354AbfHSQEv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 12:04:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 71AEA1089041;
        Mon, 19 Aug 2019 16:04:51 +0000 (UTC)
Received: from ovpn-112-25.rdu2.redhat.com (ovpn-112-25.rdu2.redhat.com [10.10.112.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 97254859D3;
        Mon, 19 Aug 2019 16:04:50 +0000 (UTC)
Message-ID: <9f7ac537d242643b075f915b895c1b88631d20c1.camel@redhat.com>
Subject: Re: TL-MR3420 with OpenWRT with a huawei E353 usb dongle
From:   Dan Williams <dcbw@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Francisco Ferreiro <franco.ferreiro@gmail.com>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 19 Aug 2019 11:04:49 -0500
In-Reply-To: <20190814200901.GC16728@kroah.com>
References: <CAE82-Hvq=Cj0WRZyJXw5mFuCYfL97DYjMGAKuLuKcjAqeXCPxw@mail.gmail.com>
         <20190814200901.GC16728@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Mon, 19 Aug 2019 16:04:51 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-08-14 at 22:09 +0200, Greg KH wrote:
> On Wed, Aug 14, 2019 at 11:42:53AM -0300, Francisco Ferreiro wrote:
> > Hi guys, this is me trying to setup a tp-link TL-MR3420 with
> > OpenWRT
> > with a huawei E353 usb dongle
> > 
> > hopefully I will try to setup a multiwan  along with this two more
> > sources to get redundant access to internet
> >   - a cell phone (either tethering or if possible via USB (*))
> >   - a fiber based dsl service accesible via ethernet.
> > 
> > after flashing the OpenWRT and setting up a little bit I made the
> > dongle work manually (via ttyUSB0) (log below) but cant get it to
> > automatically start connected from boot up
> > 
> > help with this dongle and maybe with this (*) one too, would be
> > highly
> > appreciated
> > have some logs below
> > and let me know if you need something else
> > 
> > thanks in advance for your help
> > best
> > Franco
> > 
> > [   25.113754] usb 1-1: new high-speed USB device number 3 using
> > ehci-platform
> > [   25.327869] usbserial_generic 1-1:1.0: The "generic" usb-serial
> > driver is only for testing and one-off prototypes.
> > [   25.338456] usbserial_generic 1-1:1.0: Tell
> > linux-usb@vger.kernel.org to add your device to a proper driver.
> 
> This really is not the proper driver for this device.  Why are you
> forcing it to use the generic one and not a "real" driver?
> 
> > [   25.348448] usbserial_generic 1-1:1.0: generic converter
> > detected
> > [   25.354938] usb 1-1: generic converter now attached to ttyUSB0
> > [   25.361410] usbserial_generic 1-1:1.1: The "generic" usb-serial
> > driver is only for testing and one-off prototypes.
> > [   25.371975] usbserial_generic 1-1:1.1: Tell
> > linux-usb@vger.kernel.org to add your device to a proper driver.
> > [   25.381965] usbserial_generic 1-1:1.1: device has no bulk
> > endpoints
> > [   25.388921] usbserial_generic 1-1:1.2: The "generic" usb-serial
> > driver is only for testing and one-off prototypes.
> > [   25.399477] usbserial_generic 1-1:1.2: Tell
> > linux-usb@vger.kernel.org to add your device to a proper driver.
> > [   25.409453] usbserial_generic 1-1:1.2: generic converter
> > detected
> > [   25.415898] usb 1-1: generic converter now attached to ttyUSB1
> > [   25.422331] usbserial_generic 1-1:1.3: The "generic" usb-serial
> > driver is only for testing and one-off prototypes.
> > [   25.432887] usbserial_generic 1-1:1.3: Tell
> > linux-usb@vger.kernel.org to add your device to a proper driver.
> > [   25.442869] usbserial_generic 1-1:1.3: generic converter
> > detected
> > [   25.449323] usb 1-1: generic converter now attached to ttyUSB2
> > [   25.455865] usb-storage 1-1:1.4: USB Mass Storage device
> > detected
> > [   25.923729] scsi host0: usb-storage 1-1:1.4
> > [   25.928826] usb-storage 1-1:1.5: USB Mass Storage device
> > detected
> > [   25.983950] scsi host1: usb-storage 1-1:1.5
> > [   26.986403] scsi 0:0:0:0: CD-ROM            HUAWEI   Mass
> > Storage
> >   2.31 PQ: 0 ANSI: 2
> > [   27.074885] scsi 1:0:0:0: Direct-Access     HUAWEI   SD Storage
> >   2.31 PQ: 0 ANSI: 2
> > [   27.089310] sd 1:0:0:0: [sda] Attached SCSI removable disk
> 
> Did you run the usb-switch program (or whatever that thing is called
> that toggles devices out of mass-storage mode back into modem mode),
> on
> this device?  That should solve this issue, right?

Greg means usb_modeswitch:

http://www.draisberghof.de/usb_modeswitch/

It's very likely already on your OpenWRT system or if not available as
a package for it.

Dan

