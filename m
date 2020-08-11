Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49F4241F0E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 19:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgHKRTF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 13:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729116AbgHKRTE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 13:19:04 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6464BC06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 10:19:04 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id g6so14357161ljn.11
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=VgfZ0yf0u6CPD7GngLkF0ERtij6py9wcrO05kR7rTbQ=;
        b=alUp2lexe58zyCe7TMSrKVOWmMFeWK/Ybe7kkzT1Gpga6lkvp4rJZpmMAWntfeA2L7
         LR7sH33M4t6WWtt8Ehdjpqj3fvsp969gIWiBnxPkWl00lyiAD+Yw+2x3mQ2YuaiZZ+7d
         OIsdnD745u2oraD5D/ylSt3UwjItOAh1RCmVWWTCsefc2kehvPMXZQGOxeE1X1OtbHme
         wMZpnmF9Ae/sgA2iwxV2x9xyJBj75S6CGay3BQCv4gT2uR2iGy2OZOjdHfJItG19YEdx
         H9TfR0SOoW1bZZxC5Ww9jiR0Yla+3feperxslmTdCf4S3y42a9KYDsUQ2dW4fwNVRwJO
         4Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=VgfZ0yf0u6CPD7GngLkF0ERtij6py9wcrO05kR7rTbQ=;
        b=NJqw902MJ7X9+fWClKjVaFU5PKXX9wcevptcxwEFTBG5wg6OLAK6to6ihZKz0RDpUR
         bpBmADOCtldUTaBmmcYHUxGyjHSu8DXeBYu4fzbWIf667sOvTrNNdaulSsNoQFiQXucI
         iTxt0dBm5wWpjhraf+lgZaxMndc3zBvio12BmoQ8OLwjCKZq+FsIPx08rPjTKXy3Z3PF
         wdfSPFLmROFtKRsHwPqIuF6jYavjnbC7pEYdfiyfV6pf1noKBltZZ1FqS8g0ySWOW56m
         Mlm30OslDALcmZWFIJLIeQOqucQzzRCKE2VI2ceIeZd6A60Vpn0QMszUeWGBS0QqV8lK
         uHXg==
X-Gm-Message-State: AOAM532ETQiGonGmL+AD3j3fmQn0MdavYVfmOXa7vnaETYmlp3ZNqn36
        tvdtcAMhjs9GxWIIb1X3fE4=
X-Google-Smtp-Source: ABdhPJwlLDywVrOB3Vqt2dOQFhVqc2nayXUPNuTvi3jVy5ByQDi4rGz43A5o/0r2NAJrO8KpHQuZpA==
X-Received: by 2002:a2e:8145:: with SMTP id t5mr3345940ljg.398.1597166342415;
        Tue, 11 Aug 2020 10:19:02 -0700 (PDT)
Received: from [10.10.0.8] ([185.213.154.162])
        by smtp.googlemail.com with ESMTPSA id j17sm11788593lfr.32.2020.08.11.10.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 10:19:01 -0700 (PDT)
From:   Patrik Nilsson <nipatriknilsson@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: high speed data to usb disk makes the kernel think that is has been
 unmounted
Message-ID: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
Date:   Tue, 11 Aug 2020 19:19:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

I have an issue with a usb to sata adapter when much high speed data is 
sent. If I erase my 4Tb SSD disk connected to the usb to sata interface 
with a "slower" /dev/urandom it works, but if I exchanges this to 
/dev/zero the disk is after a while disconnected.

For logs from udev and more debug attempts see: 
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1886172

Description:

When the speed of data with a usb disk device is too high, the probes 
that check if the disk still exists is missed. This makes the disk to be 
unmounted and is remounted with an other drive letter (/dev/sdX). If 
this disk is the root ("/"), the computer hangs.

A usb SSD-disk (4 TB) connected to a USB port reproduce this bug easily. 
This has never happened with a mechanical USB-drive.

Symptoms and how to reproduce:

1) (Disk mounted as root) Computer hangs. Only way to get started again 
is a hard reset.

2) (Erasing disk, not mounted as root) If you erase a disk with dd ("dd 
if=/dev/zero of=/dev/sdX"), the disk disappears from the mounted list 
and reappears as an other drive letter. In my case the data is 
redirected to /dev/null and the fans speed up. The apparent data 
transfer speed is also increased. Usually this happens after about 45 to 
60 minutes.

3) Fill RAM with programs and make sure the swap to this disk is used.

Bug found in:

$ uname -a
Linux pb-189b1884 5.4.0-40-generic #44-Ubuntu SMP Tue Jun 23 00:01:04 
UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

$ cat /proc/version_signature
Ubuntu 5.4.0-40.44-generic 5.4.44

Hardware:

Tested with slower and faster computers. Tested directly connected to a 
computer and via a hub. They all reproduce this bug.

Workaround:

None found.

Best regards,
Patrik
