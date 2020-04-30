Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8431BFFF5
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 17:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgD3PSG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 11:18:06 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:42554 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgD3PSE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 11:18:04 -0400
Received: by mail-io1-f69.google.com with SMTP id d188so1614328iof.9
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 08:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=JGTxr3NuYyzFEHaxhGOpPcWadTbEs1hwXtwC8XsL+zs=;
        b=ne4Hy8bZybIWFaGlplBJnNnsNSF0tea+B0F+2ovaHreM8UvCuMqcs3NuFFIvCt5rP8
         XL8OZOVZXGB9EJx5k5csrTr7j3CZzdAwEJL/a1Z+jbOwF0/74jPZZbDahNcrwv4ccH0m
         TqQfxF7G8Gk7FsgRJQ0iYJZpDr84RLX6PsJwuC9CsLmINuWLnGQN4vYgOFkOVHirRDIQ
         bH5giJU7i0LsYJJEGBP9YsOg+mA7Ax8lX26OF2dFOlqv8hkv5o44Kq60r+ff4VR8AjQM
         MeI2VtsYS1zr0dw9NB29ZxpO28/CQIrs58W2OQez0tJW24ww4tI461quu1PYTN4g4EMl
         kILA==
X-Gm-Message-State: AGi0PuZl8iWAgJd9VvPW052eP4ir4EW02TOXVF1zMpfqjGU6D0IbXkB+
        sJHHVMj5qng2kVOH/udqLNZwdFjIb4SkoMpUQt8ZTJl57Wk5
X-Google-Smtp-Source: APiQypJ+2GdMiIan64zRsaTvA84Vhh2H4TpONP2u/LUFqggYTEpvImz55Foa0keMm8tyXX+LkAktBx/3cQ7tSVMFxKaPILiPBKsg
MIME-Version: 1.0
X-Received: by 2002:a6b:8b05:: with SMTP id n5mr2391220iod.68.1588259883479;
 Thu, 30 Apr 2020 08:18:03 -0700 (PDT)
Date:   Thu, 30 Apr 2020 08:18:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004301050190.27217-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002a7b2905a4839206@google.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
From:   syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12a35540100000

Note: testing is done by a robot and is best-effort only.
