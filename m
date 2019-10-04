Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9312CBC41
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 15:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388651AbfJDNwL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 09:52:11 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35617 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388438AbfJDNwK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 09:52:10 -0400
Received: by mail-lf1-f68.google.com with SMTP id w6so4555311lfl.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Oct 2019 06:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=QmS89wqQlE9gaUkfPLU9J2JoIJ8YFDUmG8LaPLE5Jg8=;
        b=DoJbGbvRcPUQsVTC9VqbcKD22du6Zwp3azDibjkBjBnP2ZJfV8ezkNMzFQDJfOVHoZ
         CXlVz9kBpVhqFOkI3vSzGWFHqQwScijvXf1iytcI4sChu2maQi813+oqD/Ke2Wm6gfOQ
         anjE7zf9+QLiPh4Lsyd+oX2Ktf8gTZ4BeDeDVJCchIhl4gXbPkJFMLfnQpNQOzTFrBYS
         HhtMpM3kuCkk3GDh0NTXMtcMCUcHTa83E5JeuD4mcArarQWZYp1sRTdUdNV4gMUwumCR
         bNHHADGbpy97y0pCxmXdr3gITdAjiiSuXpReP+lvxkL3Lz/f/EUWo9jI6OsduxMKwPpd
         MeRQ==
X-Gm-Message-State: APjAAAUm2RYMyTOayG6AQlrUJzV6nQCANYLPXHOcYgfFYTW0eBjhk6W5
        7+6ZB/QSteFJRcuoKw4uJUQ=
X-Google-Smtp-Source: APXvYqwIgObvyeZTDp4rfXUSrylrtbMYvCHYv7uhDcFPte8R6M94rtgw8r83JPtU7efG3OFicbVHDg==
X-Received: by 2002:a19:f512:: with SMTP id j18mr9192411lfb.169.1570197128748;
        Fri, 04 Oct 2019 06:52:08 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id o5sm1158334lfn.42.2019.10.04.06.52.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 06:52:08 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iGO0J-00055x-MJ; Fri, 04 Oct 2019 15:52:19 +0200
Date:   Fri, 4 Oct 2019 15:52:19 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.4-rc2
Message-ID: <20191004135219.GA19566@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.4-rc2

for you to fetch changes up to 7d7e21fafdbc7fcf0854b877bd0975b487ed2717:

  USB: serial: keyspan: fix NULL-derefs on open() and write() (2019-10-04 10:57:19 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.4-rc2

Here's a fix for a long-standing issue in the keyspan driver which could
lead to NULL-pointer dereferences when a device had unexpected endpoint
descriptors.

Included are also some new device IDs.

All but the last two commits have been in linux-next with no reported
issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Beni Mahler (1):
      USB: serial: ftdi_sio: add device IDs for Sienna and Echelon PL-20

Daniele Palmas (1):
      USB: serial: option: add Telit FN980 compositions

Johan Hovold (1):
      USB: serial: keyspan: fix NULL-derefs on open() and write()

Reinhard Speyerer (1):
      USB: serial: option: add support for Cinterion CLS8 devices

 drivers/usb/serial/ftdi_sio.c     |  3 +++
 drivers/usb/serial/ftdi_sio_ids.h |  9 +++++++++
 drivers/usb/serial/keyspan.c      |  4 ++--
 drivers/usb/serial/option.c       | 11 +++++++++++
 4 files changed, 25 insertions(+), 2 deletions(-)
