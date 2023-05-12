Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70AF7701139
	for <lists+linux-usb@lfdr.de>; Fri, 12 May 2023 23:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237826AbjELVbh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 May 2023 17:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237001AbjELVbg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 May 2023 17:31:36 -0400
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC9330D3
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 14:31:34 -0700 (PDT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-76c7d59e5deso355187139f.1
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 14:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683927094; x=1686519094;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1TB8qWBc7ISGVtUJq8MlE45xsZ+O+Plqf3y+/JYt/E=;
        b=i+xyPTpeaPmfOBa6OEytCSLbfrqcciFdtYuHv2hkyvXNLKJlS4HnKjMrc3CQJ81cPB
         fU7gdFPiHivO/NcTOazLJ6mU2DgRkpvUg+kKGVdo+U4SyqaN/RUHDAGUAbseYJY8wvrR
         ch/cJ0jc0+WBFJAz8BjXU+nHv3yelRO4YH7Agz0DnGADd6gv5boXuZeXdYoilpebCBk6
         HFMQ+WouH4tKIdc0FnWZDELSLLmDaLWqVJ7vyvVdXo5D2Rgmz9rbze+FgdU6w91ZixP7
         DevxatHfaLEb4kscwAob3LkaXq7a8PKFLPRVelt1NNu+c1O8UFCermEn4pfTFQDUjxZG
         kgjg==
X-Gm-Message-State: AC+VfDw+Q6O1rqLbanGWc4ccL0vRvt6YVh87BwL013RTwsSe3mEpkHgM
        FEi8Nc0bOvT5cXo1VyvdJs/6CZqo2YfzXEqiYxsx4JQrm72R
X-Google-Smtp-Source: ACHHUZ7W4uXLhm/w46htLUfgEo0v+zMqI6TVspy14QOn6BhU5DKGjs5jz5lVBNRrZUH4ZlwgK0/tTc7jNtY1jnYv51FZEM8cYvy1
MIME-Version: 1.0
X-Received: by 2002:a6b:4902:0:b0:769:6f5b:6d7d with SMTP id
 u2-20020a6b4902000000b007696f5b6d7dmr12053580iob.2.1683927094246; Fri, 12 May
 2023 14:31:34 -0700 (PDT)
Date:   Fri, 12 May 2023 14:31:34 -0700
In-Reply-To: <000000000000121ea5058e445936@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000047c61c05fb85d44e@google.com>
Subject: Re: [syzbot] [usb?] WARNING in shark_write_val/usb_submit_urb
From:   syzbot <syzbot+1cb937c125adb93fad2d@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 76e31045ba030e94e72105c01b2e98f543d175ac
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Mon Apr 10 19:40:05 2023 +0000

    media: radio-shark: Add endpoint checks

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17cfcfca280000
start commit:   b229b6ca5abb Merge tag 'perf-tools-fixes-for-v6.1-2022-10-..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f98d9171d58550f
dashboard link: https://syzkaller.appspot.com/bug?extid=1cb937c125adb93fad2d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17070aa6880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=177ab2da880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: media: radio-shark: Add endpoint checks

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
