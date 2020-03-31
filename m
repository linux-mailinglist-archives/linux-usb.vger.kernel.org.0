Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F200C199CFB
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 19:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgCaRgD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 13:36:03 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:47966 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgCaRgC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 13:36:02 -0400
Received: by mail-io1-f72.google.com with SMTP id c2so19919610iok.14
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2020 10:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=EkBmF5uXCWrM6aOPYLh3R3gAH7wKc57Bigw1PTLooMY=;
        b=TMQ4CEmmxYRQufRlw/UMiuIhhS2uxMjAdKXRhOQ2Qgj4kurz8NGXTukzgE87osD1a4
         SSr/Z0ELxhizrjq1T5SP1NuG9GYXRUi++Bl3HYO85m9Ivx8vHChBEmc1A8KpoMG3yXdF
         IwjfXhpwbd67/wLudXVndMEI0b+sJY2OGIFfA+B/uyMoWsDC4Lakwrg9Pd2VCVY0JoaP
         VVycxCClY8eHPMNGheOJFmBISwEDvB3uagO7C4Jrxg6s5kWUuUhpKUfm9SrhYJEOtAEU
         hjXoKe+OuIAfPa/BVtQif2iyNiiueY4rUlwZ45CkgLSCUiDs+scJ12WdUQNRRztD0WPf
         SKwQ==
X-Gm-Message-State: ANhLgQ3wVUnb3u63e/XNXDHHFvBB7TSfPAv1LOsYFYaoj/shJiVbWW8X
        DSWJB4/NpEQJrsVYjG6Gm6U2PBdHGXdxQT31qhkcl4j7QOW1
X-Google-Smtp-Source: ADFU+vvHwabh6/XT3HQsMvsns9bvDqN3/9G4mkXHM92526jZauR7yd6nL/ccsz/Mvu+hTOSZfNJXAFtWrHfa8tJOTfHuhC7B/BNp
MIME-Version: 1.0
X-Received: by 2002:a5e:880e:: with SMTP id l14mr15608634ioj.8.1585676161841;
 Tue, 31 Mar 2020 10:36:01 -0700 (PDT)
Date:   Tue, 31 Mar 2020 10:36:01 -0700
In-Reply-To: <000000000000da6059059fcfdcf9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005b022005a22a0050@google.com>
Subject: Re: KASAN: use-after-free Read in skb_release_data (2)
From:   syzbot <syzbot+a66a7c2e996797bb4acb@syzkaller.appspotmail.com>
To:     davem@davemloft.net, festevam@gmail.com,
        gregkh@linuxfoundation.org, grundler@chromium.org,
        hayeswang@realtek.com, johan.hedberg@gmail.com,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        marcel@holtmann.org, nishadkamdar@gmail.com, peter.chen@nxp.com,
        pmalani@chromium.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit d9958306d4be14f4c7466242b38ed3893a7b1386
Author: Nishad Kamdar <nishadkamdar@gmail.com>
Date:   Sun Mar 15 10:55:07 2020 +0000

    USB: chipidea: Use the correct style for SPDX License Identifier

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16d4940be00000
start commit:   63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d2e033af114153f
dashboard link: https://syzkaller.appspot.com/bug?extid=a66a7c2e996797bb4acb
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c25a81e00000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: USB: chipidea: Use the correct style for SPDX License Identifier

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
