Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD64C1234
	for <lists+linux-usb@lfdr.de>; Sat, 28 Sep 2019 23:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbfI1VNW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Sep 2019 17:13:22 -0400
Received: from ganesha.gnumonks.org ([213.95.27.120]:46923 "EHLO
        ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728742AbfI1VNV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Sep 2019 17:13:21 -0400
X-Greylist: delayed 1258 seconds by postgrey-1.27 at vger.kernel.org; Sat, 28 Sep 2019 17:13:20 EDT
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.89)
        (envelope-from <laforge@gnumonks.org>)
        id 1iEJhV-0002iA-6h
        for linux-usb@vger.kernel.org; Sat, 28 Sep 2019 22:52:21 +0200
Received: from laforge by localhost.localdomain with local (Exim 4.92.2)
        (envelope-from <laforge@gnumonks.org>)
        id 1iEJf9-0007qX-Pl
        for linux-usb@vger.kernel.org; Sat, 28 Sep 2019 22:49:55 +0200
Date:   Sat, 28 Sep 2019 22:49:55 +0200
From:   Harald Welte <laforge@gnumonks.org>
To:     linux-usb@vger.kernel.org
Subject: CREAD ignored by almost all USB serial drivers
Message-ID: <20190928204955.GE4247@nataraja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[Copied on requst from https://bugzilla.kernel.org/show_bug.cgi?id=205033]

It seems that a lot of Linux kernel USB serial device drivers are
ignoring the CREAD setting of termios.c_cflag.

The man page is quite clear:
       CREAD  Enable receiver.

The glibc man page at
https://ftp.gnu.org/old-gnu/Manuals/glibc-2.2.3/html_chapter/libc_17.html
states:
	"Macro: tcflag_t CREAD
	 If this bit is set, input can be read from the terminal.
	 Otherwise, input is discarded when it arrives."

When I mask this bit and then call tcsetattr(), I'm still receiving
input characters, at least on a pl2303 USB UART.  Looking at the source
code of drivers/usb/serial/, the *only* driver appearing to respect
CREAD is digi_acceleport.c.  All others seem to ignore it.  To the
contrary, most classic serial drivers in drivers/tty/serial seem to
implement it.

In absence of low-level support in individual drivers to actually
disable the receiver in hardware, I would have at least expected the
core tty/serial layer to drop/discard any characters received by the
hardware while CREAD is not set.  But that also doesn't appear to be the
case.

What's even more worrying is that the tcsetattr() call succeeds, i.e. it
is a silent error.  I would expect the kernel to either implement the
functionalty in one way or another, or simply return tcsetattr() with
an error if an unsupported combination (i.e. CFLAG not set) is
configured.

This is not a theoretical issue.  Anyone implementing a half-duplex
protocol with shared Rx and Tx line will face the same issue.

Am I missing something here?  Please don't tell me that I just
discovered something that's broken for some 20-odd years, or at the very
least as far as normal linux.git history reaches back :/

Please keep me in Cc of any responses, I'm not subscribed to linux-usb.

Thanks!

Regards,
	Harald
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
