Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3AE1E9F06
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 09:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgFAHYH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 03:24:07 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:45159 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFAHYF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jun 2020 03:24:05 -0400
Received: by mail-io1-f69.google.com with SMTP id r11so4002198ioa.12
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2020 00:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=dwV5KdRye0e31ymiiDuE0zpC+cSqLV10md4bSh/xCrs=;
        b=KFOezPLiW/B1yOyXoyUTmMXSWTqvCc6nlF6Df1cSvbUyx0Kd4ZTiqbMsRxPifkaB+m
         BlWCKG29PH9tq7r1BS310GpKVfnmJND5PZyGlNjhwJmLtiyUqfNWfwxlsjNXW/OoZ293
         bo7w2+YU7zUa+yDyOa9tOUB7XY5tmOoYTpAsE+s3zn0eigng6SlAWj5T40mp4bsrhERI
         AWwoLbYYw6yKF166GU78EUMeXaBOOkT3veGsuo5OSqc1xFyJlvC67B2K4TEfM2ktk250
         SjS0kR1GW9LF25SvmoiSkTEmZ3DQha6KaTS+kIZVN+mKMH3OT1j2nj49d4baXWbm0QJr
         8HCg==
X-Gm-Message-State: AOAM5315sjLYIZdldvVcx6ttL/nHRgmlP/BXuAK58yhoP4Pi+dxwTxoM
        MYB+2OHerQkg8pUCLGQ/MQi3METeAJ+eK+JMCGuPhyAbajzQ
X-Google-Smtp-Source: ABdhPJxz/d/kvpzjcnGN1c1YCmqhvS4eT/h31O/xXkEEpT7Iu7wQbzsuHtKsgejoNKPcjY0takGTNoR0er3BCM4tLC0eKtzPO+xJ
MIME-Version: 1.0
X-Received: by 2002:a02:1c83:: with SMTP id c125mr19792368jac.112.1590996243587;
 Mon, 01 Jun 2020 00:24:03 -0700 (PDT)
Date:   Mon, 01 Jun 2020 00:24:03 -0700
In-Reply-To: <000000000000bbd09005a6fdc6cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f0261a05a700adf5@google.com>
Subject: Re: WARNING in snd_usbmidi_submit_urb/usb_submit_urb
From:   syzbot <syzbot+5f1d24c49c1d2c427497@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this bug to:

commit f2c2e717642c66f7fe7e5dd69b2e8ff5849f4d10
Author: Andrey Konovalov <andreyknvl@google.com>
Date:   Mon Feb 24 16:13:03 2020 +0000

    usb: gadget: add raw-gadget interface

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=164afcf2100000
start commit:   bdc48fa1 checkpatch/coding-style: deprecate 80-column warn..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=154afcf2100000
console output: https://syzkaller.appspot.com/x/log.txt?x=114afcf2100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=129ea1e5950835e5
dashboard link: https://syzkaller.appspot.com/bug?extid=5f1d24c49c1d2c427497
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d70cf2100000

Reported-by: syzbot+5f1d24c49c1d2c427497@syzkaller.appspotmail.com
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
