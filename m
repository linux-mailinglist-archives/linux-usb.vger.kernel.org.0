Return-Path: <linux-usb+bounces-2541-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288E7E1072
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 18:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9149B1C20A4B
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 17:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0469210FF;
	Sat,  4 Nov 2023 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FxfoIHL/"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C308474;
	Sat,  4 Nov 2023 17:03:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC62D6;
	Sat,  4 Nov 2023 10:03:21 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A4H0CeS007386;
	Sat, 4 Nov 2023 17:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=k18Ts0ut2IoH66o6ZrcLWBPsRz7WH3GCevTUNI4/wF4=;
 b=FxfoIHL/lVWG9StWBQ3w5B4TrH+7Br7xta36I1rf5d+SUV/PQRX8aKKhCZyOXCixZwoH
 0oP8Dn+m2yveImUNf4KLaJjWH9X+TUVhnlW7seNf+e+h8oLsiuJd4FJWDrx/OEwIV8eg
 FncsxVlr9OftKw2rbdKtJOFCWPtX8pDG66AUffuqWFG3YGKaZcWGD5zWapvfrFqQLuqA
 ylFJzjCOTkKoTsOSstKqG+1FX3CDwhdB4rIvw9AV6/DmF1TLiJ4oZMqSCrxQ2t9e8FvW
 0h33rSdz0w6mznz7IYWeZrlpiDyEdu39KI4WoBv8RUjDg1XTTcC4f+5NspD7Wd2c9UW8 XQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5eu60w35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Nov 2023 17:03:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A4H34CY022940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 4 Nov 2023 17:03:04 GMT
Received: from [10.249.19.93] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sat, 4 Nov
 2023 10:02:58 -0700
Message-ID: <ea919050-22a8-4d28-ade2-fd16a99876cb@quicinc.com>
Date: Sat, 4 Nov 2023 22:32:55 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/8] usb: dwc3: core: Register vendor hooks for dwc3-qcom
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
 <3be5e95f-85d2-4abf-a8b4-18b019341602@quicinc.com>
 <cf553cd8-45f8-4a61-b016-69e7a80eee9f@linaro.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <cf553cd8-45f8-4a61-b016-69e7a80eee9f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3qUD6-cNryyq5LI22b-kPDdWjCZuSzC6
X-Proofpoint-ORIG-GUID: 3qUD6-cNryyq5LI22b-kPDdWjCZuSzC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-04_16,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311040145




>>> Hi Bryan,
>>>
>>>> What happens to this code if you
>>>>
>>>> static int count;
>>>>
>>>> 1. sleep in dwc3_probe for 10 milliseconds
>>>> 2. return -EPROBE_DEFER
>>>> 3. if count++ < 5 goto 1
>>>>
>>>> i.e. if we simulate say waiting on a PHY driver to probe in 
>>>> dwc3_probe()
>>>>
>>> The vendor hooks are used in __dwc3_set_mode and role_switch_set 
>>> calls in core and drd files respectively. These are invoked only if 
>>> we are OTG capable. The drd_work is initialized in core_init_mode 
>>> which is called at the end of dwc3_probe. If dwc3_probe fails and 
>>> gets deferred before that, none of the vendor hooks will be fired and 
>>> dwc3_qcom_probe is also deferred.
>>>
>>> However I see that if core_init_mode fails (the cleanup is already 
>>> done in drd to prevent set_role from getting invoked already),  I 
>>> need to cleanup vendor hooks in error path of dwc3_probe().
>>>
>>>> and what happens if we introduce a 100 millsecond sleep into 
>>>> dwc3_qcom_probe() - and run a fake disconnect event from 
>>>> dwc3_qcom_probe_core() directly ?
>>>>
>>>> In other words if make it that dwc3_probe() completes and struct 
>>>> dwc3_glue_ops->notify_cable_disconnect() fires prior to 
>>>> dwc3_qcom_probe_core() completing ?
>>>>
>>>> i.e. I don't immediately see how you've solved the probe() 
>>>> completion race condition here.
>>>>
>>> Just wanted to understand the situation clearly. Is this the sequence 
>>> you are referring to ?
>>>
>>> 1. dwc3_probe is successful and role switch is registered properly.
>>> 2. added delay after dwc3_qcom_probe_core and before interconnect_init
>>> 3. Between this delay, we got a disconnect notificiation from glink
>>> 4. We are clearing the qscratch reg in case of device mode and 
>>> un-registering notifier in case of host mode.
>>>
>>> If so, firstly I don't see any issue if we process disconnect event 
>>> before qcom probe is complete. If we reached this stage, the 
>>> clocks/gdsc is definitely ON and register accesses are good to go.
>>>
>>> If we are in host mode at this point, we would just unregister to 
>>> usb-core notifier and mark last busy. If we are in device mode, we 
>>> would just clear the hs_phy_ctrl reg of qscratch. After the 100ms 
>>> delay you mentioned we would call dwc3_remove anyways and cleanup the 
>>> vendor hooks. But is the concern here that, what if we enter 
>>> runtime_suspend at this point ?
>>>
>>
>> Just to clarify one more thing. The probe completion requirement came 
>> in because, before the device tree was flattened, dwc3-qcom and core 
>> are two different platform devices. And if the dwc3 core device probe 
>> got deferred, dwc3-qcom probe still gets successfully completed. The 
>> glue would never know when to register vendor hook callbacks to 
>> dwc3-core as it would never know when the core probe was completed.
>>
>> That is the reason we wanted to find out accurate point where core 
>> probe is done to ensure we can properly register these callbacks.
> 
> Are you saying to you require/rely on both of these series being applied 
> first ?
> 
> [1]: 
> https://lore.kernel.org/all/af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com/
> [2]: 
> https://lore.kernel.org/all/20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com/
> 
> Must be, nothing applies for me in this series.

The first one is not a patch. It is just a discussion thread I started 
to get community's opinion before on disconnect interrupt handling. The 
current series is based on top of [2] made by Bjorn (as you already 
found out) and as I mentioned in cover letter of my series.

Regards,
Krishna,

