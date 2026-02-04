Return-Path: <linux-usb+bounces-33103-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JrzEylTg2mJlQMAu9opvQ
	(envelope-from <linux-usb+bounces-33103-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:09:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B5E6E24
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15A7C30CE8E1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 14:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F1E158535;
	Wed,  4 Feb 2026 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiLZOMYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wx5gfPc2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18242772D
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770213700; cv=none; b=O17bT7M+guFs1Dryo+uOgsTEF/YH9jWHEUGjN+3fJEDxg5MYcWfSWvjui/hlfRZcbvGPtr0GlFDL9Kkfrjb9BIXpbIqVFIgpK7/1ZCLwuS+jateFZ+E6np4+0VvASmDmu1L16MtGuLg7c6tPtznrCJiTGBSKaL/qzUVZLeQ3aQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770213700; c=relaxed/simple;
	bh=emMy13JrIEWGGb4Yj1Obm5OPqROR8LK+7EP9jth9dqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hr6Ax2neKlquYSCQo9CrXOnkVwTjIMS63l3V87gORv6toLFzQCgZE/6vLTtp8knYDyzn01SIa6OYsqBxx3oTs9L8OkgjiaIPZdyT3HS2O46LisYyr18+JZYxw+rOwPtuyXE+m2IAAdMwtYQuJi4SBZmu+Wt2rlKHvadONGgXQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiLZOMYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wx5gfPc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIPuB096162
	for <linux-usb@vger.kernel.org>; Wed, 4 Feb 2026 14:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iS4JnPBI/eXVdO62TuwXvtzIoHIazcuTqGQx24R1EVo=; b=ZiLZOMYRu9h4C6Tb
	h1jNhopo271rF10/GFM3clK1wupFoWU83A/Fy744Gh7fbDSjMW/KGAMPsmz53Bmy
	Nz9+sATEiw3LgAgIclcQqFXucWRw+z1936yAcwxccfnQcMSSMbCXvrHCAkOEgdVC
	80qbUBPLoYGLu/chJlPYbVQ3FkNFCXRJ8RZBvqyRMxndRxNt6GDmRyQK6a7WK0UI
	rmKFPMzWuS+PsXwU8hbrG4QBma6FqJGDbhUS5u693dpAyjqS13N8C3OXOqmbAdZW
	+4FfgpRKiQQeXbftpqosHUbIV+d+d6Uo2p5exwB8cyvJ+dfk5A6j3dMfgfd1wQyi
	3wzp8A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44kbghfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 14:01:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948ad08958eso983682241.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Feb 2026 06:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770213699; x=1770818499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iS4JnPBI/eXVdO62TuwXvtzIoHIazcuTqGQx24R1EVo=;
        b=Wx5gfPc2Ots6YB7iZKmq9emXlJXhy7G18nkpYhL/jCzwIQaQMZ+sOIQo0T9pO6d3rE
         Kc7NPJUcXZtuUem1BncCvogEtZHA9Eea64X288B8tzUMg6spujwLcEcVVd9vKn5u0NFm
         dqXrCAeXq86j6LjQ2WgZu5DR23taqko9HiFwPKwcj5j5+3S5JpWZ5iZn4m5pKFhpDvvF
         oyL6p1Mdf4oqCwC6MNnNf7IyweY4xvTvxTkfZeftNfiAGrkLQtoKPxr2qMkIKYPbkypY
         Sq5wqxPYY5BXqbK2cOoQYAeN5UC79w2eOT2LOl6AJO44I0wn4mXFXeR9ss67cokFHa3Z
         zvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213699; x=1770818499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS4JnPBI/eXVdO62TuwXvtzIoHIazcuTqGQx24R1EVo=;
        b=rw8J5VIQTx3j6+A6bvsspvYCj1k/KQtF8CT60EjVrKpFEJnEsE/Z2SqRTODg+4x7uS
         BR+Rimmzc4rRjou6qD6jvAwHL3bL0mDj9n8kPmeht62/Kk1kCUURqvBuxPa7Mre00cOn
         PRsJPoiJxE87T8XXHlzKwyE39HDACCfZ4rEcYEpruncte7ETYttL2lcIgKhfjeybWrLH
         PFRD/51x7/G4ZmoPkIemj9zDPkwDM8UyMQg0LvPdIQtFcSyznh3GxgvVpFzyIGO1OpuQ
         YdEy8ftOsQTSYOFLjxWGqD9QezEdoTjuRTytzSG5NjQLoNPGxOATSGX94hZE6rHh2O/R
         RwUw==
X-Forwarded-Encrypted: i=1; AJvYcCWR22zphAVuBe8cdiOrKHXLNStEEG1uVC3sYssS9zd2kdn2E7KhMp31EdZ6KFRlwXRGBOL0xvYXgz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHv2BTZSyLGa7XSz5wP5icPKsjGTmPPux6ku9FA+YeKp31HWyE
	aSmx1hI1EtzlbdKlQOzsx3khYoJfcFOM3uluDI8m/gHC2hGs97UR2JZpdkNvDhW3sjkVDravWkN
	YtoygueN25Vxyqm/2OIvF/ZpkaI7VzTmfCNH/kG6JTLEU+bFoo2INqhldNu9FQpg=
X-Gm-Gg: AZuq6aIUXjyO5Ye+5dsxbTLIi7es/IaBj/ODw13ue148P43kU2yiYYP+zHFAIdwTkor
	tGqEYlgYoYwP8bSSatOPn2Aya4pqCqb4LMlmdgbluhggc4MtQoQo5DtOgekVnw5uxuqTy+H7/ck
	eUJlUQ4pv/E5TaS853dVY7HO5yoiNE+ojmY3gxoR7cHEaQyz05+Q9kbcZTKV2vGcUExGF3zR+f3
	yNZ0DBahlSOAP5N+P8/zrCinbiI1+UmS7HXvOQbDUi6pOjfSWUHS7KotGi5em/j9lJRfo0e5xHS
	JiXA8J6j7XMsy74/x90WuYWLssklOKzpmQ6Q9vXgyd2e1hQKUdiPlnTKsC0OazipWykXDUBWbiP
	F8Pscd6jelFCoFF+y0CGQ2lIt6GOVGbK0M9o15Q5LLJ3dt+fYNHZi1L7Q0F6r3ZlPrZw=
X-Received: by 2002:a05:6122:1306:b0:55b:1668:8a76 with SMTP id 71dfb90a1353d-566e808afb3mr556362e0c.2.1770213698839;
        Wed, 04 Feb 2026 06:01:38 -0800 (PST)
X-Received: by 2002:a05:6122:1306:b0:55b:1668:8a76 with SMTP id 71dfb90a1353d-566e808afb3mr555907e0c.2.1770213694155;
        Wed, 04 Feb 2026 06:01:34 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f17sm128981866b.12.2026.02.04.06.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 06:01:33 -0800 (PST)
Message-ID: <a16563a6-b338-42b0-8e04-b1ec56145175@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 15:01:29 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
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
 <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yDjQyPo_MUUNqkC03MGgolSE97e0-SST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwNiBTYWx0ZWRfX5m2x4qSv9XV8
 HgEvDwStuqO4rXwVGIu3Hwl3jzPQsqGQde+LkFEXzzTCOVRtpwtkvt1YGzL6DctawS81xoz4Lsf
 ZQ6WvlDIzNbDMvVjuoUdSYF5Z2R/9WOXD9XQkVdHusDubiXM6t1B0J2A+j5m4HpH+gQoiHSR1vd
 zPOxg6oMeznhMT1h0q2byxVU230xpKt6jp0c0HtTXv2S0OSkW1ghpDiW3HcwujgBLcYw141BLLs
 uKlAY699OX9rty4Ee/A6f+kTmrtU1q18mdTunP4CImvxjdC8XfN8pA59OFDLlRcnXmRD2MtZMME
 quHNlmSt129X3LZqxyBa44M9YOe27d7V00HlLPitvxjznt+YzarqOuDTkmO1I7POLY3WIo9/4QC
 x40ldjJmrcCnWM3xv89vKwUWkhvu/OS53q4TEB1sqUCuXMkNTYfLoVg8PhvXgsOeT973uSPffUs
 bjvT6fMODJXnyfSpnVQ==
X-Proofpoint-GUID: yDjQyPo_MUUNqkC03MGgolSE97e0-SST
X-Authority-Analysis: v=2.4 cv=HN7O14tv c=1 sm=1 tr=0 ts=69835143 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1VuqB2ABKDwlP82YmI0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040106
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
	TAGGED_FROM(0.00)[bounces-33103-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: A31B5E6E24
X-Rspamd-Action: no action

On 1/27/26 12:38 AM, Elson Serrao wrote:
> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> independent High-Speed UTMI paths, depending on the SoC. Each path is
> distinct with its own HS-PHY interface, connector/controller wiring, and
> UTMI routing behavior. The EUD hardware sits between the USB2 PHY and
> the USB controller on each path.
> 
> The existing binding models only a single UTMI path and does not provide
> a way to associate the required High-Speed USB PHY. EUD relies on the
> HS-PHY on the selected UTMI path for link signalling and correct operation
> of the hardware.
> 
> Historically, EUD has worked on platforms that use a single UTMI path
> because the USB controller maintains ownership of the PHY during
> enumeration and normal operation. This implicit relationship allowed
> EUD to function even though the dependency on the PHY was not described
> in the binding. However, this behavior is not guaranteed by hardware.
> The current binding description is not sufficient for SoCs that expose
> two independent UTMI paths, where the PHY association and port wiring
> must be explicitly described.
> 
> Introduce per-path eud-path child nodes so each UTMI path can describe
> its HS-PHY, port connections, and the role‑switching capability of its
> associated USB port.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +patternProperties:
> +  "^eud-path@[0-1]$":

At least a since instance of this should be 'required'

Konrad

