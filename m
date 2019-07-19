Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F996E548
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jul 2019 13:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbfGSL4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jul 2019 07:56:02 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:47509 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbfGSL4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jul 2019 07:56:01 -0400
Received: by mail-io1-f71.google.com with SMTP id r27so34375155iob.14
        for <linux-usb@vger.kernel.org>; Fri, 19 Jul 2019 04:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=dOaMMRNUwOpnO5Eysa44CTptPt5oL3VmnBhbF84fcE0=;
        b=WSDl93MrV6yKjo5QxblTGUPrmw7E2befFxXVQMAAEeOSoC7arZbF4tBlOCVdfDO/VH
         peL/fK61SVasFhEB4CtXLOc+904qfiLsRnnRDe8Kz1HpJQmiznRscQU8WWAjFdZRLOhJ
         AwqLveKsx3xrdxqzzTWqXzpq7dVlDwuIZdFx6KkOqpWJys8t47bYxHuzl9o21puYExTQ
         rIYLPCjnbGtCbaiX7pwQu0chmgDFxcv+ADOpuahcJ2AmHzD97HIQy7kRga5GuCXAg1Wc
         Got/mxEUxW2v98mgVYXIjeaCkriW5iHatgGcfkDkb2FSv1amZUT7IrbqngMHi3TY85LB
         NjqA==
X-Gm-Message-State: APjAAAWWw1sZHstO+MRSoVzRWvDZqorm7BOWgKhpz99T6O7IjiH4XaM0
        uNcP+IcFcIlL06j5E55HwoW8uqnClgXVfvOTm3Pj6E1I8E1l
X-Google-Smtp-Source: APXvYqzkybw6Wn+Li7jpXIwPEu6DrrvHCNxZ0RdTQuikJ9CC9uXJlEMhd5vO6oTUXbRLRUh+jGq2W7vI11/mWSSm4gb3GnXjFk6h
MIME-Version: 1.0
X-Received: by 2002:a5d:9643:: with SMTP id d3mr51164262ios.227.1563537360868;
 Fri, 19 Jul 2019 04:56:00 -0700 (PDT)
Date:   Fri, 19 Jul 2019 04:56:00 -0700
In-Reply-To: <000000000000d8b010058e03aaf8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fcdf6c058e076819@google.com>
Subject: Re: BUG: unable to handle kernel paging request in corrupted (2)
From:   syzbot <syzbot+08b7a2c58acdfa12c82d@syzkaller.appspotmail.com>
To:     dave.stevenson@raspberrypi.org, davem@davemloft.net,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        unglinuxdriver@microchip.com, woojung.huh@microchip.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has bisected this bug to:

commit 9343ac87f2a4e09bf6e27b5f31e72e9e3a82abff
Author: Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Mon Jun 25 14:07:15 2018 +0000

     net: lan78xx: Use s/w csum check on VLANs without tag stripping

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=102feb84600000
start commit:   49d05fe2 ipv6: rt6_check should return NULL if 'from' is N..
git tree:       net
final crash:    https://syzkaller.appspot.com/x/report.txt?x=122feb84600000
console output: https://syzkaller.appspot.com/x/log.txt?x=142feb84600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=87305c3ca9c25c70
dashboard link: https://syzkaller.appspot.com/bug?extid=08b7a2c58acdfa12c82d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143a78f4600000

Reported-by: syzbot+08b7a2c58acdfa12c82d@syzkaller.appspotmail.com
Fixes: 9343ac87f2a4 ("net: lan78xx: Use s/w csum check on VLANs without tag  
stripping")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
