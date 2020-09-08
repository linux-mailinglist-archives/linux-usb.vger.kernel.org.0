Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EF2261E56
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 21:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730807AbgIHTuy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 15:50:54 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43412 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbgIHPug (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Sep 2020 11:50:36 -0400
Received: by mail-ed1-f65.google.com with SMTP id n13so16500240edo.10
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2020 08:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=bfShAkzyf1iz3DwMj3/d97POjGFz4sE0G+mpjwZVoMM=;
        b=gIZBj0/F354pqmAJcBOWyQFJKZzZlQ8gmy9PeJir+2hfTqz2pR74FTTijh2eGgKLQk
         BGWk9QZKe2wHepX1gzRA0H0jGGgXcBlHIegQqAPVsgLPJcZBto8kkjiy6vkP3qDnLNPI
         zNw318GqxnpVhHkdiSB6aCAvUEYfYa3qh5qLMFkolr3mHCxb4RR6L5vajlm6CnZWIFZm
         ITOFX+y209vo8Z/qjIKjSTapCUGyAO73JO+QGdUrc/v+EzlbD9tVEWYWmCnCbCb6/mPy
         D+InYW0FuECcW7cmFJIjsBpFhWjuQSENVXx/2pnndRKmZuqMWp9aBwO4WlE7LzdAjyNo
         knbQ==
X-Gm-Message-State: AOAM531eNRDaYCSfgKDubwNQglCeqsej9W5eqN1w2KqMj2I5YuRDioxN
        6yNboTsd2yhqrJyZqwPtA37P0kP5PTE=
X-Google-Smtp-Source: ABdhPJw1trwfAnk7idWTb0UOpL2h/akIJPB+UY+R2zg78E1rZ3gv6Q1YYRClRY7TS45f15P2jsR9Cw==
X-Received: by 2002:a2e:5c5:: with SMTP id 188mr3620545ljf.375.1599579830026;
        Tue, 08 Sep 2020 08:43:50 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id w4sm570695lji.140.2020.09.08.08.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 08:43:49 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kFfmZ-0006Ke-M6; Tue, 08 Sep 2020 17:43:43 +0200
Date:   Tue, 8 Sep 2020 17:43:43 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.9-rc5
Message-ID: <20200908154343.GA24328@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.9-rc5

for you to fetch changes up to 2bb70f0a4b238323e4e2f392fc3ddeb5b7208c9e:

  USB: serial: option: support dynamic Quectel USB compositions (2020-08-31 08:37:17 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.9-rc5

Here are some new device ids for 5.9.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Aleksander Morgado (1):
      USB: serial: option: add support for SIM7070/SIM7080/SIM7090 modules

Bjørn Mork (1):
      USB: serial: option: support dynamic Quectel USB compositions

Patrick Riphagen (1):
      USB: serial: ftdi_sio: add IDs for Xsens Mti USB converter

 drivers/usb/serial/ftdi_sio.c     |  1 +
 drivers/usb/serial/ftdi_sio_ids.h |  1 +
 drivers/usb/serial/option.c       | 22 ++++++++++++++--------
 3 files changed, 16 insertions(+), 8 deletions(-)
