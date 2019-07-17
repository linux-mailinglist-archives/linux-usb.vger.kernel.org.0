Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73D9B6BC56
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 14:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfGQM3C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 08:29:02 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:39104 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfGQM3B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jul 2019 08:29:01 -0400
Received: by mail-io1-f72.google.com with SMTP id y13so26937406iol.6
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2019 05:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=AByShyV8MxugdrVAP52bTC11/zp2agBi1wk+fUcF/g8=;
        b=MreShv9xOYMqvEAwDNJYY3M2Osusa09MTO0s7R0ThO4R+/IRZVYiCBB8WfZ3KdX03v
         9H6KyHZ2NUwYc3hILMyPzGwOfIBIgc7cMBp6XhIl2BOlGVxpTvPZTZLnubQFLE4ALu6C
         MXXNOJBYcdQzNp9H6Bt7LYmdDo2xRdLBFvWnx//TbaCbuq1K7awtmM4/rRzziisx6EXL
         HEd1EJySyLAx64AdODXPVVTWnnr2S1hjAfFfAYVqj75gCZQ5R0tKnlIJY21rY/X1CQbH
         jruunt5joTpzRsVmfhTx7mgPwB+Sp5WNW+ajWoUhvAtTKEuLKO/GE1Ug1v35Rcji+A8S
         ANEw==
X-Gm-Message-State: APjAAAUVR5i3PQUojfuQAOzRRTdWZmsy9x3LV2syV4d/wM6Bgba3QHdb
        nLDiKTH6SPzRVdpzsaWvfwL8t/YEodrO2ToGfSkk+F4HnqBU
X-Google-Smtp-Source: APXvYqxoVSLYclq8vROH6mYIXxVdmTx0TM+Zs7tz/C19ac1rQJfL74aTHycQ78ufw/LQNLLowRXhr3VuOu/dGV+La6CLKhQSGzQp
MIME-Version: 1.0
X-Received: by 2002:a6b:90c1:: with SMTP id s184mr1909577iod.244.1563366541028;
 Wed, 17 Jul 2019 05:29:01 -0700 (PDT)
Date:   Wed, 17 Jul 2019 05:29:01 -0700
In-Reply-To: <CAAeHK+zPDgvDr_Bao9dz_7hGEg+Ud6-tj7pZaihKeYHJ8M386Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000054f8bd058ddfa341@google.com>
Subject: Re: KASAN: global-out-of-bounds Read in dvb_pll_attach
From:   syzbot <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com, bnvandana@gmail.com,
        hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        tskd08@gmail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=d90745bdf884fc0a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1454f4d0600000

Note: testing is done by a robot and is best-effort only.
