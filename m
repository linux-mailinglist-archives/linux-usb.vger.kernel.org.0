Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706A03FF51B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 22:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344631AbhIBUrO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 16:47:14 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:48663 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243511AbhIBUrN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 16:47:13 -0400
Received: by mail-io1-f70.google.com with SMTP id z26-20020a05660200da00b005b86e36a1f4so2273943ioe.15
        for <linux-usb@vger.kernel.org>; Thu, 02 Sep 2021 13:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=vZddxkmzzNUqs8xRQqKBJZn3gzD87BQVYbHyMNSJKX0=;
        b=eEVOn7ZUDRertLfXkBAsAXE04mFAHOhz6JHTwYxwr9o5BBV63twS/vFzbjNLq/TGKQ
         fBkqzDh+pWqG+lzYE1NjmHZzThp8gnyU1RtoORBtybZxdUeW11J1h9ifogkX0E3d27Q0
         9P0oYXYasYAzxdoGUbyniGN7n5NXpMoJYrEP1YqiujlW3MOfZqplcPaL/YZoviQP4lbJ
         jiNtHL3vhX9Fk3VZ8yaR+JvW1h6emd42uz+nBwnj5PwpPZ6HwuMeFLOuajvjMms2djSx
         JYTx+kK8Reke462RNiOsi8/jTavRJDzbfLMox+wJJZXpUtkeIc+XQHPP+cJG8OrvMyG4
         obdw==
X-Gm-Message-State: AOAM532OYfogWClnNvu9YiyAEVldDTYLnfNKsiUoDe5FXqiIQdu3PINI
        utuZB1TYtq9NwmG/cY8L8UJJ799jyUhEp4HVPFoJup6qLRRM
X-Google-Smtp-Source: ABdhPJxBp06Vus/lGmmaHSEye35bdz53/shEn/WIWJXsVKGgQMpYtb+dAiMQZDJeOF8ZK3xYam4JOHxRRS7J0C0O1zGTkLFKqZbn
MIME-Version: 1.0
X-Received: by 2002:a5d:9409:: with SMTP id v9mr223494ion.170.1630615574684;
 Thu, 02 Sep 2021 13:46:14 -0700 (PDT)
Date:   Thu, 02 Sep 2021 13:46:14 -0700
In-Reply-To: <20210902200406.GB442125@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001827b505cb0946a5@google.com>
Subject: Re: [syzbot] INFO: task hung in do_proc_bulk
From:   syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com

Tested on:

commit:         d5ae8d7f Revert "media: dvb header files: move some he..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=2fd902af77ff1e56
dashboard link: https://syzkaller.appspot.com/bug?extid=ada0f7d3d9fd2016d927
compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=112280a3300000

Note: testing is done by a robot and is best-effort only.
