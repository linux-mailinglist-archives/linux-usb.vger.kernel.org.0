Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972ED358809
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 17:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhDHPSq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 11:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbhDHPSq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 11:18:46 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42814C061761
        for <linux-usb@vger.kernel.org>; Thu,  8 Apr 2021 08:18:35 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id d2so2080069ilm.10
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wa4Rq0oyuzzbvWhJ5vxtDxQvF9CaUKLkGwoDxcK+Ado=;
        b=IVEsdDzoYqCHiVGtn7sXdVW38QdU8eFMY5aPniyoOKN1l4JG/hS6nkLcSfVa2X9VwC
         u0CKutklt9Anxjur/0P3qWkM8SIKhqmXAnG+CEi1+jZtqdgkbYPZeOfr1WTf3Z1ApNoA
         susOXU6IQgVRIwpNHOQPlw1kNjUghCPTfIiQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wa4Rq0oyuzzbvWhJ5vxtDxQvF9CaUKLkGwoDxcK+Ado=;
        b=L8Zf8X7KPREqfwq6HtYdt3s59gK9JmMvoSyTcDaocOvlLRbuTu9vhoeBBSoSIvdGW7
         V2wagiSBJnCE8qjQ0ER8IOu55mqb4xtSdrMOGYRsbABMGMk0zszE2iWzNpeWYBcEAaHr
         1l6aWNTbpcTOyf9dKMp9rVhMsDsRezIgKadSNFzL6mZNy2xkKbLavkn/t5d2JMEaCAaU
         QKQfFPknzoIeoU2GeN9mV4XqbnoorsL0rHXvE1b/REDbQT5g/NdaYTYqELnEEI/HOPoQ
         danUlO1snxuy+DplQjGSNP98Tnp2FevAeq0aezz7XQXjvITuZ0R+BITwWe+b0Q0Ng8l5
         h9SQ==
X-Gm-Message-State: AOAM533ktKitBhW1YPtx7pMqMBfEwkPBd+YDCHLZbDjphXqfPbLDkBcu
        EyMslmHLbqlW7z2JizGs4zaR8FtcAqbEGA==
X-Google-Smtp-Source: ABdhPJzobhFNzLW6pw4hRXu1IIcwwYwoQ9wvq/wgI4fLX3jHbe7EPYC8dwoXDznQu1mRBZNRjSfm+w==
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr7362060ilq.18.1617895114662;
        Thu, 08 Apr 2021 08:18:34 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f18sm214693ile.40.2021.04.08.08.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 08:18:34 -0700 (PDT)
Subject: Re: [PATCH v6] docs: usbip: Fix major fields and descriptions in
 protocol
To:     "Hongren Zheng (Zenithal)" <i@zenithal.me>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?TcOhcnRvbiBOw6ltZXRo?= <nm127@freemail.hu>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Alexandre Demers <alexandre.f.demers@gmail.com>,
        linux-usb@vger.kernel.org, usbip-devel@lists.sourceforge.net,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <YGNZHfmAbHO6fyAr@Sun>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <650e47cb-379f-b48e-0bc0-c3453c249d80@linuxfoundation.org>
Date:   Thu, 8 Apr 2021 09:18:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGNZHfmAbHO6fyAr@Sun>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/30/21 11:00 AM, Hongren Zheng (Zenithal) wrote:
> The old document for usbip protocol is misleading and hard to read:
>    * Some fields in header are incorrect
>    * Explanation of some fields are unclear or even wrong
>    * Padding of header (namely all headers have the same length) is
>      not explicitly pointed out, which is crucial for stream protocol
>      like TCP
> 
> Major changes:
>    * Document the correct field as described in the codebase.
>    * Document the padding in usbip headers. This is crucial for TCP
>      stream hence these padding should be explicitly point out.
>      In code these padding are implemented by a union of all headers.
>    * Fix two FIXME related to usbip unlink and Document the behavior
>      of unlink in different situation.
>    * Clarify some field with more accurate explanation, like those
>      fields associated with URB. Some constraints are extracted from
>      code.
>    * Delete specific transfer_flag doc in usbip as it should be
>      documented by the URB doc in Documentation/driver-api/usb/URB.rst
>    * Add data captured from wire as example
> 
> Version change:
>      From "PRELIMINARY DRAFT, MAY CONTAIN MISTAKES, 28 Jun 2011"
>      To "Version 1, 31 Mar 2021"
> 
> Co-developed-by: Alexandre Demers <alexandre.f.demers@gmail.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hongren Zheng <i@zenithal.me>
> ---
>   Documentation/usb/usbip_protocol.rst | 344 +++++++++++++++------------
>   1 file changed, 193 insertions(+), 151 deletions(-)
> 
> PATCH v2:
> Some changes suggested by a previous patch in
> https://lore.kernel.org/linux-usb
> /20180128071514.9107-1-alexandre.f.demers@gmail.com/
> is adopted in this patch.
>    * Fix Typo: duplicated 'the' in 'the following 4 field'
>    * Fix incorrect field: in OP_REQ_DEVLIST, the second dev starts with
>      field 'path', not 'busid'
> 
> PATCH v3:
> Suggested by
> https://lore.kernel.org/linux-doc/YE8Oan2BmSuKR4%2Fp@kroah.com/
>    * Remove date and changelog in doc as these are tracked in git history
>    * Remove 'mistake alert' as all data fields are documented properly
>      now. However, docs on possible values for some field shall be added
>      in the future
> 
> PATCH v4:
> Suggested by https://lore.kernel.org/linux-doc
> /40351ed6-2907-3966-e69a-a564173b3682@infradead.org/
>    * Add punctuations for readability
>    * Move patch changelog after the marker line
>    * Remove nickname in signed-off-by line
> 
> PATCH v5:
>    * Instead of co-developed-by, use reviewed-by
>      for Randy Dunlap
> 
> PATCH v6:
>    * Add reference to URB doc in changelog
>    * Add version change in changelog
>    * Add reference to URB doc for transfer_flag and other fields in
>      USBIP_CMD_SUBMIT
>    * Add reference to specific functions for UNLINK behavior
>      and transfer_flag
>    * Fix typo: "clients import", "connection to the server" and
>      "USBIP_RET_UNLINK" to "USBIP_RET_SUBMIT" in UNLINK behavior part
>    * Separate the flow of UNLINK for clarity
>    * Extract the version number in message headers to one separate
>      section for ease of maintainence
> 

Thank you for updating the document.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah
