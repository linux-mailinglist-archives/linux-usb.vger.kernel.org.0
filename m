Return-Path: <linux-usb+bounces-37681-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECWPBPJADGqqawUAu9opvQ
	(envelope-from <linux-usb+bounces-37681-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:52:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B757CE2F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E65830DD7B2
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BC6352017;
	Tue, 19 May 2026 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFtRawkX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fo+SQTHO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFB7352001
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186861; cv=none; b=PKYOA3DWQ5Td9lTimrkuOObiE4ceBgTiVZIwXWCNy8Ga+Q7UPBcWVPQAPCTAB/oNEO92cDm9jYem3ASGPpEhG9vqyU5DyWKf4Dh9+/Yd8tZ5YGqWsE4zmB11aLl0/281h1kP/ag9IxGDLsMkKFc0iGx9vuW7mqI7rAyYDjlgCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186861; c=relaxed/simple;
	bh=AxrschLwBHDlVdHJM3psav597BzvT8GiznTe2sTYbwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSuBk2lD0M+YUBcHv5Wcg5jwHREs3gzqMpZxe/sUJWhfYMpxvt2oycoFt0egoJj4+Vn2MtCFR918lUbLB/FEtSXiz7UnT//+SV08Vx/SBbgBwluy7FutgI3qwPLSnnOPPO4pAegBmZQor7XVbddlr9Wn9i6Bpc/G40n7c9cbAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFtRawkX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fo+SQTHO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5xFZZ2438199
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LJrtjiJ90USbs9CvKrw/UyUm
	vdyx9+SH7BWj4/0e3LM=; b=oFtRawkX8BYtj3jps73zNucYH4l7WtxoWfUtiuVo
	5r4y4XIS2+zUAXywH1vbtDuqSjgvh0u0NztNdmyqR7HvV0t2PsgzIKJwDn67jhgB
	qhA+TJr134JiIX98SWbBCNQoaN9/8UykKYTguy7GXPONB3z9VJQtDU+YXAQ01Sp+
	Ufe+9xZM3XEZECFY1x8pVO+MXN5ioCyxZur+4fhwV7rk8BnM3HA/GT3Ny4U84T3l
	3tpS8bQmmWlT6cMhMQPg7o5Jt3PUe5VzGhVS1gZdFkOItZ8yL4wZ92I1UaX93trM
	gfoscJAlBnXAtMJCcZ4JnxUDWoDEF7nLVnK8HNZs4/0LFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v4jg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:34:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so66794151cf.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186858; x=1779791658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJrtjiJ90USbs9CvKrw/UyUmvdyx9+SH7BWj4/0e3LM=;
        b=Fo+SQTHOrbGxUgso8sMZG4+Pl98j5TRHt05iahBnDeEretUvpZ9aaPmDrmJwOYNj48
         i0GlhlkTWvOkL2c+iAYjH3vFgCk+Y7CYds81+iSlmJ0tuocjzqnUD8pxFmmByVf2tuza
         jD7SWleL/aQ7h7vkE6qPrm1CXasM4ofYAtdY2uVu8uQwamlItd1GAczUXuSGiuSjMWcW
         L7oRiY2vL2i65LpVv413gQdHQ/nSXwZ+zwJv2YXFdI8ZseWyucJIh6tnlPyAsCdP/xG6
         moOGICwMOBN6Bgo46gPsTaL1EXjbZiupW0yMpregtXp2p4oW5lCr+/6u1oQL34ZNCjgn
         /Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186858; x=1779791658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJrtjiJ90USbs9CvKrw/UyUmvdyx9+SH7BWj4/0e3LM=;
        b=jp8GrgOSvN6Oqb/n9MDGFyuDlhjEQCpxsBA/TBVLADCeddSpAnK6AV2DisU/ejsxg3
         8AIzyHNJdWc0IZiqdwuSHBEQIO+k0pSvc+29O+uLmp7YFPSyXVsp8ypUOprdE8zfjOPr
         J3xq43D0DjwWXsZdrHdFUktAYVduwAVJKMKFH+zxaAS8EvDgTbKL6h5XRCwfuHAMOr/B
         oAIlR0mBloRSV9YiVb9QVdvN4w0U+KdlSwLa++BGYLDo8BHxomaBUOW24OBnWWtDwaKx
         l9V1LCcUGptZMH6jj5hkQsCmf6/hOwbHv6Sjzqy6JTHcu1P6DrDUYddaa9TB4cqthNYh
         woOA==
X-Forwarded-Encrypted: i=1; AFNElJ8soOJnZSuxb8QBv1cVXx44Pzqyc757qeP+muoT3a28mt5hmgsrIRcP9uevo+ULXwh2P/gneUiPR2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUmcOHDP8ur2s6364XEM1D6lQow6rVtJxEjA5mcawXMhInfo0
	8AbZ14RIMYDM9YCnR1Vqo6nbe2e/lCAyhemJGwVdw0WaiDgb1C6dhzfGnhKAgzzZUASPA+QT7fA
	6Kcqo+Gra7EECUUfEWdJ2luGyvQ5QLfZGSKEYjbVF8aSYgHuU3cByfOYA6MiZAD8=
X-Gm-Gg: Acq92OHeJc5FaO32gwnXjIjKUvEFxXxlucSzduWue+q4SFLYvTNKaKiccIXLJ7gegYT
	6g/KWIkRiBcIarOC69+j7QFKRUT2ZmLlo5q/w8sSFPJGvjFb3ef1J0faHDaZF3noO2n3hTygVhw
	DddDZvad3/YGYDT7WYIsb3Tyrx6OYkGTnctM0Nx/napLvSihj0E/bQ5ybCU9x4swuLcu40xuJZl
	Xx5JKUdho5CAEJ+MD7Ca/A2hfpsbMBLKslyfVaVJukWZZSRCZLHsBQvYNEqTEVc4tTPrCXuECZw
	wlyESHhc1G9RbVXmmE/E0pYwUKT8YiX14IiFAux9fH4s5S0CJbLtYLwkOAqGn+ezJlC7tIZgqbT
	bkG9F+xp8xaHB5eFGQZrACNFtwnzq4CfwHmTC/bckI02xGnd959N3hhVjuqwr38HhYwljdzmTGo
	GLGRyQpdI61ZTJcSlh/8p3xHaFRs0kPSZ+5kc=
X-Received: by 2002:a05:622a:411b:b0:50f:af6a:121f with SMTP id d75a77b69052e-5165a26b24cmr259071271cf.56.1779186858321;
        Tue, 19 May 2026 03:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:411b:b0:50f:af6a:121f with SMTP id d75a77b69052e-5165a26b24cmr259070841cf.56.1779186857860;
        Tue, 19 May 2026 03:34:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874ffbbsm19057761fa.27.2026.05.19.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:34:16 -0700 (PDT)
Date: Tue, 19 May 2026 13:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant
 port
Message-ID: <lzic5v7zdqly6z2tc7ddvwkhau4toaoq7vavbgqll5smmhius6@bpcsn2vyjmrx>
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c3cab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nMIgit4TKir8xPiZD48A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wBdYsvk53Ba3EJ1sYo6K5ZSUlWoFBgcn
X-Proofpoint-GUID: wBdYsvk53Ba3EJ1sYo6K5ZSUlWoFBgcn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfX6Kn8lgJ6H3gO
 s0m+X/NpmDVPztUCcT73gRR7pCj6DJoTSGdqhrzDIpHVZM2bmz9m97utVfFgvjjixO9lQZ4fJ6E
 WBB+kUwiXpHE59j7dWdbDCAdHo4E/ZCquKMRhfoYMQjTY9bgSoYif3VOHBZSocN8KE0n8YUcRdD
 r0ep+QaR4tN+TdlVy6n2oicTCl1qU8bzO1SjkR4XYGd3eB6KVQyfhsorbOBeGMtyOL7FIr1OAN4
 7quCq+L4XSVdInpy9ceV/MRnK5tFofa9DUkefDBYO+HB+qBnATVn9P/5ClZRFhmaFVWfuIFD54W
 781fJ+3Bl8lC7NlE2Hy6IvQ6aMu3oTj0IzUhshTQkUONYjpV4lxczM+4kBTO0YLyfchlVxRcwxh
 BzAI8ZvR3qplf1/Bkde5LETJvzZI/wbWmLRkkhLxB9Iwc1/k5q6MIbvalpVpnGwsED5xODmu1Jj
 yiGRGPlvsnkUeAcks4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190104
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37681-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 815B757CE2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:00:15PM +0200, Krzysztof Kozlowski wrote:
> The binding defines both "port" and "connector" properties, where the
> "port" is claimed to be for "data-role switching messages".  There is no
> such dedicated data port for this device and role switching is part of
> connector ports - the port going to the USB controller.
> 
> The driver does not use the "port" property and there is no upstream DTS
> which would have it.  It looks like it's left-over of early versions of
> this patchset and is completely redundant now, so let's drop it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

