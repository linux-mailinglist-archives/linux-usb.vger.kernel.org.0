Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA3E61303B
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 07:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiJaGRy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 02:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJaGRx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 02:17:53 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C616406
        for <linux-usb@vger.kernel.org>; Sun, 30 Oct 2022 23:17:52 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 78so9845379pgb.13
        for <linux-usb@vger.kernel.org>; Sun, 30 Oct 2022 23:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEOAYYohevp1xVE9MSZmQl+jn6/lf/vFx3KFsUZRrsE=;
        b=AKgrB4FrK00sM6b6Ror7XgjTrkH7X9sf37UXi/u5KbqwCGBcwgTdpJAbOHE3iouK6l
         3Ok2HKmTRZlF9J8TEFeQ/xlZyTJuMxnec+9h8D+U2N6tpAufQJnfKZHIhUw4qestM1bC
         DLz9czOdV+f57KNo9JEXLMf4YQZkhB3FqtklbZaZxEKVinefM0jKlYUK0vzJmIGF1sTJ
         kSMJhVvTZ0hHizxynmaGHrVe0Ll9W97zPi/kd8+sg981aBc2JEliCfYlR6gvY2PjfDMK
         no9+UgkJ4r5GXtvDG99fyOhK3jqBZch1VZ+8u0pJ6oM4PFa10EWe9wdovDoW9LVYvRcI
         hFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEOAYYohevp1xVE9MSZmQl+jn6/lf/vFx3KFsUZRrsE=;
        b=WSPK2jPTDdkrnpQmnRp/5upi5GUl+TeZm4K+TTd2qpKsAd+spnZcavevHlnqXD/Tl+
         aC++MbIYCDEOYYYaocRCoadH2Dbl5ZC/YNJmQzkoOP49YJNZo+j3/0zXml7Ep79XUGYm
         ZjQJte4xoYLag//AZRrS8dWW7+PyYBmLBYleMP9ptHEVLpYW6qDrV5oZythIF7i+7BZO
         bu/iGIiyJ08QYjxH7S8DV7Ib7gTRgQ7ZzBGhbKZ6orQDWunwep9RaVqB/w0YkhavzsQd
         THhaXKFrdDU6kUKzN12qN5VbYYguMuw9CG54ZOElYdNgD7+LSz6y6iq27AnixaXJ4C0r
         zjtg==
X-Gm-Message-State: ACrzQf2Wm/rVy6vAWxomL7lB61K0pELmnRj2hAK2CWrM1BfsLSX3iwya
        qZMN7vTIIYB6VPoIJHNJV4Q=
X-Google-Smtp-Source: AMsMyM5gWdcQg2i4cLo0jLgz4w8BgZ563wr1OIL6kbxPVmJ8TT8MMxM4/uV7b/jcWQ05bI56kcKybA==
X-Received: by 2002:a63:3c7:0:b0:46e:acf4:6265 with SMTP id 190-20020a6303c7000000b0046eacf46265mr11089219pgd.369.1667197072037;
        Sun, 30 Oct 2022 23:17:52 -0700 (PDT)
Received: from [192.168.112.195] ([114.71.101.201])
        by smtp.gmail.com with ESMTPSA id c13-20020a63ea0d000000b0044ed37dbca8sm3387258pgi.2.2022.10.30.23.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Oct 2022 23:17:51 -0700 (PDT)
Message-ID: <fa0556e5-e154-a4e6-6b18-4996a01d2f10@gmail.com>
Date:   Mon, 31 Oct 2022 15:17:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
To:     Hongling Zeng <zenghongling@kylinos.cn>, stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        zhongling0719@126.com, gregkh@linuxfoundation.org
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
Content-Language: en-US
From:   Juhyung Park <qkrwngud825@gmail.com>
In-Reply-To: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm speaking from my own experience but RTL9210 is arguably the most 
reliable NVMe-to-USB converter available.

Compared to solutions from JMicron (multiple revisions) and ASMedia, 
RTL9210 gave the lowest power consumption (from implementing proper 
power management commands) and the least headache.

I personally own multiple enclosures and not one gave a single UAS error 
from multiple platforms (Android, Intel, AMD) for years, but with this 
commit now, it effectively disables UAS for all RTL9210 enclosures.

Would it be possible to apply this quirk only to a specific firmware 
(range)? RTL9210 have a lot of possible firmware combinations: 
https://www.station-drivers.com/index.php/en/component/remository/Drivers/Realtek/NVMe-USB-3.1/lang,en-gb/

RTL9210 was available since 2019 and the fact that this quirk came up 
this late leads me to believe that this is not a widespread issue and 
it'll be a shame if all of RTL9210s are blacklisted from UAS with Linux 
from now on :(

If any additional information is required, please let me know.

Thanks,

On 9/15/22 11:49, Hongling Zeng wrote:
> The UAS mode of Hiksemi USB_HDD is reported to fail to work on several
> platforms with the following error message, then after re-connecting the
> device will be offlined and not working at all.
> 
> [  592.518442][ 2] sd 8:0:0:0: [sda] tag#17 uas_eh_abort_handler 0 uas-tag 18
>                     inflight: CMD
> [  592.527575][ 2] sd 8:0:0:0: [sda] tag#17 CDB: Write(10) 2a 00 03 6f 88 00 00
>                     04 00 00
> [  592.536330][ 2] sd 8:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 1
>                     inflight: CMD
> [  592.545266][ 2] sd 8:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 07 44 1a 88 00
>                     00 08 00
> 
> These disks have a broken uas implementation, the tag field of the status
> iu-s is not set properly,so we need to fall-back to usb-storage.
> 
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Change for v1
>   - Change the email real name and the code worng place.
> 
> Change for v2
>   -Change spelling error.
> 
> Change for v3
>   -Add acked-by
> 
> Change for v4
>   -Fix version error
> 
> Change for v5
>   -change version
> 
> Change for v6
>   -Change the git message for patch 3
> ---
>   drivers/usb/storage/unusual_uas.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index a6bf87a..8a18d58 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -149,6 +149,13 @@ UNUSUAL_DEV(0x0bc2, 0xab2a, 0x0000, 0x9999,
>   		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>   		US_FL_NO_ATA_1X),
>   
> +/* Reported-by: Hongling Zeng <zenghongling@kylinos.cn> */
> +UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
> +		"Hiksemi",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>   /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>   UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>   		"Initio Corporation",
