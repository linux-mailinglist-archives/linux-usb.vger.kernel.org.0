Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065F71046CC
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 00:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfKTXAB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 18:00:01 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:55215 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKTXAB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 18:00:01 -0500
Received: by mail-il1-f199.google.com with SMTP id t67so1084396ill.21
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 15:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ypoFC5Ro1whWyZkoNTFbjCm62awQmvPA/XY3KWGTpeY=;
        b=UKs39QAYZZmaN6KVQBc6HLZcOZS1O/WIheYmVZTrVShjD5zXb2O1h54VYCKDtR3IHm
         +1FFMBPZ3+J0VVWyr/V0t/AgSRyIwcHVwsw9FrCnA0zzVX4Qut2ktclqT8D/z8F/C9n1
         AkzcUBJxAzRGY1324USQKz2jwKMsc5CzXthBZNYMi/8wm4az76I275MkG8rhCIUcOYO6
         xyHAhOk1nXJ9c/fOZaGZKZ+X/V5ovY9vD0xm7cGGRnLLxbd9z4Ws6Nz96zyIdnqkkSMQ
         rl05clOfFxfYTgo86zBVZmK/kI8BYKnZS9xx04l2eZC+oJ1DaECZPv40vUhM8FqxjP8W
         k83g==
X-Gm-Message-State: APjAAAUwze/Wo0BWWHkQPuJWe8X+bDXZxYUoUc3K5ctFtuDXyR9/iKOv
        d0TMD/t41hL4Vsz0t/UlKcWAmSndZi3QAfkHjKu6Vdgy0yU8
X-Google-Smtp-Source: APXvYqyofe8WhECLKlKXZgBJZBsZrYVm/t+Y8eRSVSR0U/8UgoTSuC2z2cvX43ZBQGe1osg94jcabQYUuLJ1jeNst5ogvlPqNJZy
MIME-Version: 1.0
X-Received: by 2002:a92:1705:: with SMTP id u5mr6454619ill.151.1574290800348;
 Wed, 20 Nov 2019 15:00:00 -0800 (PST)
Date:   Wed, 20 Nov 2019 15:00:00 -0800
In-Reply-To: <1574170553.28617.10.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ed95090597cf2395@google.com>
Subject: Re: WARNING in ath6kl_htc_pipe_rx_complete
From:   syzbot <syzbot+555908813b2ea35dae9a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, davem@davemloft.net, kvalo@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+555908813b2ea35dae9a@syzkaller.appspotmail.com

Tested on:

commit:         d60bbfea usb: raw: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=555908813b2ea35dae9a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=125c855ae00000

Note: testing is done by a robot and is best-effort only.
