Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6A8B4D14
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 13:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfIQLlB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 07:41:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:49376 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfIQLlB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 07:41:01 -0400
Received: by mail-io1-f70.google.com with SMTP id j23so5343878iog.16
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 04:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=TQhhyZzw4ZIrhNwvPs/n5pRvZA2rc0RlRwXQQDytjlk=;
        b=WfLWJeLHTiFYqHGDPj6r1vN3M37iG/lqgPICyIN/oBqaIrIFcZPKlxd6f2PDSEDnqh
         nL7nstapv28CRf6Z5FuU+iNQw4gKCjCGA7ZQuJXxEEapyJRgEAH4/MnIgJq1qK+tjR5G
         yvOvghhpM1iU8fTLDYcX9X5maKoQPiIl62uxf/Dm9OCzaQSQYX74e49uqUpgxpw2F37D
         +8p8e+tpZZxyowpBmNgXeI9lSw92jwEtCmY0ngsFoB0cKUqrV5PW8whGWQJZn7slC7II
         zwDkUqR5Ri2wlhifkjHLyTU9TKnonPrmU7ZJxkk7lPfDzIycYOgxMtS37bTo4Bgz3BBb
         glzw==
X-Gm-Message-State: APjAAAXe3/hGr3oUwlsoJVnvo58BbhXFooRioEdB6zM3y4+6qaVx5x/f
        x37u7nxKp/S8eF5sYrfYy5zbxSVy5XGaDSjL+mYWW2H0sYMv
X-Google-Smtp-Source: APXvYqwbenYfz+8HvwnLFDOKoiAoxlPm+66Jbx8olwWU83VYq6sGheysqWYQO0WVHRMdPe+OjJsMSZuHPvPXxStFJVjfulg2ZCMU
MIME-Version: 1.0
X-Received: by 2002:a6b:b792:: with SMTP id h140mr2782768iof.225.1568720460772;
 Tue, 17 Sep 2019 04:41:00 -0700 (PDT)
Date:   Tue, 17 Sep 2019 04:41:00 -0700
In-Reply-To: <1568719373.23075.4.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d100350592be31e7@google.com>
Subject: Re: divide error in usbnet_update_max_qlen
From:   syzbot <syzbot+6102c120be558c885f04@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, davem@davemloft.net,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+6102c120be558c885f04@syzkaller.appspotmail.com

Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=6102c120be558c885f04
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=148689be600000

Note: testing is done by a robot and is best-effort only.
