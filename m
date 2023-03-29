Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E656CD509
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 10:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbjC2IrG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 04:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjC2IrF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 04:47:05 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC261995
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 01:47:03 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T0wLpk023463;
        Wed, 29 Mar 2023 08:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=PSlj8MvXd+wnfY5k35hje3gQ6hlvsVqRFhDVNdVixxc=;
 b=SafoOui8VsFC6wmSc3qC+gpdEwPCRwMTpuJyO2NmRL2dXhuKE9Z362qQ1uoxL33WiggN
 nRuNJuEPeguQpEIKtwGimDZ3kKU1SXmkIhhpsOH9biUc8eFxfUp0r1emTdoh1H4Op+5z
 J4XL1EkBKEvPB6qVCW43hn5eZ8nOkm126918duoGE4NbVvhVppMFH8xhlmBlYHbUqbOD
 jIvDaNL+9BHIEtfjwwhGEOUL44KJzqv59NIfbMsrm3xZw5Sed4U55JNPZn/lbc2v0ssX
 dliEuXk/d/NTshkWzHgkxEN5GmzxoKPN9Lk+wh4ENFb5CKlOBHFcbyefeJxmnuxcKrKr qg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmb8h0v6c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 08:47:01 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32T8l1Or020484
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Mar 2023 08:47:01 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 29 Mar
 2023 01:47:00 -0700
Message-ID: <ec3e3b18-47ee-ab88-077a-94cc2fc838ff@quicinc.com>
Date:   Wed, 29 Mar 2023 16:46:57 +0800
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
 <d01ae388-0768-420c-e244-8c270ccb00e4@quicinc.com>
 <ZCPqzTXHJJRUTCvc@kroah.com>
 <c9d9b452-d6d9-027a-b1fa-ee3471689bca@quicinc.com>
 <ZCP1D16oOaGZowCz@kroah.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ZCP1D16oOaGZowCz@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F9iNNeAnjIZCo9WF72UpjFmDx5CGpugp
X-Proofpoint-GUID: F9iNNeAnjIZCo9WF72UpjFmDx5CGpugp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_02,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290071
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/29/2023 4:21 PM, Greg Kroah-Hartman wrote:
> On Wed, Mar 29, 2023 at 03:42:08PM +0800, Linyu Yuan wrote:
>> On 3/29/2023 3:37 PM, Greg Kroah-Hartman wrote:
>>> On Wed, Mar 29, 2023 at 03:11:14PM +0800, Linyu Yuan wrote:
>>>> On 3/29/2023 2:54 PM, Greg Kroah-Hartman wrote:
>>>>> On Mon, Mar 27, 2023 at 06:12:20PM +0800, Linyu Yuan wrote:
>>>>>> show ffs->dev_name in all possible debug message.
>>>>>>
>>>>>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>>>>>> ---
>>>>>> v3: change according comments
>>>>>> v2: split to several changes according to v1 comments
>>>>>> v1: https://lore.kernel.org/linux-usb/1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com/
>>>>>>
>>>>>>     drivers/usb/gadget/function/f_fs.c | 141 ++++++++++++++++++++-----------------
>>>>>>     1 file changed, 75 insertions(+), 66 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>>>>>> index 0761eaa..383343d 100644
>>>>>> --- a/drivers/usb/gadget/function/f_fs.c
>>>>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>>>>> @@ -317,12 +317,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>>>>>>     static int __ffs_ep0_stall(struct ffs_data *ffs)
>>>>>>     {
>>>>>>     	if (ffs->ev.can_stall) {
>>>>>> -		dev_vdbg(ffs->dev, "ep0 stall\n");
>>>>>> +		dev_vdbg(ffs->dev, "%s: ep0 stall\n", ffs->dev_name);
>>>>> You already have the name here, it's in the usb-gadget structure, why do
>>>>> you need to print it out again?
>>>>>
>>>>> What is the before and after output of this change?  I think it should
>>>>> have the same information already in it.
>>>> you have wrong understanding of usb_gadget->dev and ffs->dev_name,
>>>>
>>>> this is output example,
>>>>
>>>> [11.046519] configfs-gadget.g1 gadget.0: adb: interface descriptor
>>>>
>>>> usb_gadget->dev is gadget.0,
>>>>
>>>> but ffs->dev_name is adb.
>>> Isn't there some mapping of gadget name to "dev_name" somewhere else in
>>> the logs?  And what sets dev_name, why isn't that part of the gadget
>>> name already?
>>
>> ffs->dev_name should be different from gadget name,
>>
>> as we can create multiple ffs instances (adb, MTP, PTP ...) which work on
>> one gadget device (gadget.0).
> Shouldn't all of those instances have their own struct device pointer?


no, there is no need, it is not a real device, just used for mount 
operation and differentiate

each instance.


>
> thanks,
>
> greg k-h
