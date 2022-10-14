Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222C65FEEF6
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 15:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbiJNNvt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 09:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiJNNvs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 09:51:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E031C2F31
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 06:51:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7FB93B82349
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 13:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00FEC433B5;
        Fri, 14 Oct 2022 13:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665755503;
        bh=m4WIdcgQXQeESvpjhFYOgvjbQZiaha+mXxwddggxsqc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HVfG0KxPxWzxu0Zfnab8mPSDnOAjhXjlV04der5wFiBB35q/WtAzMKiMJlQOU0wze
         6yotWtFjaFwdUdWcNGvAnIjk/HFF2MvFw9K94KTbb91pgbhQ3P+1INM2I8Uver2/iY
         jfozlaCvAetcEq9ThVHDvp5h55LDG37s9A1jBbJ4=
Date:   Fri, 14 Oct 2022 15:52:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thilo Roerig <thilo.roerig@googlemail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Receiving report multiple times when changing cpu
Message-ID: <Y0lpnMsHNVUvnkLp@kroah.com>
References: <Y0bkpyS8Ayn0q92D@kroah.com>
 <20221014111855.2406-1-roerig@interactive-scape.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221014111855.2406-1-roerig@interactive-scape.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 14, 2022 at 01:18:55PM +0200, Thilo Roerig wrote:
> > On Wed, Oct 12, 2022 at 04:35:52PM +0200, Thilo Rörig wrote:
> > > Dear maintainer, dear community,
> > > 
> > > I'm new to looking into the linux kernel, but am hoping that this is the
> > > right spot to address my problem.
> > > Otherwise I would be very thankful, if you could point me in the right
> > > direction.
> > > 
> > > I have a problem with a custom usb device on a raspberry pi running a
> > > buildroot 64bit linux with a v5.19.14 kernel.
> > > I ran into a problem reading data from a custom usb hid device using
> > > interrupt transfers. I'm using
> > > the python hidapi library (https://pypi.org/project/hidapi/) with the
> > > libusb backend. After sending
> > > a custom command to the device, the driver changes from usbhid to usbfs.
> > > The device starts sending
> > > reports of size 1023 bytes to endpoint 0x83. `usb-devices` yields the
> > > following output:
> > 
> > USB devices do not "send" anything, they require a request from the host
> > to be able to transfer any data.  So you have to ask the device "do you
> > have any data?" before it can respond with anything.
> > 
> > So just wait, don't ask the device if you are not ready for the data to
> > be recieved, do not allow the device to continue to flood the data to
> > you if you can not recieve it all.
> 
> Thank you for pointing this out. I looked into the implementation of the hidapi
> library. The library immediately starts submitting transfer when opening the
> device. So to get a better grip on the issue, I'm now using libusb and in 
> this case I only get the reports, when I'm asking for it.
> 
> > > T:  Bus=3D01 Lev=3D03 Prnt=3D13 Port=3D00 Cnt=3D01 Dev#=3D 14 Spd=3D480 MxC=
> > > h=3D 0
> > > D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
> > > C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3D80 MxPwr=3D500mA
> > > I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Driver=
> > > =3Dusbfs
> > > E:  Ad=3D83(I) Atr=3D03(Int.) MxPS=3D1024 Ivl=3D125us
> > > 
> > > The reports are numbered by an increasing report id and are available via
> > > interrupt transfer approx. every
> > > 230 microseconds (1.85 microframes). The device does not retain any old
> > > reports.
> > 
> > So is the buffer in the device overflowing because the host is not
> > asking for enough data from it, or is the data overflowing in the host
> > because you are not reading the buffers fast enough?
> 
> The buffer on the device does not buffer reports, that are as old as the
> reports I am receiving via libusb. Interestingly, the speed that I can receive
> the reports in userspace increases, when the wrong pattern starts to occur.
> Initially, I receive ~4350 reports per second (with correct report id and
> increasing order), but once the wrong pattern occurs, the speed goes up to
> ~7650 reports per second, which is approx. 1 microframe. Without having found
> any reference in the code, the pattern in the data looks as if some dequeue
> pointer is "overtaking" the enqueue pointer in a ring buffer - but this is just
> a wild guess. It would maybe explain the pattern in the data and maybe also the
> speedup once the ring buffer is not preventing the dequeue from reading once
> the enqueue pointer is reached.   

Are you sure that the firmware in the device itself is not just broken
when you ramp up the speed?  It is the thing that is filling the buffers
to the host, when it has it ready, so it is the thing that is in control
of how fast it responds.

If all works well at slower speeds, try just doing that and not letting
the device itself work too hard.

What does other operating systems do with this device, how do they
control it?  With a in-kernel driver or with userspace code that takes a
long time between requests?

thanks,

greg k-h
