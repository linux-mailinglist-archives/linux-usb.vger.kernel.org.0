Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43E9480D09
	for <lists+linux-usb@lfdr.de>; Tue, 28 Dec 2021 21:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237279AbhL1Uh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Dec 2021 15:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236038AbhL1Uh1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Dec 2021 15:37:27 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20BAC061574
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 12:37:26 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id q14so70433123edi.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 12:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=M1jtjlYnGEYiwZTtfWk3hJtYxljarxtH2ZHsHZVnN60=;
        b=YVcGLwJS8KVARlSjlF8xOACz5sWyF1nQreywz70Pdapb2vi90JDHtkw6SRBAR4M2+c
         +wL9AhxsgB/S2shnUIbObPy/v9edj4tVaQbbgN2NTNumu5+fI5C4mw0lMKZim+VEqyjC
         6Lw0qe2SfoN7NxmKVjht0fuo//M9kasaVZoDXAYLq1OvDmTgUPGUIgrJVR2GA4dit1fy
         p6KEU0NlgPQsHKyaVcngrtOohrjkxF7DM/RMzB73spGjt6QBVu0LlP8kydBC2eEPqtut
         Lq181QE/Pkycp06ffLfMsyRrMotSv1i553m1+J/rpkd5CD3Baj8LQDUwUN0/rMQWYgHS
         SpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M1jtjlYnGEYiwZTtfWk3hJtYxljarxtH2ZHsHZVnN60=;
        b=3Lf0N9HmmJsDlylpnHNH9mr8/HjlVUWq1be0AUyNkZM1+3DIydTBTzaIP3ETCgQGS2
         Wt3+2+Yj7PBsxAUJj9L2DD/UG89rwF6uzsDXq5dF8HThoHDqwWUg86X8c/aMZDAyTxhc
         fizK24pQmMhOWwFgb4xum41j8vboyg4WFplWtoq8ou8GhfETgwEVkvwg6hUI9zVTdX10
         4X+90SHFGngrIAsS7TgiqmhrLnBaOvg8Ky+drS0W9x6xP1MDy4BzCw2KFfrTy5hbVsMJ
         7dtjvZPhzWYqM103TLPhAxhrggob7hLpDVOwH8NtMfCLRwUU9yxMj4cj7/J81/h+VZvg
         KRgA==
X-Gm-Message-State: AOAM533LutPutGphqqKV9SWtDSsxIT39AVivR1VARdtkJydoVXu1vu9C
        bwzNIRDTP+j8hDJHnkGVlePBUvKxFs0=
X-Google-Smtp-Source: ABdhPJwqGu2YoGA7LgTf5EmHSyexlLtIoPnlAo/7UvcZA9kNTYpxoCp7VHGojYcGHGIsnfx1Ry4UZQ==
X-Received: by 2002:a17:907:82a6:: with SMTP id mr38mr17412147ejc.744.1640723845574;
        Tue, 28 Dec 2021 12:37:25 -0800 (PST)
Received: from [192.168.178.24] (host-091-097-235-249.ewe-ip-backbone.de. [91.97.235.249])
        by smtp.gmail.com with ESMTPSA id b73sm7675987edf.37.2021.12.28.12.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 12:37:25 -0800 (PST)
Message-ID: <f8fa9af6-bcd0-3bea-59b9-a698ad2e2bce@gmail.com>
Date:   Tue, 28 Dec 2021 21:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: PROBLEM: USB stops working
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <2d6aeefb-97ea-c6e9-0824-a918f6ec5b4c@gmail.com>
 <083d3bab-df88-d2e2-9334-c8367da39e7b@gmail.com> <Ycs0AJDaRkJwTZI9@kroah.com>
From:   Christian <tostc6@gmail.com>
In-Reply-To: <Ycs0AJDaRkJwTZI9@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Unfortunately there is no notification if something crashes. Only my USB 
devices no longer work. To be honest, I haven't looked in the log files 
for a crash until now. In addition, I could not provoke the complete 
crash now. For testing I switched from the nvidia driver to the nouveau 
driver and the problems are gone. Now I have other issues but these are 
related to the Nouveau driver and the fact that I haven't set it up 
accordingly. So can I assume that this is not a USB problem, but rather 
an nvidia problem?

Your sincerely

Christian Tost

Am 28.12.21 um 16:57 schrieb Greg KH:
> On Tue, Dec 28, 2021 at 04:05:18PM +0100, Christian wrote:
>> [1.] One line summary of the problem: USB stops working
>>
>> [2.] Full description of the problem/report:
>>
>> I have this problem when using the Steam client so I'm not sure if this is
>> kernel related or not, but please see my notice at the end of this section.
>>
>> When Steam is only running in the background, my entire system sound usually
>> cracks. This occurs on both Steam and non-Steam games. All my USB devices
>> stop working for a second. So when I write something, some letters do not
>> appear on the screen, and sometimes my mouse clicks are not recognized
>> either. As soon as I close steam completely, the problems are gone.
>> Sometimes my entire USB driver crashes so I have to restart my computer to
>> get it working again.
> Is there any kernel log messages happening when this occurs?
>
> You can look at them by typing 'dmesg' in a console window.
>
> You say something crashes, what is the message when that happens?
>
> And can you reproduce this without the nvidia drivers loaded?
>
> thanks,
>
> greg k-h
