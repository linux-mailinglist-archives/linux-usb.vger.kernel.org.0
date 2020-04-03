Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4E819E12C
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2020 00:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbgDCWpH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Apr 2020 18:45:07 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:47819 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgDCWpF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Apr 2020 18:45:05 -0400
Received: by mail-il1-f199.google.com with SMTP id a15so8534736ild.14
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2020 15:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=zSmQHMpVTPuNbvjhNgH4TOFQnalp5wC6Xun5Vz1zvC8=;
        b=hPVMkUgZEnD88Sa02odaExW7nNi1Ir6mEquVaEQUuRZiMS7Lk3oHwFNBxBN/6RT1L1
         lptLj/XimcN/TumqlphoDJ9HPAjcJ5bCn6E/I7OZvbV/2nxoQoLBh8GamrW3NK31f7hp
         GpIYFU7OF/MOmro1Fb+XDxNdgF34mJXh3fbdK7WGwMBEnt/vrrz614CVlkINqjUB+tjO
         2varzY9VMI3viPHN3WyEic6x4VpyrNsMhyXPfzakwB3oRhmFCZUdp/0sKeYS9jNYWiRP
         P1b6l3URehAceqgB1eCM3RJYfTDPSgCimcl8u9l7W05Xh7XEw6Y8LnNH8Qmi4ksZukzb
         Ppgg==
X-Gm-Message-State: AGi0PuZRYJsDEgzASOzGII7d8Di5adWmkH6CIruJ/g4Eqdj/6RKJ4l7D
        AOBUjkdAU5Kcd0qdHake+oIUNPHsGut4JMbBGXMWe/2g8QyW
X-Google-Smtp-Source: APiQypIKDmUyBf9guvJkvEFIs6BXHK+tEO0WOLsZVEYo5TOyYoc094K76H4pzciRloGviGw2V0QWvIABWL18PjwKEBogYoICkj7b
MIME-Version: 1.0
X-Received: by 2002:a5d:9e4d:: with SMTP id i13mr9625291ioi.43.1585953904624;
 Fri, 03 Apr 2020 15:45:04 -0700 (PDT)
Date:   Fri, 03 Apr 2020 15:45:04 -0700
In-Reply-To: <CADG63jAuwRJ4uRH2qUGgqPP+Cjq0w7PrKziU4G3jWS3K4wpJog@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001d8c7d05a26aab0c@google.com>
Subject: Re: KASAN: stack-out-of-bounds Write in ath9k_hif_usb_rx_cb
From:   syzbot <syzbot+d403396d4df67ad0bd5f@syzkaller.appspotmail.com>
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

Reported-and-tested-by: syzbot+d403396d4df67ad0bd5f@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=a782c087b1f425c6
dashboard link: https://syzkaller.appspot.com/bug?extid=d403396d4df67ad0bd5f
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15bd0cfbe00000

Note: testing is done by a robot and is best-effort only.
