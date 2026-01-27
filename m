Return-Path: <linux-usb+bounces-32808-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BqGOYC+eGn6sgEAu9opvQ
	(envelope-from <linux-usb+bounces-32808-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 14:32:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9580594F0F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 14:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FF5E3049ED1
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 13:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D723F221DB5;
	Tue, 27 Jan 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouiTjnBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JewEvLCB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F021EBA14
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520652; cv=none; b=JfsXBnPCOFlUk3FpfJzVkcDNg91KQFLm/KD/u24pMQ3ZqRZPPSbFFM9VJoFqYsDR3jXshx0rvCRZGL3CXVKD9gAwtKb1+PO4chG9DAvjbYkVYOH7UABj9a5jxAWxc0ysri0B7+V5ihNJ9ALWSOEZeZdXG2NPE2rR5ivHsy0M1YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520652; c=relaxed/simple;
	bh=nLyGeY+mrXwCdT6qDno9ezbqtQHqV6B20cxxSNBjl7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipjgY6xs0XWJOW/M+xTgHdLBlW5H1z31rCJGVcEXfafzrt/j+3agZp4XhV7XGe0MbpxvZSdRNFw3B1iximATRwzWqSa5a0RC3+SM4gqe15Hwc1ijTQ8oncvDNxJ95diDcbTmOLboLxFRnRMXsfh1SKBUWl3Wcvi/STwIiIMECi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouiTjnBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JewEvLCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBwnKv1192926
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 13:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbeBzapWrYk4XxUN8tlPlNoAxeaRaczXIGXzcY69ylM=; b=ouiTjnBCRlgznq/G
	3NLafsMp7UV6lpxVFymJ8a5zilid5+9WdSugY9/XzATzwifryEiQDITxLCOO0zzO
	Z3d6uChuEf5N0znZ6+AbXVefXPXo3xGmJEClNR9VtvuOJVAZ7g21DjBaTyzJjp6v
	NuM5drA/8C8AemkUYPmpfchKknKlZ7eIdscjJPkmgJoOkRd7RcOi1tl2Df/rZqdN
	cFGxAWM09PvUgTWtCSAz1c56PrRtZh4OvtQbGxd2O+1eHrkG0sMYW6/WuOGV8Si6
	kqb9Jn2UjX1VKSeD67uce3kmfe5rHJPMBjVA68/Q1KBghREG3OVy/5BWhzLgtau7
	80DrcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9k6b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 13:30:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so5527885a.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 05:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769520649; x=1770125449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbeBzapWrYk4XxUN8tlPlNoAxeaRaczXIGXzcY69ylM=;
        b=JewEvLCByfasOHIfjdtVkF+H9TZ/c50GUMIKetIoEnS39WN4bd0teSbTVrsnrtoAih
         jBWE07uj1aGUP1FsB/wbnYd0sAu6RjncAysgPKBOv+Wg4wUvFccd4kzMPzSee4HfHN+w
         Vu7mASaW+0WLmpUiWaF9apE6rshXB0d8B3r3R8LhlpNm2zi6YlMkLSMn9TRvM+zpxW66
         B4+e/bKvR/OQAG4jv1ffiH2bhW80WdDpXPg5OB8okfrv3JF6uyRz6xfOZW9B6etTQmsm
         SbjTEGRjUg3bCazL2S8+pag24Wb2SuhPawvC8k4H/3ff6KN1okTiDiw7bXuZnAyfw5yY
         /Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520649; x=1770125449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbeBzapWrYk4XxUN8tlPlNoAxeaRaczXIGXzcY69ylM=;
        b=Luaa6Zc6MJkguVhvClNXkb0LhcpPoQYbXJ45GW8n6x7v0UeRdP3++tGOxxEvHt3rdo
         KYRZI/KKCWNw0e3WxNKdP/NL9Ne31JOVlkjcFQCZqSoTX1PrHF2cNs+AHTY2Jt2Alyji
         GKfvFwVEPq1WiA/d4rNiLmpKAc4scSzRVpKta7bGeQnrNMdB6swyK0IAKraucPzQECOU
         qWjxJNO0h7vndfHe6h4O1fyVews3y4Z2agMpptfMDH3VJRAwDcEO5dxE4BuWunGsaP3u
         0h2OYT3dadCAx8TX+k4QHLKeus2Zqd55bzX1Afc+R+UF4ihB5BHhzk3qjYHx+BGNwQeb
         +YVg==
X-Forwarded-Encrypted: i=1; AJvYcCXWbcivGAICxH4qV8dhPm6iEUfYh0khu3QySRKDbIO6dzIuETQb+F27RXQGxt1Joh+ryMUEymqDnMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi00EGdgJqSJGhmZaT29QnCM38QtqZmOJvAHeImGWFqO7mj0Wy
	yUhjSrPEVC6oys+qmMFWc/KBzhXZnAmeOmduz0ORE3JG/Q9RQ3o1PoflMqJMjwKMJMbJq6C+2WB
	Jx2sXCay7uhXm51japYX4VMXS4B46ZGwwZuWXjI5bICOYvAEoP2jFlScPiPxzBmE=
X-Gm-Gg: AZuq6aIh2dvP4U9Rk3x9yT+37IeCCDo7u1z3Gre+kDDZbFzHswZSSzzihfVwi+nN0e5
	cC7wF1PDBSGt83IfcnofEjs1NULXWziNfYEp/Y2CPTrGBr6tJ+aYMcjjjW3cBZQdrnOq9i+58Ur
	33tfzO6hRxPJGFvh/vin3+cCESAJuMLShe7X16wZSOtNU5Bf9y2qpUSsWLEb7cXBAyCcCe5bO4b
	MFmae9OWpMCefX1nq8W52ewA6Vqm9HSwmDLdGSE6N7B9p4dcEwDRIaKyLGFtvAKHS0RZI0PCpEz
	I7e7dKNWDWSnsDQ5lmn1Y1mjJ6BZqtmdawsR10xGeytHo7ZP9XRf54fgkpRwjPaKLl/DcXYkpNW
	MQTnmvY6SVmZNBTg91k5QaNopquflCoqbo3b0ne1cMggpV3ZuLE1AX1dV3y5s6tAwC54=
X-Received: by 2002:a05:620a:2984:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c70b91c60amr137979985a.4.1769520649404;
        Tue, 27 Jan 2026 05:30:49 -0800 (PST)
X-Received: by 2002:a05:620a:2984:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c70b91c60amr137975085a.4.1769520648739;
        Tue, 27 Jan 2026 05:30:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b965d98sm6610869a12.32.2026.01.27.05.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:30:47 -0800 (PST)
Message-ID: <537a8bcd-360b-41a3-9a3b-58d6f7e4f0e2@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:30:45 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] usb: misc: qcom_eud: add sysfs attribute for port
 selection
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
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
 <20260116232106.2234978-3-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116232106.2234978-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=6978be0a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Mi7szx8wPLqchxB2UhAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: DzZsBJ7uZqDqu6M4WvvcfKPj8P5Nlg8t
