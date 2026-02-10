Return-Path: <linux-usb+bounces-33254-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI8LHoMki2mTQQAAu9opvQ
	(envelope-from <linux-usb+bounces-33254-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 13:28:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D090A11ACEF
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 13:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E35C30557C2
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 12:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180E6329387;
	Tue, 10 Feb 2026 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNFJzOJF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMFvot15"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B9328B6A
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726404; cv=none; b=f3YjiDI/bDrZmO4e0uKuDzHHgT9wCCC5yT+ZpfvNOXDV7gRm2kHUajbsUKyXHDQsxXcwEpVVTzQVw2F+hyfnVjVc+0cmnSlO6rIuWP92fRJwWKGi974/a39mHhs28hU9YY33vnz4kd2nP+N+tphpakg4B6vBvUbP6awF69CZXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726404; c=relaxed/simple;
	bh=fl2ZMo7M6120fmFsvmwNk0ItXUQpUORCiYTk4e4aR3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhotU/bO+S3zVkpOO1Lp6vzrJx26zL/3FdS62dUFLyDXdIRoICxooW3hdwpstnYEz3fKa0y//QVs7EKgCjZF+m48W2PS2pwT/gF+mq5V/GyFIbnUZN5GtSJyE8aSyGXmmqvqbxF+BykFPWFaCo6feN0ZU7hQM8p+ZgQTDSXcCV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNFJzOJF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMFvot15; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7735o1151816
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 12:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lT5fDNCokDAVTzOUqksRTY4
	0eqjpMczK4XWDN2USPk=; b=jNFJzOJFfCSJSqboH9O3s+M0n+GfjQWl0eNFC98Y
	mXwqJZZzcWRh5r3kFT1wfN9sYVujChwrpCCSHNjmOdSnQlDSbE7NqxegOMdvAJi0
	sT9h9I7TdsgJx59dmOiIjlclAoPNIKHgnDNHNtSSKQ2hSy64Zk1VM2PL7V5pDQge
	YUkEHqhmShT6hn1D2ypT5KDh9tFS0C0O1d2Li6cS+2u3YymBvU2CZIImztNSVJ9V
	HKYuvjbP69zrtn+sp6ai7kqkVkrp6iuJ4JbjSp5C8Y+DHypS6vTnCPnvTdSb0R9k
	vXQJ0S3S6zk4oyfMezzeavwLF1ZY4hT4W5IowTpv1iVJyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j917m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 12:26:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a2ef071dso1649447485a.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 04:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770726402; x=1771331202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lT5fDNCokDAVTzOUqksRTY40eqjpMczK4XWDN2USPk=;
        b=MMFvot15P8qHxuIO1NGDIkJ6tWVTd5iQdmOCLLLKqJyqTbSwrDEb2VzdribDrPmbIS
         yJQGbDO+DY/wBc0AclJipcU4+oNkh6Ijvir3TTACY8bc6nfGZuF02sqXtqJus2RZoBNX
         S2XuCq2T56PXMvyg6EsW1643VS4U0rg7bMmMR4ao5MNXOWDDvkySwzdqa7haxTU9eOHE
         3ePrEvReXtt/zkm+grAJc98VrBQSi7oEnoyCLBfZyU7IBYF0+o5D1TSaFCGzGzp+QkYr
         JLOFcNwdU5KhRsqivKeCO3qAxVU408yzxvfBJyFN+9z8WoBjkHqmlJp8WdrJPAfmDGA7
         HRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770726402; x=1771331202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lT5fDNCokDAVTzOUqksRTY40eqjpMczK4XWDN2USPk=;
        b=MttJx9/KATtGP/abWzhpsSlWSWF/5Bu1t1vrXE1im14ZRWept+VtC2FGLTPBqLp9R8
         KovDaZ+BgmaxO12IJ9JLbcO5u41v06gO3U0t9S/dezacwOf12HJUguuwMOYze4oJ9tzB
         FwKYnDk2a5cb9b8OPTsjqpI5f69ugAz4KTWkP7/yM9nXFxPJ1sIOz02akn+T8wsSoayp
         cRufep6qpeFKS65WMm0z1ei8TQuD9/6UNn344d2vw6D3W75CtghGsn3GaagIVALqjmdq
         zQEIHIsnZomeJO5nzKYgJiPQJ2IfMscXn+KBEiIPzK4RPZOaTtSWxnAanP5Qjw0sXwyn
         /HbA==
X-Forwarded-Encrypted: i=1; AJvYcCWDyoHKrc8akqWLgJzePjS46YZTaPjMB3gjW3zhmDo97QHWsIpJTyYRhT2WIlvFFqhbz6W9nyGPvms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKkvsx4W30qfvui3zHzv/S2J2C38681lNbNmVxSPx37DDehY0
	boeuTnv/+bYzt6Ij7d70cnZDD8MxSYOSZxBgQnGk6mQKuUM7z5dDTj/KdNf08BmtpKwDRmPheNu
	Tyu29jR4emdbTNhSU5jG9tJO5azF+mVUONioiD6i6da3XPSKLtVbUa500xbvjf1U=
X-Gm-Gg: AZuq6aLwnwiVXN+cm94gSV8qddMGtCAtAvYaZ0HQcFFhIDkKjD5zDKeowSWicG7d/sy
	lxayZ5IM1OTArkXIPtp5n8V0KebTaR3Ef/dQ4Cxdw9zJ53//le4W8W2K5kWbUBA6hoIJUK+gGBn
	qh/pkYU/Tv4J/wtfxeKPl7hKSN+qAQuBjN1rRm+rT25j6+1k8bwf6iHCeUKMQN47+HiBdajVI+T
	bsJVrHfJwiW8Cpi8jZb3hPU5E2OoK7lXS+7tcsC2fNSkfQ7E5mmD7mgZAEF/Yhfeb6l+ZW3eMNd
	mtwhbag57gCQRT27vH0T4Wnbf4Olbyw3lt8VfrMWsKiimnAW/hHHnTr0mblTPolFyJjGfVwbGAV
	jUkUDjW0Tar7XLZvrPP3hgpCklW/ZLAZ/fArJbfVK+eKwWxDqDX8pIe3PM7ySgbQMXSYsA8fHwC
	DTaxsVBKk01S5pvRXpYKzvheq1Vbkmkf0FbxM=
X-Received: by 2002:a05:620a:1729:b0:8ca:3c67:8922 with SMTP id af79cd13be357-8caf1acd8camr1823066685a.85.1770726402025;
        Tue, 10 Feb 2026 04:26:42 -0800 (PST)
X-Received: by 2002:a05:620a:1729:b0:8ca:3c67:8922 with SMTP id af79cd13be357-8caf1acd8camr1823064385a.85.1770726401604;
        Tue, 10 Feb 2026 04:26:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b624cedcsm31111991fa.11.2026.02.10.04.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:26:40 -0800 (PST)
Date: Tue, 10 Feb 2026 14:26:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 2/5] soc: qcom: pmic_glink: Add charger PDR service
 information to client data
