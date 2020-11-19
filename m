Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F542B9441
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 15:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgKSOML convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 19 Nov 2020 09:12:11 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41976 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbgKSOML (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 09:12:11 -0500
Received: from mail-pl1-f198.google.com ([209.85.214.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1kfkfR-0007ja-6X
        for linux-usb@vger.kernel.org; Thu, 19 Nov 2020 14:12:09 +0000
Received: by mail-pl1-f198.google.com with SMTP id b4so3832903plr.15
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2020 06:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=nH0pepi68r8FQkDwjzYaJZuqslp2q+xa3wM3+4CcUNI=;
        b=I2N/TJd/Urk/KxTIcrMveSrmReWOUUwZfWqJqUcy/vWDAC2Q+DHqBi+KTceASbkeEF
         yczkbMNOdcsQxVX0FLDpQEYiLWE6luUkN46fg+zvndKpOY30VU3VcQA9xPBGqdz69oOW
         eqvaeKq4VFerYq82xokJKtXiZAZ7EaOrqIjc+c1PNpMiF3lpwvwVs9CYrT1dfm6952lV
         qf6x7sWq3R8y3GOlzxqLKgIsqUTw1EAzFGJugzkwjJTS0+P42pf18tTIKR6HvZVLrLNd
         bamtzrYxz7yaWRge/7jbmDz6DHDIoWROYaK5kKKRy3wrJ1DpoGFYUdZjsp9f9WJmyjxx
         3nAg==
X-Gm-Message-State: AOAM530A3XqNXjUWIOovkNEkyhS8EjxPrJd1qa3XgxamYuriiueWQvbi
        4Xcrwe+7BEoE1IDB9fmyX8nYntXcZU0tVo4xTfNsMEPIvOaKXhO4xERgecdHQv/MUq1fRFkUACB
        RcCHR6gQoEOoX2uTQdQh/6eSzoFWoB/ZHhu3Kuw==
X-Received: by 2002:a17:90a:e016:: with SMTP id u22mr4967122pjy.54.1605795127737;
        Thu, 19 Nov 2020 06:12:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEsbWks+/Io06NXTLDnwuTx+VBMU7rkmX3MvP7sWEMB/cXOSRBJavypU9mYkDvSJimUgBNCQ==
X-Received: by 2002:a17:90a:e016:: with SMTP id u22mr4967089pjy.54.1605795127353;
        Thu, 19 Nov 2020 06:12:07 -0800 (PST)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id v8sm3827347pju.32.2020.11.19.06.12.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 06:12:06 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH] USB: quirks: Add USB_QUIRK_DISCONNECT_SUSPEND quirk
 forLenovo A630Z TIO built-in usb-audio card
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <X7Z6RKu4T5IrhUFB@kroah.com>
Date:   Thu, 19 Nov 2020 22:12:02 +0800
Cc:     =?utf-8?B?5b2t5rWp?= <penghao@uniontech.com>,
        johan <johan@kernel.org>, jonathan <jonathan@jdcox.net>,
        tomasz <tomasz@meresinski.eu>,
        Hans de Goede <hdegoede@redhat.com>,
        dlaz <dlaz@chromium.org>,
        "richard.o.dodd" <richard.o.dodd@gmail.com>,
        kerneldev <kerneldev@karsmulder.nl>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <FB40A0E5-5E3C-4FC6-B690-02F9785EC7D5@canonical.com>
References: <20201118123039.11696-1-penghao@uniontech.com>
 <49219711-84BE-44FC-BBFE-DD8D609CA26D@canonical.com>
 <1892790617.185900.1605788248261.JavaMail.xmail@bj-wm-cp-6>
 <7D73C39C-C3E2-4C08-A773-3D7582A6AA7D@canonical.com>
 <X7Z6RKu4T5IrhUFB@kroah.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 19, 2020, at 21:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> On Thu, Nov 19, 2020 at 09:41:32PM +0800, Kai-Heng Feng wrote:
>> Hi penghao,
>> 
>>> On Nov 19, 2020, at 20:17, 彭浩 <penghao@uniontech.com> wrote:
>>> 
>>> root@uos-PC:/sys/bus/usb/devices/usb7# dmesg
>>> [ 0.000000] Linux version 4.19.0-6-amd64 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian 8.3.0-6)) #1 SMP Uos 4.19.67-11eagle (2020-03-21)
>> 
>> Thanks for the dmesg. But would it be possible to use mainline kernel enable dynamic debug?
>> 
>> But anyway, this is not a regular AMD or Intel platform, so I guess we can merge the quirk as is...
>> 
>> Kai-Heng
>> 
>>> [ 0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.19.0-6-amd64 root=UUID=e5a40c4f-d88e-4a4d-9414-a27892a31be7 ro splash console=ttyS0,115200n8 loglevel=7 DEEPIN_GFXMODE=0,1920x1080,1600x1200,1280x1024,1024x768
>>> [ 0.000000] Zhaoxin Linux Patch Version is V3.0.2 
>>> [ 0.000000] With Zhaoxin Shanghai CPU patch V2.0.0
> 
> What do you mean "not a regular"?  This is an x86-variant chip platform,
> but what does that have to do with the USB quirk detection?

USB quirk detection should work fine. I was trying to find the root cause, but seeing it's a Zhaoxin CPU, that could be the reason why mainline kernel, which has many USB power management fixes, wasn't used.

penghao, is it possible to boot mainline kernel on Zhaoxin CPU?

Kai-Heng

> 
> thanks,
> 
> greg k-h

