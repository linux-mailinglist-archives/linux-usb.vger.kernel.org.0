Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBEE6338F3
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 10:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233280AbiKVJsP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 04:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbiKVJsL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 04:48:11 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E8EBD4
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 01:48:10 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM8UPG3030631;
        Tue, 22 Nov 2022 09:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/eM3oScW0b9L6+wI6hkrllQMZYdupknXLPNfTlvclIY=;
 b=BghZszaNqpwiGJe6Zq0lm5SKhGo3IS89lL49ud/dPOf/dqOeOVSnfPOQuCrvf86MuKd4
 uwSiMvivxAqVjAoo0MuExdmhEXNXpGsZ8oBQ+fM9WRemIe2Kfl0aJfcgfIodXhfwMV2i
 1i35q7EJHxSu7kuy9uknYZvg9hGC1eir2V8qUggOpm97HcNaSxkPAtWn9wcS0E0z2uUR
 LKBkxo31AmVJGf1LI+0E2moxeg7qTpytdvLqzD/QXAtZxzckLokrI5TycEaEeN7sC0hL
 +wAKat0k/hYL/liomAPa7RdV3t/AMndbwbkGDigRaWiLsU3nGJ5nM0JZa5sBu+80JD1D og== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m0tycg7e5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Nov 2022 09:48:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AM9m7rW014459
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Nov 2022 09:48:07 GMT
Received: from [10.206.25.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 22 Nov
 2022 01:48:04 -0800
Message-ID: <21de2d7a-1955-c9ea-3d6c-02932d16a379@quicinc.com>
Date:   Tue, 22 Nov 2022 15:18:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: dwc3: ep0: Add implementation of ep0_dequeue
 separately
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>
References: <20221117054917.30104-1-quic_ugoswami@quicinc.com>
 <20221118020141.fjngcaovttbzkbvv@synopsys.com>
 <93e1a840-6d9f-9a6a-d848-d006f1333d18@quicinc.com>
 <20221122013033.if667zpm2p47he6r@synopsys.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20221122013033.if667zpm2p47he6r@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _lCQmMPriH-_68zkHJKeOoKl-_uNtXjH
X-Proofpoint-ORIG-GUID: _lCQmMPriH-_68zkHJKeOoKl-_uNtXjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220072
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,


On 11/22/22 7:00 AM, Thinh Nguyen wrote:
> Hi Udipto,
> 
> On Fri, Nov 18, 2022, Udipto Goswami wrote:
>> Hi Thinh
>>
>> On 11/18/22 7:31 AM, Thinh Nguyen wrote:
>>> On Thu, Nov 17, 2022, Udipto Goswami wrote:
>>>> A dequeue for ep0 need to adjust the handling based on the
>>>> data stage and status stage. Currently if ep0 is in data/status
>>>> stage the handling isn't that different, driver will try giveback
>>>> as part of dequeue process which might potentially lead to the
>>>> controller accessing invalid trbs.
>>>>
>>>> Also for ep0 the requests aren't moved into the started_list,
>>>> which might potentially lead to the un-mapping of the request
>>>> buffers without sending endxfer.
>>>
>>> Maybe we need to track started_list for control endpoint? If the request
>>> isn't prepared yet or that the transfer had completed, then there's no
>>> need to issue End Tranfer command.
>>>
>>> But I believe sending End Transfer for inactive endpoint should be fine
>>> also. Then we maybe able to get away without checking the started list.
>>> If you're planning to do that, please test and note it somewhere.
>>>
>>>>
>> thanks for the suggestion, sure i'll do some more experiments and confirm
>> it.
>>
> 
> Just curious, how do you hit/test this scenario?
> 
> For other endpoint types, I can see possible scenarios where a dequeue
> may be needed, but I don't see one for control transfer.
> 
> The host can cancel the control transfer, and the controller will see
> "setup_packet_pending" and handle accordingly. If there's a disconnect,
> that's also handled separately by the controller driver also. So, where
> does ep0_dequeue come into play here?
> 
adding the reference to other thread [1]

[1]: https://www.spinics.net/lists/linux-usb/msg233862.html

was trying to address a race condition in the ffs driver where 
ep_dequeue was suggested, before freeing the request dequeue it.

as per the current code, since ep0 req isn't moved to started list
therefore it will exit from this in ep_dequeue:

list_for_each_entry(r, &dep->pending_list, list) {
                    if (r == req) {
                            dwc3_gadget_giveback(dep, req, -ECONNRESET);
                             goto out;
                     }
             }

but if the ep0 is in data/status phase technically it is still active.
We will unmap the buffer and giveback then the ep0 is in data/status stage.

This could potentially happen right?

The intent of a separate dequeue was to address that scenario when the 
data/status phase isn't completed.
Hope this give some clarity.

Thanks,
-Udipto

> Thanks,
> Thinh
