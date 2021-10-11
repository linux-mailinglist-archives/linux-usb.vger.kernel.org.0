Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD0D4291CD
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 16:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237177AbhJKOb5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 10:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237469AbhJKObr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Oct 2021 10:31:47 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3604C061766
        for <linux-usb@vger.kernel.org>; Mon, 11 Oct 2021 07:11:40 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id c26-20020a056830349a00b0054d96d25c1eso21786293otu.9
        for <linux-usb@vger.kernel.org>; Mon, 11 Oct 2021 07:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v5Su7PqkGO2SQ21R3tpLAcLSpyAwY9J/Q2lv8N9cIhM=;
        b=IvtCjjU5jgy/GlbuuL9OANfTc0JYZsuR5l0/zTSd5Uq23iibbWBD5Vj0uUzeb/+zMk
         GVpYAWA1Md1yn3Lle6LCSo4e647g/QmDGBc+OF/HcWrvNfi0nzsMKcr5IAdN0FyzLLpi
         /L+c6PyrZE+O6l3rR3r9HGkMF2D25B04+f9ys90keSMHJZO7Aj7ctVk45ZqczMHFRyAL
         +0vYMU3OVAf8SRambDAD0Tbmy3pYgt/J3UxKCyw3ZWqLomzy9O5pUeW+U3Pw32BWbdhV
         Jdmj6AW22ARs9+4AIZZ13/1hsvFLyG4tuZpu8K6GxL2diqjj5svJduviyWAPFyL3WDT1
         70Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v5Su7PqkGO2SQ21R3tpLAcLSpyAwY9J/Q2lv8N9cIhM=;
        b=toNZF8oesn5FSsvtG0FXxzM8cRYAyKUqjLnqtjo0hqrxZOnjPZYbnrep5JJMM25Jvq
         6omafiwFHnEMWnxBpxbae62ylzaPkJC0ddfXzwQmn/XLiwRJyjP1yriAn/wuY8HrZwI6
         w+L2wF4L+5SLVElO1JUUFP1bvkT4lawkJqupoC5Cz4vT4OHKFeVwT6lVVxzHvSP+HRh8
         qg6yY0fuM16ZQBXo7DXXVpkw1Krk6fSB3v4sjNtUDMRq2KW12ciDHDzj8jZ/YrunykMw
         FQW2wTaLXFEPP9gtUXMpzJ17OzzWV2qUib0ucyT+O7TN3gFFJ3co/m+7ee6WN6jeWjy3
         dzfA==
X-Gm-Message-State: AOAM531bZRkxBsqE6urG5GRGzjCTYBJlB7EebLDp4voDrmn3aZp7NRTY
        4H9FeZorjYdy6hLNPEbsdOtmO/hL/Iw=
X-Google-Smtp-Source: ABdhPJxT719P38H/UDXRGWy9O55zFwrk7A9i3u6PAuEUsNbIhLLk7A9+5diBxSt0kuspHaanqPaeig==
X-Received: by 2002:a9d:610e:: with SMTP id i14mr20543332otj.46.1633961500299;
        Mon, 11 Oct 2021 07:11:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ay42sm1741068oib.22.2021.10.11.07.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 07:11:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: fix issue of multiple tcpm_set_state
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xu Yang <xu.yang_2@nxp.com>
Cc:     jun.li@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
References: <20210827114809.1577720-1-xu.yang_2@nxp.com>
 <YWPaPfzlnWdEsk21@kuha.fi.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e98640b8-e5d8-b2e2-f9e0-bc1f6a0debcb@roeck-us.net>
Date:   Mon, 11 Oct 2021 07:11:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWPaPfzlnWdEsk21@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/10/21 11:31 PM, Heikki Krogerus wrote:
> Guenter, can you check this?
> 

I tried quite some time ago, but was concerned if it really solves
the problem or just the symptom, and never had the time for a deep
dive so far.

Guenter

