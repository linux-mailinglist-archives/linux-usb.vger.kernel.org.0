Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB622113384
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 19:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731820AbfLDSRC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 13:17:02 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:49701 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731963AbfLDSRB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Dec 2019 13:17:01 -0500
Received: by mail-io1-f70.google.com with SMTP id t3so505054ioj.16
        for <linux-usb@vger.kernel.org>; Wed, 04 Dec 2019 10:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=4wdFb/go3+wXQG1FazkaJLX0eWR/JfQ2cs/FXkmodVM=;
        b=KbapBsxwYNf2qvKVr6dDcsG2u4L3MyGOW5LSHC17+rAYqppLFLW4XVz3n8bFmvuKLR
         QCYAZ5Mqu5tBY0d7LK7xoQs1hGuLWjHF27/BjqqY6atGo+ub9O7rqJdU0WVzBeSHpjEg
         74pemCpiXLJFHk/KdY6M+VlG/6e0HKzmi+RFGje4zLHwQ3bjjCLtE3WwteVjwPUdHqq7
         UzeZkUN3gdhdfO0yjXsPNScj/ABClOtH8R7RVucd2YoqlI1Mb/aliKmsXbWpUB3/Upn+
         3gaDBPk+JmFI41VIHxSCktM7ga6/iahjeJHVekcTqH8wni3v2H3TiX5H9gejhqcH3iFN
         ocgg==
X-Gm-Message-State: APjAAAW0WQ92Nuq98dEuH9+epFqLQ3XwWJ+s6dpctRCMkxuYg8VvE7Us
        U1yaksUUKTSILPj97rqui0yKGJOJhZl5RYy7jYLpU5zQdOoZ
X-Google-Smtp-Source: APXvYqxfEJfcqqHIsUcy3WUxOi+VGXY6BPT7GEEyyyT795+CsrgW5AxgzYvjkVDBbiwQc8KpAHs0g0CC3cd5CmVN4OqVVyq0yZ6f
MIME-Version: 1.0
X-Received: by 2002:a02:40c6:: with SMTP id n189mr4320421jaa.18.1575483421189;
 Wed, 04 Dec 2019 10:17:01 -0800 (PST)
Date:   Wed, 04 Dec 2019 10:17:01 -0800
In-Reply-To: <1575471809.30318.6.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab6be80598e4d18d@google.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.com,
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
syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com

Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1063382ee00000

Note: testing is done by a robot and is best-effort only.
