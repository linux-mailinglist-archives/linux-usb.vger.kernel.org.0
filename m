Return-Path: <linux-usb+bounces-2506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E07E0878
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 19:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06588B21485
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 18:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4318533F1;
	Fri,  3 Nov 2023 18:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HyXMIt8a"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CDF23CC;
	Fri,  3 Nov 2023 18:49:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFD4184;
	Fri,  3 Nov 2023 11:49:36 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3IR546016764;
	Fri, 3 Nov 2023 18:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=V4iWzqRHOUbACCWPKoiAq+ncPwLVlJrHH2OBYCcZKBI=;
 b=HyXMIt8aozdCojV335Wsqm5kCz0dJuAvoMaD5I0yDYBpmSza5jnpQRWLUQQr0hWwEsy9
 VHiwtnntuJxFBU+2AjlRgI8q76RA6EL7NslWK8rDCPYCf6AsI6d4CgPQAEiyWpHEo8Uy
 t8wSYpNuDZMrcbErawdLIgaKXhVZ82b6Hg5a9DEO50nKTP/l6Sw9hZKor1BpNXvk/zdo
 2zSPHYqNswrgiAQdmrbEbGNyXM1OmP6ouLMtF49TgsaKIflRsd0v4cgexmWahyD1y13Q
 23bqPOB1Ftk1ArEWnOxAcTfkFI3vO1fr46AwBFdfueIAGexXXv2ka99l622NvXHTf8ac 2g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4wmjhaqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 18:49:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3InKhA011089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 18:49:20 GMT
Received: from [10.249.21.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 11:49:13 -0700
Message-ID: <3be5e95f-85d2-4abf-a8b4-18b019341602@quicinc.com>
Date: Sat, 4 Nov 2023 00:19:08 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/8] usb: dwc3: core: Register vendor hooks for dwc3-qcom
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-usb@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>,
        "Thinh
 Nguyen" <Thinh.Nguyen@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, <quic_wcheng@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20231017131851.8299-1-quic_kriskura@quicinc.com>
 <20231017131851.8299-3-quic_kriskura@quicinc.com>
 <e700133b-58f7-4a4d-8e5c-0d04441b789b@linaro.org>
 <5ef66bdc-9645-4bbe-8182-baa7fe4c583a@quicinc.com>
In-Reply-To: <5ef66bdc-9645-4bbe-8182-baa7fe4c583a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oIkqhL3-zpoiPmr7Mi0Cnuw2gWddhm6G
X-Proofpoint-GUID: oIkqhL3-zpoiPmr7Mi0Cnuw2gWddhm6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_18,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030157



On 11/4/2023 12:15 AM, Krishna Kurapati PSSNV wrote:
> 
> 
> On 11/3/2023 8:44 PM, Bryan O'Donoghue wrote:
>> On 17/10/2023 14:18, Krishna Kurapati wrote:
>>>
>>> The following are the requirements aimed in this implementation:
>>>
>>> 1. When enum in device mode, Glue/core must stay active.
>>>
>>> 2. When cable is connected but UDC is not written yet, then glue/core
>>> must be suspended.
>>>
>>> 3. Upon removing cable in device mode, the disconnect event must be
>>> generated and unblock runtime suspend for dwc3 core.
>>>
>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>
> 
> Hi Bryan,
> 
>> What happens to this code if you
>>
>> static int count;
>>
>> 1. sleep in dwc3_probe for 10 milliseconds
>> 2. return -EPROBE_DEFER
>> 3. if count++ < 5 goto 1
>>
>> i.e. if we simulate say waiting on a PHY driver to probe in dwc3_probe()
>>
> The vendor hooks are used in __dwc3_set_mode and role_switch_set calls 
> in core and drd files respectively. These are invoked only if we are OTG 
> capable. The drd_work is initialized in core_init_mode which is called 
> at the end of dwc3_probe. If dwc3_probe fails and gets deferred before 
> that, none of the vendor hooks will be fired and dwc3_qcom_probe is also 
> deferred.
> 
> However I see that if core_init_mode fails (the cleanup is already done 
> in drd to prevent set_role from getting invoked already),  I need to 
> cleanup vendor hooks in error path of dwc3_probe().
> 
>> and what happens if we introduce a 100 millsecond sleep into 
>> dwc3_qcom_probe() - and run a fake disconnect event from 
>> dwc3_qcom_probe_core() directly ?
>>
>> In other words if make it that dwc3_probe() completes and struct 
>> dwc3_glue_ops->notify_cable_disconnect() fires prior to 
>> dwc3_qcom_probe_core() completing ?
>>
>> i.e. I don't immediately see how you've solved the probe() completion 
>> race condition here.
>>
> Just wanted to understand the situation clearly. Is this the sequence 
> you are referring to ?
> 
> 1. dwc3_probe is successful and role switch is registered properly.
> 2. added delay after dwc3_qcom_probe_core and before interconnect_init
> 3. Between this delay, we got a disconnect notificiation from glink
> 4. We are clearing the qscratch reg in case of device mode and 
> un-registering notifier in case of host mode.
> 
> If so, firstly I don't see any issue if we process disconnect event 
> before qcom probe is complete. If we reached this stage, the clocks/gdsc 
> is definitely ON and register accesses are good to go.
> 
> If we are in host mode at this point, we would just unregister to 
> usb-core notifier and mark last busy. If we are in device mode, we would 
> just clear the hs_phy_ctrl reg of qscratch. After the 100ms delay you 
> mentioned we would call dwc3_remove anyways and cleanup the vendor 
> hooks. But is the concern here that, what if we enter runtime_suspend at 
> this point ?
> 

Just to clarify one more thing. The probe completion requirement came in 
because, before the device tree was flattened, dwc3-qcom and core are 
two different platform devices. And if the dwc3 core device probe got 
deferred, dwc3-qcom probe still gets successfully completed. The glue 
would never know when to register vendor hook callbacks to dwc3-core as 
it would never know when the core probe was completed.

That is the reason we wanted to find out accurate point where core probe 
is done to ensure we can properly register these callbacks.

Regards,
Krishna,

