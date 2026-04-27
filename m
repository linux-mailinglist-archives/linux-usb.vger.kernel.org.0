Return-Path: <linux-usb+bounces-36540-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJwQFCJP72kEAAEAu9opvQ
	(envelope-from <linux-usb+bounces-36540-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:57:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8AC472277
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 13:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9ED8630060AF
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B96F3ACA65;
	Mon, 27 Apr 2026 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEmYifz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7UtE9Py"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B569F369970
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291030; cv=none; b=V+cj6yU3MPwgrOoijbtWNrpAKHmD9mP2G9S1p1fKldv76nqq2gQAwtsI6oQ/rvcoB3wgF7t2vPxqa7CkcYhH3AODcYWghl7qWBcVaj1WrggeSwJxv9LxC9jlzJjA8bgilXhfD+aRmYxfj/2gOlpxCmqe8wCvC1sUMZzPX29GsQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291030; c=relaxed/simple;
	bh=33HmkLI8ohlW8ap2K1dMWyinLh7liHfm2fbiURCX3yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrQs3oiDuJdFVmUBRdlY871MQqlyZhdOIk1ON4PukGWRe0d0Psg45tvwJnef3NjCJ4Ozhe8lOJGhD4GxqdWlFtMglsSLoN0AA2LRxfJLlhqE7nZ4AgdBiyc7HstQ4sz8FhTxP6E0ZBynztsMPDv6sstLj2/vMiCloLR9NkOBMHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEmYifz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7UtE9Py; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBWd1501470
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 11:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8iEqSSYLsi/EOlrNbj/GvB2TLg7N0D1NPtTvxhBpczs=; b=JEmYifz3d9D1TsvC
	PEkZG4CeGjb4pHFrzN2xKL5LUjmsn3FLQef5xM1X3NZT/yhsqPSKF78/8f2DTAV+
	oAiM51F6XfjclcbQ5f9Z6rWAdwei03Mf31AGDYeoNvdTp01/H3hddEzfRLgMAhwb
	r5m5+AEJAjIq4g1EEzvxAUELKS4FvZD0WbmfvI3S6qx0tgnxfL0x717g6ERAxoXL
	Ixu69e0gapparhPyVttnTRy0HqyW7RSmaKMWkGL96Hif4DyeiepT3eNdE7H1/GIc
	L5HLqT7Q21k4GLunFInR7jDjTFCUC+UhdPxnQxLj2XwZ7Py4SCfJ325aGgbpMyD7
	mhmw2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrnwgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 11:57:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so63036341cf.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777291026; x=1777895826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8iEqSSYLsi/EOlrNbj/GvB2TLg7N0D1NPtTvxhBpczs=;
        b=a7UtE9Py3lS3WIjJ8OqiyDxmOzagsHaqpxOEXReD0+ljC/zRbJuHzlyyxrEKBs/7U4
         mXxKSj39EKrNTXHIUPsKfIRSKjrpCFmsOx49zg4cU/HSq66JR3bOq9D5JxeaGtBkobOl
         CukIXveqG6iccfOfOqITQkhRXkMJJKdIkt6hbMMpq9wg7aYNtflu/daIMa2P3TawuUAR
         N7NDdE7DHM1441b5TUc5a5CS0MMv3GZTTFhz7RScTBiY2WEyZ7n159uODKZRfPRU2I7A
         NC7WF5eNPxbIq3ZlmpXhgeDJt6+mZuiUOWcgwmayu7pTG4NCHuUzM4pSc1PQlCTds/6R
         bmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777291026; x=1777895826;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iEqSSYLsi/EOlrNbj/GvB2TLg7N0D1NPtTvxhBpczs=;
        b=K0h/u4efSajC74H5rh2ouZyMOB7hDXRJl4kxn/ZB/HD2EWkdQ7MDga1zv07IgZfhuW
         UdbuA/RZ18fZHbrord0SKyiO9bs6vayw7SeFWMVz6ArFc9a5zkVt3ZrbrRmTSWKn8TVZ
         wWo0OiC6gGR+nUctSWHjEDhR+7/O368l009nrw6aBw9VOwMwsAI7nLDZCWW/tTgQflg4
         YB63RaqjWCXuDYG2aMfdIlIg+e0WQyEjswXT0XhZ8juYahSQLfGD2M76YNTfaowidgFN
         UsfZnAm4JuQwn3HXKut4Q6wCDlS+H5PbAlza3YMIhEf2up4QEXtlz0ZPKJrMf0cEdqCM
         rBeg==
X-Gm-Message-State: AOJu0Yzpl7nL5BX0vN+byMxk/MBBcS626jsnpGAZo116pu5XZftLYRYN
	gI8fVZKvn4lQBT/m6Fv90woRCo4mYPlfMFk1456ITMw2VQTSbAHmwxiwsGQQhsW9t4O++kkAlA0
	NbgFnou9wcIbxCs+z9/k/4wNRaztychBmSyI891Vsuu6v56CMld3K4ir9V8Uh+C0=
X-Gm-Gg: AeBDieu7FjhRSzmVOQ+tM4P7UkUWOnOuAfkst0Tt85Qjjhiyohd0HY9yrs4Qd2ZrKuR
	DA5Es57JhVPVjiSsNswHvGv3TvB1kWK+FqDvaQKDRGilgSGsloewBu3uy3ihuXYI3RDRny2rXOG
	IA0WF8bfYn4xYtP3NHxwr/6OfLd/WjbzQX7RFyr7ZUi2rOiNPIRh1DqqcpxlcaZwPKG0yVAHCSU
	6AfNMuBo4iuwh5LiSTwMdb/75frfW0RKhSHDie3ZNXhSmlkEVDJ9MG9yLAnPP8L+PBB3akXEFy4
	5FxZTT+yx71PjukDorYCEtieZj+vwLz/mc584IpCG9PqqMsTiYFkpr4vgKMi011of2ieJwvOxJL
	3GOK7TYwYBPUX2MXyYj6eGD938WirUzzFcAQHHvoQ5q3CVMeBeBGA9u2kPc7S
X-Received: by 2002:a05:622a:6bc8:b0:50e:578e:bb0a with SMTP id d75a77b69052e-50e578ec192mr417050971cf.57.1777291026039;
        Mon, 27 Apr 2026 04:57:06 -0700 (PDT)
X-Received: by 2002:a05:622a:6bc8:b0:50e:578e:bb0a with SMTP id d75a77b69052e-50e578ec192mr417050641cf.57.1777291025550;
        Mon, 27 Apr 2026 04:57:05 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4daf2sm77717471f8f.33.2026.04.27.04.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:57:04 -0700 (PDT)
Message-ID: <1e2b5f92-cd97-4785-8117-04158c878d4b@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: qcom: Unify user-visible "Qualcomm" name
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260427070044.17974-2-krzysztof.kozlowski@oss.qualcomm.com>
 <2026042711-populate-manifesto-e206@gregkh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2026042711-populate-manifesto-e206@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNyBTYWx0ZWRfX9LnWAcJ0ijka
 f649PaCBtNSa4jIt6pyA4eDbW4k8SGQGdqi0Y+X6g4bJ/ERVQ9+pslV4E0I6gzkyJRWV6+3fksH
 fZ2FFau8jSMgkxk5JgopkMIATZC/BkESr2TLu8BPcWF4QZgAsWtfgB9Xo8O9AXMT6Aw/zge/Orq
 bJ93yRrdODXbOMkQ04n/W+GaqvWxYr8z3QsCVEfjPaxK02EiQleJZQeYBz2VUf2z5/7Yr7oyniN
 LlEftyVP64HfD++96p+aPDAOux4PHTjzB8+ERXXw55t1KDbqlbjSmS7qfAQ1xa4PXfglcBr5SEK
 QaQa4oHSnggRK6X3UJWIhwzn8lx/TSbzXOVvI09m+JlLxlQab72mTMrjIkbifFZAgZQrVxLHgk1
 I6mhGxRPin/zRWM8xWXa89fBC+nFt0K68sC50V6lZOKCkxusvnrtSLrgfDKHsOCULDhwyQCpXI0
 eFEq4k44J0IoIqVxyJA==
X-Proofpoint-ORIG-GUID: 1J1KMDVvE8XxtNi0VKLsYMNUGMUO7i5R
X-Proofpoint-GUID: 1J1KMDVvE8XxtNi0VKLsYMNUGMUO7i5R
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef4f12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bBETeuXp_mwb8o4MzM8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270127
X-Rspamd-Queue-Id: 4E8AC472277
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36540-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 27/04/2026 13:25, Greg Kroah-Hartman wrote:
> On Mon, Apr 27, 2026 at 09:00:45AM +0200, Krzysztof Kozlowski wrote:
>> Various names for Qualcomm as a company are used in user-visible config
>> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
>> "Qualcomm" so it will be easier for users to identify the options when
>> for example running menuconfig.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> And "Qualcomm Technologies" has even variations over the tree:
>> Qualcomm Technologies
>> Qualcomm Technologies Inc.
>> Qualcomm Technologies, Inc.
>>
>> I am doing this tree wide:
>> https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
> 
> Does that mean you want to take this through your tree, or you are ok
> with this going through the subsystem-specific tree (i.e. USB for this
> one.)


Please take the patch via USB. I mentioned it only to show that I am not
changing a few random entries and leaving everything else in a mess.

Best regards,
Krzysztof

