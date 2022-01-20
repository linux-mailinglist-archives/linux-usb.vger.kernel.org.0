Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E5849539A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 18:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbiATRzI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 12:55:08 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:39840 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232976AbiATRzH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 12:55:07 -0500
Received: by mail-io1-f72.google.com with SMTP id p65-20020a6bbf44000000b00604c0757591so4460521iof.6
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 09:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=PgHxSdlHdOrLmXID6kwrwLEwhOW4ZwdFFAu3sMkS4us=;
        b=bDK/eoUL7wT7/Nw4D9BrQtmn0vNBK+K5uZzKzHOxA62mDGC0VBDbaUirkZWruRpoS7
         6kYXSRZeB9fv9qXgzzE6WuApiITPQSi6rs6T3GwBLI6/Vilf6wto5RMT8cT8TiTbv3dh
         5eQcpqHtinlOnVIHXqBU9MUcbbJIyKwb1EDujHfNa7j8VL89x8hxbPP2QwY8Otmv6kKE
         gD2gJS8KTvbzR396uuIFjXIXyWflXcQ0JgkWUN9eGQeOC6ci9IZegP+dSkHse8OjDVlE
         7c9Q5XfgRtIUM8H+OWqGkzoA9H4Jbm0wRqcLn+0VurodRTyQFI65lWH+YCy8U7FQv5DF
         f59w==
X-Gm-Message-State: AOAM533kf7qgKzGRunM0JGPTdxCtWHRBQOdDBnxQ3pwWTRLEBAxjaCPG
        EaPodZrEd23BnBckn9+wB13edrYbO30wDV6qFR6BjrSrKIEC
X-Google-Smtp-Source: ABdhPJwYKv/aqTjtiFeKjgHzsrq4lX7eFkoOPieYwlVboN334XuAVGOTylthd+c/LVLblNC0nJaUNyuIGZNe44NNe6cnKynDC/Nu
MIME-Version: 1.0
X-Received: by 2002:a92:ca0c:: with SMTP id j12mr39083ils.105.1642701307187;
 Thu, 20 Jan 2022 09:55:07 -0800 (PST)
Date:   Thu, 20 Jan 2022 09:55:07 -0800
In-Reply-To: <YembypBPqEXg+YB+@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e3395b05d607330c@google.com>
Subject: Re: [syzbot] INFO: task hung in hub_port_init (2)
From:   syzbot <syzbot+76629376e06e2c2ad626@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, hdanton@sina.com, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        paskripkin@gmail.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+76629376e06e2c2ad626@syzkaller.appspotmail.com

Tested on:

commit:         6f59bc24 Add linux-next specific files for 20220118
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
kernel config:  https://syzkaller.appspot.com/x/.config?x=94e8da4df9ab6319
dashboard link: https://syzkaller.appspot.com/bug?extid=76629376e06e2c2ad626
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1596bbdfb00000

Note: testing is done by a robot and is best-effort only.
