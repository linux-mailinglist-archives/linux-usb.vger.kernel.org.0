Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F1022C989
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 17:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgGXP4j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 11:56:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20800 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726381AbgGXP4j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 11:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595606197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UinZrROnEZpRVPtY5SitbyM+FskM+z1Fcf4AwjrpOfA=;
        b=Waf61gHc/Z0MuXksc9Ft7lNxL+0cioK48QJTnrCJp6wZgzeE7DNr7BZDvhUDN7qB8Orlw1
        8QDVJDBnTAzGm+u9G+VRzN9Wd622cWxpdFmIwnvTgEHJ5zL5X/o80VbiJeCkEYEW7Ir+9P
        S2qbieCP+4iUCIxEEpIqI7cZB+ORPS8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-_3qhwvs8PEGlJDpAfIjr1Q-1; Fri, 24 Jul 2020 11:56:35 -0400
X-MC-Unique: _3qhwvs8PEGlJDpAfIjr1Q-1
Received: by mail-wr1-f70.google.com with SMTP id z7so1723449wrw.21
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 08:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UinZrROnEZpRVPtY5SitbyM+FskM+z1Fcf4AwjrpOfA=;
        b=PZZljD7p4bMN3uu1XoQWDkWcHjaGZRGuIcnHqaxD7Y3HWI5rwjNs0rC5fwCHGoQLCG
         ZE2xmBAIjwMEFiBMnba6rUmNHAPUoRshqiW1kugb6wiTf+5l0BWCNRRfB76QphZOU8e+
         tkhhNMHlqHQNO7nlM/eINVK7hqSWn/XAONFWnTs52vy4JyPzAJyHP3+iNKlS4Bb0/PDj
         Wk31U/YzJ2wNl+bKqGgAbnhYJEqG44XFvbaMBeDpjix/JFUcQ1P5EHXmSv4R5T+R+n+J
         DFEFCvX6CISyMe72BCo6vxZjXT6PAmrF4BvoP9vf6BD7C65fH+hMQzwdk8qqfJhlpawQ
         PK5g==
X-Gm-Message-State: AOAM532HraY/PPbDP/mhJrfiXyhU1rnnwBgKWTEoD0gpm6KHNs6GbmlF
        mgfB4Mzl6dwmexFtwDDooXasya9T0YHwBKmzo6GeYzrOPA1R03FqFWHXSz+RqUAQB4GeetwLvZQ
        bX1M555L31ciNeRmcisQy
X-Received: by 2002:a05:600c:2146:: with SMTP id v6mr7416008wml.87.1595606193830;
        Fri, 24 Jul 2020 08:56:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRrbcAVe9lGa9GiZ6CatKQMxO5Lf+FHwQy/Zq/F/bYMP+1IEjCxQbbKxCzGknRv+YS1mg41g==
X-Received: by 2002:a05:600c:2146:: with SMTP id v6mr7415982wml.87.1595606193526;
        Fri, 24 Jul 2020 08:56:33 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id 65sm7950242wmd.20.2020.07.24.08.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 08:56:32 -0700 (PDT)
Subject: Re: [PATCH 5/6] usb: typec: tcpm: Fix AB BA lock inversion between
 tcpm code and the alt-mode drivers
To:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200715132301.99816-1-hdegoede@redhat.com>
 <20200715132301.99816-6-hdegoede@redhat.com>
 <d13efaa4-96db-7424-f9b1-5524a33e96f7@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <028eb1c5-6075-7341-34bb-2a339c0f9d56@redhat.com>
