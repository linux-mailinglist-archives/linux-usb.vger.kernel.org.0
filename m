Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A1384F4C
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 16:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388343AbfHGO6C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 10:58:02 -0400
Received: from mail-ot1-f69.google.com ([209.85.210.69]:56577 "EHLO
        mail-ot1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388296AbfHGO6B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 10:58:01 -0400
Received: by mail-ot1-f69.google.com with SMTP id q22so55195171otl.23
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 07:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=WeWUyZi7VCNLtsnaaTiz91GIAA++Rddp6QtWItBqJfk=;
        b=H5uijCMuXbsfTmCddZqJkuD316Krb8BEHlYUJSfgZTb3u7HsHcW4kplICql2MjbgJU
         QHaxjM9blWNcA4FRP9JfxMiN8JtQpoUxr28CQ7X10UsGsnX1JLAvLi5TEVxRGwWhGGV8
         AoxcgeiiQDngy08lGk0KXA3PsE96bga08nu4yied5hWcmqwqMWwL7Ra7oH6VPpU/3Kcv
         QZjRaAXzQHIgDHOhT6Ri4wNkn26sfmLPUEHScvQzCr54ckzXTUaBVa7xEfpDWM37CWvV
         Q4ukio4aw4luB/fPTLtl/WluEzxDgu8TyxR+TGIfXdS6qBSHnrCeLa4MTIruVvdydJ6y
         3DoQ==
X-Gm-Message-State: APjAAAXb5POMGinvVcrP76F8Sh3c7e00NfL1867clVfL8rW37Eo6Mh4y
        5YhxBTJCGJgQ8Fj1OX6lKO5bFmNQTinJxOuUMXmmfErEzqsn
X-Google-Smtp-Source: APXvYqw99ZvGdJtrUfS8mJEwMciCjDs8w83xYn0jXYpAXZuw/cI0KvMd7vubohbBpqBJpfJV+utLREol6sQoZxVKwDY/RnvUoBr+
MIME-Version: 1.0
X-Received: by 2002:a5d:994b:: with SMTP id v11mr9744404ios.165.1565189881077;
 Wed, 07 Aug 2019 07:58:01 -0700 (PDT)
Date:   Wed, 07 Aug 2019 07:58:01 -0700
In-Reply-To: <1565187539.15973.6.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000de260b058f882ae7@google.com>
Subject: Re: WARNING in zd_mac_clear
From:   syzbot <syzbot+74c65761783d66a9c97c@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, davem@davemloft.net, dsd@gentoo.org,
        kune@deine-taler.de, kvalo@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        oneukum@suse.com, stern@rowland.harvard.edu,
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
syzbot+74c65761783d66a9c97c@syzkaller.appspotmail.com

Tested on:

commit:         9a33b369 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10d8c03c600000

Note: testing is done by a robot and is best-effort only.
