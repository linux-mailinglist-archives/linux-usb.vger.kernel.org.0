Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12C07140EAF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 17:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgAQQJG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 11:09:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:49882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728831AbgAQQJG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jan 2020 11:09:06 -0500
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 878592072E;
        Fri, 17 Jan 2020 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579277345;
        bh=zM7Llr0Ybv2NV7XS1fzQowbRhxIU/xrvp3yvY+l6Erk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vbuxXGLWPluk5YCVPhDkWRo5XPQLNBRVfOMIe3hSDGVuczud7I489KFUt1miYYuSZ
         hRNApBi4YonHOYBMDjYLNHvtO/fMiThlLTvuXwNpsOUowN9fRfdJ4GdZW8hQgq/UV1
         e6Yua+srqL+7SSLZ5sRXanD0jlWZ19zVeSAt7LtU=
Subject: Re: [PATCH] usbip: Remove unaligned pointer usage from usbip tools
To:     Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
Cc:     linux-usb@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>,
        shuah <shuah@kernel.org>
References: <5176009.64u6Zm7RkX@gverdu.qindel.com>
 <86e6dfbf-cf51-1467-3a78-fd72377385b7@kernel.org>
 <783453790.2802069.1579078360600.JavaMail.zimbra@qindel.com>
From:   shuah <shuah@kernel.org>
Message-ID: <32891b05-7120-81b8-9466-ac54cda39d6f@kernel.org>
Date:   Fri, 17 Jan 2020 09:09:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <783453790.2802069.1579078360600.JavaMail.zimbra@qindel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/15/20 1:52 AM, Vadim Troshchinskiy wrote:
> 
> 
> ----- Mensaje original -----
>> De: "shuah" <shuah@kernel.org>
>> Para: "Vadim Troshchinskiy" <vtroshchinskiy@qindel.com>, linux-usb@vger.kernel.org
>> CC: "Valentina Manea" <valentina.manea.m@gmail.com>, "shuah" <shuah@kernel.org>
>> Enviados: Jueves, 2 de Enero 2020 1:01:24
>> Asunto: Re: [PATCH] usbip: Remove unaligned pointer usage from usbip tools
>>
>> Hi Vadim,
>>
> 
> 
> Hello! Sorry for the late reply, I was on vacation.
> 
> 

No worries. I fixed it with a simpler approach.

thanks,
-- Shuah


