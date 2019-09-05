Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 268B2AA152
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 13:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732847AbfIEL1B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 07:27:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:42818 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfIEL1B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 07:27:01 -0400
Received: by mail-io1-f70.google.com with SMTP id x9so2817300ior.9
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 04:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7woNlVISujRJGF9f7Yv9hP0vcjuDeQlRJErmR/nep/s=;
        b=hOO5Ep+Dg0HJpEyNXd4mDweqyHh1hDw4OFs37ZKyUMdoVUIr9xUfKNB2RoSaVs8qoY
         QD98q1z0TVJXelZoj7qtpBpp1mXf1aFPje2kINLqL6yqbfgEp4Nx4TTgTJ2yf+kIqk4N
         nuShw6gj3OpjdxVMygfy0eSjhMN0oZneaOM5Tmizz0FvoTA1wUrGaEnTceNhawkJp1Rn
         SQRozg59b9ONl5C2q7h8NWeb7A/rTO/tm2W30Vmal83uBT+16lM7QKVlSf7OUdfGCwDD
         pKoRGinx++yTnS72w7Q3ozFXr2b8QazUq7GYng2QXWH2Ms5pMcG7oQZNIzWtDHWrLjv5
         AWgg==
X-Gm-Message-State: APjAAAVILhJx6eu7eBZzKW/aLZlWeu8dHWen+R18jiizePvzk5W0qA8A
        /rSn2mpZsX39qoqI+xS9P9yxtqZtjuhYv/f9er/a/RZq9jqx
X-Google-Smtp-Source: APXvYqzrPWl90MY6xFLW6kE5r7FYbX5PnvVkgsNXXwiFcVSlOrXw4c1TUHRlr2M/2Ww7NwqWIs7UZ4UFqMX/6zQlqsJJFcJYxnZm
MIME-Version: 1.0
X-Received: by 2002:a02:9a12:: with SMTP id b18mr3575178jal.70.1567682820439;
 Thu, 05 Sep 2019 04:27:00 -0700 (PDT)
Date:   Thu, 05 Sep 2019 04:27:00 -0700
In-Reply-To: <CAAeHK+xJrv1hCbO5qOGTBu=c8STo+-obatOGZ4cHkbuhqmEvrg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a2044d0591cc99b2@google.com>
Subject: Re: WARNING: ODEBUG bug in usbhid_disconnect (2)
From:   syzbot <syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com>
To:     Roderick.Colenbrander@sony.com, andreyknvl@google.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
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
syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com

Tested on:

commit:         eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=14b53bfeb17f2b210eb7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12b6944e600000

Note: testing is done by a robot and is best-effort only.
