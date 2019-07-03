Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8FE5DE18
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 08:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfGCGe6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 02:34:58 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38451 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfGCGe6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 02:34:58 -0400
Received: by mail-lj1-f195.google.com with SMTP id r9so1105570ljg.5
        for <linux-usb@vger.kernel.org>; Tue, 02 Jul 2019 23:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=A6t5M3jhyetjfZZtnKFp8lK9DmwTeGzQtT3z70I28Ak=;
        b=Bp+9Vzwrqi/INJi3hxKuov1MwaoyEb10kQWh2tQrH45K8I8Z2YIW/RM8WueMlGX+nn
         q0DnzLGfduhMBpqPTyhZlJfd/xHaAWHT/L2NPJyAygQvdzGYwR39QTyODN5nSMNwDSxS
         6iUhlaI9DY634PspvQzFfm9NWZ4/6WiU/uUrKWew8e+oUiyTzr9BGFIXwa1xWx+Tk5th
         xEs29ADT7EF5sz8KdCEhGtqjHVWMqcTGr5KvE3ZI4P1tzlahenniu7IQCX8yTKkgVGqV
         o7gjWTJGkoR7T/zhOdkelC3aND/MLCnYJhGWPjnQ7ZIlQnkeR6Fjp2wDZkm8mSnRd65n
         UdaA==
X-Gm-Message-State: APjAAAU/MPbJOtXZvAAILzr8KVNREAjnqebUMD/KeXnTzcu4EYMWysos
        ByHScTnbgc6ql+Xfp47gCJ0=
X-Google-Smtp-Source: APXvYqzNtSJQZqb2yfJdwcLg5VHWfpgKCfrAWQ1U3gOXjTYR2g9XXenoYQNzxjm+4kWAgVqfhGO0og==
X-Received: by 2002:a2e:8007:: with SMTP id j7mr5259242ljg.191.1562135696467;
        Tue, 02 Jul 2019 23:34:56 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id a17sm233444lfg.73.2019.07.02.23.34.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 23:34:55 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hiYqx-0000Ok-6l; Wed, 03 Jul 2019 08:34:51 +0200
Date:   Wed, 3 Jul 2019 08:34:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial updates for 5.3-rc1
Message-ID: <20190703063451.GA1508@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:

  Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.3-rc1

for you to fetch changes up to f8377eff548170e8ea8022c067a1fbdf9e1c46a8:

  USB: serial: ftdi_sio: add ID for isodebug v1 (2019-06-28 17:12:35 +0200)

----------------------------------------------------------------
USB-serial updates for 5.3-rc1

Here are the USB-serial updates for 5.3-rc1; just some new device ids
this time.

All have been in linux-next with no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Andreas Fritiofson (1):
      USB: serial: ftdi_sio: add ID for isodebug v1

Jörgen Storvist (1):
      USB: serial: option: add support for GosunCn ME3630 RNDIS mode

 drivers/usb/serial/ftdi_sio.c     | 1 +
 drivers/usb/serial/ftdi_sio_ids.h | 6 ++++++
 drivers/usb/serial/option.c       | 1 +
 3 files changed, 8 insertions(+)
