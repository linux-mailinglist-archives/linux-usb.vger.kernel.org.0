Return-Path: <linux-usb+bounces-31670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8442CD5875
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 11:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88C10300B693
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 10:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73470337B95;
	Mon, 22 Dec 2025 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4OuRlQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CoZ4ToKi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16402336EFE
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398763; cv=none; b=hIKuLI/3JB0T4XWmncdEgDelgH+pSc26VQL9YRjegwGFSbxGiwvDbPT8a1KB8MVTev/6eakjp2ddeypyo3oMW/eJhWqNbJf4MIuvmmdCSKDBfCPow2PzmwY4lDihcSstMd0cUUV8swghg27uyqJD5cXcoy7LE83Md8hnd+VhJOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398763; c=relaxed/simple;
	bh=VRAY1JBsyzbUa7+i5+3R/KjvZyuZRKwtLOmHcHqT5zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CB7rdVAWwYUEqYD6zYhIpJ3+gAMy9oZ23cnGZ1ZZAHULfR96DKEhoxJ3namNMz4ifAr443YWw+a94vTqf3vSF4yqg87p4F5nX9pr2+7WFhgrI9OTfMxc7RYrTBMpWzfOEnV1P7ffHndPRcHJLNITON9TSFLQdP+IhnOSy2qao3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4OuRlQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CoZ4ToKi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8HfC1024605
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 10:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LUTq3ggrBqFfZJlGq9yjwOSaf+F7Ej3hj/HcEnNQ6SQ=; b=S4OuRlQ/ZsadcW51
	wA7sYqB9b/01i5kE1PGZwYBo7WwE2/QWdJuW0RBxg9KCSQNGIjxI4re2HlPGmgIS
	0YhOdO3bl1vu/FXxx/xVPqbH2fS45kSEeAJaT33cQanxd7fCiWjyZUV/JmKSgF41
	n0AJq3RT1bnshp9Bdj6hh7GqWPqmWqvQk/guJrcXMqdte2rc/gk2Y9Tmm7pSKzGh
	Ib5En+eyHhuLGRii61dRGkJWPRaAlC2WDEKjizVOtNz2E9CZ/eOzkexsmBvpkM2J
	puujciCyDA0SZMTxRtynX/4eHuTm2tuUXBAF7TN1zvCQ8NiyvDGP6fa9muFVwOXR
	i5meQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracmqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 10:19:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9f3eaae4bso128984485a.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766398758; x=1767003558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUTq3ggrBqFfZJlGq9yjwOSaf+F7Ej3hj/HcEnNQ6SQ=;
        b=CoZ4ToKirZi/c3lFZWsxTnBdYUTJtVD6r+turY8fcki0XP+KunZe7fEBsLjLV4ClE2
         HeUn6Kdsp8/LLnZltmEdADiqkgtfLByHkBsKdPUNCyuUBiLHqUwuaRvEj7W30lXDCPvl
         lLBUld+NsJ+B6ja+SLT7ccD+cOc2WkQ2iCcIGoQ7jP3YkBHmQG67Qqf1OCpcvQz+/GBN
         XCLqw/kDbd8wPXPONKiBHfbiAfYQV1x1O2Ed/dkHqfWN46z1yVst+vTuT2UvvSesqOel
         8gOQdLNW4jQtVJphtAHhQ5tBNPb9+WabthT00MQG/I2CPyL/TMmoP3mYzVPjNNSMq1Yy
         eE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398758; x=1767003558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUTq3ggrBqFfZJlGq9yjwOSaf+F7Ej3hj/HcEnNQ6SQ=;
        b=HSUrguF2FZHRHwZfj+BKirN2nITmEP1TzGUVrM68PsTDKHgKIE77dEC2qBsWhRQCHT
         f/ndZf/EHXC6VWvn+Shva6UVciuTYwK3M0mGZsrjZRzFQUEcLUN25s0xEKKxOm9i5X1A
         0oRq51TUds9Lc4bTA8DT0LXbgQBmCqQgwFBd8v5Ls8dvmwWka971A7PJEK8cELmGANQ4
         t+iggjhiFdVIhRp4MCWJQsJx5xXiJb1+pqcweQwdJCRhr/y3KfxNLuXKUveExrvvcm4Y
         2ojfeMiRW6seBkGYn/27IFu1121IzwozdIXgBAXhPb+3mK+jjGp8E1SP6La82BpFJJtO
         9J3Q==
X-Gm-Message-State: AOJu0YzQIywsjDditIyxFljrhjLr7aTeGofZF15paa0ydM1P0OvHFdbc
	jGtQdqr0mKvE2QAIwFSJjodJ3HPtM0lxopLYvJVIQ1UMGBfR+NacVIrG30ZcW61ax9xymh7Etv8
	RoND+ayf/pIf5PVncaoiloIL9XCrb8R+suNZQGNNBvumAaytbkwpr5yEwQxkYEac=
