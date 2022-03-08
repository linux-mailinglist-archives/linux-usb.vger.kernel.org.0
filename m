Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0BA4D1B8A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 16:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347769AbiCHPVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Mar 2022 10:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244311AbiCHPVG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Mar 2022 10:21:06 -0500
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CF84DF43
        for <linux-usb@vger.kernel.org>; Tue,  8 Mar 2022 07:20:10 -0800 (PST)
Received: by mail-io1-f71.google.com with SMTP id d19-20020a0566022bf300b00645eba5c992so2557647ioy.4
        for <linux-usb@vger.kernel.org>; Tue, 08 Mar 2022 07:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=t0VNOU7RRwjb3H7s1WRSl1+Azc/DP7e41yedGLIzhXo=;
        b=Wkhcx67z8+2eDl7vG37jxJm38cH83DqGmKMcnm/yzbwx3J3tjk6OTChnhycq3txB6S
         Trf+vjMGpaCj65NTg9vmRCRm5JnxV2qk0fOHKb7/BzsQVfNsS62qwLsNHRFEJJv4kWkT
         1oq7pvYk/eqQcVgcEK2knZjUQZHpAx1mu/Q/SVUnroiOb++SdUgpUVvbfkOhCbypA8RY
         emhv22EkYL9mA4rYnOGFPLWk05/2YVse9qhdTWQuUesWzbM3+srcJBHyh4gFfe61h8fe
         HYuTupTO2mz9R78Yk0cOj1OxuGFsrtEM0NcdQ71ZBd+ajbwxPz0Wc8iqf4ZMGSoXG+s1
         IdMA==
X-Gm-Message-State: AOAM532J6t7gQ5Bj7vwLRfSwxCvDg8ehaDrD53Skyz7C8ziUxYOmmbAJ
        x26pHfhCIyOHzEOjVl7rnLG4YC+OwuaczR4yth0TgTFibe6b
X-Google-Smtp-Source: ABdhPJxIN1KmDqfCPfbxTpbcL1P976T5kld5TWrV6qwp59ZVvVUSFZWeL+pWItJl4jnlnqyijl4xmXUrp4AFu7GyO3ZtQUl40q2Q
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c04:b0:2be:4c61:20f4 with SMTP id
 l4-20020a056e021c0400b002be4c6120f4mr15914234ilh.245.1646752809820; Tue, 08
 Mar 2022 07:20:09 -0800 (PST)
Date:   Tue, 08 Mar 2022 07:20:09 -0800
In-Reply-To: <20220308150836.3680-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000043292605d9b684bf@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in cdc_ncm_tx_fixup
From:   syzbot <syzbot+5ec3d1378e31c88d87f4@syzkaller.appspotmail.com>
To:     hdanton@sina.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
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

Reported-and-tested-by: syzbot+5ec3d1378e31c88d87f4@syzkaller.appspotmail.com

Tested on:

commit:         ea4424be Merge tag 'mtd/fixes-for-5.17-rc8' of git://g..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
kernel config:  https://syzkaller.appspot.com/x/.config?x=442f8ac61e60a75e
dashboard link: https://syzkaller.appspot.com/bug?extid=5ec3d1378e31c88d87f4
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=129f209a700000

Note: testing is done by a robot and is best-effort only.
