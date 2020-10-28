Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126D929D452
	for <lists+linux-usb@lfdr.de>; Wed, 28 Oct 2020 22:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgJ1VvS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 17:51:18 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:30492 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728154AbgJ1VvR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 17:51:17 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09SCR3Vw026363;
        Wed, 28 Oct 2020 13:29:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=J0fT/Pr0SqznTWsYwQ3WSc2L6sAJOVcgXB3ekg2CHdg=;
 b=gMRn2fpoNmEzuhpxUTzc5VN+TB1BDz5XQ1K8sXmEw+Q63ceLh8FYQQJxAiE3C711LkCi
 3q7Ubf/OdZWQ5+SCioLMvIC8koSpQkpBNE69HP4WXyIBBO6VhKDrlAc5K2v3nV2DpgAx
 spS3AUdwqLXfY01JxLImJjxDPK3CJGyMruKfxDt9Ry0mHeqTMf7zwp/TilGcL3ZNJ4uj
 WSR+fpihBMFYKfXV4YDmAiSt62jLcx5xFKYfN9xKdVzNA5C8YqkMvQvds9WyAwHrNV/I
 HFgWHV7hye54JmcEK/dcfDkxivypXcf7JKUSZky1e3k88q7pVNZrwk1VEY0cbhomIRgP Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34ccf3sat1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Oct 2020 13:29:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 203A010002A;
        Wed, 28 Oct 2020 13:29:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15A232C38DA;
        Wed, 28 Oct 2020 13:29:16 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 13:29:15 +0100
Subject: Re: [PATCH 1/2 v2] usb: typec: stusb160x: fix an IS_ERR() vs NULL
 check in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20201023114017.GE18329@kadam>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <24d4a1f5-89fa-114d-8e3d-66d40d5dd1a6@st.com>
Date:   Wed, 28 Oct 2020 13:29:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023114017.GE18329@kadam>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-28_06:2020-10-26,2020-10-28 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Thanks for the patch!

On 10/23/20 1:40 PM, Dan Carpenter wrote:
> The typec_register_port() function doesn't return NULL, it returns error
> pointers.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@st.com>

> ---
> v2: Fix a typo in the commit message.  s/return error pointers/return NULL/.
>      Thanks, Walter!
> 
>   drivers/usb/typec/stusb160x.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index ce0bd7b3ad88..f7369e371dd4 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -729,8 +729,8 @@ static int stusb160x_probe(struct i2c_client *client)
>   	}
>   
>   	chip->port = typec_register_port(chip->dev, &chip->capability);
> -	if (!chip->port) {
> -		ret = -ENODEV;
> +	if (IS_ERR(chip->port)) {
> +		ret = PTR_ERR(chip->port);
>   		goto all_reg_disable;
>   	}
>   
> 
