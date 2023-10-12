Return-Path: <linux-usb+bounces-1495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1277C6549
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 08:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01C9A282873
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 06:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F580D29E;
	Thu, 12 Oct 2023 06:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cpfiMUEZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5B9D2EE;
	Thu, 12 Oct 2023 06:18:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABC9E8;
	Wed, 11 Oct 2023 23:18:06 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39C3we71017001;
	Thu, 12 Oct 2023 06:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=v6n+Qo5Xll7F3pJ132sAwl/u459T/C0j0zMUkU5yojY=;
 b=cpfiMUEZtObN6Z58xE4gCCH6MOSAjx4nNrNN3olJGkG5g6rDvMJUShhXgbF7iV5n3Jbo
 nVixLOd2E2F5fFCQACIIEJQQgZMrW2xEScbMWQlFrzyCfhmaor25xEcTGB3Z3fwstmCC
 yPsP2iQBEvRMi6hU6XZg8CL7dgPZzw+YRdrNqyprPQt1diiU+bX8L5lQUJ0YSCpAmpa6
 kjcP1WprKRdy4eLEKbgAAO8jRZ9Iv1qrGzr8eK5583r78pksugRS5A9mkaoTok5dJg1e
 BKss4lJEuuSpgrulv4gTMvnSlKit3L7tIReG11sDLH/UsFVF+3Cwy4BDTrLwPzimr++I /g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tp87v8beq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 06:17:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39C6HlkI009604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 06:17:47 GMT
Received: from [10.216.58.179] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 11 Oct
 2023 23:17:41 -0700
Message-ID: <b4e8e36d-3a41-417f-8b39-085a9dad6796@quicinc.com>
Date: Thu, 12 Oct 2023 11:47:37 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/10] Add multiport support for DWC3 controllers
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi
	<balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold
	<johan@kernel.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_pkondeti@quicinc.com>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, <ahalaney@redhat.com>,
        <quic_shazhuss@quicinc.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <537d59b3-0e40-4d4d-80ab-b99028af6ec2@linaro.org>
 <2c325941-0fcc-4092-9581-dd6ebb067163@quicinc.com>
 <a8493160-6417-4366-957b-ea4ac68f8926@linaro.org>
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <a8493160-6417-4366-957b-ea4ac68f8926@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YVXindEfpHLZ-ShMUFsvTK_mRTUNQkLd
X-Proofpoint-GUID: YVXindEfpHLZ-ShMUFsvTK_mRTUNQkLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_02,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=625 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120053
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/11/2023 3:04 PM, Konrad Dybcio wrote:
> 
> 
> On 10/11/23 07:11, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 10/11/2023 2:21 AM, Konrad Dybcio wrote:
>>>
>>>
>>> On 10/7/23 17:47, Krishna Kurapati wrote:
>>>> Currently the DWC3 driver supports only single port controller which
>>>> requires at most two PHYs ie HS and SS PHYs. There are SoCs that has
>>>> DWC3 controller with multiple ports that can operate in host mode.
>>>> Some of the port supports both SS+HS and other port supports only HS
>>>> mode.
>>>>
>>>> This change primarily refactors the Phy logic in core driver to allow
>>>> multiport support with Generic Phy's.
>>>>
>>>> Changes have been tested on  QCOM SoC SA8295P which has 4 ports (2
>>>> are HS+SS capable and 2 are HS only capable).
>>>>
>>>> Changes in v13:
>>>> This series is a subset of patches in v11 as the first 3 patches in v11
>>>> have been mereged into usb-next.
>>>> Moved dr_mode property from platform specific files to common 
>>>> sc8280xp DT.
>>>> Fixed function call wrapping, added comments and replaced #defines with
>>>> enum in dwc3-qcom for identifying IRQ index appropriately.
>>>> Fixed nitpicks pointed out in v11 for suspend-resume handling.
>>>> Added reported-by tag for phy refactoring patch as a compile error was
>>>> found by kernel test bot [1].
>>> "If you fix the issue in a separate patch/commit (i.e. not just a new 
>>> version of
>>> the same patch/commit), kindly add following tags"
>>>
>>> the issue your patch resolves is not one that was reported by the 
>>> kernel testing robot, it just pointed out that you need to fix up the 
>>> next revision
>>>
>>
>> I Agree. It sounds wrong to add a reproted-by tag making it seem like 
>> a bug instead of a feature we have written. But if we fix the compile 
>> error mentioned and not add the "reported-by", its like not giving 
>> credit for the reporter. So I put in the reproted by and closes tag to 
>> give a view of what was reported and the feature implemented.
> This is a normal thing in review, people spot mistakes, null ptrs, etc..
> 
> If I had a reported-by for each review where I pointed out e.g. device 
> tree changes that don't compile i'd be topping lwn charts
> 

Sure. Will keep this in mind for future patches. And if revising this 
again, will remove the above two tags.

Regards,
Krishna,

