Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2052247B
	for <lists+linux-usb@lfdr.de>; Sat, 18 May 2019 20:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbfERSbB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 May 2019 14:31:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:40809 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbfERSbB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 May 2019 14:31:01 -0400
Received: by mail-io1-f70.google.com with SMTP id d24so8176491iob.7
        for <linux-usb@vger.kernel.org>; Sat, 18 May 2019 11:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=5UxPqyqpEqIg/qruEb6a7Im9QP9xMl5nRiEBDpgwPDQ=;
        b=qkooi2sS4TFs/onVxUxg57xq23v2RHYGJuBXhwM6zEiM1wFCJVAwDK/RaWwy78szvY
         hhc/NUxhLH/wumKiQ6zRtT8lq7nVoMwblw6o+QDieBK/3MfobXEEwhKEr/BCnR+WIIEK
         YFuDQn967jJqEYj+pnkNn7u9SfdVQYRVDR9ArNIckBrV0iZJQzi2/w81lL26O5SBYSp1
         wry0tfjFy2MgKD91E23ctbaHH0Crb6+vQIOm/yDPSDWMx7vrp9qBEWKXFXBkLhbKiEi5
         E2uXDcM5P9y3cXav1XBIs4R6sJLtPG4eM07wwk2q7WiYhTtEUnaC4CWaEf60j1CjbiqP
         jeXQ==
X-Gm-Message-State: APjAAAXFKJ/grAXlQxPan8KikbQjbECA7cnh6YsggRhllf2mrXW4jL92
        Cka6Do7e7/NpyynkCiR8xI/w6Sh5a0KFYjjEBGXEIgcDVPJg
X-Google-Smtp-Source: APXvYqxyoPxBCWAJcC7wBdzP5ONzNf8bm0M0WJRQqXxOkD/QkxdxnSlvE17v680NI9Hn+ZjaeUejDcigqV9rbTj2Ln+qA8flWavS
MIME-Version: 1.0
X-Received: by 2002:a6b:4e17:: with SMTP id c23mr9854089iob.178.1558204260940;
 Sat, 18 May 2019 11:31:00 -0700 (PDT)
Date:   Sat, 18 May 2019 11:31:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1905181346380.10594-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000076047305892db3f2@google.com>
Subject: Re: KASAN: use-after-free Read in p54u_load_firmware_cb
From:   syzbot <syzbot+200d4bb11b23d929335f@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, chunkeey@gmail.com, chunkeey@googlemail.com,
        davem@davemloft.net, kvalo@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        oneukum@suse.com, stern@rowland.harvard.edu,
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
syzbot+200d4bb11b23d929335f@syzkaller.appspotmail.com

Tested on:

commit:         43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17e42018a00000

Note: testing is done by a robot and is best-effort only.
