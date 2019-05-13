Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBFF1B9FD
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2019 17:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731321AbfEMP3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 May 2019 11:29:02 -0400
Received: from mail-it1-f198.google.com ([209.85.166.198]:33965 "EHLO
        mail-it1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728777AbfEMP3B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 May 2019 11:29:01 -0400
Received: by mail-it1-f198.google.com with SMTP id m140so160449ita.1
        for <linux-usb@vger.kernel.org>; Mon, 13 May 2019 08:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=3VZ4p/YISWcz91SuVCC0Sel7mLneKp5LD5Zz/ePb6Zs=;
        b=AUlzSc6yoeevdu5QedlLEmeEHOZNcFOGK5YdIPMjL+Z3x1zr6atlNNR04rWn7O501H
         1z0kBJkHaiSrGAh7JGXSb+5xuuHB2ESnsPagJEfaKolpPgpPsOMtNhrLV2OSnzrvr1lM
         EXL/M3p37VDE+0vuMgVgQE9TfdkT4HV6OeYeXvs7zg/qKlW3Oty1jwMyDpqJ0l+lLP6K
         /BSRCvJWY1DSKNYwEQJKUyKzMQgfZS4JmG8HqZP9ZltCPkTRIkvC5Ew+InkRRrcVdK5O
         KqcuebHdoBJbd1PmX+CS9zF7gUZJDuz3JM4JkgrT5LifMqngnolnrm14xF872DU9JRX8
         ACYQ==
X-Gm-Message-State: APjAAAW0SoAxLQKNoMg+hTkLUcm3Mp9gLt1ysocv1bx9ziilJx4oAY8/
        /dC6ekxpRpQaX/6/+CionMI7A1mbqxcjuhnHE9jvMB5DQ5Uj
X-Google-Smtp-Source: APXvYqzhnwgnI+7XB9cPfmqZVvcdHah0xlT4kcjVKXz/Qf4DKOW4yChduCTqpqesYU5a7etL6kRCLS1kRtSqh/cNsjA9kKuMglZO
MIME-Version: 1.0
X-Received: by 2002:a24:5dc8:: with SMTP id w191mr18348892ita.136.1557761341111;
 Mon, 13 May 2019 08:29:01 -0700 (PDT)
Date:   Mon, 13 May 2019 08:29:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1905131046130.1478-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000061c7cd0588c6933c@google.com>
Subject: Re: KASAN: slab-out-of-bounds Write in usb_get_bos_descriptor
From:   syzbot <syzbot+71f1e64501a309fcc012@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        suwan.kim027@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+71f1e64501a309fcc012@syzkaller.appspotmail.com

Tested on:

commit:         43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15912100a00000

Note: testing is done by a robot and is best-effort only.
