Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C29C38C8D3
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 15:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbhEUOAR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 10:00:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232527AbhEUOAM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 10:00:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A779C611AD;
        Fri, 21 May 2021 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621605529;
        bh=claCeMHyK0tw0Pe0bfcZH/ji265i3VrEgqdfE7q0r9Y=;
        h=Date:From:To:Cc:Subject:From;
        b=VejiMzNE/JjO8CmXJxMzSZSvraJ3tzbqVQv/pJy1QTcbIqjSZyXfkx8bFdRSzSlSe
         t0isfCsenO32+0HqLFhfNWTJJnqt09OOkJJo4W5CCXE6qZcf4SLsh3ezPEG9cY1i2F
         A6rnFEkUEZ6g2IKL7ApNPJK4JTk/gNooC/FQGLTq7BEwnmym6o+H3GhnbchzYKc2S3
         twQFkcNotnf8q9FGl2vUeuew0PjFQjR/sSPWI9WdaukuG9iu7izOZtlQEGzYXi7s5k
         nxlD5gq8789Yj3wmO5Zm8AcF06phMnJEAMX4Q9J/ExuM9j3ET/bv43XM4YdwXsQsqa
         PHEAXR9rPYihA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lk5fu-0006ON-Lf; Fri, 21 May 2021 15:58:50 +0200
Date:   Fri, 21 May 2021 15:58:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.13-rc3
Message-ID: <YKe8muaCX1NQmBhi@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.13-rc3

for you to fetch changes up to f8e8c1b2f782e7391e8a1c25648ce756e2a7d481:

  USB: serial: pl2303: add device id for ADLINK ND-6530 GC (2021-05-10 11:15:23 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.13-rc3

Here are some new device ids for various drivers.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Daniele Palmas (1):
      USB: serial: option: add Telit LE910-S1 compositions 0x7010, 0x7011

Dominik Andreas Schorpp (1):
      USB: serial: ftdi_sio: add IDs for IDS GmbH Products

Sean MacLennan (1):
      USB: serial: ti_usb_3410_5052: add startech.com device id

Zolton Jheng (1):
      USB: serial: pl2303: add device id for ADLINK ND-6530 GC

 drivers/usb/serial/ftdi_sio.c         | 3 +++
 drivers/usb/serial/ftdi_sio_ids.h     | 7 +++++++
 drivers/usb/serial/option.c           | 4 ++++
 drivers/usb/serial/pl2303.c           | 1 +
 drivers/usb/serial/pl2303.h           | 1 +
 drivers/usb/serial/ti_usb_3410_5052.c | 3 +++
 6 files changed, 19 insertions(+)
