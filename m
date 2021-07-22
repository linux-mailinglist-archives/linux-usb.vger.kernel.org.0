Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4413D2BCE
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 20:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhGVRhU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 13:37:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:42470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhGVRhU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Jul 2021 13:37:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C33760273;
        Thu, 22 Jul 2021 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626977873;
        bh=uSAbfed6cz76qTaoI3RKRgSMuTsQozGC5gKgkHejcbo=;
        h=Date:From:To:Cc:Subject:From;
        b=UbIkZ45/AF3HKHfhxWef7+XkZKmBJBFJonDFR1ya1VBOXdgVtsuHzXF/MItZD0FJh
         RDo/TpJc2I239Wqj02lf8U1OPvBCbca3BJKugIzdEHOpKrVj7ugifTqPiF0OcCSMAW
         JqSml/nDFtmZRqKhmIjdFSjJ4AAf0KlvOj7kjWGLx5gx+gJp0Np+aTyeN3lqKh00AE
         /xcU6RLi+W6P6umjlBENcKVnD32aBFuZ2mAr5tdQjeVmf6g6/f4WhTRlMD38cT+7uV
         O7JuNQBD00F2iQifoKyqL+Qz+6cDbsAI952xrDJ/KRXUylcI58B5qU0aXzjGD5RLRw
         y/1fWm1IuIL2g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m6dGD-0007KW-Oc; Thu, 22 Jul 2021 20:17:29 +0200
Date:   Thu, 22 Jul 2021 20:17:29 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.14-rc3
Message-ID: <YPm2ORYfoMs60d9f@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.14-rc3

for you to fetch changes up to d6a206e60124a9759dd7f6dfb86b0e1d3b1df82e:

  USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee stick (2021-07-21 18:42:55 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.14-rc3

Here are some new device ids and a device-id comment fix.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Ian Ray (1):
      USB: serial: cp210x: fix comments for GE CS1000

John Keeping (1):
      USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee stick

Marco De Marco (1):
      USB: serial: option: add support for u-blox LARA-R6 family

 drivers/usb/serial/cp210x.c | 5 +++--
 drivers/usb/serial/option.c | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)
