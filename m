Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC74230B3D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 15:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgG1NPR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 09:15:17 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43963 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729853AbgG1NPQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jul 2020 09:15:16 -0400
Received: by mail-lf1-f66.google.com with SMTP id b11so10980490lfe.10
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2020 06:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=G93FARsoDLq4zfdJ53ax9aGOOBAJbVFcJ+jZqCkry64=;
        b=raNULXNaGExu4vnyOB8amzPsg4BuTx6k0gh+/ieIMTeF097kuyIFDfucNFKA0Tk8KT
         Gct1Jm4xr1pBNIzg3QNNvvwlaoRARsqH8NjxIsgIrvE3i9gsH9IDkIVUPAfaHUucncMO
         OZTzPqqCYJtoU+lb6egwuYVGTyAVrwJk/TxSsZBeipq7pN4fm8PmR3PSIW4NUioQiCon
         PwFlyM2qtxWM4rWywHgI7vacU15Db3ldJa1lu2tKAEnHC0kqJN42U1JSQcx/Bc5K+lVc
         Yeyse05n6x9ihSnePd4vthB9sry1ep9cP+12UC5qkecKwRk2HFsN5MAq5EFXZHbPZPvM
         tBgA==
X-Gm-Message-State: AOAM533gkTXSgjEhVNrzJC0J8Du7g9Dzpd9RZHOJth0sRmK4zNwxfqjV
        Xt4xiJVRfiG/ZRq/mQgpU+I=
X-Google-Smtp-Source: ABdhPJxUHCx+wt/50Xc6S+ksE/dou5skWPKxmno8+FJzv8mVlEfM1iAvO5iyYioLnXaC2rtfHgL6Qw==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr14700027lfl.176.1595942113541;
        Tue, 28 Jul 2020 06:15:13 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 80sm2587768ljf.38.2020.07.28.06.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 06:15:12 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1k0PRk-0003g2-9X; Tue, 28 Jul 2020 15:15:08 +0200
Date:   Tue, 28 Jul 2020 15:15:08 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.9-rc1
Message-ID: <20200728131508.GA14059@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 9cf6ffae380061b16b2b4269d4f2e1a50aa2508a:

  Merge 5.8-rc3 into usb-next (2020-06-29 08:22:27 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.9-rc1

for you to fetch changes up to d2a4309c1ab6df424b2239fe2920d6f26f808d17:

  USB: serial: qcserial: add EM7305 QDL product ID (2020-07-21 09:25:52 +0200)

----------------------------------------------------------------
USB-serial updates for 5.9-rc1

Here are the USB-serial updates for 5.9-rc1, including:

 - console flow-control support
 - simulated line-breaks on some ch341
 - hardware flow-control fixes for cp210x
 - break-detection and sysrq fixes for ftdi_sio
 - sysrq optimisations
 - input parity checking for cp210x

Included are also some new device ids and various clean ups.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Brant Merryman (2):
      USB: serial: cp210x: enable usb generic throttle/unthrottle
      USB: serial: cp210x: re-enable auto-RTS on open

Erik Ekman (1):
      USB: serial: qcserial: add EM7305 QDL product ID

Gustavo A. R. Silva (1):
      USB: serial: use fallthrough pseudo-keyword

Johan Hovold (24):
      USB: serial: ch341: add min and max line-speed macros
      USB: serial: garmin_gps: don't compile unused packet definitions
      USB: serial: iuu_phoenix: drop unused URB submission results
      USB: serial: keyspan_pda: drop unused firmware reset status
      USB: serial: kobil_sct: log failure to update line settings
      USB: serial: quatech2: drop two stub functions
      USB: serial: console: add support for flow control
      USB: serial: ftdi_sio: make process-packet buffer unsigned
      USB: serial: ftdi_sio: clean up receive processing
      USB: serial: ftdi_sio: fix break and sysrq handling
      USB: serial: only set sysrq timestamp for consoles
      USB: serial: only process sysrq when enabled
      USB: serial: inline sysrq dummy function
      USB: serial: add sysrq break-handler dummy
      USB: serial: drop unnecessary sysrq include
      USB: serial: drop extern keyword from function declarations
      USB: serial: drop redundant transfer-buffer casts
      USB: serial: cp210x: disable interface on errors in open
      USB: serial: cp210x: add support for line-status events
      USB: serial: cp210x: add support for TIOCGICOUNT
      USB: serial: cp210x: drop unnecessary packed attributes
      USB: serial: cp210x: use in-kernel types in port data
      USB: serial: sierra: clean up special-interface handling
      USB: serial: iuu_phoenix: fix led-activity helpers

Michael Hanselmann (3):
      USB: serial: ch341: name prescaler, divisor registers
      USB: serial: ch341: simulate break condition if not supported
      USB: serial: ch341: fix missing simulated-break margin

 drivers/usb/serial/aircable.c    |   2 +-
 drivers/usb/serial/ch341.c       | 127 +++++++++++++++++++---
 drivers/usb/serial/console.c     |   5 +-
 drivers/usb/serial/cp210x.c      | 228 +++++++++++++++++++++++++++++++++++++--
 drivers/usb/serial/cypress_m8.c  |   4 +-
 drivers/usb/serial/f81232.c      |   4 +-
 drivers/usb/serial/f81534.c      |   2 +-
 drivers/usb/serial/ftdi_sio.c    |  59 +++++-----
 drivers/usb/serial/garmin_gps.c  |  13 ++-
 drivers/usb/serial/generic.c     |  22 ++--
 drivers/usb/serial/io_edgeport.c |   4 +-
 drivers/usb/serial/iuu_phoenix.c |  26 +++--
 drivers/usb/serial/keyspan_pda.c |   3 +-
 drivers/usb/serial/kobil_sct.c   |   6 +-
 drivers/usb/serial/mxuport.c     |   6 +-
 drivers/usb/serial/option.c      |   3 +-
 drivers/usb/serial/pl2303.c      |   2 +-
 drivers/usb/serial/qcserial.c    |   1 +
 drivers/usb/serial/quatech2.c    |  18 +---
 drivers/usb/serial/sierra.c      |  61 ++++++-----
 drivers/usb/serial/ssu100.c      |   7 +-
 drivers/usb/serial/upd78f0730.c  |   2 +-
 include/linux/usb/serial.h       |  95 ++++++++--------
 23 files changed, 508 insertions(+), 192 deletions(-)
