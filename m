Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6AA544BA4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 14:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235883AbiFIMXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 08:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234554AbiFIMXO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 08:23:14 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B318B393D7
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 05:23:13 -0700 (PDT)
Received: by mail-il1-f200.google.com with SMTP id w7-20020a056e021c8700b002d3bc8e95cbso17593128ill.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 05:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Cqa5lqsjEiB4OaqqzUaqVfFFKeV1C32L8SOc23gcEU0=;
        b=zapDN1XKoE3/fHkwVmjk8K5ZgJwTr7p4GcBdHTnrkr4Yq51tmglsiK99Yq2S4Xropr
         NC2N2dL3Tns4CKN65OeAVDx42K5csQZdsoZERnGvC/07RMRu15uV9rBwmN+GpVzhH01c
         sdx8/+g0XUo35en5qkoRrmqwV87xCyGI9UcMuS1s8dCK2VydJ5zGtW5LhNUWFvVJXQnN
         b3m1lkNtU9Osuew1Fwa4uSUo/By2C6W7k5OoYBYnRN0QYanFr7MlgCsWTuaW2h2s9OB+
         40Z6h2dR5ED0smee1IitWaPiCrlZ7f19SvLpaBaS+KfDQfZFFL5ImG4p/qsJh0av8nf2
         H5pQ==
X-Gm-Message-State: AOAM532YOsO/QS+8D/7Ni8crNvwGnB2NN1OENCCuM/S4rOEPom5gyzNK
        SBFZNzp6v2WkDfCHui8fIBbqoqq4FhcPrLTJauZcw1Ujuch6
X-Google-Smtp-Source: ABdhPJz7RQMxGYxkvxvtTJnOwb+mbJVrz7KfGsAUKFYfMNGMIc+OzaGjjCWW4tV0z15ZFOJkXGhBvFgkmizSa3m4viNqmuCnCzPn
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1646:b0:669:89a6:32c6 with SMTP id
 y6-20020a056602164600b0066989a632c6mr4898872iow.203.1654777393073; Thu, 09
 Jun 2022 05:23:13 -0700 (PDT)
Date:   Thu, 09 Jun 2022 05:23:13 -0700
In-Reply-To: <000000000000e2fc6405d3061843@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b252fe05e102e228@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in cdc_ncm_tx_fixup
From:   syzbot <syzbot+5ec3d1378e31c88d87f4@syzkaller.appspotmail.com>
To:     davem@davemloft.net, fgheet255t@gmail.com, hdanton@sina.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, lukas@wunner.de, netdev@vger.kernel.org,
        oliver@neukum.org, oneukum@suse.com,
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

commit d1408f6b4dd78fb1b9e26bcf64477984e5f85409
Author: Lukas Wunner <lukas@wunner.de>
Date:   Thu May 12 08:42:01 2022 +0000

    usbnet: Run unregister_netdev() before unbind() again

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=122a4b57f00000
start commit:   330f4c53d3c2 ARM: fix build error when BPF_SYSCALL is disa..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=aba0ab2928a512c2
dashboard link: https://syzkaller.appspot.com/bug?extid=5ec3d1378e31c88d87f4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=135ca155700000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: usbnet: Run unregister_netdev() before unbind() again

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
