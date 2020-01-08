Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE16A134A97
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 19:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbgAHSnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 13:43:02 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:50648 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgAHSnC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 13:43:02 -0500
Received: by mail-il1-f198.google.com with SMTP id z12so2737643ilh.17
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2020 10:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=gsmhaJiI7IosyrLbk8vnuiA+k0qhktKDo7fbqvkMYO8=;
        b=Bwa4PXQ0GeQIMfCoQN/jogCXeCyD0CcNqgtPRrfMeHmFYbEkkcxZIqB02I3cZ0g28A
         U+UWmoyPB5OGDV/5QoTYyfH3Mi5TcWuRMwKTN4FOfslFxbXsCQULm+Xlm2Okoa285uYY
         OIZ4pkZrfAonYnZ2bIkgsiL/jTVdh8/76gbADBGd6RiReseRrJvVYCvAPSFd7otX+eAG
         y+xtM59xfKIahawyDTnainERV+lhfr+yj49MfEbYuZyjDw/KXIs8w0FGIspZybzIGYEA
         VAPz7UKI9e3ZrAEM5vEvKOGAHRumrUPmjuhC7OWbXqODvcDzjaPl7sOr6y/f8125TN+S
         b7Ig==
X-Gm-Message-State: APjAAAV5FgX2zj+1P6Nm5ItWj3+IQiYFhoCnKNWe3DgC/Y1wuF6viBNa
        raTE8ZFXi3UprwSxzy7/FbG1WWk6in8gUk1hQbybcFhl990B
X-Google-Smtp-Source: APXvYqxKYtLzbfqyaoDRR2KCFDYl//WXawATjjjbkROCvej4q2Dpbzny1vJo/YnpX4N4MXb2NMJgKVp5e90UuK6XRdSrl8qOlYy2
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3c5:: with SMTP id g5mr4478792iov.161.1578508981277;
 Wed, 08 Jan 2020 10:43:01 -0800 (PST)
Date:   Wed, 08 Jan 2020 10:43:01 -0800
In-Reply-To: <Pine.LNX.4.44L0.2001081314471.1468-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001b53f8059ba5431a@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (2)
From:   syzbot <syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com

Tested on:

commit:         ecdf2214 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=b06a019075333661
dashboard link: https://syzkaller.appspot.com/bug?extid=10e5f68920f13587ab12
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1583963ee00000

Note: testing is done by a robot and is best-effort only.
