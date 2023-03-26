Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92BEF6C9227
	for <lists+linux-usb@lfdr.de>; Sun, 26 Mar 2023 04:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjCZCsi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Mar 2023 22:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCZCsh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Mar 2023 22:48:37 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CB81715
        for <linux-usb@vger.kernel.org>; Sat, 25 Mar 2023 19:48:36 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32Q2eEsr002368;
        Sun, 26 Mar 2023 02:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nWtUWHkT5mB8Nf9jMt5QRXKBSyhs3voxTv8yOQefi6g=;
 b=ChYMFXdpiEK1+nwMAVi870vSMr2Eee1vcEnh7ZhHNA4NJcRz7IwCBzdfRGobV6YyNUCi
 DSiUldo9lMB3QVpQxI/JFR+y6p8iK201iUfZsXbL8kGrlOUX9QkDINV67lqpGlyexRnt
 S3iTNBcaIeGNT96bkSrtWQ9o/WtRsRjnmb1ql/pfSXpTF2YVY+/a5knmU0MrhEMSbqgq
 nJHBrfJJq5c90eghzytnVXn/HfZvGkUtqmvUy7aimxUiA/VobRNIF+tVsT1FJaCtu4iK
 QaXAA88hF4Y7hexVfFNRsD+NvcDPO+wNxQNtyFbyOGfB1ubI6lHpVFmpnwlkfp/yoTY+ ag== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3phte89gfg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 26 Mar 2023 02:48:35 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32Q2mYjO001510
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 26 Mar 2023 02:48:34 GMT
Received: from [10.253.35.171] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sat, 25 Mar
 2023 19:48:33 -0700
Message-ID: <1281090d-683e-59e1-b151-846b2bac63a6@quicinc.com>
Date:   Sun, 26 Mar 2023 10:48:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] usb: gadget: f_fs: remove ENTER() macro
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
 <ZB64iI7O3un0VbUL@kroah.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ZB64iI7O3un0VbUL@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jA_R0BdqyA5G33s4VVxPEwJ6jlhv424p
X-Proofpoint-ORIG-GUID: jA_R0BdqyA5G33s4VVxPEwJ6jlhv424p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=498 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303260018
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/25/2023 5:02 PM, Greg Kroah-Hartman wrote:
> On Fri, Mar 24, 2023 at 02:10:25PM +0800, Linyu Yuan wrote:
>> ENTER() used to show function name which called during runtime, ftrace can
>> be used to get same information, let's remove it.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>> v2: split to several changes according to v1 comments
>> v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
>>
>>   drivers/usb/gadget/function/f_fs.c | 94 --------------------------------------
>>   drivers/usb/gadget/function/u_fs.h |  2 -
>>   2 files changed, 96 deletions(-)
> As the kernel-test-bot points out, this patch does not build :(

it is truth that only build and test f_fs.c, didn't know there is 
another legacy driver use u_fs.h.


>
