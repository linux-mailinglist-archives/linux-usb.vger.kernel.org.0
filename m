Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08742854A0
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 00:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbgJFWb2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Oct 2020 18:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbgJFWb2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Oct 2020 18:31:28 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35452C0613D2
        for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2020 15:31:28 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id k6so254423ior.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2020 15:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=merY9ASuRAU3zfTS2gZnDNq8Wwv3Ib+nkHis31YHECs=;
        b=fnaviWr41bfPN7IlaF3jqU4F371ghNXPuXLMU0b4pvfZGAuR5+iWMteCxXqhyQcznL
         0SI4gLcDhJ/2bG85y68hGfil/zZV56HJ8Lwi3v8dGWPYc9t6AfFV6zgSc/+21xvnF4R4
         Nn9C1F8OI86IvtFl77NL2qL5N57fkMeDKZllA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=merY9ASuRAU3zfTS2gZnDNq8Wwv3Ib+nkHis31YHECs=;
        b=Y6N4JiE/7Z7/MasZEmTAblOwNG3DlFj5bkoabv6xFFEBluWsKXvWWgCcIPMFT8JU3u
         FhT1YhUJ68w/zg6ZWI1a7y8Q9sbgewggMy274iijgSQshP3Nk65OZKrZfL12cgUwnK6o
         ygi98l5y5PtQaYiPXiTU2MJUSHnBi4x6Bz7B8W26QTeA8eI5S1czaiTladXOJSgrMz1a
         b7Y9pcjc8/XwVJZIsR/5kPPE6GY1jpFFinI/cSNXH2GJGRGjmhEdpOFH8SGhqWhY++Mq
         w7tHUbA3sfceZXgej3leya8PzR/XHFgDkncXh6htXxye1VW2ZemzC4g7oMMiuthHLbs4
         HNGA==
X-Gm-Message-State: AOAM532QQRzZHETMJkmoO3UUD3rj4o+CX+ZlGJljxfot6a7zQNSZoLIM
        nU89YSEx1/aB/BC46qzOzNNarA==
X-Google-Smtp-Source: ABdhPJw1ONzTpjA0EnLvPODLhxTqiWsX2OSj8ZKDLEQYmAzMFjM19HjPi8Ng+mFpHC9uQqKX8GiDgQ==
X-Received: by 2002:a02:a802:: with SMTP id f2mr368210jaj.47.1602023487397;
        Tue, 06 Oct 2020 15:31:27 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v9sm20040ioq.41.2020.10.06.15.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 15:31:26 -0700 (PDT)
Subject: Re: [PATCH] usbip: vhci_hcd: fix calling usb_hcd_giveback_urb() with
 irqs enabled
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20201006215147.35146-1-skhan@linuxfoundation.org>
 <CAAeHK+yve84dKiNbwwTDJHMcCECM8N3GodoL5UeBPPL6REVg8Q@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8d485cef-3a99-03da-1307-9569df0659e1@linuxfoundation.org>
Date:   Tue, 6 Oct 2020 16:31:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+yve84dKiNbwwTDJHMcCECM8N3GodoL5UeBPPL6REVg8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/6/20 4:16 PM, Andrey Konovalov wrote:
> On Tue, Oct 6, 2020 at 11:51 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> Fix the following warning from kcov regarding usb_hcd_giveback_urb()
>> call being made without disabling interrupts.
> 
> Hi Shuah,
> 
> This won't fix the kcov warning, as it still requires its own fix,
> which I'll send separately. But this will fix the improper usage of
> usb_hcd_giveback_urb() in USB/IP.
> 
Yes you are right, I will record message to remove the wording in
my v2. I should add the link to discussion anyway.

thanks,
-- Shuah
