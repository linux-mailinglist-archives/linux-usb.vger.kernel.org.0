Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2AA129D2FD
	for <lists+linux-usb@lfdr.de>; Wed, 28 Oct 2020 22:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgJ1Vj7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 17:39:59 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22240 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727133AbgJ1Vjq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 17:39:46 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09SEW77F011993;
        Wed, 28 Oct 2020 15:38:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=LjybO3b4orhU3lT/78Ag9RW2YKS0sCHp+s/asyWXXi0=;
 b=d5PUYfMDeAE4mhJARCgFndzwCsc4FfmlB8gf1PfrvybFdzGtW4v2d+AQ65DPDThpysru
 icXQ+FLo6I0J01djLuMUcQzracsMa2pq2R+/HHJ2BOxmiIdO0aS6zyurfvNLhMtc4avr
 zciOowJkX6PlWsK79/9jot/vHAHeptrB1WmWgmjZstlA18P5a7dGBiP6q+GvR6NChAzV
 l1RS0fW1wufl0bDIKVoo8BN9JKjHOJNXQ6ej9WZBDlj36QLnJPPUvQTM+mBK7j3zoB6Y
 mXV0oxTZiO10s5YtRoLJcxwCtafaXlbs5FBFzlqNMJLl2BnVYWMrGDXNnBKXKpcnE7+m 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34ccmr2qy9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Oct 2020 15:38:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBD5C10002A;
        Wed, 28 Oct 2020 15:38:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A2D024BDCC;
        Wed, 28 Oct 2020 15:38:53 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 15:38:52 +0100
Subject: Re: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20201023112412.GD282278@mwanda>
 <625bf21d-e3bb-f952-9368-d93bee05a461@st.com> <20201028132346.GP18329@kadam>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <9e3c4790-13d5-371a-52c9-8945faff66ab@st.com>
Date:   Wed, 28 Oct 2020 15:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028132346.GP18329@kadam>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-28_07:2020-10-28,2020-10-28 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

I know I'm a bit late for the review, but is it still possible to fixup 
this patch in your usb-linus branch?

Regards,
Amelie

On 10/28/20 2:23 PM, Dan Carpenter wrote:
> On Wed, Oct 28, 2020 at 01:26:16PM +0100, Amelie DELAUNAY wrote:
>>> @@ -567,9 +567,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
>>>    	if (!ret) {
>>>    		chip->pwr_opmode = typec_find_pwr_opmode(cap_str);
>>>    		/* Power delivery not yet supported */
>>> -		if (chip->pwr_opmode < 0 ||
>>> +		if ((int)chip->pwr_opmode < 0 ||
>>>    		    chip->pwr_opmode == TYPEC_PWR_MODE_PD) {
>>> -			ret = chip->pwr_opmode < 0 ? chip->pwr_opmode : -EINVAL;
>>> +			ret = (int)chip->pwr_opmode < 0 ? chip->pwr_opmode :
>>> +							  -EINVAL;
>>>    			dev_err(chip->dev, "bad power operation mode: %d\n",
>>>    				chip->pwr_opmode);
>>>    			return ret;
>>>
>>
>> 	if (!ret) {
>> 		ret = typec_find_pwr_opmode(cap_str);
>> 		/* Power delivery not yet supported */
>> 		if (ret < 0 || ret == TYPEC_PWR_MODE_PD) {
>> 			dev_err(chip->dev, "bad power operation mode: %d\n", ret);
>> 			return -EINVAL;
>> 		}
>> 		chip->pwr_opmode = ret;
>> 	}
>>
>>
>> So, which fix sounds better ? IMHO using ret make the code more readable.
> 
> Yeah.  Your patch is nicer, but Greg *just* merged mine so it might
> be too late...
> 
> regards,
> dan carpenter
> 
