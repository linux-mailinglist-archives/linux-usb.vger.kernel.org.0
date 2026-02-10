Return-Path: <linux-usb+bounces-33246-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKKYM7cBi2npPAAAu9opvQ
	(envelope-from <linux-usb+bounces-33246-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 11:00:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B73A1194CE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 11:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 599E0302F7ED
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFCB343208;
	Tue, 10 Feb 2026 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+izyRyv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYiUKzRl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636532B983
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717620; cv=none; b=Xr6B7cyvCD3RpZgdIS6JaV7lT31a0rvbNq9DMfqTxbMoB0liRGP6e2GTHGOe0ePToaE1VjEM6rclqxHPM34BY0yN/m5KUPAF3k8Z8YE5b74in+9pWxfrMZyaoRldw3FLnjeD287VqWxYh7/aJj7B/l5WbQWbrPGBwF+zrITJsaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717620; c=relaxed/simple;
	bh=/VvWsclqCNUKGcpiXsPFfLztHB7A7rPaZiOJc21pNwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4jPQXPXW2IaunwfVTKDgbyrJoxrQYdV+cIqk0sOWlp2Y4g3XRnKxWSdDR1Pp3E2SK/wOKebMT7ZMQVC4iolq5LJUz+zxa0lmxdrgNwsskVb1F8eEMaRyYerhpaUbxDVlF068z5bix8+Hr2i6S2rm5aDhvj+Bnf2yscufBfHWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+izyRyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYiUKzRl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A70YHQ857024
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 10:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOS6ggBeTexnHosszT8D9qC6QsRq5ZmPl2bw7sUhbhQ=; b=l+izyRyvkcOCZXWI
	LOo8AUe1QbDTgK7QblR28ZUkS3sFIaDsXKUlv46QzD/x7R7ZsBwxqW5uBItpS3p7
	vxGwCdCvDMS3ayFMUDTyXmWtEmlTA/+fWAhT42T97nIvk/1hXSilSj0i85VjZA7n
	DXBzx0A2LToDWaOQIC5SDeLFHtwYU4njBPlPTuML+aEAm8RvFnN0EsQ1thQKOIbq
	2dwPTWDIFKmNNOatIvTiZzIzX6bqHhxM8hAGGeEG+h7ZfIt9hlX+B0e/90YuMkgH
	/m0qZ2E8kzO3RBD1PiFSP2Pzu+Y9GPWTPs7KciwmGhCydXlNLzitoOOdPgFevzlh
	lte2Vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga63r3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 10:00:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so96279985a.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717618; x=1771322418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOS6ggBeTexnHosszT8D9qC6QsRq5ZmPl2bw7sUhbhQ=;
        b=LYiUKzRlHUgptc4OwEFV0IN+Z7Ac4YnJdES0JvDm2NjezYFe3ypSMXbafX0Q+ptKOW
         wcv/xppUq4rB2utz1s1z7P71DFBwkdCEA0IyNnJwxUabxcPtK3ZuIm8TjYOR12YJtmMB
         9hJD+fww09uFcBv8GXV7Ipkk1mplyPNVocbNQYwu+/plz9aYLa54MldDpH0WcBLczviD
         jkEeTxTjtX08iV7jqAzHsf/zb5cQQ6Fn5+VH27N1Gw5XJbnB3Bv518AJwJnLwg+f35Gi
         aYMWPy/9+kk/ZqOImFoAz5W6M2qjcFzS40OttHloIFVoIzlwSK5dWT4BgkWwtletv25N
         bPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717618; x=1771322418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOS6ggBeTexnHosszT8D9qC6QsRq5ZmPl2bw7sUhbhQ=;
        b=GaIsEKZMyA3GBMo2kG6CAnzdHmQmPlXE5gREZHoJG5dWnOrVH+fBqJtX5yF2Pz7WxM
         Zv/laZFPxfhtN8L/pKApcwLePQWZ95Dx/LgFnW6+4AbfmdjiT/p4/w4fV2aTj5nwlT7Y
         s9mjlHTeoDn1Lt5/++8Q5+7WWbakI/mGkMV/+5HPxTElFvIImwrtJ08qg6La2zNSRxRr
         TZjlVOoBuRjm+c458TMnti4jrG1KQKiqFfX3wc3CEKh0PZ988gh/Sw0ZMhv6VmeQttlG
         WoE4VO/e4eSOHIAUllZ5TzXpVs30l7X96dP+qfjw8380HhNM3mlUOg3cR+9uB7G/ijVU
         X/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM4KRyCNtHrc4ykSA3hFJT8hh+fGA+O0rgTLYkiTt/vrIgjfOzAQ07JrPoafkse+/DtEZTgcNWvj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNCsiZR7QPUYGE3A6/O5+L9f56W7MhczmzbdZ0/myPaHPhr8fl
	6nNqja4xz5PeBQBkOt/g9nm6K8xwgUnpLTiTBEg10s2gkoJaPZPKiGEO9Bp+v8jNzukh5xaEuuh
	dDzG1GyDHex5dXNlXDI01LB16h5S5D0LApob53jRttIC9BYseEom/GsKjxqGYcYM=
X-Gm-Gg: AZuq6aJNzYtjcDlt1DJFKkTscU4BvpYdJ1L4Srtmd8yDn5FC4ODg/zRetA7JY5mZIby
	j4Hy6TmQvogcHUc4/13x0JEc1g84BqvqS7GEwYJg9OSTv0AKXBon65RN4s+S+EuCuRMPhgA1JNd
	kyoTfhvM+H6mBDUY16hDASWm+bbC6PuG9qw27cOHOpzWkZoS5hWXFetfpQ4/fK16J32A3h+uVJo
	96BQ94OwZ2mBtR7yGT2T1x+9el+DEtAhOlJce0bVKPg6pEPolepjKdYGt1ubqI5h/Lby9ZMgm3H
	LYpgTiisVAWIWDSa6am3ihRqBm/M3vJnFyOBA5jJcj/PZJcsPMJYFDoKAbKGF5aGjd630wui4S5
	OpHjxfi9+C5IdkChLZb1yRXIhAfMZ4D1qnaNp7dtgHLLoQUwhAQMs6lpSeolK45pUPhasDraQje
	HAtiY=
X-Received: by 2002:a05:620a:2584:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb1ff75685mr108025385a.10.1770717617621;
        Tue, 10 Feb 2026 02:00:17 -0800 (PST)
X-Received: by 2002:a05:620a:2584:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb1ff75685mr108020885a.10.1770717617129;
        Tue, 10 Feb 2026 02:00:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7e6577sm488931866b.30.2026.02.10.02.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:00:16 -0800 (PST)
Message-ID: <6f506caf-4910-4d29-86c6-4dd57aa559a6@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:00:14 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] usb: misc: qcom_eud: add host mode coordination
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-7-elson.serrao@oss.qualcomm.com>
 <f8169943-f986-4e9d-9d3b-a470e57f5e6a@oss.qualcomm.com>
 <0fd2cff2-176e-419d-9e11-a98150266fee@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0fd2cff2-176e-419d-9e11-a98150266fee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wEEu0AUvHNPMur-PdgTnVqlVKzbBYQg6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MyBTYWx0ZWRfX8kKgMltqobpD
 Hqxne0vps9uauFjwgDuggQTD4NySU55pJrVW8j3LKjN076uvZqGhqndqceTIwLS0UYUUS6MOE2G
 Y1sdE6T5w1qpyJsPecySYvpBKI5BQqpoftTW7lf36H4g71mAtEBqUUFjHsW7A9pGKOvoL4Y1OBp
 WEwaUgITuI7ZdyQo5FgGrR8OqD3Prc/OPwIJJyiddHdh6lNqJrHLmRK2cAV4s2mHb8lYWdE2+dU
 /E1IR/bmprn/w4MrgloK5B8NxmKZ6TknLYhk45Yx1l84axUwE5rPL3CKpQ15KZGjKd5arQJaN0c
 kOHKXSL0Hj+jl5KuY9Ahbr49bmXyX7innY/piDkSDObhP1YsYe+K6Kwwmckx2teukScI6Lvu6BP
 lMAEKt1fPi0XAcrvLP3LNaU8IgYTkmwtNitD3hKc9scflaUrYDQgauiKD6PIuuHRbwYwR9mHc7r
 SCBk36EqwpX+pCfp44g==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=698b01b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=IqIWAEJlBQ2RpOI2llkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wEEu0AUvHNPMur-PdgTnVqlVKzbBYQg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33246-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B73A1194CE
X-Rspamd-Action: no action

On 2/9/26 6:37 PM, Elson Serrao wrote:
> 
> 
> On 2/4/2026 5:29 AM, Konrad Dybcio wrote:
>> On 1/27/26 12:38 AM, Elson Serrao wrote:
>>> EUD functions by presenting itself as a USB device to the host PC for
>>> debugging, making it incompatible in USB host mode configurations.
>>> Enabling EUD, when in host mode can also cause the USB controller to
>>> misbehave as the EUD hub can only have one upstream facing port.
>>
>> Perhaps that's a silly idea, but would the device itself see
>> the debug hub, being able to essentially self-debug in a way?
>>
> 
> This isn’t supported by the current hardware topology.
> 
> When EUD is enabled, it enumerates as a USB device to an external host via its
> upstream-facing port, while the SoC USB controller sits behind the hub’s
> downstream-facing port. As a result, the controller cannot enumerate or
> interact with the EUD device itself, and host mode is mutually exclusive with
> EUD debug on this path.

OK, I see. Thanks

Konrad

