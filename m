Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F91E74EFC4
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 15:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbjGKNBz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 09:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbjGKNBy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 09:01:54 -0400
Received: from mail-oi1-x245.google.com (mail-oi1-x245.google.com [IPv6:2607:f8b0:4864:20::245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C087E1721
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 06:01:24 -0700 (PDT)
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-39a9590f9fdso4247688b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 06:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689080409; x=1691672409;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHO68MXPpG0tvQzxAfkPPUuZs9MEkFTVvcLzHBD3OLA=;
        b=VFrLumNXf329lfp3zGN5MoRzFybM21zyQb5Gi77Y2IJLsbEk4I0HU8gqPnGBBbjB+6
         oYwS7YLX1Xt+K7QMt6LYWfR/boD4YIFhB0hzp8oFqBJtUAQPmGx7LbEzRmfroBKKoM/6
         jTaYB/K2Rt0aCIFK9Po9VrBAUg8BeIJSObDvCJ/aKycUjcfbtnQ22jv8HfsdXCoDknhx
         vEPCWHiO6F+Xjc2Lru8++zFWVRVkQjgSuZGWUP/Zlp8ja9Fc3OcxiZC6/Eljoc1qNM6T
         wXwlMZyDMhZKtrCBMEoPurvItBVapM4txDjXfHqBSv1m+X0kpU/Zyb/DPtr/QtQKcAII
         kkJw==
X-Gm-Message-State: ABy/qLZahw+jRGhRrhG4QSnc3Y+c8XvmVelqt0vqdp96sBHGh4nv3i7d
        i3VtTY6mXZ62FTmXgxcuc8fsYLdx2Ay7qiiidLeWCvate2oE
X-Google-Smtp-Source: APBJJlEM78f3nwOEwdHgjq9Mi44uFvFxi3Se/Jn99rEUe9f1P8TqteqjzvWe8OaMMfEt089MxeYLbUkwtNmaBVqFxUOiFEarLPfK
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e82:b0:3a3:7eca:3022 with SMTP id
 k2-20020a0568080e8200b003a37eca3022mr2139536oil.2.1689080408726; Tue, 11 Jul
 2023 06:00:08 -0700 (PDT)
Date:   Tue, 11 Jul 2023 06:00:08 -0700
In-Reply-To: <0000000000003ee3610599d20096@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c26a66060035ad18@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in __media_entity_remove_links
From:   syzbot <syzbot+0b0095300dfeb8a83dc8@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, nogikh@google.com,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SORTED_RECIPS,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This bug is marked as fixed by commit:
media: uvcvideo: Avoid cyclic entity chains due to malformed

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=0b0095300dfeb8a83dc8

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 9 trees can be found at
https://syzkaller.appspot.com/upstream/repos
