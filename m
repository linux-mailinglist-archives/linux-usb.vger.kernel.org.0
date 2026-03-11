Return-Path: <linux-usb+bounces-34619-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGaUJ23zsWl7HQAAu9opvQ
	(envelope-from <linux-usb+bounces-34619-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:57:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092D26B012
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4967430364E7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 22:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DE7399342;
	Wed, 11 Mar 2026 22:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn1+/UD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DgTN9Tna"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50516397E9B
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 22:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773269866; cv=none; b=O2FZz1qC+vIgdEXIX7ghcXSLj5ZWcDA5EKdIaaiZ5C0RePElHHeZnB/aiA9ek8gBByZObyCojdKskpjOPu1npWBPHz3JKjVICmHxC3MN/1i7xIrYrmlRIkjta5rOHhPUHW0OsZyM9vfsAWlYZmj4yFTeMwwO4x2G283YhdENXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773269866; c=relaxed/simple;
	bh=VHm6QSnAsA+602Lrd0emZ6caSFHzLyVnfrA1BntmvqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/Tnxa2eVs53jyCaozpy+MsHzhbgjMW3pRHOi7Tv+Mnj5F6gPjZDVKSVecvi7ej8EFIFJZDY23e0SKrXGUn20evo184cEMYlU7llhCKloXN3h7Rnyjd4m0jBmVntz1VLBPlZbDe/XC3aK5SFENLpvGuIkC9EOmEVuop8PJLYxDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn1+/UD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DgTN9Tna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMipb1207995
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 22:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RtNHy2LyyuXRdz/OlobybRGnBBWQatheEUj0Up6bJVI=; b=bn1+/UD1+NWbHFOo
	fXr9VtQHFwMIApd6ugoH3bqgeEFv6hKYPDHs4KQ8REJaPSIYIF8zKjUSptIvmLtb
	uwj/BPuy8MPBMoBizqRglFwFcC/8MEds8MuDoWC9yb0pVQQOPaKbWCzDX4Yx3ief
	40Dc1Q9dM+/5cToC/0H7TzrBZ8DT7TVOqbxR3tCIC4dKFVojaAqUzXSP8D2UUTl9
	ipLm5HjozemfxQj+rOH0heOVXhzMOtOTsper/D80jbujfAvMDqzo0N/K2+nB9nqc
	gJsaSVpkocSiD+InTaPpEU2zsP+/Yga5YHtEXtRgfPazYgJXPgPkWteQuqhs9x4w
	pRNj5Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4v02q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 22:57:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-463a018f61bso1744934b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 15:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773269863; x=1773874663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtNHy2LyyuXRdz/OlobybRGnBBWQatheEUj0Up6bJVI=;
        b=DgTN9Tnad5w+MNFbv5508tpZhZ6tZ/n0E+aZKYrEpM981Adap2e1GQz0IBH1XiHvYF
         uDx238RuqUHkYj+uoNpICcRN+hGuq79IlysA8ceSkwfpxTEfNWHvxe2kx5WQrqm9vFbx
         jv2fspvOtFDw3361yR3f5utB+QZpXgUvGubQEsvHYEdU3mKT9kiGeBKw4j9tgtCcYDmI
         qPOBETmwhNulNRXG7JlFLlKh2eRfxWLqVZ2rAyqjsJydDjauHRoATwo31pvHk78xnLao
         7gGnX6zXcJXGMv9Mj+NWFfg5BNUdJ/JQH4g3+6X/OfkH5YpzQVS548bWZwtbrwV4gwx7
         vpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773269863; x=1773874663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtNHy2LyyuXRdz/OlobybRGnBBWQatheEUj0Up6bJVI=;
        b=v2bMA9dMOxqJSUSVp+GF01Kzttc1bufDcB6pb0YWHQN8dCdXVoxj3splb/1Cjv+hX4
         vWlhdgeXw0x7riUggpe7F70DFmbQu+EojLopym6htTD0oGD+AjV4T4A2yvEPtfcTImDy
         Zq01ruf8YW9AoE8FwO05PhCcFK12AJYSzVyK+gJ4CcUcH4kX/n8d0olN8PT4VhrA+bn/
         FmdGY21E2ky6bJi9H9qj41HH1Ehj5mqGDO3FDhH0KNDt36ip+gnkrTWgUdgOWiP2UFQZ
         tDcnn/S34rf0Vo2LPj3xmuCE/1GU+Yg02kjGRRydFvqjrGAUM2TJyZkytDObneR+D+9P
         3ykA==
X-Forwarded-Encrypted: i=1; AJvYcCXf0Ej7qa+x14UkbK00x3cOlsg4cQnU4vYGftq8fpc4nsVl9LMrVo9IlMQkICsv1Sahkc6sG9MP+Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIigarmlirbZZ0BT/2qzAjeMCYq5J0JBv6YwGPonj6oNlFWOLu
	mI0Ss3xr0+LQ/12CxqnpyCqa8+6ObobE4eRFEuGhtltt8HOkfH1QTFoTZtijyznvxni9KMzSrtj
	8DAtS3C6Z/uJJ9LEAxuvY52d4C+HpXSt6M4JH0ntJwyVPJLnU6z1PP0gi4hb2hyk=
X-Gm-Gg: ATEYQzyd3BwHF8f9dkvstJ4PRtATkY/ouvXf10WVXVq9qLCjPFchktuAT/UY+VXioE0
	NFj+EbqNCDXlaYGnVBJMKTem1oCe9aelgaUVB0Q3gW1yHHp90ukpnJRD7zsl8Qw+BEwMBQvSVrT
	zxlChxvkAz5x05LNHY/s8WgugdspNGOuI/+zVqHj2kYHV3E04c+GmZ6hmXbjH/4JElEs9s+oqDX
	wM/ZatGAYjhm/6H8kpcGBgd3IlTzhapVqOEqJEVndeIhaFvw6MbrInOCdo+hu2kOgQh3HqNL5t7
	ip90u4OpRUmgqn89tcUXU8UeIZyxe0sCF+bLQfuedpJwT/IEA7SVEYtgK/Jk0zaS6w2dd1gmfxv
	RZb0Rbtld8z0K8mO/v9Mid9jTpCn2j8aLlRnaCGzQK6nvePgpglwmTRbWN2nohTbSs37Q1OuCwc
	vRmMU=
X-Received: by 2002:a05:6808:1920:b0:45c:7b2c:10bb with SMTP id 5614622812f47-46733641014mr2342948b6e.60.1773269863604;
        Wed, 11 Mar 2026 15:57:43 -0700 (PDT)
X-Received: by 2002:a05:6808:1920:b0:45c:7b2c:10bb with SMTP id 5614622812f47-46733641014mr2342938b6e.60.1773269863167;
        Wed, 11 Mar 2026 15:57:43 -0700 (PDT)
Received: from [10.71.180.216] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734340842sm2034184b6e.18.2026.03.11.15.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 15:57:42 -0700 (PDT)
Message-ID: <c313921f-03ab-40b3-82cb-10b0a40d91f0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:57:40 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 02/10] usb: misc: qcom_eud: add sysfs attribute for
 port selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
 <20260309203337.803986-3-elson.serrao@oss.qualcomm.com>
 <2026031101-cornstalk-partner-a30e@gregkh>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <2026031101-cornstalk-partner-a30e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE5NiBTYWx0ZWRfX/wN7Aq/dDsSs
 HgIq+1Zo6PhP9UMgz1i3GQEwpBd1w5M2akvSaYLLHMKgz2wTmvH1xvS/j+0zcJT+5WeTLgqCKwg
 smDQ/YqAj89Kt742EdPD4uI5x73y0vyXeUg0u2Hah6b9ZC0b1FJzRFJLwElTnRC0mz3Y/UqKSuT
 Sqi6luHAIV7teOc3o8ogFYwpbQH1MwwOyAbx6rjD5ELZ1VMTSAKdaTit2RG8ZUKviq+lrv14WLO
 b3hQ6J5PWsrko+s5+o23MavlFYl/rYGhcb5tyg0zpwzj62jenpSS7GE9WZv8XwHKaTZAlTo+6Oh
 F8x7Um16XCxUsYCqXb4T3wofveGVYlmLUxxm7YRI5RDRsprkRJbtmEUiZmjRk+4OH82RiDt7DCT
 L7r1WzRs89r3XMF28AaB4sI8dA8x5ooqp0oxAyAI1Lv8zqdAJ2ZpkT3wtOIxP78prG/9KgZIRnS
 4yQrKvq2gH/XSl+2uxA==
