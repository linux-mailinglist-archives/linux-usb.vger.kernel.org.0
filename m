Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 984B8661E06
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 05:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbjAIEzD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Jan 2023 23:55:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233575AbjAIEzA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Jan 2023 23:55:00 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAD365A9
        for <linux-usb@vger.kernel.org>; Sun,  8 Jan 2023 20:54:57 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3094jR1v011055;
        Mon, 9 Jan 2023 04:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uRe5A5JvIJrcsvR+I4Gs6yKbhlSiGtkmwsFM6Owvjek=;
 b=a6s85D2GWjlsneYXX0z9tk11kiJBX3+8MG9MSNDDDsRohGL2c5JKWOwiYFn+uChe+/vi
 9xuZT/jvc8TcUSXhqe5Wd9yc3IAgHUR0mU9pbQcOxHuMlJu4pnhIvw5ALlqu20+ORu7j
 nuS76/Hrq18Nx6PDJrQocrs/FiGu0ySlHmRRJl1g14K60aVdoLNHKxOijgLZsNkux8qO
 SLw9ef2sq71MRPYqXaKxmCJbNEa3aTqL2onHWowg8X/tvznODh26Dophi/sUmj713PyT
 QvNZkLtXf0tEhWWxh+HkknRdXZbkGQgHwEEXysS5A8OqIgj4iDIRjeBwK6OdbyxcBRhu 4A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3my0u129fb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Jan 2023 04:54:51 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3094soWW002259
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 9 Jan 2023 04:54:50 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 8 Jan 2023
 20:54:48 -0800
Message-ID: <81727c24-f1ff-588a-2e66-e2971b082989@quicinc.com>
Date:   Mon, 9 Jan 2023 12:54:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] usb: dwc3: simplify operation in dwc3_readl() and
 dwc3_writel()
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <PA4PR04MB9640F0C12291662301F793AC89FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <4a5f1651-3fcd-5b4a-483c-fb2f7271f836@quicinc.com>
In-Reply-To: <4a5f1651-3fcd-5b4a-483c-fb2f7271f836@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ucx9yoGEhxvlsQp4zb2ahArcjFkR4Woc
X-Proofpoint-ORIG-GUID: Ucx9yoGEhxvlsQp4zb2ahArcjFkR4Woc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-08_19,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=742
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090032
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 1/9/2023 11:09 AM, Linyu Yuan wrote:
> On 1/9/2023 11:02 AM, Jun Li (OSS) wrote:
>>
>>> -----Original Message-----
>>> From: Linyu Yuan <quic_linyyuan@quicinc.com>
>>> Sent: Friday, January 6, 2023 5:22 PM
>>> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Thinh Nguyen
>>> <Thinh.Nguyen@synopsys.com>
>>> Cc: linux-usb@vger.kernel.org; Jack Pham <quic_jackp@quicinc.com>; 
>>> Wesley
>>> Cheng <quic_wcheng@quicinc.com>; Linyu Yuan <quic_linyyuan@quicinc.com>
>>> Subject: [PATCH 1/3] usb: dwc3: simplify operation in dwc3_readl() and
>>> dwc3_writel()
>>>
>>> when dwc3_readl() read register and dwc3_writel() write register,
>>> it will run operation 'base + offset - DWC3_GLOBALS_REGS_START' to
>>> calculate register address, seem the minus operation can avoid.
>>>
>>> the original register definition is offset from XHCI base 0x0,
>>> now change it to offset from DWC3_GLOBALS_REGS_START(0xc100).
>> Is this really can bring benefit? With this change user has to takes
> I didn't check all compiler generated code and if more instruction 
> needed for original code.
>> care an offset, looks to me the original definition is very 
>> straightforward,
>> use the offset defined in DWC3 Databook, user can directly check each 
>> register
>> definition by offset (not just by name).
> this is good point, let me check one compile code and make a decision 
> to remove this change or not.
will remove this one as no difference in generated asm code.
>>
>> Li Jun
>>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>>> ---
>>>   drivers/usb/dwc3/core.h    | 150
>>> ++++++++++++++++++++++-----------------------
>>>   drivers/usb/dwc3/debugfs.c |   2 +-
>>>   drivers/usb/dwc3/io.h      |  12 ++--
>>>   3 files changed, 82 insertions(+), 82 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>>> index 8f9959b..3af244e 100644
>>> --- a/drivers/usb/dwc3/core.h
>>> +++ b/drivers/usb/dwc3/core.h
>>> @@ -85,90 +85,90 @@
>>>   #define DWC3_OTG_REGS_END        0xccff
>>>
>>>   /* Global Registers */
>>> -#define DWC3_GSBUSCFG0        0xc100
>>> -#define DWC3_GSBUSCFG1        0xc104
>>> -#define DWC3_GTXTHRCFG        0xc108
>>> -#define DWC3_GRXTHRCFG        0xc10c
>>> -#define DWC3_GCTL        0xc110
>>> -#define DWC3_GEVTEN        0xc114
>>> -#define DWC3_GSTS        0xc118
>>> -#define DWC3_GUCTL1        0xc11c
>>> -#define DWC3_GSNPSID        0xc120
>>> -#define DWC3_GGPIO        0xc124
>>> -#define DWC3_GUID        0xc128
>>> -#define DWC3_GUCTL        0xc12c
>>> -#define DWC3_GBUSERRADDR0    0xc130
>>> -#define DWC3_GBUSERRADDR1    0xc134
>>> -#define DWC3_GPRTBIMAP0        0xc138
>>> -#define DWC3_GPRTBIMAP1        0xc13c
>>> -#define DWC3_GHWPARAMS0        0xc140
>>> -#define DWC3_GHWPARAMS1        0xc144
>>> -#define DWC3_GHWPARAMS2        0xc148
>>> -#define DWC3_GHWPARAMS3        0xc14c
>>> -#define DWC3_GHWPARAMS4        0xc150
>>> -#define DWC3_GHWPARAMS5        0xc154
>>> -#define DWC3_GHWPARAMS6        0xc158
>>> -#define DWC3_GHWPARAMS7        0xc15c
>>> -#define DWC3_GDBGFIFOSPACE    0xc160
>>> -#define DWC3_GDBGLTSSM        0xc164
>>> -#define DWC3_GDBGBMU        0xc16c
>>> -#define DWC3_GDBGLSPMUX        0xc170
>>> -#define DWC3_GDBGLSP        0xc174
>>> -#define DWC3_GDBGEPINFO0    0xc178
>>> -#define DWC3_GDBGEPINFO1    0xc17c
>>> -#define DWC3_GPRTBIMAP_HS0    0xc180
>>> -#define DWC3_GPRTBIMAP_HS1    0xc184
>>> -#define DWC3_GPRTBIMAP_FS0    0xc188
>>> -#define DWC3_GPRTBIMAP_FS1    0xc18c
>>> -#define DWC3_GUCTL2        0xc19c
>>>
>>>
>>> -- 
>>> 2.7.4
