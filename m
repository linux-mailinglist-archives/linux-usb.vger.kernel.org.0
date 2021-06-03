Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1B139981F
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 04:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhFCCrK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 22:47:10 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:51093 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhFCCrJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Jun 2021 22:47:09 -0400
Received: by mail-io1-f70.google.com with SMTP id x4-20020a5eda040000b02904a91aa10037so1148559ioj.17
        for <linux-usb@vger.kernel.org>; Wed, 02 Jun 2021 19:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=ApMQDmGQkKT7GkEymXmgaE7kBnSogu7j0xRuPLe2PWA=;
        b=HkeA1xZvw/FDBPlmefU9wE/seMxokML/DSlqAAUcLKxOZQ2pRNGShYTXQENT+1Ma2i
         bj+XGtygCRJC7E0Sp4Y3sAzhY6zmw+8DZ1fPNIJ6D7NQ94j9wTU74e18n38V71UuQXfH
         AxJP0+xksRnZ++z7NOZqDdokEAI0xVRuTVyFHibsh1vGk2sPAmxuiBMpvOzLosNARB2A
         eVTD2dX3gp7RDBhclIe9PgX6o5Xos5U41kYF8yxGAo03QrYi87/K8LVni0j68Pb3gX+c
         wfUTWtBbg9wcXk4gL1FBzwNLjL+OaKcYhM18Ffc/xQMHBbfWHvBNR0DPFZwiklmpUboP
         RHXQ==
X-Gm-Message-State: AOAM531JamXYCHlv3jOKXqZM2fzeLUX1XvGvO72oAtwRfk5HysX5n7X5
        qHkIEG1CzpAdpzlF30vZ+ukGBtIWsfYOGKaFgyKFVaeAjZtn
X-Google-Smtp-Source: ABdhPJxsmq1+jekt8klgHe+R2roNQ7wa4wvkbS3LciN5Y39ofgLr+0Sy0U54UqtS22qDasKxwvEimJ3+VaVZg1vqV8AafXaKedC0
MIME-Version: 1.0
X-Received: by 2002:a02:a887:: with SMTP id l7mr12826068jam.16.1622688312609;
 Wed, 02 Jun 2021 19:45:12 -0700 (PDT)
Date:   Wed, 02 Jun 2021 19:45:12 -0700
In-Reply-To: <20210603014354.GA1626048@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007450cd05c3d3905d@google.com>
Subject: Re: [syzbot] WARNING in usb_new_device/usb_submit_urb
From:   syzbot <syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+7dbcd9ff34dc4ed45240@syzkaller.appspotmail.com

Tested on:

commit:         7652dd2c USB: core: Check buffer length matches wLength fo..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=363bc9f1c74dc789
dashboard link: https://syzkaller.appspot.com/bug?extid=7dbcd9ff34dc4ed45240
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1091bcdbd00000

Note: testing is done by a robot and is best-effort only.
