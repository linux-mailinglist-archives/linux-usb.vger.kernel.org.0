Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFA5D16300B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgBRTdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:18 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:33306 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgBRTdS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:18 -0500
Received: by mail-wm1-f53.google.com with SMTP id m10so2909818wmc.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=+jgqRKML7Yrf3AYnGUIzG8hS1esv3rcPRRHV79fbvHM=;
        b=psv0JUyk005qlyxlj1y9J8rTdUdyhCDFJ8a52kSkwHTJ/UUnAdgPuS8uo/RvUQeufE
         IdR+1lIruwhhBdDjahf5NsTruJo6m5wRtMuj10lr44QAxMyTu2yeXbwg0oLq5l9XDJ19
         gF/npJQeVP389phPJ1HuNhkxGV5DEpcgDeU2V6F0XFFvsAHMVBJtB2+ZilGPEnwjGZu+
         JHbNfoxTnrwiWgzqfroaexHBf6AOBs7iETrD6WKuri0WQ8YJPpTONO1jHaEK5CLeJuBf
         f8ty/A9+CxIxsy3Ns/70PDj+VGvOcqe1ioJPrgHgkPDevJyMAt3la2sYCqXZGfniokvD
         ofwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+jgqRKML7Yrf3AYnGUIzG8hS1esv3rcPRRHV79fbvHM=;
        b=empT+5zapQF3b1CgLS4f5fQsdlqg/gqP9Z1hZ+iFmfZP+CrU7roSlc420YxtAbhWwg
         kUvU6A2pnX94Dcgy6dD2+od3etx/XLfBSjnLI41SsSQCpPmHmn2a8lzn7pedW8mKg9VM
         Zq3bNkqU+wJEczi5xg5QDXWFQI3dXEzqylNnHtHCggpfUXbWizh/n/FQqQuV1iqJTY3s
         aBy1MUZWIxveZdXi2ROiU0XyG6wjBZmws4xilrll4+vm+BfyMFjmqr6jBmeninC1rV/C
         lAgWfz/H5nFM2BqbcPB/72GV/EJKQX1f9UCkS6NozgqvyII2Fc1Zvkcc+YbYYmQSBHIj
         l4/w==
X-Gm-Message-State: APjAAAW9aCycsx0I64ID99sE0rcRPfLJvQhvAkweTHCbxenDUHUSevqb
        ZL8ztNkOmx9J3UHVN0joyHbMug==
X-Google-Smtp-Source: APXvYqwCxodnbtZlxvUkeYI5t16CdUAuDYPYCyMJxqeG3RsIVjlqMSYNSQQ1wHqDOq1LeY0/99WinA==
X-Received: by 2002:a1c:1d13:: with SMTP id d19mr4919167wmd.163.1582054394962;
        Tue, 18 Feb 2020 11:33:14 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:13 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 00/20] usb: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:43 +0000
Message-Id: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This serie remove a useless (char*) cast for some xxx_driver.name.
pci_driver, device_driver, usb_composite_driver structures have a "name"
member which is const char * and all the driver patched assigned to it a
const char[] name, so the cast was bad and unnecessary.

Corentin Labbe (20):
  usb: gadget: legacy: gmidi: remove useless cast for driver.name
  usb: gadget: legacy: inode: remove useless cast for driver.name
  usb: gadget: udc: amd5536udc_pci: remove useless cast for driver.name
  usb: gadget: at91_udc: remove useless cast for driver.name
  usb: gadget: dummy_hcd: remove useless cast for driver.name
  usb: gadget: fotg210-udc: remove useless cast for driver.name
  usb: gadget: fusb300_udc: remove useless cast for driver.name
  usb: gadget: goku_udc: remove useless cast for driver.name
  usb: gadget: lpc32xx_udc: remove useless cast for driver.name
  usb: gadget: m66592-udc: remove useless cast for driver.name
  usb: gadget: net2280: remove useless cast for driver.name
  usb: gadget: omap_udc: remove useless cast for driver.name
  usb: gadget: r8a66597-udc: remove useless cast for driver.name
  usb: gadget: renesas_usb3: remove useless cast for driver.name
  usb: host: ehci-pci: remove useless cast for driver.name
  usb: host: ohci-pci: remove useless cast for driver.name
  usb: host: sl811-hcd: remove useless cast for driver.name
  usb: host: uhci-pci: remove useless cast for driver.name
  usb: host: xhci-pci: remove useless cast for driver.name
  usb: musb: core: remove useless cast for driver.name

 drivers/usb/gadget/legacy/gmidi.c       | 2 +-
 drivers/usb/gadget/legacy/inode.c       | 2 +-
 drivers/usb/gadget/udc/amd5536udc_pci.c | 2 +-
 drivers/usb/gadget/udc/at91_udc.c       | 2 +-
 drivers/usb/gadget/udc/dummy_hcd.c      | 4 ++--
 drivers/usb/gadget/udc/fotg210-udc.c    | 2 +-
 drivers/usb/gadget/udc/fusb300_udc.c    | 2 +-
 drivers/usb/gadget/udc/goku_udc.c       | 2 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c    | 2 +-
 drivers/usb/gadget/udc/m66592-udc.c     | 2 +-
 drivers/usb/gadget/udc/net2280.c        | 2 +-
 drivers/usb/gadget/udc/omap_udc.c       | 2 +-
 drivers/usb/gadget/udc/r8a66597-udc.c   | 2 +-
 drivers/usb/gadget/udc/renesas_usb3.c   | 2 +-
 drivers/usb/host/ehci-pci.c             | 2 +-
 drivers/usb/host/ohci-pci.c             | 2 +-
 drivers/usb/host/sl811-hcd.c            | 2 +-
 drivers/usb/host/uhci-pci.c             | 2 +-
 drivers/usb/host/xhci-pci.c             | 2 +-
 drivers/usb/musb/musb_core.c            | 2 +-
 20 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.24.1

