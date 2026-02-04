Return-Path: <linux-usb+bounces-33109-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEMJIAKZg2lnpwMAu9opvQ
	(envelope-from <linux-usb+bounces-33109-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 20:07:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D0EBE0D
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 20:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24A1430143F5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 19:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8E4428493;
	Wed,  4 Feb 2026 19:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJ8obB5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WziRNEqF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A00427A1F
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 19:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232058; cv=none; b=CVsitIAjjVk0h6pxFuoFkZiXFclT65sb0aWC/Q6UDQHWo6egfgTRjEJaSxyrEY/3y8fLJ56xX5MXEXeYuN1066mcpF+a6qmBrHmOKwAFOEGCA7VBFghEJ0o7Xp3sQWlpjl5FadFegrLeSjO1CgRtRc11ohYCM+0qnygndWFsR0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232058; c=relaxed/simple;
	bh=SoMKe9tBPCKeq3RB1xYxcmbO88Qp6KnrupxjxV5bXb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBrb6VXyKCPk4d4e5Qp33EVRlks1ACL88Qv1/1+7POxBUPUL0urb/TtezzCrsbeQYWCO9W/A1vl/AI4ryYQED2stLDzZZW0mbI0pTkgwJoXZBOAFDBETU/z61g3uHe+Gk3mxjfj6N47tTJk5494MdXiXYjQoK5wVPnzT9+AYJBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJ8obB5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WziRNEqF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIUJC1246380
	for <linux-usb@vger.kernel.org>; Wed, 4 Feb 2026 19:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35u4prJ6lPKOu7ojIscKNVAgH089StBFEv3GIJwCsWA=; b=pJ8obB5TAJGIg2DE
	z5XRaQtie3sEHyxCJQPVVFhDvqBdAZC6OeTG2P8v33gu2jT+8tn/YmFHS6fBI/es
	1J1PTV6pxxRy0wllbUR0ZTVAbd36+4s5qPHJDEzAKKZdOJteLT+dyHmjlWDpl+Yq
	uU0n/dj+3kknaRuePmmPxtlVEjqh/r2nLb+ML2bJNXuUg2vvIXE1ZW8JeuBzYLjx
	wVsSrFLdFSA5bjRpVU3nQ5rnpT5FWhpICPW9aDBG2Z4BTE0WLv/0YpLRuAL5Erxq
	CqZc6Sl2+Ga5iY5bN+1sgJsOROIE/Kpl+x/yt5d/2pABYIfAbUahAIBuyTyVpVSi
	qN5N2A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru9btwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 19:07:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-124aa710af7so579821c88.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 11:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770232057; x=1770836857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35u4prJ6lPKOu7ojIscKNVAgH089StBFEv3GIJwCsWA=;
        b=WziRNEqF855vesmu+SSu3N52wKvkvLsf+l2bY70ydA9PTWZSz6HSlReR+NzXKhm2P9
         AhF4bvv9pFp6kFeSUkB8zIJsKL82j8zNGmbcbM6bbec2qAEDAD8BjAhVLnkk+HAfSwZV
         jRS9zyF/Hi3y5h85TjnrGb92LWbCx0XlRvh4AhwqaE8AuWCpI1uLpn6vW2mcGehdhcRH
         9zsVgLLUpaEkAGV9GqOOFAn/dSSyj3sb4pHAOg5ukaF2n4lwEcAJaAeXFIdjytxlQvTU
         AdcuOxBa/fRDmv53mzuSKM45rKYLBqsfNttGSilWrJihqbQv4paqP3Y5A3ZNMuoYi75r
         brAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770232057; x=1770836857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35u4prJ6lPKOu7ojIscKNVAgH089StBFEv3GIJwCsWA=;
        b=KgFCVQ3plCAUejbxxmgD2ojLu7kJ4V+EhX89WX7RAPCPvPeb/JNo/KHl1LNTYTvnWz
         A5AmvrjiuYgiaOfZRnzHm7IKaApfpmmoU0q3gDbaZNaH3hZBnIpQFdnVWHKcUtAwGSz0
         BXlB85j4ImlyW+p45VzIf0AnoSuHXJWptPbNv4dFVw4ZscfDF0Zlg386atZiy2vj1wVt
         ldUIaT8qEwRXa1m8cYSL8WccSRc9rzz48rd6y/zLpEST6ugCZFQrY1UzVOAM4Q8HtZlg
         Cb6AitcAzYKhFflviQIKJpokXiVu0mnIkbJxbA5V9LX0mvxaaaCt/3nTyhRvGk/moD0q
         3TcA==
X-Forwarded-Encrypted: i=1; AJvYcCUMRMRSe9JxmvdT7OXmoZYKn2vlhabKoGGKR43+EVn3GmyALNHQTUrXEjsxPLQRD8fmcL0valv6wMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIn03NQP0EdZGnsaC1ol4n0QXhwVO5xHkhDuALj+WQGVvBsU9a
	hmdiAOm78MqPWzmd9kIWZE6rWlEVlCc2gExVGeQ0URGQjDS6SfY+RGSVZ7bgSggQ9/aimhzlT9h
	rpDTMmFLtwn5334wtmNLxVVCvWeiHe8MPj9BIxOujKHuJ/WyGBrAPANv5Yw9T1cQ=
X-Gm-Gg: AZuq6aLQQIIqAX+2s4coYIStpW4ydm+3nxXfh0u4sISbiAQ/9czxntoUSM8MaYXm4hO
	t6MkItrElCVAB9NhzT9UkJErotvXAnnDAkDZUaAakQ57UR0D2OGDPMzwwZhaPS9QIj5UsMD6/b6
	JJM/sCURdr8FITHD3WTgEWWhrjS2AT8pW78lC1P9xTXv/U+1YSO9DZAzcKwVxSCRFIqnmKDgMJQ
	lpTjrg80I1SrbCt1FbdRwP8IRl82djTcS4n0MaPpErDGKCNSPQMCvrAeYUfMHKxqcqj/o7FWrte
	5AJkDNjdUxRQ1x0oUAKPDwSeIu+uyS2f89P8BzAgH4dGMUOcJ1HnO1IprmzeVSnNqffkeSZkisl
	Z8VoBmtu8FzsWLnn9fXOujqbQz1EcTErmVHsTq259lawldA==
X-Received: by 2002:a05:7022:6185:b0:11b:9386:8262 with SMTP id a92af1059eb24-126f48d53f6mr1446139c88.47.1770232056722;
        Wed, 04 Feb 2026 11:07:36 -0800 (PST)
X-Received: by 2002:a05:7022:6185:b0:11b:9386:8262 with SMTP id a92af1059eb24-126f48d53f6mr1446125c88.47.1770232056067;
        Wed, 04 Feb 2026 11:07:36 -0800 (PST)
Received: from [192.168.1.3] ([122.177.245.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503ea14sm2687510c88.16.2026.02.04.11.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 11:07:35 -0800 (PST)
Message-ID: <335690cd-d28f-445c-b3a5-33903aa3234b@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 00:37:25 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd
 <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com>
 <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
 <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
 <fycr33dqcosay7ake3nbbeaclhqvynwzixas4u3ocaerpqbu5e@shoibdd663vm>
 <6a982b56-2f4c-441f-acf7-a8e77ea55600@oss.qualcomm.com>
 <xfl4fir3l7ckh66zok46uot3xd63jptnyb5f3wsw7cok4rtqsh@23vlnfukpoi5>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <xfl4fir3l7ckh66zok46uot3xd63jptnyb5f3wsw7cok4rtqsh@23vlnfukpoi5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDE0NiBTYWx0ZWRfXzHvm30GDTOre
 WIJE0xZOgDjB1RTUzR+5pGMckf+dz/gGpNxCoIPaOVLLtv1CIrGZ8EHXz/GDTQV1sh0tO3qFmed
 Dr3cEd1i1VbtXR3lBAcarYfM7nrZMthD1k2zCNDEH/NxlnKysnK4OGgHX8cX9EGc99YCHbjBJ0A
 K2KMy/vtoRUajNUMX6QPzLm5VQtNKfpZs8jGVCA6ZmYzxsMGi12VF8a9DhbaSvfAeQQQ7Qrf4RQ
 XrulXc9OAzWx6Jq1d2e8rF/EakE8LpGKlPzDf/W6S/W0ptojgndK7VacGTREdiGZqaYCP6Q+dcE
 /92KBBaxojLb2EldCGMzLjLwmHfSVovmtAVvS39ieY02O22ImESqOzyMd6XigDkpBs9kLjwnM39
 sdAB2nSowSVdzxLqy6BIW9zE7GOYZPNMMqcr5yHf8oSP/LuAgs0ZSjifF8YxYxfE0OS3YJQZohR
 3bHMh3nI5RXnWP2d7IA==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=698398f9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=dNH3tcNQ3HURC5PwJRMCKA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2GQ0Ek6G1JM-_LCT7nQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: XhtQNCnEY0drvfFNmXBJ6eJyF4kJXJER
X-Proofpoint-ORIG-GUID: XhtQNCnEY0drvfFNmXBJ6eJyF4kJXJER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33109-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.47:email,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.2:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 006D0EBE0D
X-Rspamd-Action: no action



On 2/4/2026 4:02 PM, Dmitry Baryshkov wrote:
> On Wed, Feb 04, 2026 at 11:26:37AM +0530, Krishna Kurapati wrote:
>>
>>
>> On 2/4/2026 7:03 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 27, 2026 at 10:53:46AM +0530, Swati Agarwal wrote:
>>>> On Thu, Jan 22, 2026 at 4:02 PM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:
>>>>>> Enable secondary USB controller in host mode on lemans EVK Platform.
>>>>>>
>>>>>> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
>>>>>> having 4 ports. The ports of hub that are present on lemans EVK standalone
>>>>>> board are used as follows:-
>>>>>> 1) port-1 is connected to HD3SS3220 Type-C port controller.
>>>>>> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
>>>>>> for Bluetooth. This port is to be used only if user optionally replaces the
>>>>>> WiFi card with the NFA765 chip which uses USB for Bluetooth.
>>>>>>
>>>>>> Remaining 2 ports will become functional when the interface plus mezzanine
>>>>>> board is stacked on top of corekit:
>>>>>>
>>>>>> 3) port-2 is connected to another hub which is present on the mezz through
>>>>>> which 4 type-A ports are connected.
>>>>>> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
>>>>>> connected.
>>>>>>
>>>>>> Mark the second USB controller as host only capable and add the HD3SS3220
>>>>>> Type-C port controller along with Type-c connector for controlling vbus
>>>>>> supply.
>>>>>>
>>>>>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++++
>>>>>>    1 file changed, 208 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>>>> index 074a1edd0334..a549f7fe53a1 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>>>> @@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
>>>>>>                 };
>>>>>>         };
>>>>>>
>>>>>> +     connector-1 {
>>>>>> +             compatible = "usb-c-connector";
>>>>>> +             label = "USB1-Type-C";
>>>>>> +             data-role = "host";
>>>>>> +             power-role = "source";
>>>>>> +
>>>>>> +             vbus-supply = <&vbus_supply_regulator_1>;
>>>>>> +
>>>>>> +             ports {
>>>>>> +                     #address-cells = <1>;
>>>>>> +                     #size-cells = <0>;
>>>>>> +
>>>>>> +                     port@0 {
>>>>>> +                             reg = <0>;
>>>>>> +
>>>>>> +                             usb1_con_ss_ep: endpoint {
>>>>>
>>>>> This contradicts USB-C connector bindings. Why?
>>>>>
>>>>>> +                                     remote-endpoint = <&hd3ss3220_1_in_ep>;
>>>>>> +                             };
>>>>>> +                     };
>>>>>> +
>>>>>> +                     port@1 {
>>>>>> +                             reg = <1>;
>>>>>> +
>>>>>> +                             usb1_hs_in: endpoint {
>>>>>> +                                     remote-endpoint = <&usb_hub_2_1>;
>>>>>> +                             };
>>>>>> +
>>>>>> +                     };
>>>>>> +
>>>>>> +                     port@2 {
>>>>>> +                             reg = <2>;
>>>>>> +
>>>>>> +                             usb1_ss_in: endpoint {
>>>>>
>>>>> port@2 is for the SBU signals. It can't be connected to the hub.
>>>>>
>>>>>> +                                     remote-endpoint = <&usb_hub_3_1>;
>>>>>> +                             };
>>>>>> +                     };
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>>         edp0-connector {
>>>>>>                 compatible = "dp-connector";
>>>>>>                 label = "EDP0";
>>>>>> @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
>>>>>>                 enable-active-high;
>>>>>>         };
>>>>>>
>>>>>> +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
>>>>>> +             compatible = "regulator-fixed";
>>>>>> +             regulator-name = "vbus_supply_1";
>>>>>> +             gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
>>>>>> +             regulator-min-microvolt = <5000000>;
>>>>>> +             regulator-max-microvolt = <5000000>;
>>>>>> +             regulator-boot-on;
>>>>>> +             enable-active-high;
>>>>>> +     };
>>>>>> +
>>>>>>         vmmc_sdc: regulator-vmmc-sdc {
>>>>>>                 compatible = "regulator-fixed";
>>>>>>
>>>>>> @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
>>>>>>                         };
>>>>>>                 };
>>>>>>         };
>>>>>> +
>>>>>> +     usb-typec@47 {
>>>>>> +             compatible = "ti,hd3ss3220";
>>>>>> +             reg = <0x47>;
>>>>>> +
>>>>>> +             interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
>>>>>> +
>>>>>> +             id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>>>>>> +
>>>>>> +             pinctrl-0 = <&usb1_id>, <&usb1_intr>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +
>>>>>> +             ports {
>>>>>> +                     #address-cells = <1>;
>>>>>> +                     #size-cells = <0>;
>>>>>> +
>>>>>> +                     port@0 {
>>>>>> +                             reg = <0>;
>>>>>> +
>>>>>> +                             hd3ss3220_1_in_ep: endpoint {
>>>>>> +                                     remote-endpoint = <&usb1_con_ss_ep>;
>>>>>> +                             };
>>>>>> +                     };
>>>>>> +
>>>>>> +                     port@1 {
>>>>>> +                             reg = <1>;
>>>>>> +
>>>>>> +                             hd3ss3220_1_out_ep: endpoint {
>>>>>> +                             };
>>>>>
>>>>> Why is this port disconnected? It it really N/C?
>>>>
>>>> Hi Dmitry,
>>>>
>>>> Sorry for the confusion, Can we do it as follows:
>>>>
>>>> hub:                    Hd3ss3220   typec-connector
>>>>
>>>> usb_hub_2_1 <-> port@1       port@1 <-> empty
>>>> usb_hub_3_1 <-> port@2       port@2 <-> <empty>
>>>>                                port@0 <-> port@0
>>>>
>>>
>>> You still missed the _why_. Why port@1 of HD3SS3220 is not connected?
>>>
>>
>> There are no remote endpoints added in dwc3 node. Since we are making
>> dr_mode host. Hence keeping this remore endpoint empty.
> 
> How is the link between HD3SS3220 and Type-C affected by the DWC3? What
> does port@1 of it represent? Do we have SS lanes between HD3SS3220 and
> the connector?
> 

Yes.

The lines go from Soc -> Hub -> Port controller -> Connector

Hence I didn't add any special endpoint mapping between usb controller 
and port controller in above provided diagram.

  One port of port-controller goes to connector and the other goes to 
where the lanes are coming from. Usually its only one endpoint from dwc3 
usb controller to hd3 port-controller. In this case, since its a hub, we 
added two ports (one for Hs and the other for ss lines) to hd3 port 
controller.

Regards,
Krishna,

