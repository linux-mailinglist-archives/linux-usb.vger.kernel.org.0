Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5EAB1B486B
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 17:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDVPVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 11:21:05 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:46522 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgDVPVE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 11:21:04 -0400
Received: by mail-il1-f199.google.com with SMTP id g17so2221094iln.13
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 08:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=pz5CUTnf5j/KbXtN31blRs8hszDPf+GoywqGxmL0NSU=;
        b=sDPeqhDhzPhTfTuqm3+hTQpEHMB+mnG8rJmTa/LBNEMYe4HR8IWkL5L/iyVU4WcDaD
         RkLrKL/bgalznhsCq4UzpY/ub6Vc06h+2Xud9uhcuXPsGwiMieDWTGSX3IFVJg9bfXm2
         TTO2pnzbhwn74NfJ91OE3ZsJByBuhRz/i1t8t6SR4DFp/mpPqljRy5yayaYVKLwkz5rA
         Jr8hoWdSJWe/cFiyJRdDEbj2pxFJT1nmm3Mp95S1mKV1NZ0KHAIRL9UBJg2qs7hLMaN8
         ewGfXHNeHvGZIYYHeAwT4jZfslVnV+YXC/XaAyguEUyPi0pZWyLdaq3e4RV2KyJtOJVG
         9v4A==
X-Gm-Message-State: AGi0PuZI4dMOLD1S3DQJk4WCV+RA9sIG00905bdSeix7bAOURq+QR6i6
        5XCDW5drevQl7coDs55c6WESdmJ7nDNdmZTfUer4k6ZKvgDo
X-Google-Smtp-Source: APiQypLGfxG+wShvFp6rdfNRJ1n5KuK6e6eGMdujQtoUfdCunfXWlEVxafiQDoC6rEC+Ti0UWFJk3U/4qIqvqPZ78ZYBhiQaXDeB
MIME-Version: 1.0
X-Received: by 2002:a92:d149:: with SMTP id t9mr17233217ilg.213.1587568863606;
 Wed, 22 Apr 2020 08:21:03 -0700 (PDT)
Date:   Wed, 22 Apr 2020 08:21:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004221058240.20574-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002bfce805a3e2aec4@google.com>
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
From:   syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        hdegoede@redhat.com, ingrassia@epigenesys.com, jikos@kernel.org,
        julian@cipht.net, killertofu@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, pingc@wacom.com, pinglinux@gmail.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=7bf5a7b0f0a1f9446f4c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14f40acfe00000

Note: testing is done by a robot and is best-effort only.