Message-ID: <nltz56clgt23xo5ha2sjx4u7gowaokc6uzyjv56e3g7gw2447x@4ro6zrcyhpj6>
References: <20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com>
 <20260209204915.1983997-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209204915.1983997-3-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfX686zrYpS6YBn
 qsiPemADcpsYdqjcIsu4uAs1WalaYV7S1foJiLqW2m8jBfyV3w0PTHjlQEY4Zojrg/mOFBTgvD8
 ajK5gEWrTXUv0+uyp+vTXCevFIjbLDCQz8+VzFVehkm8jmTvH959gGCxwIpX5/IUmBvx4wZQzmH
 7gQNjlPDbQfHshe5ks5QM02v1at8WAuP54HiTq5c6K7BwLLkvsY4wDOqYKuuio4LudmbSroziBe
 5BJ1Ecqc/KK7r3JLPMhmDVl4qH3uThx51gMCeU9aeB/GNbQcOzpfkCmwFvTrwZwM0z+JVaXFpZQ
 mDIpApB00imd9so5RTLo15xwoQsXzECcHDyr5xpUM6SjbDWGuyJxmTYt/i7qyb/rR+janHp/vmj
 xpaIb1UO8SckXULMQ9mfdydhkR0eAAgMBMNs6yY+O/iVDMxbmioPRCH4SbFGeImnMCUy5dque98
 zrK9JWGcH6HvhQ6Nzjg==
X-Proofpoint-GUID: m03sqiV8R1lSJfARy443_U1f0yKjqwiC
X-Proofpoint-ORIG-GUID: m03sqiV8R1lSJfARy443_U1f0yKjqwiC
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698b2402 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=ES-LWyGZB6HvuNGBYh8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33254-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D090A11ACEF
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:49:12PM -0800, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between SOCs.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink.c | 58 ++++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

