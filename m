Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97800459E32
	for <lists+linux-usb@lfdr.de>; Tue, 23 Nov 2021 09:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhKWIhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Nov 2021 03:37:43 -0500
Received: from mail.acc.umu.se ([130.239.18.156]:39559 "EHLO mail.acc.umu.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234779AbhKWIhk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Nov 2021 03:37:40 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by amavisd-new (Postfix) with ESMTP id 2762844B8F;
        Tue, 23 Nov 2021 09:34:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=acc.umu.se; s=mail1;
        t=1637656471; bh=WEWtkrifku1qLbTs7erm33dNgA8xHNo55QbbhtNxDl4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lpyF1jRJqXRXqPd358gG039wFyhNRgrqvrM/lnbV4TDdptFZzZnnEq93PKQtefGud
         lRuu9ddMs1J4JrXOgRoDnwAk+vPyT0BDaeop2Q45r9FFtU6z5EbamWt+V1PN3UPv/t
         s1pXvkRl+sHUWD3uRmGSMyY66kyHTqHqjg+lYJlvYXypTBJxwfJfHu3F3USQ9vKhG1
         MNh1BWoDODPUBFhM/Fw7ygjht4aSLrJPkjk+tff/ex2xiqo8ldTBmeXLL/bAnciP1q
         K0GaqJkXgHbUyNscfjsiYSIlmj3NMzVZ51ONIf9tQfAPKlNT2Gjkn7jmpE8EtOJcfd
         /JLE1F9UkgXfw==
Received: by mail.acc.umu.se (Postfix, from userid 24471)
        id B0BA444B91; Tue, 23 Nov 2021 09:34:30 +0100 (CET)
Date:   Tue, 23 Nov 2021 09:34:30 +0100
From:   Anton Lundin <glance@acc.umu.se>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303 converter detected, unknown device type
Message-ID: <20211123083430.GA108031@montezuma.acc.umu.se>
References: <20211123071613.GZ108031@montezuma.acc.umu.se>
 <YZyijnKD7dixoaV+@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YZyijnKD7dixoaV+@hovoldconsulting.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23 November, 2021 - Johan Hovold wrote:

> On Tue, Nov 23, 2021 at 08:16:13AM +0100, Anton Lundin wrote:
> > I just picked up a new usb-rs232 adapter and was met by the following on
> > a modern kernel:
> > 
> > # uname -r
> > 5.16.0-rc2
> > 
> > usb 3-7: new full-speed USB device number 5 using xhci_hcd
> > usb 3-7: New USB device found, idVendor=067b, idProduct=23a3, bcdDevice= 1.05
> > usb 3-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > usb 3-7: Product: ATEN USB to Serial Bridge
> > usb 3-7: Manufacturer: Prolific Technology Inc.
> > pl2303 3-7:1.0: pl2303 converter detected
> > pl2303 3-7:1.0: unknown device type, please report to linux-usb@vger.kernel.org
> 
> > I'm guessing it just needs a case for this bcdDevice.
> 
> Indeed, and thanks for reporting this. I'll add the missing entry.
> 
> Do you know what kind of PL2303 this is (e.g. PL2303GC)?

Sorry nope. The device is potted with some kind of opaque plastic, so I
can see that there are two qfp's on the board, but not the numbers on
them.

If there is some way of identifying the chip I can build a custom driver
that can read out any information if that helps.


//Anton
