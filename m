Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC208D595
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 16:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfHNOGl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 10:06:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42452 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbfHNOGk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Aug 2019 10:06:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EE49M5084593;
        Wed, 14 Aug 2019 14:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=IDQ50EeNCPaU8nHr7FfbOsMF7WtlRH3qJ5mn7Fsl8DI=;
 b=BpL0Wo9maA+PEDDDCUnYxfXyyCr23+XRR2I9ZfdNM9aFMzRBl4XJe6EUF9wTJ3JD4bhO
 kn/nftKRFyG1wDW/33f4EEaFSeBeClQR3ifvEUj/b0U9wS99wArQsiPWfTRMmZIUGCCx
 3BpST4AGOuWfUHYY/V40r+ONuO9Wihm5fwfdpnWnZeCBmSdcSc8ZAFyJTkSFJrdl1Nji
 8VgTZSPV9ot7N6OxxpDGSk/eEHQ3nJ/F972ZJiuYqMHlpC1ONTjgRgekb2BBzditGnoq
 bO7CYuS74Wx7MEu1+VVmUTDpVPuB7opCLUSDQ9Ero/F6K8B6LPbsP5Ih3pbDGFD0A/27 cg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2u9pjqmx31-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Aug 2019 14:06:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7EE3OYJ017806;
        Wed, 14 Aug 2019 14:04:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2ubwqt8rpc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Aug 2019 14:04:24 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7EE4NXX025012;
        Wed, 14 Aug 2019 14:04:23 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 14 Aug 2019 07:04:23 -0700
Date:   Wed, 14 Aug 2019 17:04:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: host: ohci-pxa27x: Fix and & vs | typo
Message-ID: <20190814140414.GU1974@kadam>
References: <20180223123300.GA1062@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180223123300.GA1062@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=796
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908140146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=847 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908140146
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I was looking at this code again today and I'm still convinced this
patch is correct.  Should I resend?

regards,
dan carpenter

On Fri, Feb 23, 2018 at 03:33:00PM +0300, Dan Carpenter wrote:
> The code is supposed to clear the RH_A_NPS and RH_A_PSM bits, but it's
> a no-op because of the & vs | typo.  This bug predates git and it was
> only discovered using static analysis so it must not affect too many
> people in real life.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.
> 
> diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
> index 3e2474959735..7679fb583e41 100644
> --- a/drivers/usb/host/ohci-pxa27x.c
> +++ b/drivers/usb/host/ohci-pxa27x.c
> @@ -148,7 +148,7 @@ static int pxa27x_ohci_select_pmm(struct pxa27x_ohci *pxa_ohci, int mode)
>  		uhcrhda |= RH_A_NPS;
>  		break;
>  	case PMM_GLOBAL_MODE:
> -		uhcrhda &= ~(RH_A_NPS & RH_A_PSM);
> +		uhcrhda &= ~(RH_A_NPS | RH_A_PSM);
>  		break;
>  	case PMM_PERPORT_MODE:
>  		uhcrhda &= ~(RH_A_NPS);
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
