Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575C2668C0F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jan 2023 07:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbjAMGCL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Jan 2023 01:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbjAMGAQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Jan 2023 01:00:16 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6A169534
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 21:55:35 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30D5au2I019856;
        Fri, 13 Jan 2023 05:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FYUGrKMI87hH+xg//aYN9FdnaOHFMPQ0e4QjUz0C5lU=;
 b=gdONR54JpntOWRGjw+2/QNLQ726Dn+D7GPFyxXEFYYCKfu6/IRra0u65DUGPRIqa5QSo
 BCpNuSze6mf0w5pzJhL/Q4XarPIB4zBBIYLOuTBygHFyvO2BQJkte3G42aGGjcqF4S+z
 f6A9NjMvqa0vaojjRzx1Ld1l6Gr4Mu0f0Kk66bTWocQgc+vLYZcpvDOta9gObcwz/qBF
 pkXuuGj2yEPoDkoR9y9Mb3j9LqUPc5KBFJXFJq2SyBYCYU/EsnItZ+AvJQFdQGh6AnEh
 Vk0Dm15+cfXMUiK3JjzSzzHgYySfYfUrQgONXCDEnX3oyuvSloKZO4x+X2YGmGxUXQ8Q yg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1kxhnuj1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 05:55:29 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30D5tSqG022297
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 05:55:28 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 21:55:26 -0800
Message-ID: <d89d472f-14be-821f-7da0-c82031efc651@quicinc.com>
Date:   Fri, 13 Jan 2023 13:55:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-2-git-send-email-quic_linyyuan@quicinc.com>
 <PA4PR04MB9640E527BFC0CDA519DD3BF989FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <e8ab0a98-c53b-5db0-d9c2-04258eabd945@quicinc.com>
 <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <3706dc91-9126-bef2-4926-ee184002e889@quicinc.com>
 <20230113010841.ougwmotzlm56nciz@synopsys.com>
 <68d3e800-afe6-9e27-e4e4-3670696abd9a@quicinc.com>
 <20230113031813.zozc3v4m2m3jybrb@synopsys.com>
 <f11c96ce-1ae5-8f59-6d1a-3b35cf45f301@quicinc.com>
 <20230113052437.faywn7ev4bop4q5i@synopsys.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <20230113052437.faywn7ev4bop4q5i@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D56xp4MguUjqwb9GL9MpIxdkclzmUXO-
X-Proofpoint-ORIG-GUID: D56xp4MguUjqwb9GL9MpIxdkclzmUXO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_14,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 mlxlogscore=766
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130040
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 1/13/2023 1:24 PM, Thinh Nguyen wrote:
>
>>>>> While some polling numbers seem large, we should not remove the tracing
>>>>> events during polling. There are useful info in the status register when
>>>>> there's a timeout. Also, the number of polls needed for certain state
>>>>> change is useful data point for debug.
>>>>>
>>>>> What we may want to update is not depend on the register read delay for
>>>>> the polling duration. Different setup will have different delay.
>>>>>
>>>>> If we want to disable it for debugging purpose, make sure to have the
>>>>> default option as enabled.
>>>> if so, do you accept define a new function and new trace event like,
>>>>
>>>> static inline u32 dwc3_readl_timeout(void __iomem *base, u32 offset)
>>>>
>>>> DEFINE_EVENT(dwc3_log_io, dwc3_readl_timeout,
>>>>       TP_PROTO(void __iomem *base, u32 offset, u32 value),
>>>>       TP_ARGS(base, offset, value)
>>>> );
>>>>
>>>> let user enable it accordingly.
>>>>
>>> We can just redefine the event with an additional parameter for event
>>> filtering option.
>>
>> actually filtering option only work at event output time,  it will show data
>> match filter, ignore data which not match.
>>
>> there is still no filter which run before event save buffer, event still
>> save into buffer,
>>
>> if read happen too many times, it will flush useful event like write
>> register operation.
>>
> Ok. What do you think of also reviving Jun's change to using
> readl_poll_timeout_atomic? It makes sense to create a new trace event
> in addition to that:
> https://lore.kernel.org/linux-usb/87blmymwlz.fsf@kernel.org/T/#t


1.if you review all places which read in this way, not all of them can 
convert to

readl_poll_timeout_atomic() Jun introduce.


2. also his change block for more than two years, will it be approved ?


>
> Thanks,
> Thinh
>
> Thinh
