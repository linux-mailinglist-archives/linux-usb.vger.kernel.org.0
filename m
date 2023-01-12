Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C816E66689E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 02:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjALB4m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Jan 2023 20:56:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjALB4k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Jan 2023 20:56:40 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB40313FAC
        for <linux-usb@vger.kernel.org>; Wed, 11 Jan 2023 17:56:38 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30C0FLwm021478;
        Thu, 12 Jan 2023 01:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5u6MURz2So8qYntWnaoU1Yj9sbl9fNUxGmBtNUVM164=;
 b=iFpZUIitJEexplR/UvgEgjL1/f6HEE79J3W2ac5f/VQySxo/TmZ4e43FkMgCi9GFrquw
 JC/hBwqJPxaUH1SavNXiOq1zeGaPKBTXWGPAF8z9/O9LrwD1KwMUONgqHP89V9rcmjf2
 eEDglVxWGaf0NIon0JGSG2xdWLEjKKBvvZPMDts+HRkEg2187P6ay9bwf4JqO2rRuTyn
 Yrm5bkIaRXlsjJKPF8UnwJyDtXUFDvzeYmywoMEmCxM/ARCgpRzSSvg43u1DC1FVk4iW
 YU6/l2HVnXEXSTvH/RI6bko06XnuDd9kO4wjUIElIh44uRFgUGYGxFk9M4Cd3BCcfqLI pQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1kaxarab-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Jan 2023 01:56:31 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30C1uVWp000440
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Jan 2023 01:56:31 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 17:56:29 -0800
Message-ID: <3706dc91-9126-bef2-4926-ee184002e889@quicinc.com>
Date:   Thu, 12 Jan 2023 09:56:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
To:     "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
References: <1672996895-22762-1-git-send-email-quic_linyyuan@quicinc.com>
 <1672996895-22762-2-git-send-email-quic_linyyuan@quicinc.com>
 <PA4PR04MB9640E527BFC0CDA519DD3BF989FE9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <e8ab0a98-c53b-5db0-d9c2-04258eabd945@quicinc.com>
 <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <PA4PR04MB964044E1882A24A5EC122B6D89FC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XRiOmVdz7pLz5I1YLCxaUGJaPSSyv5Xf
X-Proofpoint-GUID: XRiOmVdz7pLz5I1YLCxaUGJaPSSyv5Xf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_10,2023-01-11_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=937 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120011
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 1/11/2023 3:21 PM, Jun Li (OSS) wrote:
>
>> -----Original Message-----
>> From: Linyu Yuan <quic_linyyuan@quicinc.com>
>> Sent: Monday, January 9, 2023 11:42 AM
>> To: Jun Li (OSS) <jun.li@oss.nxp.com>; Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>; Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> Cc: linux-usb@vger.kernel.org; Jack Pham <quic_jackp@quicinc.com>; Wesley
>> Cheng <quic_wcheng@quicinc.com>
>> Subject: Re: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
>>
>>
>> On 1/9/2023 11:33 AM, Jun Li (OSS) wrote:
>>>> -----Original Message-----
>>>> From: Linyu Yuan <quic_linyyuan@quicinc.com>
>>>> Sent: Friday, January 6, 2023 5:22 PM
>>>> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Thinh Nguyen
>>>> <Thinh.Nguyen@synopsys.com>
>>>> Cc: linux-usb@vger.kernel.org; Jack Pham <quic_jackp@quicinc.com>;
>>>> Wesley Cheng <quic_wcheng@quicinc.com>; Linyu Yuan
>>>> <quic_linyyuan@quicinc.com>
>>>> Subject: [PATCH 2/3] usb: dwc3: add dwc3_readl_notrace() function
>>>>
>>>> There are multiple places which will retry up to 10000 times to read
>>>> a register,
>>> It's "up to", I think at normal case, it's a small number, if a large
>>> Iteration number is observed, probably there is something wrong should
>>> be checked?
>> do you mean the original loop count can be reduced ?
> No. I mean the max loop number is not a problem at good HW.
> What's the actual loop number on you HW?


i didn't check it. how about you ? no matter what is good HW or bad HW, 
current code define a big number.


actually i think we should not discuss is it a good number or not.

what is purpose to use status register record ? do it give you any 
information to understand the IP behavior ?


