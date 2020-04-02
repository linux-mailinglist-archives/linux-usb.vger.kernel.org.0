Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFB619C679
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 17:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389638AbgDBPxG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 11:53:06 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:40206 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388677AbgDBPxF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 11:53:05 -0400
Received: by mail-io1-f70.google.com with SMTP id z207so3238847iof.7
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2020 08:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=y7vyX4dwNfImoAb2kTpG/mlept3XB7l7BPC3h9R/j0U=;
        b=tsvkxzLn5lz+or0DwIRbdaJ/mbyTQpkTpbfVi5XiaqJJRqJ9Jl3FlZsojRpvQN2R1a
         I6YLaBrvMIA7Xy5xHaI5IU9hpj9C0A9dR1HAfFofCyNucokASla9H4GuObzpSY1pXKah
         wpSjeiO+hLNrMm9Dv+PJiqahgbO0XXhsYkkC+E+NIFcWwWHEwFxnvUjc+PgW8JOQ6noL
         Wqf5FoljeQYRDKuKaXCzUHgyezB8N9+sMyp0yPUf09CSibrI0olwc70V+o1RB+4BOvBs
         dtYZIbn6goTj5ok62NHG9ARxzoVvT1PPlqnKmGEVcs9fFrAAunt4sSTik/9Y/40zH98U
         vaDg==
X-Gm-Message-State: AGi0PuY+wZ4K+T6Vyy4e+MZh7D1wIPWw4jVJc785PUnSsfcpj6SCdIOY
        LdHRcwqUJM0s96BSxbILBjbdWMhaBmj9mKcX8yTZ8j5/Wt3k
X-Google-Smtp-Source: APiQypIbeARlH3te42UHKEJijHcRjo6btS3ejyDzsS2fN0V2D0ZR4C80RFaYtWLaMBu213izZhliy4NrEep2SZ4XhPMyB9f31M4D
MIME-Version: 1.0
X-Received: by 2002:a92:8604:: with SMTP id g4mr3792122ild.245.1585842783220;
 Thu, 02 Apr 2020 08:53:03 -0700 (PDT)
Date:   Thu, 02 Apr 2020 08:53:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004021133440.13377-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c3793205a250cb6a@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
From:   syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=143c2c63e00000

Note: testing is done by a robot and is best-effort only.
