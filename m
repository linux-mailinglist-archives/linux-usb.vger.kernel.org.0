Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56A0F39BD3B
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 18:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhFDQfQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 12:35:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:52586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229854AbhFDQfP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 12:35:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A1CC610E7;
        Fri,  4 Jun 2021 16:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622824409;
        bh=05rL0i/j/zQvJYTsYd0JLQPciuOP8AD6VmuafijdayI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HcK0izTo85F/S+95Jf7B2xL8MYzsips0AJZKbmhQ591w/1fDEadgGR+OvedoeHodP
         ZhtivHQRiaZT/oF0UJFYj1CtS/RJlLP878/YkItyUnw0PbPs+pB7FJHDBZIY0eMHzF
         JpWoSt9RTNZrmSlN8dRMpY3Ep8XEZ/wZPbTPT/xIqfbsfYI/4XGbCfKCIB/1lj47wl
         hU6iFa819GZnVVu+T3E7IphDLy+TDLJcEC6wGyfL4YEKA0Qakc4fVMs/DnojwrmF/N
         mI+b+OzGzyk14yHZjz1A51lssHSfQmQxaalzsdWnNN/T0v32UvkbJ1eSI2A01zBhA5
         42haEFTQFTrVg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lpClE-00064K-Mg; Fri, 04 Jun 2021 18:33:29 +0200
Date:   Fri, 4 Jun 2021 18:33:28 +0200
From:   Johan Hovold <johan@kernel.org>
To:     David Frey <dpfrey@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>
Subject: Re: CP210X: Failure while programming ESP32 dev board
Message-ID: <YLpV2NomCCGKf2zt@hovoldconsulting.com>
References: <CAAvkfd_vPHcd5CTLrA_BoVhg_aNWNzcp45yO-dCpJZhyabjjsg@mail.gmail.com>
 <YK4T+w+e8TtAUuEo@hovoldconsulting.com>
 <CAAvkfd91qr+aQQxXyQfk1e2Avifcdp6fCwgrk3c7=ex3pcqvPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAvkfd91qr+aQQxXyQfk1e2Avifcdp6fCwgrk3c7=ex3pcqvPw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 03, 2021 at 02:48:44PM -0700, David Frey wrote:
> Hi Johan,
> 
> I have added linux-usb@vger.kernel.org to the CC as requested.
> 
> > I just verified with a CP2102N here and everything appears to work as
> > expected as it also does with some of your boards. Could the CP2102N in
> > the board in question be configured differently in EEPROM?
> I would be surprised if the EEPROM of the failing devices were
> customized, but I'm not sure how to prove that there weren't modified.
> The CP2102N seems to identify with the default VID/PID, so that's
> evidence supporting the theory that it's not been modified.

It could be some other setting. I guess we could read out the entire
configuration blob and compare it to that of a working CP2102N just to
be sure.

> Now I upgraded to kernel 5.12.8 (after the bug) and when I plug in the
> device I get:

> 5.12.8: Before trying to flash the ESP32 using the CP2102N:
> $ stty -F /dev/ttyUSB0 -a
> speed 9600 baud; rows 0; columns 0; line = 0;
> intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>;
> eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z;
> rprnt = ^R; werase = ^W; lnext = ^V; discard = ^O; min = 1; time = 0;
> -parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
> -ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl
> ixon -ixoff -iuclc -ixany -imaxbel -iutf8
> opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
> isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop
> -echoprt echoctl echoke -flusho -extproc
> 
> 5.12.8: Debug logs as a result of above stty command:
> [  507.773433] cp210x ttyUSB0: cp210x_change_speed - setting baud rate to 9600
> [  507.774216] cp210x ttyUSB0: cp210x_set_flow_control - ctrl = 0x00,
> flow = 0x01
> [  507.774450] cp210x ttyUSB0: cp210x_tiocmset_port - control = 0x0303
> [  507.774673] cp210x ttyUSB0: failed set request 0x7 status: -32
> [  507.775273] cp210x ttyUSB0: cp210x_tiocmset_port - control = 0x0300
> [  507.775454] cp210x ttyUSB0: failed set request 0x7 status: -32
> 
> 5.12.8: Debugs logs as a result of FAILED programming of ESP32:
> [ 1385.733008] cp210x ttyUSB0: cp210x_change_speed - setting baud rate to 9600
> [ 1385.733899] cp210x ttyUSB0: cp210x_set_flow_control - ctrl = 0x00,
> flow = 0x01
> [ 1385.734165] cp210x ttyUSB0: cp210x_tiocmset_port - control = 0x0303
> [ 1385.734391] cp210x ttyUSB0: failed set request 0x7 status: -32
> [ 1385.735014] cp210x ttyUSB0: cp210x_set_flow_control - ctrl = 0x01,
> flow = 0x40
> [ 1385.735187] cp210x ttyUSB0: cp210x_tiocmset_port - control = 0x0101
> [ 1385.735316] cp210x ttyUSB0: cp210x_tiocmset_port - control = 0x0202
> [ 1385.735558] cp210x ttyUSB0: failed set request 0x7 status: -32
> [ 1385.735817] cp210x ttyUSB0: cp210x_tiocmset_port - control = 0x0300
> [ 1385.736082] cp210x ttyUSB0: failed set request 0x7 status: -32

Thanks a lot for testing this. You seem to have the same issue as the
one reported by Alex here a fews days after you:

	https://lore.kernel.org/r/465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com

let's keep discussing in that thread. I added you on CC.

> 5.12.8: After failed programming:
> $ stty -F /dev/ttyUSB0 -a
> speed 9600 baud; rows 0; columns 0; line = 0;
> intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>;
> eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z;
> rprnt = ^R; werase = ^W; lnext = ^V; discard = ^O; min = 0; time = 0;
> -parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
> -ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl
> -ixon -ixoff -iuclc -ixany -imaxbel -iutf8
> -opost -olcuc -ocrnl -onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0
> bs0 vt0 ff0
> -isig -icanon -iexten -echo -echoe -echok -echonl -noflsh -xcase
> -tostop -echoprt -echoctl -echoke -flusho -extproc
> 
> 
> It appears that in the 5.12.8 kernel, there is a failure every time
> cp210x_tiocmset_port is called resulting from this:
> ret = cp210x_write_u16_reg(port, CP210X_SET_MHS, control);

Indeed. Alex bisected it down to a commit setting the default IXOFF
thresholds. Not sure why that would cause the device to misbehave yet,
but we may need to stick with the default settings for CP2102N if we
can't figure it out.

Johan
