Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98824534EAE
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 13:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbiEZL6A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 07:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiEZL56 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 07:57:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AABC8BEA;
        Thu, 26 May 2022 04:57:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F03A617C6;
        Thu, 26 May 2022 11:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B8DC385A9;
        Thu, 26 May 2022 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1653566274;
        bh=4GT9ilcb7JZ8sIp7AhBecbMSZKHvxeTbFXr8jNh8npQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aFNQjOjg/2aXhrZftksqSBQTEQx84bG5R9V2oc5Drdtd4w2koD5jQ6GaDSpew54Py
         GuDQotLPVY8eiF9iPYl2vQ2gtnl6yuamCMj3u0DT/RyvYsXWRu5nlFG1v7wWCJd5Wq
         ja86LSQGq76wUmDKUV/2Bb5t0DaJ0QDyjnNrXyJc=
Date:   Thu, 26 May 2022 13:57:51 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: Revisiting unwanted auto-assertion of DTR & RTS on serial port
 open
Message-ID: <Yo9rP49RB3oP7gZe@kroah.com>
References: <CA+uuBqZWHy80_kV30jmXiGpohyuxHa1obPGpi-oOWsAbufBZ5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+uuBqZWHy80_kV30jmXiGpohyuxHa1obPGpi-oOWsAbufBZ5g@mail.gmail.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 26, 2022 at 12:26:03AM -0800, Mychaela Falconia wrote:
> Hello Linux serial and usb-serial maintainers,
> 
> I am the hardware engineer who fought here unsuccessfully a year and a
> half ago to add Linux support for serial hardware devices in which DTR
> and/or RTS modem control signals have been repurposed for non-standard
> uses.  On such hw devices it is very often the case that DTR and RTS
> may be asserted ONLY when explicitly requested by specialized
> userspace applications that go with the hw (by way of TIOCMBIS ioctl,
> often followed by a delay and TIOCMBIC to produce a pulse), and NOT at
> any other times - in particular, it must be possible to open the
> serial port for byte Rx/Tx communication with the target device
> _without_ that open syscall unstoppably asserting DTR & RTS right
> there and then.  Here is the previous round of discussion:
> 
> https://lore.kernel.org/linux-serial/X8iuCXYhOBVMGvXv@localhost/T/
> 
> I am now revisiting this issue and making another attempt to get this
> capability added to Linux.  The new development is that I have tested
> the corresponding feature in FreeBSD, and found it to work correctly -
> thus FreeBSD is now the first (and so far only) Unix-style OS in the
> world that features an actually working, usable fix for the 1970s UNIX
> design bug of unstoppably asserting DTR & RTS on serial port open.
> Wouldn't it be good for Linux to follow suit?
> 
> The feature in question was added to FreeBSD quite recently:
> 
> https://reviews.freebsd.org/D20031
> 
> The above link was provided by Johan here a year and a half ago, in
> the previous round of this battle.  However, only now I have had a
> chance to test FreeBSD's implementation on actual hardware, and
> confirm that it actually works as required for signal-repurposing hw
> applications.
> 
> The diff that appears on the FreeBSD review page above only adds one
> new termios flag, CNO_RTSDTR added to cflags.  Johan was proposing
> implementing a similar new termios flag in Linux - however, there is a
> crucial difference between what Johan was proposing for Linux vs what
> is actually implemented in FreeBSD, and it's the difference between
> usable and unusable.
> 
> FreeBSD's counterpart to Linux ttyUSBx is ttyUx or cuaUx devices.
> However, FreeBSD also has .init and .lock devices which don't exist in
> Linux, and it's the .init device that makes their newly added
> CNO_RTSDTR feature actually work in a usable manner.  If you have a
> serial device that absolutely does not tolerate unwanted assertions of
> DTR/RTS, not even for one nanosecond, under FreeBSD you can make it
> work as follows (using cuaU0 as example here):
> 
> Step 1: open /dev/cuaU0.init (the .init suffix is crucial) and perform
> the ioctl setting CNO_RTSDTR on this initial-state device.  This step
> can be done with stty command.  These .init devices have the special
> property that opening one does NOT cause modem control lines to be
> asserted, unlike the regular ttyXX or cuaXX device.
> 
> Step 2: once the previous step is done, you can open the regular
> /dev/cuaU0 device for communication, and no unwanted DTR/RTS assertion
> will happen.
> 
> Johan's proposal for Linux was superficially similar: he proposed
> adding a similar new termios flag.  But because Linux does not have
> any counterpart to FreeBSD's .init devices, a termios flag won't work
> for this purpose in Linux, it would create a chicken-and-egg problem:
> one would need to open the serial port first in order to set the
> termios flag, and this very act would cause DTR & RTS to be asserted,
> causing irreparable damage: electrocution, setting off explosives, use
> your imagination for how these signals could be wired to do highly
> damaging actions.
> 
> Out of various methods that were discussed here a year and a half ago,
> only the sysfs approach would produce a user capability match to what
> FreeBSD now provides.  The termios flag idea is a dead end, unless
> this community feels that FreeBSD's ttyXX.init and ttyXX.lock should
> also be replicated in Linux in full.  Another sensible way would be to
> define a new open flag, such as O_NODTR, or reuse/abuse an existing
> flag like O_DIRECT which currently does nothing for tty devices - but
> people have objected that this approach would be limited to custom
> userspace programs, precluding the use of echo, cat etc.
> 
> I now argue for the sysfs attribute approach.  Johan had a patch (he
> made it, but didn't fight for it because he really preferred the
> termios flag instead) adding a /sys/class/tty/ttyXXX/nordy attribute -
> setting this attribute to 1 would suppress automatic assertion of DTR
> and RTS on serial port open.  One could argue that a better name for
> this new sysfs attribute would be something like
> /sys/class/tty/ttyXXX/manual_dtr_rts - but I'll be happy no matter how
> it's named, as long as the essential functionality remains.
> 
> This sysfs attribute would produce the same fundamental workflow as
> currently exists in FreeBSD.  In FreeBSD one needs to open
> /dev/cuaXX.init, do the necessary ioctl, then close that fd and open
> another path (/dev/cuaXX) to do the actual serial communication.  With
> the proposed sysfs attribute, the same fundamental workflow will apply
> here: open the sysfs path, do the necessary attribute write, then
> close the sysfs fd and open /dev/ttyXXX for the actual communication.
> In both cases the preliminary step (/dev/cuaXX.init in FreeBSD, sysfs
> path in my proposal for Linux) can be done from the shell, or it can
> be incorporated into custom userspace sw that works with the custom hw
> device.
> 
> I can dig up Johan's old patch adding the nordy attribute, update it
> for current HEAD, and formally resubmit it - would the maintainers be
> agreeable to such course?

Please rebase and resubmit it and we will be glad to consider it.

thanks,

greg k-h
