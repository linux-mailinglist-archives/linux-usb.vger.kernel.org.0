Return-Path: <linux-usb+bounces-35504-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANDhL/QcxWnr6QQAu9opvQ
	(envelope-from <linux-usb+bounces-35504-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 12:48:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3C7334B25
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 12:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4979F3024509
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1FD3EBF08;
	Thu, 26 Mar 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1ObYSbW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIjPEtf7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF553EBF2D
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774525373; cv=pass; b=l5Ngbw/Ejkd/plNgm51C2WJUs3CCaz/A9lZRmFr6jnK/w56sAKebThdfnOWOSz9lsAKvqYmByJwv+7BYNcc96VYFfjAP2VccEbhl7CswmIaC/daSzE8m+eLgwuHQgFYzHS0XhmTmqNgUvFfvqSMDTsaeRdmONlL/8e7TC/564RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774525373; c=relaxed/simple;
	bh=XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mun663yiYScp0ZIOmkw1DnferOcjcSukyHrmcuzsGvO00KzsBB++VjZDX3GxVxWvVhtojGDSSyrlR/W4hl3c0l7ibaI3pn294mEEQRsY8jp439K4J0PjnM4YqdPUmxsZrGfJGzzTPCt1Q4U01vm9uLA9jGZ2lleqHTyr7N8nF+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1ObYSbW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIjPEtf7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6wKVM1060683
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 11:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=; b=C1ObYSbWiwpCagR8
	PCkhkCO+GXK50Qtp7sDAjSeZkGc90lzWu4RUVAmdXsngOvdubpYWk59L47Iwgkim
	RKQ0z/9x3G2R0rS9Ov8Plj78TrpoyRCGGAhM/Dg/sfIMNWg0FR890NxArZgAPT3r
	cGYaMEJqwlGZAP5VAB9vSPvt93H/4+eHJdc/76+JIt8ZbM/q3y0cvDN1MWs1+wrF
	huqzVEAGVWpPyC5EjR9lWZUvXitGXJS7iKWJUVg8cy27WrI5CTcwz4o6XEdvjG+D
	ajhmt876F1YtrHRC5OKQ4tZWLhmR1EHGItRMh7PbfbyyplcVPEovOy5XW1ExV0+x
	Sas20g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkstffh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 11:42:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4d85d619so21665346d6.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 04:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774525364; cv=none;
        d=google.com; s=arc-20240605;
        b=FjrdQQv/Xg1dhVj2n2VogBsJtu38kh9vCwKJKA1l6n2eM+++qNFmnaozGe20T5m1Y+
         gaCz7BYIYXF1YnPFoak8ZOXysmEhmwvw5BurqL5VP4COzKx8A9YVsNKH+AuQ8fdRdaj2
         RWAaAFMU8BmXPRf6CCvP2Si2Y6XA0S8899LLlfDvH3nnXXuFhjf6oH4pf/C8b2TOlmEm
         KbAJGwjk31ykIdNvfcV+VpTU1Cg2i+LMKrdFcEas/PFpvzmS39GIEuvRXDgmq2I0zeqc
         AdRvEappnSQIKMvfbkqAZBVt7gCJSwjbueTzwt0ACT2T/7CYhZxWHt8YEOcVzlXzJsAI
         FmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=;
        fh=KbIHHdB0JDYpfEcPt4eMXlY5opA8tc2QlttdcFRat1k=;
        b=keT2j+3oujljZO39HCIqntmWJQ7nqrQDIAkxGiXeQyA/+LL3j0e6MMNrmZ9AeDox1c
         vZ/GXC05Pv1Tc1h8sLULhGTJzMP1HURX8sYTrjuT5NnLJ6aO9NKtX8S45oFqIKkX9sUF
         f26rU7qlhR4X5+8FgxE6HVIzpcuvlHJSeQa8W+BwM7048WsRGQZ100rKLNVsUSdfZpM4
         N5m1Lsn9o9mafdBAVixfJkpBI3an1x60vIhZZH00uis/S27dQOYSUmsWXOEKMh5aoYFk
         6VR430bnb4vZSK4N9+jkbn/pGLiUNnVRe7upbfMZs3/XVg5ceVC9H41P8AQq3RdtKWsg
         l5lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774525364; x=1775130164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=;
        b=WIjPEtf7ypeubV1XgBR7R71VSos/Hdemf4GqYh3AVJwt/yuPUdyiJn5axAMWRVSZ+Q
         shVJgigYvdYOGIofbcPfpwNTYtTI45Fl2fNMv7l3dX0vvIf2TnVniAQvJCd7pmAL5Iq7
         QpF7WDgSjfjf51yaN/7M3SPxKRS6t191+uZijkfBtZ+y6CyBcS5GHwjTje8f/OLjh5GG
         LcZ/lrVFgMgreyfqtw+9xoJcydVAJ0niAvGanQjbIsHC6b0yB09q1Lw7ErQw2Pc8uHX5
         ZKf1ypZMod0A7PdEksNPv4B734WjVyF5Mu06i+JiBLF0iRrBykxoCwNPhGAB+Yc6MD8c
         Zj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525364; x=1775130164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZnEY+PXCYFTUIKxsHTQTOQdmnrTCBUbZux8mOVUkp8=;
        b=D6wf40v4HpMO4YouQRumpvbGCPl0qNti2bEMGXb6ye5B6WVUthJsekZJysJjR+UTzy
         9MRUSb21ZGAB7tWDylJcCIzPvDzbK17QyQr7cabqnVOQ4HqYtfzhhA6pr9Ax9ymY60Y7
         yvjrJ27wcQ1boGJqkCrPXE5iFFYgiFNN8AzPPPQyznztqrBmuUsGzNfmDkYIFJx/Uiin
         TAUoKThToH7mrWtRz+IBFWzk9MpfW34KgYJ+YbH/2KcN7DwnbdVhGWP0KVLpRXRqs3Dw
         X+LXaEL6bBMptE9PesqnF5rN+vPUWLNnNSwTv32nx4q6hg57X0+V6O+U13U/91pb73+6
         zGGg==
X-Forwarded-Encrypted: i=1; AJvYcCWgJNjpLW+jDBifKilyDbQ+EUU/AP2m5OsJidw7yZTiqpa4bKFqVl0qOH7D8IACzT7w0cQH6GhVM1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQLE4om2PDbdLeIEbI6YB/5/wp15AU2vyyxM9+k0PF9VeeYazp
	D9nhleyWQcPjwJauwFUxlWn4XWHi6Ar8zOwAm9Z/gGaUYBlc4AlmIQoaVM5KaDfkax39gXvBMSj
	fQI2vrcsN+RLk0xG6zzRNzT0CxIpO8xfkEBPEAIbdpzIWV5Y9S55qL74Br/u8+JgewI5Frl/Y2I
	Ua7646hr7djfD68c+thLyrdvCsuj82PECucvk/aA==
X-Gm-Gg: ATEYQzw8HH9s+/L9QNeJFEH2L5kiXCLXz1C7bH5od1LPJtWzEPEztIMm9rN3o+5Eg51
	BviyhZ+sJWK942Nu2cLYVpSo65k3fIaiuFeh/rr425YyqzuKWPEoOXgrZ6lYKEdAfQlImT1kk8C
	6qIim6V5zPxg+enZm13CEeRLsr1/iWKyf6AHJNZRs/PzGsINtz98Yppf8cwFNAflivCTLdrHmbS
	LG6XZQ=
X-Received: by 2002:a0c:ff49:0:b0:895:4bec:c629 with SMTP id 6a1803df08f44-89cc4b09c00mr80035396d6.31.1774525364571;
        Thu, 26 Mar 2026 04:42:44 -0700 (PDT)
X-Received: by 2002:a0c:ff49:0:b0:895:4bec:c629 with SMTP id
 6a1803df08f44-89cc4b09c00mr80035026d6.31.1774525364127; Thu, 26 Mar 2026
 04:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
 <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com> <20260318-devious-spider-of-endurance-ede46f@quoll>
 <CAHz4bYsUAojfB3BCHVoc8PMQBrjme6grdEnkxu7KhTQ+sxOf0A@mail.gmail.com> <0e88f413-82c4-4986-9d9c-122e0b0377b1@kernel.org>
In-Reply-To: <0e88f413-82c4-4986-9d9c-122e0b0377b1@kernel.org>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 17:12:33 +0530
X-Gm-Features: AQROBzCVc_oNC_sU_oC_61KpntoUnrA8I1UPJ75_lQ-xCRorf2C4iC8lBXyBl_Y
Message-ID: <CAHz4bYvNFw1opNV3EDYaPbvA43KwY560afhHJrB_VELyfc8Vpg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4MSBTYWx0ZWRfXx3/O9i+58FLn
 SjoEEhe0BDAN0A834rG8c1GLPMZM/TtYtnR/FyXONVtlgcJbDtzvimYdKQSI1Uv9dtphTwQlB85
 OuA7XS9PlMdDeSsHaZCUuxPDXjD1P9BJYInmtx408k1lrIbr9961udz32giMZeeEtHtBTnu1xu5
 AXeORUaT3Ue+hM8v7vMje0fyZC/VgHcFFs+MKyeofU4VjuVWfeeQGirTl/bUk1TzL/b0eha6k32
 VTgiRY1rC8GzzJF8Bh0MjbXhHNClo+pB43Q3a6SxDskrjV4PZYEh9vi3rytIpr3HYc5TaoY+QmR
 cScDeWI8ArJfKUlIY9Zf00V6VTyXszl+WGWWf/Zxxrv8I3kzETkaSwKRlLJzJuR/WenXNZlI38F
 ESgHI8Jfw3WYvq3peaJO9ORouXvi0+H2+gFErxCa/2yDH8YPzPl0L/BZu0kV7fYE1NAZkYtglfV
 Hgxn4ydj6g8lFoK1sSA==
X-Proofpoint-ORIG-GUID: n5pbr6tW74z2d9VCwcsvSUYDWLrZmsOI
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c51bb5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=3iSX5NBQDq5eyQkNaboA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: n5pbr6tW74z2d9VCwcsvSUYDWLrZmsOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35504-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A3C7334B25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 3:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2026 11:07, Swati Agarwal wrote:
> > https://lore.kernel.org/all/20260121022449.GA1804139-robh@kernel.org/#t
>
> Exactly this comment is not implemented. v5 repeated it. I repeated now.
Hi Krysztof,
Are you trying to say, i should mark vdd12-supply false wherever
applicable but dont mark it as true and it should be by default
considered as true? Correct me if my understanding is wrong.

Regards,
Swati

