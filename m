Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D431666EF4
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 11:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239247AbjALKCb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 05:02:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbjALKAq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 05:00:46 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C1F632F
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 01:59:47 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30C8Bf1B010798;
        Thu, 12 Jan 2023 09:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dvk7+8zvlslP/bK6lIEWmob1Zz9yokXxJlrgaDo09MA=;
 b=a1Zdqj6ItUquEp7Klz7e6BhGKKHzTCVWJjTyFd1bV4OSLH3mH8U9qtut4JHUoO39foSv
 qw1hhYu4fYEzHM545IGcOdFFYFXnLpUSg8KnWx6iA5eu2Fo7o+2A9LPz+0k+Vnl1wK+G
 YeKQHXDsIKUYVOQ/0tRgLBgubIeiGKMgsMpQdH5xY+akaGwnd5zzO8KDcBjBe4puQk3q
 W4O3X5jYoZvjjsNYbMyOOQdTeg/Xv0GLn9pO6BgvYceGBcPeeBmhOMF29etsXVbmZy9H
 H+mEIInZF70Al6wLVDu7L81Xd56w+p0GZWFTwqsCTGjFewaf3lGLlfX8cRwB+lUp3amZ 5Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1kbqbjrt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Jan 2023 09:59:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30C9xgk4031327
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Jan 2023 09:59:42 GMT
Received: from [10.216.42.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 01:59:39 -0800
Message-ID: <8afdf13f-8dd5-2102-680f-c364f99ce7ca@quicinc.com>
Date:   Thu, 12 Jan 2023 15:29:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 0/2] usb: gadget: f_fs: Prevent race between
 functionfs_unbind & ffs_ep0_queue_wait
Content-Language: en-US
To:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <20221215052906.8993-1-quic_ugoswami@quicinc.com>
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <20221215052906.8993-1-quic_ugoswami@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M9LDSTj0A1V-IFFU6X1so7sKLcPAVNjr
X-Proofpoint-ORIG-GUID: M9LDSTj0A1V-IFFU6X1so7sKLcPAVNjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_06,2023-01-11_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=513 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120070
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 12/15/2022 10:59 AM, Udipto Goswami wrote:
> This series will prevent race between ep0_queue_wait &
> functionfs_unbind. Currently, both routines are running
> without any kind of serialization to make sure ep0req
> doesn't get corrupted.
> 
> Changes in v4:
> Split the implementation of v3 [1] into a series for better clarity.
> Also, tested the patches by running USB plug-in/plug-out along with
> composition switch.
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

Series tested on SM8450.

Tested-by: Krishna Kurapati <quic_kriskura@quicinc.com>

Thanks,
Krishna,
