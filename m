Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487A06B164
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 23:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfGPVwd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 17:52:33 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41377 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbfGPVwd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 17:52:33 -0400
Received: by mail-lf1-f68.google.com with SMTP id 62so9955044lfa.8
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sChX2tjZXXzFm/FF0+gISHJ8+I30zgl6h1ocaPpSr4w=;
        b=TVDnEiknWAcRrVYjpkVEp+7UlZza/YL/doDnWkXLRwGqJ9YS6xQoSpx94TtYwkM0Zm
         9JcQMIFbg+AGr5yblr8fIfyWGtAiWjIILXfM7IITLcHbJNA9fCyb6PLAg+BasgvkoPqY
         mOu8Q8JEY5ecE/Co/dtC9Acv0384Ahf5uv5clQz+i59KnETYFC1wsz8UK5PiDYs/T9n1
         cgi/EyRXEgBnePqIEVvybyK+Lmko4rVlZEkLGBTQU7Ct2fceE6jFBcW+cy4RZHOvyaT4
         yK6DJECW1VMyuUV4EO4RpgP01Zcz3GnzbCKe0KHKjUI5P8ZOseBMqWLKAA5U3ku+AEek
         v3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sChX2tjZXXzFm/FF0+gISHJ8+I30zgl6h1ocaPpSr4w=;
        b=llT3BfgCs3g80Ma+H/0UWU1OCeSh6jnhrEa2+uInRhH2LA27X5hQqjpTGqMRK/OpRD
         XjWayhI0nj3ahUmQTjF1zXseTdWC02boxjFg4V47nxXEj97zcK2NBmISHnVpmeNeStL2
         Oa1qkyaeGi3jpdpWwLR8gvBXtRPyDJifNToOFTjtfjoNGcnRAiyB1xBWRQ6XIIaRRElX
         ulCrbsI3maXGpAR5pr+1w5F5l+ThserGAZCg/OkwjEud7Dz4M9XYMFSvKE1hvlxYeYzV
         UJ+P1hqdZW7dumA4HjA8fs12fcezulEbOOrVvnJomYwDDDyylvyMXnCuQX4UCYl9ucU8
         Gcpg==
X-Gm-Message-State: APjAAAW4PGnQlFUwAcBAuUSEZALaSjiQGlrQltnM3g8GqcCrE1e5yaGz
        FMyEjKbQNXCGC1EUU0wIDJFSgr6HpMPel9krs4XxIhsNU1A=
X-Google-Smtp-Source: APXvYqxF5LGbIM5rW+0/RUz7xG/c4ekdZJIfr+EH8zBCsdrd9zerb9uo3Zsk8A9BlRzj6R313IgBGYMpeLNcjo9YvBk=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr15820032lfu.141.1563313950958;
 Tue, 16 Jul 2019 14:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a55d7d058d51ad4f@google.com>
In-Reply-To: <000000000000a55d7d058d51ad4f@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 16 Jul 2019 23:52:19 +0200
Message-ID: <CACRpkdYbuJ_yJ+UKtvWrkmBCbQzfk-1mn1-A836dkNMrmTtZow@mail.gmail.com>
Subject: Re: WARNING in gpio_to_desc
To:     syzbot <syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com>,
        Johan Hovold <johan@kernel.org>,
        Vincent Cuissard <cuissard@marvell.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 10, 2019 at 1:07 PM syzbot
<syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com> wrote:

> HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
(...)
>   __gpio_set_value include/asm-generic/gpio.h:104 [inline]
>   gpio_set_value include/linux/gpio.h:71 [inline]
>   nfcmrvl_chip_halt+0x4e/0x70 drivers/nfc/nfcmrvl/main.c:259
>   nfcmrvl_nci_register_dev+0x2d4/0x378 drivers/nfc/nfcmrvl/main.c:176
>   nfcmrvl_probe+0x4e9/0x5e0 drivers/nfc/nfcmrvl/usb.c:344

This bug is somewhere in the drivers/nfc/nfcmrvl* code handling
GPIOs.

It should be converted to GPIO descriptors and fixed up, see
drivers/gpio/TODO for details on how to do this.

Johan/Vincent, tell me if you want me to forward the full fuzzing
robot crash dump.

Yours,
Linus Walleij
