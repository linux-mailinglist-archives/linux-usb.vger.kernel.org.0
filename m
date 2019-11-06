Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F608F1637
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 13:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730526AbfKFMme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 07:42:34 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:37682 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727652AbfKFMme (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 07:42:34 -0500
Received: by mail-wm1-f53.google.com with SMTP id q130so3155598wme.2
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 04:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=XS25oZRAGNX588WUhj0ZX4ZZuaEhei2Z6fcyEe7D0tU=;
        b=dBpR/bUh3r1pN7N1e6BGWZSsEZ7MRlfcmQFQzNmFjYFJK6LXwMM9YM0bBnxqJLjy29
         UHiCJP9cIn9wCgDP2X6YzWYztnwXLG7ZFSXw8dUPK5H+uAmRF3l+GcPJW1yA+012i68F
         WI/3Hy/N7y05grVhdDyw0bmsYIfYmkZeSr7ivsz0kB/5tnfWiPDHTrBDi/DZcrsuhSKM
         rQeb0S7+Ra3rjHnGCy8EGLMmPQxvAIOul/4XNGvPL0aRKnuRs7NngMHlsoXWJXzuzyK8
         ErGnA3B6IRYBxjvK83cZ33JMHOCRVVKEnCbsE7xQgbCjJlhFQMtbQr+wAPPufmLBfBR4
         dBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=XS25oZRAGNX588WUhj0ZX4ZZuaEhei2Z6fcyEe7D0tU=;
        b=C+aHs+7xyu/KQelrMO2E3RjrTIbN2zafLjzZCKAujgMZcWyIanFFl1rUrz/aOitUlu
         Pztb/4z0zqdMYRgG8CITd4pxVNrI7vsizx1CD56wVEZrdTk+9HqAXOsGgzeWjakZA+ZY
         LtsxqShbjwz6ZEOn1MIHcsO9Vz+MKgt0tEexNTMbn1rvkrWGSDZzUFD18pXAVMxYhltk
         98dtGwsdA3CJBBGOemzOpGpwKJRhQWYdDVKy1dreO0TXrZO5a/PWcILXrVpQRvGWfk+8
         PL3JG1cGbZjpp0LI4L6KyFWE0HvW1lVlipStUtgMI9ejzfCTNhrTnuYW2+DIIn8XYMTv
         YQaQ==
X-Gm-Message-State: APjAAAVGsNyN8wWjsQ0Erz7ZLwjkT9RhVMFD/7CYJOByBDqSyDmX0ZTE
        dhK3zjkql3TeoAMJCMGDWKkfYZWe
X-Google-Smtp-Source: APXvYqwCAn8JRFg4QgIwbKFVAjYqPC5kRm0+cKpvQ9cvzoq9Vp04Cq8xV71oCmiW+ONgXY4tcjzoyw==
X-Received: by 2002:a1c:98c5:: with SMTP id a188mr1859535wme.133.1573044150841;
        Wed, 06 Nov 2019 04:42:30 -0800 (PST)
Received: from tesx-pc ([5.95.30.185])
        by smtp.gmail.com with ESMTPSA id 16sm2930929wmf.0.2019.11.06.04.42.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 04:42:30 -0800 (PST)
Date:   Wed, 6 Nov 2019 13:42:17 +0100
From:   Fabrizio Pelosi <tesfabpel@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: Logitech mouse G900 works only after ~6 seconds after plugging it
 in
Message-ID: <20191106134217.37e221af@tesx-pc>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm having this issue since some kernel releases but I never took the time to report it since it's not so severe...
Anyway, if I plug my mouse (a Logitech G900) the device gets detected immediately but starts to work only after ~6 seconds as you can see from the log.

The mouse is connected via USB cable (without the wireless receiver).

I have this issue on a ArchLinux box (running kernel 5.3.8-arch1) and also on a Fedora 31 box.

NOTE: Also reported here: https://bugzilla.kernel.org/show_bug.cgi?id=205449

LOG:
nov 06 08:29:50 tesx-pc kernel: mousedev: PS/2 mouse device common for all mice
nov 06 08:29:50 tesx-pc kernel: logitech-hidpp-device 0003:046D:C081.0007: Device not connected
nov 06 08:29:45 tesx-pc kernel: logitech-hidpp-device 0003:046D:C081.0006: input,hidraw5: USB HID v1.11 Mouse [Logitech Gaming Mouse G900] on usb-0000:0f:00.3-1.2/input0
nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 as /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-1.2:1.0/0003:046D:C081.0006/input/input36
nov 06 08:29:45 tesx-pc kernel: hid-generic 0003:046D:C081.0007: input,hiddev4,hidraw6: USB HID v1.11 Keyboard [Logitech Gaming Mouse G900] on usb-0000:0f:00.3-1.2/input1
nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 System Control as /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-1.2:1.1/0003:046D:C081.0007/input/input33
nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 Consumer Control as /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-1.2:1.1/0003:046D:C081.0007/input/input32
nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 Keyboard as /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-1.2:1.1/0003:046D:C081.0007/input/input31
nov 06 08:29:45 tesx-pc kernel: hid-generic 0003:046D:C081.0006: input,hidraw5: USB HID v1.11 Mouse [Logitech Gaming Mouse G900] on usb-0000:0f:00.3-1.2/input0
nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 as /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-1.2:1.0/0003:046D:C081.0006/input/input30
nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: SerialNumber: 0E6C36503233
nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: Manufacturer: Logitech
nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: Product: Gaming Mouse G900
nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: New USB device found, idVendor=046d, idProduct=c081, bcdDevice= 1.03
nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: new full-speed USB device number 5 using xhci_hcd
