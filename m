Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546411E769E
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 09:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgE2H2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 03:28:10 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46417 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgE2H2J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 03:28:09 -0400
Received: by mail-lj1-f193.google.com with SMTP id z6so1305131ljm.13
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 00:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tySLNHL5+uK/FpzLVPMtcO/CuZWp6dbHZ1RpLGUnWtY=;
        b=WkMSHg4fRxwGZUNOe1S2rrd2KJVKOC49FdK/vBT5mOjeu9tU/dIYGwLGcJyxodz14d
         oPhRUET8qaRflMQxhzM0WHO1NO+Y1Ve62AmYOm4hcOeynohJ6niowtyNb3IEXMvvlpwj
         xE4Yovekgc/iXphUCik8EcnB8PQfm1wG+s4I4Q3xIBcNYPVhdxcK5VAyj4C3Ch3XyLKH
         rpONd5XHBcuJbYrbZ59bvXWJX1/RcEGDhz/J6YyCi5NeOGiRzf/BSb7dgsl64whaGaKE
         q50Xf8uGFM4TlUscKeI8D/cYSQrJPDqwBY9KUQC9J/GElAL60vKLCW3sylKvHpi4RJxx
         0dlw==
X-Gm-Message-State: AOAM530RiY9UN0MRQokNANWSBULRrZXL4ZNyjkfQL1JpJbXXQbTmF0Cy
        lhKDHH6Q3cwE+jpgO8cRovblcCZh
X-Google-Smtp-Source: ABdhPJxyY/6h0muUiIzGJekWT+S5GwWELAIggHxVj4w5cb7MhVoIKmjEBlyLTIBDa19wwO3Gd0+Nfg==
X-Received: by 2002:a2e:5712:: with SMTP id l18mr1179346ljb.87.1590737287234;
        Fri, 29 May 2020 00:28:07 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f10sm2089932lfm.34.2020.05.29.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 00:28:06 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeZQw-0003GV-8r; Fri, 29 May 2020 09:28:02 +0200
Date:   Fri, 29 May 2020 09:28:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.8-rc1
Message-ID: <20200529072802.GA12532@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.8-rc1

for you to fetch changes up to c432df155919582a3cefa35a8f86256c830fa9a4:

  USB: serial: ch341: fix lockup of devices with limited prescaler (2020-05-27 15:01:05 +0200)

----------------------------------------------------------------
USB-serial updates for 5.8-rc1

Here are the USB-serial updates for 5.8-rc1, including:

 - a SPDX comment-style clean up
 - a fix usb_wwan modem drivers which could end up resubmitting the
   their read URBs in a tight loop on disconnect
 - a regression fix for a subset of quirky ch341 devices which would
   lock up on certain low line speeds when using the new divisor
   algorithm

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Bin Liu (1):
      USB: serial: usb_wwan: do not resubmit rx urb on fatal errors

Johan Hovold (1):
      USB: serial: ch341: fix lockup of devices with limited prescaler

Michael Hanselmann (1):
      USB: serial: ch341: add basis for quirk detection

Nishad Kamdar (1):
      USB: serial: Use the correct style for SPDX License Identifier

 drivers/usb/serial/belkin_sa.h   |  2 +-
 drivers/usb/serial/ch341.c       | 68 ++++++++++++++++++++++++++++++++++++++--
 drivers/usb/serial/io_16654.h    |  2 +-
 drivers/usb/serial/io_edgeport.h |  2 +-
 drivers/usb/serial/io_ionsp.h    |  2 +-
 drivers/usb/serial/io_ti.h       |  2 +-
 drivers/usb/serial/io_usbvend.h  |  2 +-
 drivers/usb/serial/iuu_phoenix.h |  2 +-
 drivers/usb/serial/mct_u232.h    |  2 +-
 drivers/usb/serial/oti6858.h     |  2 +-
 drivers/usb/serial/pl2303.h      |  2 +-
 drivers/usb/serial/usb_wwan.c    |  4 +++
 drivers/usb/serial/visor.h       |  2 +-
 drivers/usb/serial/whiteheat.h   |  2 +-
 14 files changed, 81 insertions(+), 15 deletions(-)
