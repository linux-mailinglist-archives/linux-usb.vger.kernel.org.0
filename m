Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4735C9704
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 05:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfJCDpb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 23:45:31 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39375 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727613AbfJCDpb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 23:45:31 -0400
Received: by mail-pf1-f194.google.com with SMTP id v4so810131pff.6
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 20:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+2EKTzETZyhhguvmV3Okibj4WoYZhvMA8q52ITQpUvU=;
        b=YbSJf7O3KRZlyNe7PHP1h/Q3t7R+2npDQ4Rm5dfZMB7CRANTkGt8R2nwPfGSR8gJBy
         N4OAB7cAmA+IS2i2dsvxyeu8Xsfh8TjyhwoD4v2uiwVMgCnaWbGHpezPsdYhsC6WWSRl
         nMRl1lUR5BatT2LVoDRg8seK9F/9/curUxaFPmwogOn7o+aOnSZSN3mod0xhF7WdmU27
         OqJZRSIMT4YxXmm/S2jd/tvQP7CMe26ODI7o4jscnLTZD8Gq+etTLzK92nVDwwPy+U4x
         vSw5bB29ij/RGKQmcTLkG6YyeB71dCJxGA7OmS7NAXKn+7yz0Pupi0cM1DtuQ1GVq8F1
         MnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+2EKTzETZyhhguvmV3Okibj4WoYZhvMA8q52ITQpUvU=;
        b=qbIi9U1/F0//QuUuecdxeSG64+j/CChVnI/VLQ+NVuq7bIcUEJ4A4c6nf9ZrSRCJ/Z
         bzQx6Cyxt9y7f3HFZhzwBl0y093cigh9lXZhOLa2soYUJOZy8MdPvwzQ7RMikrDCes/Q
         cvJpxwDevyWMWnGZHMiLorfsyeeP5yFr0l/PWNex/xR/NIE27RSrtIBjzNpNM0Mu8QO7
         KQmOY+0lUmg2MFFobFbFFCf15erfnvWfj00Zw9MB5r4jiR5Kqlb7VvkuI3jQu5yZ9Y67
         kEcYkgE4JsgXghaVIlcECIZZOIGSrMj5GbOLXkXaZZL5UnRHFnisRml9wdeXhfMKXYga
         RTDg==
X-Gm-Message-State: APjAAAV2DngltDDTvMkJeswO1kQzRTz4Kiq9sSH45SHhhzqa1dhuOhfb
        irVQTdSrka2aS42veDMDOsmpQ2/W
X-Google-Smtp-Source: APXvYqxKaUHyyQ967ldhE79dMFQ+yh1Qbc18sMbb/0vOGwn2cOFgEUdg6mcG11MYzDCTGr8Yn/W1fQ==
X-Received: by 2002:a63:ba47:: with SMTP id l7mr7235595pgu.201.1570074330459;
        Wed, 02 Oct 2019 20:45:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u17sm782680pgf.8.2019.10.02.20.45.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 20:45:29 -0700 (PDT)
Subject: Re: [PATCH 1/7] usb: typec: Copy everything from struct
 typec_capability during registration
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
 <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
 <20191002160652.GB19836@kuha.fi.intel.com>
 <20191002163639.GA30400@roeck-us.net>
 <20191002182933.GA19870@kuha.fi.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <318179e6-fa1e-0b33-4a4f-40ecd6947f8a@roeck-us.net>
Date:   Wed, 2 Oct 2019 20:45:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002182933.GA19870@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/2/19 11:29 AM, Heikki Krogerus wrote:
> On Wed, Oct 02, 2019 at 09:36:39AM -0700, Guenter Roeck wrote:
>> port->cap->type used to be the role provided by the low level driver.
>> That was static, and it was not possible to override it. It did not
>> resemble the current port type, or a configured port type, it resembled
>> port capabilities.
>>
>> Your code changes that, meaning even if the low level driver (effectively
>> the hardware) states that it can not support DRP, it is now configurable
>> anyway. That seems to me like a substantial change to the original meaning
>> of this attribute.
>>
>> Effectiv ely there are now three values,
>> - port->port_type	the current port tyle
>> - port->fixed_type	the type selected by the user
>> - port->cap->type	the type provided by low level code,
>> 			now no longer available / used
>>
>> Even if the low level driver (hardware) says that it can not support
>> TYPEC_PORT_DRP, that can be overwritten by the user. Maybe there is a
>> good reason for that, but I don't see it, sorry.
> 
> No, that was not my intention. Clearly there is a bug in my code.
> 
>> Maybe it would make sense to introduce port->fixed_type in a separate patch.
>> As part of that patch you could explain why port->cap->type, ie a reflection
>> of the port capabilities, is no longer needed.
> 
> Or, I could make this really simple. I could just copy the content of
> the cap as is to another struct typec_capability during port
> registration. My goal is really just remove the need for the device
> drivers keep the struct typec_capability instance if they don't need
> it, and I don't need to remove the cap member to achieve that.
> 

Maybe just use devm_kmemdup() ?

Guenter

> Nevertheless, IMO this attribute file really needs to be deprecated.
> On top of making things unnecessarily complicated for the userspace,
> it's making it difficult to make changes to the rest of the class
> code. We may not be able to get rid of the file, but there is nothing
> preventing us from supplying a better solution as an option.
> 
