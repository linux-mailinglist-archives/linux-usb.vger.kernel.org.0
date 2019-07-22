Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D50703AE
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 17:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbfGVP0J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 11:26:09 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:6206 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728850AbfGVP0J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 11:26:09 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45sllh1b7YzB2;
        Mon, 22 Jul 2019 17:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563809088; bh=9jKef6T+rH06yYURO9+Cu3Ka43sdFwNPQnpJ6Ev4m10=;
        h=Date:From:Subject:To:Cc:From;
        b=elUHPPfRauepHjG7btJaXPSD3YpF7KK2Ev5ZzQwo2riGUEpKxwOPrzfCYrvSdYHZe
         0Ws2h6SUVabgVCh/bPIyn5D1+XrjPueutW/AyUejWntY+tjjJa5Vs2ezellqMHvqPX
         /d2WdenTYjqRSSKZczK0rJZHS4KQx7+Lg3kOvyPim8gZDmHXki39Y8+DJZNSo6W0zR
         xksrMEQGwZlOuAn6ydK50EsJlNMnmZ4zfc/xobuRHlDXgtiiLVzFgapRsYx2bG23+C
         Uxw1DIGomrJUaB66/f0mS+bELh0pKCjjxqYbkXLzLVRBvOIDJwLqFMKaYo6C1Doj6G
         10XWIeyVXnqkA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Mon, 22 Jul 2019 17:26:07 +0200
Message-Id: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 0/6] usb: gadget: u_serial: console improvements
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series makes it possible to have more control over console using
USB serial gadget ports. This can be useful when you need more than
one USB console or are configuring multiple serial port function via
configfs.

The patches are against usb-next tree. You can also pull from:
   https://rere.qmqm.pl/git/linux  usb-console


Michał Mirosław (6):
  usb: gadget: u_serial: add missing port entry locking
  usb: gadget: u_serial: reimplement console support
  usb: gadget: u_serial: make OBEX port not a console
  usb: gadget: u_serial: allow more console gadget ports
  usb: gadget: u_serial: diagnose missed console messages
  usb: gadget: legacy/serial: allow dynamic removal

 drivers/usb/gadget/function/f_acm.c    |  21 ++
 drivers/usb/gadget/function/f_obex.c   |   2 +-
 drivers/usb/gadget/function/f_serial.c |  21 ++
 drivers/usb/gadget/function/u_serial.c | 420 ++++++++++++++-----------
 drivers/usb/gadget/function/u_serial.h |   8 +
 drivers/usb/gadget/legacy/serial.c     |  49 ++-
 6 files changed, 333 insertions(+), 188 deletions(-)

-- 
2.20.1

