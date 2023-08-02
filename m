Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD1176D483
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 19:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjHBRBo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 13:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbjHBRBk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 13:01:40 -0400
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDBA1726
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 10:01:39 -0700 (PDT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5662c34e5cdso102354eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Aug 2023 10:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690995699; x=1691600499;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caklcQ8zXP35AFvs1Skd0dLN1uNpRcw319HyOn8Wu94=;
        b=S4ff0jsAubzV6tnm4zv6Cojtw5LLg2wp9Zaclwce+SsupimBvyIZU9/PXdDumH2seS
         R9kntlLv7kScsEaFC69TQEg25mEFwoby2nS9wIJHSmwbsBQqgFdrLRD12Chx98Fw9Ekb
         sPn7gcuzmFGwwrQE57Eei9EQ5UAwmAexKboFBS/xLqkgaLwTDimsKDBdI7mVwop/Wvwj
         wzw8qcmXQXsah+bn4l9yyFE79Vmr7iPd77e4km0G8anLoNjaDhyPjCOcXT4FoZsrcKKI
         xSSEmvHE2Ui7MBZsFMZXUrg8st8gyuHu+YeFmy5Os6Uu0B5Ps7JCF3GaoYRZS2FLlIEW
         6ejw==
X-Gm-Message-State: ABy/qLYKC4m0X7KaqCNfvsNVg8yst/rsSz07l5Oz3jPLSQfpK7A6Zt4F
        s5tf6hR99HuzpS4lFeUESJQm7DFCdhP4N6Il8LHaH+XI+8Sw
X-Google-Smtp-Source: APBJJlGulYYkz+bq7cpRVtbZqc4W8NC5ZaAtYhSf78V3TU6IZzJ3Z0IDfoRp6WXQNsiQm+W4XJ+5AVu1lYmCZzdKL3HQxKEbRJTQ
MIME-Version: 1.0
X-Received: by 2002:a4a:4515:0:b0:56c:cf3f:efb with SMTP id
 y21-20020a4a4515000000b0056ccf3f0efbmr6724683ooa.1.1690995699164; Wed, 02 Aug
 2023 10:01:39 -0700 (PDT)
Date:   Wed, 02 Aug 2023 10:01:39 -0700
In-Reply-To: <497564c2-632f-472a-914e-5e19488824ae@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f72f670601f39d9e@google.com>
Subject: Re: [syzbot] [usb?] [usb-storage?] KMSAN: uninit-value in alauda_check_media
From:   syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>
To:     christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com

Tested on:

commit:         6eaae198 Linux 6.5-rc3
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.5-rc3
console output: https://syzkaller.appspot.com/x/log.txt?x=159285dea80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=254d7af7cd6058ea
dashboard link: https://syzkaller.appspot.com/bug?extid=e7d46eb426883fb97efd
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1020d97ea80000

Note: testing is done by a robot and is best-effort only.
