Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93CE44EFE70
	for <lists+linux-usb@lfdr.de>; Sat,  2 Apr 2022 06:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234369AbiDBEU3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Apr 2022 00:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbiDBEU1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Apr 2022 00:20:27 -0400
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA29DCC6
        for <linux-usb@vger.kernel.org>; Fri,  1 Apr 2022 21:18:29 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id z92so5085331ede.13
        for <linux-usb@vger.kernel.org>; Fri, 01 Apr 2022 21:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=niOi02rq2Sb/pffhzJLcteCbwp9HoecGXU21yQx1lic=;
        b=eEMqeliZbu9tmp5E7Ggu3mss+6+8SnEBpLUlFzStpYDYq9sYygD7C/ai5bs6FsEWp3
         7C8Wu2ixGC11YubojvE6MWyBvpNcYkcvv60TU/NDBFEn3xlEGAROxFlJX2nIq2C6u4xb
         8USVH/GpVIWbN1o5vkAalmLkdx70GxggADJPiU6t96Z+jKQGfE3zjznWT/djpL7lkFTj
         bEv6EzdDZ5+whIozexeSoVSnjOl+hiEydyxE+oVPDcCJoYGBSezHOBUl9WHPHnsAx/O5
         gg59v5DNvJr+AyaZMsz9W0183YsAUHkrdVDQUYHyzY2HY3oKyXRtf5fzhkTNlZEWxB+U
         ZXbQ==
X-Gm-Message-State: AOAM53352AQ48Daoy2C1u+OW4U0MHnZ4XVrEFPDrwIIYSG7n8b6I7tld
        Xe64yUpq2Ww3oRjxLg/pm++X+muA33Y=
X-Google-Smtp-Source: ABdhPJw3GcEnfq3hWRCjEOxiCACsk7iNW8Yubs5/oeR2Ucm7vinXkkAb1iyCiXxmRQU86urUtkv7TQ==
X-Received: by 2002:a05:6402:d0e:b0:418:f011:275e with SMTP id eb14-20020a0564020d0e00b00418f011275emr23806550edb.323.1648873108189;
        Fri, 01 Apr 2022 21:18:28 -0700 (PDT)
Received: from jkm (79-98-75-217.sys-data.com. [79.98.75.217])
        by smtp.gmail.com with ESMTPSA id hs12-20020a1709073e8c00b006dfdfdac005sm1659500ejc.174.2022.04.01.21.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 21:18:27 -0700 (PDT)
Date:   Sat, 2 Apr 2022 06:18:26 +0200
From:   Petr Janecek <janecek@ucw.cz>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Re: Apogee ONEv2 keeps resetting
Message-ID: <20220402041824.GA26837@jkm>
References: <3f4d1bce-7459-9ea4-be73-9b51f569e526@ucw.cz>
 <YjoPVAxeKtY6aV1s@rowland.harvard.edu>
 <63b772ff-ef03-5f0a-c42c-ad9ec9770f16@ucw.cz>
 <YjyMkqk4zZWPJ6T0@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjyMkqk4zZWPJ6T0@rowland.harvard.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 24, 2022 at 11:21:54AM -0400, Alan Stern wrote:
> On Thu, Mar 24, 2022 at 03:44:41AM +0100, Petr Janecek wrote:
> > Hi Alan,
> > 
> > On 3/22/22 19:03, Alan Stern wrote:
> > > On Sun, Mar 20, 2022 at 02:15:40AM +0100, Petr Janecek wrote:
> > > > Hi,
> > > >     I'm trying to use Apogee ONEv2.  From usb dumps under
> > > > macos or windows it seems like a usb Class Audio 2.0
> > > > device, but in linux, it keeps resetting every two seconds
> > > > or so.  It keeps resetting even when the snd-usb-audio
> > > > driver is disabled, so the problem is probably at a lower
> > > > level.
> > > 
> > > Can you post the log output on a system where snd-usb-audio is disabled?
> > 
> > [ 3412.279063] usb 3-8: new high-speed USB device number 6 using xhci_hcd
> > [ 3412.470003] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> > bcdDevice= 1.05
> > [ 3412.470017] usb 3-8: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=3
> > [ 3412.470023] usb 3-8: Product: ONEv2
> > [ 3412.470028] usb 3-8: Manufacturer: Apogee
> > [ 3412.470033] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> > [ 3413.217053] usb 3-8: USB disconnect, device number 6
> > [ 3413.629046] usb 3-8: new high-speed USB device number 7 using xhci_hcd
> > [ 3413.829760] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> > bcdDevice= 1.05
> > [ 3413.829766] usb 3-8: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=3
> > [ 3413.829768] usb 3-8: Product: ONEv2
> > [ 3413.829770] usb 3-8: Manufacturer: Apogee
> > [ 3413.829772] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> > [ 3414.421964] usb 3-8: USB disconnect, device number 7
> > [ 3414.838981] usb 3-8: new high-speed USB device number 8 using xhci_hcd
> > [ 3415.029947] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> > bcdDevice= 1.05
> > [ 3415.029961] usb 3-8: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=3
> > [ 3415.029968] usb 3-8: Product: ONEv2
> > [ 3415.029973] usb 3-8: Manufacturer: Apogee
> > [ 3415.029978] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> > [ 3415.627052] usb 3-8: USB disconnect, device number 8
> 
> Nothing particularly suspicious there.
> 
> > 
> > > >    The messages below are from v5.16.16, but it behaves
> > > > the same no matter what I plug it into.
> > > > 
> > > > [  253.708616] usb 3-8: new high-speed USB device number 6 using xhci_hcd
> > > > [  253.899363] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> > > > bcdDevice= 1.05
> > > > [  253.899370] usb 3-8: New USB device strings: Mfr=1, Product=2,
> > > > SerialNumber=3
> > > > [  253.899373] usb 3-8: Product: ONEv2
> > > > [  253.899375] usb 3-8: Manufacturer: Apogee
> > > > [  253.899377] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> > > > [  253.960901] mc: Linux media interface: v0.10
> > > 
> > > Any idea where that line came from?
> > 
> >   That's from CONFIG_MEDIA_CONTROLLER, which is selected for usb
> > webcam.  It also selects CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER.
> > Compiled it out, rebooted.  Now the line is missing, but no other
> > change.
> > 
> > > You should try capturing a usbmon trace showing what happens when the
> > > device is plugged in and then resets.  Preferably on a system where
> > > snd-usb-audio is disabled.
> > 
> >   Trace from wireshark is attached.
> 
> The trace doesn't help much, unfortunately.  It shows normal device 
> initialization, plus a couple of extra string descriptor reads.  About 
> 1/2 second afterward, the device disconnects itself electronically from 
> the USB bus and reconnects 20 ms later.
> 
> I get the feeling that the device expects to receive some specific 
> messages from the host within that one-half second, and disconnects if 
> it doesn't see them.  And presumably it doesn't get what it's looking 
> for even when the USB sound drivers are enabled.

  I've compared traces in linux to macos and windows, and
the only thing linux does that the others don't is something
like

usb_get_string(dev, 0, 0xee, &buf, 1024)

like it's getting the microsoft os descriptor.

  And the apogee does not like it: it's the only get
descriptor string request with empty string response.  When
the request is made the second time, it's the last request
before reset.

  This oddball request happens even with snd-usb-audio
disabled.  And I'm totally unable to find where it comes
from, I have not enabled anything like USB_GADGET.
How to get rid of it?


Petr Janecek
