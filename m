Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7A91D9813
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 15:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgESNoI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 09:44:08 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:39968 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgESNoH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 09:44:07 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04JDfQuK137153;
        Tue, 19 May 2020 13:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Rb1x7m4qFJOPWiauQWrqgeQz3qkWJE4bg1bdyQsTBzM=;
 b=zg8JfBaIz80lju+EJ8wA3xhQxIHDisjqZFXONqDvAO51LwJGrTD5Vkm96XceWrTJHD70
 31RImRijsjigDfTwIeJIQTXBrioc7M8ENxD0IvaEVGlFLkOGNlMsq6v6TgzVXFIDTxUV
 b5tT2VXWvzmaRUrSQbuJVgndeMuGIbFjPM734NTGoZpC1SzznGJMD1zyOfRw8bRGA1/p
 +xY2+WsQY7y90hcTMdo4tyTci3RoHHO1JdNKKxDzlojbHNQ8boKE58UOnl3sySJ6KDrl
 vy4cfNyKS5ATYhEOVbgBEhQ4b2t1EBnFgj2E/iO6U6MV3Z3JnulhV3XBsj0Tc6G6rj/k sw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 3128tndbgq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 May 2020 13:44:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04JDgYON059723;
        Tue, 19 May 2020 13:44:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 313gj1pr9h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 May 2020 13:44:02 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04JDi1qT028547;
        Tue, 19 May 2020 13:44:02 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 19 May 2020 06:44:01 -0700
Date:   Tue, 19 May 2020 16:43:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christian Gromm <christian.gromm@microchip.com>
Cc:     gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/8] drivers: most: usb: use dev_dbg function
Message-ID: <20200519134355.GQ2078@kadam>
References: <1589449976-11378-1-git-send-email-christian.gromm@microchip.com>
 <1589449976-11378-6-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589449976-11378-6-git-send-email-christian.gromm@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9625 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005190123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9625 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 cotscore=-2147483648 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005190122
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 11:52:53AM +0200, Christian Gromm wrote:
> This patch replaces the functions dev_notice with dev_dbg to silence
> the driver during normal operation.
> 
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2:
> 
>  drivers/most/most_usb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
> index 1655fcd..35620a1 100644
> --- a/drivers/most/most_usb.c
> +++ b/drivers/most/most_usb.c
> @@ -1129,13 +1129,13 @@ hdm_probe(struct usb_interface *interface, const struct usb_device_id *id)
>  		init_usb_anchor(&mdev->busy_urbs[i]);
>  		spin_lock_init(&mdev->channel_lock[i]);
>  	}
> -	dev_notice(dev, "claimed gadget: Vendor=%4.4x ProdID=%4.4x Bus=%02x Device=%02x\n",
> +	dev_dbg(dev, "claimed gadget: Vendor=%4.4x ProdID=%4.4x Bus=%02x Device=%02x\n",
>  		   le16_to_cpu(usb_dev->descriptor.idVendor),
>  		   le16_to_cpu(usb_dev->descriptor.idProduct),
>  		   usb_dev->bus->busnum,
>  		   usb_dev->devnum);

All the parameters aren't aligned now.

regards,
dan carpenter

