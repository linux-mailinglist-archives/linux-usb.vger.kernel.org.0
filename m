Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75234568B0B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 16:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbiGFOQN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 10:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiGFOQM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 10:16:12 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DB22D1836D
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 07:16:10 -0700 (PDT)
Received: (qmail 395406 invoked by uid 1000); 6 Jul 2022 10:16:10 -0400
Date:   Wed, 6 Jul 2022 10:16:10 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     clivewi1@btinternet.com
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Problem with USB EHCI Drivers on Linux Kernel 5.18.9
Message-ID: <YsWZKlOAybseQvB9@rowland.harvard.edu>
References: <000b01d890f8$d22c7e10$76857a30$@btinternet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000b01d890f8$d22c7e10$76857a30$@btinternet.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 06, 2022 at 06:25:35AM +0100, clivewi1@btinternet.com wrote:
> 
> 
> Dear Alan Stern
> 
>  
> 
> I am emailing you because I couldn’t find where to make a bug report, and it
> appears you are the maintainer of the kernel driver I believe I am having
> problems with.

The appropriate place for reporting bugs like this is the 
<linux-usb@vger.kernel.org> mailing list (CC'ed), as shown near the end 
of your email.  Be aware that the mailing list does not accept emails 
that are in HTML format (it wants plain text only) and GIF attachments 
are frowned upon (especially completely blank ones).

> I would expect that you have had this problem brought to your attention so I
> am hoping you can help me with a solution.

Nope, I don't recall hearing about it before.

> I have found that the problem being caused by having my Creative Labs Sound
> Blaster (SB1240) plugged in when the computer is booted with kernel 5.18.9.
> 
>  
> 
> It appears to be something that has changed within USB ECHI drivers between
> kernel version 5.10.120, and 5.18.9 in the later version is failing to
> initialise the USB hubs properly when they have a device plugged into them.

Actually, the error messages below show that the kernel is failing to 
initialize the Sound Blaster, not the USB hub.  Device 2-1 is the hub; 
2-1.1 is the Sound Blaster.

You can try running some kernel versions between 5.10 and 5.18, to pin 
down exactly where the problem first appeared.  Git bisection will help 
you do this (there are instructions for it easily available on the web).

Incidentally, guessing where in the kernel an important change occurred 
is rarely a good idea; such guesses are most often wrong.  For instance, 
in your case the device having trouble is a Sound Blaster, so why not 
guess that the change occurred in the USB sound driver?  What makes you 
think the EHCI driver has anything to do with it?  And even if the 
problem had been initializing a hub rather than the sound device, why 
not guess that the problem was in the hub driver?  My point is that the 
problem could have started in many different places; even an expert 
would have a hard time telling where to look given only the information 
in your email.

> The following is a list of the USB devices with the drivers from the two
> Kernel versions, and also the shorten error messages from the logs which
> just keeps repeating.
> 
>  
> 
> Thanks for your assistance with my problem.
> 
>  
> 
> I look forward to receiving any assistance you are able to provide.

Waiting to hear back with the results of your bisection test...

Alan Stern

> Yours sincerely
> 
>  
> 
> Clive Widdus
> 
>  
> 
> ============================================================================
> ========
> 
>  
> 
> Working USB Bus Kernel 5.10.120 built by Debian 11.3 (Buster)
> 
>  
> 
> clive@Vortex-Rikers-5:~$ lsusb -t 
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M 
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M 
>        |__ Port 1: Dev 3, If 0, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 1, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 3, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 4, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 5, Class=Human Interface Device, Driver=usbhid,
> 12M 
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M 
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M 
>        |__ Port 5: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M 
>        |__ Port 6: Dev 4, If 1, Class=Human Interface Device, Driver=usbhid,
> 1.5M 
>        |__ Port 6: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M 
> clive@Vortex-Rikers-5:~$ 
> 
> Nothing from dmesg as the interface works with no problems.
> 
>  
> 
>  
> 
> Failing USB, Kernel 5.18.9 Built by Clive on Debian 11.3 (Buster)
> 
>  
> 
> Dmesg
> 
>  
> 
> [   17.376149] usb 2-1.1: 4:1: usb_set_interface failed (-32) 
> [   17.376522] usb 2-1.1: 4:0: usb_set_interface failed (-32)
> 
> 
> 
> [   17.458654] usb 2-1.1: 2:3: usb_set_interface failed (-32) 
> [   17.459029] usb 2-1.1: 2:0: usb_set_interface failed (-32)
> 
> 
> 
> [   17.520952] usb 2-1.1: 3:1: usb_set_interface failed (-32) 
> [   17.521330] usb 2-1.1: 3:0: usb_set_interface failed (-32)
> 
> 
> 
> [   17.568827] usb 2-1.1: 1:1: usb_set_interface failed (-32) 
> [   17.569221] usb 2-1.1: 1:0: usb_set_interface failed (-32) 
> [   19.007909] rfkill: input handler disabled
> 
> 
> 
> Nothing from dmesg if the sound blaster is not plugged in; all works fine if
> the sound blaster is plugged in after the machine has booted.
> 
> 
> 
> live@Vortex-Rikers-5:~$ lsusb -t  
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M 
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M 
>        |__ Port 1: Dev 3, If 0, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 1, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 3, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 4, Class=Audio, Driver=snd-usb-audio, 12M 
>        |__ Port 1: Dev 3, If 5, Class=Human Interface Device, Driver=usbhid,
> 12M 
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M 
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M 
>        |__ Port 5: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M 
>        |__ Port 6: Dev 4, If 1, Class=Human Interface Device, Driver=usbhid,
> 1.5M 
>        |__ Port 6: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M 
> clive@Vortex-Rikers-5:~$ 
> 
> USB EHCI DRIVER¶
> <https://www.kernel.org/doc/html/latest/process/maintainers.html#usb-ehci-dr
> iver> 
> 
> 
> Mail
> 
> Alan Stern <stern@rowland.harvard.edu <mailto:stern%40rowland.harvard.edu> >
> 
> Mailing list
> 
> linux-usb@vger.kernel.org <mailto:linux-usb%40vger.kernel.org> 
> 
> Status
> 
> Maintained
> 
> Files
> 
> usb/ehci <https://www.kernel.org/doc/html/latest/usb/ehci.html>
> drivers/usb/host/ehci*
> 
>  
> 
>  
> 


