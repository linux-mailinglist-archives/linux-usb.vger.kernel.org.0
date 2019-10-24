Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE839E3671
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 17:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502953AbfJXPWC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 11:22:02 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:56891 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403837AbfJXPWC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Oct 2019 11:22:02 -0400
Received: by mail-io1-f69.google.com with SMTP id a22so25920254ioq.23
        for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2019 08:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=RqIARasz4PZZfM4Zlv+NGn5c1w9s+0zeajPkvbZDLG8=;
        b=nN9TYtq/QzuxLK4d7LA6Wr5H3VPAlnN5S4RFjHzPlKPfhIHdtVCHzAXonkUjVKTNt0
         Z/j9o1aCrON2KvxgRUXvgasVegeW+ISBQRPD/7bFdkDY5pho0Ruv9fmrl00QEd7ymmhU
         u4Hi3wN/UjcAJ8RDqLEi8mFHrEhZnIdLDkF0X2HJ1KdnhBVMvCTiVQt5Tn6dxid57qWS
         g37BfTcAn+d137TklZKDMWmncFOjuEn885Kzb1LV5p/o1r44CC+oGQ7j0SJv5/83i+TW
         mrJLhzsb5HFWnW+UO4xHKb8svfIRcxIyfoRs7ZCqBNiWMvRia4AmwrpZI86rdWcFrv0s
         H46g==
X-Gm-Message-State: APjAAAUGF872qM9npScq+EJlg+E6+On8Xl0fEy7C7NB8+5GY45n68wqn
        hO8KhgOImr4Kz1T6j6ohYCLfgmBQxVzf3qWDHj3mN6u5heif
X-Google-Smtp-Source: APXvYqz6vdsYutSN8ENa8kZoFnbo8JHWDQwsquQngY3sXxodHpUDPiFWzl7IoLyB1BKrLE8AbVM57hBZFomIkEzJJH8XROc00gIS
MIME-Version: 1.0
X-Received: by 2002:a92:8394:: with SMTP id p20mr4880575ilk.73.1571930521777;
 Thu, 24 Oct 2019 08:22:01 -0700 (PDT)
Date:   Thu, 24 Oct 2019 08:22:01 -0700
In-Reply-To: <Pine.LNX.4.44L0.1910241053590.1676-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005cc1890595a998a7@google.com>
Subject: Re: divide error in dummy_timer
From:   syzbot <syzbot+8ab8bf161038a8768553@syzkaller.appspotmail.com>
To:     Jacky.Cao@sony.com, andreyknvl@google.com, balbi@kernel.org,
        chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+8ab8bf161038a8768553@syzkaller.appspotmail.com

Tested on:

commit:         22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5fe29bc39eff9627
dashboard link: https://syzkaller.appspot.com/bug?extid=8ab8bf161038a8768553
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14f2fda7600000

Note: testing is done by a robot and is best-effort only.
