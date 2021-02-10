Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18BE31697E
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 15:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhBJOyM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 09:54:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:41914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231801AbhBJOyI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Feb 2021 09:54:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6825064E70;
        Wed, 10 Feb 2021 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612968806;
        bh=krjMNhlxh4nujdfU5LpPBQzF+MQjR3wrzFBwvG0We08=;
        h=Date:From:To:Cc:Subject:From;
        b=XPbHcYJOxfAZxG24Whp4/PJIPFjllBiEvHqPTv7JBB9QoxXgQPbzzvj8dMhZGW/Mh
         D+CC3QgW7fXStF2IdCfiIn28neF0RJMpRqi/Dkif+nBiEO0XRdduEMtcC0AsVA3F2m
         0TRNamFRGEHhFFkcW83mWlPJI6tn9ucT+VEB0fufH9sBoNf0PGJBlN2XudIr/+s8GB
         qIZ1K6hLFNs0ai3l11vZqSP7astkwFZLjixhFEaEMASez7rW6CPf8A6WDAf8LpwxGz
         X7FgW6T50kuRw1adKr0ofmC42m9VFis9rmJ+HftvSZwyaIgKAuq4OkEKboclnRqlpF
         PBwTeO8LT9rXQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l9qs7-0003u9-Kn; Wed, 10 Feb 2021 15:53:41 +0100
Date:   Wed, 10 Feb 2021 15:53:39 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.12-rc1
Message-ID: <YCPzc8F35NMwRKQu@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are the USB-serial updates for 5.12-rc1.

Note that the new MaxLinear/Exar driver can also be used (with fewer features)
in ACM-mode so this pull-request includes a commit to prevent cdc-acm from
binding when the new driver is enabled.

Johan


The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.12-rc1

for you to fetch changes up to 1542d1324be1191d970f69c55e885af5dd810b84:

  USB: serial: drop bogus to_usb_serial_port() checks (2021-02-09 13:14:30 +0100)

----------------------------------------------------------------
USB-serial updates for 5.12-rc1

Here are the USB-serial updates for 5.12-rc1, including:

 - a line-speed fix for newer pl2303 devices
 - a line-speed fix for FTDI FT-X devices
 - a new xr_serial driver for MaxLinear/Exar devices (non-ACM mode)
 - a cdc-acm blacklist entry for when the xr_serial driver is enabled
 - cp210x support for software flow control
 - various cp210x modem-control fixes
 - an updated ZTE P685M modem entry to stop claiming the QMI interface
 - an update to drop the port_remove() driver-callback return value

Included are also various clean ups.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Dan Carpenter (2):
      USB: serial: mos7840: fix error code in mos7840_write()
      USB: serial: mos7720: fix error code in mos7720_write()

Johan Hovold (32):
      USB: serial: pl2303: fix line-speed handling on newer chips
      USB: serial: cp210x: set IXOFF thresholds
      USB: serial: cp210x: update control-characters on every change
      USB: serial: cp210x: drop short control-transfer checks
      USB: serial: cp210x: drop unused includes
      USB: serial: cp210x: add copyright notice
      USB: serial: mxuport: drop short control-transfer check
      USB: serial: upd78f0730: drop short control-transfer check
      USB: serial: io_ti: drop short control-transfer check
      USB: serial: io_ti: fix a debug-message copy-paste error
      USB: serial: f81232: drop short control-transfer checks
      USB: serial: f81534: drop short control-transfer check
      USB: serial: xr: fix NULL-deref at probe
      USB: serial: xr: fix interface leak at disconnect
      USB: serial: xr: use subsystem usb_device at probe
      USB: serial: xr: use termios flag helpers
      USB: serial: xr: document vendor-request recipient
      USB: serial: xr: clean up line-settings handling
      USB: serial: xr: simplify line-speed logic
      USB: serial: xr: fix gpio-mode handling
      USB: serial: xr: fix pin configuration
      USB: serial: xr: fix B0 handling
      USB: serial: cp210x: suppress modem-control errors
      USB: serial: cp210x: fix modem-control handling
      USB: serial: cp210x: drop shift macros
      USB: serial: cp210x: clean up flow-control debug message
      USB: serial: cp210x: clean up printk zero padding
      USB: serial: cp210x: fix RTS handling
      USB: serial: cp210x: clean up auto-RTS handling
      USB: serial: ftdi_sio: fix FTX sub-integer prescaler
      USB: serial: ftdi_sio: restore divisor-encoding comments
      USB: serial: drop bogus to_usb_serial_port() checks

