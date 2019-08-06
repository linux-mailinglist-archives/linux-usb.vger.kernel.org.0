Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C416E83428
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732972AbfHFOoB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:44:01 -0400
Received: from mail-oi1-f198.google.com ([209.85.167.198]:37239 "EHLO
        mail-oi1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730289AbfHFOoB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 10:44:01 -0400
Received: by mail-oi1-f198.google.com with SMTP id f19so34971663oib.4
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 07:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=o7//8iB2+6zGco03+xFocLFfAcZonkdqACzLbnG2qjA=;
        b=awiDYVvc//ZlCosOh13xuWRgaU30xJHEbWw6+x/OU2rCS2Kj2kBcogQH5nWQo9vRkC
         6GztUGOlSK5ntqrI7UbszNXgd48IWjjvUiN03pBRelBAV8LFnMPFm2z6/KAQ9MAZG0WC
         pG9B7uUf/I9tpoqtmf4TnN2cmeUCZZQ8ru2R4ubVbTon4QQ1stTmSkjU47aH9sagGGB/
         gs3HUbhZHpVR9+hyXIIMaxzNUSv7xkemRxfX3dE5zhas2yKBG/U3dvOkf3QrMkuPqnDX
         4ttUc9+p3Y2TPZLiYL2IglCMMlnM6o4H9+6yKsY/3qJOJ916AspdeM0NAgVDNlx5aTwN
         7/2A==
X-Gm-Message-State: APjAAAVsIOwHr+sweEeMVCwxkP/bp6PCD5cgArTOhcqUmDzU+8b1MM++
        3mbcV9eTm03Y7pfCmTAChpEWy9AVnFSK7i/QpM7/mGKoo2eH
X-Google-Smtp-Source: APXvYqxhrNwTseRTFw5wjrTjrawO4Y+BbVGzZ0FahUYV0NBNMjhohXbjEAHejKv5xErk7UrFlglOaKzTBOsYvQ0GHsAmi06aLr5x
MIME-Version: 1.0
X-Received: by 2002:a6b:dd17:: with SMTP id f23mr3667897ioc.213.1565102640986;
 Tue, 06 Aug 2019 07:44:00 -0700 (PDT)
Date:   Tue, 06 Aug 2019 07:44:00 -0700
In-Reply-To: <1565096744.8136.23.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f400cd058f73dadd@google.com>
Subject: Re: KMSAN: kernel-usb-infoleak in pcan_usb_pro_send_req
From:   syzbot <syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com

Tested on:

commit:         41550654 [UPSTREAM] KVM: x86: degrade WARN to pr_warn_rate..
git tree:       https://github.com/google/kmsan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1170f88c600000

Note: testing is done by a robot and is best-effort only.
