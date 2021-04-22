Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3BA3680C1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 14:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236206AbhDVMpk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 08:45:40 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:39830 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236185AbhDVMpk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 08:45:40 -0400
Received: by mail-il1-f200.google.com with SMTP id v3-20020a056e0213c3b029016165a33c15so18217810ilj.6
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=MBoWTyERxFkVDTqj1W2YjlvsjGkP+FMvMXQ4/+ef/wM=;
        b=FUa1bTBrPxFWWjR0pfC2kzQSjdEcaa8Z6L1odRH1IDt7F0UdTsU7rwgTtpeXT4OO4x
         UMaPUADroAKjkqWFBm6jCiL+1pMD5ugFtRUyQcnHZ5VpdgRATos8H/FvZAJaukNIAN2A
         vK+wucCuDIHvJnX5Ozwj/1UL715SWjvr+eCPa1dJdCF5/VM3vtyRfILWYW/8PACcsYWN
         9vHB9hM7YWDKa+wSlDbjQnDOETGy7Fzau57YK2N/hyYzPBtRI7IxKp0TF937/YrX0Wt9
         Mo9FXymjg1v8S4a1wh/vUvh8jC+YPYy4i9BnPCIK3g7I9cdvUKhuOeHYZiQUN/i4jMR4
         5Gpg==
X-Gm-Message-State: AOAM530SKROX69aHmw7Bwc/pbtDoiUAW2kpsdJGSgyaBX/G4SX4QJmME
        RppN4E+bHOMf1b1lQ5FnaEh9VgHzJqx1HELQo+PcGuJiTAq8
X-Google-Smtp-Source: ABdhPJyuN0BKB5Ti+jqSeP7iOBlhpvVRArVK5O0qvZ4zHfzGvQ2tuERMiugAJexNtsJ8Ew+33+T6hNfxGhe9A8lMfvbDBd3edu3v
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d0e:: with SMTP id i14mr2341220ila.230.1619095505244;
 Thu, 22 Apr 2021 05:45:05 -0700 (PDT)
Date:   Thu, 22 Apr 2021 05:45:05 -0700
In-Reply-To: <94aa3e7fcbb225da66961a21c940406ada2bbd0b.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000729ab405c08f0c16@google.com>
Subject: Re: [syzbot] memory leak in usb_set_configuration (2)
From:   syzbot <syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, oneukum@suse.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com

Tested on:

commit:         9cdbf646 Merge tag 'io_uring-5.12-2021-04-16' of git://git..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=f23c86207baa4afe
dashboard link: https://syzkaller.appspot.com/bug?extid=d1e69c888f0d3866ead4
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1699cf75d00000

Note: testing is done by a robot and is best-effort only.
