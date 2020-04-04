Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C136919E2A1
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2020 06:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgDDEJG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Apr 2020 00:09:06 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:54567 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgDDEJF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Apr 2020 00:09:05 -0400
Received: by mail-il1-f197.google.com with SMTP id m2so9118264ilb.21
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2020 21:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=diBIYrBkL43yhmYF0/S2uMZTr+kD81tZauofr3nRl24=;
        b=Yv55PPHb/MSyL9P0Z5wWsMA4BcwztJQYMNorPAQLsOiNAYBUiurJiKf5vnPmMNfWGZ
         fsziEMAFa3DJXZwsXbjRrDbP3MauwmZ07EfjekQcFpQh3z0GqQGaxti824MciMsC98kn
         65idUehwQtghD6cs+WzxGVBoFZ1ke6aKlHN0gKDrOkm3B4jq/LjArCZUu4OQX3zzcaoC
         34KzlWeHplVrBVfdlkPROyBA6AaY+CxTIfSmYXinc6ZRB53DNUI0v1xU+klIdDqz2DcK
         8lMr0ms7KRIxQFN/roLMithqWFKU+4iNCAiS1nwdiooSAZUtCIyUkTmrxZcRfPHgxNNM
         HcQw==
X-Gm-Message-State: AGi0PuY/LE6j84mBKviw0xc3qrDnl3c1qWgYv/u425yYu1EKqcHDl0JX
        UbvxsC3NUF5ekGtGPOOCajuPkKRoGQewEUsLQOQc5kwYRltK
X-Google-Smtp-Source: APiQypJ5efjfRCN5u7ZAYjDOHXe+DOFRnUU7zbwH7K1RJaIG4HFLng7f7L5dljhYeD3j82EhyOQlk1THoej8y+TkewC+4f/Gn6uz
MIME-Version: 1.0
X-Received: by 2002:a92:d108:: with SMTP id a8mr12182305ilb.107.1585973345184;
 Fri, 03 Apr 2020 21:09:05 -0700 (PDT)
Date:   Fri, 03 Apr 2020 21:09:05 -0700
In-Reply-To: <CADG63jDQEbMbmRsmQ=xVQyG_Gy=vqTYhFZ1J+3k1dTX_K75s6w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dcf19a05a26f3110@google.com>
Subject: Re: KASAN: use-after-free Read in ath9k_wmi_ctrl_rx
From:   syzbot <syzbot+5d338854440137ea0fef@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, anenbupt@gmail.com,
        ath9k-devel@qca.qualcomm.com, davem@davemloft.net,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+5d338854440137ea0fef@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=a782c087b1f425c6
dashboard link: https://syzkaller.appspot.com/bug?extid=5d338854440137ea0fef
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11646f93e00000

Note: testing is done by a robot and is best-effort only.
