Return-Path: <linux-usb+bounces-33324-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SInuK5yojWkK5wAAu9opvQ
	(envelope-from <linux-usb+bounces-33324-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 11:17:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4D12C610
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 11:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 799773042923
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40ADD2E7BD3;
	Thu, 12 Feb 2026 10:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE6Iyn3P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCH9dCpo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119D2E6CD9
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891256; cv=none; b=aiqYlxRr06C1oXFX+mXhhcUkeScDmzINVUPLEAtV/Jwwlzryj9kVq/oLT3FgowgeNUdeYSh39m4m2OgZU1RHQXLINCUMzELUCVCqrU2b7VmQhOcvRfFgi5u/IMxtJUB8wJYXqi/36eDSH5IODCfqybTbgZl3nwe74p/WC63HwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891256; c=relaxed/simple;
	bh=Ks8ETguRIZQ6y9Z2bCCo2hh2wqlbwSYYFYhPaDhmoSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWhl+yjhd8v+G7Ec3MmXYiVaIzc3o3OyHzSjU+Ii7cGVEkJ/xIGJ6mSBgpduwEiqg7kSeG8SRw5QbW2HNFz3xIqqGVoamzIqyJUUo15H5tWhsAwk6Mahp7F6zDwA5c8rqxyBdMeUfYWtr7O89vIyRYi1PD3tasnw/A+48qxdOL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bE6Iyn3P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCH9dCpo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CA0NFi272166
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 10:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYnK7/YGWAJgmnh+bLOiLMyHBpoZuCOqDxGzEg7IH9k=; b=bE6Iyn3Pp4IzvaLW
	3V2Js4Ifoj/cl1l2sQZf9ltvh6XpkJY/s2l3ic5dymc1LmGj0l3ADn4xVHfFq+Sz
	9fRDp40xh4KF8pf39iz+YwgXiR/2I+8D79/mXLfDOPpMmft8Wv3rfJx1tIwFFm8o
	OlpIakwO7vb3SzshDroUsTCJFMX0VWSk27dl3pmDmAq+afC9Vpg1co66gmM/VVT/
	yA9CSG3PdkJbn5qr0VzN81Uz9b3OjjuRg0Mg0rBSJzk042WUI2FECDmtEMrNYOvE
	kL1bTPGAJAehZEjxZr018ZZQXDNRlVuSKvO6PGXw7llz3mlUZIMNd8Hg8f2CzidD
	+tYw6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9bth2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 10:14:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70c91c8b0so294239085a.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 02:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770891254; x=1771496054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYnK7/YGWAJgmnh+bLOiLMyHBpoZuCOqDxGzEg7IH9k=;
        b=JCH9dCpo/Zz9qI9uguP5WkE49NK3O8PJIx80kbkPz3snLPg4a7smitND0/IG4CLaDQ
         Aw00XVHHwoegUhiruWZxeRoPSoZwIuRsdhkXGgkse11Fk5CTXRxOLczAbH6swCtDoxR3
         asUTf8OJUwIKItd+vRaw3r0l1vVf4E5eFvlBO66qrruQwpuX0Aj2nv7a8F2Bg4NNV1Zi
         w3riBhfWNcxnWVagIcJTXaLOLif1mV/31yXN2kFYYt3IzSj5A8K1g5sXWdkmysjnXZkQ
         Pms/hjiFOs20P1ZD9prb5o/98wt7bU3D6ZWnxDzlSe7TYIoJwDcjcksxVC5u4u5nNx0T
         BPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770891254; x=1771496054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYnK7/YGWAJgmnh+bLOiLMyHBpoZuCOqDxGzEg7IH9k=;
        b=lt3Lu9MeI1FEyBEwEe9qO//Kl6mz/DlmVVi1Ufy5XR60PpGt0PYfXUnCoMBMWebp6p
         bZ7+tV77gqFzahHQjUrYLZfGoqAlIBbAqy1nlE5wBfclix0Y3LzYuj2adlvQzUNoqWrn
         VUIKzRVigNq5ay4RHkL2VtIRoZM+npnl13ELF47CPrsQjcjxnfq6VX3qb8AVWWkF4qAb
         EffBF3MYIGoixHB/Zm1zfBUl+SlBao6Ij0AjQjtoWpfqzikgl8IFESk3qwIdo2fcgu3T
         wkB3NGoNX2k2sSKte0ZKGDd9AWdvw8fH43DPiFYS5cX2znLpo6oHsQXsWMuiWeOdltrh
         mcsQ==
X-Gm-Message-State: AOJu0Yx10QuOqAxGPEUNEPAnehcanVfC4JfiQxhbhrsQ8C9cqijpg8nC
	y7Hgu4NqRgNsgcdZnjnrjZy7yIaVn9ZBR0LnenfTnR6qNfjdPFgQqPMSK7BEFf4WfJ7qTfBnDVz
	/k89iNZcDi5O/XcSjizjWn2uOT4RE5arylWSqHD4CuFbpnIZ7h04Fr7ikOi9mgVc=
X-Gm-Gg: AZuq6aLUT2CvNjk8+oUY2BYOqfzuwUb2N61w0LFawNECflsRk6hcFtLpwERM4iO9Wmf
	PzA9cZErkL6K3/R6gUW9kuCfWLial7suzvI/YZU/tiD6WHptqD14WmS1HcgSPOBIZj+1IzeKOBC
	2MuQehImmAovzFFoKDjHdm2cwrZnuMwwO0IcAOsBT/3TO/wVvXL+15mgmnimncipnxzV0Efu6IF
	JVcfWjTy9AGfgi+YkK30vlhG+Q0Zy2VGEHtoIUy0jp3Gkc16TJ58rh18OxPh/Qu2U8xDL+/BWPd
	6kaBoTjXlcmkC6hYJovDQgjk6QMETlcK4J32YTOwBQQW2JD6g5mPwM//9vRsYBYnjBJYDH8fAjX
	3Cck1c3IRiV2Yd9OeQHz6i3kvtuDkeNchrG1TJINIgoYSPZ4sSmZoKeUrUTrBi7puoxCcCN438k
	H+aAk=
X-Received: by 2002:a05:620a:448b:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb33115b5amr212529185a.6.1770891253881;
        Thu, 12 Feb 2026 02:14:13 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb33115b5amr212526885a.6.1770891253401;
        Thu, 12 Feb 2026 02:14:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e94fe7dsm147230066b.7.2026.02.12.02.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:14:12 -0800 (PST)
Message-ID: <34119b6a-c81c-4833-a294-63fc3e76e75e@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:14:09 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2
 controller Micro-USB OTG
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211062923.3794476-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211062923.3794476-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698da7f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=_7ZPjbSY1RcB-ZWpU4gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qj8L_WkesWbWBAaG0DPHv_6NYgf_2jQp
X-Proofpoint-ORIG-GUID: qj8L_WkesWbWBAaG0DPHv_6NYgf_2jQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3NSBTYWx0ZWRfX1WgXH/FuIi/+
 sL9wZ0G365Frzjdae1iHoiMRwHaWljJDXer3HXeMurh94YM63LzhxhBZOzIWyBh0ekFIhoiP2oJ
 KXF15e/v6G89LspAMcSdqQipxkpSPr4jgQv1PXi17FyHYaI7iyquJub6zuW55Q5dM8eMmLkA/6l
 avRaVV5ZV9MijiUngxEC3vtiZp1J+aY0SRm0NJl9o+cNlLin3C/R49Y5i8GZA2IPOW3dcnS+dsB
 f+t28S9rOrsrqxW7A7TdPK61pvZ4yV1z4oGnFMkSHlgU3sG8iWKpgw19hbnOVtq0oEvHyj4eSwX
 36a9Ixpk0MchdWo6BzyC2d4zxmK0WIdg5fMvooCm+pkNh7kinpr/rzM46mgU/ZxrbGtV8+W1yEN
 DNRuIbgGqqhsEkBr2nTPQqi3lj7ogcPkhCuNGydPX4Ufmj0IHdHOqeOuk5BFm1fn/AYoXUxz2OA
 m0iM1QA9IzZHHtoTSmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33324-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.2:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFF4D12C610
X-Rspamd-Action: no action

On 2/11/26 7:25 AM, Akash Kumar wrote:
> Enable the secondary USB controller (USB2) and its High-Speed PHY to
> support OTG functionality via a Micro-USB connector.
> 
> Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
> compatible to handle ID and VBUS detection. Link this connector to the
> DWC3 controller via OF graph ports to satisfy schema requirements and
> enable role switching.
> 
> Specific hardware configuration:
> - ID pin: TLMM 61
> - VBUS detection: PM7325 GPIO 9
> - VBUS supply: Fixed regulator controlled by TLMM 63
> - Configure &usb_2 in OTG mode with role switching enabled.
> - Define a gpio-usb-b-connector node for Micro-USB support, mapping the
>   ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
> - Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
>   supply VBUS to the connector.
> - Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
>   detection.
> - Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
>   VDDA 1.8V, VDDA 3.3V).
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---

[...]

> +&usb_2 {
> +	status = "okay";
> +
> +	ports {

I'm not sure whether/how that passes bindings validation, but there's an
existing port {} under &usb_2. Please extend the existing definition in
the SoC DTSI to cover hs@0 and sbu@2

Konrad

