Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BB11CB8F1
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 22:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgEHU1p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 16:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727835AbgEHU1o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 16:27:44 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2D3C061A0C
        for <linux-usb@vger.kernel.org>; Fri,  8 May 2020 13:27:42 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t2so2437344lfc.3
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2020 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H7hdF+TXU+z5warwWctoW0ejNkNB5ByIm48BqwSmIjk=;
        b=c1OctmAOUzcC966xGv96Qy3CyvDsCLzmCpNDffti/u3sU9BbV7CH3jhpTMMnRsQSwy
         qE/7vlHukdClIs8gJ+/yOBckSTdPtUCHbNat27L/asSCI8yCf7TNIQSupXSEIYeLorKw
         /Oo84qo2i0jTtaDj0v2XbivFiJB6+KoTwVXotTxMXlfD/QZ/lcRieNieqTYO8Sz0SMLN
         JAnJJ2IcgwapNOrq+zSYmyyTuLqH2N6S4kuizaDqnXodQnpHnfzkH2zal8UrGUKy+Bjy
         5ghZtvqFRuR3nHSQdIXG/6t3ETIBTnzqmmvDbo44EGOtKhaLdt3s6v01G3WS+WduZRHZ
         lqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H7hdF+TXU+z5warwWctoW0ejNkNB5ByIm48BqwSmIjk=;
        b=Ry2w3u5bKdx4+j2N0Xh84zDHyldhed0f2/uli+Wxy+RM8u+nUZrPJuD5CO+csO8VAs
         nc7QiGQk0UKtVbBx11WrkRXq/nc9efYX/fHoWHdodlG8b4lmejSrnsbIII9/jP3V+9vc
         G4uSlgv4paTPwYL3fFblAXoOiuIjO0wpTzzCrhNvGeKxqgjza9G57sBrVztwnHdXGhxC
         bwLDuuAxU6o2HFqmHCRqWnkpfqttDaejw6R3H0lDPKTCqb3F8iFfLn7fhg83gZygaswC
         g5ziVjT7Rtly2FO/LCLGiH4cWE+uKMxbjIM3aO6rM3tEvTzNIYsR9VK3PVZV+XaBO+HG
         veBw==
X-Gm-Message-State: AOAM530rMaYl14jq+Lpf+/jxc30imkq31UCuCgLVC5RHvKu3Dm7k+Wld
        oseejCqTbhLi5GTKIiR9MBpV9+e0KFs=
X-Google-Smtp-Source: ABdhPJwhM6HSpwQmv/7uHamxME3MWQs8CZ24wPPZCd6IAhDGdZQI+53saRBbO43ShtN8OjAP4cmK9Q==
X-Received: by 2002:ac2:4304:: with SMTP id l4mr3074961lfh.87.1588969660574;
        Fri, 08 May 2020 13:27:40 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:222:bcfb:3767:1ed2:9bbb:4cab])
        by smtp.gmail.com with ESMTPSA id g22sm1950160ljl.17.2020.05.08.13.27.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 May 2020 13:27:39 -0700 (PDT)
Subject: Re: [PATCH] USB: host: ehci: Add error handlinginehci_mxc_drv_probe()
To:     Tang Bin <tangbin@cmss.chinamobile.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
References: <20200508114453.15436-1-tangbin@cmss.chinamobile.com>
 <20200508114858.GA4085349@kroah.com>
 <fb147bdf-faaa-8919-407e-89b4fe1337a6@cmss.chinamobile.com>
 <20200508143110.GA447591@kroah.com>
 <107353c0-09f2-858d-2a87-498e2d8584c6@cmss.chinamobile.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <66a6bbca-4218-fb71-7284-37f73d5a3c58@cogentembedded.com>
Date:   Fri, 8 May 2020 23:27:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <107353c0-09f2-858d-2a87-498e2d8584c6@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/08/2020 06:03 PM, Tang Bin wrote:

>>>> On Fri, May 08, 2020 at 07:44:53PM +0800, Tang Bin wrote:
>>>>> The function ehci_mxc_drv_probe() does not perform sufficient error
>>>>> checking after executing platform_get_irq(), thus fix it.
>>>>>
>>>>> Fixes: 7e8d5cd93fa ("USB: Add EHCI support for MX27 and MX31 based boards")
>>>>> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
>>>>> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
>>>>> ---
>>>>>    drivers/usb/host/ehci-mxc.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/usb/host/ehci-mxc.c b/drivers/usb/host/ehci-mxc.c
>>>>> index a1eb5ee77..a0b42ba59 100644
>>>>> --- a/drivers/usb/host/ehci-mxc.c
>>>>> +++ b/drivers/usb/host/ehci-mxc.c
>>>>> @@ -50,6 +50,8 @@ static int ehci_mxc_drv_probe(struct platform_device *pdev)
>>>>>        }
>>>>>        irq = platform_get_irq(pdev, 0);
>>>>> +    if (irq < 0)
>>>>> +        return irq;
>>>> <= ?
>>> In the file 'drivers/base/platform.c'， the function platform_get_irq() is
>>> explained and used as follows:
>>>
>>>       * Gets an IRQ for a platform device and prints an error message if
>>> finding the
>>>       * IRQ fails. Device drivers should check the return value for errors so
>>> as to
>>>       * not pass a negative integer value to the request_irq() APIs.
>>>       *
>>>       * Example:
>>>       *        int irq = platform_get_irq(pdev, 0);
>>>       *        if (irq < 0)
>>>       *            return irq;
>>>       *
>>>       * Return: IRQ number on success, negative error number on failure.
>>>
>>> And in my hardware experiment, even if I set the irq failed deliberately in
>>> the DTS, the returned value is negative instead of zero.
>> Please read the thread at
>>     https://lore.kernel.org/r/20200501224042.141366-1-helgaas%40kernel.org
>> for more details about this.
>>
> Great, It looks beautiful, finally someone took a knife to the file 'platform.c'.

   I thought I did that already couple years ago, when returned 0 from platform_get_irq() could mean both IRQ # and error... :-)

> 
> I have been studied this place for a long time, and don't know what platform can return 0, which made me curious.
> 
> So the example should be:
> 
>      *        int irq = platform_get_irq(pdev, 0);
>      *        if (irq <= 0)
>      *            return irq;

   And you then return 0 (success) as if your probe() succeeded. Congratulations! :-P

> 
> Thanks,
> 
> Tang Bin

MBR, Sergei
