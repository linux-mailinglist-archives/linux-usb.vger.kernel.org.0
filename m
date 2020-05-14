Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E1A1D2D24
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 12:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgENKoF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 06:44:05 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:49435 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENKoF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 06:44:05 -0400
Received: by mail-il1-f199.google.com with SMTP id z18so2758770ilp.16
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 03:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=hoXGVtl4km8jJ8wNjtYih/eDPSljKbLmILj3chomVUg=;
        b=huwasQ8cqQfeVmmOqXl9BKTfLOCyWhl+V4XPIT95V4zQ0auBbJ70l6B9o3TGUEt+EM
         dcAnlaLup7aVdfwCu2GhzS+zZ+GT9Zp9EQP9SG26qCWjqTt4qUGo6DdVRWDl4ozmjNM1
         P9owCGOM7rwfkD816ES3S+vDniOt+dIa2OGg9aXD3n1s2/FiOCI1uc6gHOljQ9Y0M9m5
         6QQPVFXZl3Pno0dvKDwscHrq5fuPx5SyF6ezxRkSNf7S/ojJRz+vW5ZmuLOR7h9jeTTd
         /7Verr3hD9G3zhXkXLMHabCGZDqAIfJqGYdAVTvo2uApVOzSeOz/tzfIzW6NT3W5xZJ9
         6pBQ==
X-Gm-Message-State: AOAM530ZEd+CpUCSk+Sh/AGvY3r0qS5FosWNou0pfCMIweorZJpj+zHP
        Mv28iwIKIMpsI58tufhO4xGJjbSUiEZJa978RBNTj/9Ej5PB
X-Google-Smtp-Source: ABdhPJzXo+5o8hNjij+UzCHkt9MgIvEAIQE+bNQv2oX8TNmIwCsWtTIm+byzrRQU1GzPoCsb/WkxdGdHVzDOB8z2t/DmzKj+OJKn
MIME-Version: 1.0
X-Received: by 2002:a92:8747:: with SMTP id d7mr3992371ilm.235.1589453044173;
 Thu, 14 May 2020 03:44:04 -0700 (PDT)
Date:   Thu, 14 May 2020 03:44:04 -0700
In-Reply-To: <20200514092004.GA1577276@kroah.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000015d1cd05a5996049@google.com>
Subject: Re: WARNING in memtype_reserve
From:   syzbot <syzbot+353be47c9ce21b68b7ed@syzkaller.appspotmail.com>
To:     bp@alien8.de, dave.hansen@linux.intel.com,
        dmitry.torokhov@gmail.com, ebiederm@xmission.com,
        gregkh@linuxfoundation.org, hpa@zytor.com, jeremy.linton@arm.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        luto@kernel.org, mingo@redhat.com, peterz@infradead.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+353be47c9ce21b68b7ed@syzkaller.appspotmail.com

Tested on:

commit:         d5eeab8d Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=b0212dbee046bc1f
dashboard link: https://syzkaller.appspot.com/bug?extid=353be47c9ce21b68b7ed
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12bd6806100000

Note: testing is done by a robot and is best-effort only.
