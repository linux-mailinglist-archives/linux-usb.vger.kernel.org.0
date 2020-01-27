Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D411D149FE0
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 09:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgA0I3R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 03:29:17 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34242 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgA0I3R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jan 2020 03:29:17 -0500
Received: by mail-lj1-f195.google.com with SMTP id x7so9649282ljc.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2020 00:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7Ixi3iVJvjBw8edlXpkFpc1CxXFIElI3oJmIC2hrbDg=;
        b=BWNKUGFEhQmJA7fmAC5Tlt7fOIOPYRAduxiMS/szGPsjADyQkRlegyS0eP5JmO7QNK
         bYrTZq/e1pfRYSCHALCzvwYfiUJVPv5ApUuVOgJWAnvHhDSul6GQbV9BihDkkI65OWzS
         wPLAfIWJaxHk0GhfjCgFXdB54QStmO5i4Grdrn3zOrdJb/lSgs/Gxm5B9gkobw1/YnyT
         +vvgWh84ridTDzHYuKXwZQPkUFSYpQaKbFTbqWHqvHfJsN63x2LlmvPkSmrSCa1TXAZa
         Pika8wfYYyHKoWHkapF8YQameeGUUTr8CwgHxfY63+g6LJDklfgM7wcw8C1E5za/pliq
         w1yg==
X-Gm-Message-State: APjAAAW4ZPCRTn2KOwSolf4QaUlSKj4jg5XsaPm9XQU2nWUsuRgxYeZz
        S1zbjrWEKDVNME7g0rAr5yPJ4grX
X-Google-Smtp-Source: APXvYqyLPeCIX8K2OuDbWjwZj1o92ldoR1Y0pUNdkKKSP9avt7nk3otB2iv3/UwQQFuAq3Q4wwlNmg==
X-Received: by 2002:a2e:9692:: with SMTP id q18mr9493179lji.177.1580113755038;
        Mon, 27 Jan 2020 00:29:15 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id b64sm7674370lfg.7.2020.01.27.00.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 00:29:14 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ivzlj-0002Vx-9Y; Mon, 27 Jan 2020 09:29:15 +0100
Date:   Mon, 27 Jan 2020 09:29:15 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.6-rc1
Message-ID: <20200127082915.GA9636@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:

  Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.6-rc1

for you to fetch changes up to 19c64e7354e50d19e7b5ddf94bfb5fa24d69594c:

  USB: serial: cyberjack: fix spelling mistake "To" -> "Too" (2020-01-23 09:14:52 +0100)

----------------------------------------------------------------
Here are the USB-serial updates for 5.6-rc1, including:

 - a missing ir-usb endpoint sanity check
 - fixes for two long-standing regressions in ir-usb
 - opticon chars_in_buffer support

Included are also various clean ups.

All have been in linux-next with no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Colin Ian King (1):
      USB: serial: cyberjack: fix spelling mistake "To" -> "Too"

Gustavo A. R. Silva (1):
      USB: serial: garmin_gps: Use flexible-array member

Johan Hovold (7):
      USB: serial: opticon: add chars_in_buffer() implementation
      USB: serial: opticon: stop all I/O on close()
      USB: serial: ir-usb: add missing endpoint sanity check
      USB: serial: ir-usb: fix link-speed handling
      USB: serial: ir-usb: fix IrLAP framing
      USB: serial: ir-usb: make set_termios synchronous
      USB: serial: ir-usb: simplify endpoint check

 drivers/usb/serial/cyberjack.c  |   2 +-
 drivers/usb/serial/garmin_gps.c |   2 +-
 drivers/usb/serial/ir-usb.c     | 185 +++++++++++++++++++++++++---------------
 drivers/usb/serial/opticon.c    |  61 +++++++++----
 include/linux/usb/irda.h        |  13 ++-
 5 files changed, 172 insertions(+), 91 deletions(-)
