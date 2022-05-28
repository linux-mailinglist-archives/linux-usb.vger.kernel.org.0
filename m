Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC469536E68
	for <lists+linux-usb@lfdr.de>; Sat, 28 May 2022 22:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiE1UkV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 May 2022 16:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiE1UkU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 May 2022 16:40:20 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC815AA5F
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 13:40:17 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id a12-20020a92c54c000000b002d2f39932e8so4220420ilj.19
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 13:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=bS6+g7fgBiFwD1ekT/9uQrMvAnNI5lC4ABT63K0ShAw=;
        b=PEYN/JgakqVuTK804CzzIH7Om7miMzV7OZt3reXXsIza/1vj/vAOyslIEZBHhv5nHj
         u7nteONhPIwhUyyxRZg0E0421fK+xaFMLJM7vD/siG5P0tkGHE9oAIeBSImJwysgJlVI
         BVJE+5qSbHMuSEDVwu+UwN8Q+w8eA8HVwThfvKWFrkKcCkYgJnqmHSPoR9tQNg1Lnqpm
         U0e3skyKzOdoKXWyPD1YWsa2bCVJ9t2LCb+nOm7FC9kw2G35JEe9Cpbj5R/TlxMw4s0m
         bA33dF0jpW2LkgQrQG+92kkjUk1aS/tmtbqejA0dDl+vLnJ/yjFu+VzeF50BRX08OWTw
         kFiw==
X-Gm-Message-State: AOAM53174fEkqUKcuyn8NE6J8taXTFfFkamA/BtoNyRjaLfnN3GIeodZ
        mu1ZG6jPJ9vj7HzfRhh94aHyB1U76F2pyXQHxMtOmMN0r4dN
X-Google-Smtp-Source: ABdhPJx+nYBaU8bsqJqVCu9UPQAsPEejq1TMd4ejR6FWyB+2XbrCSX8ah/4visCPxVeFhXXQ0rkVkpoKInc5YTZIuj8KYuf/VAmw
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2513:b0:32e:5298:8264 with SMTP id
 v19-20020a056638251300b0032e52988264mr25780252jat.178.1653770417161; Sat, 28
 May 2022 13:40:17 -0700 (PDT)
Date:   Sat, 28 May 2022 13:40:17 -0700
In-Reply-To: <YpKEoBORZLtXG/y9@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000414e8805e0186e9d@google.com>
Subject: Re: [syzbot] WARNING in driver_unregister
From:   syzbot <syzbot+02b16343704b3af1667e@syzkaller.appspotmail.com>
To:     andreyknvl@gmail.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
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

Reported-and-tested-by: syzbot+02b16343704b3af1667e@syzkaller.appspotmail.com

Tested on:

commit:         97fa5887 USB: new quirk for Dell Gen 2 devices
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d7b232ec3adf5c8d
dashboard link: https://syzkaller.appspot.com/bug?extid=02b16343704b3af1667e
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=103c91e3f00000

Note: testing is done by a robot and is best-effort only.