Date:   Fri, 24 Jul 2020 17:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d13efaa4-96db-7424-f9b1-5524a33e96f7@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/15/20 6:05 PM, Guenter Roeck wrote:
> On 7/15/20 6:23 AM, Hans de Goede wrote:
>> When we receive a PD data packet which ends up being for the alt-mode
>> driver we have the following lock order:
>>
>> 1. tcpm_pd_rx_handler take the tcpm-port lock
>> 2. We call into the alt-mode driver which takes the alt-mode's lock
>>
>> And when the alt-mode driver initiates communication we have the following
>> lock order:
>>
>> 3. alt-mode driver takes the alt-mode's lock
>> 4. alt-mode driver calls tcpm_altmode_enter which takes the tcpm-port lock
>>
>> This is a classic AB BA lock inversion issue.
>>
>> With the refactoring of tcpm_handle_vdm_request() done before this patch,
>> we don't rely on, or need to make changes to the tcpm-port data by the
>> time we make call 2. from above. All data to be passed to the alt-mode
>> driver sits on our stack at this point, and thus does not need locking.
>>
>> So after the refactoring we can simply fix this by releasing the
>> tcpm-port lock before calling into the alt-mode driver.
>>
>> This fixes the following lockdep warning:
>>
>> [  191.454238] ======================================================
>> [  191.454240] WARNING: possible circular locking dependency detected
>> [  191.454244] 5.8.0-rc5+ #1 Not tainted
>> [  191.454246] ------------------------------------------------------
>> [  191.454248] kworker/u8:5/794 is trying to acquire lock:
>> [  191.454251] ffff9bac8e30d4a8 (&dp->lock){+.+.}-{3:3}, at: dp_altmode_vdm+0x30/0xf0 [typec_displayport]
>> [  191.454263]
>>                 but task is already holding lock:
>> [  191.454264] ffff9bac9dc240a0 (&port->lock#2){+.+.}-{3:3}, at: tcpm_pd_rx_handler+0x43/0x12c0 [tcpm]
>> [  191.454273]
>>                 which lock already depends on the new lock.
>>
>> [  191.454275]
>>                 the existing dependency chain (in reverse order) is:
>> [  191.454277]
>>                 -> #1 (&port->lock#2){+.+.}-{3:3}:
>> [  191.454286]        __mutex_lock+0x7b/0x820
>> [  191.454290]        tcpm_altmode_enter+0x23/0x90 [tcpm]
>> [  191.454293]        dp_altmode_work+0xca/0xe0 [typec_displayport]
>> [  191.454299]        process_one_work+0x23f/0x570
>> [  191.454302]        worker_thread+0x55/0x3c0
>> [  191.454305]        kthread+0x138/0x160
>> [  191.454309]        ret_from_fork+0x22/0x30
>> [  191.454311]
>>                 -> #0 (&dp->lock){+.+.}-{3:3}:
>> [  191.454317]        __lock_acquire+0x1241/0x2090
>> [  191.454320]        lock_acquire+0xa4/0x3d0
>> [  191.454323]        __mutex_lock+0x7b/0x820
>> [  191.454326]        dp_altmode_vdm+0x30/0xf0 [typec_displayport]
>> [  191.454330]        tcpm_pd_rx_handler+0x11ae/0x12c0 [tcpm]
>> [  191.454333]        process_one_work+0x23f/0x570
>> [  191.454336]        worker_thread+0x55/0x3c0
>> [  191.454338]        kthread+0x138/0x160
>> [  191.454341]        ret_from_fork+0x22/0x30
>> [  191.454343]
>>                 other info that might help us debug this:
>>
>> [  191.454345]  Possible unsafe locking scenario:
>>
>> [  191.454347]        CPU0                    CPU1
>> [  191.454348]        ----                    ----
>> [  191.454350]   lock(&port->lock#2);
>> [  191.454353]                                lock(&dp->lock);
>> [  191.454355]                                lock(&port->lock#2);
>> [  191.454357]   lock(&dp->lock);
>> [  191.454360]
>>                  *** DEADLOCK ***
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 31 ++++++++++++++++++++++++++++++-
>>   1 file changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index 4745b4062000..ea14240423d1 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -1247,6 +1247,27 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>   	if (PD_VDO_SVDM(p[0]))
>>   		rlen = tcpm_pd_svdm(port, p, cnt, response, &adev_action);
>>   
>> +	/*
>> +	 * We are done with any state stored in the port struct now, except
>> +	 * for any port struct changes done by the tcpm_queue_vdm() call
>> +	 * below, which is a separate operation.
>> +	 *
>> +	 * So we can safely release the lock here; and we MUST release the
>> +	 * lock here to avoid an AB BA lock inversion:
>> +	 *
>> +	 * If we keep the lock here then the lock ordering in this path is:
>> +	 * 1. tcpm_pd_rx_handler take the tcpm port lock
>> +	 * 2. One of the typec_altmode_* calls below takes the alt-mode's lock
>> +	 *
>> +	 * And we also have this ordering:
>> +	 * 1. alt-mode driver takes the alt-mode's lock
>> +	 * 2. alt-mode driver calls tcpm_altmode_enter which takes the
>> +	 *    tcpm port lock
>> +	 *
>> +	 * Dropping our lock here avoids this.
>> +	 */
>> +	mutex_unlock(&port->lock);
>> +
>>   	if (adev) {
>>   		switch (adev_action) {
>>   		case ADEV_NONE:
>> @@ -1272,7 +1293,15 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>   	}
>>   
>>   	if (rlen > 0)
>> -		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
>> +		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
>> +
>> +	/*
>> +	 * We must re-take the lock here to balance the unlock in
>> +	 * tcpm_pd_rx_handler, note that no changes are made while the lock
>> +	 * is held again. All that is done is unwinding the call stack until
>> +	 * we return to tcpm_pd_rx_handler and do the unlock there.
>> +	 */
>> +	mutex_lock(&port->lock);
> 
> Unless I am missing something, tcpm_queue_vdm() now also acquires the lock
> and releases it. Why not move this further up and keep tcpm_queue_vdm_unlocked() ?
> This would avoid one set of lock/unlock calls.

You're right, I've changed this for v2 of the patch-set.

Regards,

Hans