X-Gm-Gg: AY/fxX7FGHj7tIurXjISqedJlra3eiHkijTd5WUY+Vfxfsvm2Q0nNpl9ksqh990R0LN
	r/p2+I1jzDpbDOvI2B9ovAhY26BxdDjyrYhVJLGkq7xtXMqM4zbbIwUf4mu8nW81VL2bkUW8LU3
	5NPslawjyAXyQmliecC8dtBfmR8MwDPpSeqZCh4pT+HO6PWSXX4gL+LQtlpoeMDuHSnnNpw4cFG
	MXqGVxhDQw1ASZH+ITRIwOQJZ+8+eyspaIinoSdA/p8QSWKVRvZ9C58/YwSEZDsnkRPqu6J/ELQ
	3grWA3i1npbvlCwbw4QxWl8B01hOjJOt5/KxGa3VsAdyfw+id3mOZdyVEgpZLI2Yff9j8e1MmvN
	wNQhyUVQLQwaCLSTWO08pnzIV9kyzJ5sIUmfmk2JFbKJp9pmTtG0CFVAqm+bQ4wgI9A==
X-Received: by 2002:ac8:5d07:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f4b4600b59mr100718291cf.9.1766398758334;
        Mon, 22 Dec 2025 02:19:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCqPBLPUNP0VjGE4Mfb41jy44P5jdKMLuXCQX6YohTJW18W8qxY9YnVGhNWdnIl2BNdzFrPw==
X-Received: by 2002:ac8:5d07:0:b0:4ef:be12:7b28 with SMTP id d75a77b69052e-4f4b4600b59mr100718051cf.9.1766398757881;
        Mon, 22 Dec 2025 02:19:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm1077906766b.49.2025.12.22.02.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:19:17 -0800 (PST)
Message-ID: <95f8a16b-5f29-46d3-bb3e-f12b5d3e4fe2@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:19:14 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?=
 <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mW_MFc7AOFhZB89xKzvX_EZqXAXIbq1Z
X-Proofpoint-GUID: mW_MFc7AOFhZB89xKzvX_EZqXAXIbq1Z
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=69491b26 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XEuYRhZFooMHjHqTHxAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MyBTYWx0ZWRfX4+q5IPaeQufR
 g+E7qryEVmyDi3KGA65zgfBlc1jHzU+CrMlgmnd5BtuY5H7BsPOr+iWvSCo8PBU3/UpRujBi53+
 k+1PVSCeGjDCxM1sByxi41IpAhcabIWHxiV6hMxei0GN5ORh8egiDtUPFQzvrCiYYRMP8J1iphm
 veDRExGek/WjMXwn/Z55r/MdcCTmIgrDOjeIzhZNZ4nhfj2nYf5ecoA4u75XvSS/EqsH1xaALTI
 lgc4qI90uJxkJOMaptHb7UwiyuBxtuzsIK2yhGNvskkNj/A501t8rgYD21B+b+Rmb6ODFa82z+j
 900EeBXlsUMVO87b47m+/MAXRtRZhWNsF5hnHwqKznN73HPKYixYJJnEUUSVFGfOC4JHUzEtk4L
 GlKKMVoQRGlD2z/J9YSgWJcWsB1EsA03XhoLeDyYHc3EaXro4IoLHLiGVTOAN7Nrqrjgvi6cI11
 SM8vV73desKqGSvP0xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220093

On 12/20/25 7:35 AM, Swati Agarwal wrote:
> Enable secondary USB controller in host mode on lemans EVK Platform.
> 
> For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
> ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
> lines run from the SoC through the hub to the Port controller. Mark the
> second USB controller as host only capable.
> 
> Add HD3SS3220 Type-C port controller along with Type-c connector for
> controlling vbus supply.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---

[...]

> +	connector-1 {
> +		compatible = "usb-c-connector";
> +		label = "USB1-Type-C";
> +		data-role = "host";
> +		power-role = "dual";
> +		try-power-role = "source";

Is this port actually capable of receiving power (i.e. won't that
fry the hub)?

[...]

> +			port@2 {
> +				reg = <2>;
> +
> +				usb1_ss_in: endpoint {
> +					remote-endpoint = <&usb_hub_3_1>;
> +				};
> +
> +			};

Stray \n above

[...]

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				hd3ss3220_1_in_ep: endpoint {
> +					remote-endpoint = <&usb1_con_ss_ep>;
> +				};
> +			};
> +
> +		};

Stray \n above

[...]

> +				usb_hub_3_1: endpoint {
> +					remote-endpoint = <&usb1_ss_in>;
> +				};
> +			};
> +
> +		};

Stray \n above

Konrad

