Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E74012E54C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 12:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgABLBw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 06:01:52 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37836 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgABLBv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 06:01:51 -0500
Received: by mail-lj1-f194.google.com with SMTP id o13so28898616ljg.4
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2020 03:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=GU1XBvHxpCU6TF+1pLHjdPQLypSQ5wUdd8bPMAPSIRI=;
        b=ZiKqgt+zL9+umPh/xqd5O1NMXInmLCAJDw7Ef3ZXh8q0slVpvk/b7bIp5ibd1qjtmI
         Yy1UY6y9hiVZoYuRhmYP/AXOXcfvI4hUPZUx/HPDK+/hUcAFr4CQggOFovzOLZTFt2Zd
         dVDvSVVGYJzo+Oi4MoEpHJnpQN6M92uRmoIuCE0bFvnH4Zebti9s4pOb5joVVxpVpYke
         LodYR9Eeml2BLVyqtaTg+GDkGem/SMPd4gO6WxyY1xYB452bBGqIkeZ2iht8eDeanmPH
         doFiDuZp0wSjyV8a8mvZ9A6FvU4Phoq4yzjRoe3lfT/k8HCgnmWu/fB+h4sycHtGvg9s
         20kg==
X-Gm-Message-State: APjAAAUgaekMD0gGTrmYWyKwpK2/X2IU05wnz4oNwfv1HNMnZzcV5ckq
        00+1AlLMPJL+CmKed6T1pw3tRy2c
X-Google-Smtp-Source: APXvYqzO0AbCO9RONELcT7D0PO4Q9raDuQjQAHaU5XqSRbg1Ja3wSRFfi8p1F38RIfGT3EQsU/mCEg==
X-Received: by 2002:a2e:9e43:: with SMTP id g3mr33150400ljk.37.1577962909866;
        Thu, 02 Jan 2020 03:01:49 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id i19sm23184902lfj.17.2020.01.02.03.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 03:01:49 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1imyEf-0004Zt-BJ; Thu, 02 Jan 2020 12:01:49 +0100
Date:   Thu, 2 Jan 2020 12:01:49 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.5-rc5
Message-ID: <20200102110149.GA17571@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.5-rc5

for you to fetch changes up to 2438c3a19dec5e98905fd3ffcc2f24716aceda6b:

  USB: serial: option: add ZLP support for 0x1bc7/0x9010 (2019-12-20 12:07:12 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.5-rc5

Here's a couple of new modem device ids, including a new quirk for
devices that expect zero-length packets.

Due to the holidays, only the first one has been in linux-next and with
no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Daniele Palmas (2):
      USB: serial: option: add Telit ME910G1 0x110a composition
      USB: serial: option: add ZLP support for 0x1bc7/0x9010

 drivers/usb/serial/option.c   | 10 ++++++++++
 drivers/usb/serial/usb-wwan.h |  1 +
 drivers/usb/serial/usb_wwan.c |  4 ++++
 3 files changed, 15 insertions(+)