X-Proofpoint-ORIG-GUID: dAIjhQqvQS54tD72FJmKXO81LP2RaZvp
X-Proofpoint-GUID: dAIjhQqvQS54tD72FJmKXO81LP2RaZvp
X-Authority-Analysis: v=2.4 cv=V7NwEOni c=1 sm=1 tr=0 ts=69b1f368 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IAXstxnVdUbjqp5kDF4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603110196
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34619-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6092D26B012
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/2026 6:16 AM, Greg Kroah-Hartman wrote:
[...]

>> +
>> +What:		/sys/bus/platform/drivers/qcom_eud/.../port
>> +Date:		January 2026
>> +Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
>> +Description:
>> +		Selects which USB port the Embedded USB Debugger (EUD)
>> +		is mapped to on platforms providing multiple High-Speed
>> +		USB ports.
>> +
>> +		Valid values:
>> +		  0 - Primary USB port
>> +		  1 - Secondary USB port
> 
> Why not use "primary" and "secondary" as values instead?  That makes
> this much simpler to understand.
> 

[...]

>>  
>> +static ssize_t port_show(struct device *dev,
>> +		struct device_attribute *attr, char *buf)
>> +{
>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>> +
>> +	return sysfs_emit(buf, "%u\n", chip->port_idx);
> 
> Wait, you are returning a 0/1 here, yet using a u8?  How can that work?
> 

Thanks for the review, Greg.
I’ll switch the sysfs attribute to use "primary"/"secondary" values
(instead of numeric 0/1) as suggested and update the ABI doc and driver.
This should also resolve the ambiguity around the current 0/1 output.

Regards,
Elson

