Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A381515540A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 09:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgBGIya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 03:54:30 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7380 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726642AbgBGIya (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 03:54:30 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0178m6wE008393;
        Fri, 7 Feb 2020 09:52:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=rYjNeaGdTWhcxGDmeEm8nbgycO6fBnrUn/72chFCcWo=;
 b=nzWCJf1ulG/QQQNwZpRZosZS7XtwKHTNtFfpkycA9cF6vYV8M7LFfY3zts0kk63m80ed
 kGuoRNT3JGBOpa+D1qmnOA8CKz69/0jBBUKPslubm6o8sbT9LLYnqtjbsvjuoBlMvGgK
 wei6SKLw7CluMaBrzK3VcujIvBgVYkLrrCqGGlalpt5Y34hCNMvoT+etCm3W91VeQWJ8
 LfsqvjWFehTXzw6JQmHiR6bg0To5vwclfq2SIsREL0VYR/ir4OUzn28BmrrJIYV8tKpZ
 jklOzLzEKoOm36iPiwJ+QkI3qOOcyT3HxSlRsm5PxOQJZkp08a4s3oqQjVozQoOsCya7 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xyhkbqpd2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Feb 2020 09:52:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CA1B100034;
        Fri,  7 Feb 2020 09:52:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E46E21FE81;
        Fri,  7 Feb 2020 09:52:18 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 7 Feb
 2020 09:52:17 +0100
Subject: Re: [Bug 206435] dwc3 dwc3.3.auto: no usb2 phy configured
To:     Felipe Balbi <balbi@kernel.org>,
        <bugzilla-daemon@bugzilla.kernel.org>, <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <bug-206435-208809@https.bugzilla.kernel.org/>
 <bug-206435-208809-nsmttjrqU7@https.bugzilla.kernel.org/>
 <87d0ar5zyq.fsf@kernel.org> <87a75v5zwz.fsf@kernel.org>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <b38b41ed-7193-4b4b-7a40-75105714af0d@st.com>
Date:   Fri, 7 Feb 2020 09:52:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87a75v5zwz.fsf@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-06_04:2020-02-06,2020-02-06 signatures=0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

On 2/6/20 7:33 PM, Felipe Balbi wrote:
> 
> + Heikki, since this is, apparently, Bay Trail
> 
> Felipe Balbi <balbi@kernel.org> writes:
> 
>> Hi,
>>
>> bugzilla-daemon@bugzilla.kernel.org writes:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=206435
>>>
>>> --- Comment #3 from youling257@gmail.com ---
>>> Revert 987351e1ea7772cf2f0795e917fb33b2e282e1c1 phy: core: Add consumer device
>>> link support, dwc3 work for my z3735f device.
>>>
>>> android_x86:/ $ su
>>> android_x86:/ # dmesg | grep dwc
>>> [    9.724606] dwc3 dwc3.3.auto: changing max_speed on rev 5533210a
>>> [   47.488501] udc dwc3.3.auto: registering UDC driver [g1]
>>
>> reverting that commit makes dwc3 work? Then you don't have a bug on
>> dwc3. You have a regression caused by another commit.
>>
>> Alexandre, any idea what's going on?
> 

It's probably due to error returned by "device_link-add" function called 
in phy-get (phy-core.c). Maybe because phy dev is not present. I wonder 
if we should update device_link_add error management in phy-get (if link 
add fails it's maybe not a reason to make the consumer probe fail)

regards
Alex

> Heikki, any ideas?
> 
