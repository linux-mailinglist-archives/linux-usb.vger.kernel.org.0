Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C35F1FB460
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 16:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgFPO2g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 10:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgFPO2f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jun 2020 10:28:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FACBC061573
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2020 07:28:34 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m7so8466518plt.5
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2020 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=pUbj8Du8Z5onm6GeFo+xyj7FWys6v8bBApLzSvNwZvg=;
        b=hhYQ3+WPEWyTnhCjYXDEF2LSVrHMYLi9n4wtbgDZ7yOKoONwHvkMNfbHjIZ9P18sa+
         2hIM7ZcbCwWWWWrEk1igfevivtYq4sIuuf/5G3KLugU7awzeyfhX/TOuRzaNb/trxpac
         gJLi9HfMlv2OML4geXIEm8Y4DqynfSB8S9dQ80twBb9CiIlFqAC3qeD77eK/E5GGAlBm
         D8OD9YlFUAaPzhgv7yXw47tcKYg/MvcOup8PS/fyTf/YdJyD50NfwykqgSGpQMZW/QSk
         ye3WiqQiRKuqrEVBOrzw2Mc7fTZJu9olJ47nnJzIiX8hN4ou3sZuAenldTbuEwGZ5Jz7
         6y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=pUbj8Du8Z5onm6GeFo+xyj7FWys6v8bBApLzSvNwZvg=;
        b=kLU/CNYzW3t8gSEQn+z2LVZx0LvU5YeWLS2Hl6SKl831sJGakFLZ1eAXOVIPhzF4Gx
         ln5Qz/pMT1625kxU+mSxm0TZbG9rE6Ylw0a8AIW1+6p86lX6yyHCWksp12QME1gfeq94
         MznlcwiIWyAwzfidq336K8yUHDZXvDMO66Dhg73eFuXaPY+rXnupwfbdkxgsCS1dGZ9c
         P08MfHyEC3bsWKRw4LDlMalv7UfMlHlPRcsRgaEeNXFUU2wPPWe87vuCr5gmJYcjCbsO
         6ZrkGWU5ZJCtYiNp3E1bdjTS5rqoEp2CF1U7+5Nf/3K/iF0bRhcnFAfw2Rz3Wci8uyRe
         98Jw==
X-Gm-Message-State: AOAM530kXadP697FdNHV29HXiz+Fw/4mlpWlw9qx7CwHddkwldA21wr8
        QiDvDg14K7ZmMPLNATaWa6LsiqMgYgOydLi2JwWbcQ==
X-Google-Smtp-Source: ABdhPJwMXM8NuLDzoP/thvCZjVY6kz43Uri3cwW/h24JYzdfyzX9avpQrxe/MbWAZ1ajQyPrLoC33+Q7ah45LZHWBIQ=
X-Received: by 2002:a17:902:e9d2:: with SMTP id 18mr2268050plk.336.1592317713771;
 Tue, 16 Jun 2020 07:28:33 -0700 (PDT)
MIME-Version: 1.0
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 16 Jun 2020 16:28:22 +0200
Message-ID: <CAAeHK+z3tVrvWLa591rDZpbUFR0e_CicDmcgccco+KWyH9Yy1g@mail.gmail.com>
Subject: syzbot USB fuzzing update
To:     syzkaller <syzkaller@googlegroups.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Kostya Serebryany <kcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

As of now all kernel changes required for USB fuzzing have been merged
into the mainline (the last one during the 5.8-rc1 merge window)
(woohoo! thanks for everyone's help :), so the USB fuzzing instance
[1] has been switched to target the Greg's usb-testing tree. As a
result, testing kernel patches on the USB fuzzing instance now follows
the same principle as on the mainline instances, with a few caveats
[2]:

1. You may specify any kernel tree for `syz test` as long as it
includes all mainline patches up to 5.8-rc1 (technically all dummy-hcd
and raw-gadget patches up to 5.8-rc1). (Specifying commit ids from the
usb-fuzzer branch still works too, for now.)

2. Some of the bugs have reproducers generated on kernel versions with
an old custom kernel (when fuzzing was performed with in-development
kernel patches), and therefore those reproducers might not work with
the mainline kernel. The recommended workflow is to: first, execute a
`syz test` command on a target tree to make sure that the bug
reproduces, and then execute a `syz test` command with a fix/debug
patch.

On top of that, the USB fuzzing instance now has bisection enabled,
but it will only work for newly introduced bugs (as the old ones will
just bisect to raw-gadget patches).

In time, as we get fresh bugs and reproducers, these issues should go away.

At this point I think we can consider USB fuzzing support for
syzkaller completed. There are always some things to be improved of
course [3], but all the major parts are now in place.

Thanks!

[1] https://syzkaller.appspot.com/upstream?manager=ci2-upstream-usb

[2] https://github.com/google/syzkaller/blob/master/docs/syzbot.md#usb-bugs

[3] https://github.com/google/syzkaller/blob/master/docs/linux/external_fuzzing_usb.md#todo-list
