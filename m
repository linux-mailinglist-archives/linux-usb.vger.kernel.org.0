Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC3897AF9
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 15:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbfHUNg2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 09:36:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:58776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726372AbfHUNg2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Aug 2019 09:36:28 -0400
Received: from localhost (unknown [12.166.174.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A34E82339E;
        Wed, 21 Aug 2019 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566394586;
        bh=XnaGsMExOxs1cfvBXmQW/jiymoDFI/QbyIpNJOlrYr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X99DOBNOqBHEdshAtefgVXO1VZsYcme7BrjdJqb6qWdCHh/K5BbYtiKijmjXedob4
         hIVU+aSmTIo2DbX4eExo519XvM0Ibv1H9LpvSMP2GCF5HPkDUbP7ENQRqyBK7onWHq
         QqJJd6/5bVMW/qLh5menkakOOYG8OWYy9ObdQgXs=
Date:   Wed, 21 Aug 2019 06:36:26 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     walter harms <wharms@bfs.de>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Subject: Re: problems with Edgeport/416
Message-ID: <20190821133626.GA4890@kroah.com>
References: <5D5D1C8C.9080000@bfs.de>
 <20190821112009.GA5228@kroah.com>
 <5D5D2F9E.7050805@bfs.de>
 <20190821122028.GA19107@kroah.com>
 <5D5D4170.4070001@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5D5D4170.4070001@bfs.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 21, 2019 at 03:04:48PM +0200, walter harms wrote:
> 
> 
> Am 21.08.2019 14:20, schrieb Greg KH:
> > On Wed, Aug 21, 2019 at 01:48:46PM +0200, walter harms wrote:
> >>
> >>
> >> Am 21.08.2019 13:20, schrieb Greg KH:
> >>> On Wed, Aug 21, 2019 at 12:27:24PM +0200, walter harms wrote:
> >>>> Hello List,
> >>>> does some use linux with an Edgeport/416 ?
> >>>>
> >>>> I have a strange problem. the device is resetting soon
> >>>> after i started using it (but not immediately).
> >>>> I do not see a kernel OOPS but a common pattern is:
> >>>>
> >>>> 2019-08-20T15:19:39.825812+00:00 omnfrmo10 kernel: [683270.658623] usb 7-1.1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> >>>> 2019-08-20T15:19:39.825818+00:00 omnfrmo10 kernel: [683270.658626] usb 7-1.1.2: Product: Edgeport/416
> >>>> 2019-08-20T15:19:39.825821+00:00 omnfrmo10 kernel: [683270.658628] usb 7-1.1.2: Manufacturer: Digi International
> >>>> 2019-08-20T15:19:39.825823+00:00 omnfrmo10 kernel: [683270.658630] usb 7-1.1.2: SerialNumber: E63966100-1
> >>>> 2019-08-20T15:19:39.985571+00:00 omnfrmo10 kernel: [683270.817909] usb 7-1.1.2: Edgeport TI 2 port adapter converter now attached to ttyUSB4
> >>>> 2019-08-20T15:19:39.985594+00:00 omnfrmo10 kernel: [683270.818132] usb 7-1.1.2: Edgeport TI 2 port adapter converter now attached to ttyUSB5
> >>>> 2019-08-20T15:19:40.007943+00:00 omnfrmo10 mtp-probe: checking bus 7, device 88: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.1/7-1.1.2"
> >>>> 2019-08-20T15:19:40.053750+00:00 omnfrmo10 kernel: [683270.885626] usb 7-1.2.2: New USB device found, idVendor=1608, idProduct=0247
> >>>> 2019-08-20T15:19:40.053791+00:00 omnfrmo10 kernel: [683270.885630] usb 7-1.2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> >>>> 2019-08-20T15:19:40.053797+00:00 omnfrmo10 kernel: [683270.885633] usb 7-1.2.2: Product: Edgeport/416
> >>>> 2019-08-20T15:19:40.053800+00:00 omnfrmo10 kernel: [683270.885635] usb 7-1.2.2: Manufacturer: Digi International
> >>>> 2019-08-20T15:19:40.053803+00:00 omnfrmo10 kernel: [683270.885637] usb 7-1.2.2: SerialNumber: E63966100-5
> >>>> 2019-08-20T15:19:40.065569+00:00 omnfrmo10 kernel: [683270.897406] usb 7-1.1.3: new full-speed USB device number 90 using uhci_hcd
> >>>> 2019-08-20T15:19:40.213569+00:00 omnfrmo10 kernel: [683271.046316] usb 7-1.2.2: Edgeport TI 2 port adapter converter now attached to ttyUSB6
> >>>> 2019-08-20T15:19:40.213594+00:00 omnfrmo10 kernel: [683271.046782] usb 7-1.2.2: Edgeport TI 2 port adapter converter now attached to ttyUSB7
> >>>> 2019-08-20T15:19:40.242034+00:00 omnfrmo10 mtp-probe: checking bus 7, device 89: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.2/7-1.2.2"
> >>>> 2019-08-20T15:19:40.301578+00:00 omnfrmo10 kernel: [683271.133380] usb 7-1.2.3: new full-speed USB device number 91 using uhci_hcd
> >>>> 2019-08-20T15:19:40.357559+00:00 omnfrmo10 kernel: [683271.192815] usb 7-1.1.3: New USB device found, idVendor=1608, idProduct=0247
> >>>> 2019-08-20T15:19:40.357584+00:00 omnfrmo10 kernel: [683271.192820] usb 7-1.1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> >>>> 2019-08-20T15:19:40.357588+00:00 omnfrmo10 kernel: [683271.192822] usb 7-1.1.3: Product: Edgeport/416
> >>>> 2019-08-20T15:19:40.357591+00:00 omnfrmo10 kernel: [683271.192825] usb 7-1.1.3: Manufacturer: Digi International
> >>>> 2019-08-20T15:19:40.357593+00:00 omnfrmo10 kernel: [683271.192827] usb 7-1.1.3: SerialNumber: E63966100-2
> >>>> 2019-08-20T15:19:40.513702+00:00 omnfrmo10 kernel: [683271.349103] usb 7-1.1.3: Edgeport TI 2 port adapter converter now attached to ttyUSB8
> >>>> 2019-08-20T15:19:40.513725+00:00 omnfrmo10 kernel: [683271.349311] usb 7-1.1.3: Edgeport TI 2 port adapter converter now attached to ttyUSB9
> >>>> 2019-08-20T15:19:40.537138+00:00 omnfrmo10 mtp-probe: checking bus 7, device 90: "/sys/devices/pci0000:00/0000:00:1d.1/usb7/7-1/7-1.1/7-1.1.3"
> >>>> 2019-08-20T15:19:40.601754+00:00 omnfrmo10 kernel: [683271.433389] usb 7-1.1.4: new full-speed USB device number 92 using uhci_hcd
> >>>> 2019-08-20T15:19:40.601794+00:00 omnfrmo10 kernel: [683271.433631] usb 7-1.2.3: New USB device found, idVendor=1608, idProduct=0247
> >>>> 2019-08-20T15:19:40.601798+00:00 omnfrmo10 kernel: [683271.433634] usb 7-1.2.3: New USB device strings: Mfr=1, Produc
> >>>
> >>> I don't see any errors there.  What is the problem with the device?
> >>>
> >> You use it, it resets (ports gone etc) and appears again.
> >> I suspected that the device is broken but i test today with windows
> >> (and a different computer) showed it works fine.
> > 
> > Different computer?  Did you try windows on the same exact machine with
> > same exact cable?  This sounds like a hardware program, if the device
> > disconnects,there's nothing the software can do about that, it's a
> > hardware / electrical thing.
> > 
> 
> Different computer but same cables i guess the device is ok.

So the device works, but the connection to your other computer probably
does not.  I'm betting this is an electrical issue :)

thanks,

greg k-h
