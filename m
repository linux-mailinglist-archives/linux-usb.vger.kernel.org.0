Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 422D184E53
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 16:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbfHGONB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 10:13:01 -0400
Received: from mail-ot1-f69.google.com ([209.85.210.69]:34208 "EHLO
        mail-ot1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbfHGONB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 10:13:01 -0400
Received: by mail-ot1-f69.google.com with SMTP id 20so11533210oty.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 07:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+rvcyyJPT124CBjh50veSjwzTuKPjdB1gn6DdCRD4GQ=;
        b=UUQqkIck1/W485WYsTZgpcRhItzvrOi0tDo8E6R1iLDEWxYgY2RBkqrwCKnNY0DqLN
         01PLyBAzP69M2rz118sdWvkuulPFqnq4PxKIQ3DOwDl3PpLWCRcMllMmvON5ceFPS/wK
         Den7Mjz/a26xr1w4nAvWxQpdZ4w3dusySV5t4V/jmBTlQRRcB5AcZ5LTjQ1eKbNt8+Fa
         693tiASHwSUS7+G0nC56D0gGRN/lUFFxy7SHPDxHxTuiq4l8HTWQ9IvfQVtXQrwDp2Rp
         B07SaQRQOv3fPBCswdvMfggs0yNuSdihCIEWILQsoeXQBBEzOYxmnPy8ha2Ua5TjFeEH
         98gg==
X-Gm-Message-State: APjAAAUFRKKzOuIg5Uh3vNADKWdjSDzLYkvY49Cqi64RftuU1TyjKl9V
        KqxF9J7GuwJmbryMzIAFMl+ZUDdaqyGSxqi+pu0WHouZ699l
X-Google-Smtp-Source: APXvYqydE+glsz2eL+FR6jE4ph1gTugBhAbEDDTDWgMZ8T6Wk5OyXx0b7GUWhjNN5KDpAYSMImNZ4sWO1khxy6jFYxnVm6NB2sNM
MIME-Version: 1.0
X-Received: by 2002:a6b:621a:: with SMTP id f26mr8317090iog.127.1565187180660;
 Wed, 07 Aug 2019 07:13:00 -0700 (PDT)
Date:   Wed, 07 Aug 2019 07:13:00 -0700
In-Reply-To: <CAAeHK+wV_w6f=zG4XSJkDRhR6b0aNPH0UTkBF3hmRQ6wxy9p2w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e90d40058f8789e1@google.com>
Subject: Re: KASAN: use-after-free Read in device_release_driver_internal
From:   syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1245683c600000

Note: testing is done by a robot and is best-effort only.