>
>>>> when trace event enable, it is not good as all events may show same data.
>>>>
>>>> Add dwc3_readl_notrace() function which will not save trace event
>>>> when read register.
>>> Simply drop part of register read is not good, this cause the final io
>>> trace of dwc3 is not complete, I think a full/complete foot print of
>>> io register read/write should be kept.
>> if you prefer save them, is there a better solution ?
> If the actual loop number is not a problem, then I think current
> trace is just fine.
>
> Li Jun
>
>>> Li Jun
>>>
>>>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>>>> ---
>>>>    drivers/usb/dwc3/core.c   |  2 +-
>>>>    drivers/usb/dwc3/gadget.c | 12 ++++++------
>>>>    drivers/usb/dwc3/io.h     | 10 ++++++++++
>>>>    drivers/usb/dwc3/ulpi.c   |  2 +-
>>>>    4 files changed, 18 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c index
>>>> 476b636..550bb23 100644
>>>> --- a/drivers/usb/dwc3/core.c
>>>> +++ b/drivers/usb/dwc3/core.c
>>>> @@ -297,7 +297,7 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
>>>>    		retries = 10;
>>>>
>>>>    	do {
>>>> -		reg = dwc3_readl(dwc->regs, DWC3_DCTL);
>>>> +		reg = dwc3_readl_notrace(dwc->regs, DWC3_DCTL);
>>>>    		if (!(reg & DWC3_DCTL_CSFTRST))
>>>>    			goto done;
>>>>
>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>> index
>>>> 7899765..f2126f24 100644
>>>> --- a/drivers/usb/dwc3/gadget.c
>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>> @@ -97,7 +97,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc,
>>>> enum dwc3_link_state state)
>>>>    	 */
>>>>    	if (!DWC3_VER_IS_PRIOR(DWC3, 194A)) {
>>>>    		while (--retries) {
>>>> -			reg = dwc3_readl(dwc->regs, DWC3_DSTS);
>>>> +			reg = dwc3_readl_notrace(dwc->regs, DWC3_DSTS);
>>>>    			if (reg & DWC3_DSTS_DCNRD)
>>>>    				udelay(5);
>>>>    			else
>>>> @@ -128,7 +128,7 @@ int dwc3_gadget_set_link_state(struct dwc3 *dwc,
>>>> enum dwc3_link_state state)
>>>>    	/* wait for a change in DSTS */
>>>>    	retries = 10000;
>>>>    	while (--retries) {
>>>> -		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
>>>> +		reg = dwc3_readl_notrace(dwc->regs, DWC3_DSTS);
>>>>
>>>>    		if (DWC3_DSTS_USBLNKST(reg) == state)
>>>>    			return 0;
>>>> @@ -239,7 +239,7 @@ int dwc3_send_gadget_generic_command(struct dwc3
>>>> *dwc, unsigned int cmd,
>>>>    	dwc3_writel(dwc->regs, DWC3_DGCMD, cmd | DWC3_DGCMD_CMDACT);
>>>>
>>>>    	do {
>>>> -		reg = dwc3_readl(dwc->regs, DWC3_DGCMD);
>>>> +		reg = dwc3_readl_notrace(dwc->regs, DWC3_DGCMD);
>>>>    		if (!(reg & DWC3_DGCMD_CMDACT)) {
>>>>    			status = DWC3_DGCMD_STATUS(reg);
>>>>    			if (status)
>>>> @@ -375,7 +375,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep,
>>>> unsigned int cmd,
>>>>    	}
>>>>
>>>>    	do {
>>>> -		reg = dwc3_readl(dep->regs, DWC3_DEPCMD);
>>>> +		reg = dwc3_readl_notrace(dep->regs, DWC3_DEPCMD);
>>>>    		if (!(reg & DWC3_DEPCMD_CMDACT)) {
>>>>    			cmd_status = DWC3_DEPCMD_STATUS(reg);
>>>>
>>>> @@ -2324,7 +2324,7 @@ static int __dwc3_gadget_wakeup(struct dwc3 *dwc)
>>>>    	retries = 20000;
>>>>
>>>>    	while (retries--) {
>>>> -		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
>>>> +		reg = dwc3_readl_notrace(dwc->regs, DWC3_DSTS);
>>>>
>>>>    		/* in HS, means ON */
>>>>    		if (DWC3_DSTS_USBLNKST(reg) == DWC3_LINK_STATE_U0) @@ -2510,7
>>>> +2510,7 @@ static int dwc3_gadget_run_stop(struct dwc3 *dwc, int
>>>> +is_on, int
>>>> suspend)
>>>>
>>>>    	do {
>>>>    		usleep_range(1000, 2000);
>>>> -		reg = dwc3_readl(dwc->regs, DWC3_DSTS);
>>>> +		reg = dwc3_readl_notrace(dwc->regs, DWC3_DSTS);
>>>>    		reg &= DWC3_DSTS_DEVCTRLHLT;
>>>>    	} while (--timeout && !(!is_on ^ !reg));
>>>>
>>>> diff --git a/drivers/usb/dwc3/io.h b/drivers/usb/dwc3/io.h index
>>>> d9283f4..d24513e 100644
>>>> --- a/drivers/usb/dwc3/io.h
>>>> +++ b/drivers/usb/dwc3/io.h
>>>> @@ -37,6 +37,16 @@ static inline u32 dwc3_readl(void __iomem *base,
>>>> u32
>>>> offset)
>>>>    	return value;
>>>>    }
>>>>
>>>> +static inline u32 dwc3_readl_notrace(void __iomem *base, u32 offset)
>> {
>>>> +	/*
>>>> +	 * We requested the mem region starting from the Globals address
>>>> +	 * space, see dwc3_probe in core.c.
>>>> +	 * The offsets are also given starting from Globals address space.
>>>> +	 */
>>>> +	return readl(base + offset);
>>>> +}
>>>> +
>>>>    static inline void dwc3_writel(void __iomem *base, u32 offset, u32
>>>> value) {
>>>>    	/*
>>>> diff --git a/drivers/usb/dwc3/ulpi.c b/drivers/usb/dwc3/ulpi.c index
>>>> f23f4c9..7b220b0 100644
>>>> --- a/drivers/usb/dwc3/ulpi.c
>>>> +++ b/drivers/usb/dwc3/ulpi.c
>>>> @@ -39,7 +39,7 @@ static int dwc3_ulpi_busyloop(struct dwc3 *dwc, u8
>>>> addr, bool read)
>>>>
>>>>    	while (count--) {
>>>>    		ndelay(ns);
>>>> -		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYACC(0));
>>>> +		reg = dwc3_readl_notrace(dwc->regs, DWC3_GUSB2PHYACC(0));
>>>>    		if (reg & DWC3_GUSB2PHYACC_DONE)
>>>>    			return 0;
>>>>    		cpu_relax();
>>>> --
>>>> 2.7.4
