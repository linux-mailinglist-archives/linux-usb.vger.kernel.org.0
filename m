Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFE3B9824
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 21:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfITTzZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 15:55:25 -0400
Received: from mx2a.mailbox.org ([80.241.60.219]:44093 "EHLO mx2a.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726835AbfITTzZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Sep 2019 15:55:25 -0400
X-Greylist: delayed 327 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Sep 2019 15:55:24 EDT
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 374EDA11C3
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 21:49:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id Ajw7Q0nntAdS for <linux-usb@vger.kernel.org>;
        Fri, 20 Sep 2019 21:49:53 +0200 (CEST)
Received: from jgoerzen by hephaestus.lan.complete.org with local (Exim 4.92)
        (envelope-from <jgoerzen@hephaestus.lan.complete.org>)
        id 1iBOud-0005nM-7E
        for linux-usb@vger.kernel.org; Fri, 20 Sep 2019 14:49:51 -0500
References: <87woe37prw.fsf@complete.org>
From:   John Goerzen <jgoerzen@complete.org>
To:     linux-usb@vger.kernel.org
Subject: Linux Keyspan USB serial driver ignoring XOFF
Date:   Fri, 20 Sep 2019 14:49:51 -0500
Message-ID: <87tv967nog.fsf@complete.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have narrowed down the issue I'm about to describe to keyspan.c; a
Digi Edgeport/1 with identical configuration works fine.

I am configuring a Raspberry Pi running 4.19.66 (though keyspan.c hasn't
changed since 2017) to talk to a real-live vt420.  Configuring agetty
with systemd worked easy enough, but I found that XON/XOFF wasn't
working.  stty -a shows ixon and ixoff as appropriate, but sending
Ctrl-S (tested from multiple ways of sending) had no effect on output in
bash, or scrolling output.  (Emacs, though, recognized it as the start
of a search, so I knew it was getting down the line.)


After a great deal of head-scratching on this, I went to look at the
kernel source and found that keyspan.c does not appear to be honoring
XOFF.  I also have a Digi Edgeport/1 on hand (which uses io_ti.c), and
when I swapped to that, everything worked fine - Ctrl-S caused the
expected pause.

As far as I can tell, keyspan.c simply never implemented handling of
XOFF, but you guys are the experts there.

I twiddled many, many settings with stty but could not find anything
that would make it honor xoff/Ctrl-S with the Keyspan.  Even as a
regular user that would use that trick to pause scrolling, it had no
effect.  Different TERM settings also had no effect.

Output of stty -a:

speed 19200 baud; rows 24; columns 80; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>;
eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R;
werase = ^W; lnext = ^V; discard = ^O; min = 1; time = 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon ixoff
-iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon -iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt
echoctl echoke -flusho -extproc

Thanks,

John
