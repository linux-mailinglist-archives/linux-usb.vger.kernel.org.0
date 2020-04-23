Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A481B5C1B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgDWNFI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:05:08 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:36782 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgDWNFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 09:05:07 -0400
Received: by mail-il1-f199.google.com with SMTP id l15so5204998ilj.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 06:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=mDeCiJymVJtdQweAH4ZMSfwDQZ44U0uHTCRHrn44daU=;
        b=Yw3v/VWY7nsK/oUOPO8kUUE0AWuKVbfTGUpFIgA+6k+6yRCiBtgOB1S1QhtMKfLzKT
         kgDDEdeWrQPX9Dg6siNHIbE7hO6gpw8jyUiSUbKmqtgovLhF3DGPelwVA/TPggAdKZ2Q
         apY4UvWggixp+P/B1VatKF9Z/8d/PocF6EhDak+QEsa/xqdXP2u6+aaPgYb0yWI5ORTi
         Mdi7GQfIiRxwkLAB6BOR9wRCrA9YOEWS6ueG7FGKxjH79g2CZ/8KM/7bzF8ubp3PLP1K
         9JgoLgQqh6LkXqV/8Mmu+jR7xeYnUAruq4cKpi4IkDjjfVwuI2SFZzWoZXxfwj+tFlSD
         EwoQ==
X-Gm-Message-State: AGi0Pub1j4i7Fh6JxBemV3iHdvzZuJR+iscL4s4mmPM9SBU2qXucXaFS
        HneUO/Jk0tZfhF/ySP2tiNDOMvXo2F5D5JiEsym83CvsdIh1
X-Google-Smtp-Source: APiQypKXyqz/JlzpTAggRql5Ts4MQd1Yv7aMiN6XtgTUti0YG9yIBcvxI2iQdzYPdf5loOr0vwEuoAe/wokm4kEL4FbCdg+q2dxO
MIME-Version: 1.0
X-Received: by 2002:a5d:9354:: with SMTP id i20mr3491302ioo.207.1587647105465;
 Thu, 23 Apr 2020 06:05:05 -0700 (PDT)
Date:   Thu, 23 Apr 2020 06:05:05 -0700
In-Reply-To: <1587645997.23108.9.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c0064305a3f4e57b@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1396d5bfe00000

Note: testing is done by a robot and is best-effort only.
