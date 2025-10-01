Return-Path: <linux-usb+bounces-28838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF7BAFE72
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 11:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 183E31941A28
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 09:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517412DAFA9;
	Wed,  1 Oct 2025 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+n5OKMU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B88E1804A
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759311772; cv=none; b=RTMywys1uXPtNIAHQxv7DWqYzOyCmQjwTuODIjF86wbf1YYn9akADdew/hTLUuPCVQ6jMcOphZYMSRmGMziN2ODbZyqGW37TTB7Bt2/Q+v5ZrvHrmElg4W/XCvR5Qqhsu4JDEzFUTeKURWnTucZslBJlQ72QWQU1newCMecsIgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759311772; c=relaxed/simple;
	bh=VsR2+PVDtYE3652lA3AwZ1sGcmyKJ3prqssc5PDRjC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbKbmdUmEG/Efda+tnHLDxk0dBBeJQojF3MFw/COKBjQ3xzN/PpZzUECwjXtppwtL5a2VmSrPPMOyVmUT3U/Jee1JH60jTvGB/wtUPWr4fl/wEC2LpKSE6opZnW6OIuoAlIZMmdQafqwEOCgxagoWPDrvylDHnRbjmI3Xl7QvNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+n5OKMU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59193i4X023782
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 09:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrFdWv2iBXIeKGrs8bhA1iCXbL7rFu1+yvVc7NJeApA=; b=I+n5OKMUkidLe5KE
	FKY41O6FT+NOSTD3fVg7zfK9P0z/Oy7XDmVMCH/z8HlggB3VRH/pX14CgqI2C/Au
	eKCk9BSIimln+2Ru6iyNhiF/LuwE5369SbbAYW5GOZkZ8yJi8/z/ui6vn+xCxAu4
	+j1UNEo0kGlz6mn6VfNAYxTfGZ8tSZ5dltVVXOP1crz8uxQsrCwMgBW8nJ4gZveD
	JPZG+as3j++DJYL7FumuTOc3DA+Z3AA+319vfnwwA++FUwLItE4dsvYUGd3H++vA
	+gXtTwbzxMDAPw03FVhGVWuNWHDXuZjlORgH53XetkQ7oqNDeSKiLlpMUfJTvyk/
	hV1/Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n4f15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 09:42:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-82b15c1dca8so242141985a.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 02:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311769; x=1759916569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrFdWv2iBXIeKGrs8bhA1iCXbL7rFu1+yvVc7NJeApA=;
        b=RemwQeMgtAaK2GxVTH8lph12XhAgSgrFRsA/AsxWLlI38yR83oJMiKlhv5flwe/K0q
         IOxGqqyDiEJRfCGUxwu1/G1gqdTu0OkaJy7NADplSMDhQk6GW1GFdGb4VzJbZNN2B5Kj
         oUtdv1W3lY2/4GFXskFIxvDJ5ixUHgWAExODOPQaRYEHf5yCgYgRVQcCl6GPEW3g9dlL
         9UmCGPgphysocqKUuUVx+fAZVODa1S8ccFGpuXqD2PMVm+vpNkMAqmOvdzaYwAkg/LSz
         r/7Hw4icfaL8+ptPiZ5XsQRjnJ1C0V2fP1PEhJ3HQ2S71LyTtAODEmHRtNj/Ov0FcJA5
         HFFw==
X-Forwarded-Encrypted: i=1; AJvYcCWJa6q9PNiBC36pz/QaIhyikpqKkXcJHJeGH8eaASQ3niyBs7K6IDSQL+7Kf+D1c3uebiIiJqsFj2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVUTMU7h4s/cA6W9yxBQJ+HoVWJw45yhcUA7lViPtHZFzPJhQb
	uKAetBbYUytnOJXLR48GOYUG0SjKVTFnSKBcrUyRM07sGtDjCHDlgRY3++R+gx9Fx3mLzAJk8bj
	Gv0Q6J19oMNWJxABdcYfmGzWjhWHXlVGUfHoVBjJ/PcV43DSr4QDjhisnPEA5J4o=
X-Gm-Gg: ASbGncvlIAgki3+xJu935x4A3Q9Cs1XErfcJMTZC52hZR6Pdt7L/YB0YoVwp8wdjSfh
	sZEWpSFSsXhob/vEr1WZN+kYEL0rlAi2fGudkmDyrCVxBD+9mZ3lqztb7Q9fde+3fWR0q4hyP3h
	o4DkV4SNqXrhwBzfezUPTIs+To2FpKFZ4cakTJ2icyx7C6+MkxEo1JKMrx4JwmkkzowwKYNXMdJ
	ba7a+27ckL1nGStoRPpe8N8w6mOz/aqjg5ysqWhZ4uBpSnggJkVEdBFRUUcCRrEEOhePHyz+vzw
	BTkO8xkVSMuXYcvObsLSYeImXKFivAL6BH1z99qy8nQkRbma8siZ675M9DJ2gDxW8t7Pt6fDyyb
	wuv5lbH9EbLZ6t2gprfpiNXeURlY=
