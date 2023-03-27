Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294C16C996D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Mar 2023 03:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjC0Byj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Mar 2023 21:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjC0Byi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Mar 2023 21:54:38 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2864EFF
        for <linux-usb@vger.kernel.org>; Sun, 26 Mar 2023 18:54:37 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R0t8cn018804;
        Mon, 27 Mar 2023 01:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F8N4S1mhFVwhT5xEe1qFV37O+bt+ZGPeL2fjE1LsIgA=;
 b=hXIL0fgvUdmvxIxXd0SLtUcN/wlJzVOHlygYwAXLk+4CCTkye5e9A6h1pfR6m5txvouq
 j4Z5LJ7VKpSdfiz5pQWAzncA4zDldLhkZ+3vaMHFDpg9lPNra2xGTXn4v60RYId0hw4s
 LMi3uyHa5J531jyo94PUwJth5LonkWOXej9pwIk6sHW1xUVR+7xE4623BnSW1wkf9Pwg
 7nhE7hlKZcjUvD/00NEvSs6HoazaQMqi05e3tOEq3gt/BfYrEpJzm+Rg87N1eeWQF1e+
 7nyBhezevIAz1GRBEqenVGBBTOUgX3KwPK63nkrVYR7KVLbIJimV73J7L8f8fppaHiP5 6w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pht50u1xn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 01:54:36 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32R1sF2f012149
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Mar 2023 01:54:15 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sun, 26 Mar
 2023 18:54:14 -0700
Message-ID: <951911a6-4ef7-00c8-a442-31336f472980@quicinc.com>
Date:   Mon, 27 Mar 2023 09:54:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] usb: gadget: f_fs: add dev name as prefix for
 pr_vdebug()
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679638227-20496-3-git-send-email-quic_linyyuan@quicinc.com>
 <ZB64J50M4RmkPJSD@kroah.com>
 <f5ca9b0d-8e15-c8e3-1b17-9a7bbc8bba04@quicinc.com>
 <ZB/mPh9cVCtp04k/@kroah.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ZB/mPh9cVCtp04k/@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0vpEpF3l-W9I73eeF5FKUMqlbWcL4pMf
X-Proofpoint-ORIG-GUID: 0vpEpF3l-W9I73eeF5FKUMqlbWcL4pMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=914
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270014
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/26/2023 2:29 PM, Greg Kroah-Hartman wrote:
> On Sun, Mar 26, 2023 at 10:55:18AM +0800, Linyu Yuan wrote:
>> On 3/25/2023 5:00 PM, Greg Kroah-Hartman wrote:
>>> On Fri, Mar 24, 2023 at 02:10:27PM +0800, Linyu Yuan wrote:
>>>> when multiple instances in use, the debug message is hard to understand
>>>> as there is no instance name show.
>>>>
>>>> this change will show each instance name for debug messages.
>>>>
>>>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>>>> ---
>>>> v2: split to several changes according to v1 comments
>>>> v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
>>>>
>>>>    drivers/usb/gadget/function/f_fs.c | 136 +++++++++++++++++++------------------
>>>>    1 file changed, 69 insertions(+), 67 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>>>> index a4051c8..df67ab5 100644
>>>> --- a/drivers/usb/gadget/function/f_fs.c
>>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>>> @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>>>>    static int __ffs_ep0_stall(struct ffs_data *ffs)
>>>>    {
>>>>    	if (ffs->ev.can_stall) {
>>>> -		pr_vdebug("ep0 stall\n");
>>>> +		pr_vdebug("%s: ep0 stall\n", ffs->dev_name);
>>> Again, no, please use dev_dbg() instead.  Do NOT roll your own debugging
>>> macros.  You have access to a struct device pointer for this device that
>>> the driver is controlling, so please always use that instead.
>>
>> thanks for your suggestion, i didn't know dev_dbg can accept NULL dev
>> pointer
>>
>> as this driver have no real struct device.
> That is not true, you have access to a struct usb_gadget, which is a
> struct device.  Use that please.

but this is not good, as for gadget/udc, from my view, there are two layer,

one configfs driver, one lower UDC, only after bind, there will be a 
reference to usb_gadget.

but configuration to driver can happen before bind, if so the usb_gadget 
will be NULL.


>
>> will change to dev_dbg with NULL dev pointer.
> No, that is pointless, please do not do that.
>
> thanks,
>
> greg k-h
