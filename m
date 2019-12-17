Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FF8122CAA
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 14:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbfLQNPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 08:15:09 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:41518 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbfLQNPJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 08:15:09 -0500
Received: by mail-io1-f71.google.com with SMTP id m13so8320477iol.8
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 05:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=B0G27HutWkfu5xLB9fvDAdsszGJaL9/rxUz4vJbLL+w=;
        b=NUIf/WQnxnx5QdcIC10PY0VZ/iUkKpc/8FOi13uimNhUClGX+e67WLZft7tM7ljuKj
         Gf6pwP4qoFAIxwgx8e2V+sTFpUQ7D31f5VQgFWZ+/pAhXzxTrkoUKV2oeTgpCVcRi1vc
         hwEkyn30wc0jYw2au1pc2k4zHslFrV7JmUYpr0+qqjJGW7hrvxqToVr1sEqw7f9SNOv1
         XW8VMQoH1P6IwEHacH+b5fNvwVqtcv3HUHEsyY5h8nNc2GfLlwHStB9zqnujJKtY0Sgi
         cEzGk3s9NX24bqh57lb9nOmdPDvX6bjmJalRuLeltwZEI5MyGphdMbbmZM6mQpyjCLG4
         iYJg==
X-Gm-Message-State: APjAAAUldaINnItawn4heusZOcqe3GAZW4oax31ZK8N7+hSFDDyAuqRY
        YSNoQQAI0i+T366+oZWA3N0qUtv467JjTRLZJpaFW+SSA+X6
X-Google-Smtp-Source: APXvYqx35F467ecFTaqSMdHfjN9WKsv2Kzryk40TTIQNGLKBrorU/8D6WyfPEa0Zrb4oxIuHvQhoa60HGb1QviwYQORZIvEHC4xO
MIME-Version: 1.0
X-Received: by 2002:a5d:8854:: with SMTP id t20mr3613549ios.121.1576588508566;
 Tue, 17 Dec 2019 05:15:08 -0800 (PST)
Date:   Tue, 17 Dec 2019 05:15:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000029d340599e61e11@google.com>
Subject: BUG: bad host security descriptor; not enough data (3 vs 5 left)
From:   syzbot <syzbot+7b2f76fab6cdba59689b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    4cc037ec usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=17597049e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a2d3f61a19fd0cf1
dashboard link: https://syzkaller.appspot.com/bug?extid=7b2f76fab6cdba59689b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1724ae99e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ed23a6e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+7b2f76fab6cdba59689b@syzkaller.appspotmail.com

usb 1-1: config 0 interface 0 altsetting 0 has 3 endpoint descriptors,  
different from the interface descriptor's value: 4
usb 1-1: New USB device found, idVendor=13dc, idProduct=5611,  
bcdDevice=2f.15
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
hwa-hc 1-1:0.0: Wire Adapter v106.52 newer than groked v1.0
hwa-hc 1-1:0.0: FIXME: USB_MAXCHILDREN too low for WUSB adapter (194 ports)
usb 1-1: BUG: bad host security descriptor; not enough data (3 vs 5 left)
usb 1-1: supported encryption types:
usb 1-1: E: host doesn't support CCM-1 crypto
hwa-hc 1-1:0.0: Wireless USB HWA host controller
hwa-hc 1-1:0.0: new USB bus registered, assigned bus number 11


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
