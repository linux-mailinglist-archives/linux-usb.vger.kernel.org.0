Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F29EF3FC57D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 12:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240907AbhHaKPH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 06:15:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:57140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240855AbhHaKPH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Aug 2021 06:15:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 776CA60F91;
        Tue, 31 Aug 2021 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630404852;
        bh=KPzIm1z3ky3vkzx9TJGTllQ8fK86500cOGtHZD5Kv2s=;
        h=Date:From:To:Cc:Subject:From;
        b=QF7kLuY7W0ktJsQJshQi4ost8P9fh00iWjrgw5r9epbgRqys728XnEizujd2l8PJK
         TDjaGS5wMy79Ii/X3AV9+VA/l3GQllvFkXIttqEUH5yuv1K8Sp3jAIXrjgSc2M/eP/
         w/mqYHQQh/2hDsY7h0xklEGxnvxNPXcHUhNVgIN+sKtr9MB2q4F5Y1bL/OwTQNgiT1
         PMgc7GbVgL2SGy1R7axFFeC0t+BgB1vYk++NQW1hoTOKnR+cjsRnDggx6aUptyj2PB
         fK8yJNNA4jAO3Noy5H9KojGSbLm+f+m2Xw+eNO1znS2qGO34jP6/4XZtk7qTIh66+I
         FcN81SYjSnghw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mL0mL-0007kQ-Po; Tue, 31 Aug 2021 12:14:05 +0200
Date:   Tue, 31 Aug 2021 12:14:05 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.15-rc1
Message-ID: <YS4A7ZJYrhRXb+PN@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit ff1176468d368232b684f75e82563369208bc371:

  Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.15-rc1-2

for you to fetch changes up to a65ab973c1669d3edc27719527bb3906f7b09918:

  USB: serial: replace symbolic permissions by octal permissions (2021-08-26 09:38:27 +0200)

----------------------------------------------------------------
USB-serial updates for 5.15-rc1

Here are the USB serial updates for 5.15-rc1, including:

 - a couple of fixes for cp210x termios error handling
 - retrieval of fw revisions for more cp210x types
 - a switch to octal permissions for all module-parameter definitions

Included are also various clean ups.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Johan Hovold (7):
      USB: serial: io_edgeport: drop unused descriptor helper
      USB: serial: cp210x: fix control-characters error handling
      USB: serial: cp210x: fix flow-control error handling
      USB: serial: cp210x: clean up control-request timeout
      USB: serial: cp210x: clean up set-chars request
      USB: serial: cp210x: clean up type detection
      USB: serial: cp210x: determine fw version for CP2105 and CP2108

Utkarsh Verma (1):
      USB: serial: replace symbolic permissions by octal permissions

 drivers/usb/serial/cp210x.c      | 77 +++++++++++++++++-----------------------
 drivers/usb/serial/cypress_m8.c  |  6 ++--
 drivers/usb/serial/ftdi_sio.c    |  2 +-
 drivers/usb/serial/garmin_gps.c  |  2 +-
 drivers/usb/serial/io_edgeport.c | 33 -----------------
 drivers/usb/serial/io_ti.c       |  4 +--
 drivers/usb/serial/ipaq.c        |  4 +--
 drivers/usb/serial/iuu_phoenix.c | 10 +++---
 drivers/usb/serial/sierra.c      |  2 +-
 9 files changed, 47 insertions(+), 93 deletions(-)
