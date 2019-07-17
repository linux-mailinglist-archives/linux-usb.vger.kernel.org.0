Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29D216BC1D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 14:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfGQMHB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 08:07:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:51231 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfGQMHA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 08:07:00 -0400
Received: by mail-io1-f71.google.com with SMTP id c5so26708797iom.18
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2019 05:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=XMiM4VhhNGMXt1YUP9hYUP+H6sfTtdLHWoBTL1ud0JA=;
        b=iqMYSRKGwyJYiWcuP4wv+6WsFH5Pvi4jO7n9TNjz7pHN8DAgEgXi/oX+vH+PI6P/KX
         JuH81CMZcCQYFh1Bso7Rh0LhXp4Tmx4of4cIFiVBI6/lmjqJhqK0t7AcaxV5zRnW7Py7
         WSYHts+1B6du7C486YRW+pvnT2zM4JzOUds6Z0OgsQHLYnGQEKGaopu0ic66lMQBVJaH
         36+avaro5WkKmHZNeah/7N99Ay8L0IEbkk26aE/3+WwvdMRcr3u/kMQZTqKybggZqBVW
         f+i4qrzGg7iY1lHspUmGq9WAwi54N7tquBlYMKEIqcV3jyq6Yeq7oQabQMVjB51wVghu
         GkhA==
X-Gm-Message-State: APjAAAVvCK0E0iiXG29wWLIHNBMtAHxHu4sAAw3Icosci/G09PSK7trc
        o7NtnLO4xYE+JuSZOO6Oy4nCQhSejHZgO61zAjk8nTB+i+O4
X-Google-Smtp-Source: APXvYqzJDIa9bplYl+1WI2lx91wpvWCo7zcTm57mmmA3Rf0j84ecemM7YLsQPb+m1xJjo13foqByIr28LUi38D216xL3GGJaASl1
MIME-Version: 1.0
X-Received: by 2002:a02:bca:: with SMTP id 193mr1412225jad.46.1563365220270;
 Wed, 17 Jul 2019 05:07:00 -0700 (PDT)
Date:   Wed, 17 Jul 2019 05:07:00 -0700
In-Reply-To: <CAAeHK+x4KAy2koonjij26iowtPuj67F=Mx+g0kYF968Zr-h8xg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009bc9b3058ddf5401@google.com>
Subject: Re: WARNING in gpio_to_desc
From:   syzbot <syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bgolaszewski@baylibre.com,
        cuissard@marvell.com, johan@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, sameo@linux.intel.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+cf35b76f35e068a1107f@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=126cd1a4600000

Note: testing is done by a robot and is best-effort only.
