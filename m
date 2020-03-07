Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4879E17CA94
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2020 02:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCGBzF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 20:55:05 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43278 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgCGBzF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 20:55:05 -0500
Received: by mail-qk1-f194.google.com with SMTP id q18so4187406qki.10
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2020 17:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:date:message-id:subject:to;
        bh=149GfJMabP9ADRY+wLjqUTkSIFWU7oP/B0hDukdU5q0=;
        b=e5zorsDiJJlFW9+EF5NKwWamb2WnF7Pu1mViW7GhblPB6a2cc51TOkzQu3YZ9rPF7i
         jnQGGfsCggyNGoe/74uhJohNxxFm1VWEVsbQNT5keQLSn7ijdNALRCSJ1YqjcI0IbsPY
         AfzAZWHoZFCd9sL5X7B+QW0f+FENF2p73CrHMqK4nStmy7BfpYzXpeJjkUZGmyliJadm
         tx2XI7moThX41P3iKSWl0qyfxcAkmzmdkQpjHaaW2LpU70+TTT2RCzV6RajCxyAcQZSl
         JvOXUfPO/HnXu1hcdMmim/qua0EnXuIp78oUI591sV9lRQLBOBypYWgB0v/IqVWs8Snm
         HE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
        bh=149GfJMabP9ADRY+wLjqUTkSIFWU7oP/B0hDukdU5q0=;
        b=E9nJvmTm23L1EuNg+ME9LmkQFxXrYa8hwavXbpDvW9wdK5ntGaT1puhgtnyHou+Yit
         3BUKDrpMeJTl+FnmjfXHb9pdwsYvMu3rKqHuf38ei6uEvkaIoWQWDKle2KYM9J2PJo5p
         sEMt8ijnyexOxAJhYPgL8vk3l2CTPyG7jdGMCHgK8Aw5Y4oRD5beeTYDICNt+IBrZSlf
         7AlMkI3zc+Kic3bmFCQPGAvdIv3TWaLl0Kr5BiHakYbDJTB4SZ7n2q4Ffsq5O7YEw7eT
         cX+E7e3s6umPaNi3I9iX0kzes8NWc5weqDjEWUx67x9dpGge30zN/8RSCQyx0nZA0hXn
         uoJg==
X-Gm-Message-State: ANhLgQ1h+Q5SeG0ovCA8SEb6twADSQV0B8D5Ai30ZK6M+WTrFTdDDyrj
        JVnnfFssY7NJELXfoYfEoqw3Q3dox8MbhQ==
X-Google-Smtp-Source: ADFU+vt/Fgj6pdG0JGlq4pJ5a+N0M20c9wFu1lugpQ2kjXLmm8CZujQyhHk8uZaEJSffgnVxHtADvw==
X-Received: by 2002:a05:620a:951:: with SMTP id w17mr33310qkw.352.1583546102487;
        Fri, 06 Mar 2020 17:55:02 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id l3sm10859071qkl.100.2020.03.06.17.55.01
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2020 17:55:01 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f175.google.com with SMTP id d22so3233844qtn.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2020 17:55:01 -0800 (PST)
X-Received: by 2002:ac8:6f2e:: with SMTP id i14mr5619803qtv.296.1583546101290;
 Fri, 06 Mar 2020 17:55:01 -0800 (PST)
MIME-Version: 1.0
Date:   Fri, 6 Mar 2020 22:54:49 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrH_7p1p1+9pXc-85m3yHHo_2YLouuXFBOLBr+gsSe+Ew@mail.gmail.com>
Message-ID: <CAP9ODKrH_7p1p1+9pXc-85m3yHHo_2YLouuXFBOLBr+gsSe+Ew@mail.gmail.com>
Subject: Error when unloading g_serial module
To:     Felipe Balbi <balbi@kernel.org>, sorganov@gmail.com,
        mirq-linux@rere.qmqm.pl, felixhaedicke@web.de,
        linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Running kernel 5.4.23 on a RV1108 based board the following issue is
seen when removing the g_serial module.

[root@rv1108 ~]# rmmod g_serial
[root@rv1108 ~]#
[   78.090775] ------------[ cut here ]------------
[   78.091252] WARNING: CPU: 0 PID: 617 at
drivers/usb/gadget/function/u_serial.c:706 gs_close+0x8c/0x1e4
[u_serial]
[   78.092164] Modules linked in: usb_f_acm u_serial libcomposite
configfs zram zsmalloc emlog(O) wdtoken(O) clk_rk808 rtc_rk808
spi_rockchip [last unloaded: g_serial]
[   78.093529] CPU: 0 PID: 617 Comm: nm-online Tainted: G           O
    5.4.23 #41
[   78.094198] Hardware name: Rockchip (Device Tree)
[   78.094655] [<c0111100>] (unwind_backtrace) from [<c010c638>]
(show_stack+0x10/0x14)
[   78.095363] [<c010c638>] (show_stack) from [<c082b19c>]
(dump_stack+0xc0/0xd4)
[   78.096027] [<c082b19c>] (dump_stack) from [<c01357c8>] (__warn+0xe0/0xf8)
[   78.096655] [<c01357c8>] (__warn) from [<c0135890>]
(warn_slowpath_fmt+0xb0/0xb8)
[   78.097341] [<c0135890>] (warn_slowpath_fmt) from [<bf04ad8c>]
(gs_close+0x8c/0x1e4 [u_serial])
[   78.098137] [<bf04ad8c>] (gs_close [u_serial]) from [<c04f47cc>]
(tty_release+0xf0/0x47c)
[   78.098877] [<c04f47cc>] (tty_release) from [<c02afb14>] (__fput+0x88/0x214)
[   78.099517] [<c02afb14>] (__fput) from [<c01556a4>] (task_work_run+0xa4/0xc8)
[   78.100164] [<c01556a4>] (task_work_run) from [<c01397a4>]
(do_exit+0x3e4/0xac8)
[   78.100835] [<c01397a4>] (do_exit) from [<c013ad04>]
(do_group_exit+0x3c/0xc8)
[   78.101486] [<c013ad04>] (do_group_exit) from [<c013ada0>]
(__wake_up_parent+0x0/0x18)
[   78.102190] ---[ end trace f34de27d5eaf8688 ]---

Looks like port.count is not being correctly handled.

Does anyone have any suggestions on how we could fix this?

Thanks

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
