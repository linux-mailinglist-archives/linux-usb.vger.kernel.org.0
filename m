Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC7842CD4
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 18:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406547AbfFLQ7B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 12:59:01 -0400
Received: from mail-it1-f200.google.com ([209.85.166.200]:35351 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730428AbfFLQ7B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jun 2019 12:59:01 -0400
Received: by mail-it1-f200.google.com with SMTP id j10so5604706itb.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2019 09:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=w+d58fwxVEghqdBTL6OdFKQGL56looaKOR87EN5fMyI=;
        b=M8ZM7y0bdBY0uvEkRuKOVOZYAfOyiyxh/vumA6Xrz3Sq/wIhZNYz/8c99kIv2EMUO6
         GwIn8yx6+op9RfsxkCUjdWyxkQ7ThD+DzWEXOr25vgk4LPojbEJtUPY46aWMrQAPtQII
         /AzIuz9AlGsgeESY8M/c3vS2D3zcVXzwSqqZfch47ZWo4h8HEEoY/UlWep0T7fdXHEMw
         BpNYEccUv+jeilDFRc+0XU7YdxAPMtwfKPgV4mf6BZZP4nIXYpwN+cemKRt8fKXiH2wj
         30dN/xZXquadJ83AbwpejostIgGWxCGRgqyqFBmNO3wOLDF89XB8Lr39TVDTQA9rStNu
         WVuw==
X-Gm-Message-State: APjAAAVYVULJGas/ArmnVeNMpPcslvXjb6cv6TCfKxKLagdifTNXj1NE
        7Lt8QqHqxwf5ObN/4y8Gl66xXkcj5MCelm/EfJfohYslEtfy
X-Google-Smtp-Source: APXvYqy+d3bgPSksKj/GZ6l17+4OtmOMiusgDBDhfkPRefGdUEPiGlxdnCa9vMOOT8gqL3aVm/rMw7s9G7469ZfCQsjH5cNtRoZr
MIME-Version: 1.0
X-Received: by 2002:a02:4484:: with SMTP id o126mr4901697jaa.34.1560358740768;
 Wed, 12 Jun 2019 09:59:00 -0700 (PDT)
Date:   Wed, 12 Jun 2019 09:59:00 -0700
In-Reply-To: <CAAeHK+wpzHG73AbB+199-TN35Kb1kEjGrKScSqU++7q7RSUGGg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007741b1058b235467@google.com>
Subject: Re: INFO: trying to register non-static key in del_timer_sync (2)
From:   syzbot <syzbot+dc4127f950da51639216@syzkaller.appspotmail.com>
To:     amitkarwar@gmail.com, andreyknvl@google.com, davem@davemloft.net,
        dvyukov@google.com, gbhat@marvell.com, huxinming820@gmail.com,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, nishants@marvell.com,
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
syzbot+dc4127f950da51639216@syzkaller.appspotmail.com

Tested on:

commit:         69bbe8c7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=39290eb0151bec39
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14171fd2a00000

Note: testing is done by a robot and is best-effort only.
