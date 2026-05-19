Return-Path: <linux-usb+bounces-37682-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEa8D9A/DGqqawUAu9opvQ
	(envelope-from <linux-usb+bounces-37682-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:47:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680D57CC5B
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39069310D5FB
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C53346E57;
	Tue, 19 May 2026 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8J5oJUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvYVAxVO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5DC352016
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186955; cv=none; b=FA4Yr34byY1U1nMILktTWOR9BC8DAt00B0SifcOHGOeuwnx2xh025SZo7sQavOuoVV8ee7H/mMPVCN9D8UGG2GKW+E61hnHo0Aq93WGX5B2jrI0esi3nYHcZgorBX63Z1n+TNaixujabAliZ0B+22rF1JqXahfUMM2Dr2XhEywo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186955; c=relaxed/simple;
	bh=BJ28QJ5EGSf6/hdTjCUG6rChBi+ee/XSn/fFhwIkwng=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mUW0UFvklAHgPWAMSn696sQPZ7JYkxIot6vqJG4ZEAKF6Vyt0Uu2VKpy9LrUAtAjC9sDWkCBB1p9aVKpolkD0se5yn8jvpE0Qw3I0pSAOIcu96qF02eTaN4/Tz20vJavZP5z3YwH5B3IlooRX0qoqp9VrL0gPmyZz6xsx33hlg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8J5oJUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvYVAxVO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vFrh1055038
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=; b=J8J5oJUyPx1Zo6rs
	HOm0qgMVulhJ23YFOWOQjwv1m82pb3hz/qFIm6Pze5wfY/C9q0D6DnJiBBTlJfIM
	rpmZSs5buggTV8uSmLhrIrN9+LvB0ZCy7kmmGAKumrQKrny1FXD8kGXW15kNHgOv
	bfsbVemUkjAVMCe83RJznDE/znbt5eJ/2imYAWCkGlQ8gjQNdOfQE7toD2FBsf/r
	OfBltj7P9HoBxJZ6e9XQwWSdBtMGS/jFZLFPTSdQP5kaycuT+bgTsIFNJqJVMjVD
	2hxiODFcEl27C24gLyyJPuci/B0WFVh2Uz30UMebaIiZaFila4kdwL4wtYEtc6Ta
	MLF9Wg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npar4wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:35:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50de6db1eabso11101061cf.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186952; x=1779791752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=;
        b=PvYVAxVOpAbg9ul+CBWwcTsV1TKTEbQL6pLbswarlabPfScrLRuHCZtU/OQlF6VuO4
         5CmKof8CzT11fFGFXO59Mc7e7BFgtPrNqshfdvSeCf4VECXXOxyPlx/Mq54lWSikj3jx
         3y8o9yqb0JV4loUegl4x+8v56/fgsn3MoANpkqQnrRXTKKrFxYFYVNQquqNh6UqLCkxc
         RZMumsjALf5BKFjsbyVSC2dCa7LR7IWsc0CIJcqJCsio4cAPWVnhEHezml/BRMqIM3Zz
         UaBGy2ffDKE8SQ0wUc22D9Z54CBHcO9BCWyugo/GNfBznEWYKqJHvnleV67nvfmdrT+/
         TkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186952; x=1779791752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=;
        b=ibAr6e0zgyPUDGKAgAYEKiZrMQf25r0dvIR8RQp6gdaA0YdaWC+iqMT2Z+BsQt+nS9
         OLlvv34pRyhZ56wzykZEPvHlrRO8yoXIgKh4n6Ai1ijc0/7CSUTZce/K7RcTGhRDuLw5
         5TdjidvonE6umwebeDW1QjVKuJe+IuLPvKcguATTFPGOsS65zgHYi1QkeiN71Ta+QAWT
         gyIesbG3c2STrttmGgKrhoG6EkVeWLLNI+2zpJB2/76qkjFVCEZizay4eqhjplqikbL5
         GBj4JuniJwlQwPYsLxF0YOrw4tVEkK9bANh30PBSNHUr6hl/6hbLpQ8KwBPvGfvhLp19
         0Gjg==
X-Forwarded-Encrypted: i=1; AFNElJ+l8J/wHcWpBZ6vj+viWnUdCbaAi+H8ByqkXtoD1TMRUV+dadzmwObaqtxfUmBGaMcgbmmZwSynqsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/cnto4O1nhDGN75EgLM5lk0GHYC3aq10TOwwn8bl8Q9V0qvhq
	o1s+F49GT+i9+Q8EVs8jagnCDXSmpWhY/18ZNHOJ2H53vNyPhtC0LpUveK4fIKKu2mBONwiggiR
	n/REhHt9mFgJHWgn4FTcVY/1xK25okXuMKrwJM/t9WSQ5yZvmwWCMw+/0hYGIaEdta+BVMKs=
X-Gm-Gg: Acq92OHRzNGqlZ6jV36e+EXy8qEn/hX6GIh3F1Ufl/LxBSCpDhMc7OWyqxZD22rvS2R
	yV2gR0WeFGNHhK/9aLXF8rFP8bFsuWCQ7he3d/MjltYdmxxs1AiIVrrEGK69v0hmfWZ+mon/1cA
	Zbc4N8oe7aTPLREd868fFZRQrLYsIsJebj30N5Pwq+qziY9ZrXnLRJBM01506ryli/ilUahY+kw
	ps2yL66eX+sAfgW1Pwb31ySI4RGg1cuE1ioAHIhaecIiPNn8Ed4TA3630hMONyEABSynxmCmDBt
	5J7YR5QihyqHoC/LYtigoELCGwzL6KJEqh4CizNT6RCencsQEO34nDzLBqr8EFa8j0qCcGilJAj
	tfCUevonrUsvt0pwAACPwKfwKTAsRueq/vgFxY8JIcbjM7ZjWbuO1S9FO7uYK0q8chY1mM/r/yq
	AF0ls=
X-Received: by 2002:a05:622a:4a:b0:50f:a53b:9cf with SMTP id d75a77b69052e-51659fadfdbmr200593431cf.1.1779186952509;
        Tue, 19 May 2026 03:35:52 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:50f:a53b:9cf with SMTP id d75a77b69052e-51659fadfdbmr200593031cf.1.1779186952067;
        Tue, 19 May 2026 03:35:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c31494sm683369066b.20.2026.05.19.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:35:51 -0700 (PDT)
Message-ID: <7c1156e4-a5d1-4914-8b64-b1b54686a9b2@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:35:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header
 includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfX2Z9OL2Zc7vEm
 CI/xhrDMMTMhHojyFyTKssTkpZvQmLgTbGjuIUHpUslS0+1ea/8HjmpfYz3HSaJsOnRdA8maCu+
 m2EPRT96Wy6QsAvQwRMM8BItFJmGh9bqkkw38DDucUa/iaRIsMVG8BzlDjjWD582aD5WrrXct5i
 6Nd1jOcBtba6kej4AKspHTQ/J23XfnndCG3MlJbg1ErH9z8/xqJNpOLPBgUz86/3AhtV7QWKYjo
 zUXAeqE2SUViqeaqrtbnsnTTl5oCPBqU5MeAJIxvxuoGYhQZTVwYdQViH8ASwoRSymEcqZr29Jm
 ILls7lr2RZ0/oJTi5zmtEJsW6dAdvMSjxDq/dOHAH8/eWAdt2xvmTDbPd3brf70h3nasBKswtZ7
 XbHrVhXsSdtK1hknTc7m0pQb0VLjkzQpif+mdZjb76ZJSEXpyI1LTcapHrM1/CR29xhhGFCA0K9
 6NJ6CweLwcfDDbsEbPw==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c3d09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0HbNSHcTcvsgiZiMWyMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Czc5nkRPyEHxPdotdMLsa-vYc0tqyIqS
X-Proofpoint-ORIG-GUID: Czc5nkRPyEHxPdotdMLsa-vYc0tqyIqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37682-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9680D57CC5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:00 PM, Krzysztof Kozlowski wrote:
> Unlike other units in this module, this one does not request interrupts
> or regulator supplies.  It does not use OF graph, USB role switching or
> TypeC muxing APIs.  Drop redundant header includes to speed up
> preprocessor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