X-Received: by 2002:a05:620a:d8e:b0:829:9017:82b6 with SMTP id af79cd13be357-87375760480mr275830385a.8.1759311769163;
        Wed, 01 Oct 2025 02:42:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSVWdZDNLhL7AkKEv+Ngs2uzjXJ5e/rNt3228AfvQUdNC5wR/kdISKu4lF1ZjtYbb//8x8wQ==
X-Received: by 2002:a05:620a:d8e:b0:829:9017:82b6 with SMTP id af79cd13be357-87375760480mr275829085a.8.1759311768591;
        Wed, 01 Oct 2025 02:42:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3e89655b09sm628793366b.77.2025.10.01.02.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:42:48 -0700 (PDT)
Message-ID: <a31ac6fd-929f-4001-8199-1b8730ccbadd@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250924232631.644234-1-anjelique.melendez@oss.qualcomm.com>
 <20250924232631.644234-3-anjelique.melendez@oss.qualcomm.com>
 <t3hfr33t76ckecatro5gheycb2phnch57m6zzdpm44ibykbubd@e6nffasyetib>
 <4cbcf312-7697-4725-8fd8-45f2b5b0584f@oss.qualcomm.com>
 <6kbkkiwsp3hzu2u6uezelwufooeeh7efrcc2buydpbziuhr5px@xdp24rhfjqyf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6kbkkiwsp3hzu2u6uezelwufooeeh7efrcc2buydpbziuhr5px@xdp24rhfjqyf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X9Y4OTccrYq3vYtaa2VzgtxaBxwDasch
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dcf79a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=K0chv5zXbCjWf1o7A30A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: X9Y4OTccrYq3vYtaa2VzgtxaBxwDasch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX+YHB9X1lVW1N
 WCRuF2XPDnA1Bxs5ZGTV7RuewNy99F2IDZTFHoIDNo434prdLp3rsy5itVeS7byIn14MGzEZAoh
 ydbtSBWNNT9MQsUjIvyZZ5OSj9QcSFVgGV3reibTKjhUrRUfy9vZP5vWGLEb1rqIkpK0aQzeY4i
 9rFdlXT2NLnpYwqkawaqA0fo1HwEyAjmpJdPH43FdmDsF5ZPhTJiswppOO9NUy9pUKzC1X/TMs2
 15QU557DPJQkepsJK1Ynh1TaYnfDmuMIAPzx0UZP6KrvnKBZqxBFScPTtCNRsARGD+HsUFCvQck
 Wy9ONJToryVCcleshI6fK46IkCDYAjgqj3H/oynxo2cyLoSXJYPODcj+sEsUOHoMD7wKfQD23l9
 IlYpHgRrWnDBi8P9PhvO672xpUQ+Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On 9/27/25 12:07 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 11:19:13AM -0700, Anjelique Melendez wrote:
>>
>>
>> On 9/25/2025 2:43 PM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 24, 2025 at 04:26:31PM -0700, Anjelique Melendez wrote:
>>>> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
>>>> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
>>>> This makes the total buffer size increase from 48 bytes to 528 bytes.
>>>> Update the buffer size to support this increase.
>>>>
>>>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>>>> ---

[...]

>>> I'd prefer it to be more explicit. Define an union of v1 and v2, fill
>>> common parts and version-specific parts separately.
>> Konrad also left a similar comment in this function "This code keeps the
>> 'reserved' field zeored out for v1, but it does so in a fragile and implicit
>> way :/" (https://lore.kernel.org/all/df671650-a5af-4453-a11d-e8e2a32bd1ab@oss.qualcomm.com/#t)
>>
>> So I figured I would try to get thoughts from the both of you :)
>>
>> We could have a union defined like so:
>> struct __packed ucsi_write_buf_req_msg {
>> 	struct pmic_glink_hdr   hdr;
>> 	union {
>> 		u8 v2_buf[UCSI_BUF_V2_SIZE];
>> 		u8 v1_buf[UCSI_BUF_V1_SIZE];
>> 	} buf;
>> 	u32                     reserved;
>> };
> 
> LGTM.

+1

Konrad

