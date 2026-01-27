Return-Path: <linux-usb+bounces-32842-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK/BDBY8eWkmwAEAu9opvQ
	(envelope-from <linux-usb+bounces-32842-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 23:28:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 883509B0A4
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 23:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3377A301779F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 22:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264AA3612E2;
	Tue, 27 Jan 2026 22:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldh7SYeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFFGkjP1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F032C925
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 22:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552811; cv=none; b=AaapdaW7tgmtmR0E4xjX2bDXeSEylh5C5UVrTdOYUEkyQTyiDRqgoaV1h42WwyuVrAunY9Eru+SJfdbg10aibUe1XkmGmYRq+FvSYLEMkBmh3uAvbYCicbM0TaKJQkGk7MdwX66v5qakks0CAhVln9+H8xeDX348eGlYTWpxjdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552811; c=relaxed/simple;
	bh=smVYfjKI9+K/W+GPz21M2ajvRHbJ20ADwbev3uGYGBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cqdv6ur5ZIKkjB8jhgz9ZR2d1O0fWYZdN35jeIZGpZCppMtfIKiVRJadHYi1oChroRUOX1J4sYJXSZPhd9+pGwEgQ0RY2Uh2RzvtzE0/lSN+wV9fLaqOZb2Wk4xrxDhD+awmt53J4KPXh8Ghb4zQwhi9fmh6gs9WS1dDwofq6+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldh7SYeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFFGkjP1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHheW91952942
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 22:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/SjPWpC67opAaYXZUS7OC9NNECnpHUQAa71IYbObk1Y=; b=ldh7SYeqDUz9rRNl
	/HjDP13oFgbSQ6/h0H9zljCre1eXmzIpAfSQPDeGLtEg/EkkjlQibACnYlYeeZEJ
	gSs2dowBpOdnkf5xzBt8MpE0f8JggxYhGgCSTFJ/R6mlD6fozZxPUqDPH5uUcw29
	6FqKOinQwSVPUrQVVk0DjfxsqFJTyOVfoQMhNVfkhBp9m6+epVlJLcOMSIHZ5Soi
	NHYBr4GgCG5AORYGSVEOKqPhvKEBmDaNJnpaF17cr2q5b+TmfLN5dcd+2yg+lEa8
	uQfCDaF5IXXgeh259qsKTlp1dpAyCxtPgBGPB2WyakZ8QDDVJzjvKjX6Vcl/Vmzm
	Qgbc6A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by2118tuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 22:26:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b72b6fc371so5511175eec.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 14:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769552809; x=1770157609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/SjPWpC67opAaYXZUS7OC9NNECnpHUQAa71IYbObk1Y=;
        b=cFFGkjP1si6vOV90DNNKr8K9eUYVJgt77PbcwAtqa9wiNvXSE1vAu/SvWcljWHlv3S
         tbkV+B+hLlEyPkNZ8BOd6gA9c5ju5YvZDiH8ydkusi1X6Rf+7rfz5rJb5K8uxcPYwql8
         WQq0io9FtyJ4/nWkbjZVrmNYKlX5QJKI25eZ9/g/K0Gjf6HL15VVI99HRqn13TVjIM1D
         NPrxszuDilaEjWSosq9TCqShvkHRqpHhYoe7MzoPby+Ilw04KqSFyWO7RxfrYFKpKbgT
         bsrLysZ9Y/WfJwt3PiGSTzwxrenFEyMCY0QGg1j+2rWhd36uZ1cO7L3oWkX/j8Yn+ho5
         TY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769552809; x=1770157609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SjPWpC67opAaYXZUS7OC9NNECnpHUQAa71IYbObk1Y=;
        b=iRGaZm2qvLaB/305paQv8gGWz3GJ0dDY/qP56U+14bawaDDtw1+shaFQDThHt8NUXe
         FLHrq0NhYqkM6SRAJrUskuUe9Lrw0cxVzyEduDYBHZ17TU3lTZUblq4hVfhC7rYb3Zxd
         0NE6S13oOid2O3uGVu2iC1d4sfdRBZis0LmvI4Iw3l8u3DlST0tnPno59QBdKfXlVlvd
         PzjFRjZoqYm1SppLJzNZO27RV3r4/ZrRNRmq9fCapfLhTHtBgFYThnG1f9i8dJWdv770
         G+rvTb9oHprPwxMQsuATrOh9Em4fBimvPp7ZeUgCfbO5pA0JXJwQ5DEw1H1kJ4OUJFBE
         mS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWj1N10qBCdc/0o+3fTgcVjCV32Su4oTVcbYrV4ky6ZZlWptllJVue5JAVW/sXeaWSEWyYP9J/WqVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGKkO3Gsl8IRr7RUi0xe+bN/IC8OdSreqZ7QYn5iPsdk2QnC1
	eQvAQWxSZcuJyZx2nad2mk/iDXvvPDYY6EK888T0jvZS4giZ6KkdKDZd/BnX73b5QoQL6F7Kgkj
	uzgiuSoKxnTnkMc4X16/GPGedv4HkglllEjhOIasFFxkU6vSCp1MdyI/MThkiM0M=
X-Gm-Gg: AZuq6aJc4p0MQflLjcNYfEA4/hXFs0QUuMCnHKZ4w4FNpisWHxP9i+MrWmMhebyx3tF
	d/4FkWW5NVirkRuWWHWB7+UHIvkkzO1RSL5PJE3YEa8gzJEN8lSzK3eWOcWFjMPoSwn0wm9jD0T
	CGGiQEc1rk3EYazAwZob6wm5reECbw6z+sWvJRnag719hToOIGClzTp8fCOK66X81rgXAeK2s8i
	yMKObOMdMdrkD/zpggS+1hJGZPumXp8A9akRnsiTKrqQUaruRuaacQEBNg36lMROOG2flHNl8zO
	xOWHQ+mqD1lembz24+VW99jZ05rkhhdCjHP9zzSu/IZ687wJpXyOVs/sdrM3Z1Cbro6a54K/2UW
	EHvK1LfKaOVnO1rvfVFQQQrBYPbCWvPqaCgPtU7qXFyljULuPlilowuQj
X-Received: by 2002:a05:7300:cc12:b0:2b1:7486:3a6e with SMTP id 5a478bee46e88-2b78d90e3e7mr2073645eec.12.1769552808799;
        Tue, 27 Jan 2026 14:26:48 -0800 (PST)
X-Received: by 2002:a05:7300:cc12:b0:2b1:7486:3a6e with SMTP id 5a478bee46e88-2b78d90e3e7mr2073624eec.12.1769552808288;
        Tue, 27 Jan 2026 14:26:48 -0800 (PST)
Received: from [10.73.54.120] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm97762eec.13.2026.01.27.14.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 14:26:47 -0800 (PST)
Message-ID: <86dade1c-3ac4-4352-8dc8-e7acaaf21321@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:26:47 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <4632ad3a-c893-449a-b0d1-48d9c93da7e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE4MiBTYWx0ZWRfX4sc+NnrMlOdZ
 MIW/ZyvD1j/hPNYxTeyKnqTH+f1Wayc4zI7Iyhd0EoKqiCN8aVFe8Cy/GGCbRx5E/ry2uJoChvO
 TfXKOfaoONsKWGi9fkP1Ck1t2jeNVKFF0OautrCxMiqzIjhTtS1h+cloo5ujRvl7klPCaaYhhZ+
 LT3PIjTfMvFvmRdfNzK0A5MWLrnjiUuTemN7G2u9uzaWx9BJsLkvB1Vy3sKK8ALmw2dsbcqRkyd
 YIgT32bSz3D9cvw7cty5wORByG6m1mV6JwX7i4NwqL873Op+tjqNzlQ5yQL8hc9Z1OK9ZKV5wMO
 hih+JhcApNvInhnyciL9Q4+4+qTRYp63khDr50uoEsSPEHQt6ftD9D2+EUHPxMvPtJtY8/g/9WW
 CUsDWiySX88vFu+g32xlLCaFrEz98+qGNgDuX1IInVf9GsX5dYUklM5CfS8x0CRs8mc2TbNojjB
 RRoO7eH8EjmukVkWQTQ==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=69793ba9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PwVsVxMXDES1znWPHDIA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 4TijhLj_5Q7fb6Lo5zKV-UkLn9rnQIEE
X-Proofpoint-ORIG-GUID: 4TijhLj_5Q7fb6Lo5zKV-UkLn9rnQIEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270182
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
	TAGGED_FROM(0.00)[bounces-32842-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wesley.cheng@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 883509B0A4
X-Rspamd-Action: no action



On 1/27/2026 3:46 AM, Konrad Dybcio wrote:
> On 1/27/26 12:41 PM, Abel Vesa wrote:
>> On 26-01-13 14:13:32, Konrad Dybcio wrote:
>>> On 1/13/26 1:33 PM, Abel Vesa wrote:
>>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>
>>>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
>>>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
>>>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
>>>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
>>>>
>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +			snps,dis_u2_susphy_quirk;
>>>> +			snps,dis_enblslpm_quirk;
>>>> +			snps,dis_u3_susphy_quirk;
>>>> +			snps,usb2-lpm-disable;
>>>
>>> Other SoCs have a list that's much longer, please consult Wesley if
>>> this list is enough
>>
>> Checked with Wesley. He confirmed that this trimmed list is fine.
>> He said he dropped the rest since they are related to the power saving
>> features like USB2/3 LPM (l1 or u1/u2) and we don't seem need those.
> 
> Is that to say that those erratas were fixed in this hardware?
> 
> Low-power states of the link are no less than desired is possible..
> 

I think it was misunderstood.  We should keep the same quirks as our 
previous targets to enable USB LPM support in certain cases.

snps,hird-threshold = /bits/ 8 <0x0>;
snps,usb2-gadget-lpm-disable;
snps,dis-u1-entry-quirk;
snps,dis-u2-entry-quirk;
snps,is-utmi-l1-suspend;
snps,usb3_lpm_capable;
snps,has-lpm-erratum;
tx-fifo-resize;
snps,dis_u2_susphy_quirk;
snps,dis_enblslpm_quirk;
snps,usb2-lpm-disable;

There are some questionable ones that I'm on the fence though, which we 
should consider removing:
snps,usb2-lpm-disable
snps,usb2-gadget-lpm-disable

USB L1 support is routinely being verified on our devices (in host and 
device modes), so if its power over performance, we should consider 
removing the properties to disable USB L1. (esp since we're defining the 
HIRD threshold as well...)

Thanks
Wesley Cheng


