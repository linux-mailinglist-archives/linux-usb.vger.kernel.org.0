Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8FD1AD093
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 21:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbgDPTrA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 15:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729391AbgDPTq7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 15:46:59 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33A5C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 12:46:59 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id a23so18742plm.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 12:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ir3nkCd6iTNFkpkkWphM0ZqBxfComEUzLt7omcLVfTw=;
        b=Q31H5PO6dzCj3tfk16yj+ez/x+LmtTJ44zn7DSwOVBI2j71bvT0d9ueomPI3uvb9qo
         HI3yqUh2fgYURlIy9phUWF9sgM7h+q1nZPX6Yj9jk6+4eG7bKodanykc8PbOMZAmrZ3D
         QQ7Yoi5WIDfJyLxcjFT/e4Q/jxrHerbgtaqIe9UpmtPZ0qdVeiAM/KQ+LN8NHUbkxnxB
         9N6hO6R4GTkjhnEmsd19gzY38qiHM0iVhRNI0xgc89mTkAC6q2L3MjMN/TRWB+jYgbZ8
         Z508+9G18xjnS6cml1eCbjMBaQquy+OKUPJ3I6Nf1Y6HExFjJK3bIFAr/byMdWSPPdq/
         ChOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ir3nkCd6iTNFkpkkWphM0ZqBxfComEUzLt7omcLVfTw=;
        b=qL8ZKRgfK6MCx7IkMURLUrBUgTB4rxLd96/XtTFZGALMyjLD45nPstGjYFSGe5R+ZN
         BRzSf1YtCseBX0CPcnIy37sK9LmdMpF0vPJQ5D/882v3izu2Cv7IHDQl+av+aM/aCYaj
         RXw0wp2Qdy0WgzjkFhQr2xTjRKdo11rXVWI/T6hGolUb+245YFB6kyiWUWzs0EzJZonT
         0RU6yqL9FL2Q/VLEq9kQF3RFw04tdDnehqXYoY9OZnshrcLq147suXy2IO/ow1urugAq
         IB0oY5Ad9ERiqoILCmvRFVsF2RcfPkMk2mgCS7U2Q9IMrD5q64czqbN9iE28FCuro572
         diMQ==
X-Gm-Message-State: AGi0PuYZd1ghTnKFLeoKAT3/nLMv1eMgB2hLCsDD/3tI69hIOc/GbcpK
        SORVK/lI7RBMEukCCMAJtU+CDup13kw=
X-Google-Smtp-Source: APiQypJ/e0f1A3O+gz4uLrjSQ3nPVTXF9Nl7K6IQu1lOecdZ5FFxRlU4KwnTpM/LX/2iz51iUSvo7Q==
X-Received: by 2002:a17:90a:8c93:: with SMTP id b19mr6921570pjo.90.1587066418715;
        Thu, 16 Apr 2020 12:46:58 -0700 (PDT)
Received: from [192.168.0.3] ([75.167.104.59])
        by smtp.gmail.com with ESMTPSA id ie17sm3492963pjb.19.2020.04.16.12.46.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Apr 2020 12:46:58 -0700 (PDT)
Subject: Re: No disconnection event for suspended device at v5.6
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
References: <Pine.LNX.4.44L0.2004161031060.14937-100000@netrider.rowland.org>
From:   Paul Zimmerman <pauldzim@gmail.com>
Message-ID: <8a6cd6f8-b3c0-ca7b-9e69-23c68ac80d9e@gmail.com>
Date:   Thu, 16 Apr 2020 12:46:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2004161031060.14937-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/16/20 7:34 AM, Alan Stern wrote:
> On Wed, 15 Apr 2020, Paul Zimmerman wrote:
> 
>> Hi Alan,
>>
>> On Wed, 15 Apr 2020 15:40:31 -0400 (EDT) Alan Stern <stern@rowland.harvard.edu> wrote:
> 
>>> Paul, I trust this new patch won't mess up your Bluetooth adapter.  It
>>> should still clear the hub->change_bits entry before the hub workqueue
>>> thread wakes up.
>>>
>>> Alan Stern
> 
>> Unfortunately, my testing on this is somewhat inconclusive. I updated
>> to the latest Linus kernel, then did about a half-dozen suspend/resume
>> cycles to verify it was still working. Then I applied the patch and
>> rebooted into the new kernel. At first I thought it was OK, but after
>> about 5 or 6 suspend/resume cycles, the bluetooth stopped working (the
>> desktop bluetooth manager in Linux Mint froze when I opened it). Another
>> suspend/resume cycle brought it back to life, but after a couple more
>> cycles it froze again.
> 
> That sounds different from your original bug report.  Didn't the
> adapter fail in a significantly larger fraction of suspends?

Yes it did.

>> But looking at the dmesg log, there were no errors concerning the
>> bluetooth adapter. With the original failure, it would show errors
>> before or during the firmware update of the bluetooth adapter, but
>> now, the firmware update seemed to complete OK. And to top it off,
>> after a reboot, I am no longer able to make it fail. I did more than
>> a dozen suspend/resume cycles and have not seen any further failures.
>>
>> So, make of that what you will :)
> 
> Overall, I guess we can call it a success.  Do you want to collect a
> usbmon trace to verify that the patch behaves as expected, or are you
> happy with the testing so far?

I doubt a usbmon trace would show us anything unless I could get the
bluetooth to fail again. And since I was the only one who saw the
original problem anyway, I think it's fine to proceed with this patch
as-is.

Thanks,
Paul
