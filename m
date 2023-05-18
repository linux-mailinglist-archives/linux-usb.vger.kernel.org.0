Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93DA708A22
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 23:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjERVIb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 17:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjERVIa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 17:08:30 -0400
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5215910D2
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 14:08:27 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-333eb36e510so20571115ab.1
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 14:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684444106; x=1687036106;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oCJmZhikEGgvshSFtgr79kh24UyNzZUnmc8l6fNAyog=;
        b=hj8M5qF1BPTpaMAqagaPfEN+289IKu9DHuFM2fHB55NlGSbC5horrQNPQKZ4xmlNLt
         DXGWQWgLH6Y3zdn9bXAZsr20S6HY571kVA37EpCFh6RjyAoDKDF+Tn4BjyOTve8YXozi
         Pz6vrqeIPVXBybDEdksZBnP/Cj/TZZyoXRiObEsLv7YZJK1JCbeSK+HonB3dvTDEk9lJ
         RwIwzmOx3I/UfsLhGIbpEC/0EBrSrTNqWDhtj9L+57zAyRtr3NSP9aDx5GDerqx1K1yE
         wkxY+VDVynVb6/NUcjeUVe+JPI0/0Gq6e7+2QLIpFzytLOAG9XqbSV1G7MNfIcXfyejg
         y+Ow==
X-Gm-Message-State: AC+VfDz/PWRr0FXHeX/HwLY9iTiOXAsmHfFUM8rE4KfEMnJ35Ju/i0nY
        vRzNUjMaya454ykilQKeOtxoPK6OGKjRUUnVOzLtDkvuxZl/
X-Google-Smtp-Source: ACHHUZ6O+AwC9jQ6/HWx9bF4gsIW4ateeFT9tlEiAvl6X0cm+bMtLLafLfqIApH9fHqyJCPWOSItmHrhVXZe54RUpchQdppkkfQY
MIME-Version: 1.0
X-Received: by 2002:a02:93c7:0:b0:416:5d0f:f494 with SMTP id
 z65-20020a0293c7000000b004165d0ff494mr1952410jah.5.1684444106608; Thu, 18 May
 2023 14:08:26 -0700 (PDT)
Date:   Thu, 18 May 2023 14:08:26 -0700
In-Reply-To: <c7b8e69a-cabe-4e17-a511-66179259d1d7@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009e5a1c05fbfe34c5@google.com>
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in dlfb_submit_urb/usb_submit_urb
 (2)
From:   syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>
To:     bernie@plugable.com, deller@gmx.de,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com

Tested on:

commit:         a4422ff2 usb: typec: qcom: Add Qualcomm PMIC Type-C dr..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10b6b9a6280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2414a945e4542ec1
dashboard link: https://syzkaller.appspot.com/bug?extid=0e22d63dcebb802b9bc8
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1374e5a6280000

Note: testing is done by a robot and is best-effort only.
