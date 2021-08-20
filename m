Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179BA3F2423
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 02:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235552AbhHTAkp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 20:40:45 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:50106 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234160AbhHTAkp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Aug 2021 20:40:45 -0400
Received: by mail-io1-f71.google.com with SMTP id k6-20020a6b3c060000b0290568c2302268so4335437iob.16
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 17:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=GropDxqf+CptwvOKGVu50IkRe2l+vNSfWE61IL/QJM0=;
        b=PFkBUBvGzWBTa2i491zrkws8Nean760xYcc/AZrqOM5cBPqoDWdh7b6+l7d5qKlSfy
         lZHp2lkjlLzPJxsB1yq4VcYFmZJH+HFEPo4XOORHjF4p/0stsC3boQOK92caEISUx33Q
         69KWkFVJUc8iaOvduP7j8mH42i84wbwODQi8L/L3lK+pkZrsPHmlOATBr5XM/szyK9ed
         ayTOLYsFjbBzonAnmIbGLMsxH6LVkgYbkL1pMYvl9+rtq2BSgGYaM02d2WUN8WdZVpbY
         TguQj3nUr74RDG5yxTpY1cxpjEq90AdmPYWm5kF3ZmoW/WHyJ5W71bHyt/D8YWqr9lEp
         OJTg==
X-Gm-Message-State: AOAM530euyqKvGt/asHpzWA0Qqs2x/8+rQHo4EYVefTEcbNJXWyuUUAU
        dd9K2iYRyni+8FkNbXgnlKoUocXgy440eizMhCD1Fw0vnqWs
X-Google-Smtp-Source: ABdhPJzkNzvPryhTmpMtYws/Z3kk/RN/BNefgUkDRA/53dPPU6iCfwk+gB4EEQakdAPwZKcApZCOSV5zO6LtsvAlnIaFZlWC1D5U
MIME-Version: 1.0
X-Received: by 2002:a5d:9486:: with SMTP id v6mr14019457ioj.163.1629420007923;
 Thu, 19 Aug 2021 17:40:07 -0700 (PDT)
Date:   Thu, 19 Aug 2021 17:40:07 -0700
In-Reply-To: <20210819195300.GA8613@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c322ab05c9f2e880@google.com>
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
From:   syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mkubecek@suse.cz,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com

Tested on:

commit:         794c7931 Merge branch 'linus' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=96f0602203250753
dashboard link: https://syzkaller.appspot.com/bug?extid=9b57a46bf1801ce2a2ca
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=119cfb31300000

Note: testing is done by a robot and is best-effort only.
