Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2B4330E90
	for <lists+linux-usb@lfdr.de>; Mon,  8 Mar 2021 13:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhCHMmT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Mar 2021 07:42:19 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51814 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230412AbhCHMmH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Mar 2021 07:42:07 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 128CQ37u015281;
        Mon, 8 Mar 2021 13:41:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=q4Og1DTuj4AmqoLOPeO+Mv8KCeiKCxD1plojT8t5syw=;
 b=IotTJR0pmh87F3YLviwE+/CkomaqbKYV9eORHK8aWOmfeSdngAtZ20Vsi838WURr9+X8
 08kkYDklhdrjlya59u7H5AKEgakCmZAsnmESGZDZ0zGdWksfo0wAewNR+XSLF41EWzxT
 Mx15ADOFPDdQEJc+bdwgur042Z1tjqeLfIqVkHq2ZKJgRzLbgAKtSB4IaMHW02bMvYMa
 PIRp6KXuPMpWmTcQB8FucLpvHj+Gy/MM2B8AS5cXZFG3T8ktphlKzYeZx2pQ2FZTBJAE
 OvcgQw82z21Uj3c6tnZr+Ssvl30EbkY7ZT3i4uHU3JGqX1wT7azQwolUcjpywQWqp9/O TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3741y6jh8g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Mar 2021 13:41:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D67B9100038;
        Mon,  8 Mar 2021 13:41:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6799271189;
        Mon,  8 Mar 2021 13:41:48 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Mar
 2021 13:41:27 +0100
Subject: Re: [PATCH -next] usb: typec: stusb160x: fix return value check in
 stusb160x_probe()
To:     'Wei Yongjun <weiyongjun1@huawei.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Amelie Delaunay <amelie.delaunay@st.com>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20210308094839.3586773-1-weiyongjun1@huawei.com>
From:   Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <9810d761-5ce2-79f5-7956-d9d650fe7210@foss.st.com>
Date:   Mon, 8 Mar 2021 13:41:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210308094839.3586773-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-08_07:2021-03-08,2021-03-08 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/8/21 10:48 AM, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function device_get_named_child_node() returns
> NULL pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks for the patch,
Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/usb/typec/stusb160x.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index d21750bbbb44..6eaeba9b096e 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -682,8 +682,8 @@ static int stusb160x_probe(struct i2c_client *client)
>   	}
>   
>   	fwnode = device_get_named_child_node(chip->dev, "connector");
> -	if (IS_ERR(fwnode))
> -		return PTR_ERR(fwnode);
> +	if (!fwnode)
> +		return -ENODEV;
>   
>   	/*
>   	 * When both VDD and VSYS power supplies are present, the low power
> 
