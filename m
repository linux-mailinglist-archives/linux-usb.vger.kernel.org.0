Return-Path: <linux-usb+bounces-7296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B852786C042
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 06:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 659FE2886D0
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 05:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648CF3A1CF;
	Thu, 29 Feb 2024 05:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jqym7Tg1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F737169
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 05:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709185173; cv=none; b=RfbEBXJ8ULFrjPGDWRTWIaq2cmOcHGtXqL2R+Hmxdqd9A2xZeu89rql20Q2fG9iqG+hrRpB2BzrOVM32Azsy6U+S4aRk4DgbRRP49cXiV+lol6I89bzOJjRmAt44NbtBM/hlz6Jy5Kuj6RyZ1hTirv0peneOH1n6yhzS5zAOIHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709185173; c=relaxed/simple;
	bh=EsxsnbPqiZjzkHF5tNGjOGGwIvJ2cR/P3zf36x/M62k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=QHiICNC/z0LN/RcuSPc5BfsQxSVz0G4eplidIDegIjByeyljb2OaKkN/4M5VUy5jAkBr6gtjKGRXBb4+rowUCY7GvORbOkCHpv7a2P7q4CTpSQ3UOmgWJMU80gewJ1KI+FWLspNmliEHLizy5xGCqbEqf1zpPtzPulwAY4p0ncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jqym7Tg1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T5bRFe015145;
	Thu, 29 Feb 2024 05:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ElyAd+0EdlcRej+uODWvd1jB02TYQ55Od+ThOAmORQk=; b=jq
	ym7Tg1VEIXd291RiRZUTnOWli7nnyChmZ0ZXZEYGjKvriEAjgjelAVIZIodDs/Pp
	FoVSyXfbI64Sf533dsWrZXGZqkTbuL0TJi+9gWSy/9xMSYRc31Vxekxp9S+LuP6l
	2MaSWz8ehImdE0HBlJl8Tf0THbRWwhCcSWWdVh7g+kMac2SFQt3XxyCb+VeKjR4f
	4Zaqv6HH3XYM5PowlXI8wAthlXgIGPQBet+/eE8ncsRGkMOlQw5kb3G/wJcY6hDT
	6xvl6FJ+f2nkAOYOC4ZIhUCTxuV8Jzp4TkouQGT5O9SHM5OaKByuM9aQ1AN/3hRT
	p62BiKyEuz/5NFjtorGw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wjb18137t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 05:39:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41T5dS0e010437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 05:39:28 GMT
Received: from [10.216.13.176] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 21:39:25 -0800
Message-ID: <d3c5d9bd-07ec-4e6d-b0dd-2a7a76e0d4f9@quicinc.com>
Date: Thu, 29 Feb 2024 11:09:21 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb: gadget: ncm: Fix handling of zero block length
 packets
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
To: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_wcheng@quicinc.com>, <quic_jackp@quicinc.com>
References: <20240226112816.2616719-1-quic_kriskura@quicinc.com>
 <CANP3RGf7qsuwcgVpmOoH0QNh-v4PjRh_xj7Rcz=YJ1TbGiPK0Q@mail.gmail.com>
 <99d284b3-3ddb-4928-b4c2-817acc76c241@quicinc.com>
Content-Language: en-US
In-Reply-To: <99d284b3-3ddb-4928-b4c2-817acc76c241@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MwZqClPJ1-r7j4lkgQVuW6Vgo3xn2SjC
X-Proofpoint-ORIG-GUID: MwZqClPJ1-r7j4lkgQVuW6Vgo3xn2SjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=605 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402290042



On 2/27/2024 8:10 AM, Krishna Kurapati PSSNV wrote:
> 

>>
>> In general this is of course fine (though see Greg's auto-complaint).
>>
>> I haven't thought too much about this, but I just wonder whether the
>> check for block_len == 0
>> shouldn't be just after block_len is read, ie. somewhere just after:
>>
>> block_len = get_ncm(&tmp, opts->block_length);
>>
>> as it is kind of weird to be handling block_len == 0 at the point where
>> you are already theoretically done processing the block...
>>
>> I guess, as is, this assumes the block isn't actually of length 0,
>> since there's a bunch of following get_ncm() calls...
>> Are those guaranteed to be valid?
>>
> 
> I did get this doubt and tried it. I bailed out as soon as I found out 
> block len is zero without actually processing the datagrams present and 
> when I did that even ping doesn't work. Everything works only when the 
> datagrams in this zero block len NTB are parsed properly.
> 
>> I guess I don't actually see the infinite loop with block_len == 0,
>> since get_ncm() always moves us forward...
>>
> 
> The infinite loop occurs because we keep moving the buffer pointer 
> forward and keep processing the giveback until to_process variable 
> becomes zero or one. In case block length is zero, we never move the 
> buffer pointer forward and never reduce to_process variable and hence 
> keep infinitely processing the same NTB over and over again.
> 
>> Maybe your patch *is* correct as is, and you just need a comment
>> explaining *why* block_len == 0 is terminal at the spot you're adding 
>> the check.
>>
>> Also couldn't you fix this without goto, by changing
>>
>>    } else if (to_process > 0) {
>> to
>>    } else if (to_process && block_len) {
>>      // See NCM spec.  zero block_len means short packet.
>>
> 
> I will test this out once (although I know that looking at it, it would 
> definitely work) and send v2 with this diff.
> 
> Thanks for the review.
> 

Hi Maciej, Greg,

  Thanks for approving v2.

  Not sure if this is the right forum to ask this question, but had one 
query. In the NCM driver, the register_netdev is called during bind but 
the cleanup for that is called during free_inst. Meaning if usb0 
interface is created for ncm on bind or a composition switch into NCM 
(first comp switch after bootup), then it is removed only after removing 
the entire g1/functions/ncm.0 folder.

  Shouldn't we cleanup and remove the usb0 interface in unbind as a 
counter operation of bind ? By extension this question also applies to 
f_eem/ f_ecm/ f_rndis where it was done in similar manner. So was 
wondering if anyone could help me with info on why it was designed that way.

Regards,
Krishna,

