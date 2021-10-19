Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114254330FB
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 10:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhJSI0Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 04:26:24 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:57215 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbhJSI0X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 04:26:23 -0400
Received: by mail-io1-f70.google.com with SMTP id d7-20020a056602228700b005ddba37de42so12659904iod.23
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 01:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=6W80Ea/xPGSCAMfuK5dcuPBivclSSvzM+U5pUl++MiE=;
        b=tX0HVFJJA7YgsZlzrI/XCMSN0MeMvfkgx6isns+zhJtHsmQ11bVAZgpYhAM6lMOTKm
         +vbxUMlu7ejV+Q7MQe522nMX+ch9EZxNNpDqkkj4O/zIrvalQnIL2E/y+qUnhwSUeB5N
         nUqRVX9RMcPV1vfKoM0MsGyO5I4fN9EO14jo0An8jW/XdAlOGoYFIUXh7l/EXbescDJt
         LoL9FLxYRuVVKjifPPRq7CopIqi21vL3B/+s3L8ZOvTn6gq/pZ8l8MKzX5Psv9zazx4H
         kebX3CeVSPd/lBuqLFFxcV2CSM3Ai6nnUYJ7FNvO/MiypEnxl1BZJ/bCjgG46oLgmB8e
         hvQw==
X-Gm-Message-State: AOAM531sUXzTYGhyMePnaeifcTiPMvvpXDonyFtNaQv40CiL5lgnbWOX
        W7OLhDGlMTHF3I/Jg3ve6QRur4cncYDLtZFLVa5YsVsP8JSB
X-Google-Smtp-Source: ABdhPJwTWw7CirGaDkx43so3ouzOe1EA6jOJe4S6hO3mcpQ+BQRZ+SUutV2pg/tqViZW+8JikQFCB9sB0I+HV5rjmZSY8B3qmJh4
MIME-Version: 1.0
X-Received: by 2002:a5e:9612:: with SMTP id a18mr17350653ioq.57.1634631851240;
 Tue, 19 Oct 2021 01:24:11 -0700 (PDT)
Date:   Tue, 19 Oct 2021 01:24:11 -0700
In-Reply-To: <c5a75b9b-bc2b-2bd8-f57c-833e6ca4c192@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d4f64205ceb06259@google.com>
Subject: Re: [syzbot] divide error in usbnet_start_xmit
From:   syzbot <syzbot+76bb1d34ffa0adc03baa@syzkaller.appspotmail.com>
To:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/net/usb/usbnet.c
patch: **** unexpected end of file in patch



Tested on:

commit:         c03fb16b Merge 5.15-rc6 into usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
dashboard link: https://syzkaller.appspot.com/bug?extid=76bb1d34ffa0adc03baa
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1149aaf0b00000

