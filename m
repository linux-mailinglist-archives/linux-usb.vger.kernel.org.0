Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248F71314E
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 17:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfECPgl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 11:36:41 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40158 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfECPgl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 11:36:41 -0400
Received: by mail-lf1-f65.google.com with SMTP id o16so4708223lfl.7
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 08:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=dR3kyFm9Abb8q2X1aNuTXlRWzE8nF0LaC35OZqk5RaI=;
        b=Nbz/ggYab+RMQa2rCamFrAGGHj9y2/ZuzihhkL2+sPINdmZ4QGsrkThKm2sLsQyydJ
         PiXUnzxZ/RnQZ2ecXuBpjaF0dQdFKDqQSWkEm6QkOBDx67pexpDwsm3pDWktuN572vhj
         ynoQaRg9Io/9jZcDY8VnafJEMMBxIMEzcWmNbWujPZhy99+WYu306PBSaGHHMHC3Fa8o
         wL0pgrnUZdCQ5yNr9amK0B5vl+YSvTZlWIRkLerXMmzbqxQ2WWifvudVGdnYGkwerdpb
         NNwpZGspb8hr1jTS2Q1u8zKuaTcVz8C2LYSiZs65Uf/Xd6AZQRDjwXo0yDzucY9B3EOU
         B3ZQ==
X-Gm-Message-State: APjAAAVmLeak51w/kkksDRIODX5FXUdYQFkTfsQlfHfLEPMD7qVSNmFP
        G9J0i43dAzUFwbNrynexTi+a5qOu
X-Google-Smtp-Source: APXvYqxrV6aRb4kJAIgbSGUqoSxrI1jaV4sB1pDP/xaBBBu7Ul3fKB50Xg7fARhRPlWLlQaz43qDQw==
X-Received: by 2002:ac2:4ac2:: with SMTP id m2mr5497349lfp.154.1556897799303;
        Fri, 03 May 2019 08:36:39 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id p4sm452776lji.41.2019.05.03.08.36.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 08:36:38 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hMaF0-0001c9-7x; Fri, 03 May 2019 17:36:50 +0200
Date:   Fri, 3 May 2019 17:36:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.2-rc1
Message-ID: <20190503153650.GA6170@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.2-rc1

for you to fetch changes up to 7f6fc50242d11d4fedab9cf6c5e8af368c076ccd:

  USB: serial: f81232: implement break control (2019-05-03 09:19:55 +0200)

----------------------------------------------------------------
USB-serial updates for 5.2-rc1

Here are the USB-serial updates for 5.2-rc1, including:

 - flow-control related fixes for pl2303
 - fix for an initial-termios issue
 - fix for a couple of unthrottle() races
 - fix for f81232 interrupt-handling issues
 - improved f81232 overrun handling
 - support for higher f81232 line speeds
 - support for f81232 break control

Included are also various clean ups.

All but the last four commits have been in linux-next and with no
reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Greg Kroah-Hartman (1):
      USB: serial: io_edgeport: fix up switch fall-through comments

Ji-Ze Hong (Peter Hong) (4):
      USB: serial: f81232: fix interrupt worker not stop
      USB: serial: f81232: clear overrun flag
      USB: serial: f81232: add high baud rate support
      USB: serial: f81232: implement break control

Johan Hovold (17):
      USB: serial: pl2303: fix non-supported xon/xoff
      USB: serial: pl2303: fix tranceiver suspend mode
      USB: serial: digi_acceleport: clean up modem-control handling
      USB: serial: digi_acceleport: clean up set_termios
      USB: serial: fix initial-termios handling
      USB: serial: ark3116: drop redundant init_termios
      USB: serial: cypress_m8: drop unused driver data flag
      USB: serial: cypress_m8: drop unused termios
      USB: serial: cypress_m8: clean up initial-termios handling
      USB: serial: iuu_phoenix: drop bogus initial cflag
      USB: serial: iuu_phoenix: simplify init_termios
      USB: serial: oti6858: simplify init_termios
      USB: serial: spcp8x5: simplify init_termios
      USB: serial: fix unthrottle races
      USB: serial: clean up throttle handling
      USB: serial: drop unnecessary goto
      USB: serial: drop unused iflag macro

 drivers/usb/serial/ark3116.c         |  11 --
 drivers/usb/serial/cypress_m8.c      |  49 ++-------
 drivers/usb/serial/digi_acceleport.c |  41 ++++----
 drivers/usb/serial/f81232.c          | 198 ++++++++++++++++++++++++++++++++---
 drivers/usb/serial/generic.c         |  76 +++++++-------
 drivers/usb/serial/io_edgeport.c     |  37 +++----
 drivers/usb/serial/iuu_phoenix.c     |   4 +-
 drivers/usb/serial/oti6858.c         |   5 +-
 drivers/usb/serial/pl2303.c          |  58 ++++++++--
 drivers/usb/serial/spcp8x5.c         |   5 +-
 drivers/usb/serial/usb-serial.c      |  11 +-
 include/linux/usb/serial.h           |   8 +-
 12 files changed, 324 insertions(+), 179 deletions(-)
