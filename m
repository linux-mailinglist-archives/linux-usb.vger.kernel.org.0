Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1BA2407BF
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 16:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgHJOmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 10:42:13 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:45427 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgHJOmL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 10:42:11 -0400
Received: by mail-il1-f198.google.com with SMTP id 65so7917247ilb.12
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2020 07:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=OzRqCxKFuIBYd6uAIlx4xZOrodkSUu/+cChTzUG+OTk=;
        b=Jo+zoNRRyc6yQJ67c8MNXTvjR31zUwCoDXR1OTFQHtejsO+rZ/PjnM/lIfdOlXCLtq
         Nv63+lh5NE08gHe239bSPkRuR/KlCGl1/PRauihxXzliMuUibxSPphpb51RfGYOE9kZc
         KfNnJ311BD7yVx1XojbT5i/CpjYOg7DZl2UeS3YoNY7sTszEjyEv8NkwuG+XkVDg7idt
         MTb2vCyQHvKAAZM34JHgyRgF7Qow3UNeq2os1ndgFJvtP85mW0QkTpF3ys0+kx8fUo5T
         /JHOdBJXTTZvPLOcivKYaI/rEnV1kRftWVzI5igWfnQn4nJYCVtFB7AL/IMluVoIK/rS
         VTzg==
X-Gm-Message-State: AOAM533pgUDQJ5++HU/YmYk0aYpWxZ/pNdOg4JinlpM5+wriGPgWbQzu
        cPxHHIyp705VbiscY5DHReCA+FBw5fIS3UCYsbEWkdc/l5c7
X-Google-Smtp-Source: ABdhPJxXFLShve5fwsxHgj+zHfvKDZxlj0s2XHM3ReDwNCMkS1tJ8mZ5yZkigLmULrkVBmjKY8LGwZ7Q9j1yKl+G27H/VtFlxZ3A
MIME-Version: 1.0
X-Received: by 2002:a5e:a607:: with SMTP id q7mr17629684ioi.16.1597070529854;
 Mon, 10 Aug 2020 07:42:09 -0700 (PDT)
Date:   Mon, 10 Aug 2020 07:42:09 -0700
In-Reply-To: <20200810142441.GB299045@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009d004605ac86f57b@google.com>
Subject: Re: WARNING in slab_pre_alloc_hook
From:   syzbot <syzbot+c2c3302f9c601a4b1be2@syzkaller.appspotmail.com>
To:     andreyknvl@gmail.com, andreyknvl@google.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+c2c3302f9c601a4b1be2@syzkaller.appspotmail.com

Tested on:

commit:         449dc8c9 Merge tag 'for-v5.9' of git://git.kernel.org/pub/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ef84fa8ee48e528
dashboard link: https://syzkaller.appspot.com/bug?extid=c2c3302f9c601a4b1be2
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14ef8e52900000

Note: testing is done by a robot and is best-effort only.
