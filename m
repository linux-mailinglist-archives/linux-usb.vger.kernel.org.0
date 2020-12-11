Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993142D7882
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 16:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437546AbgLKPBf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 10:01:35 -0500
Received: from mail-lj1-f177.google.com ([209.85.208.177]:33309 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437535AbgLKPBG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 10:01:06 -0500
Received: by mail-lj1-f177.google.com with SMTP id t22so11246366ljk.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 07:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zK2TKEdWb/LoteO9OH0SzXuoaJ1GYXlZO79q/L9CrQ8=;
        b=edBOQKwMiE9wgZBtXfnhf1jZdMoCIA5xVcqEiwfrJ16cNAr2wWKjow16xmWptN9+se
         ik36ZiYNdZ16xkz4vS2i+f54RUpHjbl5oHaHUhsX5yKslKtJgFB1+WXTrOXgy20rFVPj
         utoNRCmhXJ+UN7ZArv8VyfHGdYJy+moA7yumzt4OPLkmBHdJblESSZw2aV5qQo/nDwMp
         r0peXdC5WihlZIsNfRDAoWiEbUNzZEVSxiaCpl2azj8PkoGtNL4a3e1/U6VH47vX8ZF9
         textMLFwVqYnfiL3n3kvgzOuaDrVkq5dV//wQP5aWC3Rbpuv2g5wIKnM5CImDn18LYlu
         M2bQ==
X-Gm-Message-State: AOAM530VGXllg20ivMXj3LweCIvx5vIRk4no0VbwPCW0ncPscVsXxKBE
        PnUnlSz2DsTRkFsxC9y3dI4MugbiLjjB6A==
X-Google-Smtp-Source: ABdhPJwevmgWNGAYnM+JAblvHoEvwH+cSk3r4hhzyTAjDaE57QECFEDKOufWq55OwauLLJ8BKb93bg==
X-Received: by 2002:a2e:b5ae:: with SMTP id f14mr5535739ljn.491.1607698824343;
        Fri, 11 Dec 2020 07:00:24 -0800 (PST)
Received: from xi.terra (c-d2ade455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.173.210])
        by smtp.gmail.com with ESMTPSA id o26sm645334ljg.55.2020.12.11.07.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 07:00:22 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1knjuA-0003Ys-K0; Fri, 11 Dec 2020 16:00:22 +0100
Date:   Fri, 11 Dec 2020 16:00:22 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.11-rc1
Message-ID: <X9OJhhsZdsQhw5cB@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.11-rc1

for you to fetch changes up to fddd408ad448efc49c67f8dfdc4e86b31c683a0c:

  USB: serial: ftdi_sio: log the CBUS GPIO validity (2020-12-09 18:07:03 +0100)

----------------------------------------------------------------
USB-serial updates for 5.11-rc1

Here are the USB-serial updates for 5.11-rc1, including:

 - keyspan_pda write-implementation fixes
 - digi_acceleport write-wakeup fix
 - mos7720 parport-restore fix
 - mos7720 parport-tasklet removal
 - cp210x termios-handling cleanups
 - option device-flag fix
 - ftdi_sio GPIO CBUS-configuration improvements
 - removal of in_interrupt() uses

Included are also various clean ups.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Ahmed S. Darwish (1):
      USB: serial: digi_acceleport: remove in_interrupt() usage

Davidlohr Bueso (1):
      USB: serial: mos7720: defer state restore to a workqueue

Johan Hovold (24):
      USB: serial: keyspan_pda: fix dropped unthrottle interrupts
      USB: serial: keyspan_pda: fix write deadlock
      USB: serial: keyspan_pda: fix stalled writes
      USB: serial: keyspan_pda: fix write-wakeup use-after-free
      USB: serial: keyspan_pda: fix tx-unthrottle use-after-free
      USB: serial: keyspan_pda: fix write unthrottling
      USB: serial: keyspan_pda: refactor write-room handling
      USB: serial: keyspan_pda: fix write implementation
      USB: serial: keyspan_pda: increase transmitter threshold
      USB: serial: keyspan_pda: add write-fifo support
      USB: serial: keyspan_pda: clean up xircom/entrega support
      USB: serial: keyspan_pda: clean up comments and whitespace
      USB: serial: keyspan_pda: use BIT() macro
      USB: serial: keyspan_pda: drop redundant usb-serial pointer
      USB: serial: digi_acceleport: fix write-wakeup deadlocks
      USB: serial: remove write wait queue
      USB: serial: mos7720: fix parallel-port state restore
      USB: serial: cp210x: return early on unchanged termios
      USB: serial: cp210x: clean up line-control handling
      USB: serial: cp210x: set terminal settings on open
      USB: serial: cp210x: drop flow-control debugging
      USB: serial: cp210x: refactor flow-control handling
      USB: serial: cp210x: clean up dtr_rts()
      USB: serial: option: add interface-number sanity check to flag handling

Marc Zyngier (3):
      USB: serial: ftdi_sio: report the valid GPIO lines to gpiolib
      USB: serial: ftdi_sio: drop GPIO line checking dead code
      USB: serial: ftdi_sio: log the CBUS GPIO validity

Tom Rix (1):
      USB: serial: iuu_phoenix: remove unneeded break

 arch/arm/configs/badge4_defconfig     |   1 -
 arch/arm/configs/corgi_defconfig      |   1 -
 arch/arm/configs/pxa_defconfig        |   1 -
 arch/arm/configs/spitz_defconfig      |   1 -
 arch/mips/configs/mtx1_defconfig      |   1 -
 arch/mips/configs/rm200_defconfig     |   1 -
 arch/powerpc/configs/g5_defconfig     |   1 -
 arch/powerpc/configs/ppc6xx_defconfig |   1 -
 drivers/usb/serial/Kconfig            |  19 +-
 drivers/usb/serial/Makefile           |   1 -
 drivers/usb/serial/cp210x.c           | 499 +++++++------------------------
 drivers/usb/serial/digi_acceleport.c  |  62 ++--
 drivers/usb/serial/ftdi_sio.c         |  23 +-
 drivers/usb/serial/iuu_phoenix.c      |   2 -
 drivers/usb/serial/keyspan_pda.c      | 548 +++++++++++++++-------------------
 drivers/usb/serial/mos7720.c          | 236 +++------------
 drivers/usb/serial/option.c           |  23 +-
 include/linux/usb/serial.h            |   2 -
 18 files changed, 444 insertions(+), 979 deletions(-)
