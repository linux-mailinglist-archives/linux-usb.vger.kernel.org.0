Return-Path: <linux-usb+bounces-33243-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA1kN3b/imnJPAAAu9opvQ
	(envelope-from <linux-usb+bounces-33243-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:50:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018E1191CD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26186305A403
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C245E342177;
	Tue, 10 Feb 2026 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZqvIjDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LN06Qa/M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EBB341ACA
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716881; cv=none; b=D4XDIcsxNOGhUzYhNvurFYWN3oZPR51k3zeBXQ1rgfUO+LQ0edWC7yB2NwEgPi3z/DqF0NnJqRYFFPhGoG9ZwvQ8LVLDENJWwHyymsqId4IwaVhT3JLsJimpp03mup0Xmpj9icqkL1xxQiXIxv787fllhK0pvN6Fk07F/2WRNAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716881; c=relaxed/simple;
	bh=KfTVOP+VDKEfd7TYraAVx1WA3urkg/oj12+F7hc8BWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBlOdud6TrY2vEvTt1lvc0/RaXSnr4zkLDpF0Kw2BqXFz7nn/CaxgoWKmO4vMNESVCHm8Ldahxmdixh1GU6vB8wSrWOHas2l7NvZlccMOi39owPt/bQ32j/6zjJzY7d2ZFlZbzPZ8zWOmYK0YQeyeqcxwsTFlW2jfDOX/w86W28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZqvIjDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LN06Qa/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Z2H82169220
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 09:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLCh1JGBV52dHjySo9t/HDDqXRuRe7Sc9k85IF1Tj4M=; b=ZZqvIjDFVNHsW3Li
	OtiGMICH4C9QXXC+IZ1OdPiYxRYK6TH63MssIbB0OjxUlr3B1VYizG0MmIWLKFdP
	S7/gZmpJdkTNmpEgvNS7pMx4FSxHXNee4Vc+Tg6upXlI6rPCavgc5zobkoowPO4b
	fd7uQ5lv1CrRNgqfn4v9oShLfxLU1xGhOUy5HpnWwenUSYuLZEGe4ShoU5hbuU+E
	qfgddhDfSECbtjHrBFAM9EHaneQCXQb6a7pPeVYxvvjEbbhXpPpMsQFLOz1FpLr6
	8aMT5CsB2lpKMT9Dr2DqAzAgi5zYxJWASxHMZoafYRx3LDgQS8bmBMj+hQ90co6u
	CNGNtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drrevu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 09:47:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6de73fab8so179822085a.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 01:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716878; x=1771321678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLCh1JGBV52dHjySo9t/HDDqXRuRe7Sc9k85IF1Tj4M=;
        b=LN06Qa/MrNWMFIfOePfC5hrvptRAPYPlbjYkmcZXOxuBiB7Qdb69S8IBCY4bDU1wHq
         rA2ari3lW5A/qtSyaA+0stzs3MfndH0zpBfpMLD+4rjgk2GYnF7a0ONZyI1v1V+aB7x+
         ni77z1dhBu6U/Ktd74wDF7AYh4QHHmv1G0DaHsETeAkCmO8yPj/odK4rXnQwlfBAj+WV
         9IWNluWM5dORzG2a2R+r9V51LMO28F0TK+B9p5RCsZ6CiWdr+XGn4x2HXZxcS+P6cVju
         +QzfkpOHU7XCZ0MQbn6cJ110IthOkJRvJ1ZULbjXQM71nXm1x8KvWE9bXxXcudgpPxBk
         LrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716878; x=1771321678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLCh1JGBV52dHjySo9t/HDDqXRuRe7Sc9k85IF1Tj4M=;
        b=DnMIRuDsv6gGbhnqcbdy9EbqQyNEuiIEvKdWJrXPEcvliTSjdfVCC3kbQim4/lYT+3
         lj3tJVkka3E8NGiHZtZ1PZL/BQy7DrpNxEGN52S1F48dnmFXIOVXAKDDTkoC6VKN5CUI
         7d7W45Q+ihBQKL5OUPbPLypj6iQk1Ezm0Hp9FJAaTvrESzQXFzIkjTsPOVBAU1BVNvgN
         WyG69uRq4dpCun1s+0z63IXozRWJvgwFh4CkjRjfXROWocUB2e1SioYPwB3uGL+2d5VB
         n6mMwOdOQgX892g0PpMIGN2AimWc7FZt/ZDhohRp/xJMEAXdTVe25Ea3VG5FybljYQWT
         +GIA==
X-Forwarded-Encrypted: i=1; AJvYcCW9YIMmwDtntufaKyZmBhcCYV6wyrGlx95SQPW5Cz/87QzsWa5W7Wzs7VGdEMYlVuQv9PhnQNh/hVM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40tXDwLhkwCF4iQPWo9ozMzi+CAv/0w+kHbxN2/qVnIpF81Y5
	b55CF3Jgs83QXfCzURYN662LTq+S+FtIAV/VfNAeSfxIPFso8NatIncgZNAiVQUv8+rYiNkrs+V
	NieAaKcc+5uXE5Slh1NpBG28ADjWHOwHcYqRKx5eSC6d3OMEhpI0JrPYetPfT7IE=
X-Gm-Gg: AZuq6aJSDWOi8+h4Bx4KyaIkP3a4aIqpWIZ8xrADWL7ZmKEGN0qp+XX8c2Y/1cY+7S3
	QbpcwFdo8EVDy1a3zvkqA3hog64SXnxwmohPKOwm+9PGPPl87eRevJpjs+S/hXBINeZE4MDlEyK
	BBs2Ov8+MPHEyYlwFKLPxGET9CXcx7uJDIcLwsNiag3VyuiKOSMKLfMdFZDsS0bkND6wktZwNH9
	fjOXXLaTqgXYz+TRNp/bfO9ivqoIS0cOHvnvjuFKYm51/nPn4IADpmt10QkvOLyEwMiJq5+VWE8
	7RfI51HbPgffgDgF7oyRQpenkXBrKH7/5ZLZmeuvaqL69OCYq7vfsfRDv9nlaCx7AngIVh8VhqS
	LIItbWxRduEqKrfyhkOTiw/RCfeZebXxqjA/1A1UOab6Nw4DSqbkw83Fqg8m6oEqqfnJnNn30eq
	489RM=
X-Received: by 2002:a05:620a:390a:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cb1ff494bamr103205385a.6.1770716878603;
        Tue, 10 Feb 2026 01:47:58 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8c5:33bf:524c with SMTP id af79cd13be357-8cb1ff494bamr103203985a.6.1770716878222;
        Tue, 10 Feb 2026 01:47:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3c255sm499071466b.62.2026.02.10.01.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:47:57 -0800 (PST)
Message-ID: <857590d7-2cc7-41fe-ba40-62a8ef74bc11@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:47:55 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] soc: qcom: pmic_glink: Add charger PDR service
 information to client data
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-3-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209204915.1983997-3-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfX9ylDLVo8GaQU
 SdNmDa2BW6mnbq5NTTjETOekgyXWw3yu4xUn7bh5pCkZ0tcw28XnooygztEv6TBwZZI3Xe0WtrU
 ZkGpo/fGwWtwlQSCEnoQPlTynNtBHsFztGEkJcGXZjK2WglsqNmuiT/kzYOB8fcfL4hs8hTeLhb
 X4ctLDAkk4LMIhb/RsSXOgkEd5otAvN+stiH+ym0d0KxH3dnQkE9xjmQDa10DGNaogiYWsFmmVj
 C9VFHnJrl1+co6kiTNRANJzaYOD/OjYdpfqbsczzuqksPWA7y4bHjVkbR70hYwhdDNl2OuyW6mZ
 9uC8vi+i0iDCKy3BSFqx9VRuUh8C3uzeB76THIHif045GQCgv3rFjkbzCYJ5nEUh5hSy5fUAmQL
 NQSTfiXZsDcrPm9ZOXIunGZaZlSRphNtITKW8J5046y4046TlrQINdAg9wFCyk3Gd3wYI763t9T
 Z3zXONjn1bHSvUdXQZg==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698afecf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ES-LWyGZB6HvuNGBYh8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KXiguLx-OPhbafTDIOgFs_D4Efn37M-M
X-Proofpoint-GUID: KXiguLx-OPhbafTDIOgFs_D4Efn37M-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33243-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4018E1191CD
X-Rspamd-Action: no action

On 2/9/26 9:49 PM, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between SOCs.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

