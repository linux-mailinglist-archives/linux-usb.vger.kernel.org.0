Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626D01D2AF1
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 11:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgENJIG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 05:08:06 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:38553 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgENJIG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 05:08:06 -0400
Received: by mail-il1-f199.google.com with SMTP id u11so2586402ilg.5
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 02:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=t+L8A9JFXmMTj8UgdC85xQfnigFPoelWUd0rvBKXTDk=;
        b=EG1hc7H2l5g7l1LQ8L4B1SuA+MvhJrtfGVjMqKbEo2rJtSkonKoLE81Dkw9jvZzIeO
         daXeaRTcElUlHctKZdfZCQVvcJ/IZad02Rzz70S0PnzEcBnq5NH1fcQNOTSwDGYFV/yC
         pGRBvaJzveu2TYy5aO/YX+AgkD9DqHnmRLU1zjGgsgXECsCiqnKnHNRy6G28w960MXQt
         9h//E44P9fJwuibJijR+33TKmsaKdTzI2Bkzm2QyWPOhS/yYl9q3qI+wDdasIBwAsKzP
         y8DfLkbxyrafmesOUngYPaBq/p7kXrAfk57jivgAatnE5XPRGiLhxVyXCXYEXiyyjuXz
         IctQ==
X-Gm-Message-State: AOAM531cvd18JF3U6geLjG7hgZANAgp9r2MlX6yQ3XrLCppOGiiTSFHH
        f306AMIZG/V/7YwHahUky9n34kxdIGL2ATnx1jfJtcyZOjuj
X-Google-Smtp-Source: ABdhPJztFM85l7FEKdyZ95KpoEvXKV9e+4xvtKyOyNebdeGNlGG938KQev9qq9G6+CxhGhQzpbdQpbAnPZE7r3RtbN7V23bvCrD4
MIME-Version: 1.0
X-Received: by 2002:a92:3607:: with SMTP id d7mr3281292ila.222.1589447285459;
 Thu, 14 May 2020 02:08:05 -0700 (PDT)
Date:   Thu, 14 May 2020 02:08:05 -0700
In-Reply-To: <20200514035458.14760-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d6cf5705a5980874@google.com>
Subject: Re: WARNING in memtype_reserve
From:   syzbot <syzbot+353be47c9ce21b68b7ed@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, hch@lst.de, hdanton@sina.com,
        jeremy.linton@arm.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+353be47c9ce21b68b7ed@syzkaller.appspotmail.com

Tested on:

commit:         d5eeab8d Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=b0212dbee046bc1f
dashboard link: https://syzkaller.appspot.com/bug?extid=353be47c9ce21b68b7ed
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1046a052100000

Note: testing is done by a robot and is best-effort only.
