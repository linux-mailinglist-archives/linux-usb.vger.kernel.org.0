Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FEC24863C
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 15:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHRNjx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 09:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgHRNjN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 09:39:13 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CEAC061389;
        Tue, 18 Aug 2020 06:39:07 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s14so3256264plp.4;
        Tue, 18 Aug 2020 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CkjVY9tOLvBrultd9vEdcCUl7GQMYGpydKvtAOc4NeI=;
        b=WH3uG17CCN2RXmPftgGVJ4tG6ybJiACL+aCVWPugjctZJGfFBX2n6zfo18fgIvpoW+
         2Zyum+91SVRjxcZp54Z1cIZU3rhuJDdQnTbkOzPK0u2SiMYb35JV7117FXGLIEx4UfKx
         +pNwE3iTnJ6ImFJCBXNCpsGIjgfj6hJOe9/xcLAJrikfKxNmqmbo/KoRcz43yc6ukeua
         GTXHK6dxlaDxu5sN28rK+78+zwwJtlxJBJuExUQ5sdEcRRi4T/QiomCKjj6tGUNZo9/H
         0K5ZTc5QtHhbE42OPSsh4jwDpV8JaIwAS5Y+Cwviv5pi95ovjJQURMg+4CPc1MsbWNeP
         8Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CkjVY9tOLvBrultd9vEdcCUl7GQMYGpydKvtAOc4NeI=;
        b=NFGZIB/FfhSMIyb/y5ydQUe8oSpQTcpwYypIzpWotawlU8ASXid8pd548Jru6E9k26
         Cb+k1INcgn602aGt5CzRC5gzRrhPDjb4tVLPUdFprUWB+R0Iffhiux0UrQ056Bb9wYhe
         nWfH7gU9/PW+LPextcfUxa/MBm8ofs4tOjGbPGoeHfLTidbjCQSuNu5vTFdhA1IfDM9r
         EQnIP9BgGNOisxkMbdbNH1TpNmgdrPVKXbL1ziHkDPJTHMUhi5izPYwr6Qi50q9cPz24
         EETvInwicH3RlmPBEu1gJ6EAkvIqzm0cHXi1CCsO50Sc3I8qf9JDWadSEsGW9kdAMIU2
         EkEw==
X-Gm-Message-State: AOAM533NjS1UIxMddsKYx5Ut3Qim+zcDr7QuP903xU2tCmW7nPR4jyxX
        ox1vUFE/MmCAiVmTzoaLEDk=
X-Google-Smtp-Source: ABdhPJwct3wylhluVMYmLa5mi4KLl2BWDTuMVp4aHCORhE8Au7Iyd/OUAPiM8ZH4x7e9JV4gNviHrQ==
X-Received: by 2002:a17:902:b193:: with SMTP id s19mr15292081plr.72.1597757946203;
        Tue, 18 Aug 2020 06:39:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m26sm24178967pfe.184.2020.08.18.06.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 06:39:05 -0700 (PDT)
Subject: Re: [PATCH v5] usb: typec: tcpm: Migrate workqueue to RT priority for
 processing events
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
References: <20200731065830.3744049-1-badhri@google.com>
 <20200818105824.GA135059@kroah.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e59af0cb-8930-ff79-3d05-f075442ca5ff@roeck-us.net>
Date:   Tue, 18 Aug 2020 06:39:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818105824.GA135059@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/18/20 3:58 AM, Greg Kroah-Hartman wrote:
> On Thu, Jul 30, 2020 at 11:58:30PM -0700, Badhri Jagan Sridharan wrote:
>> "tReceiverResponse 15 ms Section 6.6.2
>> The receiver of a Message requiring a response Shall respond
>> within tReceiverResponse in order to ensure that the
>> sender’s SenderResponseTimer does not expire."
>>
>> When the cpu complex is busy running other lower priority
>> work items, TCPM's work queue sometimes does not get scheduled
>> on time to meet the above requirement from the spec.
>> Moving to kthread_work apis to run with real time priority.
>> Just lower than the default threaded irq priority,
>> MAX_USER_RT_PRIO/2 + 1. (Higher number implies lower priority).
>>
>> Further, as observed in 1ff688209e2e, moving to hrtimers to
>> overcome scheduling latency while scheduling the delayed work.
>>
>> TCPM has three work streams:
>> 1. tcpm_state_machine
>> 2. vdm_state_machine
>> 3. event_work
>>
>> tcpm_state_machine and vdm_state_machine both schedule work in
>> future i.e. delayed. Hence each of them have a corresponding
>> hrtimer, tcpm_state_machine_timer & vdm_state_machine_timer.
>>
>> When work is queued right away kthread_queue_work is used.
>> Else, the relevant timer is programmed and made to queue
>> the kthread_work upon timer expiry.
>>
>> kthread_create_worker only creates one kthread worker thread,
>> hence single threadedness of workqueue is retained.
>>
>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> ---
> 
> With this patch applied I get the following build breakage:
> 
> ERROR: modpost: "sched_setscheduler" [drivers/usb/typec/tcpm/tcpm.ko] undefined!
> 

Needs to call sched_set_fifo() now. See upstream commit 94beddacb53cd
("sched,watchdog: Convert to sched_set_fifo()").

Guenter

> Please fix up and resend against 5.9-rc1.
> 
> thanks,
> 
> greg k-h
> 

