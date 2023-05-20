Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29D0E70A5A7
	for <lists+linux-usb@lfdr.de>; Sat, 20 May 2023 07:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjETFYe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 May 2023 01:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjETFY1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 May 2023 01:24:27 -0400
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9311B1
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 22:24:26 -0700 (PDT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-76ce93a10f3so34931739f.0
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 22:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684560266; x=1687152266;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrdV0ygMdYPqAmG7LwAZV4OGjE5KtVQqdUSmJPUHjZU=;
        b=jfzx+PkXH+epE8SsTnNU9B/uG8640JyU9oNhh3sULc8PYa/MpWnudGfm22aLme591l
         DjlZuAxHBAhDVpXENtgpuvT/lwZ/5STtktL64TCWzPNMIOTKPCpHmOFjqxuqGTNp0ITB
         ipqXUjwoHhHi6MCPsx4cOyP3OGDw4nmfsZEyXvhS3V/hVcBKMFbPF3WJyZaB6XUoRvby
         KKPBfBoLFOYuxfUC2nroILDHE7AD71pYZKUbfhu+PW3tBckDnwihWSnkjtEvBXToc86x
         RNWUqE9Wba2Mgl6te2132WT/ADfX7NRQMd97iRhT9vC6ezh6ise9GTzox04CkJfxgE6C
         bVxw==
X-Gm-Message-State: AC+VfDyzTIjYUzCLAicWjmv7osGWHpL6YUiJ0phzXa/gG7qH7WnDVYld
        vbOv/+kYh3CtYndndp2kv/UZr94HMV0BecUYEjEjX17Bjj23
X-Google-Smtp-Source: ACHHUZ6hTFX7a0pVUYivQtv8iU28xZiCDjaD/cgUE6pqb8VNbogQ2Lh7JMQe9On01smA0p41OO2OMcJ1fCrx97WO3Na4JQboaq1h
MIME-Version: 1.0
X-Received: by 2002:a02:a10b:0:b0:416:5d0f:f494 with SMTP id
 f11-20020a02a10b000000b004165d0ff494mr1852614jag.5.1684560265963; Fri, 19 May
 2023 22:24:25 -0700 (PDT)
Date:   Fri, 19 May 2023 22:24:25 -0700
In-Reply-To: <0000000000003a41f705a9c74dfa@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000041730905fc1940ff@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_register_dev
From:   syzbot <syzbot+e761775e8f4a28711f19@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, charu@tickmarks.net,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
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

commit df05a9b05e466a46725564528b277d0c570d0104
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Mon Apr 10 19:38:22 2023 +0000

    USB: sisusbvga: Add endpoint checks

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1286f641280000
start commit:   7d2a07b76933 Linux 5.14
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b04081cf516e2565
dashboard link: https://syzkaller.appspot.com/bug?extid=e761775e8f4a28711f19
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133519b1300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116ec82e300000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: USB: sisusbvga: Add endpoint checks

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
