Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E1C33D871
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 16:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238238AbhCPP6C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 11:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238231AbhCPP5w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 11:57:52 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AEDC06174A
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 08:57:52 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id e45so8807954ote.9
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Is8isbpsE/m8+d7WMdJsZ3TemciY/YrT8YV5GXADmdc=;
        b=aNqGI9luQP5M/DFQYTGEvuog7wwzyNzMdtPxupgu+D/16iJ9j6/gJ79o+NTPgWO/iv
         IcXUKnUTtwpc2aXtsnnM0CVuvESkJWlZQB1wFrDGm3wwcj7biMHBCn9VlnqjqsMVfEe4
         3+saCnKopPNUOw9a1pEnK/qv5ECw9b+mH2idE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Is8isbpsE/m8+d7WMdJsZ3TemciY/YrT8YV5GXADmdc=;
        b=d4aGYHtSG0hZHjOMYoZFXiWUP02eV81GNT7yJ/WLXivTHFW/5JVLKRWpCJjeAqBjlH
         w3pCvDFkzOUSZtzm/DTZzGWMm06hataCIDxaT5OMviIiSCLzPDROe31Iv9IUyybQ8+9s
         PRzHBXK+S0iGsqkwQVIvw61LNReMr7s5yLQ1wtqyE+ihG/DTB1hbFP0hNFuVa0jJvnY4
         DwpY3wi7tAOfbkmRwa0hqEhXnKLXEXRG1ujTxkPhFYt6MSmnj7yrpeRysOhZ6T5qzfm5
         zNA901RFl3b+ObX0UJs85jjLK+0XY/Y401CA3Y+aoaw6S+KHSyUS+0y9ipFHY2VRrCmA
         uvFA==
X-Gm-Message-State: AOAM530Dcd6t1UJbw5mIMi0wrkEcG/CujT8A/f/5pLgjLgIOzI6G96GV
        PDr1MAjxYuCS4uQCQgh99FDThw==
X-Google-Smtp-Source: ABdhPJybBa3rPJHsrIp7FO1Wd7v0QUFiHxTfGM1YrFDqLkoWhaxGwI4KaKERIFSvAcVDGI1g2kEFkQ==
X-Received: by 2002:a9d:6a91:: with SMTP id l17mr4161836otq.18.1615910271688;
        Tue, 16 Mar 2021 08:57:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u23sm6772587oof.17.2021.03.16.08.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 08:57:51 -0700 (PDT)
Subject: Re: [PATCH v5] docs: usbip: Fix major fields and descriptions in
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
References: <YFAXGBSxaZJ8Dy3/@Sun>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <98a9c2c3-c041-4823-f37e-cd9a214a34d0@linuxfoundation.org>
Date:   Tue, 16 Mar 2021 09:57:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFAXGBSxaZJ8Dy3/@Sun>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/15/21 8:25 PM, Hongren Zheng (Zenithal) wrote:
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
>      documented by the URB part.
>    * Add data captured from wire as example
> 
> Co-developed-by: Alexandre Demers <alexandre.f.demers@gmail.com>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hongren Zheng <i@zenithal.me>
> ---
>   Documentation/usb/usbip_protocol.rst | 320 ++++++++++++++-------------
>   1 file changed, 171 insertions(+), 149 deletions(-)
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

Hi Hongren Zheng,

Thanks for the patch. The document updates are very much needed.
I will review and give you comments.

Please wait for a couple of days before sending another version.
Makes it easier for you an your reviewers.

I started reviewing patch v3 and I will switch to v5 now
and send you comments.

thanks,
-- Shuah
