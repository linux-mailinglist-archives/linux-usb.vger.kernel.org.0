Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E1313A3F3
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 10:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgANJhN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 04:37:13 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33370 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgANJhN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 04:37:13 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so13576009lji.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2020 01:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XLx4qq9uUzZ99AFdfnXR8SnbOBHwZV2ncppkEMuA1W0=;
        b=z7ALV2pm+CFTLbge2d5roopzRYpFGENLJM2ErmidJYafOI2S1T8B4Lbp6dqjEouEQl
         U4auQPArXelE14NYPJWsCuXfUNg30Q04LWafsM7cMz+r3FqnEg0C0sTG26S9uTlrqRVw
         ECtzF1rUqvI6dBK+jtRU/ldMsAUBjl3UtfqXcDEWvqgPHeOaw9gUnfugBZnCfyXgGaDA
         Si1NGv/Ucccloh4SrVRAfpQiVt04bnD+GPP47RZGTT2H+CxovOakuixH3SsKPOnTYiyy
         v50QrqbAXNnUeDNxYt/ftnI51Bq/Xe8SQTDtK84MUs29IFaowMDIOAud2GY6vm13b5pK
         Zl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XLx4qq9uUzZ99AFdfnXR8SnbOBHwZV2ncppkEMuA1W0=;
        b=g/MoDE7nVjE7ydJCndtd3LLftXi1/kiquhvhw/GPtLkplZsS763AQznUGCqD66C1dJ
         VO52sgQmK5p7spx3uE47WkCdO9tVbBV1bgAC6auHwEeIWXKYCLrfxZZLJa9mKDnkI6Kw
         MwJlRHVV61FVYETBWo74dL1x3pFKJO/vDzIv2bYVEwziAWWGqQBN5gDG6TzAeVk/du/w
         EZa/HYUTs+wKsLXYvA90kMvGNRKZDGNDV/VmTbVA+8oglck8Vp5M4rFxHUzYjsNMO4Se
         hxNvebvVVatOD7W/xI3AupwP0fsZmuOSC1kw9WHROv8rrEUrjq7dEXx1oNqrEEX/nzkk
         o2ow==
X-Gm-Message-State: APjAAAXTITo5QxfMdeNPkCroDjplLRB0E9xpyA9mauFqos/1x5+cP7g4
        3adSr+rsJPgzorJVv2UT4gy0LQ==
X-Google-Smtp-Source: APXvYqw+unYwvpSRiboljBIs6s338ZMiEt/AbuDmOqPxVAToiYBSl2NALflmT6r/H9ueBjpb0B5H4g==
X-Received: by 2002:a05:651c:21c:: with SMTP id y28mr13207807ljn.164.1578994631080;
        Tue, 14 Jan 2020 01:37:11 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:687:73d7:3054:f7b0:e9b:40d5? ([2a00:1fa0:687:73d7:3054:f7b0:e9b:40d5])
        by smtp.gmail.com with ESMTPSA id h24sm7247316ljc.84.2020.01.14.01.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 01:37:10 -0800 (PST)
Subject: Re: [PATCH] usb: dwc2: Fix in ISOC request length checking
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
References: <d96e104b1913f11f0d3763f3badb0aaf9b3dae77.1578925847.git.hminas@synopsys.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4a9df018-c5a6-9e3e-7f4a-78a49fdec4e8@cogentembedded.com>
Date:   Tue, 14 Jan 2020 12:36:49 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d96e104b1913f11f0d3763f3badb0aaf9b3dae77.1578925847.git.hminas@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 13.01.2020 17:32, Minas Harutyunyan wrote:

> Move ISOC request length cheking from dwc2_hsotg_start_req() function to

    Checking. :-)

> dwc2_hsotg_ep_queue().
> 
> Fixes: 4fca54aa58293 "usb: gadget: s3c-hsotg: add multi count support"

    You also need () around the patch summary: ("<summary>")...

> Robert Baldyga <r.baldyga@samsung.com>

    What's that?

> 

    All tags should be listed without new lines in between.

> Signed-off-by: Minas Harutyunyan <hmina
[...]

MBR, Sergei


