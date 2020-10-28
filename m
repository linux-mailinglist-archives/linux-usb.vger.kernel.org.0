Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B05029D3E3
	for <lists+linux-usb@lfdr.de>; Wed, 28 Oct 2020 22:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgJ1Vrg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 17:47:36 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:41858 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727735AbgJ1Vre (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 17:47:34 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09SC6teG022522;
        Wed, 28 Oct 2020 13:26:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=0lu4VnSbANYdWZ6PjqxfBmOSgvGq3B4qJyATDLbX5Pg=;
 b=HcsiuNIiYClaSRzH3nVWaI6O9/Or8Kg2B6TOoUvgxARj9q2VLOlDl3/7RKC0NwdH6/Sd
 UrbYyLs5j3rpjFmnzLRRLZmoF7P1yxfFhjEzoZvNr4KeJNJfhHcX7eCikG9dOrEOEYRW
 qUymLHqNuAUmoFy2DK1ID+AOF5Dp0GMM+6kkf0sQDrsaLkPh6kUb2Gcz7AK/bwmCxprD
 UqAmHzQcZrnwPpafjwxBJe6Bx5Ukuu7SdnP9mbbfsBwtjD9SJBozxC0leUIorfaMuMem
 zLu99ClFtVz+BwUSegAQe8kgQBEial3YIDN76jc760rPdTYXvfSzBTZSsjDxY0qmI12Z ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34ccffhx0j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Oct 2020 13:26:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 309CF10002A;
        Wed, 28 Oct 2020 13:26:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1B682C41E2;
        Wed, 28 Oct 2020 13:26:14 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 13:26:14 +0100
Subject: Re: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20201023112412.GD282278@mwanda>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <625bf21d-e3bb-f952-9368-d93bee05a461@st.com>
Date:   Wed, 28 Oct 2020 13:26:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023112412.GD282278@mwanda>
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

On 10/23/20 1:24 PM, Dan Carpenter wrote:
> These variables are enums but in this situation GCC will treat them as
> unsigned so the conditions are never true.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/usb/typec/stusb160x.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
> index f7369e371dd4..da7f1957bcb3 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -545,7 +545,7 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
>   	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
>   	if (!ret) {
>   		chip->port_type = typec_find_port_power_role(cap_str);
> -		if (chip->port_type < 0) {
> +		if ((int)chip->port_type < 0) {
>   			ret = chip->port_type;
>   			return ret;
>   		}

I was preparing a patch for this one, and it uses the ret instead of the 
cast:
	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
	if (!ret) {
		ret = typec_find_port_power_role(cap_str);
		if (ret < 0)
			return ret;
		chip->port_type = ret;

	}

> @@ -567,9 +567,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
>   	if (!ret) {
>   		chip->pwr_opmode = typec_find_pwr_opmode(cap_str);
>   		/* Power delivery not yet supported */
> -		if (chip->pwr_opmode < 0 ||
> +		if ((int)chip->pwr_opmode < 0 ||
>   		    chip->pwr_opmode == TYPEC_PWR_MODE_PD) {
> -			ret = chip->pwr_opmode < 0 ? chip->pwr_opmode : -EINVAL;
> +			ret = (int)chip->pwr_opmode < 0 ? chip->pwr_opmode :
> +							  -EINVAL;
>   			dev_err(chip->dev, "bad power operation mode: %d\n",
>   				chip->pwr_opmode);
>   			return ret;
> 

	if (!ret) {
		ret = typec_find_pwr_opmode(cap_str);
		/* Power delivery not yet supported */
		if (ret < 0 || ret == TYPEC_PWR_MODE_PD) {
			dev_err(chip->dev, "bad power operation mode: %d\n", ret);
			return -EINVAL;
		}
		chip->pwr_opmode = ret;
	}


So, which fix sounds better ? IMHO using ret make the code more readable.

Regards,
Amelie
