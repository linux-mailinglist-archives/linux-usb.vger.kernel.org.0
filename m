Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B41F79BB17
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350557AbjIKVjJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238479AbjIKN52 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 09:57:28 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB04CE5
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 06:57:22 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BCHSsG001202;
        Mon, 11 Sep 2023 13:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Rd3WJjyYNlY17xd+0ix2PWl4uvF4mvrKNWifVPALs0U=;
 b=XO2SHki6jyamY9ES57FT8pIoohWCwfhVD/hbJg86iaEu6YlBP+bLX7WkH2igzizp1e4r
 p+lga9OE0EYtsAAc4ScQdIl+YXxOHjpXe2xKkMNV0iXIRDnmR7X32+a8PGavN2FTTjus
 agCnFjoyBWuGRtolB1yTeSG3s9g8e3np6yPR0j08gSVlw9hznKYr9p0Ius5klONUP7PV
 7D7ekrSB6UsBc/8YimodlzodUT2/NgDT/e/msXM61FtkjfmReMkgXKiCkFqa3jIHDs7L
 CgXTculHu0SK9EhMwUEP5U302nTT8qtqOaQa40IXq3ni810LVhoHuyajIqlF8/Gu1j6R /w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1xjmrrh5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 13:56:41 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BDuH7e000768
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 13:56:17 GMT
Received: from [10.253.77.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 06:56:11 -0700
Message-ID: <0661ca9a-20d5-7fab-7cef-cd037e660cf2@quicinc.com>
Date:   Mon, 11 Sep 2023 21:56:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 00/11] usb: gadget: reduce usb gadget trace event
 buffer usage
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, Kevin Cernekee <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        <linux-usb@vger.kernel.org>
References: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
 <2023091141-outbound-turmoil-edda@gregkh>
 <a75f8d88-4731-9633-8407-b028eba9804b@quicinc.com>
 <2023091135-gave-phoniness-bf17@gregkh>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <2023091135-gave-phoniness-bf17@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: llIdqWpZzlLi8JupFl1DAB2V9sYoP3bh
X-Proofpoint-GUID: llIdqWpZzlLi8JupFl1DAB2V9sYoP3bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=586
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110127
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 9/11/2023 9:48 PM, Greg Kroah-Hartman wrote:
> On Mon, Sep 11, 2023 at 09:44:21PM +0800, Linyu Yuan wrote:
>> On 9/11/2023 9:32 PM, Greg Kroah-Hartman wrote:
>>> On Mon, Sep 11, 2023 at 07:24:35PM +0800, Linyu Yuan wrote:
>>>> some trace event use an interger to to save a bit field info of gadget,
>>>> also some trace save endpoint name in string forat, it all can be
>>>> chagned to other way at trace event store phase.
>>>>
>>>> bit field can be replace with a union interger member which include
>>>> multiple bit fields.
>>>>
>>>> ep name stringe can be replace to a interger which contaion number
>>>> and dir info.
>>> Ok, but how much memory did you actually save here?  Is the memory saved
>>> only if tracing is enbaled, or it is always?  Is there a speed penality
>>> for these changes or is it the same?
>> yes, it is save trace ring buffer only when tracing enabled, as save less
>> data, speed is higher.
> Are you sure?  You now have to parse the data, so how is it faster?


i mean when enable tracing and save less entry data  to ring buffer, it 
will faster.

i didn't pay attention to runtime parse data, as i think ring buffer is 
important,

in most case, after issue happen, we can write tool to parse it from dump,

there is no runtime parse.


>
>> it is help when enable trace for a long period.
> Help exactly how?  What is saved exactly, and what about cpu usage?


consider trace ring buffer is a default size, if every trace entry 
smaller, it will save

more entries.


>
>> for a single trace entry, take struct usb_gadget as example, at worst case,
>> it save (19 dword  - 1 dword) / 19dword = 94% buffer.
>>
>> for ep name, it only need 4 bytes/  (4bytes + 9bytes ) = 30%.
> And this buffer size reduction shows up where?  Are you trading space
> for CPU time?  Somehow you are ending up with the same information in
> userspace, so where are the tradeoffs?
>
> thanks,
>
> greg k-h
