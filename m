Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485F93588C5
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 17:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhDHPo6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 11:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbhDHPo5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 11:44:57 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD84C061760
        for <linux-usb@vger.kernel.org>; Thu,  8 Apr 2021 08:44:46 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id d2so2158890ilm.10
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Qqyfbhw/igijjBx9qwx2eqeGu0V2rFpQ12Elk/Jq6fs=;
        b=XhY3EM03ogiW2DQ+wB90ULO07+wmEwGxGqsEWm5Jo+FD7FepxLCopsT7ps0WWm6v/m
         YowyTnimlV5OswyEdz9z+gvU+fiZdSnhHUfa/ru53GCA7IyU/Zws4WzAAB2cX8I180m2
         bPa+zxspJXECYQxCuoqUhFuYv0+4J/+2TX79I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qqyfbhw/igijjBx9qwx2eqeGu0V2rFpQ12Elk/Jq6fs=;
        b=Vmk9KtzmEIrSI4Ca68OGmRJaKW9FfeYi1QnvSbe3G7PvnhL0ivZCfTsaapFa4UVC/v
         uFPGBzPhmtMxwT5rF6Ju8rqed74j7m/NQwhsFcTeeV3DXysNIO5/d9tnzHpCxYAEj2r8
         wqlojNB5BJlcSCyW2FHRFEP5dTQ6j1L7gaaASPcEvaY+bN1XVw75KjnQKw1YgnjAHrKx
         PoB8Q4aUKwnNLprCxMq/3ferJji4J51juIQD7W59KzZxHp5UtpwHSRIoy5Kjqj2q9LmL
         cVlHRv6wdFAZyBZ/i8c7XsA4cATA4YYucid+gL73ratY903Q5yuJVmozIbGwOOMahoJx
         rdGw==
X-Gm-Message-State: AOAM533Y9s94bZn1nUs/Hhz7xCYJ16n7yi05zRF3CZm+gZ8GWSdKtCBP
        IUsY/ISFHbLGW376LaSpuXtDPA==
X-Google-Smtp-Source: ABdhPJxJ+W//1QgFErCJvUiG2+I+cQiHKzFSe+j9uziNyMOzyyvxydL96rhl0y1TQklR9N8qs4W2ZQ==
X-Received: by 2002:a05:6e02:1084:: with SMTP id r4mr7068821ilj.202.1617896686067;
        Thu, 08 Apr 2021 08:44:46 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id q20sm3055587ilj.22.2021.04.08.08.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 08:44:45 -0700 (PDT)
Subject: Re: [PATCH] usbip: vhci_hcd: do proper error handling
To:     Muhammad Usama Anjum <musamaanjum@gmail.com>, shuah@kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
        stern@rowland.harvard.edu, Shuah Khan <skhan@linuxfoundation.org>
References: <20210325114638.GA659438@LEGION>
 <b2aabe03-0cd9-fe59-5354-0596e3360402@linuxfoundation.org>
 <65e6931b2a15e4685eb0c3b7873a197ba025d50d.camel@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0ff0a28a-e369-91c8-81f9-c6e2cbe4bc26@linuxfoundation.org>
Date:   Thu, 8 Apr 2021 09:44:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <65e6931b2a15e4685eb0c3b7873a197ba025d50d.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/31/21 5:23 AM, Muhammad Usama Anjum wrote:
> On Fri, 2021-03-26 at 14:24 -0600, Shuah Khan wrote:
>> On 3/25/21 5:46 AM, Muhammad Usama Anjum wrote:
>>> The driver was assuming that all the parameters would be valid. But it
>>> is possible that parameters are sent from userspace. For those cases,
>>> appropriate error checks have been added.
>>>
>>
>> Are you sure this change is necessary for vhci_hcd? Is there a
>> scenario where vhci_hcd will receive these values from userspace?
> I'm not sure if these changes are necessary for vhci_hcd. I'd sent
> this patch following the motivation of a patch (c318840fb2) from
> dummy_hcd to handle some cases. Yeah, there is scenario where vhci_hcd
> will receive these values from userspace. For example, typReq =
> SetPortFeature and wValue = USB_PORT_FEAT_C_CONNECTION can be received
> from userspace. As USB_PORT_FEAT_C_CONNECTION case isn't being
> handled, default case will is executed for it. So I'm assuming
> USB_PORT_FEAT_C_CONNECTION isn't supported and default case shouldn't
> be executed.
> 

The way dummy_hcd handles USB_PORT_FEAT_C_CONNECTION isn't applicable
to vhci_hcd.

rh_port_connect() and  rh_port_disconnect() set the 
USB_PORT_FEAT_C_CONNECTION this flag to initiate port status polling.
This flag is set by the driver as a result of attach/deatch request
from the user-space. Current handling of this flag is correct.

>> Is there a way to reproduce the problem?
> I'm not able to reproduce any problem. But typReq = SetPortFeature and
> wValue = USB_PORT_FEAT_C_CONNECTION may trigger some behavior which
> isn't intended as USB_PORT_FEAT_C_CONNECTION may not be supported for
> vhci_hcd.
> 

If you reproduce the problem and it impacts attach/detach and device
remote device access, we can to look into this further.

thanks,
-- Shuah
