Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D95A1B5A5A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 13:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgDWLUG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 07:20:06 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:50705 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgDWLUG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 07:20:06 -0400
Received: by mail-io1-f69.google.com with SMTP id a12so5286916ioe.17
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 04:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7ws0cdv3Hoh5HeHAP/ghf6fY1WIucwMKaP3c8MnIE78=;
        b=hDnVnl/y3YhXarlzevA0jnsdAdxzGNs9xafGjqgLGar6Z2mzH3VYqJRNi+Q59vIjLH
         CDHc/e9XKVpxYepGvEfIptvePctLraxJzb0A7GYOcMCeW87D5Hk6fgb3BQdhqE2fcMLf
         1N0Qs+B1rJ6kfrr8AMlE5vkvOHgvO6VRHgc1eB3nM85oMsDtKXwKR3IC1iXkj8JD8k7H
         Q/SGowv8dIGW4wGS7S7PWmWocfOU+Y1xyMvHnP2jazUIO2h8751Ni7Vfxno3PdjJj3om
         4dR1nUG2Eg+B/c0EIic+GNw9iX5ueTYadCOPFRw7w86ttAY1CQLXTDK6ifCfvfYp1UQn
         mBag==
X-Gm-Message-State: AGi0PuboTxLXWDLSEXnVI7KYBmcuroUdP00Iwh7IqLsUW8xDMMKe/KZy
        aSi1pfLTVShD9gbhtyE+2Ti/Iha/CtAJTD3gIzQ0Q1ZG72Ug
X-Google-Smtp-Source: APiQypI+EsLOsSPy6Sg+P7SRjTLpki9gp5v/Xt5zbhKL9lDbKFt5ewoTipmheSr6K6PolKz5AuPvg7AodJLNWX3+BaXd0t0KhCeX
MIME-Version: 1.0
X-Received: by 2002:a92:3cc4:: with SMTP id j65mr2713330ilf.190.1587640805461;
 Thu, 23 Apr 2020 04:20:05 -0700 (PDT)
Date:   Thu, 23 Apr 2020 04:20:05 -0700
In-Reply-To: <1587639690.23108.2.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003d967305a3f36ee9@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=108a4ecfe00000

Note: testing is done by a robot and is best-effort only.
