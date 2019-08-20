Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF8E95D13
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 13:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbfHTLSB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 07:18:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:55529 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHTLSB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Aug 2019 07:18:01 -0400
Received: by mail-io1-f71.google.com with SMTP id g23so7451204ioh.22
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2019 04:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=2P3eWmgcJZzJWYjQksaViVhGQ2vXzoZ+I9j1B+avBU4=;
        b=ml5WUIKPQO+EXMgLIKluOckwgemJWbvD2zNV+ESU5Zztn1yxefGDi05icnMqVvkYHb
         S37PMLHratCEej9lr0grZWL3EMAD0Ysda3OrggHbRDMCxtBa9aKCnPHa1P90ir82E0su
         oo9BRMhkm7HK0ymyZlvKNnu1CoBwI8rgs/+VumeXYk2TTB6/45hb6IwNetxSoWGqgE5o
         A7p0X4xdqp1bKBHwkm8PxVzAKiip5NpiDMfUexpqZOVfl1+u397tClO199x2L5rPnXt6
         UKCs83wrwRnYv8Iez+SJMh3+FEs/h+WClyztbAMSWdqyW3540s6Mz7YNFzrDETUlwyIX
         iZaQ==
X-Gm-Message-State: APjAAAVMVlctQEAALOO6Hc5L3Qc62X1uYbSTxVldBV8Y3XC2o5OyMuzM
        BqlhEsg6yHGSPR7gNSWPI7NITsfmP0xyJQW6uMI3tY63GaX+
X-Google-Smtp-Source: APXvYqz2zf8f3QlelUWR+tVfZ8UhnsjpsGUHLhxp/VNEqXckOoQI1Az+GUNsPHnDO7GvyZlWmTmz0MmmxYtHRFvT6hsPIEvHcS5m
MIME-Version: 1.0
X-Received: by 2002:a02:7a5c:: with SMTP id z28mr3118814jad.40.1566299880917;
 Tue, 20 Aug 2019 04:18:00 -0700 (PDT)
Date:   Tue, 20 Aug 2019 04:18:00 -0700
In-Reply-To: <1566298789.11678.12.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000039f6d05908a9c23@google.com>
Subject: Re: WARNING in wdm_write/usb_submit_urb
From:   syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bjorn@mork.no, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-usb@vger.kernel.org,
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
syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com

Tested on:

commit:         e06ce4da usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11893186600000

Note: testing is done by a robot and is best-effort only.
