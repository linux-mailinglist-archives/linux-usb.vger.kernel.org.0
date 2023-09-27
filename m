Return-Path: <linux-usb+bounces-678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E177B0D2E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 22:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 6BD9D1C2096D
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 20:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D7E4C87D;
	Wed, 27 Sep 2023 20:11:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE2B14A98;
	Wed, 27 Sep 2023 20:11:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1498ECC;
	Wed, 27 Sep 2023 13:11:06 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38RJwqTa021844;
	Wed, 27 Sep 2023 20:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=90q9NOxzqefCLLb/rXZtD8+r2D3ym/pWfk2IUKZ2P14=;
 b=p2XOg6YcZGZGLpHOOt7i4Uo+22v250jwhaoPSt6xZpfZecBiXmB5+2pVpi9xwsdUV9Ue
 ImSn8bX2NDyelCp289GDLFnxMO+B4XUQzmV7cg3tGQV5Xz7bZvAwOAiO3Oiszf4GIgzt
 RyuLvcBLQQ8e4atLfGeOLthwQd1VcGxCh6Itk73mjTh7nrqtIiKqFRwL2n4CqmNeDTf1
 lquhW1BN4dOS95+Sc+VKeWTdUGPnHAnRCW6DtQGnEXWWveZXAwk0NWjZrcX/KqlA7rt3
 j4061mbSJmPp4CJDuNi0VeSR8YeBMUkMF10rx32/qxatSwoapIAo3L0HK1zOpLigjzHc pg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tcda7sy83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:10:42 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38RKAfkE031384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:10:41 GMT
Received: from [10.110.25.80] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 27 Sep
 2023 13:10:40 -0700
Message-ID: <191e6429-bb47-625b-a074-fa67ee052f03@quicinc.com>
Date: Wed, 27 Sep 2023 13:10:40 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 29/33] ASoC: qcom: qdsp6: Add SND kcontrol for fetching
 offload status
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-30-quic_wcheng@quicinc.com>
 <ZRRD8eFZugh/+dex@finisterre.sirena.org.uk>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ZRRD8eFZugh/+dex@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: blIC-0fzkR4GdcVTYsm5N-g6sY1MOCnu
X-Proofpoint-GUID: blIC-0fzkR4GdcVTYsm5N-g6sY1MOCnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_12,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=783 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270171
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Mark,

On 9/27/2023 8:02 AM, Mark Brown wrote:
> On Thu, Sep 21, 2023 at 02:48:39PM -0700, Wesley Cheng wrote:
> 
>> Add a kcontrol to the platform sound card to fetch the current offload
>> status.  This can allow for userspace to ensure/check which USB SND
>> resources are actually busy versus having to attempt opening the USB SND
>> devices, which will result in an error if offloading is active.
> 
>> +static int q6usb_prepare(struct snd_pcm_substream *substream,
>> +               struct snd_soc_dai *dai)
>> +{
>> +       struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>> +
>> +       mutex_lock(&data->mutex);
>> +       data->status[data->sel_card_idx].running = true;
>> +       mutex_unlock(&data->mutex);
> 
> These updates of running should really have a snd_ctl_notify() so that
> UIs can know to update when the value changes while they're open.
> 

Sure, me review some of the APIs again and add the notify call where 
necessary.

>> +static int q6usb_mixer_get_offload_status(struct snd_kcontrol *kcontrol,
>> +				   struct snd_ctl_elem_value *ucontrol)
>> +{
> 
>> +	running = q6usb_find_running(data);
>> +	if (running < 0) {
>> +		card_idx = -1;
>> +		pcm_idx = -1;
>> +	} else {
>> +		card_idx = running;
>> +		pcm_idx = data->status[running].pcm_index;
>> +	}
>> +
>> +	ucontrol->value.integer.value[0] = card_idx;
>> +	ucontrol->value.integer.value[1] = pcm_idx;
> 
> This feels a bit messy but I'm not sure what we'd do that's better so
> unless someone else has better ideas let's go with this.  Possibly we
> should standardise this as a new control type for joining cards up so at
> least if there's further needs for this we can use the same solution?

I'm all ears for any suggestions from other users :).  I think its a bit 
difficult to tell since this is the first iteration of adding this 
feature.  Pierre gave me some great feedback from the 
userspace/application level, and tried my best to accommodate for those 
requirements since it would be the main entity interacting with these 
controls.

Thanks
Wesley Cheng

