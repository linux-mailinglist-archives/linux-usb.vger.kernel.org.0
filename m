Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95CD160E8D
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 04:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfGFCuk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 22:50:40 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:37085 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfGFCuj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jul 2019 22:50:39 -0400
Received: by mail-pg1-f178.google.com with SMTP id g15so5020462pgi.4
        for <linux-usb@vger.kernel.org>; Fri, 05 Jul 2019 19:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=LH+eE6E1X/eo+Y6kqKPrc64jzalOKEXU22ILe9GYqLo=;
        b=YY6PmOyLD89wwKtGWOW98bgM2jk0+KJrcyY9F26lQv/XcBskU52ANnRUmHAhRhbKm4
         rOE7lPSL3yIeEy0qPou8Rsz/QD1DRcuWZeNM9X5U8V2HtnddqvFZZ6opNo2+wNJ3Neqg
         J1SvyLr4d/R6jSB5FqtHweXCMK3mjte0xfR5RjC1CyyZdFSMDxpA52ip4C3chD25XeHQ
         XOQPQB/18MatlGsW8aL+kql8QHIQoqIpK9ut1d8wicx1NgkkT8zqD5NjpXUlZeFmq4Pr
         HKfu8Mo99G+ruyc6/S8GShxnjB6iHzaeBYoA/R7YKiAEsrAXtE9vvChCEIkxGb7d6I5A
         OeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=LH+eE6E1X/eo+Y6kqKPrc64jzalOKEXU22ILe9GYqLo=;
        b=Gl7sGExlsc92hrKzRI65YNNb/Oc9o+fIE4NwROexAQ28+D0Zgti4PGyS5NJt43FKiR
         vxkvgt74AzTytt7Kcj4VWeZQFZSGeRZVCj+qQSSbQ9CGBcYEZkmXB2yJubiEfq6xd/Ag
         iS8I/VdaVNwP8NzsLA8FeatmbLVrKxi9a2INdzVOPbe4bPHp+yjiAeG6ytxPfu4MwI9d
         sOkCGrqTQ8nKmuPtuyqcGKFjj/gCQrfsNMylhRFQQT/+Y5Jequg7oPfgy/YCZp4DC9DI
         ZfOQswfiTefswTC+oGB75N8ARwoR4DfyAOmHUpXeKZdH7WKenP9MiYFXjMYsELQDHQvR
         cWVw==
X-Gm-Message-State: APjAAAVa3HARus6Wg1g0uxeN44BkNm9Wim75M4mqn2GRl5ohvPOI9XIz
        XW/t43fZ5/nEBz7XTulv3jGSOLp7Mb2jFPtIEZJDGSwMJOs=
X-Google-Smtp-Source: APXvYqzk4JvVFbcSsGKly/itjN3QiJkCbj8tfNd6/1b94lgOzhXs7MGkg3Snbn6nS+4qr/E5C67KSoyE81BJww0wl08=
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr9632796pji.142.1562381438946;
 Fri, 05 Jul 2019 19:50:38 -0700 (PDT)
MIME-Version: 1.0
From:   yunhua li <yunhual@gmail.com>
Date:   Fri, 5 Jul 2019 19:50:28 -0700
Message-ID: <CAMqbrUg3bz=i8nh4W2-NWOsnQdqcaB3nvZnMJQ1sGXuD0ogk7Q@mail.gmail.com>
Subject: Per USB device interrupt handler for xhci
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi  all

xhci_msi_irq is the interrupt handler for xhci, the controller it self
is a PCI device, on my system it is a Intel chip. I have multiple USB
device connect to this USB host controller,  xhci_msi_irq is interrupt
handler for the PCI device(USB Host controller).
Is it possible to have multiple IRQ, and different IRQ for different
USB device? If so how? the chip(USB Host controller) should know which
USB device=E2=80=99s transaction,
When the chip decide to assert an interrupt, it should be a reason for
a specified USB device, then assert a correspondence MSI interrupt.
Thanks.

sudo lspci -s 00:14.0 -v
00:14.0 USB controller: Intel Corporation Device a2af (prog-if 30 [XHCI])
        Subsystem: Dell Device 0738
        Flags: bus master, medium devsel, latency 0, IRQ 29
        Memory at 38003ff10000 (64-bit, non-prefetchable) [size=3D64K]
        Capabilities: [70] Power Management version 2
        Capabilities: [80] MSI: Enable+ Count=3D1/8 Maskable- 64bit+
        Kernel driver in use: xhci_hcd



Regards
