Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2426F3314
	for <lists+linux-usb@lfdr.de>; Mon,  1 May 2023 17:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbjEAPnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 May 2023 11:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbjEAPnA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 May 2023 11:43:00 -0400
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF5C171C
        for <linux-usb@vger.kernel.org>; Mon,  1 May 2023 08:42:58 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-32a9dcff43bso40684155ab.1
        for <linux-usb@vger.kernel.org>; Mon, 01 May 2023 08:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955777; x=1685547777;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPfxIWTGWp9CnObZyzs1d46Jlghk+cgMkQDmg9cUi10=;
        b=KPy0ixaFy9yiFiNyvfFiamdJAfRHJzjv3HUX9I8HRbhf3CAdIAQHzmcXGmRS2Ci2bw
         8YQepAC1ilMjDgOA4YcUC2MmZDAFU7vQ/tomo0xnA/yLVETCwQlW/dKF+UcuCm0qAL1y
         5CQXbR54do8a+3y8rxcy0M70eQMdMPclbfIInO2P1xb+xIfbRYkmvry+FUYV+Ni6fNiX
         rOpS/JipXhJYVWX32xwRESMuxI7LW6EiUyFWrYjqSsotS289wm40jNoNWcbGEAs9oz0D
         9ms2CqLshOYQe2qhlEfnHOjBsWj1akaKNMvd2xL3GUU5Jwv6GibEuiXD13Pwt49kAHHX
         BNvg==
X-Gm-Message-State: AC+VfDw2Evh6icA+9ttvC+kRl7UaJfSDHhUnioV4khSndRQFHO/h0BAN
        5RZ6ps0GlhHUWgGsHgoNFbENgXmkZN64JasUroFv+xxHmEt8
X-Google-Smtp-Source: ACHHUZ4gRLL9co/RarnRBiJRlrXnjbEi963M3YPUDd3N1ggqfCqLESp5xxQQG3e9xAXGtWiHbMDRvDoZpJYKHr2WIvaadCdza8nk
MIME-Version: 1.0
X-Received: by 2002:a02:8629:0:b0:40f:9f49:e4b1 with SMTP id
 e38-20020a028629000000b0040f9f49e4b1mr5784651jai.3.1682955777572; Mon, 01 May
 2023 08:42:57 -0700 (PDT)
Date:   Mon, 01 May 2023 08:42:57 -0700
In-Reply-To: <38c0a2fd-cd9c-43b3-99f0-4f9ed2fdc69f@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004b903305faa3ad0c@google.com>
Subject: Re: [syzbot] [usb?] WARNING in usbtmc_ioctl/usb_submit_urb (2)
From:   syzbot <syzbot+ce77725b89b7bd52425c@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+ce77725b89b7bd52425c@syzkaller.appspotmail.com

Tested on:

commit:         58390c8c Merge tag 'iommu-updates-v6.4' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=12708e68280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d56ffc213bf6bf4a
dashboard link: https://syzkaller.appspot.com/bug?extid=ce77725b89b7bd52425c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11ff68e8280000

Note: testing is done by a robot and is best-effort only.
