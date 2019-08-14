Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9958DE71
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 22:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbfHNUJE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 16:09:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:51676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbfHNUJE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Aug 2019 16:09:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 197AC21721;
        Wed, 14 Aug 2019 20:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565813343;
        bh=vFG+K1ZClIihp2/SF+gdJjx4X84tolyBn2ejaosehs4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UH02A4eDOuBxt3rSUjS6bznE8wCeZiphCa0NarsvWbmTZUurPglLtQZOQVqooF+FD
         pzMnJzdQN5i4UwfstuxvhfRvfJF+5SwchYa43Peo8LAFETyLJeOI9kQKO1T9hvLgTX
         OuEMoT3kdE+lF7WYtdyxkiqk9UOJoVgREsU4/mys=
Date:   Wed, 14 Aug 2019 22:09:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Francisco Ferreiro <franco.ferreiro@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: TL-MR3420 with OpenWRT with a huawei E353 usb dongle
Message-ID: <20190814200901.GC16728@kroah.com>
References: <CAE82-Hvq=Cj0WRZyJXw5mFuCYfL97DYjMGAKuLuKcjAqeXCPxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE82-Hvq=Cj0WRZyJXw5mFuCYfL97DYjMGAKuLuKcjAqeXCPxw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 14, 2019 at 11:42:53AM -0300, Francisco Ferreiro wrote:
> Hi guys, this is me trying to setup a tp-link TL-MR3420 with OpenWRT
> with a huawei E353 usb dongle
> 
> hopefully I will try to setup a multiwan  along with this two more
> sources to get redundant access to internet
>   - a cell phone (either tethering or if possible via USB (*))
>   - a fiber based dsl service accesible via ethernet.
> 
> after flashing the OpenWRT and setting up a little bit I made the
> dongle work manually (via ttyUSB0) (log below) but cant get it to
> automatically start connected from boot up
> 
> help with this dongle and maybe with this (*) one too, would be highly
> appreciated
> have some logs below
> and let me know if you need something else
> 
> thanks in advance for your help
> best
> Franco
> 
> [   25.113754] usb 1-1: new high-speed USB device number 3 using ehci-platform
> [   25.327869] usbserial_generic 1-1:1.0: The "generic" usb-serial
> driver is only for testing and one-off prototypes.
> [   25.338456] usbserial_generic 1-1:1.0: Tell
> linux-usb@vger.kernel.org to add your device to a proper driver.


This really is not the proper driver for this device.  Why are you
forcing it to use the generic one and not a "real" driver?

> [   25.348448] usbserial_generic 1-1:1.0: generic converter detected
> [   25.354938] usb 1-1: generic converter now attached to ttyUSB0
> [   25.361410] usbserial_generic 1-1:1.1: The "generic" usb-serial
> driver is only for testing and one-off prototypes.
> [   25.371975] usbserial_generic 1-1:1.1: Tell
> linux-usb@vger.kernel.org to add your device to a proper driver.
> [   25.381965] usbserial_generic 1-1:1.1: device has no bulk endpoints
> [   25.388921] usbserial_generic 1-1:1.2: The "generic" usb-serial
> driver is only for testing and one-off prototypes.
> [   25.399477] usbserial_generic 1-1:1.2: Tell
> linux-usb@vger.kernel.org to add your device to a proper driver.
> [   25.409453] usbserial_generic 1-1:1.2: generic converter detected
> [   25.415898] usb 1-1: generic converter now attached to ttyUSB1
> [   25.422331] usbserial_generic 1-1:1.3: The "generic" usb-serial
> driver is only for testing and one-off prototypes.
> [   25.432887] usbserial_generic 1-1:1.3: Tell
> linux-usb@vger.kernel.org to add your device to a proper driver.
> [   25.442869] usbserial_generic 1-1:1.3: generic converter detected
> [   25.449323] usb 1-1: generic converter now attached to ttyUSB2
> [   25.455865] usb-storage 1-1:1.4: USB Mass Storage device detected
> [   25.923729] scsi host0: usb-storage 1-1:1.4
> [   25.928826] usb-storage 1-1:1.5: USB Mass Storage device detected
> [   25.983950] scsi host1: usb-storage 1-1:1.5
> [   26.986403] scsi 0:0:0:0: CD-ROM            HUAWEI   Mass Storage
>   2.31 PQ: 0 ANSI: 2
> [   27.074885] scsi 1:0:0:0: Direct-Access     HUAWEI   SD Storage
>   2.31 PQ: 0 ANSI: 2
> [   27.089310] sd 1:0:0:0: [sda] Attached SCSI removable disk

Did you run the usb-switch program (or whatever that thing is called
that toggles devices out of mass-storage mode back into modem mode), on
this device?  That should solve this issue, right?

thanks,

greg k-h
