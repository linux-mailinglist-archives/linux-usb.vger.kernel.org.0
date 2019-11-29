Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A82810D4C5
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2019 12:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfK2L1E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Nov 2019 06:27:04 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:46321 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfK2L1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Nov 2019 06:27:02 -0500
Received: by mail-io1-f71.google.com with SMTP id b186so7550701iof.13
        for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2019 03:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=1R/eyR91b2qzrd9oYXwpA7kVnLlS3eW/CPo2xuZ2tZs=;
        b=Qfwrb8MW1O455VV8x5l1wrqDcRZaqDAvAd8M8J57et21LsLgf3P4BoWJcP0keUXLa0
         Fl3D/lXBD6ZyTaqWbwW3Bq+zeFq5wfC1Y9zXSI+mL/lq+Io0TSz8u6niIbsEXLJx7LSq
         w7zg13eOA4pOw6T76E/J/eebWQFxUfqg11fzbvaXf8mSGo51lfjjCb0XuIosBkiZrK1b
         RWxOxU+sA3cio07nzR7rfAbGhso+MWlV8pBBZXS47Qy/Aq+OuNWZlLBz/5Qdh/JAsL4v
         mlEFJWH8VhP1RMjlC8No3PuiO5HJ0KcRZ73XW0Olw37MAuO9w6mi05+LXFjo2lWiwQFY
         3WLA==
X-Gm-Message-State: APjAAAU+zRrlmh8PwXTKiqWXVZIY6Vo87/Cbu4Oc8WbCQQJCSdHx/uef
        b4nXqJJYCsHc3+gbOjvr2kbf6Q3OCx2hFb7oOJnH4Grsj1y9
X-Google-Smtp-Source: APXvYqx2WOuve6jGICcXm51Pk+hIsPcOb1OO3yj2Zia1Hs0+ZR99DkvW/INJgLvPm6G6NaW5WS+Y11Kyq0HaFv6HhYvElj2iUAAo
MIME-Version: 1.0
X-Received: by 2002:a92:c525:: with SMTP id m5mr52192194ili.91.1575026820788;
 Fri, 29 Nov 2019 03:27:00 -0800 (PST)
Date:   Fri, 29 Nov 2019 03:27:00 -0800
In-Reply-To: <20191129104156.GH29518@localhost>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002a380f05987a8239@google.com>
Subject: Re: WARNING: ODEBUG bug in rsi_probe
From:   syzbot <syzbot+1d1597a5aa3679c65b9f@syzkaller.appspotmail.com>
To:     amitkarwar@gmail.com, andreyknvl@google.com, davem@davemloft.net,
        johan@kernel.org, kvalo@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        siva8118@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+1d1597a5aa3679c65b9f@syzkaller.appspotmail.com

Tested on:

commit:         d34f9519 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
dashboard link: https://syzkaller.appspot.com/bug?extid=1d1597a5aa3679c65b9f
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=122808a6e00000

Note: testing is done by a robot and is best-effort only.
