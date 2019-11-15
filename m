Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70639FDA42
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 11:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfKOKBB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 05:01:01 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36023 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfKOKBB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 05:01:01 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so934051lff.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 02:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=aI3XAisZ0RwDXU3PtqUoyInzdUMHVxaktihfO0T2zQc=;
        b=CDIPyK4o0xg04wld6G0AQ7M+rq02B8PkG4F2KH1g5lp1i7W8ApKZH0VuKczYhvAuw0
         tNdMFl1oEIg53UYqSfSxioGHFGXOzKK6kXmU62OMJM/5/or06Wx5iuyFs9r7kCBKjdmH
         KeZsHuMmxR19XL1tn7+ptPYSgTXlR8x5qGzUS5aP4u2okmZZThEYzUjRddKfLavriLoc
         Y7lb69AszobaD4Ut9JXZCbY1KNSHSsrLE7wKu82xMgGVxZ4j+PVJLU2GqUXCHkwBfr/F
         P2dUvY8x1cqIbK3O+LYd+14fM1MYZNFac/7f9rzSM3Bh3pTyeFXDHAGvuf8Q+BwY2cd3
         K/XA==
X-Gm-Message-State: APjAAAUz8u7qYgUkYRfRbMpSMyfwgSdJPlQCRPoSVGXp36ihfCJBAAcO
        q09YIwaIOJFMTOXgqanq2gY=
X-Google-Smtp-Source: APXvYqzqJOINNz7RlC46TTcNFGcrMkmULpA6YsSKEmyyrNyb5r4DKwHrMGEbIkb2cAg0afZlPoPPUQ==
X-Received: by 2002:ac2:484a:: with SMTP id 10mr10170742lfy.80.1573812059442;
        Fri, 15 Nov 2019 02:00:59 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id u7sm4122210lfg.65.2019.11.15.02.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 02:00:58 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iVYPd-0005HQ-38; Fri, 15 Nov 2019 11:01:09 +0100
Date:   Fri, 15 Nov 2019 11:01:09 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.5-rc1
Message-ID: <20191115100109.GA20249@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:

  Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.5-rc1

for you to fetch changes up to c1a1f273d0825774c80896b8deb1c9ea1d0b91e3:

  USB: serial: ftdi_sio: add device IDs for U-Blox C099-F9P (2019-11-14 18:55:31 +0100)

----------------------------------------------------------------
USB-serial updates for 5.5-rc1

Here are the USB-serial updates for 5.5-rc1, including:

 - support for a new class of pl2303 devices
 - improved divisor calculations for ch341
 - fixes for a remote-wakeup bug in the moschip drivers
 - improved device-type handling in mos7840
 - various cleanups of mos7840

Included are also some new device ids.

All have been in linux-next with no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Aleksander Morgado (2):
      USB: serial: option: add support for DW5821e with eSIM support
      USB: serial: option: add support for Foxconn T77W968 LTE modules

Charles Yeh (1):
      USB: serial: pl2303: add support for PL2303HXN

Fabio D'Urso (1):
      USB: serial: ftdi_sio: add device IDs for U-Blox C099-F9P

Johan Hovold (14):
      USB: serial: ch341: reimplement line-speed handling
      USB: serial: mos7720: fix remote wakeup
      USB: serial: mos7840: fix remote wakeup
      USB: serial: mos7840: clean up device-type handling
      USB: serial: mos7840: document MCS7810 detection hack
      USB: serial: mos7840: fix probe error handling
      USB: serial: mos7840: rip out broken interrupt handling
      USB: serial: mos7840: drop redundant urb context check
      USB: serial: mos7840: drop paranoid port checks
      USB: serial: mos7840: drop paranoid serial checks
      USB: serial: mos7840: drop serial struct accessor
      USB: serial: mos7840: drop port driver data accessors
      USB: serial: mos7840: drop read-urb check
      USB: serial: mos7840: drop port open flag

Pavel Löbl (1):
      USB: serial: mos7840: add USB ID to support Moxa UPort 2210

 drivers/usb/serial/ch341.c        |  97 +++--
 drivers/usb/serial/ftdi_sio.c     |   3 +
 drivers/usb/serial/ftdi_sio_ids.h |   7 +
 drivers/usb/serial/mos7720.c      |   4 -
 drivers/usb/serial/mos7840.c      | 762 +++++---------------------------------
 drivers/usb/serial/option.c       |   7 +
 drivers/usb/serial/pl2303.c       | 124 +++++--
 drivers/usb/serial/pl2303.h       |   6 +
 8 files changed, 300 insertions(+), 710 deletions(-)
