Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65F219E087
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2020 23:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgDCVtI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Apr 2020 17:49:08 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:54105 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728459AbgDCVtF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Apr 2020 17:49:05 -0400
Received: by mail-io1-f70.google.com with SMTP id f6so7342531ioc.20
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2020 14:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=zSI07CjR5IyEH+/NIlKzkOBeWdFhLCDjSvm8dcjjF9E=;
        b=a67IEFnm6WcNhFCxq7OBvw1X+1H/0zT+J8Rjn5wTSL3Yty0+7SqHAbsMmKZ5Qyq+oR
         YPq1GAT3RZv7AJ3TKzpYmcXKr3xgfMw7rXdNaCt8qymxPDpijbZeBxqlH7WqkCDzb4Ud
         MMiE5GW7CWZwmt2BKp4MNtI6fve2XXgn2mDEIepCM7E/2T0Aamzgowe5otPhYcYGozKn
         8jng3KZ5pJF85e1hnMsJUBfuWejMTmldWL0UuQmAGufkx4TZvblmjxYW1e3/B+PLNovh
         iiu/EiTqAsCX6QJU2CLNWuLsGd0V4BImv+y7bQdkiWMu+8OWe64E0LAkHgyX1KyToXnK
         UiZA==
X-Gm-Message-State: AGi0PubkBLIrUufSRfaYaVWb9qzYA4vtbo0IShmRlFLrcq5s3Pg7w2CL
        99RZncH1Qnl417DJfI9nfUlpQaqQnAdfcGIGGFs8/tBSRERd
X-Google-Smtp-Source: APiQypIjGi0Wfgk0b25qP452rAzQr3GjIWACeIBF++/I8dzYGRRklPvqHEKztUVWk9BfQ+s9cnDjHNsygkQrmfW6PoH9mK/E1CNX
MIME-Version: 1.0
X-Received: by 2002:a02:2b11:: with SMTP id h17mr10019717jaa.140.1585950543555;
 Fri, 03 Apr 2020 14:49:03 -0700 (PDT)
Date:   Fri, 03 Apr 2020 14:49:03 -0700
In-Reply-To: <CADG63jDvVnX=_5oJSEqrsTUsCuYPj6Grz9dEFLvWpa1F=oa1Lw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7b02e05a269e206@google.com>
Subject: Re: KASAN: use-after-free Write in ath9k_htc_rx_msg
From:   syzbot <syzbot+b1c61e5f11be5782f192@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, anenbupt@gmail.com,
        ath9k-devel@qca.qualcomm.com, davem@davemloft.net,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+b1c61e5f11be5782f192@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=a782c087b1f425c6
dashboard link: https://syzkaller.appspot.com/bug?extid=b1c61e5f11be5782f192
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11981b1fe00000

Note: testing is done by a robot and is best-effort only.
