Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F214565DAE5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 18:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239301AbjADRE0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 12:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239410AbjADREY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 12:04:24 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id F25BB111F
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 09:04:22 -0800 (PST)
Received: (qmail 474093 invoked by uid 1000); 4 Jan 2023 12:04:22 -0500
Date:   Wed, 4 Jan 2023 12:04:22 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Disabling per-device autosuspend
Message-ID: <Y7WxltobCK0zQz9k@rowland.harvard.edu>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
 <20230104164900.31a3243d@meshulam.tesarici.cz>
 <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
 <20230104174731.5527b1ed@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104174731.5527b1ed@meshulam.tesarici.cz>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 04, 2023 at 05:47:31PM +0100, Petr Tesařík wrote:
> Hi Alan,
> 
> I clicked the Send button too early...
> 
> V Wed, 4 Jan 2023 11:18:29 -0500
> Alan Stern <stern@rowland.harvard.edu> napsáno:
> 
> > On Wed, Jan 04, 2023 at 04:49:00PM +0100, Petr Tesařík wrote:
> > > On Wed, 4 Jan 2023 15:13:41 +0100
> > > Petr Tesařík <petr@tesarici.cz> wrote:
> > >   
> > > > Hi folks,
> > > > 
> > > > I'm struggling with autosuspend on my Samsung phone in download mode,  
> > 
> > Wait...  Autosuspend is carried out by the host, but you appear to be 
> > stating that the Samsung phone is acting as a USB device (i.e., it's 
> > being autosuspended, not that it is autosuspending something else).  
> > Is that right?
> > 
> > > > as it apparently breaks heimdall/libusb on my Tumbleweed system. Here's
> > > > what I'm seeing:
> > > > 
> > > > - My device is autosuspended, because it has been idle for long enough.
> > > > - cd /sys/bus/usb/devices/1-4/  # my device's port
> > > > - echo -1 > power/autosuspend
> > > > - The device is reset and gets a new device ID.
> > > >   The current directory is no longer valid (becomes empty).  
> > > 
> > > On a second thought, this looks like the actual bug. I don't think
> > > we're supposed to see a disconnect+reconnect whenever a suspended USB
> > > device is resumed. Then again, I'm no expert on USB...  
> > 
> > In general there should not be a disconnect during a resume.  But it can 
> > happen, depending on how the device behaves.
> 
> 
> >  Perhaps your phone is 
> > disconnecting deliberately.
> > 
> > The dmesg log ought to contain some useful information, particularly if 
> > you enable USB kernel debugging before starting the experiment:
> > 
> > 	echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> 
> I can see there is an -EIO after the resume attempt:
> 
> Jan 04 17:44:38 meshulam kernel: usb 1-4: usb auto-resume
> Jan 04 17:44:38 meshulam kernel: hub 1-0:1.0: state 7 ports 4 chg 0000 evt 0010
> Jan 04 17:44:38 meshulam kernel: usb 1-4: Waited 0ms for CONNECT
> Jan 04 17:44:38 meshulam kernel: usb 1-4: finish resume

At this point the host sends a Get-Device-Status request to the device 
(not shown in the log).

> Jan 04 17:44:38 meshulam kernel: usb 1-4: retry with reset-resume

The fact that the host is retrying means that the status request got an 
error.  Unfortunately the log message doesn't say sort of error 
occurred.

> Jan 04 17:44:38 meshulam kernel: usb 1-4: reset high-speed USB device number 46 using xhci_hcd
> Jan 04 17:44:38 meshulam kernel: usb 1-4: gone after usb resume? status -5

And here is where the phone disconnected itself, or at least, failed to 
respond properly following the reset.

If you want even more detailed information, you can get a usbmon trace 
(see Documentation/usb/usbmon.rst in the kernel source) of the resume 
procedure.  However, I doubt that knowing what happened will help to fix 
the problem.

If you want to prevent the phone from being autosuspended in the first 
place, you can write -1 to /sys/module/usbcore/parameters/autosuspend 
before the phone is plugged in.  But of course, this will then affect 
_all_ USB devices plugged in before you set the autosuspend delay back 
to 2.

Alan Stern
