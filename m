Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72AA26B9A6
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 04:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgIPCGz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 22:06:55 -0400
Received: from freecalypso.org ([195.154.163.71]:32914 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgIPCGy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 22:06:54 -0400
Received: by freecalypso.org (Postfix, from userid 1001)
        id EFCDA374023F; Wed, 16 Sep 2020 01:56:21 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio quirks
Message-Id: <20200916015621.EFCDA374023F@freecalypso.org>
Date:   Wed, 16 Sep 2020 01:56:21 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Johan,

This patch series adds support for a family of FTDI-based devices that
need special quirks in the ftdi_sio driver.  The devices in question
are produced by my hobby company Falconia Partners LLC, and I got a
block of PIDs from FTDI (from their VID), so I assign custom USB IDs
when I program FT2232 EEPROMs on my boards.  These custom USD IDs are
intended to facilitate conditionalized quirks in the ftdi_sio driver,
as implemented in this patch series.

The 3 devices (3 USB IDs) for which this patch series adds support
consist of two JTAG+UART adapters and one dual UART adapter.  Support
for the two JTAG+UART adapters consists of nothing more than adding
them to the USB ID table with the already existing ftdi_jtag_quirk
applied, but the dual UART adapter (DUART28C) is more involved.

The special quirk with DUART28C is that FT2232D BDBUS2 and BDBUS4
outputs (which would normally be Channel B RTS and DTR, respectively)
have been repurposed to drive power and reset controls to Calypso
targets, and these power and reset controls must not be triggered
on their own - instead their control needs to be left to special
userspace applications.  The problem is that the standard behaviour
of all tty devices under Linux (not just ftdi_sio and not just USB
serial, but apparently all ttys) is that DTR and RTS are always
unconditionally asserted as soon as the tty device (ttyUSB in the
present case) is opened, and userspace does not get a chance to
intervene.  It is not my place to debate whether this behaviour is
good or not for true serial ports where DTR/RTS really are DTR/RTS,
but it is a total killer for non-standard hardware where the USB to
serial chip's DTR & RTS outputs have been repurposed to do something
disruptive like power and reset control.

The solution that works beautifully in my own hardware lab is contained
in the present patch series: the new DUART28C-specific quirk simply
suppresses automatic assertion of DTR&RTS for Channel B on this device.
Userspace can then trigger PWON and RESET actions as needed with
TIOCMBIS ioctls (followed by a delay and TIOCMBIC to make a pulse),
and everything works beautifully.  If I could get this DUART28C quirk
(conditionalized on the USB ID which FTDI officially allocated to me)
mainlined, it would spare my users the pain of having to apply this
patch themselves locally.

TIA,
Mychaela

Mychaela N. Falconia (3):
  USB: serial: ftdi_sio: add support for FreeCalypso JTAG+UART adapters
  USB: serial: ftdi_sio: pass port to quirk port_probe functions
  USB: serial: ftdi_sio: add support for FreeCalypso DUART28C adapter

 drivers/usb/serial/ftdi_sio.c     | 72 +++++++++++++++++++++++++++++++++------
 drivers/usb/serial/ftdi_sio_ids.h |  8 +++++
 2 files changed, 70 insertions(+), 10 deletions(-)

-- 
2.9.0

base-commit: 2bb70f0a4b238323e4e2f392fc3ddeb5b7208c9e
