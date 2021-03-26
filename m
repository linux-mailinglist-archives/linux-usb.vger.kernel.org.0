Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C2E34B021
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 21:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCZUZL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 16:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhCZUYk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Mar 2021 16:24:40 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FCEC0613AA
        for <linux-usb@vger.kernel.org>; Fri, 26 Mar 2021 13:24:39 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id f19so6687376ion.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Mar 2021 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=5z34cqVEPiFQPPc+g2QanD8KGN67FfoACVpCwgARCQw=;
        b=M+5Id7U7uChU5FpwwJKBl6tSDYaRSoYYyECLMoLWvv+As3XPcwyE89uYAvJerEaSD9
         5qND+Ysx0yLbrR8QMBP9T8jtrg8a1OaDmB/1MZe4JuXptveEwUAOxtRz0hb29XY51+hc
         fGOmVonSI4KnRamBGNQcUG4iyALvSnunWh6ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5z34cqVEPiFQPPc+g2QanD8KGN67FfoACVpCwgARCQw=;
        b=COgx5Q0BnZTjTS55mpXnJphF6MfRIiLeh1r6pdX/rirv64Ihr5QwaElYOy1Zw4s4Bt
         /SGbErCKqxarrXo6ktCynN/lhnVQWzymOFFxfvdqTkuJV2t8SozV5ytcu282I8Z1Y7IH
         Dc+2dQ+gJBBJzqBVNKUPIbjRKjaYe/jlsHRQLhZZ8aM451tu3i66bKG7kgRDMgxncm30
         aWrTGosYAcUzOhE47SSacX6oyn4p7K/PkS+O/FhcnCZ7wQ4bjRzaEARtXXqnTrzxgPVu
         o5xcTe5j5JVM0jOiXPRLSewi10MZ/Tx6PLF0l4ROy1rHOy2oPYCYI4fknLi90KsoR68c
         btyw==
X-Gm-Message-State: AOAM531ZiqjN3wMlYqsstvqITa4PBN4OpC8ptkNoBv2i4yveWer4p6R0
        WTgG5m7dMpq9PzvZCDHq4mdvnHANaS7iUg==
X-Google-Smtp-Source: ABdhPJyM40N2kL5NOZ2ze+26oXB5bIZuQIeDezK4UbRRE39qjq3dpm6lIIxGLfOHaVFrDoQioHa3oQ==
X-Received: by 2002:a6b:c997:: with SMTP id z145mr11378763iof.36.1616790279309;
        Fri, 26 Mar 2021 13:24:39 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u5sm4793084iob.8.2021.03.26.13.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 13:24:38 -0700 (PDT)
Subject: Re: [PATCH] usbip: vhci_hcd: do proper error handling
To:     Muhammad Usama Anjum <musamaanjum@gmail.com>, shuah@kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
        stern@rowland.harvard.edu, Shuah Khan <skhan@linuxfoundation.org>
References: <20210325114638.GA659438@LEGION>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <b2aabe03-0cd9-fe59-5354-0596e3360402@linuxfoundation.org>
Date:   Fri, 26 Mar 2021 14:24:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325114638.GA659438@LEGION>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/25/21 5:46 AM, Muhammad Usama Anjum wrote:
> The driver was assuming that all the parameters would be valid. But it
> is possible that parameters are sent from userspace. For those cases,
> appropriate error checks have been added.
> 

Are you sure this change is necessary for vhci_hcd? Is there a
scenario where vhci_hcd will receive these values from userspace?

Is there a way to reproduce the problem?

thanks,
-- Shuah
