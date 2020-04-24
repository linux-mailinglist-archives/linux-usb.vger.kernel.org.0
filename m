Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47DB31B6AC0
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 03:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgDXBTD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 21:19:03 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:48782 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbgDXBTC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 21:19:02 -0400
Received: by mail-il1-f200.google.com with SMTP id h26so8092388ilf.15
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 18:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=v2zkYldKkekixKO8WAt2/m+8khJWXoDi3M8ZXRlhJLs=;
        b=f++3gGyVmzFPDwfymU5o6ab4TwYO1gVvEIyhCcGFmrTP6LxkYqIaVAFyQ/Bmn9gPX4
         5GH+04m3XJ4C0HYvRCWuJamUr++rM/kjoyB7PIYLDRyCOvtsppNHrmHAkpjmBq1nqxux
         AJA2tFPYTAgp7X59PjCR3y36YyKZC3zxZ8+KUTsj0Kp3X5ZK26aqZ2lcflZTkk7fWymM
         g/lAm3Omh0Y8ha/ZpBIar6aXw+F7yp9VsE9l/k6M6WZkQx+JRLqb4SQCVMylrNNdBXkx
         iWSaox3wiwaM9I+aq4nB9nkRidjRJt8NMmx+bUMvR2JvxZOuMXLF2cFYTWQcbqw2Mekr
         arRw==
X-Gm-Message-State: AGi0PuayJGS3y2HZFImmhwhtOiBAPQzMr/91kwXTQqcrOM5ewvHmLWty
        BsEvLjVMinZoDbO6RwpSWLYRO02MOrNk5l6vDlJsTP2MV9MT
X-Google-Smtp-Source: APiQypLj4NW2u0003xdrqvbIZukQh+qr3wA2LYK9h5V6cNp+SK12Sh+q3xiLk280yC7yd+Nf8KNJ22Onr0OhnuFdlwrcIVMo4XnZ
MIME-Version: 1.0
X-Received: by 2002:a6b:7302:: with SMTP id e2mr5939972ioh.98.1587691142235;
 Thu, 23 Apr 2020 18:19:02 -0700 (PDT)
Date:   Thu, 23 Apr 2020 18:19:02 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004232059480.2101-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008bca8305a3ff2639@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
From:   syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=136ca310100000

Note: testing is done by a robot and is best-effort only.
