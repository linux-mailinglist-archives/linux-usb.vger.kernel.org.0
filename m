Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8D27050A9
	for <lists+linux-usb@lfdr.de>; Tue, 16 May 2023 16:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233769AbjEPO1Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 May 2023 10:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbjEPO1X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 May 2023 10:27:23 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCBD136
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 07:27:20 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-331632be774so36162345ab.0
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 07:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684247240; x=1686839240;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEdNI2ivYxOT1+ehWt92KVPedJERHmit4xqcWHC12Fc=;
        b=dSjrDEaYmUa8NpWxu9MICKEyhDDdgtjUBEAbKYoiogptYEkuLNwZkoe8Dss8w6rj3N
         mMtcoRJUBh9CgAIY/MqumkjKCyi1Hcu2P970sn6VlcX4x1CVai6HUiRvgJKqA5ge84bv
         GwFTNy3UhEr7wQnbxf3x/OUGBziiD46ROvi2Bk7hVSjkzpjBqm4E7EFXr0FAYuwjw/mA
         bT+v2jWRlZ0m6O1bvR6M0Nx/B7IEfX0mH5iMJgsC1zXc4mtb+40l6y1qqcfBuxHOvmeQ
         0odQkrzIoUXFsHWfmDc3r7iCPbtuCucsD/DLjaTgDctHChWf/hZmAwYzc4C33CWPiP36
         0Qcw==
X-Gm-Message-State: AC+VfDyQwfDYCb4rdn9PDlIlDFjPd0xBciCt/5rx39nB163BCa5Ii0UZ
        bDeQpBXar2cwXZrEn/BwUpH46SXbT+iW0WaKHbnTw1TlYCfm
X-Google-Smtp-Source: ACHHUZ5ntS4dKyRbs/lNewwEt+atIVkoR5+v3/EYXMrsVGZwJu5BXxjfMh71AdRlLC3A/vGmMWyNjR1EC0CzbhRMsmzz1yM7ZmR/
MIME-Version: 1.0
X-Received: by 2002:a5d:9da0:0:b0:76f:e71e:5f9d with SMTP id
 ay32-20020a5d9da0000000b0076fe71e5f9dmr2354070iob.1.1684247240261; Tue, 16
 May 2023 07:27:20 -0700 (PDT)
Date:   Tue, 16 May 2023 07:27:20 -0700
In-Reply-To: <2023051628-thumb-boaster-5680@gregkh>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000078459205fbd05edf@google.com>
Subject: Re: [syzbot] [usb?] memory leak in class_create
From:   syzbot <syzbot+e7afd76ad060fa0d2605@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, rafael@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+e7afd76ad060fa0d2605@syzkaller.appspotmail.com

Tested on:

commit:         22b8cc3e Merge tag 'x86_mm_for_6.4' of git://git.kerne..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=16eedb6e280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c317b48f2c445e87
dashboard link: https://syzkaller.appspot.com/bug?extid=e7afd76ad060fa0d2605
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ed8b21280000

Note: testing is done by a robot and is best-effort only.
