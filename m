Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550041BF981
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 15:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgD3N3G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 09:29:06 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:36222 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgD3N3F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 09:29:05 -0400
Received: by mail-il1-f197.google.com with SMTP id l15so1240415ilj.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 06:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=1CoMm2Azd5e1nYZiwwTlCj2XcjRhvuc5WQvJ2+Ve3k8=;
        b=VJHjsxaXNzLCAmpk+LruJTdR1wPzZrsYILx8mUhH2k8cXzNMrik/vCBbpnez5SyQr6
         +WgIFyGcd3Bo9qEjPk/vrqcUytavVX7BLxZkqSF/jHO5M3VOuJEg8d5c0+46wzvCAbcZ
         wuUffJhG4b0modf3qZG6MPUSG6Za2S8SZZj0JM51YwRifHD4xkwqixFJaeTMT6GLkz82
         BVeT6zVgOaOM6zcemwEYnsGLxEH+v3ICwBE7tCaEvAGVggP8Himro2GOkCb+teCIO+dT
         PUtt9P854a7WDTPv7MvH4h1fT4M0b9gG4PzGUizEqL01peQ+Zyq7lf6XidzJgI08POAY
         H6Dw==
X-Gm-Message-State: AGi0Puah6esXuTY3f6kRL2pYUlT9tno+OLh2vVP/pGixow0DeY1D24Jr
        1sVJ3OioBntPqWwte4HlebYckdSek5vA3BjsIL3pfpROjW18
X-Google-Smtp-Source: APiQypLBM1FBRIDe5Ddt7k1hoFXEzo7fAJ9y7lQ8WxdoltukqZx96b9QYJoo9m9XKYr8BYFj93eIJfa114DWKGjW1x0aFC5eU46O
MIME-Version: 1.0
X-Received: by 2002:a92:aac7:: with SMTP id p68mr1770364ill.62.1588253343506;
 Thu, 30 Apr 2020 06:29:03 -0700 (PDT)
Date:   Thu, 30 Apr 2020 06:29:03 -0700
In-Reply-To: <1588252185.16510.12.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005a826305a4820c1e@google.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com

Tested on:

commit:         e9010320 usb: cdns3: gadget: make a bunch of functions sta..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd14feb44652cfaf
dashboard link: https://syzkaller.appspot.com/bug?extid=cabfa4b5b05ff6be4ef0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=163fcf90100000

Note: testing is done by a robot and is best-effort only.
