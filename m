Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B5B43B893
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 19:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236830AbhJZRvJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 13:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234704AbhJZRvH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 13:51:07 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15702C061745
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 10:48:43 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id y67so318430iof.10
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=unJU1pB2lORHctltoTtjBKXVFG3ApKTKNfkLO12OL0k=;
        b=U1yOSqV0FbvAwhS8H1CYCuDncfRncPLUfS24tSiRno8Lg5S2rKizFQAsNRu57Ssc0n
         4tmyXu0EdvRtTWkMUFSU8dTCeTVQ88RhH0muxxnc96RHqtjFYdNFHHr+Moh4tsZhUtcO
         QixKiwPsUeYUYIh8ixEojXsuoB8+u48ahw3+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=unJU1pB2lORHctltoTtjBKXVFG3ApKTKNfkLO12OL0k=;
        b=1rLiu/tCcjliSZNaxhlp5uqHZ3/P1n759IjrbZN88DektgStNs8jITleg39L9XJuLN
         nrs8jN1JkAmtcyWbv8kxVC9234OeE3dtjuGBgOzmN0SPXAiwEHm7hPzcU3W+1yBg8GNE
         W068M5Vmp5393nfxN50mMBIVFgaCicJ+ZDSYYdEjO5CzPLVm1U4hFLQ4W8jrCRgBGQ+4
         Bo7LfxSnpZE7ztoh7XLL/eArOxfjr7Cj/yFOn4b3xYC1Caooy6CJPFNB1LHUHYGMXAxV
         rxd5I0/34hdy5L0bjWxcpOYqPZ1caxoqacqkdEDKXot0ktsfoosiRzwTXWEM1jz+xuA2
         gk7g==
X-Gm-Message-State: AOAM531SHRg47/SK22ftFgMhGw2jh/pm6RHu0WBWpDeTjvDuSbDP4BRZ
        uUDDar3+S6Qf+kIwckg9Ly8ecA==
X-Google-Smtp-Source: ABdhPJxQdo+8ToknzVcFrUY99HeRaG438kDBAwkeDJYCWlCfRJpubAjuASRKlUHjL3eMoDVXtgReGA==
X-Received: by 2002:a05:6602:2d4e:: with SMTP id d14mr16689474iow.172.1635270522470;
        Tue, 26 Oct 2021 10:48:42 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x19sm12310971iow.6.2021.10.26.10.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 10:48:42 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] tools/usbip: persistently forward USB devices on a
 given bus
To:     Greg KH <gregkh@linuxfoundation.org>,
        Lars Gunnarsson <gunnarsson.lars@gmail.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211025200615.GA14140@dell-precision-T3610>
 <YXeUMD4ftOhcQNpF@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <08e98ea8-2356-7a73-d51a-f0a390b7d285@linuxfoundation.org>
Date:   Tue, 26 Oct 2021 11:48:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YXeUMD4ftOhcQNpF@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/25/21 11:37 PM, Greg KH wrote:
> On Mon, Oct 25, 2021 at 10:06:15PM +0200, Lars Gunnarsson wrote:
>> To forward a remote usb device over usbip the following steps is required:
>>
>> 1. Execute "usbip bind" on remote end.
>> 2. Execute "usbip attach" on local end.
> 
> <snip>
> 
> You sent 3 patches with identical subject lines, yet they do different
> things?  Please make them unique.
> 

Please add a cover-letter for the patch with common information
and then proper commit logs for each patch.

thanks,
-- Shuah

