Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005FF22C99C
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 17:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgGXP7M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 11:59:12 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58379 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726503AbgGXP7L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 11:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595606350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1OIrvXkOiRyyxvwvMOc3Tc6W/ibcMpi7vXf4M6fEfKk=;
        b=NmU1vfwuw0vcpSlZW93dc6WZ251ACbZ3ooTwHxVs2JklJYhfkoNI6oVzkgv087frHm7xwg
        AgXUBQQzsEOUT395/iAGTSYTWFNVeqVH6tKCxd0aD4mFjmFFCmUSrAmXYFK5K3WP134F3o
        o6VMjJ2uHxAoHkyx/O1vCfQtRcoH40g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-gk6aHWvoNpSJqWV3j6dsOg-1; Fri, 24 Jul 2020 11:59:08 -0400
X-MC-Unique: gk6aHWvoNpSJqWV3j6dsOg-1
Received: by mail-wr1-f69.google.com with SMTP id h4so2276321wrh.10
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 08:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1OIrvXkOiRyyxvwvMOc3Tc6W/ibcMpi7vXf4M6fEfKk=;
        b=CItNHueL3i9VImg50d2F62IYT2MNQorWbiyWqDr6f5dPJeeYraD2813FvJRnD9X6Mb
         +QE9DlhdBbtgk3T2gH46YoJF5J8oCeqgsZ+ojakw5oA7FedmqmLM/aA0dg3EAvytaPye
         JActiuh1Az3LnN+tXWxbFh7wMStdciKAJ7eGjks9AxqjoALAbiA12QGgRVW2FeA39qC5
         Lg8u24y3DOBwzG4GxyiM4jWJn2Db6IuZ61GbBm41Wkrj9P91dWtwZjdFSgmeuraTgT1o
         uYeb85i3HKEPMoe3MpsX5O6rj/FnhEY8NOhW/em6/RUtNaIIoK4lSHOtm3D+eESEMbhC
         WuCg==
X-Gm-Message-State: AOAM533kzn0G25WcVyGwsnRXpSQTHKbp9l3+AsLcDOdY7Xdz9/hMpZd3
        6sS4sfQhauh3tbTLGVrDeuew8dwmZ0fX/jMacPidCYJ1CZkiODPKwqSBBGV4dUsZDCpXFMnhN7g
        IzFsezi0FMtBLtYf71sJC
X-Received: by 2002:a1c:ba83:: with SMTP id k125mr9409486wmf.160.1595606346294;
        Fri, 24 Jul 2020 08:59:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/j9Wih1K+rh087QNh1fgIKXGSOIFrtRcmiyw7wF27bCnwLtPZlp/8v5x7dfNaWpkA2IroLg==
X-Received: by 2002:a1c:ba83:: with SMTP id k125mr9409471wmf.160.1595606346105;
        Fri, 24 Jul 2020 08:59:06 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id c25sm7822092wml.18.2020.07.24.08.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 08:59:05 -0700 (PDT)
Subject: Re: [PATCH 6/6] usb: typec: tcpm: Add WARN_ON ensure we are not
 tryong to send 2 VDM packets at the same time
To:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200715132301.99816-1-hdegoede@redhat.com>
 <20200715132301.99816-7-hdegoede@redhat.com>
 <b6c000b9-cd8a-f843-1473-0de8c5c6593f@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <49d82dc6-c360-0492-4f38-e764fc2df108@redhat.com>
Date:   Fri, 24 Jul 2020 17:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b6c000b9-cd8a-f843-1473-0de8c5c6593f@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/15/20 6:06 PM, Guenter Roeck wrote:
> On 7/15/20 6:23 AM, Hans de Goede wrote:
>> The tcpm.c code for sending VDMs assumes that there will only be one VDM
>> in flight at the time. The "queue" used by tcpm_queue_vdm is only 1 entry
>> deep.
>>
>> This assumes that the higher layers (tcpm state-machine and alt-mode
>> drivers) ensure that queuing a new VDM before the old one has been
>> completely send (or it timed out) add a WARN_ON to check for this.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> subject: s/tryong/trying/

Ack, fixed for v2.

Regards,

Hans



> 
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index ea14240423d1..5adc30666566 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -971,6 +971,9 @@ static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
>>   {
>>   	WARN_ON(!mutex_is_locked(&port->lock));
>>   
>> +	/* Make sure we are not still processing a previous VDM packet */
>> +	WARN_ON(port->vdm_state > VDM_STATE_DONE);
>> +
>>   	port->vdo_count = cnt + 1;
>>   	port->vdo_data[0] = header;
>>   	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
>>
> 

