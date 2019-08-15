Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38B08EE9F
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 16:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730970AbfHOOsB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 10:48:01 -0400
Received: from mail-oi1-f200.google.com ([209.85.167.200]:52573 "EHLO
        mail-oi1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729924AbfHOOsB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 10:48:01 -0400
Received: by mail-oi1-f200.google.com with SMTP id y1so1475138oih.19
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 07:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Oo+b4JgmbVVwPN7Iq1C5rV1rjpah540kwTm+9XF/ig4=;
        b=SK0+4gVABqV49kdr2ApmOgqZB4vjgSQKzeN+zxvJidpyfnkKB4XeoxXvBb4elUA1gQ
         +gGEPHxGJtojI81iMed4xkYOfVUA39wALAdQ71caIATLS4P04beeBfsl+GUmJ3SnwMJR
         h3S4Yax+C6pA91YpjO5bHhQI4T6Zik8lDzbyVnCh3JoKTeQFqUJRKuOAoTYgJXGScCW7
         Bs49aygOclmFIkMxhY057gwk6qWtE1m+fr9USCaMFuuuSk5+cYNm/x3ARUkjZ2L6T/Fb
         Yq++3wGEnX9fKX/E8GGWuFt5RAEsoKMTKGkKBChWlu+ofnqPrC5m2v2+CN3AMfCjwN7E
         8ErQ==
X-Gm-Message-State: APjAAAWY39zx2Zu/aKlcEmtH8e+Bvvj9uaQDoViN7OA/hbML7EzNEMx9
        1pGUIlRYs0zq9qhp7NyTUkgbKAzyNVqTi/1zsXrsAUJ5a9dH
X-Google-Smtp-Source: APXvYqy/2c1rfcZdZWb4ifFBG4OJlyk4go1dDPMHhac+8Z9hDbxHMiE0LfSozFqEPir305uSwiTUkR3TRQfzFd78G9niFiGk71Gb
MIME-Version: 1.0
X-Received: by 2002:a02:4005:: with SMTP id n5mr5431477jaa.73.1565880480356;
 Thu, 15 Aug 2019 07:48:00 -0700 (PDT)
Date:   Thu, 15 Aug 2019 07:48:00 -0700
In-Reply-To: <1565879328.5780.9.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cae1e8059028f559@google.com>
Subject: Re: divide error in usbtmc_generic_read
From:   syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        guido.kiener@rohde-schwarz.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, steve_bayless@keysight.com,
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
syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com

Tested on:

commit:         d0847550 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e22d02600000

Note: testing is done by a robot and is best-effort only.
