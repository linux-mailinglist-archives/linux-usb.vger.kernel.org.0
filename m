Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9D6B1417F1
	for <lists+linux-usb@lfdr.de>; Sat, 18 Jan 2020 15:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgAROWy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jan 2020 09:22:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:48652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgAROWy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 18 Jan 2020 09:22:54 -0500
Received: from localhost (170.143.71.37.rev.sfr.net [37.71.143.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C71262469A;
        Sat, 18 Jan 2020 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579357372;
        bh=wPi5zx31z0yN00YU6yYN20ekq7QlhlimDjBgZKv0A7o=;
        h=Date:From:To:Cc:Subject:From;
        b=kJ5N0bXzNU/AVdELNXiPMzzy592YAu9C0pUYOP2rhDktHN19XWF376HqiBrcA5BAJ
         43n7NvuWozIbEkwOYP54H7gLcoOMpJVm2jjeceuZTPrMO0h8iPQmSILY0SR8SLzD2r
         dK3T6V7HDj1jrZNU6LNn0B0o6/fFJ2NBPFEci4NU=
Date:   Sat, 18 Jan 2020 15:22:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for 5.5-rc7
Message-ID: <20200118142250.GA80066@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.5-rc7

for you to fetch changes up to 453495d4e791664e42be2254a6a8acb84b991417:

  Merge tag 'usb-serial-5.5-rc7' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2020-01-17 19:40:06 +0100)

----------------------------------------------------------------
USB driver fixes for 5.5-rc7

Here are some small USB driver and core fixes for 5.5-rc7

There's one fix for hub wakeup issues and a number of small usb-serial
driver fixes and device id updates.

The hub fix has been in linux-next for a while with no reported issues,
and the usb-serial ones have all passed 0-day with no problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Greg Kroah-Hartman (1):
      Merge tag 'usb-serial-5.5-rc7' of https://git.kernel.org/.../johan/usb-serial into usb-linus

Jer�nimo Borque (1):
      USB: serial: simple: Add Motorola Solutions TETRA MTP3xxx and MTP85xx

Johan Hovold (7):
      USB: serial: opticon: fix control-message timeouts
      USB: serial: suppress driver bind attributes
      USB: serial: ch341: handle unbound port at reset_resume
      USB: serial: io_edgeport: handle unbound ports on URB completion
      USB: serial: io_edgeport: add missing active-port sanity check
      USB: serial: keyspan: handle unbound ports
      USB: serial: quatech2: handle unbound ports

Keiya Nobuta (1):
      usb: core: hub: Improved device recognition on remote wakeup

Kristian Evensen (1):
      USB: serial: option: Add support for Quectel RM500Q

Reinhard Speyerer (1):
      USB: serial: option: add support for Quectel RM500Q in QDL mode

 drivers/usb/core/hub.c                 |  1 +
 drivers/usb/serial/ch341.c             |  6 +++++-
 drivers/usb/serial/io_edgeport.c       | 16 +++++++++-------
 drivers/usb/serial/keyspan.c           |  4 ++++
 drivers/usb/serial/opticon.c           |  2 +-
 drivers/usb/serial/option.c            |  6 ++++++
 drivers/usb/serial/quatech2.c          |  6 ++++++
 drivers/usb/serial/usb-serial-simple.c |  2 ++
 drivers/usb/serial/usb-serial.c        |  3 +++
 9 files changed, 37 insertions(+), 9 deletions(-)
