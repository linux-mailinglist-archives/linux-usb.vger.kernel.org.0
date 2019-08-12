Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C13689EC5
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 14:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfHLMvC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 08:51:02 -0400
Received: from mail-ot1-f69.google.com ([209.85.210.69]:35974 "EHLO
        mail-ot1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfHLMvB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 08:51:01 -0400
Received: by mail-ot1-f69.google.com with SMTP id f11so84212666otq.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 05:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=dpFe0pxSvvQ3CiqTWvVQ3nfhIYJ6p2bt/fOgk0i68So=;
        b=pBb8gk+3B+rBFHUZf9KG9Dfoz0FlxJRVG2fEwZ8/HaKr5lFHMsZUE7C5pUQVQpyF6i
         ARhXUv89GB2ZP3HUUSpAQR0ZYIgchm8rJgRAn89FgIXPMoNpS6xNQLbrVWbshOLd/fpS
         kiAMCGhGizBPz4LtMla+jDV3QwTnjbXwtMOFuVLkGIeRDogBhJ5zLJr+CBhsAqlUsoFT
         ZHB2d+GWd1fGuy/aiycWgC6VdcE5611WXAYOlYgudD1Q3WQJAgAw74oV/1rmyIRAlTv2
         V+t/eqb7WMYytj71OFFst76Wc5AEqitF8pXxeY6gVgiOdR7g+7qCEaTqQxudDBV5IOtW
         oYwA==
X-Gm-Message-State: APjAAAVJCQOLYcT/4tmTuFdHgJ5jN1zg5j/TFPKHJdNlQv6CdkHic0hL
        FcT/fmOtL+NxkHT50gcZaLfdSQkB0pfXtBX7ta1RDMD+dOWR
X-Google-Smtp-Source: APXvYqzeOUNSZLHmIICrYoJx4kMoidLoy3cH2txtjlUjoEvrc0w4LGRMoWRVjXiMwJnpcl9H9P/TLOzvY92piEQmZ4Or2+jAFETO
MIME-Version: 1.0
X-Received: by 2002:a5e:990a:: with SMTP id t10mr14376062ioj.182.1565614261189;
 Mon, 12 Aug 2019 05:51:01 -0700 (PDT)
Date:   Mon, 12 Aug 2019 05:51:01 -0700
In-Reply-To: <CAAeHK+wnqRzpUDfspoXPVw76bAbrZ49JiwkeTj-g3U9zqLjZRg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e4c41e058feaf977@google.com>
Subject: Re: general protection fault in __pm_runtime_resume
From:   syzbot <syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        hdanton@sina.com, len.brown@intel.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, pavel@ucw.cz, rjw@rjwysocki.net,
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
syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1341679a600000

Note: testing is done by a robot and is best-effort only.
