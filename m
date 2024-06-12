Return-Path: <linux-usb+bounces-11231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54F905C1A
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 21:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7B4C1C23CDC
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 19:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7B384A2B;
	Wed, 12 Jun 2024 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G11A0aLv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183778287E;
	Wed, 12 Jun 2024 19:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718221114; cv=none; b=iKA6uxzFVpHKnEkU0Fok/52rOqhv/vTW4g0JWYdBBzw5ov8hu1KDjwg+puViGZb/j6YhjFzXU17beg5xfjUGSAk9TgRhEmE95qYC4hFx7bShEAIbrWT3zBzM0pne5QUZGtThMZpOIbrIWlqfZ1fhDdDG6AUAZ8TbwPwhbsp0dRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718221114; c=relaxed/simple;
	bh=d32MiCbVXWXFZkPey7ssf/tf/faMNZuWIlojVdCoicw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h9YewpGNSl1xk0Mq8bLUbKayBkQZWA6XkYuTwwo/jFh5nA05AK6sZNDkSeIQypYoc7T1V1CpfEtuIWrhs/mvLALMJWIHw5IusHNtfJEhy60QNxQVAb1U+C+0Tx38ZDZUIZRB4eRMAyAd14S40TVuge0ZGvVusQEn56b3+bi1c0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G11A0aLv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CGOH31003526;
	Wed, 12 Jun 2024 19:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skQ8Rd99Bnftz8B5vinGT/Kjrx0fdNO1wEQ3MtRhlmg=; b=G11A0aLvoPLmjU8U
	2a3nBQzc1zEYxPMYsTtEKuZMsXFcPmSmOq8OcGtXhI9ebK8lDmaAF0fUATEX+qdR
	2tOgGzxzm9cf+FW8hrHuGOQr3BVd7ANtTi2Z9xrVEny6tLsWBYnCq80lSk6DUJe6
	QkXvYQx1NUNYciP2vqh9bUujI95UFAuVGmLIwdFG21k1YYE0qwQPSbQBaAVxpye7
	7BXc2+qBdMRtpiLwUgCISALSzlNFl8ohAxA8pTXP6O1ojrcaCcobp900RDWFBvLI
	NuN6XgsFoMGaadNXjaSkf5Naoo8slxA3XMC+48LTeGVyleOC5e1iins6p8YstF++
	mFlMjg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ype914wh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:38:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJcDcE013460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 19:38:13 GMT
Received: from [10.110.56.180] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 12:38:12 -0700
Message-ID: <c17e6d77-8daf-30f7-700c-d8b72cacf9cc@quicinc.com>
Date: Wed, 12 Jun 2024 12:38:12 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v23 00/32] Introduce QC USB SND audio offloading support
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <80fefd6b-0f3a-4f6a-869e-fd2225315801@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HHXUBLJgdQL5MbjC7E0KsMgLBiref_Yc
X-Proofpoint-ORIG-GUID: HHXUBLJgdQL5MbjC7E0KsMgLBiref_Yc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120138

Hi Amadeusz,

On 6/12/2024 7:50 AM, Amadeusz Sławiński wrote:
> On 6/11/2024 1:57 AM, Wesley Cheng wrote:
> 
>> Wesley Cheng (32):
>>    ASoC: Add SOC USB APIs for adding an USB backend
>>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
>>    ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
>>    ASoC: qdsp6: q6afe: Increase APR timeout
>>    ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
>>    ALSA: usb-audio: Introduce USB SND platform op callbacks
>>    ALSA: usb-audio: Export USB SND APIs for modules
>>    ALSA: usb-audio: Save UAC sample size information
>>    usb: dwc3: Specify maximum number of XHCI interrupters
>>    usb: host: xhci-plat: Set XHCI max interrupters if property is present
>>    ALSA: usb-audio: qcom: Add USB QMI definitions
>>    ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
>>    ALSA: usb-audio: Check for support for requested audio format
>>    ASoC: usb: Add PCM format check API for USB backend
>>    ASoC: qcom: qdsp6: Ensure PCM format is supported by USB audio device
>>    ALSA: usb-audio: Prevent starting of audio stream if in use
>>    ALSA: usb-audio: Do not allow USB offload path if PCM device is in use
>>    ASoC: dt-bindings: Update example for enabling USB offload on SM8250
>>    ALSA: usb-audio: qcom: Populate PCM and USB chip information
>>    ASoC: qcom: qdsp6: Add support to track available USB PCM devices
>>    ASoC: Introduce SND kcontrols to select sound card and PCM device
>>    ASoC: qcom: qdsp6: Add SOC USB offload select get/put callbacks
>>    ASoC: Introduce SND kcontrols to track USB offloading state
>>    ASoC: qcom: qdsp6: Add PCM ops to track current state
>>    ASoC: usb: Create SOC USB SND jack kcontrol
>>    ASoC: qcom: qdsp6: Add headphone jack for offload connection status
>>    ASoC: usb: Fetch ASoC sound card information
>>    ALSA: usb-audio: Add USB offloading capable kcontrol
>>    ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
>>    ALSA: usb-audio: qcom: Use card and PCM index from QMI request
>>    ASoC: usb: Rediscover USB SND devices on USB port add
>>    ASoC: doc: Add documentation for SOC USB
> 
> I'm not sure how other reviewers feel about this, but is there any 
> chance to group patches in some logical order? It is bit hard to review 
> when I need to jump from generic ALSA to ASoC then QCOM code and then 
> there are dt-bindings mixed in between and back again.
> 

OK I'll see if I can re-order them to make it easier to look at between 
layers.

Thanks
Wesley Cheng

