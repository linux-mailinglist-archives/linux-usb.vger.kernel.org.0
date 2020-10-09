Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B72D289B44
	for <lists+linux-usb@lfdr.de>; Fri,  9 Oct 2020 23:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403815AbgJIVzK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Oct 2020 17:55:10 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:44451 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403794AbgJIVzJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Oct 2020 17:55:09 -0400
Received: by mail-io1-f72.google.com with SMTP id d135so7237615iof.11
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2020 14:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=1VcEVtYsHrkseU7vptlx/kj9v0Fozh++G0GQ+AuTmvI=;
        b=jP6a1qBY6+ukXnURWkIIGyjhspq8ggTzD96vcdShJxkF7BmVevFHGAVkpxwYEPVwxH
         3HISndBRc0POD9niiKzsVKZr5JZ8WaiziWsvu9L5YG1RROtPfjDbo/kn+BK42yBUFzcO
         3ve6OGmRIeucMEqESxWs8kadHhIGXRpskHQWXNPt6K/DtL1Pkm9DqylQjU7WTgL9XUcT
         os/AnwnqOcMYMhKuNwPB9cSXxKEjBgQASoaEWU04Bq2H1YCJycpccL1W0oe+ON4WLrGS
         COA+YlsA58W5/9IIPzdT1qyNVJFs6MfehsiNLhNlSNmvioRzOOsEEhADpuvR8GRTNTFF
         l0nw==
X-Gm-Message-State: AOAM531nzhWqnm2EU8bOe72EUUpHmMoUdqmOy3JIIJtimJuw+xJhxLfH
        5O+5u9NLeIswab6oICKrRvi75KKtzUkgjUHWrrfaYffLfueL
X-Google-Smtp-Source: ABdhPJyh/O/l/hmeASCTUXqkfyiy9y9I9hjw/xEinrgZIlXVFxou+3t5RefQj7UbiDLsd17zTFz7TRjpgDr4EEdyQQc/f1Il9Y++
MIME-Version: 1.0
X-Received: by 2002:a5d:8245:: with SMTP id n5mr10283207ioo.149.1602280508394;
 Fri, 09 Oct 2020 14:55:08 -0700 (PDT)
Date:   Fri, 09 Oct 2020 14:55:08 -0700
In-Reply-To: <20201009185548.GA546075@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000088939405b1440053@google.com>
Subject: Re: WARNING in hif_usb_send/usb_submit_urb
From:   syzbot <syzbot+f5378bcf0f0cab45c1c6@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, ath9k-devel@qca.qualcomm.com,
        eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, oneukum@suse.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/net/wireless/ath/ath9k/hif_usb.c:1319:7: error: implicit declaration of function 'usb_find_bulk_in'; did you mean 'usb_fill_bulk_urb'? [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath9k/hif_usb.c:1319:24: error: implicit declaration of function 'endpoint' [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath9k/hif_usb.c:1321:7: error: implicit declaration of function 'usb_find_bulk_out'; did you mean 'usb_fill_bulk_urb'? [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath9k/hif_usb.c:1322:46: error: expected ')' before 'return'
drivers/net/wireless/ath/ath9k/hif_usb.c:1357:13: error: expected ')' before '}' token
drivers/net/wireless/ath/ath9k/hif_usb.c:1358:1: error: expected expression before '}' token


Tested on:

commit:         6c8cf369 usb: typec: Add QCOM PMIC typec detection driver
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
dashboard link: https://syzkaller.appspot.com/bug?extid=f5378bcf0f0cab45c1c6
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12e0fd84500000

