Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5CD06D1019
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 22:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjC3UjX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 16:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjC3UjW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 16:39:22 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27ADCDBE8
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 13:39:21 -0700 (PDT)
Received: by mail-il1-f200.google.com with SMTP id o8-20020a056e0214c800b00325f0a48812so10604891ilk.13
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 13:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680208760; x=1682800760;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFbffXJR0JL9PDHMNwY5NVqIQ/uvZ93Gi0qNlmzxWos=;
        b=TmEK4508yIR3hKlJQliUz01FF2ZI1vwnumRHEJWOshIx5br0vxIHSHhxR5tj5oa0V2
         0E8q+wI4ZyZKpS9Y8AHvtwEIog2M0/21F1vUmQOpfESv41u+KVBKcljiynHw54PqXWAh
         WEwdofJm+N5GBxkIgh4v3gJKlbeK0bnj5RciKzJwQroxTHEeYcxqEwz19VzY+xJFi23f
         CbaYSmHsjsna9OhDR7xoS/Y9SZJvjHwKefraO/k99C7PyjR7Sed77qBzJdvvT3SmH3Sp
         SN+5f4cgDkw+TY4h8cYZdcQtMEEh/TWHqMzmlNf3AOPBoDXZ2S5iB6v6VU62nSk2s3XZ
         T1kQ==
X-Gm-Message-State: AO0yUKVdAZp236J+fRU0JBx1UHRgB1mbDJOTeA58/2CRK0UUzALXrXHo
        m2ji8PQFyCEMvInoxHa1nGNE+u68pVyNZAnZOwu4iBVcNGFF
X-Google-Smtp-Source: AK7set+0oavY+0jKy0ek5WpcstbGWarENmcFKtA+8z1+E0AQn/vJmAFoPbgf7h8KMvihhKAX1KqGlfyWGrrCnL+4C0k9lCPKQeHW
MIME-Version: 1.0
X-Received: by 2002:a5d:93c8:0:b0:753:34e:2ee7 with SMTP id
 j8-20020a5d93c8000000b00753034e2ee7mr9264465ioo.0.1680208760480; Thu, 30 Mar
 2023 13:39:20 -0700 (PDT)
Date:   Thu, 30 Mar 2023 13:39:20 -0700
In-Reply-To: <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000051298605f82416f5@google.com>
Subject: Re: [syzbot] [usb?] WARNING in shark_write_reg/usb_submit_urb
From:   syzbot <syzbot+4b3f8190f6e13b3efd74@syzkaller.appspotmail.com>
To:     hdegoede@redhat.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+4b3f8190f6e13b3efd74@syzkaller.appspotmail.com

Tested on:

commit:         c9c3395d Linux 6.2
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.2
console output: https://syzkaller.appspot.com/x/log.txt?x=16d9f695c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fea01b13d861cd1e
dashboard link: https://syzkaller.appspot.com/bug?extid=4b3f8190f6e13b3efd74
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1134ea95c80000

Note: testing is done by a robot and is best-effort only.
