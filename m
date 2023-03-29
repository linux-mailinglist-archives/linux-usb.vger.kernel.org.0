Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 363B56CD2B3
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 09:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjC2HLW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 03:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjC2HLU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 03:11:20 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB83199
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 00:11:20 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T3FB1n016227;
        Wed, 29 Mar 2023 07:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lwxpKwO8I6gxfZ7dROq3/KsBLVDkJengVjOF0eGSCms=;
 b=Sff1pKJ+li7NpCyygsJLj9sEKyNHr62zIINr5dI2bRFduZEHpflFpPmlXoD2cP8i1eX4
 M8ZoDxqEDNBCMPqI/13kRVQ8PrjydRCPHFxvZhMi/1etHurC9f/JcCsCYdtYAmtvX9mP
 IAWVhXwnWmK7N73QldQtbm+YGcCFPlRt0MaXsT+7M0FRhd235F/SJruxdCrf1iu0Ueo3
 h7hsDkRYIH3j45inmy20ZYxg064ASkDLfYN7d7sX1X8fIv/yVfTmrOerrdIYYpoUyNhy
 d9l1oSFRjXaTsmEB93ya/Bn9+iE951g5XIDu1Y/J4bx1Y/WQONwfzrsI7QnOwsUIr+li qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmd6ugdtk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 07:11:19 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32T7BIuo027883
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 07:11:18 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 29 Mar
 2023 00:11:17 -0700
Message-ID: <d01ae388-0768-420c-e244-8c270ccb00e4@quicinc.com>
Date:   Wed, 29 Mar 2023 15:11:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 6/6] usb: gadget: f_fs: show instance name in debug
 message
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <1679911940-4727-1-git-send-email-quic_linyyuan@quicinc.com>
 <1679911940-4727-6-git-send-email-quic_linyyuan@quicinc.com>
 <ZCPgr1SY94UuBfdX@kroah.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ZCPgr1SY94UuBfdX@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pyu6zANKr1oLUm9HHD7wgUIBDNCgDzg9
X-Proofpoint-ORIG-GUID: pyu6zANKr1oLUm9HHD7wgUIBDNCgDzg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_01,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=846
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290058
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/29/2023 2:54 PM, Greg Kroah-Hartman wrote:
> On Mon, Mar 27, 2023 at 06:12:20PM +0800, Linyu Yuan wrote:
>> show ffs->dev_name in all possible debug message.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>> v3: change according comments
>> v2: split to several changes according to v1 comments
>> v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
>>
>>   drivers/usb/gadget/function/f_fs.c | 141 ++++++++++++++++++++-----------------
>>   1 file changed, 75 insertions(+), 66 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 0761eaa..383343d 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>>   static int __ffs_ep0_stall(struct ffs_data *ffs)
>>   {
>>   	if (ffs->ev.can_stall) {
>> -		dev_vdbg(ffs->dev, "ep0 stall\n");
>> +		dev_vdbg(ffs->dev, "%s: ep0 stall\n", ffs->dev_name);
> You already have the name here, it's in the usb-gadget structure, why do
> you need to print it out again?
>
> What is the before and after output of this change?  I think it should
> have the same information already in it.


you have wrong understanding of usb_gadget->dev and ffs->dev_name,

this is output example,

[11.046519] configfs-gadget.g1 gadget.0: adb: interface descriptor

usb_gadget->dev is gadget.0,

but ffs->dev_name is adb.


>
> thanks,
>
> greg k-h
