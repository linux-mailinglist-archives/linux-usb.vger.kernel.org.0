Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E92140FA8
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 18:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbgAQRMQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 12:12:16 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34178 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQRMP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 12:12:15 -0500
Received: by mail-lj1-f196.google.com with SMTP id z22so27237334ljg.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2020 09:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=IUB4Gjb44QjoXHpx0ACFHq2Ho+ifyt/Wd2TFHttsyOg=;
        b=Txt9V4U6Yt0oejITLBVRygrHFoWTp8HwsCJg9ed1c+oU/c1EueiL9KOlMdmH0rk1/y
         MF9TCemX3S9pqlIYuvoEHsp4t9z5fl6K7//1a0KDmt61BprXR0Mc6YrxvVQ3goZWG34Y
         nh9hsN2QQwXtJhHK0BgjKB2aAWBzIpiIK5IJf0scuZplLLVKnjPUnU5VP1DngJC1PL0f
         /gdwM8o/jKsGJ5DbCK7hqbVrJAcVO3TNbdmlYoN5F5eD7ylthl8HB0SeTngDw6+56G6U
         eISW7nvh1dq2moM09CxARiGly7gPMupJLl2f4+nT+KmNkCCXOz9DbkX1qQKIq1+bsmaV
         LgTw==
X-Gm-Message-State: APjAAAU3774wNsufC/sFMZGM+OaM7CGieRpgvO7nYQH8ml0IaozZdz7T
        MajKmJBhTosPUYrm1MhG9bLikU3+
X-Google-Smtp-Source: APXvYqyYtTzaFy2b5Q5DqG6O3rxTNG51Rg7QaQrtyEo7qAlaqQ7AO4LBsh8e4WiXqh8bYrgO9WP+Ag==
X-Received: by 2002:a2e:9d90:: with SMTP id c16mr5674700ljj.264.1579281133435;
        Fri, 17 Jan 2020 09:12:13 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id y25sm12327199lfy.59.2020.01.17.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 09:12:12 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1isVAL-0004oe-4z; Fri, 17 Jan 2020 18:12:13 +0100
Date:   Fri, 17 Jan 2020 18:12:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.5-rc7
Message-ID: <20200117171213.GA18463@localhost>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.5-rc7

for you to fetch changes up to 9715a43eea77e42678a1002623f2d9a78f5b81a1:

  USB: serial: quatech2: handle unbound ports (2020-01-17 16:22:59 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.5-rc7

Here are a few fixes for issues related to unbound port devices which
could lead to NULL-pointer dereferences. Notably the bind attributes for
usb-serial (port) drivers are removed as almost none of the drivers can
handle individual ports going away once they've been bound.

Included are also some new device ids.

All but the unbound-port fixes have been in linux-next with no reported
issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Jerónimo Borque (1):
      USB: serial: simple: Add Motorola Solutions TETRA MTP3xxx and MTP85xx

Johan Hovold (7):
      USB: serial: opticon: fix control-message timeouts
      USB: serial: suppress driver bind attributes
      USB: serial: ch341: handle unbound port at reset_resume
      USB: serial: io_edgeport: handle unbound ports on URB completion
      USB: serial: io_edgeport: add missing active-port sanity check
      USB: serial: keyspan: handle unbound ports
      USB: serial: quatech2: handle unbound ports

Kristian Evensen (1):
      USB: serial: option: Add support for Quectel RM500Q

Reinhard Speyerer (1):
      USB: serial: option: add support for Quectel RM500Q in QDL mode

 drivers/usb/serial/ch341.c             |  6 +++++-
 drivers/usb/serial/io_edgeport.c       | 16 +++++++++-------
 drivers/usb/serial/keyspan.c           |  4 ++++
 drivers/usb/serial/opticon.c           |  2 +-
 drivers/usb/serial/option.c            |  6 ++++++
 drivers/usb/serial/quatech2.c          |  6 ++++++
 drivers/usb/serial/usb-serial-simple.c |  2 ++
 drivers/usb/serial/usb-serial.c        |  3 +++
 8 files changed, 36 insertions(+), 9 deletions(-)
