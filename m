Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6A632D729
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 16:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235993AbhCDPx4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 10:53:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235883AbhCDPxd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 10:53:33 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED90CC061574
        for <linux-usb@vger.kernel.org>; Thu,  4 Mar 2021 07:52:52 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id o9so15310621iow.6
        for <linux-usb@vger.kernel.org>; Thu, 04 Mar 2021 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0afcnadyae2u9sGEYX0+zIKXHQaX0WMPgwa1AIbiGkA=;
        b=XpnHp/mbDQsXfndCV5fG+D2Gk83K8/+5fRIdK3cHwsCLbnwnnAZnaJ3KON+M0HqnMr
         LvI/Bc+Fn5KKDpFtN8yY9nNoh798DQxx02Emljvw0tZsPh4NYtij9eKiqjruS3JjX+5X
         kp65EoUV8gLlZmwWa6ozjGUG2xyxD9EBK/KIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0afcnadyae2u9sGEYX0+zIKXHQaX0WMPgwa1AIbiGkA=;
        b=laY5HnYMnJ+VODoOL383kNDgd4nzaA3GtymsxL+M3qXiRwUHd7MBnDrO4o5xd55zBJ
         Lk2ctE33iRLePZzm4EXTRR1VId8VVYDHHh6cUKJxaUrbNuitc6EEG68FwuCiM+N1Hama
         6lX1peuNvXDyYX/Hk0v5rODsn8Fc5vBCUbYldMo1MKalxmhOLx+UKUl0qWoP0EnPqqQj
         JPUsfqiW0hisFE+GmRgZlMQZIx8JgZDsdzGs8JrmZSm0SxoXWWynduF4Qzi/USL/Sr4Y
         vGWlCwQ7aQ45wlPhFlmNvYoqosPUtv1/7z8oM/wh0uJKHujldYet6W4RFIk5eNNbIGq1
         K0wg==
X-Gm-Message-State: AOAM533qQW7DCpVBtRqi2hhHCjcebYO2i4619deizp50hljp1qgp0SpJ
        k0ZRulXu5+H5fDwaMmNSag8ETA==
X-Google-Smtp-Source: ABdhPJyO59ZiDY8RgDtFmw3HNs7n2U+wKMXWeONPjQThnJCbzZg6ZfmKVhExKsfss1LhN3d+wZewPA==
X-Received: by 2002:a05:6602:14c3:: with SMTP id b3mr4091974iow.202.1614873172444;
        Thu, 04 Mar 2021 07:52:52 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j12sm13477482ila.75.2021.03.04.07.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 07:52:52 -0800 (PST)
Subject: Re: [PATCH v4 00/12] usb: usbip: serialize attach/detach operations
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
 <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <353d42fe-d730-63bb-7d40-33ee67d20411@linuxfoundation.org>
Date:   Thu, 4 Mar 2021 08:52:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304152455.3685-1-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/4/21 8:24 AM, Tetsuo Handa wrote:
> On 2021/02/27 0:04, Shuah Khan wrote:
>> I will send it out later on today.
> 
> Since I haven't received it, here comes an update.
> 

Thanks for you the update.

I have a patch series that works well to go into stables.

As I said, it uses a simpler approach and reduces the number
of changes. I would rather go with what I am working on.

These fixes have to go all the way into Linux 4.4. I will handle
this series.

thanks,
-- Shuah
