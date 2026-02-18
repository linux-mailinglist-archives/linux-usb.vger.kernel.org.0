Return-Path: <linux-usb+bounces-33446-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMqqLwsplmnxbQIAu9opvQ
	(envelope-from <linux-usb+bounces-33446-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:03:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920B159BE1
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22E3F3023A6E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8AC346E45;
	Wed, 18 Feb 2026 21:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJXJWE/p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MR/9LPI/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DC3191D8
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 21:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448509; cv=none; b=WsqM/owQIgtdicesv3j59bbsb3XveRF3VrfTlya9a/08OgQ82nETYCKz7ni+8cIQg0ogJdMdD6e5xC5UZpWt82tWFzdslEVFaMnGJ7dNL3vOuGvONWTUEHsSKuR1EqsMPyXUuxJY7y6gkMAARRpNG2rgBG7vmHlOfPahktZyZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448509; c=relaxed/simple;
	bh=6a0ZkYIkfSu3QEiYO7GH1ClAORPx9Gwc6j/Tv9mc5vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hs66ntyT433mu2op1PUxOh5Y/PsUFHK/HX3gdyt0h7M1pFbLn821RkXC9nd3nrb6jEhcsXb/qy9kUA7XugfQXzjfOdq1s9cohZrJ/QU9Pa+AqbDJxJjv8gXf7tNwljvA/xg8fILJLzxkQugaXAW1YxkU1BqFLVGGOCqptsnLd6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJXJWE/p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MR/9LPI/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IHexIc3379985
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 21:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7NmYNRNDIu9PQmPwjd187/cOTc2VjLx/wjEu2SMagQM=; b=FJXJWE/pqPoXtIFz
	YHOLVgar6dkTfxeaQt6PE2bcp5MCUx/m/+QaT2uxugllhiqUtMgytGEyYKkE8Du+
	uD+gJAkBPAjTtN7RnIEr3DsKWgoVb95kp2Je6d0uO95IvMtvVC2ZcXOU6R0DBZ5F
	Pm2AIntulnDB5Lp1wy5V5fhS66qd+6hb1t0JWNrxPfmWQhkdp2J6sluIZL9hWHW6
	P5dzgYFpZTeSKBK8enYW0Opdg4Zat6ioqAi9Bw9uatB6nemKjAFtqqJUmPTpxCf3
	QIc0alnXvzu1SQnAHDKslue7Y9m1xmjj0Yv5dv+seHEnjgTvTzwbq4JB8VZ1cdL8
	RlmdZQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccxnyksvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 21:01:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94accb6be34so420245241.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 13:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771448507; x=1772053307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7NmYNRNDIu9PQmPwjd187/cOTc2VjLx/wjEu2SMagQM=;
        b=MR/9LPI/8N7T85bGwnAJT3nje+/oHoWuHfVsLbTOuXRwH/bUuL71pbZLpK6wo6mtzG
         6dmKByU70UesCrtbT4B9A65nZYEoYF6rwRjzdwYHaRpdv7bys5dikBe89P+VuzrIf8Wp
         rG21ThIxo6r/6OiPjxsXtD9IO2HMqUPk4TanqxrRWd3R6KU4cHO/aG1w/05URz3n/QqH
         0mmX8Fjen8MaaTJpO0X61d8yw0ratPVn8bwyPJvrdpS7w0pa1yTn+D8AO8+RXGy6Rh8f
         QG6x3eAUOqSK8sU1na/ALtNINXQA8yUMhrab7XNaqNm92Erq4seR1ErjZ7x0+hFAfHTZ
         9Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448507; x=1772053307;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NmYNRNDIu9PQmPwjd187/cOTc2VjLx/wjEu2SMagQM=;
        b=jMehv1wd9FtaU5L5/WSamlKY/1ITLeSdrQYk9DTHQyyTsZqoSnmmkA0DLEOXHb6Bky
         3BBw4ljjkmkVg4waBExcP7qR+auJquIYwQaBOAhfT39Z1lVDJhiBWQWkLLBaJRtSklvC
         N7mZqPUg1w/qwCUo0mOaWOQkJbNZn+dbz4SXOQGhi0Bx/nM5thiN3KupT/kW+dWTJHBh
         J6m94FHuhqMCOjM7yqVkfjuu+s81gCMraHbV+tkH9xBmr/sTRndQw4h4yifBRjt2FV4m
         xTjbqVwehp1AVDnx8xv5sT0oC+T7vsC/ZGnAG3sBr8UzmR6Gl28FjfC+7vx5wx+HQpvb
         gtKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGMqzeTW8QwOG+yYlXuMdsqvgEUmu786GiMflWyjtZfUNRW+0tmTFHhqNsdZrqmD34YPthwUsXtY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgO5PZi8Fg/h45qdgzQQ77LltdekdJTaCydF5qluih64UPSiwj
	lm1/qfGfJaaRZ9DcZTkztu7LD69xJaufOJECwklhbqeqXAzeXGbabsCq84QsZ3VRgnqfpkmIH5v
	ayHUgJ63y2nc1zzVsTCjiiItTThcLxxcH32YLD3a9C3TGMwKAddrPprrzYDcaPRo=
X-Gm-Gg: AZuq6aI48odPjc9ixBbUNm0Xi0a9D1OynuLMoeIRwYQHOCLM2FJBhhOErIrNahBzgOW
	vL37LzFeI33L2yfOPUg/dAiFh+eQchhTX+vHD7fu5qu6/a7h1cC4VUMwdgoiH71TfLXoNG7uWia
	yE3whqJwRG0VROmC9gKQYlTQfMZiIv3xfxlWD3Z8n/Fjp+SpzbIIIHK9mIOADHqZ5sH5LG9kldT
	uUjj54Ix9o8BH6sdBqKOkOUQuZnaLSMflYWzoyEFGUHpCT04H7hdXVetkt+HBfq8E+Xr5DBZYgm
	wXUxF5vQCUeQiuF41+ukgWFZrqV3PKDyDVW3XORVm+7AXZkIuadSEaOdp/dsWzbc7fwjDlaqBtJ
	iIdeKD9S343EsnlFLVSiuTL5mTvqzvl1dHXX8vIbNFFhwauu1Zg==
X-Received: by 2002:a05:6102:3054:b0:5ef:a247:4755 with SMTP id ada2fe7eead31-5fe2b02388bmr5025269137.44.1771448505154;
        Wed, 18 Feb 2026 13:01:45 -0800 (PST)
X-Received: by 2002:a05:6102:3054:b0:5ef:a247:4755 with SMTP id ada2fe7eead31-5fe2b02388bmr5025213137.44.1771448504451;
        Wed, 18 Feb 2026 13:01:44 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm940702795e9.9.2026.02.18.13.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 13:01:43 -0800 (PST)
Message-ID: <9c507768-c173-430f-82f5-10c7d0d8837b@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 22:01:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: typec: tcpci: Make tcpci_pm_ops variable static
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAPTae5Kyaems-3HEGQ8hhgkiRVPJgjecGCHQ4iRF242k+L_d8A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAPTae5Kyaems-3HEGQ8hhgkiRVPJgjecGCHQ4iRF242k+L_d8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _ZOhCJHlgAHlgzaGdfgwIBQfiEyYnBes
X-Authority-Analysis: v=2.4 cv=Do5bOW/+ c=1 sm=1 tr=0 ts=699628bb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=nvk9TAkxJId0z3ZGeJsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: _ZOhCJHlgAHlgzaGdfgwIBQfiEyYnBes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE3OSBTYWx0ZWRfXwRMEBGrjaSq/
 VbXJS84/x09ihkuv9ATX+KOq+1oQb9BEd1I5Ns3aJp2eT3JHvaB6434EcN5PHL5PVGBUUIvA5Tv
 Dxz2tMU7p1XRhjQ5lg3ZcnKZrmRGNfXYTbdlVM+QYF2HLAdhZ9DvbfZKO3yYbztMNxRX7w0uNX+
 2xLDD1wldCNWEHCimIna75iIvTxK4eo2viqpHmfeu9lRnewUjVna4qffg7dUr4hItkEkS11Fdad
 n6CKQVN+Y+YP+uRggOYJ5hUPBBvZlBXpAnrZrfrw0EeV+OZVpEIdVktxJgionDCbtnYZd58jLQB
 eGJ+UBNWY6VDjDKPanV7nw8tXlqAbZrlWrCN3CN3St2mRvoeS+SkjFRSfgemYBM2lSGLu1vr+8i
 +eK5QNO1YTVLVOv0HeC2CVXiSNtI3RgwNs1Q2g4u7dMcEOR/V/Le3iW/+/qxFJPlRBd9rojIlNw
 OOcPba/lGQmEcaqpFsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33446-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3920B159BE1
X-Rspamd-Action: no action

On 18/02/2026 21:35, Badhri Jagan Sridharan wrote:
> On Mon, Feb 16, 2026 at 3:04 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> File-scope 'tcpci_pm_ops' is not used outside of this unit, so make it
>> static to silence sparse warning:
>>
>>   tcpm/tcpci.c:1002:1: warning: symbol 'tcpci_pm_ops' was not declared. Should it be static?
>>
> 
> Thanks for sending the patch Krzysztof !
> Can you also please add "Fixes:" and "Cc: stable@vger.kernel.org" ?

This has no practical impact on users, so I don't think it is a fix. It
is a code improvement, but not a fix.


Best regards,
Krzysztof

