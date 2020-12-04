Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C82E2CECD9
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 12:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgLDLO7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 06:14:59 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41866 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbgLDLO7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 06:14:59 -0500
Received: by mail-lf1-f65.google.com with SMTP id r24so7114973lfm.8
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 03:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=b8h0a1wBM7kods/PLLfUGVT30t9au4Cw1gE/Cx1FTaE=;
        b=JrRdcauOCrELjVOeeuEZDQSqQdS89/LxiErzebaTsY17iawRnGYRroEp+xwVuNNpYr
         7mUaQUjG4VW4ExF2E6U8h/ZvVMDzLy1BNtNnwDKSm1X6wPqi5YgE4TVk/SxtqA3mTPzm
         /O7EwKuzBmmKJVzWT6hj9UlVLCPycscM3hPOdoSIKMFyeM8n8PCyRJZFZlBEr2n8wG1H
         HaEqp2jzuADuCdF0ZLlaLJxJIptoTi67jrgyDJb5eDsu+8F446bE3XNZ7qv6WsKH141r
         ni4HCg6hYKp3V59SZYtnMMpjSQin1NO44rvsY0RoJxVdvB7dNk/XCqs1Ep3O6xReucrv
         OxjQ==
X-Gm-Message-State: AOAM5318rqVk56360hO36lzX/YiHiNppiHOdbSznT2uxmpCYYlghiKmP
        OK8ZmJJJG4vj3YjqZCQSopHeJxXjh89lYQ==
X-Google-Smtp-Source: ABdhPJwEZxvc02zGXsuA6/qmyB+tC7hg1rIPziPR9H7h6XBp9J2JK93/bk3KVS9/aN/pwAg6Q2YMvw==
X-Received: by 2002:a19:c301:: with SMTP id t1mr2780887lff.105.1607080451539;
        Fri, 04 Dec 2020 03:14:11 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id b18sm1582177ljp.124.2020.12.04.03.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 03:14:10 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kl92y-0006sb-QS; Fri, 04 Dec 2020 12:14:44 +0100
Date:   Fri, 4 Dec 2020 12:14:44 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.10-rc7
Message-ID: <X8oaJPqNvhGB/2Sd@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.10-rc7

for you to fetch changes up to 3f203f057edfcf6bd02c6b942799262bfcf31f73:

  USB: serial: kl5kusb105: fix memleak on open (2020-12-04 12:02:57 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.10-rc7

Here's a fix for a regression in the option driver which has been
backported to the stable trees and fix for a small memory leak on open
in the kl5kusb105 driver.

Included are also various new device ids.

All but the memleak fix has been in linux-next and with no reported
issues.

----------------------------------------------------------------
Bjørn Mork (1):
      USB: serial: option: fix Quectel BG96 matching

Giacinto Cifelli (1):
      USB: serial: option: add support for Thales Cinterion EXS82

Jan-Niklas Burfeind (1):
      USB: serial: ch341: add new Product ID for CH341A

Johan Hovold (2):
      USB: serial: ch341: sort device-id entries
      USB: serial: kl5kusb105: fix memleak on open

Vincent Palatin (1):
      USB: serial: option: add Fibocom NL668 variants

 drivers/usb/serial/ch341.c      |  5 +++--
 drivers/usb/serial/kl5kusb105.c | 10 ++++------
 drivers/usb/serial/option.c     | 10 ++++++----
 3 files changed, 13 insertions(+), 12 deletions(-)
