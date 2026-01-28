Return-Path: <linux-usb+bounces-32870-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMGkGrLceWnI0QEAu9opvQ
	(envelope-from <linux-usb+bounces-32870-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 10:53:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0866C9F077
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 10:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD26030107CE
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3BE34D4F7;
	Wed, 28 Jan 2026 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVQzXd3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAcs8nSP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F734CFBB
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594022; cv=none; b=JnXcQWbIY2SucK8JmM+R9PgQ0wcXQzF8v86tIDFG7/aZXhWI/bHTYLG+GlCI1pD19N68K9iEjEjTL08Po0h8kh5PW4AzsUHzLjTy2ycLqV9lmXlq3WiG065mp9EGmH8BakJuGdX0SRvrseYVkkuWAEo6ns67HHGj9BpG3WQijY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594022; c=relaxed/simple;
	bh=m7VZ+3BHYVPIauZhjdMaB/99DtQmeJlc2TEVCSnnrHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uh42CeUe3qJxCyyOHt97YyyRm3/FuSAyBGJB4G5qtcfa9LI5XU2PRUO5wW6mte62nDHMa2d9dhVqRDxfZjRlFumbAArQkP7+IFPMjjaFYdf76j4lnJn8jO45GY7f5zySmBA0lqlRFhoPrj2RcnUbDSuu5Y5/6pnYIHI/gHwl7rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVQzXd3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAcs8nSP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91p7L3442331
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 09:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nb0VkEE35ZrWPoIyd63vuEpjD+c+2xcVOdZj3nN5YtM=; b=YVQzXd3qU+m5Rs3O
	71+fMMAnVCAqlHXLH8ZtCHVjEwQYyGHWtx6umRm3XzP7fsDt8WpSwEVgrN+SZEgl
	YgeTJ7XAUsSTqdr3KM5Q9MBRaShyBqXjJC1fTNZ6w7dj9P+V8T5E7/Z876RAGely
	g5wPl5R/W5PY0K7hvsWuTr+32VqStE7/3Tb9PZP1nmimqWefYTlwOHWQ9NMkjVS3
	OM850i7ee8NUDhdyA5UYrAL3G6oEulgZ6aWbuEsg9LBjPrzXtv+WKWtIXm9Hu69Y
	lvssS08XJYw8o86yxr/RVZz4IHf40IzJEY3rhD3N+Clg6WunMKwj3zCSwMMgoeeH
	7n8zcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanah51q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 09:53:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88880bc706cso2290856d6.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 01:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769594019; x=1770198819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nb0VkEE35ZrWPoIyd63vuEpjD+c+2xcVOdZj3nN5YtM=;
        b=WAcs8nSPXXAumFrEtX9TFfhxL/M2piY2/x2fYqTkcVVWC7gfGfFjnn1xkAQmtZohkf
         XqkVCBdayvawTMrTAe/85a1/8YECxAGO4oMKvl17fWnN/kR45jpBCJVLpSuk1JWX1AMx
         qOT636QBVARHUUnfJ/EAU5Hz6hGyRE8UuoDF98SMl7ZqQDpx/rI07BatSP9ILUY6Bt/E
         H1FBpMMbY4CZS8j34f3VK0Tkrnks4lB725FEcpmTlgFjh50lKOzhb23zB53EP9VrXEMr
         IUasPStldZ384OYrbykSV+dK9/Q1Z1lvzua51ProXdhkh8k/Z8FEtFVdJj5P/xL2Ydh6
         bf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594019; x=1770198819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nb0VkEE35ZrWPoIyd63vuEpjD+c+2xcVOdZj3nN5YtM=;
        b=L+uuWglGaHHLT3HynqPAE/yBiLRRpZP6mgYtpLf9+aeFV5UvyaKbruGdSVvfYzLO1a
         MWArcD5FW5W4u8uh6jwe0uHP/2lr77elqor+uSyaCnpa64lUhFtZIyB6LFqXIyiWG6oo
         GjrMIwy25TmO3P68NcRjKg8xmdI6nXVj0R6YKXZ4qWfUQeSL2N16RfbLl+wxwrQ2WYUO
         8xjPPcLER8hHN0040E9DwCehO9jM+8zas3bW85wxqL1U2cNxgs0chz2Lz8/5w+8BbQM1
         PmzeY8YL0UKqXAbRyqV5WxDzqqHBLY0rIBRxUX1PrhRAGqUxWSTx/UOPLO+bm90K0qpi
         7PkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOGt3azYjcDEEzx98WjbinqWWZqxm7k2jsDlDZucfdrFcrSJhODnhdcXM8nd3nDxv+pvABG454LWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywth6EzO8fide1xlTw0Qs7RnLLicVllsMh3KsZU0ql+a7NGPmWe
	upAbvfE9QqGgqk71cbrVNOVsw+uqJdi5fRDEgR026zYyjgiKOu3R2zPnWVkT5lYPTHfyqKruXFK
	GzbkVmmrpj5PjeH3AFgTQ6kHfV8xe0jyuNfnI7h5ltJ8u9sMG3KHzl8wsAh6BQ7s=
X-Gm-Gg: AZuq6aLOVHUGQmWipNEyQMq6VpsrFUQDzvzOQkWibCXCrG0LQAfQ+WMC56zHjHUCtdq
	CwBUAtUUS7pJeY8PnUC7lPcPngrp6ZPWtHrQ3XsxFUNFFqi0p1DZdhIedcmBpWsyjQTJWLrqjPs
	XLwJQh9HNE5Eobl+Sog2kTREmbaf5kvrUWb7+rFEpkJYKBOpfqmpexScNs/vWiWLrEiSNJMyDM8
	I4H+5aljmQhRNEQBPPxjrWHgQkv0md7lT6kbpCkSolhmnIFZgpyvqq/C5QZOm9mINTLXAmyU/mq
	j2ljk7jVRtlIl0jJwQR/roxmRGA19Z+8hhGaQGNE/LRaU7X1dSHfo46I1t4IiGQwuCCEXahiPfw
	qGFlUhAcN/qTdsXekyhbyWlX05BFlzwddQ7kbADs9jR9waSWLNMfrWNsuR/KOFzs017Q=
X-Received: by 2002:a05:6214:4c43:b0:894:a22f:6882 with SMTP id 6a1803df08f44-894d7858c31mr10159516d6.3.1769594018792;
        Wed, 28 Jan 2026 01:53:38 -0800 (PST)
X-Received: by 2002:a05:6214:4c43:b0:894:a22f:6882 with SMTP id 6a1803df08f44-894d7858c31mr10159286d6.3.1769594018378;
        Wed, 28 Jan 2026 01:53:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a35sm1361015a12.1.2026.01.28.01.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 01:53:37 -0800 (PST)
Message-ID: <5a773b89-f3f8-486b-af01-3387c99e53e5@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 10:53:35 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
 <4632ad3a-c893-449a-b0d1-48d9c93da7e9@oss.qualcomm.com>
 <86dade1c-3ac4-4352-8dc8-e7acaaf21321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86dade1c-3ac4-4352-8dc8-e7acaaf21321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oySNKfa3U0yr_CE_uvNA30MtZr28OEjU
X-Proofpoint-ORIG-GUID: oySNKfa3U0yr_CE_uvNA30MtZr28OEjU
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=6979dca3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R5tFhpBbpkMMLyjFO7oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4MCBTYWx0ZWRfX4/xLw3FUDdF3
 mWpnPCxTlbMbgM3S4EHkflvbghknDjDhNsCqj7RqotXucJDgxt/mQCCoW2RBi5rM/zghq8rcWZ8
 lIbbaEBXB+Tk508PRSg7mSSEIEavGr00RB2MKHPo7Yd/lOgTYoIdw6YsiIwa+prnGFwr+K/vssV
 nKTVHcAdFTokR8TwZbK/mWDor69PRYNaucselRyqawpLfcArR3QP/XM7vEXyxZ9HS7h1Mv6okde
 gR8lbLd2KSAm4pKheL6TRHW7uc6u2kbvqeGpDcoYYJb6h7ww2tVAOSdNaQLXPdD4vakp0VwUCpb
 mTt6rkl3NtYhbQlId9tziNRmc7RMhnl0ZhLqmLFVWdZY7s4s8RKfnZhBYYOnf20Oj86SdrRqZh4
 /X2kXZAXwWH5WCCf19f/q7WID+5a49SRVohzMieEqa2TPuPX5zlnJ7VSLU5j0eO2VVX3UcuTq18
 YrUrTt/By0kPnN+zT0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32870-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0866C9F077
X-Rspamd-Action: no action

On 1/27/26 11:26 PM, Wesley Cheng wrote:
> 
> 
> On 1/27/2026 3:46 AM, Konrad Dybcio wrote:
>> On 1/27/26 12:41 PM, Abel Vesa wrote:
>>> On 26-01-13 14:13:32, Konrad Dybcio wrote:
>>>> On 1/13/26 1:33 PM, Abel Vesa wrote:
>>>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>>
>>>>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
>>>>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
>>>>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
>>>>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
>>>>>
>>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +            snps,dis_u2_susphy_quirk;
>>>>> +            snps,dis_enblslpm_quirk;
>>>>> +            snps,dis_u3_susphy_quirk;
>>>>> +            snps,usb2-lpm-disable;
>>>>
>>>> Other SoCs have a list that's much longer, please consult Wesley if
>>>> this list is enough
>>>
>>> Checked with Wesley. He confirmed that this trimmed list is fine.
>>> He said he dropped the rest since they are related to the power saving
>>> features like USB2/3 LPM (l1 or u1/u2) and we don't seem need those.
>>
>> Is that to say that those erratas were fixed in this hardware?
>>
>> Low-power states of the link are no less than desired is possible..
>>
> 
> I think it was misunderstood.  We should keep the same quirks as our previous targets to enable USB LPM support in certain cases.
> 
> snps,hird-threshold = /bits/ 8 <0x0>;
> snps,usb2-gadget-lpm-disable;
> snps,dis-u1-entry-quirk;
> snps,dis-u2-entry-quirk;
> snps,is-utmi-l1-suspend;
> snps,usb3_lpm_capable;
> snps,has-lpm-erratum;
> tx-fifo-resize;
> snps,dis_u2_susphy_quirk;
> snps,dis_enblslpm_quirk;
> snps,usb2-lpm-disable;
> 
> There are some questionable ones that I'm on the fence though, which we should consider removing:
> snps,usb2-lpm-disable
> snps,usb2-gadget-lpm-disable
> 
> USB L1 support is routinely being verified on our devices (in host and device modes), so if its power over performance, we should consider removing the properties to disable USB L1.

Does the fact that we allow L1 entry impact performance itself, or is
there some room for improvement in the drivers?


 (esp since we're defining the HIRD threshold as well...)

Wouldn't HIRD threshold be related to *U*1(/2) though?
I see in the list above you decalred

snps,dis-u1-entry-quirk
snps,dis-u2-entry-quirk

which forbid them

and the threshold is set to 0, so IIUC that means entry is only allowed
for devices that don't ""really"" suspend

Konrad

