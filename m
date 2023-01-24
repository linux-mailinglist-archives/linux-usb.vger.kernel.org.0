Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAF416791DA
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 08:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjAXHXk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 02:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbjAXHXj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 02:23:39 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758871204E
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 23:23:38 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30O6p2KN032156;
        Tue, 24 Jan 2023 07:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ajs5ryTm7mtwQupWxTDwEeRrDO3Us/8HAWUoQvW66Mk=;
 b=fI6ByVIkdvpO/qFjf3EiOPig8ok6SMVNXd26xArwON3Aa0BHa1TMQf7SYFeJXOXlUvcS
 18qH4m1G3ZOpwNGfDV7YRgJIjQCPY+Yj0oLXWY8GLtJcIcQxivRLWZkjCNYK2wrJ9Xy7
 2UekbG64thE1ZauM2FlfMmae97OglWQgyqVKIVVsUiQ2oEESKvFIdpZwHccjgQUPPajO
 jlgp575QWMAvSm/FhB/3+AvV9WEs83S2M6TEu283k2+5/eLSaQbnIvCPXsFAwCGugZ82
 e/aB9/F+oS90b8LNVph6M+OAciqdKkD5WLk4J4U0gVIQlVBq4BV/TQoOe0cNrzuaQT4m gA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89fm4meh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 07:23:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30O7Nax5007259
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 24 Jan 2023 07:23:36 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 23 Jan
 2023 23:23:34 -0800
Message-ID: <c204d6fe-f92b-f563-d42f-63b2be2f0886@quicinc.com>
Date:   Tue, 24 Jan 2023 12:53:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [bug report] usb: gadget: f_fs: Prevent race during
 ffs_ep0_queue_wait
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
CC:     <linux-usb@vger.kernel.org>
References: <Y89kVv5jaw7hF/fv@kili>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <Y89kVv5jaw7hF/fv@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hyKu0gzywRYm9O54vI9n0HBZVvPM8gjc
X-Proofpoint-GUID: hyKu0gzywRYm9O54vI9n0HBZVvPM8gjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=579
 mlxscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301240067
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

On 1/24/23 10:23 AM, Dan Carpenter wrote:
> Hello Udipto Goswami,
> 
> The patch 6a19da111057: "usb: gadget: f_fs: Prevent race during
> ffs_ep0_queue_wait" from Dec 15, 2022, leads to the following Smatch
> static checker warning:
> 
> 	drivers/usb/gadget/function/f_fs.c:313 __ffs_ep0_queue_wait()
> 	warn: inconsistent returns '&ffs->ev.waitq.lock'.
> 
> drivers/usb/gadget/function/f_fs.c
>      276 static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>      277         __releases(&ffs->ev.waitq.lock)
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>      278 {
>      279         struct usb_request *req = ffs->ep0req;
>      280         int ret;
>      281
>      282         if (!req)
>      283                 return -EINVAL;
>                          ^^^^^^^^^^^^^^^
> Drop the lock before returning?
Thanks for pointing this out.
I assumed the caller was handling this however its not the case. will 
fix it like this :

@@ -279,8 +279,10 @@ static int __ffs_ep0_queue_wait(struct ffs_data 
*ffs, char *data, size_t len)
         struct usb_request *req = ffs->ep0req;
         int ret;

-       if (!req)
+       if (!req) {
+               spin_unlock_irq(&ffs->ev.waitq.lock);
                 return -EINVAL;
+       }

         req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);


> 
>      284
>      285         req->zero     = len < le16_to_cpu(ffs->ev.setup.wLength);
>      286
>      287         spin_unlock_irq(&ffs->ev.waitq.lock);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>      288
>      289         req->buf      = data;
>      290         req->length   = len;
>      291
>      292         /*
>      293          * UDC layer requires to provide a buffer even for ZLP, but should
>      294          * not use it at all. Let's provide some poisoned pointer to catch
>      295          * possible bug in the driver.
>      296          */
>      297         if (req->buf == NULL)
>      298                 req->buf = (void *)0xDEADBABE;
>      299
>      300         reinit_completion(&ffs->ep0req_completion);
>      301
>      302         ret = usb_ep_queue(ffs->gadget->ep0, req, GFP_ATOMIC);
>      303         if (ret < 0)
>      304                 return ret;
>      305
>      306         ret = wait_for_completion_interruptible(&ffs->ep0req_completion);
>      307         if (ret) {
>      308                 usb_ep_dequeue(ffs->gadget->ep0, req);
>      309                 return -EINTR;
>      310         }
>      311
>      312         ffs->setup_state = FFS_NO_SETUP;
> --> 313         return req->status ? req->status : req->actual;
>      314 }
> 
> regards,
> dan carpenter

Thanks,
-Udipto
