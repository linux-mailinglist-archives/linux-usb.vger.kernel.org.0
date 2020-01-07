Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A626132F66
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 20:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbgAGT2C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 14:28:02 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:40946 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728451AbgAGT2C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 14:28:02 -0500
Received: by mail-io1-f69.google.com with SMTP id e200so526077iof.7
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2020 11:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=79KzdtzPC2ftmJR3OkbetmHCYKG8m61PMKxmCIe48cs=;
        b=eOmCk6y+ziQjzczT3N60vcChVHS/N4Bm9NFNlMT4y/C3ro4MGzh6TXLt6obQBu38Vf
         RFl7BQV40KC+HHtJsaVIMgQy4M8ta9FLP5S381plPz6ouw5LHGHuWTldrY3t8n9tufdj
         F28lWgInXBL39yR6uAA7mGB95sgBRBaL1PqV/dWw9XHHonzBdZytCioA7Q7N2x859K2Q
         AzDA5KwjffUpZwG26cZ9Sk81QVPoT6nmui1Uu5B/MMna3GRzGQ89sBt1J7miYhD575Fy
         UzIbQpZjkm1ly12622WvVvJljzbokct9kGKjgMYZWBFPBZcZaudC5s43GeDaKiiz7BtQ
         EtWg==
X-Gm-Message-State: APjAAAXiCoCOoS7AW7HNs1PAKbzUmoTrsbl6JnduHuNL8mGHCFyiZQgY
        XffMXLUVh0pjUsw0cwyxJrEqEREbifsjct1HvPfJdnrMFVuc
X-Google-Smtp-Source: APXvYqyyKvEVeTDh1DwxjBqTTDT9FQjHY67le+tdBbUTugoVyy+y8PIpydM0+CBLAlUYtUUAbLWWX2WDzQ5QTOuv8K/yt2mUKEf0
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:685:: with SMTP id o5mr613853ils.248.1578425281837;
 Tue, 07 Jan 2020 11:28:01 -0800 (PST)
Date:   Tue, 07 Jan 2020 11:28:01 -0800
In-Reply-To: <Pine.LNX.4.44L0.2001071407350.1567-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003a83be059b91c6e4@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11543656e00000

Note: testing is done by a robot and is best-effort only.
