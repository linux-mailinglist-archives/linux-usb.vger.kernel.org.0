Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2FA9536E00
	for <lists+linux-usb@lfdr.de>; Sat, 28 May 2022 19:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239178AbiE1Rz0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 May 2022 13:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238978AbiE1RzY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 May 2022 13:55:24 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F4F120B3
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 10:55:23 -0700 (PDT)
Received: by mail-il1-f200.google.com with SMTP id i18-20020a926d12000000b002d1b13b896cso5065016ilc.7
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 10:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=8fXjU/ZbiGyVhFFAYJKqBjQvQpcxyuo7di2DSV4UV84=;
        b=j3rsGtVnHWWWF/tvHnV8xsbcIcBkU0np6fatT1G76S197OtJeRcDh6wzVy0p/WvYxT
         73eZ1wkm2N1Z631gKhIAuxG5es1+4ZT4W4J/fd+jOe3zNFZCxw/8cZM4c9t79m+jVliC
         IP4j7/vVc0inB/x93ApRJir/c9uAT6o7l+BylhCfg1ZX5KLDRJTTlzU3GxRINWMG8b9z
         Y1UKoHvVJwKyfNLw2lTyjVGCn7vFYcjpJBimvq3pDedzdKEfxHl2tcEF1DYxTwsO/Zhg
         EvhDnfK9SwX1o0jAy7O8FQho4RDj3F4wniGG5UKfzTVNS+D1eNjJdX2wLzF72hgf4pdd
         9iXw==
X-Gm-Message-State: AOAM532xKQklRmf6jZx1XhKpPRl5gPX8b7tZFvcPCymbK3Ul8gwCBPa8
        +M3FD3+TaE/jnXGuC9aCL45HloQi3YbzFjglLwaIQ2BVNgnf
X-Google-Smtp-Source: ABdhPJxO7aUCkjM0UfdDnQmD0Nmu7o0bFfpzSg9h0WdtoBHyB4e3jjNpAPbow6+7PDw+VkBvkbHA+vS0vQakdK4WHNKEg4bcKpQ0
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3002:b0:32d:acc7:4a7a with SMTP id
 r2-20020a056638300200b0032dacc74a7amr25577537jak.14.1653760522347; Sat, 28
 May 2022 10:55:22 -0700 (PDT)
Date:   Sat, 28 May 2022 10:55:22 -0700
In-Reply-To: <YpJaiGRcRjDzRxQC@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007a6b3605e01620c8@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10f44625f00000

Note: testing is done by a robot and is best-effort only.