X-Proofpoint-ORIG-GUID: DzZsBJ7uZqDqu6M4WvvcfKPj8P5Nlg8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwOSBTYWx0ZWRfX1IvqcgLmx5ck
 Pgr52dfplboO6qwnSjgccvZ2+9nlSNTlBIbzwhpDTGacnIjhyEugddj4dGOUejYkIRE/FG+5lLS
 Gy0evNT764WLYlSCyTgMQGSNceFcfFYU6LaLnpnexnmw9I5OZMFlHfgiNlH3Lg8FXfPqSAOFWeg
 9iF6t89XdCmDxCQLl1RPG+AskxDKWpc229oYnTPBNNr7/Te41m3FuoN8j9F/VedJC7QSrYeCxdf
 MLwTtmxYxwQeTUmDq3ZF1E/wWlyX0mdxqdfmMtPYsIfJRLDXZQ2/70Q1XWEg4E2ADx7fq9Fu4w0
 wK1+FFn/xkiXmiPtdnehTF6H4lWssuI0xK4MAmx8nt8pTqAto2GHoeNvAXBw7xN8Pw06FP7tg41
 9KWcpfTdSzEK803wvRZkGSI/jqO1Bvc4WND2hzYWXVmdMoMDhYgQtoCvVoSu6MVQ0PEcNfoAREb
 +0geHCJOSeHkE+N8Y/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270109
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
	TAGGED_FROM(0.00)[bounces-32808-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 9580594F0F
X-Rspamd-Action: no action

On 1/17/26 12:20 AM, Elson Serrao wrote:
> EUD can be mapped to either the primary USB port or the secondary USB port
> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> attribute to allow userspace to select which port EUD should operate on
> and update the ABI documentation. This is needed for systems with dual
> USB ports where EUD needs to be accessible on either port depending on the
> system configuration and use case.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

