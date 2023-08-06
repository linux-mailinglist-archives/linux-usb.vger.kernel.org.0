Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C02AF771694
	for <lists+linux-usb@lfdr.de>; Sun,  6 Aug 2023 21:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjHFTie (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Aug 2023 15:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjHFTid (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Aug 2023 15:38:33 -0400
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F096171A
        for <linux-usb@vger.kernel.org>; Sun,  6 Aug 2023 12:38:32 -0700 (PDT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3a5ab57036fso7002018b6e.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Aug 2023 12:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691350711; x=1691955511;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHAFAUtlpPTsblmGRi8/yz/rtfn+G6tOKLxXyDwkU7c=;
        b=EuZOQEv2cBmzRtwS9hUss3C9xbHnt/md0q9OayL0m6wmqlCq6gGlV/kRpZxrEkTdSR
         7ji3lDAIEctfuyIra67Ju7eYR3yRW2Yw698e8ktrHwDiUUReBhCgwmBkjmfbL/HhvOI9
         DFrp/EBq7TJx3jAW4jeadbDlrlSFAFcvbh2JfR5K/Suzgh/IOnU+hE5GF6EddRCb/KX1
         YlHgMYJg8sZ0ZHCIeAMLfGbTWHgJ2n8FYKNdAslCFHY0RY1kiOd6/ObzycNI5C59d6qD
         PBWUePkuTdb8bjE1BzTekhtlVNCp05K/lmo0sVnv5lp71uXnwbHtY6Ew/C2yM/LbC57/
         t12g==
X-Gm-Message-State: AOJu0YyBa7jc7kYaBEWxaFkGAE2myGelyyicfqNWtCuITi+08lhCfRUa
        lpkf6T0FHAagkNgGhv0AycXTa2cqT0rveaK5KBYBvJ9FTzZJ
X-Google-Smtp-Source: AGHT+IF40jj0zFbkkF2AkDSkU6OeSWL//98qOUQ8SLl2cjxFtDsY+SqCrZULINynDdtK/cdLxjdxmz+HSUoxFnDSbnBts8CbBw0I
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3020:b0:3a7:275a:dc69 with SMTP id
 ay32-20020a056808302000b003a7275adc69mr11976106oib.1.1691350711498; Sun, 06
 Aug 2023 12:38:31 -0700 (PDT)
Date:   Sun, 06 Aug 2023 12:38:31 -0700
In-Reply-To: <0000000000005003fe05a8af2231@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000597f580602464669@google.com>
Subject: Re: [syzbot] [wireless?] INFO: trying to register non-static key in skb_queue_tail
From:   syzbot <syzbot+743547b2a7fd655ffb6d@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, ath9k-devel@qca.qualcomm.com,
        brookebasile@gmail.com, davem@davemloft.net, kuba@kernel.org,
        kvalo@codeaurora.org, kvalo@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com, pchelkin@ispras.ru, quic_kvalo@quicinc.com,
        syzkaller-bugs@googlegroups.com, toke@toke.dk
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 061b0cb9327b80d7a0f63a33e7c3e2a91a71f142
Author: Fedor Pchelkin <pchelkin@ispras.ru>
Date:   Wed May 17 15:03:17 2023 +0000

    wifi: ath9k: don't allow to overwrite ENDPOINT0 attributes

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1243d549a80000
start commit:   559089e0a93d vmalloc: replace VM_NO_HUGE_VMAP with VM_ALLO..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd7c9a79dfcfa205
dashboard link: https://syzkaller.appspot.com/bug?extid=743547b2a7fd655ffb6d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15d5d7f4f00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106ff834f00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: wifi: ath9k: don't allow to overwrite ENDPOINT0 attributes

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
