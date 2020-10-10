Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C20289D02
	for <lists+linux-usb@lfdr.de>; Sat, 10 Oct 2020 03:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729362AbgJJBVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Oct 2020 21:21:32 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:53816 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729246AbgJJBF3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Oct 2020 21:05:29 -0400
Received: by mail-io1-f70.google.com with SMTP id m23so6804433ioj.20
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2020 18:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=DDEseMxMpm+8pa9N0R0ZiF/fCUt6kdwa1OOWpeK33r0=;
        b=b3dKUtMX6zagGYrh1rxmfobvctY7aWxFQzvpTdCwQdpiljm0W0NW3nGGsOmq8ol2Jd
         twQ1HN6IqA95qcwV2HXm8Di1WzizluIyRzyLjqPrxpayB/Bz48HpshM/e9FB4FPCI1O5
         jeFbv5sU/dwn8y5ogsLDlkn3yQO9NZHDIq429HBtZ3rA/DNxPdt9JmHyfdz5Czukg+CN
         KIV1U8pAcdTYMCRo6Yjcw9GV8KbPqEbeOnMAGdAQR1rqMXWX5DOfa7BQ3KPXUq5kKUG4
         QMixhHcd6tzPDcvNiVLdVwWYR6WWkPTvln9nWJorqa8/8Ks5/54cH5/YcUeim7/t4eC3
         1ByQ==
X-Gm-Message-State: AOAM533BF6TNEYkLcj2pv53JKmiL426hx6uz9Pqpwk8LclakThvpZkGp
        WrxWLd4KajtJ4fdP9HF4QPvhtV7HSy0TQfKxiFdQRM8V9VlK
X-Google-Smtp-Source: ABdhPJwpfQNcKTazaWHy8QlWB9Y2DbphQW9rWJEsyRGOF2rnSosmcJqpeOxXfurwX5byo3kvylWCHJvvHUPE+AYPC4qGeVPsiN8a
MIME-Version: 1.0
X-Received: by 2002:a92:360d:: with SMTP id d13mr10658529ila.99.1602291369987;
 Fri, 09 Oct 2020 17:56:09 -0700 (PDT)
Date:   Fri, 09 Oct 2020 17:56:09 -0700
In-Reply-To: <20201010004944.GB557008@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ef564605b1468771@google.com>
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

commit:         549738f1 Linux 5.9-rc8
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git v5.9-rc8
dashboard link: https://syzkaller.appspot.com/bug?extid=f5378bcf0f0cab45c1c6
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1200b51b900000

