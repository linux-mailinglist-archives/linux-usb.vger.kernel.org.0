Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 799EC1046E3
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 00:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfKTXSC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 18:18:02 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:47635 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbfKTXSB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 18:18:01 -0500
Received: by mail-il1-f199.google.com with SMTP id c19so1141913ilf.14
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 15:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=HfwJtss+mZME+zDs7+L/UXI2GKkL+RaYJAyUUqEXvig=;
        b=Hkl/eBNv8J7C5cXMWA5NMn+x2CEY9eNFSBRmbtSNTmMw+v11vOe8aogiFRbuG3M7sL
         G0L9VlS/OW9Tv8/BSQH8SUi0MqI9LakE/RTuDmo18jj2u3MvssgpS4DDpvt7z84jm1vk
         LhW52gNk53RUBAYHFxHEuJvFSgUdKW7BUqIsE6ELyusM+0uWqiF31fJZSjXpI84jDEvU
         hpEN/ABTJQnJO4emFZN7l5pYfUbHiyrv9XGww8NsbdTfI6e/gTRj6jUTaUGdS19hG+To
         usS+59bUSgCs5QbEzGPwRrWHVSaC2FLJszyB4+ONQjQLaM6VOhz8j00bIsd5kh7I5vLL
         mF8A==
X-Gm-Message-State: APjAAAXQqhPGEL9EXsEOGQS6nim2HqajoNanFaGdXcMpycfg+1XjbDZX
        hq1QoUcf3RzivQTK5T9ibZsb3f/+cmuKgi8PmTV3EGfA8xcu
X-Google-Smtp-Source: APXvYqxecEYfzrUmECgGhIRVoy4Kiy56/txc5XOhwySibuwnCacWfbWXdlOeB64fvb4/doo6U4DnTt+pEiKvAer+J96kY5svWcr4
MIME-Version: 1.0
X-Received: by 2002:a02:ad14:: with SMTP id s20mr5795914jan.132.1574291881115;
 Wed, 20 Nov 2019 15:18:01 -0800 (PST)
Date:   Wed, 20 Nov 2019 15:18:01 -0800
In-Reply-To: <1574173445.28617.15.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000058ca6e0597cf64e1@google.com>
Subject: Re: WARNING in port100_send_cmd_async/usb_submit_urb
From:   syzbot <syzbot+711468aa5c3a1eabf863@syzkaller.appspotmail.com>
To:     alexios.zavras@intel.com, linux-usb@vger.kernel.org,
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
syzbot+711468aa5c3a1eabf863@syzkaller.appspotmail.com

Tested on:

commit:         7829a896 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
dashboard link: https://syzkaller.appspot.com/bug?extid=711468aa5c3a1eabf863
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1248258ce00000

Note: testing is done by a robot and is best-effort only.
