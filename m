Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A308815FC4
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 10:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbfEGIvf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 04:51:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41061 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfEGIvf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 04:51:35 -0400
Received: by mail-lf1-f65.google.com with SMTP id d8so11200833lfb.8
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2019 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=1oO+GoEa80ATuktgmYxw8ffH+VMlPh9efAotfRkx3Uk=;
        b=afklHC79I2SQujPIQn65dmhOOCkVRy/ZiKumep7s3Cl1rhy3bU3qKUrIyytyMsxw7S
         af1TD5lW9qlcob/30Axv2B0QhrWCyRitEUnNEV6Ey1XnZ2GhAIlAWqLlxNRqNQwPJ4yZ
         HLU9P9QEvwWWBV5S+YtgvQEuq+gBx22kPPmwARbvIx9p3kjfE+zfvDPLvv0dEK6NRrQc
         XqrfYFwpaTQm7jnwjyzqsCmRLR9gF88KTS4Fu5YU3YI9ydWUburIFZxkKnmeqqcTN0xu
         R0wjFDYKhuo3HIFkg+TZ/XNjHLigeWVsAM2MMjXlsm75TAjBCTWrOs04I5Ut2U3huKiL
         0r0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1oO+GoEa80ATuktgmYxw8ffH+VMlPh9efAotfRkx3Uk=;
        b=VkTw376pZn6t9RRkNF9bUP07sW663jRnyL4PI+oSzZC0btrBkulDVDT3FAtoocMjHK
         D2w/DcBLBcOX+T1fmTKtogbjQt1rA1zVg76OlDOOZ2wOqX0hlgC3LOofkVRuxOdfwsYW
         d1LHmXeWkOm2EqRtzhJJKxj0KHjYr2Ufgnz12yPlMoCJCmYSIVJO8udFmFe8VIJ0+Ubt
         5W6i1+NLYiiFXRSuHQOPrl8rdu8CeJipUrN4AkZAc8iNnLfYwaY2vVOf/3nGdpw6F0rj
         /+/xhHLTBNIG/sPQbM0nTtIEobH9G/6ugoohY9mlWEBW8FlayGpceElE+tkJ8xMq3wlH
         ofqQ==
X-Gm-Message-State: APjAAAUXA4KK4JE/6rp20I0tBNSJW2pw9d2VUciQQQhct+nbJzovg/NT
        51suzH2clFwoAoC8EUZ5lSoBoCNhwFM=
X-Google-Smtp-Source: APXvYqxbRUWV1upGeuKWhdBS06gkgWghoPD1GhnpDKT3cCGxxq5rCabbRKj5IejhXb35pRvDHR1rqw==
X-Received: by 2002:a19:520e:: with SMTP id m14mr16459481lfb.65.1557219093090;
        Tue, 07 May 2019 01:51:33 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.80.92])
        by smtp.gmail.com with ESMTPSA id g66sm2290957lje.88.2019.05.07.01.51.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 01:51:32 -0700 (PDT)
Subject: Re: [PATCHv2 4/4] USB: rio500: update Documentation
To:     Oliver Neukum <oneukum@suse.com>, gregKH@linuxfoundation.org,
        miquel@df.uba.ar, linux-usb@vger.kernel.org
References: <20190507073837.19234-1-oneukum@suse.com>
 <20190507073837.19234-4-oneukum@suse.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cc1cf024-b13c-aef1-eadc-9fad8825e2ee@cogentembedded.com>
Date:   Tue, 7 May 2019 11:51:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507073837.19234-4-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07.05.2019 10:38, Oliver Neukum wrote:

> Added the newly added limit and updated the text a bit
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   Documentation/usb/rio.txt | 54 +++++++++++++----------------------------------
>   1 file changed, 15 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/usb/rio.txt b/Documentation/usb/rio.txt
> index ca9adcf56355..63adb030e0e9 100644
> --- a/Documentation/usb/rio.txt
> +++ b/Documentation/usb/rio.txt
> @@ -76,54 +76,25 @@ Additional Information and userspace tools
[...]
> -Add a device for the USB rio500::
> +Udev should automatically create a device node as soon as plug in your device.
> +If that fails, you can manually add a device for the USB rio500::
>   
>     mknod /dev/usb/rio500 c 180 64
>   
> -Set appropriate permissions for /dev/usb/rio500 (don't forget about
> +In that case,

    Strange formatting...

> +set appropriate permissions for /dev/usb/rio500 (don't forget about
>   group and world permissions).  Both read and write permissions are
>   required for proper operation.
>   
> -Load the appropriate modules (if compiled as modules):
> +Load the appropriate modules (if ddcompiled as modules):

    ddcompiled? :-)

[...]

MBR, Sergei
