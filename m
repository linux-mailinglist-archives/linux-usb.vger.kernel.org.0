Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3EA64D639
	for <lists+linux-usb@lfdr.de>; Thu, 15 Dec 2022 06:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiLOFff (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Dec 2022 00:35:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLOFfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Dec 2022 00:35:32 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB2655A93
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 21:35:30 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF4KK7r017477;
        Thu, 15 Dec 2022 05:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MTSZdedvbUzG5Iw5rzdvBCfKVu1apD3YE81PVtnYd5Q=;
 b=QhQlVQB5VmvH3PKyyQhky4d8r26cOe2ZaESb1rxHMnvNq+aV72BtScLGxfXXd+VgUTqv
 tPH0Fg7aOMvnBi57Ip/qZZyTYDwAdR39k8bH3v8ol4L+V5yw7cjMWh1YOwS5NGhZV23r
 d7VjS8Lh3kLZUNK32msDDRLqxiOpmMChql2AijgmulJRAv82ozXWTa+8vZ3rdpARvFtX
 awNppAP3xUFz+OpNlxuj4HpagxhTPhWXnjrYeqq7lNNKwIa/cowx4viCPNVQeoc0sNIv
 IneX4BSrZ1z45bkh2BjY4Xx/DTTRyWtH56RFkpwfBlScgSOHLwL9rRZUefAj249wyi/6 Hw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mfukhr856-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 05:35:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BF5ZQOJ024944
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Dec 2022 05:35:26 GMT
Received: from [10.252.214.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 14 Dec
 2022 21:35:23 -0800
Message-ID: <7841a017-92b6-8f81-d81c-41444e819584@quicinc.com>
Date:   Thu, 15 Dec 2022 11:05:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 0/2] usb: gadget: f_fs: Prevent race between
 functionfs_unbind & ffs_ep0_queue_wait
Content-Language: en-US
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
To:     John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <20221215052546.8761-1-quic_ugoswami@quicinc.com>
In-Reply-To: <20221215052546.8761-1-quic_ugoswami@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MMk8EWI2MPXI8pNIkv19wZZY_KjkLulj
X-Proofpoint-ORIG-GUID: MMk8EWI2MPXI8pNIkv19wZZY_KjkLulj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_02,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=454 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212150041
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,


On 12/15/22 10:55 AM, Udipto Goswami wrote:
> This series will prevent race between ep0_queue_wait &
> functionfs_unbind. Currently, both routines are running
> without any kind of serialization to make sure ep0req
> doesn't get corrupted.
> 
> Changes in v4:
> Split the implementation of v3 [1] into a series for better clarity.
> 
> Changes in v3:
> Moved dequeue out of mutex to prevent deadlock.
> 
> Changes in v2:
> Replaces spinlock with mutex & added dequeue operation in unbind.
> 
> [1]: https://patchwork.kernel.org/project/linux-usb/patch/20221125054119.25135-1-quic_ugoswami@quicinc.com/
> 
> Udipto Goswami (2):
>    usb: gadget: f_fs: Prevent race during ffs_ep0_queue_wait
>    usb: gadget: f_fs: Ensure ep0req is dequeued before free_request
> 
>   drivers/usb/gadget/function/f_fs.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
Please ignore this individual cover letter, sent out a v4 series with 
and updated cover letter.
Apologies for the confusion.

Thanks,
-Udipto
