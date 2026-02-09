Return-Path: <linux-usb+bounces-33212-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ey1FPYbimmtHAAAu9opvQ
	(envelope-from <linux-usb+bounces-33212-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 18:40:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8C113202
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 18:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F14093043002
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 17:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C98387353;
	Mon,  9 Feb 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCi+EnSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBRWvG3Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E43F3859DF
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770658647; cv=none; b=bOEaNoYcmh+Hvp7Q6S43Dq2zWULhbNmcwXIHlVIhJ4qVbO6VDjean6ULF48zA8ApccAR3M0AsG/1HawtsqHxjp9qaAXARpoaDV4XocxHgslVWW42Dfve6itIcG5yqwVJh3vr7gW4Bsmg5Bption60b52WfMLCKEpntFBxkkiPVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770658647; c=relaxed/simple;
	bh=ruAb+YJnPiGKrRfp5hfmrNCENht6oLYwyWb0jNuqtBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmHxxf5MiAkHlzMYH/hbHzVqWKYSPceK69Dmha3QbmL1Gr5O9tJglJtbZNGsUUCOTqfic4nFojX8etCkshxzNC/PD+cI+gEf5KzQ4nJf1K3QTyx/EoteWFpMYY70v0dA9h8iHWmyyUPz8omlmqlk9gpeuYL58OlOdK1PWe15eMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCi+EnSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBRWvG3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619DGbU53081548
	for <linux-usb@vger.kernel.org>; Mon, 9 Feb 2026 17:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sD9YwJRjBNvLNizTHttUH+m/zd+VkP3M8QIGPSJul7Y=; b=HCi+EnShNxLBNRo3
	AsfKUZ4LPYmhr25kXLmnTtYgzVy/58ew78bMdpSWxt2vBCoQ0f8zULku4ESinljA
	xJ6HAavAYvdJ0kdaVYp7EPMUt7929U1ZghQ11i65a4NDyH3VwQTJtPH7gU2Wa3fO
	CP1xbZeTx4eCjSee9f+wYn1Igc82iytxNMj73WAow62kfr2V38Fm2F6M0UoI4o8z
	by7ALFIKE34ksMnprbQEtBr4iSqd1y3d17f5oQrQtF5AGMskqfb/FtsWhg/2eLUW
	8jNRD7/DHYz4/wLT6DCJio3/+JRTYvlNT7OXUwfwbB2lBK3j7DOoEI9KDIj/fM3e
	AEgAqw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7gau8ujv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 17:37:26 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12721cd1a2aso3193242c88.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770658645; x=1771263445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sD9YwJRjBNvLNizTHttUH+m/zd+VkP3M8QIGPSJul7Y=;
        b=BBRWvG3QgYvUqJOKB0AOGT/MO1xM7+XjE5FZtIappgwsgzyV4NGhmBR1yh9VR9I0+j
         NqxPyK9d+BJAxyR+fR/RUQ1B2Op/O/Ey/AD0zoCOTzyHgECPUYgPrmA1SjxFe8/30Gze
         kjnGVV5saXjeXShYG2GYoFxq9cFMoOumWcQf1Yr7MlyZKKuCeQCHn3klhzEDdrO34fIV
         GYv+ZVwHb1yybPc63snsJg04isebXpI0PBizECFTKZtx0LW18Cvrtin23dKvNj4U8/aH
         1L38rj/GXv2wusj9f93M7dQNYGvfLJAEjzUlV8xfxhqx++HlT+yJhCMqoLow4m4c7DQ7
         TX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770658645; x=1771263445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD9YwJRjBNvLNizTHttUH+m/zd+VkP3M8QIGPSJul7Y=;
        b=scH921P1ED2pu1VvcMOIbFPHkIoDHaZQiVn+9tYie4nnZcb/DancS4bi97UWPJTVPg
         af9v1VwLgBdcFtqnjeg57ch0tx6rExctKUBS4kfHhMY6X72T3blR/EJzPxpqru54UcWI
         ymE6TW3FC3UokTyI7g7vHQxeCYzBE0KwJRQsMtzoxjv92byW1EkG6KFOlTaBNiYzfdzQ
         hvsxmxBh4XYdvsvDJ4dX9Y8ZAWdPK885MLFxh8W5ZsmY/4ob+kDh3IXDC59dxPmxnsL7
         MK4+UxbtzJBZ1gnyYSehplnc0xmZpbKT6Vt0gmktKlEmHyJmefS7Otj0FZgGChCfwFjj
         v/cw==
X-Forwarded-Encrypted: i=1; AJvYcCXUNeGIuDfqqyjEIXtANwUWpGMzwMHaXyyCXJxQT3SWQ00P634N4LBvLIXaSz1hYFlU1WTvM/uyw6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbpmKVg1FyGf7sR+rrCcrpV+NJkV9OWeL+3GQbLpP4YWV9Pel
	dkk0VdUDMVXdK5ag3t0YH0jn5//VfP4E4Y43ISAgFCCIQs3fP+MYkPa4RjGQ+GUtubcwDbDVH+z
	WohWktTCmaZ0X2i2rppUzLVbyyynhWszHb4XeD0b6nP/O69OiuYHK4IxAw5Za648=
X-Gm-Gg: AZuq6aLb6BbQgSqrexcCs/8ki0LmMGwIW5g7PU+i40f/x9z6kU7B18TAkIMmPhFfFEn
	dkPMZDd0CtX7uP1OBvSvTa0g+Z8qbgr0sWbyqySJu/J61qhGiqWqX1J7MLN6Ca85BvrUyRXIV5x
	XrdGhX3OXmFr485NEwhgiafOVOIsYx1XYFyvcrb0tbLfle3Kd8p051zD3mFH214Q33NMfkYQG8G
	ut5N7pewAyuJUK0fslUcwKz5UpDb+inBnhD9emaYmHbkSz0SoLa8LjMOADYMlhX9NUH6OB5PvOq
	krinMKnF5egI8ScGPJtTMeDsBawaizHeHR/hAexZNxx4hvXL0FLlyBNU/KZ4RkuXyLGv2HN8OBO
	J/HLHmWJwoEzayG51SI96wQuQ+rVHNTlWcLD61OM=
X-Received: by 2002:a05:7022:910:b0:123:3461:99be with SMTP id a92af1059eb24-127040153ffmr7020813c88.21.1770658644881;
        Mon, 09 Feb 2026 09:37:24 -0800 (PST)
X-Received: by 2002:a05:7022:910:b0:123:3461:99be with SMTP id a92af1059eb24-127040153ffmr7020799c88.21.1770658644269;
        Mon, 09 Feb 2026 09:37:24 -0800 (PST)
Received: from [192.168.1.133] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm10759398c88.8.2026.02.09.09.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 09:37:23 -0800 (PST)
Message-ID: <0fd2cff2-176e-419d-9e11-a98150266fee@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:37:22 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] usb: misc: qcom_eud: add host mode coordination
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <f8169943-f986-4e9d-9d3b-a470e57f5e6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jw5B3xOc0YsNahagFmvqbtAaNbv6ytsm
X-Authority-Analysis: v=2.4 cv=eP4eTXp1 c=1 sm=1 tr=0 ts=698a1b56 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6af5tV_Bv1u5mitncRMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: jw5B3xOc0YsNahagFmvqbtAaNbv6ytsm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0OCBTYWx0ZWRfX09JyR3veGxmu
 F/Xpu6fRCEmfe8oJS0yS2mm6m0pRuabQZFSssY9B5zDFyMxU3y+bwT40Ly9E7cJ56GP4WrTiSkR
 V3nNP3okLGXhScW3QuShbQ0sPIgVMzMnozGhAxIQf69SevhZnO+lk8oKtnln45GB+fgbY1J25Xt
 DKbVw1UgaOJrz13JdbMTblVO5ONL0FPMKfiOW3a0bEmzfwMv7R3wiXM5p0ofwqbrCCzLL4eTeHj
 67a4iIp/DbaIJcv627bpBlcvq50+XO4cfVJAdekouWMD4Ydt88xX1O+CNdYf26j4IIyEoScpu43
 ujQFrruzCgUwvI208Sd9sSb/lrcQRdSBb3OcGxPNDF212fKE73l0gaBDkdbXackXWKq3Jp3CuY0
 cAx9D0LqO87CyXFWw/judsHnuCVBd9nKzx23QmMBeA4Kgg/YwlWsk3oxE+TmLvAIBaRnL8MSSUw
 hFpUbDTzcmXSE26pfBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33212-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6B8C113202
