Return-Path: <linux-usb+bounces-37764-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPVLN+WHDWpdygUAu9opvQ
	(envelope-from <linux-usb+bounces-37764-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:07:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5358B592
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B8F2303BC02
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98463D3481;
	Wed, 20 May 2026 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASPZoaiw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gq7LWZSh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81C23D093F
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271620; cv=none; b=RiOvQpPgvBcWvoo8xLQYT+xRZGqNq1R6xZKy5JR5T3nYsOVwJk1i2brEbyPSPyc9HBOPWApDV23KVBCgdwIG4uAgapKvclIr2TqJ9c34p7h/rZtNl8aNU6l5Ev8XNHYdXRffOw2Jq4qxjK3pqRX0ZmmskAIdodXq7bEwQHDmzy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271620; c=relaxed/simple;
	bh=j0UihkY+EzAeIyTlsNC4or/FEgB+Bl32BBoQvSHVKuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPvHR4VlU84OiU9RLMHCK/0VDw7+70ZWiLGEykV0gRno7aL90TO6m3cV45NvjfdmEEMbbvOBVwGctBDKKHk7YO1AiVdkG/xU+HRk402NDNkJgzIaFYM1ohXmnsJpSake7GQglLPogmgfxzM4mqkiC9xLFFFXk5/xReEY3vwL46Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASPZoaiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gq7LWZSh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nOkM446356
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AGX+vAIPNPfSe9tyWRc0yWm/
	nuyWTcL1gkeha8UOlUw=; b=ASPZoaiwYTm34SroNifykAyTtqWWxXB7hxODcog1
	1Edg0MwNF+FlAzI/Cs3kCo1OQdd1Oa08swvOX+Af2bB0zt9fxSuu5WHXFW7sfYhN
	QVedubnhFR/muuTRL6nh5O90iE2wWQkPWwYPdcar/LxSvvpNXSnhOJKriVdShhGh
	VY7znRr1cOkxhtWqqDdEPbHKLe2Frh5sdcvBJJbfPxLlzdES6/qrcZCwSC09lNZs
	uV7p2Bbnc35zT6jfh+YlinvG1DSG74tDdYwtQRukkdZaFqBH4LvcTUnfW1OyUTEe
	lqx+tKjwzYTO2s4h+IFFyYlzYPynALW0knraRIFGgi1wLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg26n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 10:06:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b58065ea15so139753876d6.2
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 03:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271617; x=1779876417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGX+vAIPNPfSe9tyWRc0yWm/nuyWTcL1gkeha8UOlUw=;
        b=gq7LWZShvj4M8vV6lBdIJmQyFtFcO+nqA19Ht5IQuGd5wLXO5vUXDriLZOqAyVQdnZ
         87Ltuv76vrjcFVK6fiMA+2gS8UGDPaEOt7niYPyzR9JAJ7jAXdxp0rBfuD2NkUCPixlu
         xZWvEVX0QHaDQbhL03B0aufd9FJvO4xznPbwYii7bflI2A5BeLYvzftqag/S9SolZUjd
         UIEw4TzsIc4SZg+x499EnZ3JjrPl1DopkkrShD6Sap42c5Y7JL+5OFQjYG8wZt3JrN+6
         tCXE1G3NZWMKi951beOH/dsmSynbzyga4YJHFAtgFi/MfroNKOmqUD/bjkPSx+YZ1peI
         jQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271617; x=1779876417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGX+vAIPNPfSe9tyWRc0yWm/nuyWTcL1gkeha8UOlUw=;
        b=g9JJRB7Dxa3yNH7Ad7sQqkPvOU13C1m/rynz4OQAqzykCdnr61VvNsZJIQLQyD+dJt
         6gwG3ry6T1ZSDT/PkNepGguB2oik3pFCWfGiTzqG6OG0x3PiNHc8Fz7gsJqUjx23Bgpm
         1PnzF0jVQYTNS2lbqFdigNtkq3UH7ZqU6FLgOkGr4EqOCc7QHw6QGkKWhoKpgcRe7Yfh
         8bOTDr+n8S4aeDt9xROrAPo47WaYoA45Jad3h/ybWbj8Y6UG7oj4AOb6dm6eD/I8oTi0
         XnvY6gO3qP4N6fbWyrI0shd3qqxTewEM5IGb2SuEywUW68BMpP1MwaHnFGGZfbsTeMhd
         RiSA==
X-Forwarded-Encrypted: i=1; AFNElJ91FVNpfrdejWG6zxG5GnkqmhXmJkNu54+CW4inLfnRmyJiGA1SiVJYRD0WkQ7C7VGoU4J6B4t/Rfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEOWhJuxsOEKNUjyzt6xrxtURlYKlZF5R87jIG7p86jiCF+dSB
	WnZ3uo8bX+DevPh2TiAKdYXF7+riMZzy+0JKks1uQrg4yy4bTCFoFtJDsmQMh8Zu8mxia0E2g2Q
	q2onqJE8wvulzR6WpJnzQahIU/FFInmBdfyFqaOECTOBPszdh4juAJM64Tz1DKDE=
X-Gm-Gg: Acq92OEPS1MFztsMim9SQ3gbASZ6f7oLKGdmdeHJE0tN0omzHhKNaTudBgHwVAuixel
	KyE3fhTnfbFxfnOUDGI/TpDohGqqf3UhgF5tjWr4XHcvPWiA9EL7QKb32Yy3eiQQSanQFJt4olW
	LTL+15wIhOqNprZ8APntiQM9HrqQqW3HbIMiCok6TeIpQiAuGE32GgfcJQim+/ycZkgHXXKzZ1h
	t8AmMro7cNs1C1z/VMx0SLDnC8TZ+A5sjXQvboEZhR2a+yWfsngK72QMmwRZcPI3z0PvuXolYrb
	HNG9PMlJmDB/aYNp0HHFyKf+EI7NwUATUPiBV1sAihNUBL23hyHa96psuv0Vo32aZ9QPZIlBXtK
	GZhI37EIGhnrapY2tyaCJ7sPyY0w/3rPzHHAJRpP25GJ4tNEnuJ6EnLmfPe3ANUy1bVZWu9C3uU
	L2oDZ5m/D2zfFpTJNGJWHj9jt2At0JqQxsZic=
X-Received: by 2002:a05:622a:418a:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-5165a02aaf6mr311883281cf.15.1779271617270;
        Wed, 20 May 2026 03:06:57 -0700 (PDT)
X-Received: by 2002:a05:622a:418a:b0:50b:4b2f:1606 with SMTP id d75a77b69052e-5165a02aaf6mr311882841cf.15.1779271616797;
        Wed, 20 May 2026 03:06:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a906c3ed96sm4935907e87.0.2026.05.20.03.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:06:55 -0700 (PDT)
Date: Wed, 20 May 2026 13:06:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI
 controller compatible
Message-ID: <kckacvc2bltflnfqcanuthjyaf4sel6qdrd4rec3t4srtnnm2x@clskftxo5uqx>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: JMCS__rNGHpBPKlZ2O3FDZljaoAq6YDS
X-Proofpoint-ORIG-GUID: JMCS__rNGHpBPKlZ2O3FDZljaoAq6YDS
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d87c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=u223MC-wQ-mL75DatgYA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfX0Fed4QUOF/sZ
 QZK48I4EWryiIpNh933FFqNH83twBV2KZvZB8zzO36awhgbJWBqRL/aXWhmcMF+FH7HkXPESclJ
 Xl+PWPXQ3OB1E8TrTRjFpS9FcQlXu+ecJonMaM4t9xABldbZi9sjNHKDJ+jU/w6xGnOgErFjghL
 I/bIM+A6FSRjR13ixTPIbvpNJ5f5C3ioi1oYePqRMFvR5eH1ugGRwhTl6zOdjs9qTalZ9E/lO7K
 vaCy5DzLDr83LuA96JGTEPOsCwSDUjnAuBxDZ16/5SlznL/yHq8geouD1SLmd+wsxFGkXPqMiC2
 3hrq9xK2lzzIAXJroCsH167VRXGwWY5umeL73WLYl9i8lcuRqL1wbAcEewSUFr1ZMW38qrCvbMU
 IxNRMV+Yuw+RcBeb2WmdMV5JyyTcZylf5IfmKaaw/6H5KW8u9ubUsHo8YzeD7ndQDhXy7Th3LEP
 C4IOP4VlpnTyO+dR7FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37764-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96F5358B592
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:07:32PM +0530, Akash Kumar wrote:
> Document the "cypress,cypd6129" compatible string for the Cypress/Infineon
> EZ-PD CCGx UCSI controller.
> 
> The CYPD6129 is compatible with the existing CCGx binding, so allow it as a
> valid compatible and permit the existing "cypress,cypd4226" fallback where
> appropriate.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index 0620d82508c1..90769c43ac95 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -15,7 +15,13 @@ description:
>  
>  properties:
>    compatible:
> -    const: cypress,cypd4226
> +    oneOf:
> +      - enum:
> +          - cypress,cypd6129
> +          - cypress,cypd4226
> +      - items:
> +          - const: cypress,cypd6129
> +          - const: cypress,cypd4226

Missied it. So, is it a separate value or is it compatible, always
having cypress,cypd4226 as a fallback?

>  
>    '#address-cells':
>      const: 1

-- 
With best wishes
Dmitry

