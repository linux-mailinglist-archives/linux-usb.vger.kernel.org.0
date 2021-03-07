Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212DE330424
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 20:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbhCGTKR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 14:10:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27938 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232176AbhCGTJ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 14:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615144196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lxhqyhpWKd4HntcY0P0X8pW/C9gjTQZSoed4KkBPm6M=;
        b=YvFstHyHJKGt5DPaX5FXuUZX7LIDJgupsKxLBNu15IgcMnl1Zru3zcRAFJpaFJgb6+1aas
        JLZEvVJL4SzgsNXP+x+l5CSrpQDsc3uRhMsbVeSnMcMJr2+/XdLEI1/PgkUJL40wVjskdx
        yGNW+MlEwUwMJOHu43PU40nog61Iju0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-lxJFMkKbPnuPuGzhI3o21Q-1; Sun, 07 Mar 2021 14:09:54 -0500
X-MC-Unique: lxJFMkKbPnuPuGzhI3o21Q-1
Received: by mail-ej1-f72.google.com with SMTP id gn30so3170690ejc.3
        for <linux-usb@vger.kernel.org>; Sun, 07 Mar 2021 11:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lxhqyhpWKd4HntcY0P0X8pW/C9gjTQZSoed4KkBPm6M=;
        b=JdJWu48v+94+mBhwaXx5SOvHdFiIBgHXHDIpOMZv5poXeOstR6REJ7BeTrR+FAw1kv
         6+vPvEXHmxQby7lRJjpGYA5+G6CkWwfy82jcIV9J0i2zimdd2NtYAe5zLavisNeCLrAk
         749emeVZ5mS7mKjaefQ7xY4dRdwnV84mma6A5r02QdXOC3Wlf5HJyKKlfhpxZs+NCfPF
         EgwT6Y1bqs15IdtXgyDnj65F9Afh/4lWHP4Kq7fOPZq22aL562dHPMR69y3JiRxB00nI
         uk3OXCttvoXyDOczJ4sU8TwzQ8nRfDizD1YtsQQsSZX+CcJgHTw7yoXpPU88SGKENNeq
         mMSw==
X-Gm-Message-State: AOAM531TICQLqBR/8AOsCSg81d5+3bw6g51Q7h8fMx+JkieNB+rje/47
        bW/vPPXoKiNp/VrvBAj207USEfeM9o07zLz/K8pX6csI8jwIz4XmTRvCNLscIGIQs/eUOLOjjHh
        QOSX6liPLFazz+eGMlwdt4N+TLrPnOysdrfPGG1l3SRz7F7pGi4b+/o0J1JaQMlDGx8VNsjYI
X-Received: by 2002:a17:906:1a44:: with SMTP id j4mr11981365ejf.401.1615144193234;
        Sun, 07 Mar 2021 11:09:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylstBArNACK2dka6+ktKHgdVUqK27WM1dofTiH+vww+93lYZSkRJaHYAKRuyICu7W2vgTo5g==
X-Received: by 2002:a17:906:1a44:: with SMTP id j4mr11981357ejf.401.1615144193036;
        Sun, 07 Mar 2021 11:09:53 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a12sm5225290ejj.121.2021.03.07.11.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 11:09:52 -0800 (PST)
Subject: Re: [PATCH] Add unusal uas devices reported by Umbrel users
To:     Aaron Dewes <aaron.dewes@web.de>, Oliver Neukum <oliver@neukum.org>
Cc:     linux-usb@vger.kernel.org
References: <aaron.dewes@web.de> <20210307151830.38070-1-aaron.dewes@web.de>
 <a8c2e4b2-ef9b-2eef-d76f-1dd304bd49b4@redhat.com>
 <e67f26d5-7f10-a1c3-2721-70fb1ce242d1@web.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3ff73bb9-0d73-cb7c-d283-e9dbe56fd8e8@redhat.com>
Date:   Sun, 7 Mar 2021 20:09:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e67f26d5-7f10-a1c3-2721-70fb1ce242d1@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 3/7/21 5:03 PM, Aaron Dewes wrote:
> 
> Am 07.03.21 um 16:53 schrieb Hans de Goede:
>> Hi,
>>
>> First of all I'm not the maintainer of this file, to find the
>> right email address to submit patches to see:
>>
>>
>> [hans@x1 linux]$ scripts/get_maintainer.pl -f drivers/usb/storage/uas.c
>> Oliver Neukum <oneukum@suse.com> (maintainer:USB ATTACHED SCSI)
>> Alan Stern <stern@rowland.harvard.edu> (maintainer:USB MASS STORAGE DRIVER)
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
>> linux-usb@vger.kernel.org (open list:USB ATTACHED SCSI)
>> linux-scsi@vger.kernel.org (open list:USB ATTACHED SCSI)
>> usb-storage@lists.one-eyed-alien.net (open list:USB MASS STORAGE DRIVER)
>> linux-kernel@vger.kernel.org (open list)
> 
> Then the beginning of that file needs to be updated, because a comment
> at the beginning said:
> 
> 
> /*
>  * If you edit this file, please try to keep it sorted first by VendorID,
>  * then by ProductID.
>  *
>  * If you want to add an entry for this file, be sure to include the
>  * following information:
>  *      - a patch that adds the entry for your device, including your
>  *        email address right above the entry (plus maybe a brief
>  *        explanation of the reason for the entry),
>  *      - lsusb -v output for the device
>  * Send your submission to Hans de Goede <hdegoede@redhat.com>
>  * and don't forget to CC: the USB development list
> <linux-usb@vger.kernel.org>
>  */

Oh, good point, thank you for pointing that out.

So we either need to update the email address here, or just drop the
email address altogether, maybe include the:

scripts/get_maintainer.pl -f drivers/usb/storage/uas.c

Command in the comment instead.

Oliver, what would be your preference for fixing the comment to
no longer point to my email address ?

<snip>

>> At the top I indicated that you should split this in per
>> model patches, but that was before I figured out most of
>> these problems are beeing seen on Raspberry Pi-s (and likely
>> on Raspberry Pi-s only).
>>
>> What might be worth considering is disabling bulk-stream support
>> on the Pi-s XHCI controller by setting the  XHCI_BROKEN_STREAMS
>> flag in xhci->quirks for that controller.  This will disable UAS
>> at least when the drivers are plugged into the USB3 / superspeed
>> ports of the Pi.  This might still be a too big hammer though.
>> since with a powered-hub, or with a proper power-supply feeding
>> the Pi 4 (and not using the other ports) UAS might still work
>> and you are now taking away those options from users.
>>
>> But setting the XHCI_BROKEN_STREAMS flag on the Pi 4 and only
>> on the Pi 4 would definitely be closer to acceptable then disabling
>> UAS for, well everyone, because it is causing issues on the Pi.
>>
>> Regards,
>>
>> Hans
> 
> Okay, thanks for your feedback! I'll try to check if some of these
> drives have issues on PCs too and then only use that for a future patch.

Great, thank you. Please also be sure to add a link to forum-discussions /
a github issue in future commits.

Regards,

Hans