X-Rspamd-Action: no action



On 2/4/2026 5:29 AM, Konrad Dybcio wrote:
> On 1/27/26 12:38 AM, Elson Serrao wrote:
>> EUD functions by presenting itself as a USB device to the host PC for
>> debugging, making it incompatible in USB host mode configurations.
>> Enabling EUD, when in host mode can also cause the USB controller to
>> misbehave as the EUD hub can only have one upstream facing port.
> 
> Perhaps that's a silly idea, but would the device itself see
> the debug hub, being able to essentially self-debug in a way?
> 

This isn’t supported by the current hardware topology.

When EUD is enabled, it enumerates as a USB device to an external host via its
upstream-facing port, while the SoC USB controller sits behind the hub’s
downstream-facing port. As a result, the controller cannot enumerate or
interact with the EUD device itself, and host mode is mutually exclusive with
EUD debug on this path.

Thanks
Elson

> [...]
> 
>> @@ -162,32 +165,66 @@ static ssize_t enable_store(struct device *dev,
>>  		const char *buf, size_t count)
>>  {
>>  	struct eud_chip *chip = dev_get_drvdata(dev);
>> +	struct eud_path *path;
>>  	bool enable;
>>  	int ret;
>>  
>>  	if (kstrtobool(buf, &enable))
>>  		return -EINVAL;
>>  
>> +	mutex_lock(&chip->state_lock);
> 
> If you use guard(mutex)(&chip->state-lock), you can waive all these
> conditional mutex_unlock additions
> 
>> +
>>  	/* Skip operation if already in desired state */
>> -	if (chip->enabled == enable)
>> +	if (chip->enabled == enable) {
>> +		mutex_unlock(&chip->state_lock);
>>  		return count;
>> +	}
>> +
>> +	/*
>> +	 * Handle double-disable scenario: User is disabling EUD that was already
>> +	 * disabled due to host mode. Since the hardware is already disabled, we
>> +	 * only need to clear the host-disabled flag to prevent unwanted re-enabling
>> +	 * when exiting host mode. This respects the user's explicit disable request.
>> +	 */
>> +	if (!enable && chip->eud_disabled_for_host) {
>> +		chip->eud_disabled_for_host = false;
>> +		chip->enabled = false;
>> +		mutex_unlock(&chip->state_lock);
>> +		return count;
>> +	}
>>  
>>  	if (enable) {
>> +		/*
>> +		 * EUD functions by presenting itself as a USB device to the host PC for
>> +		 * debugging, making it incompatible in USB host mode configuration.
>> +		 * Prevent enabling EUD in this configuration to avoid hardware conflicts.
>> +		 */
>> +		path = chip->paths[chip->port_idx];
>> +		if (path && path->curr_role == USB_ROLE_HOST) {
>> +			dev_err(chip->dev, "EUD not usable in host mode configuration\n");
> 
> "in USB host mode"?
> 
> [...]
> 
>> +	/*
>> +	 * EUD must be disabled when USB operates in host mode. EUD functions by
>> +	 * presenting itself as a USB device to the host PC for debugging, making
>> +	 * it incompatible in host mode configuration.
> 			   ^ with
> 
> Otherwise the logic looks good, I think this may be desired default
> behavior (so that the user doesn't have to constantly keep re-enabling
> EUD)
> 
> Konrad