Lech Perczak (1):
      USB: serial: option: update interface mapping for ZTE P685M

Manivannan Sadhasivam (1):
      USB: serial: add MaxLinear/Exar USB to Serial driver

Mauro Carvalho Chehab (1):
      USB: cdc-acm: ignore Exar XR21V141X when serial driver is built

Tom Rix (1):
      USB: serial: mos7720: improve OOM-handling in read_mos_reg()

Uwe Kleine-König (2):
      USB: serial: drop if with an always false condition
      USB: serial: make remove callback return void

Wang Sheng Long (1):
      USB: serial: cp210x: add support for software flow control

 drivers/usb/class/cdc-acm.c           |   6 +
 drivers/usb/serial/Kconfig            |   9 +
 drivers/usb/serial/Makefile           |   1 +
 drivers/usb/serial/ark3116.c          |   4 +-
 drivers/usb/serial/belkin_sa.c        |   6 +-
 drivers/usb/serial/bus.c              |  27 +-
 drivers/usb/serial/ch341.c            |   4 +-
 drivers/usb/serial/cp210x.c           | 217 +++++++++---
 drivers/usb/serial/cyberjack.c        |   6 +-
 drivers/usb/serial/cypress_m8.c       |   6 +-
 drivers/usb/serial/digi_acceleport.c  |   6 +-
 drivers/usb/serial/f81232.c           |  12 +-
 drivers/usb/serial/f81534.c           |   7 +-
 drivers/usb/serial/ftdi_sio.c         |  27 +-
 drivers/usb/serial/garmin_gps.c       |   3 +-
 drivers/usb/serial/io_edgeport.c      |   6 +-
 drivers/usb/serial/io_ti.c            |  12 +-
 drivers/usb/serial/iuu_phoenix.c      |   4 +-
 drivers/usb/serial/keyspan.c          |   6 +-
 drivers/usb/serial/keyspan_pda.c      |   4 +-
 drivers/usb/serial/kl5kusb105.c       |   6 +-
 drivers/usb/serial/kobil_sct.c        |   6 +-
 drivers/usb/serial/mct_u232.c         |   6 +-
 drivers/usb/serial/metro-usb.c        |   4 +-
 drivers/usb/serial/mos7720.c          |  12 +-
 drivers/usb/serial/mos7840.c          |   8 +-
 drivers/usb/serial/mxuport.c          |   7 -
 drivers/usb/serial/omninet.c          |   6 +-
 drivers/usb/serial/opticon.c          |   4 +-
 drivers/usb/serial/option.c           |   3 +-
 drivers/usb/serial/oti6858.c          |   6 +-
 drivers/usb/serial/pl2303.c           |  12 +-
 drivers/usb/serial/quatech2.c         |   4 +-
 drivers/usb/serial/sierra.c           |   4 +-
 drivers/usb/serial/spcp8x5.c          |   4 +-
 drivers/usb/serial/ssu100.c           |   4 +-
 drivers/usb/serial/symbolserial.c     |   4 +-
 drivers/usb/serial/ti_usb_3410_5052.c |   6 +-
 drivers/usb/serial/upd78f0730.c       |   9 +-
 drivers/usb/serial/usb-wwan.h         |   2 +-
 drivers/usb/serial/usb_wwan.c         |   4 +-
 drivers/usb/serial/whiteheat.c        |   6 +-
 drivers/usb/serial/xr_serial.c        | 611 ++++++++++++++++++++++++++++++++++
 include/linux/usb/serial.h            |   2 +-
 44 files changed, 888 insertions(+), 225 deletions(-)
 create mode 100644 drivers/usb/serial/xr_serial.c
