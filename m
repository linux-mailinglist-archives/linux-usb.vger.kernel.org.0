Return-Path: <linux-usb+bounces-33100-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHB5KwxLg2n4kwMAu9opvQ
	(envelope-from <linux-usb+bounces-33100-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 14:35:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E6E6812
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 14:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52ECE304B021
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 13:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21F1407578;
	Wed,  4 Feb 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENZkcVWi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1wsbKht"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB352E92BC
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211789; cv=none; b=RF/W2wbWQ4heYWbbSAsIlJUlkat5UytdO5tkSQtZMD+2qTsX8/wM9sn6sZrb+CGyC7RuFYYl7e6lGEJ+X//uJ2ow6hOZCXE3b0ipDJOsAni4E5DYvEwXArCh9Ma+0Pn3j4m7lHtL88zOo29tnHFN8wnQ52wCHJm+sCNxl35nIQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211789; c=relaxed/simple;
	bh=nDewY4WzQzCloMBZYmckqmY2Z9yu54lji//8vuzks/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPSs/5j7rTeN9w3CMsB6Ccvb1xAAd1eF6KDz0XHAWJ4/rBM0/TxjJzPsb5Z5DUsSIJtO92AeYZ8YlEuv5dyonrADiehj2Ejx8b/Yw5+yCkpIaUmhe/E+iaoAUr+m64stKOQ2x1AiQcL6GF8II9antAug6uHuzgy2cshu5C6NyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENZkcVWi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1wsbKht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIWUA792900
	for <linux-usb@vger.kernel.org>; Wed, 4 Feb 2026 13:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	73AAjQUo5bvmWChu5cyasnPqzxqcFhKdIix+5otwegQ=; b=ENZkcVWizTO3Ygho
	eiDryvNlhEyONTN2gZf8d2WuTE2mYUhckgPKERhp/S6SP5zhc+PudSfJ0lGnakN4
	SWbFdbCLG5MF5LEs30b+XzzPSWWMdVYhJLehWkccFhFpO5JvAfBwpg1Qjj5J4Ymd
	m0tQxhLvkY75ILby4xJzJPQOhPTMHYAmOEIrjsddQu7eV+EXi0P4IP/eKNCeq3Jq
	nQjhaGT70v7JBMH3lGbbO26/y8J8J2zLVBiz0VFydlMTCj4NKl+e/h0ZRt8yxaFv
	75910OboTS8FotyjRQZRlk22KMIGMqAA0ThMlT9wuX7Swm448K3mEIF0LP4TV41v
	A2Vsew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43uxgm9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 13:29:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c522c44febso170418385a.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 05:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770211788; x=1770816588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73AAjQUo5bvmWChu5cyasnPqzxqcFhKdIix+5otwegQ=;
        b=R1wsbKhtXmO05FrW4rFjZPqQZ4z/7czXK8GGnsKImTZpyqN7XSCspgqb/JsYHD1vPQ
         HD/6Ebhyq9spNfOiLmdFHKCRI4GhxRw8in54fabUsZdgUT0eYzyX0Sn2C5YN5lKLdejL
         nezmyNXocytwpQKkV32R+2KBE/54egDaknZNjWKAtoZhyLjeNvT9bdVie7L7rAY+CM/B
         CZSWEUWZTJ6Ty1WoTa+FUgfRONZEYwGl0LLKaLud+6zBnVlWBRm7RK3vkshlRKcQe5kj
         Ym4pj55zgnWDNGbjOPf9WAXlHgHU7J5DQCVoci/zr8eRR5X0Y8eqQRGg7kb4swFMYnFE
         +qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211788; x=1770816588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73AAjQUo5bvmWChu5cyasnPqzxqcFhKdIix+5otwegQ=;
        b=ZIklY7HFejJXCEQ0e8+dqeEmXqFhFzZtmgDOqU04SmPWesH+9W3ocP0u4E+40BTE7V
         bPLF2mndqT8pcgRJRUQEPmJNrRJXYkO29EZC+U61IB3SGlQbYJjcXWBg+iVb9G1k2skt
         lO9PpxCsg34VXfJaUeeCAkcD70SQ0JSBv5CbYRuEwL80zJZvHDMt12FMdd6PgDRHAygZ
         m5orCDfBWH4zXTNWOl1pcmUvUnowcqXWQ+TsBzWiifNi6SfkzjEBrybT2q4UVSlTiCGm
         r2mDopmwIEanhuuJ3HYO6cd9p6Fl6bS/h6OPCm/Q5XlwEWj2vNkjQabi12F4MvICru+e
         BvtA==
X-Forwarded-Encrypted: i=1; AJvYcCWkc4r89ouwOcpwH2gA5OdS2Mb+6v7LO5OsREP2eENVZRtHfN1NUQewH3xBokCmG2n4QTbXIJFq9Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7LD8/WDA0yvc8+t7vzSU5x82Ir5xzCliIPuq8k1axE/r/Ejh
	nkE9isUOJK4EnkXjePr2xhLhtjZv6s82mWvHowvBD7u0OTeuLYTsv8FaWmkXdnAU61jkM0nUn2W
	lcBJfh9iaoMUERJj1kKH72pAKkSzW2KS2njyJXoLZex1g3jOlti0Km8fnlpTgHLE=
X-Gm-Gg: AZuq6aLquMS3F4UQGKxPXZ4A9/+Ybb5Il8y+HK6cber6uob22jYtQ75zm+hgwHlVe/5
	7LEQZbk31DWMOyabzXRYe7vv67stpRQz03htPWilG43zsb7/AUBuiyAOGnYQFVz7mFX/fFKmxaI
	tjCo3GYs0AXdQBFFC2wTW/fVGItONO9Ab//BV4BpKh6Xz96+D5QrHz6XF5C1rAdS/Y4P4b0S4Ek
	1ztwDLisRXPM0hBNs54u30xZNv47jtwy0Gy3CWfSwH41R6Ij1OvQ/5sKfzWlvA0DOY7yWgkSktC
	DBNWuVS9e9nY2Q9SjFdPeuNVVb4p+TEKGBu7iuHzDZ2+EhTqnOBLf+Q9rY1RCflAUXTnlFbF90b
	u0sRPc3be4nVZBXXofx9NwBzcVveUi0weH8PGJRmUN2M6JsLehinjQi51NDNNfit8fXU=
X-Received: by 2002:a05:620a:178b:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8ca2f9ce21bmr259795485a.9.1770211787652;
        Wed, 04 Feb 2026 05:29:47 -0800 (PST)
X-Received: by 2002:a05:620a:178b:b0:8c7:1aea:53b7 with SMTP id af79cd13be357-8ca2f9ce21bmr259792985a.9.1770211787189;
        Wed, 04 Feb 2026 05:29:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65949fd8721sm1123642a12.15.2026.02.04.05.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:29:46 -0800 (PST)
Message-ID: <f8169943-f986-4e9d-9d3b-a470e57f5e6a@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 14:29:44 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126233830.2193816-7-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=StqdKfO0 c=1 sm=1 tr=0 ts=698349cc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=q4T-x-_Nixh5at7Gwk8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kXiQAe-4aKaq7b1Dz5fzTSUjnEEpnwzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwMiBTYWx0ZWRfX5CSrnceCDXi/
 snyZPfhcwZKQc6hRAmUn7e7L+usqv8p0OstpuvrcprJqPSBOu/CmK1nKBzY64jOwgxM51Kb+t9g
 lzcP1qoSQy8/abeG50+u0Md7ppLE1W3q/aDs0uY5xLxAr3diHShwKW0afTSYJ+hFYKeCqJKeMo+
 qdjQUTlIurNanU0XacqX1U71eRBDB2C47daILQlERFRBrzVc1KnFaxLkDijavkVqFq+oxokQy5B
 ZxFtqA7fhOlA5mbZd7ojs6nXPsE0ek0f+RLizNxx+ur0Q0FyKUnMyMqLvVUcPrSorv/FNVP77iN
 JbRFzIHP+DmtsGHrbwYDgwOLvDdnGyB2UDXGmvh3cl1Tkz32mhwPGfzF1jJGVH4GkfziOQ/+TMU
 h1XZ9OWMwxk84vb63lt41krB19i48e+k777QpUgMzIA6I/D3T0CIvRjWAXi6GrXp13dowfwz2tF
 CFF1TjvhAtXMyj9uqRQ==
X-Proofpoint-ORIG-GUID: kXiQAe-4aKaq7b1Dz5fzTSUjnEEpnwzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040102
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33100-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 1A2E6E6812
X-Rspamd-Action: no action

On 1/27/26 12:38 AM, Elson Serrao wrote:
> EUD functions by presenting itself as a USB device to the host PC for
> debugging, making it incompatible in USB host mode configurations.
> Enabling EUD, when in host mode can also cause the USB controller to
> misbehave as the EUD hub can only have one upstream facing port.

Perhaps that's a silly idea, but would the device itself see
the debug hub, being able to essentially self-debug in a way?

[...]

> @@ -162,32 +165,66 @@ static ssize_t enable_store(struct device *dev,
>  		const char *buf, size_t count)
>  {
>  	struct eud_chip *chip = dev_get_drvdata(dev);
> +	struct eud_path *path;
>  	bool enable;
>  	int ret;
>  
>  	if (kstrtobool(buf, &enable))
>  		return -EINVAL;
>  
> +	mutex_lock(&chip->state_lock);

If you use guard(mutex)(&chip->state-lock), you can waive all these
conditional mutex_unlock additions

> +
>  	/* Skip operation if already in desired state */
> -	if (chip->enabled == enable)
> +	if (chip->enabled == enable) {
> +		mutex_unlock(&chip->state_lock);
>  		return count;
> +	}
> +
> +	/*
> +	 * Handle double-disable scenario: User is disabling EUD that was already
> +	 * disabled due to host mode. Since the hardware is already disabled, we
> +	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
> +	 * when exiting host mode. This respects the user's explicit disable request.
> +	 */
> +	if (!enable && chip->eud_disabled_for_host) {
> +		chip->eud_disabled_for_host = false;
> +		chip->enabled = false;
> +		mutex_unlock(&chip->state_lock);
> +		return count;
> +	}
>  
>  	if (enable) {
> +		/*
> +		 * EUD functions by presenting itself as a USB device to the host PC for
> +		 * debugging, making it incompatible in USB host mode configuration.
> +		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
> +		 */
> +		path = chip->paths[chip->port_idx];
> +		if (path && path->curr_role == USB_ROLE_HOST) {
> +			dev_err(chip->dev, "EUD not usable in host mode configuration\n");

"in USB host mode"?

[...]

> +	/*
> +	 * EUD must be disabled when USB operates in host mode. EUD functions by
> +	 * presenting itself as a USB device to the host PC for debugging, making
> +	 * it incompatible in host mode configuration.
			   ^ with

Otherwise the logic looks good, I think this may be desired default
behavior (so that the user doesn't have to constantly keep re-enabling
EUD)

Konrad

