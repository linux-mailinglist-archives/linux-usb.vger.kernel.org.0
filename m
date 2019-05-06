Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEA41555D
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 23:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfEFVVB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 17:21:01 -0400
Received: from mail-it1-f197.google.com ([209.85.166.197]:44498 "EHLO
        mail-it1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfEFVVA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 17:21:00 -0400
Received: by mail-it1-f197.google.com with SMTP id v193so12757394itv.9
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 14:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=3WXXuM4jc1H6fTU0L4fqfM+2De6q8C/mSZo5MFiBbqA=;
        b=sRU+ZqcIQLZM26/cVuie12CIyPMsdw1mz9rSU9mjut+ulehjleNt0FaohYpytc+5aH
         1OlQdjJxTBG7I3FbTFONvthoIc6220bIZm+rLxWkagaR/BkWn25tGIOPHrh8QyEKhYsz
         PV/zC5B1Ybp1KPY0HdJi2LcdktRzKB9X62vFlPv2juIKdGgVr1QUaPwWUt0RB/9hPYZK
         qYnYsNBz/9wxM6CJ8tbkhRSedIlGCDOGTgboqnvC6J9d/Ly/dcoLEmX1MCdVki8U0j2s
         TzkCQRYZ4T4r+xd8Ue1AE2hsH7TTaxW4wdMs6dZ5xUCt6DQR+qmmuY3pAzrVFolhmHId
         3F0A==
X-Gm-Message-State: APjAAAUri3uyqiApWXRfUZLOJ+CiPAvVRY1Pvt2aUSWKkeWDtBoV/osg
        zDV1/547hUHbQiNOwqT+V7dSwo96a5fGstTFB0UcLoOBsMUD
X-Google-Smtp-Source: APXvYqznI2fnTDVloYMj/zQyCyUvoYQHrX8gdFMohsJBIw//BIN2L+HbvAMaPk6Zg0MMg16PBeg2Lyhg/NYzxVv35PxgqwHFjqAP
MIME-Version: 1.0
X-Received: by 2002:a6b:f701:: with SMTP id k1mr18203142iog.240.1557177660211;
 Mon, 06 May 2019 14:21:00 -0700 (PDT)
Date:   Mon, 06 May 2019 14:21:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1905061638380.1585-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004a08f805883ead54@google.com>
Subject: Re: general protection fault in smsusb_init_device
From:   syzbot <syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com, wen.yang99@zte.com.cn
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com

Tested on:

commit:         43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=274aad0cf966c3bc
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c3fda4a00000

Note: testing is done by a robot and is best-effort only.