> On Fri, Aug 27, 2021 at 07:48:09PM +0800, Xu Yang wrote:
>> There are potential problems when states are set as following:
>>
>>      tcpm_set_state(A, 0)
>>      tcpm_set_state(B, X)
>>
>> As long as the state A is set and the state_machine work is queued
>> successfully, state_machine work will be scheduled soon after. Before
>> running into tcpm_state_machine_work(), there is a chance to set state
>> B again. If it does occur:
>>
>> either (X = 0)
>>      port->state = B and state_machine work is queued again, then work
>>      will be executed twice.
>> or (X != 0)
>>      port->state = A and port->delayed_state = B, then work will be
>>      executed once but timer is still running.
>>
>> For this situation, tcpm should only handle the most recent state change
>> as if only one state is set just now. Therefore, if the state_machine work
>> has already been queued, it can't be queued again before running into
>> tcpm_state_machine_work().
>>
>> The state_machine_running flag already prevents from queuing the work, so
>> we can make it contain the pending stage (after work be queued and before
>> running into tcpm_state_machine_work). The state_machine_pending_or_running
>> flag can be used to indicate that a state can be handled without queuing
>> the work again.
>>
>> Because the state_machine work has been queued for state A, there is no
>> way to cancel as it may be already dequeued later, and then will run into
>> tcpm_state_machine_work() certainly. To handle the delayed state B, such
>> an abnormal work should be skiped. If port->delayed_state != INVALID_STATE
>> and timer is still running, it's time to skip.
>>
>> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
>> cc: <stable@vger.kernel.org>
>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> What changed since v1?
> 
> thanks,
> 
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index 049f4c61ee82..a913bc620e88 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -371,7 +371,7 @@ struct tcpm_port {
>>   	struct kthread_work enable_frs;
>>   	struct hrtimer send_discover_timer;
>>   	struct kthread_work send_discover_work;
>> -	bool state_machine_running;
>> +	bool state_machine_pending_or_running;
>>   	bool vdm_sm_running;
>>   
>>   	struct completion tx_complete;
>> @@ -1192,6 +1192,7 @@ static void mod_tcpm_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
>>   	} else {
>>   		hrtimer_cancel(&port->state_machine_timer);
>>   		kthread_queue_work(port->wq, &port->state_machine);
>> +		port->state_machine_pending_or_running = true;
>>   	}
>>   }
>>   
>> @@ -1250,7 +1251,7 @@ static void tcpm_set_state(struct tcpm_port *port, enum tcpm_state state,
>>   		 * tcpm_state_machine_work() will continue running the state
>>   		 * machine.
>>   		 */
>> -		if (!port->state_machine_running)
>> +		if (!port->state_machine_pending_or_running)
>>   			mod_tcpm_delayed_work(port, 0);
>>   	}
>>   }
>> @@ -4810,13 +4811,15 @@ static void tcpm_state_machine_work(struct kthread_work *work)
>>   	enum tcpm_state prev_state;
>>   
>>   	mutex_lock(&port->lock);
>> -	port->state_machine_running = true;
>>   
>>   	if (port->queued_message && tcpm_send_queued_message(port))
>>   		goto done;
>>   
>>   	/* If we were queued due to a delayed state change, update it now */
>>   	if (port->delayed_state) {
>> +		if (ktime_before(ktime_get(), port->delayed_runtime))
>> +			goto done;
>> +
>>   		tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
>>   			 tcpm_states[port->state],
>>   			 tcpm_states[port->delayed_state], port->delay_ms);
>> @@ -4837,7 +4840,7 @@ static void tcpm_state_machine_work(struct kthread_work *work)
>>   	} while (port->state != prev_state && !port->delayed_state);
>>   
>>   done:
>> -	port->state_machine_running = false;
>> +	port->state_machine_pending_or_running = false;
>>   	mutex_unlock(&port->lock);
>>   }
>>   
>> @@ -6300,6 +6303,7 @@ static enum hrtimer_restart state_machine_timer_handler(struct hrtimer *timer)
>>   	struct tcpm_port *port = container_of(timer, struct tcpm_port, state_machine_timer);
>>   
>>   	kthread_queue_work(port->wq, &port->state_machine);
>> +	port->state_machine_pending_or_running = true;
>>   	return HRTIMER_NORESTART;
>>   }
>>   
>> -- 
>> 2.25.1
> 

