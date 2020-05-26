Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD991B6683
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 23:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgDWVvG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 17:51:06 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:46852 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgDWVvF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 17:51:05 -0400
Received: by mail-io1-f69.google.com with SMTP id e76so7851010iof.13
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 14:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Ml9eSiK6LlPOUyvXnLydA6gAwYERXzL6OHKU+KP1YiY=;
        b=M9cFfPLW6BTGI1R0xDMbgVwmMHtIg5nNFR+MySbCpBCuJ5mdiyE8yqWlCZc8Uocuck
         Urkv7LMMMkGIW62AroBCdC4MDQCzHdocwY08TmuHiduMtCRRO6JLG9c+cev/jGA+8jHx
         qp4YsokAIz6XMtyioFHQ4AwHKhwqi3zbBRNFmZQLIkEJB/gc7+SlTGpsJxVwhjj3PVxf
         aJbS28bjYXARvaPz+9wUKb/74yW1CAwXw93M/BDXiLybbj6EhDPEkHUNMxsJpBJVbWUz
         J9Jk5j85udN/+tWIzVbz2FhnnAdWHrqWaYk1sWDuGMl9VunQzmNTtKHidMZjFA7B05m+
         /XZQ==
X-Gm-Message-State: AGi0PuYaacR3OTK2ILj33aTUjIoLCFeeXTx+jOreZEhWOTcTXoT8V+sf
        E/IMPrRBxeX1O8Hq3OluWIwx2EnSa9zIlEqVyOJd5QavOOA0
X-Google-Smtp-Source: APiQypK4UYw8sKRyqAnKtLm7WUHaf5IanLWVJURM/MUD6sVdhpLw+Olc4COMhDo2kBsAQbOCbMLV8EUmTudUTHgOgygkJuzrcQst
MIME-Version: 1.0
X-Received: by 2002:a92:cece:: with SMTP id z14mr5406607ilq.147.1587678663436;
 Thu, 23 Apr 2020 14:51:03 -0700 (PDT)
Date:   Thu, 23 Apr 2020 14:51:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004231654460.22192-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c06f9105a3fc3ed2@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=126fd687e00000

Note: testing is done by a robot and is best-effort only.
