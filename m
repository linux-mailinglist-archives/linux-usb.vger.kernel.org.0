Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039152681DC
	for <lists+linux-usb@lfdr.de>; Mon, 14 Sep 2020 01:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgIMX2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Sep 2020 19:28:10 -0400
Received: from mail-il1-f206.google.com ([209.85.166.206]:47067 "EHLO
        mail-il1-f206.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgIMX2H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Sep 2020 19:28:07 -0400
Received: by mail-il1-f206.google.com with SMTP id e15so8780014ile.13
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2020 16:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=D+qhwHs2RywVyrt9MUYGTs6v5PuBxbWHYAGVCTS5lmc=;
        b=OdRn81EM46qYPDAcx4kqFbJql5D782PPqC7ZsWyD+d2MB/l0jTuOnfWyYN2oIqIGiM
         fOanxx4Ijv+kn3MHpgC1fa8X2MZJuvrDubbpU/0A0fF5kf11ZHKBajRy4NwlbGifxOrQ
         jx95asGv4JQWynWFDFdeQQIkypg/LNeqNz0ZcmJ/SDw/tiryeoqv7xVC5uw9Ufe8it30
         5snAa33/jiiAhlh6k+8ubUi5D/GMqjiX5KD8rjrI7OY7UPXQdvs8n2hE8WSuxUyUn48W
         Lap7JWeb+Rh+PfQTkbIcss4FP4cXBfFfkNeneA8PL/uN30pXNXQzaJxxZGo8DDbXJFNQ
         H/Ng==
X-Gm-Message-State: AOAM533Vvg9KDuTOwLxzKaqpU+73qZygEDFlyzHgGm91aN5nRsT5AqDf
        FFgKAwok8CrkaaypTT4wja9siVC7wsWk1sR8UejQ8l0QOBcZ
X-Google-Smtp-Source: ABdhPJziDDExkYicRzETff9ZNqhVBGnQHxfHPAliR2osZFjoaOK7gCkLWDk3vFKV4Yw+W6CibO8ph/NOBKMIT0cqrDtvulGORPa2
MIME-Version: 1.0
X-Received: by 2002:a6b:8d57:: with SMTP id p84mr9088364iod.206.1600039686354;
 Sun, 13 Sep 2020 16:28:06 -0700 (PDT)
Date:   Sun, 13 Sep 2020 16:28:06 -0700
In-Reply-To: <0000000000004a72f505a5a16525@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000021bf6d05af3a4528@google.com>
Subject: Re: WARNING in media_create_pad_link
From:   syzbot <syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org, dominik@kunzwerk.de,
        gregkh@linuxfoundation.org, hadess@hadess.net,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit adb6e6ac20eedcf1dce19dc75b224e63c0828ea1
Author: Bastien Nocera <hadess@hadess.net>
Date:   Tue Aug 18 11:04:43 2020 +0000

    USB: Also match device drivers using the ->match vfunc

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14ed5f35900000
start commit:   75caf310 Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=129ea1e5950835e5
dashboard link: https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12e9d39a100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=179ec486100000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: USB: Also match device drivers using the ->match vfunc

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
