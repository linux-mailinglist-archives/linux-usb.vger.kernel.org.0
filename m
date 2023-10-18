Return-Path: <linux-usb+bounces-1873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1BA7CE8B0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 22:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AB32281E84
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 20:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8536A1EB54;
	Wed, 18 Oct 2023 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bhhDb/aH"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD01EB46;
	Wed, 18 Oct 2023 20:22:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A62A4;
	Wed, 18 Oct 2023 13:22:03 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IILcRX025958;
	Wed, 18 Oct 2023 20:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MZK6pqj1ss77uI7PA+Fgrt/RZmQ8X/QTlxXNZEv5AKo=;
 b=bhhDb/aHD/FKRfI30ps4x9K/6Qf4QmWlDHPdYifAxLKyP9W1rEGEru+aEPWg333pITU5
 YXWL3KDM4XQ5PDAkmHT4jv8UA1Tnqz766i1JZizJbePOCgTaUZ0To34E2ioqZDqTcDsL
 l+j2Yu+zlFpTuLwz5xHG/CDp5qWs0GCT3XTwTkS7i5Bvs0u/lNkBlfwTThxt8N48lyMs
 Oi1q+4gsVSfPFyoplc0xhK52S3ZeS4JrwlRJu1T5HD4qo2vjZk4tUVxdr19+7sncbGog
 xpp13+EuCDftUoXCDt3TgZy/h+pJXeyTTLuHxjj+t5yDo3xKk9aD4rxOlSf5+bjXTVtm Mw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttg82s0kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:21:46 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39IKLjTq000644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:21:45 GMT
Received: from [10.110.123.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 13:21:44 -0700
Message-ID: <7184bb42-4159-8e99-3ab6-56c115873078@quicinc.com>
Date: Wed, 18 Oct 2023 13:21:43 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 20/34] ALSA: usb-audio: Check for support for requested
 audio format
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-21-quic_wcheng@quicinc.com>
 <ad851c66-5c5f-4bbb-b278-7b0c49b3cb07@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ad851c66-5c5f-4bbb-b278-7b0c49b3cb07@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fFipZuSxrJahsBe5JduYXO9dpd0JE-n_
X-Proofpoint-ORIG-GUID: fFipZuSxrJahsBe5JduYXO9dpd0JE-n_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_18,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310180167

Hi Pierre,

On 10/17/2023 3:29 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/17/23 15:00, Wesley Cheng wrote:
>> Allow for checks on a specific USB audio device to see if a requested PCM
>> format is supported.  This is needed for support for when playback is
> 
> This is needed for support when playback is
> 

Will fix this typo

>> initiated by the ASoC USB backend path.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>   sound/usb/card.h | 11 +++++++++++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index c0b312e264bf..88f431917c15 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -162,6 +162,46 @@ int snd_usb_unregister_platform_ops(void)
>>   }
>>   EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>>   
>> +/*
>> + * Checks to see if requested audio profile, i.e sample rate, # of
>> + * channels, etc... is supported by the substream associated to the
>> + * USB audio device.
>> + */
>> +struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>> +			struct snd_pcm_hw_params *params, int direction)
>> +{
>> +	struct snd_usb_audio *chip;
>> +	struct snd_usb_substream *subs = NULL;
> 
> useless init?
> 

Agreed.

Thanks
Wesley Cheng

