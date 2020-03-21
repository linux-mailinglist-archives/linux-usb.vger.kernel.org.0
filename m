Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4E018E198
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2020 14:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgCUNkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Mar 2020 09:40:17 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:42615 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbgCUNkQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Mar 2020 09:40:16 -0400
Received: by mail-il1-f199.google.com with SMTP id j88so7856800ilg.9
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2020 06:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=pyMoj2Ao5xrYueRmpo2CDvoKtmm7H1d6XHU2eunTcBs=;
        b=LFXkNPcRUlPMaezQ2euDQ4jwqlAEBznxd7OFh7gEX2PJalf5QyeaQui9uHI/I/xyhE
         4iKqYXipmxmFr3p1S31t0OCtpnDJgzxMS1ZNIuToof7gr78l5E7PrY+xKC/jPBlrVOXV
         j1621RF36I/9ZrAlpSEAm2pR6QXx/M6cxCR1gK2SRI3gBPCz3H1LPfj6WJIY6DDkZ1eD
         FnHgUx+BReoqHt59yObJSsM5YLLpTpn8bmtwx5z8gffS6qZy23EwrZLWSc4CEiigG8Ot
         WbEk5WeE4XW6TnqKqSr35sn9yJlFV6AYfzlzZ5TCL0eDdRO5u0IypekmAtOrFLoP8B+E
         rwjg==
X-Gm-Message-State: ANhLgQ0VFniauS3jng+fY5sOjaWQs8uC/F2SNtJY1ODBkMCjPMB2aY6v
        nLAWLlkyWre9PbJWcfKAr/h8P5SLq5GIHFGC1wdf3INBstPq
X-Google-Smtp-Source: ADFU+vsuPK95kr3EfZG0nV0RC/z5+OfOuDJQiDqIdZLlH1alFFTQmOA7fA8/R9We5nWodEngkn6TZ1bMbCR1u0bDCecZovj1wGUe
MIME-Version: 1.0
X-Received: by 2002:a92:890b:: with SMTP id n11mr12898208ild.54.1584798016082;
 Sat, 21 Mar 2020 06:40:16 -0700 (PDT)
Date:   Sat, 21 Mar 2020 06:40:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ca19c205a15d8aca@google.com>
Subject: KASAN: slab-out-of-bounds Read in garmin_read_process
From:   syzbot <syzbot+d29e9263e13ce0b9f4fd@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        johan@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e17994d1 usb: core: kcov: collect coverage from usb comple..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16255ce5e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d64370c438bc60
dashboard link: https://syzkaller.appspot.com/bug?extid=d29e9263e13ce0b9f4fd
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1376a3f9e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c65fe3e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d29e9263e13ce0b9f4fd@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in __le32_to_cpup include/uapi/linux/byteorder/little_endian.h:58 [inline]
BUG: KASAN: slab-out-of-bounds in getLayerId drivers/usb/serial/garmin_gps.c:208 [inline]
BUG: KASAN: slab-out-of-bounds in garmin_read_process+0x1b0/0x2e0 drivers/usb/serial/garmin_gps.c:1142
Read of size 4 at addr ffff8881ca74abe8 by task swapper/1/0

CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.6.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
 __kasan_report.cold+0x37/0x77 mm/kasan/report.c:506
 kasan_report+0xe/0x20 mm/kasan/common.c:641
 __le32_to_cpup include/uapi/linux/byteorder/little_endian.h:58 [inline]
 getLayerId drivers/usb/serial/garmin_gps.c:208 [inline]
 garmin_read_process+0x1b0/0x2e0 drivers/usb/serial/garmin_gps.c:1142
 garmin_read_int_callback+0x19f/0x746 drivers/usb/serial/garmin_gps.c:1279
 __usb_hcd_giveback_urb+0x29a/0x550 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1716
 dummy_timer+0x1258/0x32ae drivers/usb/gadget/udc/dummy_hcd.c:1966


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
