Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0807C46E86C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 13:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhLIM3o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 07:29:44 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:55882 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhLIM3m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 07:29:42 -0500
Received: by mail-io1-f72.google.com with SMTP id y74-20020a6bc84d000000b005e700290338so6746030iof.22
        for <linux-usb@vger.kernel.org>; Thu, 09 Dec 2021 04:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=gvM8w3IykPq7/YrG3VY9dYm48Si3t8brH+kVWIJeskM=;
        b=f9Hl1Owegp4sLNakdSHZOvFFEdW+AcDdMJmFSi3Dbj4Hf2oSlHLFd9Jc45CUuoQx4E
         8U8Ooc/MctnsSPOPSBMFF6hQRMQF9gzQp26sDnjpRT+QGDntSfSGbfWAH+r15sckq3+s
         RWEmC9BI5j0crCjzkb/Db4cYMgdE4ywFRIRAuS/dPQs28paVSQoWupCWx/hSmEpEI3Nx
         q2YbhRgnwuSFP88sjS/OfvsTIPDofvlnG9O2ggQ5EU+oXsEWL8lNkOzWyZr9IKyPGazD
         NXifXvbvAdzsEqA0O/SxY5Y2kGbUzHOxrLT5xlmSkxIYc3hT4LfByVdDAY6RHCpHd0Rh
         4JOg==
X-Gm-Message-State: AOAM530hQq8Fxu0KKK5PwJjmwZAjEil+XcWeCNpQAwGyG9umAmkrgQV5
        JN5yF6LIWMBKCZFJ7dG2C/J/K4ICh0Wb833gX9lmkMXj3qdN
X-Google-Smtp-Source: ABdhPJxe9mTYFZqU3p6Pp9GlnqQyBqgVplDJcJoJhySVsNh8W5K3hAPdPPYle7Spm6l+obNHpx85ua4up4ruBQsKDmh1uWV4AWOZ
MIME-Version: 1.0
X-Received: by 2002:a6b:7006:: with SMTP id l6mr13642369ioc.5.1639052768625;
 Thu, 09 Dec 2021 04:26:08 -0800 (PST)
Date:   Thu, 09 Dec 2021 04:26:08 -0800
In-Reply-To: <291da1b9-9f71-0f99-45f4-a25a259c8d6d@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000ac61705d2b5b617@google.com>
Subject: Re: [syzbot] WARNING in usbnet_start_xmit/usb_submit_urb
From:   syzbot <syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com>
To:     kuba@kernel.org, linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com

Tested on:

commit:         048ff862 Merge tag 'usb-5.16-rc1' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6b387bc5d3e50f3
dashboard link: https://syzkaller.appspot.com/bug?extid=63ee658b9a100ffadbe2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15103a51b00000

Note: testing is done by a robot and is best-effort only.
