Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B252372422
	for <lists+linux-usb@lfdr.de>; Tue,  4 May 2021 03:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhEDBIG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 21:08:06 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:54238 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhEDBIE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 May 2021 21:08:04 -0400
Received: by mail-io1-f71.google.com with SMTP id q11-20020a5d87cb0000b02903ef3c4c5374so4561598ios.20
        for <linux-usb@vger.kernel.org>; Mon, 03 May 2021 18:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=mHxj7gfCzBhBwoGIna8lGYdS0gFkx9kneQlodxRr0+0=;
        b=fGhNKqzGldfHd1HBZpciEHhKmq3HwI9ExWDcumUUy79fk74iji6B1HcLv0EckfkFnP
         Vuc7C4g8ejz/lEcaCKd7mMiaNgynW0vhN0ARufs8wCk7b1OKh/elCX3Kbg9t3pTzv1me
         Y0dcp/hfSfrLIRMHo7Edi5LCUMsP11aibVvhBdq6vtOrJxfxXsazKNgYv8QnmHLdVw7k
         M+hT/mEaCvjM0OV9VZdoZMoGXh+vVa8s/HTm2D0poNF0XcD8hqYdKwj6zrpM9I3f7aCS
         zYCuuH0+qYx883mV6xALZ8foP67hIVI/uIOd5kHvZmouNLGZAmNryOH+9LwR0cPxBa8d
         ERug==
X-Gm-Message-State: AOAM5305C/b8nteOD138HPviNOIIXy3KN951WAH1c1yLSz3rzhdLiy0j
        tODNkAofRp1vQElUi9j6V2Wwfvb8Bpn6Z7xJ6IRoDq+RYuZW
X-Google-Smtp-Source: ABdhPJzfFUa69m/bkEQ/VR6vmJYrlPxEo+icvWpLAw5Qk1Oil/psVx4WLV8FdY9+XE3PxhIk/5BItd+QMqb2EsRqSDtAKMJtGG4y
MIME-Version: 1.0
X-Received: by 2002:a05:6638:f11:: with SMTP id h17mr10040830jas.102.1620090428937;
 Mon, 03 May 2021 18:07:08 -0700 (PDT)
Date:   Mon, 03 May 2021 18:07:08 -0700
In-Reply-To: <20210504004700.GA638732@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000855d9805c176b211@google.com>
Subject: Re: [syzbot] WARNING in do_proc_bulk
From:   syzbot <syzbot+882a85c0c8ec4a3e2281@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+882a85c0c8ec4a3e2281@syzkaller.appspotmail.com

Tested on:

commit:         d2b6f8a1 Merge tag 'xfs-5.13-merge-3' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=751a9df13cd00e8a
dashboard link: https://syzkaller.appspot.com/bug?extid=882a85c0c8ec4a3e2281
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1787af43d00000

Note: testing is done by a robot and is best-effort only.
