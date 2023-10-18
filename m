Return-Path: <linux-usb+bounces-1875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E13397CE90D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 22:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941CB1F2230A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 20:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32849199B8;
	Wed, 18 Oct 2023 20:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KW4cTeCv"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49189CA46;
	Wed, 18 Oct 2023 20:34:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9743E9B;
	Wed, 18 Oct 2023 13:34:15 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IHNxlB003122;
	Wed, 18 Oct 2023 20:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iaF4fZOLwaJ/KZ0QOfrm4IVew7yLHfkgzzwK04I4AIE=;
 b=KW4cTeCvVOwZRO6FsDVGC3bRI3dP+g76ArcwLxyrRqT0WZ+6xBj6WvujSbDhG6lshS0B
 yvvsB++TFm+Ss3Gph9w9V4SXXyWfaKPAfzS/ozuJLVsAaGeqjEX9a4Qr5tBvK/DUA4Kj
 2J4rxNTn86z2QZ8cUuCYjJNLqaIU3/LacdPafs1coND6QAzy5OwVerPKS5OAJjFM0ZMU
 M5b+YJJyBAXrMFGUkS83fpeQNvMxZdl3i45o0N4fQaTolrKlgu/rIKsdy6HVXbzH9xiE
 vhDJPTRRQdvyO5dKRAoQHIjt6aOrVqy4bw7BaAwhbBv8igsdAMsM03OXlFltI70oZofL xw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttg82s19j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:33:59 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39IKXwRX024079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 20:33:58 GMT
Received: from [10.110.123.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 13:33:57 -0700
Message-ID: <4ad7b474-257c-9934-8f1b-8ceb3a90af60@quicinc.com>
Date: Wed, 18 Oct 2023 13:33:56 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 23/34] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20231017200109.11407-24-quic_wcheng@quicinc.com>
 <a8dc2a3a-27a2-40d6-9e67-6ea475701e44@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <a8dc2a3a-27a2-40d6-9e67-6ea475701e44@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TXpSOcmW4EEgl-PLKgoKBfqn-fPLzaEx
X-Proofpoint-ORIG-GUID: TXpSOcmW4EEgl-PLKgoKBfqn-fPLzaEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_18,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=667 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310180169

Hi Pierre,

On 10/17/2023 3:37 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/17/23 15:00, Wesley Cheng wrote:
>> With USB audio offloading, an audio session is started from the ASoC
>> platform sound card and PCM devices.  Likewise, the USB SND path is still
>> readily available for use, in case the non-offload path is desired.  In
>> order to prevent the two entities from attempting to use the USB bus,
>> introduce a flag that determines when either paths are in use.
>>
>> If a PCM device is already in use, the check will return an error to
>> userspace notifying that the stream is currently busy.  This ensures that
>> only one path is using the USB substream.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/usb/card.h                  |  1 +
>>   sound/usb/pcm.c                   | 19 +++++++++++++++++--
>>   sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
> 
> should this be split in a generic part and a more specific qcom patch?
> 

Got it.

Thanks
Wesley Cheng

