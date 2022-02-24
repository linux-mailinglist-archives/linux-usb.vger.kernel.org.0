Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E385B4C36B8
	for <lists+linux-usb@lfdr.de>; Thu, 24 Feb 2022 21:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbiBXUQn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 15:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiBXUQm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 15:16:42 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79FD278CA0
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 12:16:11 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id vz16so6797840ejb.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 12:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2kiO1t+7NFcOlx4ftFXU17rhmXrl+ejVO/EZEfGgLjY=;
        b=NJG0nqzeOwZE5M+c1zqS4A8E2j29NoBBRzsIe+k2hBoZKX2uydYl646j2mu3OvSBXQ
         ETSsZOQVJf0zhuvWU3bKmGpkpmNTtfhtgKEciYL3v00IXTubNxQCfVsASaLIpjSTxYK6
         U9xmxTzMH2HaE7e8ldFtBpMAnze9eF5gOe/JNiGNZorJT8PF96d5PRzCoE27VEhKD7hm
         tVDMCcwWnfW0DaniFBpJTI3mgnlsRntftfLwqibagqwOx2ECQKTRcb+nnSHNQ8WcHKa+
         fJAsaGAnnO57Fm+8nm5QR7tamz1badl6X7rojFSuFl7bOpI05gYO/Vxa9Gr4eloiug9a
         XXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2kiO1t+7NFcOlx4ftFXU17rhmXrl+ejVO/EZEfGgLjY=;
        b=TqVHbbDDXeN+xg3x6E+YZQ5HcZalP6Ilcz4FYuxaSEYCshYp000Zya4G0Tv9YEvWPQ
         gZyTtl4XrLt4Fl//SmA/bSislCMClVAGbjA7hTFnxF0FODsOfFq1WCx2sQCSLRoozksA
         hcLIXqbfbeh2SL+mkppu5bPiGwYrxrfJwTWtqXm7ClXYgXSz1nlmcvIYId8D8nMqh0vR
         nRAmmGW+MiVOo+Zpf/5gopMZWnxzCK9EcYsc9p577ZwOWpENCpTnHFWXVPsQzTINtJ74
         MyUoSYptwCNXKUADLEbVSzpQc5ipMhhh4bRagYDz1d0z6LSHpxA2el32G5X3JvkiHt6x
         idRA==
X-Gm-Message-State: AOAM531POksZiqBJMm6BubI9o43wWpZHVPdY7JU3CZCpf9d8hgcglGQU
        VHxdLYrch1BaLOJqwezITDk=
X-Google-Smtp-Source: ABdhPJyy5svUH1PYorDzvMPQKA6SGdcq3/cNcr4GrGA0nt2maPB2VzI8ZcsolsfsMstHU+gC8Ax9AQ==
X-Received: by 2002:a17:906:b201:b0:6b5:58c8:e43c with SMTP id p1-20020a170906b20100b006b558c8e43cmr3478116ejz.441.1645733770304;
        Thu, 24 Feb 2022 12:16:10 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd? (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de. [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
        by smtp.googlemail.com with ESMTPSA id q7-20020a170906940700b006b86e95dc1fsm137140ejx.41.2022.02.24.12.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 12:16:09 -0800 (PST)
Message-ID: <7522820e-0b6d-7e2b-89db-30329c6c2245@gmail.com>
Date:   Thu, 24 Feb 2022 21:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Content-Language: en-US
To:     Jack Pham <quic_jackp@quicinc.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Tung Nguyen <tunguyen@apm.com>,
        Mathias Nyman <mathias.nyman@intel.com>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
 <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
 <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
 <20220224200637.GE13801@jackp-linux.qualcomm.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20220224200637.GE13801@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.02.2022 21:06, Jack Pham wrote:
> On Wed, Feb 23, 2022 at 05:13:03PM -0500, Alan Stern wrote:
>> On Wed, Feb 23, 2022 at 09:58:56PM +0100, Heiner Kallweit wrote:
>>> On 23.02.2022 15:17, Alan Stern wrote:
>>>> Don't change register_root_hub().  Just change xhci_plat_probe(); make 
>>>> it skip the second call to usb_add_hcd() if there are no USB-3 ports.
> 
> I believe this had been attempted in the past, but it does not appear
> that patch was ever accepted:
> 
> https://lore.kernel.org/linux-usb/1517221474-19627-1-git-send-email-tqnguyen@apm.com/
> 
I also found that xhci at several places relies on a proper shared_hcd,
even if there are no USB3 ports. Therefore maybe go with the less invasive
original version of my patch?

https://www.spinics.net/lists/linux-usb/msg222998.html


> Jack
> 
>>> This works on my system. However a consequence is that xhci->shared_hcd
>>> is NULL.
>>
>> Why is that?  xhci->shared_hcd doesn't get set in usb_add_hcd(), so 
>> skipping that call shouldn't cause it to be NULL.
>>
>> Note: If you skip calling usb_add_hcd(), you will also have to skip the 
>> corresponding call to usb_remove_hcd().  There may be a few more 
>> subtleties involved as well; like I said before, I'm not an expert on 
>> this driver.  You should ask the xhci-hcd maintainer for advice.
>>
>> Alan Stern
>>
>>>  There are a few places like the following in xhci.c where
>>> this may result in a NPE. Not knowing the USB subsystem in detail
>>> I can't say whether these places are in any relevant path.
>>>
>>> static int xhci_run_finished(struct xhci_hcd *xhci)
>>> {
>>>         if (xhci_start(xhci)) {
>>>                 xhci_halt(xhci);
>>>                 return -ENODEV;
>>>         }
>>>         xhci->shared_hcd->state = HC_STATE_RUNNING;
>>>
>>>
>>>
>>>> Alan Stern
>>>>
>>>>> What I can do: submit my patches as RFC, then there's a better basis
>>>>> for a discussion.
>>>>>
>>>>>> Alan Stern
>>>>>
>>>>> Heiner
>>>
>>> Heiner

