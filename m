Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBCC104740
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 01:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUAGB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 19:06:01 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:42575 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfKUAGB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 19:06:01 -0500
Received: by mail-io1-f71.google.com with SMTP id p1so882577ioo.9
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 16:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=1oblO59xmk+iDIjJiEmr3+1SCyY0QWGiv+FHlsc2b3E=;
        b=aGKP5wB17aFRrUab5IJsAz545+TviDByNHEU4l5X2rWBXoqSkIoYJSPig+YuoO4B4j
         m8K6szT2/dPM7qD4qT50bGt3176s2gc1Bx4lZE1x66LyCAej19aimwizSrOQmatrYmPY
         hI+cWl5V2G0vImLTKVVG06tp2Of9zFGAF2XbFc1/hmDiOS3eURHTyOCsiwsjlm3FYW2i
         ngvULtLYXnDVek+ohoHtXbvnxeKonriThTogzj4si3Jz6c24OW2nNa1s4GHVSydEz8rb
         cMtir0XievupPpC2nguGS7RfrZpiAWdpUDnRKxULXnEY85yvPPE6rWrwaffZl892JuHo
         hRsw==
X-Gm-Message-State: APjAAAWaXFC+rUZrtiBusm/P6LmOPtzrQSXDOieB3NQL8ro460LdFUC9
        MuN4uQRR+EKi5zwS03RX45NM9CemfvhzmthOaYMFYNvm84CM
X-Google-Smtp-Source: APXvYqwVOGOfxt/F7TirpgipLqn9Yh46XllJ726XZ9M23KWUy/45979qLouPbSQPXewh7g8XXAWlp2SbPHrE1KhYpAtxswMRuaD/
MIME-Version: 1.0
X-Received: by 2002:a92:79d2:: with SMTP id u201mr6997898ilc.103.1574294760788;
 Wed, 20 Nov 2019 16:06:00 -0800 (PST)
Date:   Wed, 20 Nov 2019 16:06:00 -0800
In-Reply-To: <1574263316.14298.36.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fd1a230597d00f87@google.com>
Subject: Re: WARNING in dln2_start_rx_urbs/usb_submit_urb
From:   syzbot <syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com>
To:     lee.jones@linaro.org, linux-usb@vger.kernel.org, oneukum@suse.com,
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
syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com

Tested on:

commit:         b1aa9d83 usb: raw: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=48a2851be24583b864dc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1555d686e00000

Note: testing is done by a robot and is best-effort only.
