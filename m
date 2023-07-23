Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0977A75DFB4
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jul 2023 04:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjGWCV0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Jul 2023 22:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjGWCVZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Jul 2023 22:21:25 -0400
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290AFE58
        for <linux-usb@vger.kernel.org>; Sat, 22 Jul 2023 19:21:24 -0700 (PDT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1bb4f5cf0fbso614522fac.0
        for <linux-usb@vger.kernel.org>; Sat, 22 Jul 2023 19:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690078883; x=1690683683;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TOA6MBO5eeYzMXhIGdW4VuAaS2Ls3qmxsIYYP7c8nLo=;
        b=j9MCDBgojfTpnD47Xv6dhXY0S5t7mMuMQ4VwZxezkFdQf8VJl06e4PkxSnOqR7Kkb8
         5EIb7HuPmg58HIQQF6fF8c0Aaht0kcfxGBTPbPaPTnF2NVTMrJjgtFBf76rMgnTgVfQp
         tG6Ck7QJbrmn+0i3DMTk4xAiQAYML8Mgs88VEzhx9Wx6H1e5ahNnjhbrrDpfteAPh31B
         TsUuuNuFvQ0iqQfBiH/gF2mhWyXx+cPUkbq7g6Ly1gLXr/Nn/xPTIA1sJFlYFAqQyFNT
         VtAlbSsLZOYpB/U12C//nhCtIqcGWuAJxqc5SIYuE6RjR8f5YB+35ZZ+yf1PFHxOIVMt
         oXFg==
X-Gm-Message-State: ABy/qLbP7w/uDg0kSDmIzFASVT1SBOgnJpRXa1zfxErbrVEk2pT4Z7AZ
        OeGBIBG3TBo+1RJat+gYYHSnoczpIb39HJeMcTIiGeHxpbAo
X-Google-Smtp-Source: APBJJlHiUKIeM3iw2P9N2qCURKs/ollmVxptg5uOxvpuK9Fk8papl1lHycvMuqMND1sI9IQ/uSo6Fghq1Bu409FlOi4ik0e5zw5T
MIME-Version: 1.0
X-Received: by 2002:a05:6870:a8a7:b0:1ba:e6c9:7ad with SMTP id
 eb39-20020a056870a8a700b001bae6c907admr6815673oab.7.1690078883592; Sat, 22
 Jul 2023 19:21:23 -0700 (PDT)
Date:   Sat, 22 Jul 2023 19:21:23 -0700
In-Reply-To: <e5a6c3be-6dd3-4c85-9c5b-f9fb7aca0b36@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007fc04d06011e274f@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in
 read_descriptors (3)
From:   syzbot <syzbot+18996170f8096c6174d0@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, khazhy@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+18996170f8096c6174d0@syzkaller.appspotmail.com

Tested on:

commit:         fdf0eaf1 Linux 6.5-rc2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.5-rc2
console output: https://syzkaller.appspot.com/x/log.txt?x=158187d1a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=77b9a3cf8f44c6da
dashboard link: https://syzkaller.appspot.com/bug?extid=18996170f8096c6174d0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1120305ea80000

Note: testing is done by a robot and is best-effort only.
