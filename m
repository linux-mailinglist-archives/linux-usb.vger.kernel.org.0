Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B732FE003
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 15:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfKOOZx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 09:25:53 -0500
Received: from mail-pf1-f178.google.com ([209.85.210.178]:37728 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbfKOOZw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 09:25:52 -0500
Received: by mail-pf1-f178.google.com with SMTP id p24so6765004pfn.4
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 06:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=jCldg5CtSyMy4eb3Jq7NznPVvLmzPG/CPC9UJk27ikc=;
        b=l+WTBT988pYSSwtyzhtrzomfSyNHdyPUDPV3gLNoE35aLuxw5zFWD6tqYX8OyaVMOb
         drPI97JDVHtgoIbKTyTkOcbdoRAQ/15I9WjW/uQhejrj2r1rs2zYjjFxgEkrvDlWkMr1
         cy0P5/lEb6WnD7zW/LLw2VPmjGvGNAhrVGXzHIJMVDUWSkY7O/s4B/dp0euronC1XXGJ
         ewQQNN4SlXuaq0ul9Vqh46gQAZhn7NfvqeWVZwxnGXCsAazOttZ/KJwbVVxaCpFcjSh2
         Thf45Fx5lcKU7HGD2lDdDDfNj9iLpA4xSj81GZFmT+XJllgF6OZG7vDQvTK+mtfRjnZH
         QUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=jCldg5CtSyMy4eb3Jq7NznPVvLmzPG/CPC9UJk27ikc=;
        b=WS4IpXrhQ85sRZc3DVURVcGs66e6lTr22vYznV12LgVMplXRSj2+mnn48SZ2lSeJr1
         +HsTV5zR44+G3GWwsXb5oNFrOEYCcP+bT0blmcFUsDnv0oEVX1lpAeu+bOiV+W1PIgdm
         /N2PgL6PiC/+Wx1viJ/UBAMgnZyrr/0Li5cJvdJETkX6Pny3izG0v1MeqSi52IANp/P2
         BxH8JB/VQg7YREp3UgUVl+PbLpG4CehFAeGPokLOhf/qscVdloXP5nd0yPqjmyWINTZM
         eTyUAt0bID08Rgl3/5Jd15wtaOl1Vzq+rqUHz5LoV7TxxYLj6Oblckae9GJdpJ3ov1ri
         U2Lg==
X-Gm-Message-State: APjAAAUS6GDk30fJ3Q2CBUi2uOxy9wuXF4qFjo1fLwgfWCgCbzmCNScO
        vpGK/InCm+q9++lbmN89nmXot2+SAN9aSRP0dBAs+cWs3E8=
X-Google-Smtp-Source: APXvYqxqh5+rhVPxCD1Wf8980KjbSFhFLvjb2HXc+tlQbz086yMjZfKp+5PMXHIQaGjklBMiPIRN2kRECfTUXacyKgA=
X-Received: by 2002:a63:541e:: with SMTP id i30mr16680098pgb.130.1573827950259;
 Fri, 15 Nov 2019 06:25:50 -0800 (PST)
MIME-Version: 1.0
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 15 Nov 2019 15:25:38 +0100
Message-ID: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
Subject: Exporting USB device ids from the kernel
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg and Alan,

For USB fuzzing it would be nice to be able to export usb_device_id
structs from the kernel to facilitate the fuzzer with generating USB
descriptors that match to actual drivers. The same is required for
hid_device_id structs, since those are matched separately by the
usbhid driver (are there other cases like this?).

Currently I have a hacky patch [1] that walks all drivers for USB and
HID buses and then prints all device ids for those drivers into the
kernel log. Those are manually parsed and built into the fuzzer [2]
and then used to generate USB descriptors [3].

I'm thinking of making a proper patch that will add a debugfs entry
like usb/drivers (and usb/hid_drivers?), that can be read to get
USB/HID device ids for all loaded drivers. Would that be acceptable?
Or should I use some other interface to do that?

Thanks!

[1] https://github.com/google/syzkaller/blob/master/tools/syz-usbgen/usb_ids.patch
[2] https://github.com/google/syzkaller/blob/master/sys/linux/init_vusb_ids.go
[3] https://github.com/google/syzkaller/blob/master/sys/linux/init_vusb.go
