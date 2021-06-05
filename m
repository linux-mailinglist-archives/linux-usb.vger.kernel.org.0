Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC7339C776
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 12:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhFEKgZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Jun 2021 06:36:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:45250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229902AbhFEKgZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 5 Jun 2021 06:36:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78E95610C8;
        Sat,  5 Jun 2021 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622889277;
        bh=h/ElayLHONA8i7FarTJeF85/L++75WVU5aLpQ1GBOA8=;
        h=Date:From:To:Cc:Subject:From;
        b=PXTd1l+u5EV/0TUVxAAzqywEtWpr8yBgKozFB99lG7J/X1r7zskoDyOblyq6JPD8+
         z7Do1H0MW+EUsOtwgI0IgXZ7LZZYxXAN4df97jnePCp5ZSoWge9hXE4IY305SMobNB
         WLuzn0Vl/HFKM8lEKfzyLB7YvfsxhzTat7LDUfdzVbOzgVy0qEDVb5C4b2liJc5NTw
         YslQl6nCt5bsXsBFSTtHtXK6FS2nKUb3lzEFSUnC0qeEhBkefqS/IzHw4q4emUv8Mg
         Z07ublYg4RevsXQ5IFfgZGReiinpp3/aTieY0blA8bwX77Qk+qJU4q9K96Dkugvz0E
         rOw39oJVSI9cg==
Received: from johan by xi with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lpTdR-0007bc-Tz; Sat, 05 Jun 2021 12:34:33 +0200
Date:   Sat, 5 Jun 2021 12:34:33 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.13-rc5
Message-ID: <YLtTOR0H2AU1QATc@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit f8e8c1b2f782e7391e8a1c25648ce756e2a7d481:

  USB: serial: pl2303: add device id for ADLINK ND-6530 GC (2021-05-10 11:15:23 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.13-rc5

for you to fetch changes up to bc96c72df33ee81b24d87eab953c73f7bcc04f29:

  USB: serial: ftdi_sio: add NovaTech OrionMX product ID (2021-06-05 12:26:01 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.13-rc5

Here's a fix for some pipe-direction mismatches in the quatech2 driver,
and a couple of new device ids for ftdi_sio and omninet (and a related
trivial cleanup).

All but the ftdi_sio commit have been in linux-next, and with no
reported issues.

----------------------------------------------------------------
Alexandre GRIVEAUX (2):
      USB: serial: omninet: add device id for Zyxel Omni 56K Plus
      USB: serial: omninet: update driver description

George McCollister (1):
      USB: serial: ftdi_sio: add NovaTech OrionMX product ID

Johan Hovold (1):
      USB: serial: quatech2: fix control-request directions

 drivers/usb/serial/ftdi_sio.c     | 1 +
 drivers/usb/serial/ftdi_sio_ids.h | 1 +
 drivers/usb/serial/omninet.c      | 8 +++++---
 drivers/usb/serial/quatech2.c     | 6 +++---
 4 files changed, 10 insertions(+), 6 deletions(-)
