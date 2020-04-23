Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75711B61D8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 19:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbgDWRUF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 13:20:05 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:44136 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729674AbgDWRUE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 13:20:04 -0400
Received: by mail-io1-f72.google.com with SMTP id o20so6692094ioa.11
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 10:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=4mHKeAyAGDDsSPX7mqI92rd3yyYuGCPiX2VzFqgkLt0=;
        b=pfEgGWxVWpsHs7Uma6WEdiz3HkpaKkVnDiOMpti0UTgLM8xxXz9yw+QHPcAQUcTLsq
         UJkYksLbcLPU/Q8uBNWFfPxWZ3Ckk89qXuHsrhJlZ8Z4CcxVZo0pGHbiMAwju23rYxYB
         gmy+lsdfgF9T0ikFVOORXom/KSCBs+Otn604tRHUIfmtW43XwE87tx3uxyEHatOAQthn
         Ue26V/HISbFxS+mbPM4W3/XcNwnOlLeQMxzLn/k8lULaFpxGEt5T0reXgPYj9mQXzIkY
         +CNLv/ZdFVZT6IG09Aa95Vv96p4Br3RtVlnBZYldaRV/jznDGGAsj8OSWlgwhb4ng1GC
         7Y8Q==
X-Gm-Message-State: AGi0PuZBR1q4Mvkqn6vUqVX9Ap9btJudmPDnJDvWNQ6s6qsYxNszpq4i
        38d890RgdGv6DSCpEA9k4GdMOKiSdkuyge/vEwPD/ze8Wahy
X-Google-Smtp-Source: APiQypL3/Yll+s/nR/T7aWG5H5r0GMTjZ+XDNfQFUpGPUOlIZiYuDIrlgjwlvi0UJ9oFMUvbGMpJcF1eGb6b/taoe3T0JYP7C2Ye
MIME-Version: 1.0
X-Received: by 2002:a6b:7302:: with SMTP id e2mr4356263ioh.98.1587662402406;
 Thu, 23 Apr 2020 10:20:02 -0700 (PDT)
Date:   Thu, 23 Apr 2020 10:20:02 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004231235560.20147-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000084cea205a3f875bd@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1027bca0100000

Note: testing is done by a robot and is best-effort only.
