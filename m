Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1018C162B47
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 18:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgBRREo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 12:04:44 -0500
Received: from laas.laas.fr ([140.93.0.15]:48372 "EHLO laas.laas.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbgBRREo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 12:04:44 -0500
X-Greylist: delayed 891 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 Feb 2020 12:04:43 EST
Received: from beetle.laas.fr (beetle.laas.fr [IPv6:2001:660:6602:4:4a4d:7eff:fee1:650a])
        by laas.laas.fr (8.16.0.21/8.16.0.29) with SMTP id 01IGmwj4022044;
        Tue, 18 Feb 2020 17:48:58 +0100 (CET)
Received: by beetle.laas.fr (sSMTP sendmail emulation); Tue, 18 Feb 2020 17:48:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24140.5498.228141.264272@beetle.laas.fr>
Date:   Tue, 18 Feb 2020 17:48:58 +0100
From:   Anthony Mallet <anthony.mallet@laas.fr>
To:     Oliver Neukum <oneukum@suse.com>
CC:     linux-usb@vger.kernel.org
Subject: usb cdc-acm TIOCSSERIAL may wrongly report EPERM
X-Mailer: VM 8.2.0b under 25.2.2 (x86_64-pc-linux-gnu)
Organization: LAAS/CNRS - Toulouse - France
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

A TIOCSSERIAL ioctl(2) performed on a file descriptor corresponding to
a cdc-acm driver may wrongly report EPERM even when no CAP_SYS_ADMIN
is required. This concerns almost all recent kernel versions, as I
explain below.

This happens line 921 of file cdc-acm.c
https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L921
with for instance the following pseudo-code snippet when it is run as a
non CAP_SYS_ADMIN user. The code does not try to change anything but
EPERM might still be returned in some configurations (in particular
with CONFIG_HZ = 250):

    struct serial_struct s;
    int fd;
    int e;

    e = ioctl(fd, TIOCGSERIAL, &s);
    if (e != 0) abort();
    e = ioctl(fd, TIOCSSERIAL, &s);
    if (e != 0) printf("wrong EPERM report\n");

The issue is caused by the rounding to 10 (integer division or
multiplication) of the closing_wait and close_delay members of the
struct serial_struct information, lines 899 and 912 of the file
cdc-acm.c:
https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L899
https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L912

By default, tty_port_init() initializes those parameters to a multiple
of HZ. For instance in line 69 of tty_port.c:
   port->close_delay = (50 * HZ) / 100;
https://github.com/torvalds/linux/blob/master/drivers/tty/tty_port.c#L69

With e.g. CONFIG_HZ = 250 (as this is the case for Ubuntu 18.04
linux-image-4.15.0-37-generic), the default setting for close_delay is
thus 125.

When ioctl(fd, TIOCGSERIAL, &s) is executed, the setting returned in
user space is '12' (125/10). When ioctl(fd, TIOCSSERIAL, &s) is then
executed with the same setting '12', the value is interpreted as '120'
which is different from the current setting and a EPERM error may be
raised by set_serial_info() if !CAP_SYS_ADMIN.
https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L919

This is particularly misleading for doing proper error handling when
trying to set another setting, like e.g. the ASYNC_LOW_LATENCY flag
which is not supported by the driver and should thus report EOPNOTSUPP
as expected from the line 923 of cdc-acm.c:
https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L923

The fix might be to just round the default values to a multiple of 10
in the intialization part, like right after line 1301 of file cdc-acm.c
https://github.com/torvalds/linux/blob/master/drivers/usb/class/cdc-acm.c#L1301
If a patch is needed to clarify my point, I can of course provide one.

Cheers,
Anthony Mallet
