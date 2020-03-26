Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCE2193CAB
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 11:09:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgCZKJZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 06:09:25 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44921 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbgCZKJY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 06:09:24 -0400
Received: by mail-lj1-f193.google.com with SMTP id p14so5714637lji.11
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 03:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Zg/MaiL/HaSjStIFHDhcn2yLjvUNOVNY0wDQUcFgMWs=;
        b=QXJq1IZcyv9eO4uREtk5TnoqijZ4kkR9f/0lTOuJBayQIcKByQm4ocVkGCoIaxSqTT
         deRefLTGSO/olqBZAXTDRYU/AZDzUVPIrbsPg/BkFdyZ26j/yw+Rib66WZ3Q+JWgKKvf
         6I43WRA6xR2cE/cClptT7piH124xE0Z6oegQjItbw1Vnt9auqOetCEwgmv/eN7ufu90I
         Yk0ercuKwY9rcRZJ+FXButiHWXlpDy/JVOv2cRcsePTJ0TXI5UIbqFU6ZHHhtnHG1l3U
         RYJqN/SlumbT/K2b+w3QHCe1iOSfxHM6ItaWCkBevCnfLFVol/cqx0+AIRc/EYS5D3Ji
         KPKA==
X-Gm-Message-State: AGi0PuYlbMc0t3vbQ9aRJvK1DvcO6+UUoyNUcRE5VvdEJ/CI3ea+ITMN
        fRzoF5H0CM7PN/SvtYUjFeO+wyXR
X-Google-Smtp-Source: APiQypLUBb3eCM4DDIGcW3It8tDYl666QLUJBW/vvI9EcHwUkP3NM7ARqye+Ht/m98gr4rXsLISmnA==
X-Received: by 2002:a2e:88cb:: with SMTP id a11mr2055345ljk.245.1585217362823;
        Thu, 26 Mar 2020 03:09:22 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id 203sm1153465ljf.65.2020.03.26.03.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 03:09:22 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jHPRl-0005Ux-H4; Thu, 26 Mar 2020 11:09:09 +0100
Date:   Thu, 26 Mar 2020 11:09:09 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.7-rc1
Message-ID: <20200326100909.GA21067@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.7-rc1

for you to fetch changes up to 57aa9f294b09463492f604feaa5cc719beaace32:

  USB: serial: io_edgeport: fix slab-out-of-bounds read in edge_interrupt_callback (2020-03-26 10:22:15 +0100)

----------------------------------------------------------------
USB-serial updates for 5.7-rc1

Here are the USB-serial updates for 5.7-rc1, including:

 - support for a new family of Fintek devices
 - fix for an io-edgeport slab-out-of-bounds access
 - fixes for a couple of kernel-doc issues

Included are also various clean ups and some new modem device ids.

All but the io-edgeport fix have been in linux-next with no reported
issues.

----------------------------------------------------------------
Colin Ian King (1):
      USB: serial: digi_acceleport: remove redundant assignment to pointer priv

Ji-Ze Hong (Peter Hong) (6):
      USB: serial: f81232: extract LSR handler
      USB: serial: f81232: add tx_empty function
      USB: serial: f81232: use devm_kzalloc for port data
      USB: serial: f81232: add F81534A support
      USB: serial: f81232: set F81534A serial port with RS232 mode
      USB: serial: f81232: add control driver for F81534A

Johan Hovold (3):
      USB: serial: relax unthrottle memory barrier
      USB: serial: clean up carrier-detect helper
      USB: serial: fix tty cleanup-op kernel-doc

Pawel Dembicki (3):
      USB: serial: option: add support for ASKEY WWHC050
      USB: serial: option: add BroadMobi BM806U
      USB: serial: option: add Wistron Neweb D19Q1

Qiujun Huang (1):
      USB: serial: io_edgeport: fix slab-out-of-bounds read in edge_interrupt_callback

 drivers/usb/serial/digi_acceleport.c |   2 +-
 drivers/usb/serial/f81232.c          | 354 +++++++++++++++++++++++++++++++----
 drivers/usb/serial/generic.c         |  12 +-
 drivers/usb/serial/io_edgeport.c     |   2 +-
 drivers/usb/serial/option.c          |   6 +
 drivers/usb/serial/usb-serial.c      |   2 +-
 6 files changed, 332 insertions(+), 46 deletions(-)
