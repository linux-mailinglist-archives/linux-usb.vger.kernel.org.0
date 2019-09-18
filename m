Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED48B632B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 14:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731100AbfIRM0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 08:26:03 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:57215 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728539AbfIRM0C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Sep 2019 08:26:02 -0400
Received: by mail-io1-f70.google.com with SMTP id n8so10758084ioh.23
        for <linux-usb@vger.kernel.org>; Wed, 18 Sep 2019 05:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=yq57rTS7tT8k+xdJeb2CfUd2j81GNTcLfOruVvSsEeQ=;
        b=DbscyCCHxWjLyEZfEq3RkOdkx7tRyBdHBTKlEk20FstU5WBve6gEXB+xHU6PPAw/wK
         0xupMHEIDy2Vj0fmk+346lTAvrlwGQvvpkVENb9I4WFH3jSxU8n/rDpPIuR/Vbu/SX+K
         eb008Qh0HJwtmnRgDrS+GkYlxKR407uvOH8LqaC1wBUmrDwwNiyseQCFA/EGjgv6fX2H
         squTK0fx7GPTBrSO4Cnupj488JYESA1lgR+WhoFzgSrPkqGBP/xXDgIQxhOn/wWXPkV8
         nC4P/1lbShKL34cVom6G6RTTSvEwEPXZAvipy2Lgcfi1jhrzQ5XzrSVRBbmvp0YAvgjB
         W1Lg==
X-Gm-Message-State: APjAAAVYL9CQJDm4LK6w6cZckOSwxZM3Bwlq8Shwfnj/JCNuoioGnsDS
        tKQFTAAI00dLadzIEoTVTwFM4Fkh4Mt0V4cL5gfZ4eYoH76V
X-Google-Smtp-Source: APXvYqx7fUN6ZZEHiu5creHYMFYei5Rfmu0F99U5no3hBFuFzr5yISH1tIhZ7tEhBcV9+P8+J/ecUAojRnyBPEli5iMDgNaYWH0l
MIME-Version: 1.0
X-Received: by 2002:a6b:c88e:: with SMTP id y136mr4267690iof.68.1568809560710;
 Wed, 18 Sep 2019 05:26:00 -0700 (PDT)
Date:   Wed, 18 Sep 2019 05:26:00 -0700
In-Reply-To: <20190918120147.4520-1-bjorn@mork.no>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000096290a0592d2f05a@google.com>
Subject: Re: divide error in cdc_ncm_update_rxtx_max
From:   syzbot <syzbot+ce366e2b8296e25d84f5@syzkaller.appspotmail.com>
To:     bjorn@mork.no, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        oliver@neukum.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+ce366e2b8296e25d84f5@syzkaller.appspotmail.com

Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=ce366e2b8296e25d84f5
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=114971b5600000

Note: testing is done by a robot and is best-effort only.
