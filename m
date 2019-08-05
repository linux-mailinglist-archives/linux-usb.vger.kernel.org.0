Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD9C81F8C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 16:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbfHEOxC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 10:53:02 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:50084 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729157AbfHEOxB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 10:53:01 -0400
Received: by mail-io1-f70.google.com with SMTP id x24so92423696ioh.16
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 07:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=I+1sIbfUtHJgkKhSnG71S5jcv7eelCXyj+9A5OXu8vc=;
        b=cD84CIkRw722LeYfxlFrp8iMJDFlsfxulFmbnQ9rWamzkvoScDhIYpGl7aMdKun+45
         zGkIEYwrs+ESermoTxxC+8XtURm8p7X0a/sii7mF0aT4a5ju/Y32hiHIc+pqmn+Po/yV
         J68UuJhnyJ9BApyG+7jueQlEQGVuqXvujkf2K0ARdi9IJkSF1I709UguDrs7wJE7fNFw
         hL4828xg7RnpF7VEPYIDTWcmZuph0EB5Wir2VaYydsHlXtvK6S4dSOlnWk7A5hsHh5OJ
         PRnEA9ILf/IPDyUBc6+7aV45nldp9nEo3oDPxdmMz3mqG7BE4zHXLRjAMTqZIx3uYJ4N
         h0PQ==
X-Gm-Message-State: APjAAAVHmmuLxWtgdVTc1MKgTLVyMuwtrH0QkLnW/xGa5PrngFNHR/ll
        xlDl3xImbs4LY1S3j5CsuLnaK+tMkvSNQrSHqYAE3lTKns+0
X-Google-Smtp-Source: APXvYqwe3bsIWbt14+rj/PUqPKqw+YQyLOTkzq6n7D8gIFgILR1OgK0qfJ96sZyW19hZqdYkaUkDtqOOtfzjd2svYlNYKbKleNKC
MIME-Version: 1.0
X-Received: by 2002:a6b:5b01:: with SMTP id v1mr34488011ioh.120.1565016780616;
 Mon, 05 Aug 2019 07:53:00 -0700 (PDT)
Date:   Mon, 05 Aug 2019 07:53:00 -0700
In-Reply-To: <1565014816.3375.1.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000046bcef058f5fddc4@google.com>
Subject: Re: KASAN: slab-out-of-bounds Write in lg4ff_init
From:   syzbot <syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
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
syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16318b3a600000

Note: testing is done by a robot and is best-effort only.
