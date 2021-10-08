Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9AD42643F
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 07:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhJHFwS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 01:52:18 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37600 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229511AbhJHFwS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Oct 2021 01:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1633672223; x=1665208223;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vM2yWRUgCSoNDtC/zlVBTaopbFK8nOSNKAsgQnYkMQQ=;
  b=mUPvqrtAWI+HqJW72ydgzd5XK14ADcq91/kdRMYxPfjCm/yG4va7Q1p9
   SDLtb4sWy8ZsTyacZuWK1gAO3jmvv9TaGFXWHBG1cINT24FvZCLjGosOP
   3iKkOMgjF4qEf709b+tlVphap9vw6eXE/S56QfKll42KHSoofzG+NLC+i
   4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Oct 2021 22:50:23 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 22:50:23 -0700
Received: from [10.110.28.205] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Thu, 7 Oct 2021
 22:50:22 -0700
Subject: Re: [PATCH v5 3/3] usb: gadget: configfs: add some trace event
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Pham <quic_jackp@quicinc.com>
CC:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>, <linux-usb@vger.kernel.org>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-4-git-send-email-quic_linyyuan@quicinc.com>
 <YVwz/EY4A/y4rY48@kroah.com> <20211008005910.GA7123@jackp-linux.qualcomm.com>
 <YV/ZQNsLaPBLQYef@kroah.com>
From:   Trilok Soni <quic_tsoni@quicinc.com>
Message-ID: <4e80cc27-93a4-e317-96ba-db8fa2e4e821@quicinc.com>
Date:   Thu, 7 Oct 2021 22:50:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YV/ZQNsLaPBLQYef@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 10/7/2021 10:38 PM, Greg Kroah-Hartman wrote:
> On Thu, Oct 07, 2021 at 06:09:52PM -0700, Jack Pham wrote:
>> On Tue, Oct 05, 2021 at 01:16:12PM +0200, Greg Kroah-Hartman wrote:
>>> On Tue, Sep 07, 2021 at 09:09:37AM +0800, Linyu Yuan wrote:
>>
>>>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>>
>>>> diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
>>>> new file mode 100644
>>>> index 0000000..59d73d5
>>>> --- /dev/null
>>>> +++ b/drivers/usb/gadget/configfs_trace.h
>>>> @@ -0,0 +1,167 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
>>>
>>> Wrong copyright notice, right?  I could be wrong, but you might want to
>>> check...
>>
>> FYI this is correct.  Qualcomm is currently in transition and some
>> developers have started sending patches from a @quicinc.com email
>> address.  New files sent in this manner will be attributed using this
>> copyright notice (and is approved by our legal team).
> 
> Thanks for letting me know, is there some guideline as to what code gets
> what copyright during the "transition" phase?

1. For the new files added by QuIC using the quicinc ID will have this 
new copyright string.

2. If we are modifying the existing files having the LF copyright and if 
the contributions are significant then we will add this new copyright 
string as well. (if the patch is sent using this new quicinc ID).

---Trilok Soni
