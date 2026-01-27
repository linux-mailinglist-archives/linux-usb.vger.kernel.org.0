Return-Path: <linux-usb+bounces-32800-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGfJCCimeGnVrgEAu9opvQ
	(envelope-from <linux-usb+bounces-32800-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 12:48:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B03293E01
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 12:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901AD3062496
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 11:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A84C34B185;
	Tue, 27 Jan 2026 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+v+KWlN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoIBrLSp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA5234AB0B
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514373; cv=none; b=cYptHkMGpn46626xNYKf3fbnhWX+Z8znZoNbedJa/8rrR1tjYvmpToK3I5j2gmgftkDAXXFqYty4DJIC46CCFr/wsmtpDa/h2RnLRgWwS0U19O+HFCl9dSQC6NI6LIXkger4HvrIvo7lVfCWy/0//N0Qu9RpwUP8DFxewECDo/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514373; c=relaxed/simple;
	bh=8Y1fnVKjp6IEWN6IZPMX6ZFWAIUDi7MjIKUCO35bMEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIH3uhkTq2H6aenQ4DrTtaBv1Ljv2bf5JaeooA33YBVXprRdlDhGTKJD6TSHeyrejCTekxzW4xfhglqIxgeu69GkplE4vQpXlDI18ecOjW0eq0HpWUYZQppn5wvw/HtnDHR8X0kBaC4y3rlceyXJjb3ImW6iD/byQeT3GDK874w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+v+KWlN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoIBrLSp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAbvs01268765
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 11:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	camxT/u1sDFfuBtTBfipsSGIU73/JXukIB+LwjhlfJQ=; b=S+v+KWlNoBsmq0h1
	1ygpjflBgFfM84y7N/gN9fxPKfNywRPj+E/ge1sItcHEZliiycD5xqClekCfYeva
	ndpplnAOpnJFvJw/7BcZdSMIwFsEILZILJF7Br20hTyE19UftprZpuGPh0QFNdab
	fFJnt+vbiNAdN/wXU0jy1Jxg1HE0ZEsv3YObNLubTPbJpM7IixvJxqTL0EUKT/c+
	UeLKYzyv8ppImS0GT4nl44bMFd9dtUXjGLL3HzBx3wK/RG8541rt0yOMyH5/SGWS
	0/p5Yfcw45oD/MNFRLzmz9TUwEirYTV40pNBYpq4854KQ2vSQjOf4oRhE12ukgx0
	ZmNbTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyashmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 11:46:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so114750285a.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 03:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514370; x=1770119170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=camxT/u1sDFfuBtTBfipsSGIU73/JXukIB+LwjhlfJQ=;
        b=hoIBrLSpaGvz0NqSsMTTcUhlh1nbd53uXJ40+z/jTh4xzt4by8fOxOuqSlNckw2wg5
         TgtSCedO7FPbgEr3EjuK7Gl64bnFgyvq5rNlAq3XG2YpKveXZSqI8wVVGyFfexcnUjF7
         oSEsvodVRH/opc+jGRwiXUTr0QU2STjRxR7A0Z4uqgkP5xpGwWpaGSQxBi0rcBvPBQkk
         rvnKSdXgHGZubaGJ2TfFk/MiAFG9YAAMaoWnZmGJVFeoloV/8rCbxAs2iABkGIFilLml
         Odd+hZHgh+J38biL3otiIKvJqDYAUgAjX5xhs73OyovP7VJ3HgEGXdf2VQqptJDw2gS6
         Xx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514370; x=1770119170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=camxT/u1sDFfuBtTBfipsSGIU73/JXukIB+LwjhlfJQ=;
        b=IJP4iqfOHZVfPQ7hj+635klYevZfrb4kslBK3/LrDGzD/vfBFwKUxsameeoAJLCgZL
         GPh6rHUFkTLZuUZ4srfznzcWdePlTrzx9ZWiYrPyc4Ketm0pJAkBrHz0LOrAR9yDxV28
         jacCc9wjxp6Qw14gEYPhJy6QN4FubyreAbgnA0sqtIT0ebQ+dYb18x8VpSNfQT43B69Y
         Q9NVF9JStWU0enS0FMaN7eZjStSwCNN9yiG9OpmHMIgsgkfQUK6JjlOUSpM+CSR9MpfX
         bIfP+ZrDTPGzegLU2Gqbabi9wy7BEKG5Sx7cZS6NP1lufRDqHopG0JItFC+6/F7x4eIy
         XTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+RbBydyculcHr4eDapFq9Ea6Dt4T8u7xZy/aelMZp7fA4GC3aQOckEFS0Zl83MWsnUoKZ0VEdIuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9FVNBfPuKAsgcAnkidnzCHLiwBMvmUgYhCR1b0NXl6Xz8znQ0
	H857zofepNJwpkO5htdJ5Z5+cnoKZXdzPzPJ3fffznAPZUO4RfyuZQtx7OLaJiKITlht0erWn/a
	X55LsU6zqn/QQ81F5DMS554syWTl9tpXZMIxEgFkJGy9bdcyNWN5UORPT6xLVmIM=
X-Gm-Gg: AZuq6aL3QKCkn4PXFkmbM92PaCQfTYVmAIgIshVOLOt16AIVOcBbJ+xG0vxAplIpCgH
	XLAkmASzVmpz0dljKhD+Ywifc1lQvweMFZaGqMehuYTUIKPp2DuYZ+cMobIInED1AApF+nPWQqI
	tGIH+Byjbqtu1ZernqTCb85Koc5vbl0vRu+FSyNSUBGSkseyQUNzqQAPyWGedb6607H7x/IjjWT
	obvEz5gP1Ec69hkGTg/3ffYUwMP/D0wTY3+jeUFZiIVqPoEuTIvAetHtgOC/N8jUBL5IiHSYME6
	ozmiJTz3AkFB9X0FRqxV/MVY7EdO2LxYaGgZlXLXcvSjPgwYZ1376++PyacKZ+uyHKLCWeKPwfB
	GRWhYiI8KCMIb2iJfV8zpA/m22oQKmLU9uzqY/m8mjsUZ9jW4/L8QtdgDB50BTRjPm6U=
X-Received: by 2002:a05:620a:190a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c70b84a25bmr120912985a.1.1769514369759;
        Tue, 27 Jan 2026 03:46:09 -0800 (PST)
X-Received: by 2002:a05:620a:190a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c70b84a25bmr120909885a.1.1769514369228;
        Tue, 27 Jan 2026 03:46:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6fe45asm784820066b.35.2026.01.27.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:46:08 -0800 (PST)
Message-ID: <4632ad3a-c893-449a-b0d1-48d9c93da7e9@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:46:05 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] arm64: dts: qcom: glymur: Add USB related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-2-98d6d387df01@oss.qualcomm.com>
 <01de4054-eebf-4ef3-ad74-c806b208a848@oss.qualcomm.com>
 <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6lieos5uudkgynizozrmzrj5ov57frzzl65b2fpanwbhbmehot@z5uhyv4ipyet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A_O8OWbwKwyFSUalYC9KUViJnk3VlV5b
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978a582 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qn_fkN7zqQ4dxzFuYcEA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: A_O8OWbwKwyFSUalYC9KUViJnk3VlV5b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX0azHeKt66KNv
 UODfUfsJ2mqjX0wucz6yuwi4qPztHWyApWx3tjF5frXUJIFnpP0iOghrmh61n8Htm8SsnKZw1e9
 ugpp0esyrmWTPHDFU48HkBKSg4UvihKkiHPN/YiMZWo6tVNmpEvB5Mg2tGDFWJoz2ek7CABJ4/7
 Pl1ylPuwUQOxsNkz3J30us5K/GNN+ppR+YZEg01WH3Xsohf4nAhmuem9fq4JbQTYFh6ShgBPbAo
 xhzB4nRgUo5Lq4rG3QPTsly+MojvPAOEsCAJ271/hmCIEPVFHnu9e7VYPfZSqnnK9bVn8IoaCuD
 X95ftRVnkMP/Y71nOnYsek5H4dIQ0dpW7UWrxwXGtDEQIyL47KZrddCbWoNM04dXSqZ+c6IO/jD
 3AnGlwUVmZwp1fL5m3gyRP5fAXMpM+WdFLHktYH0oEgY0a0Vg5t8A5bhXOnv8JsUsXTaB/MTKiX
 WQlHsdum1nOm2wjFYDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32800-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B03293E01
X-Rspamd-Action: no action

On 1/27/26 12:41 PM, Abel Vesa wrote:
> On 26-01-13 14:13:32, Konrad Dybcio wrote:
>> On 1/13/26 1:33 PM, Abel Vesa wrote:
>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>
>>> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
>>> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
>>> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
>>> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
>>>
>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			snps,dis_u2_susphy_quirk;
>>> +			snps,dis_enblslpm_quirk;
>>> +			snps,dis_u3_susphy_quirk;
>>> +			snps,usb2-lpm-disable;
>>
>> Other SoCs have a list that's much longer, please consult Wesley if
>> this list is enough
> 
> Checked with Wesley. He confirmed that this trimmed list is fine.
> He said he dropped the rest since they are related to the power saving
> features like USB2/3 LPM (l1 or u1/u2) and we don't seem need those.

Is that to say that those erratas were fixed in this hardware?

Low-power states of the link are no less than desired is possible..

Konrad

