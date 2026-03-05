Return-Path: <linux-usb+bounces-34111-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BPsGZedqWnGAwEAu9opvQ
	(envelope-from <linux-usb+bounces-34111-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:13:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4F214410
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 16:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD96F304E774
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 14:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3133B530F;
	Thu,  5 Mar 2026 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gzkut5Wz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3Huz1TU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144393B4EB8
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722689; cv=none; b=OpV0vhL0eTSOOcnKAs89VQdrWyTYtn4ZLDgjVfMybgiCHvMOJWyo/ml1553qpvWZPY0Ag/09TIdJOmirN7bnibneJXfqcCaXxLPFPFu8aWAvVPKP4qrOoX/69BUm/WZ5QDjjULwHTo1iwCWIzcv5ejMI1qsVsH4tmqXIxj7FX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722689; c=relaxed/simple;
	bh=Qs9gPJKzXr2tbpbRvEX4wPUV1Xtc/wDwPMRyVY3y51k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyPpMTlndBivVGEg3gNfXjNY9w+tD09sK/OmsG1gUVbdLP75e/cGTiKcMRaNSvq96eaiOoCnLkAsOJs1pF8hIxE7Ly6sLn3roPfoqKZO+9mxHfHN62zNvFmRin4yJIQTOAC0oCzBNZNfGMxtiQNlw8nwYTQsvB2Vqlz8SgMQZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gzkut5Wz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3Huz1TU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AVQQ52399709
	for <linux-usb@vger.kernel.org>; Thu, 5 Mar 2026 14:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iTzgaNxNx/Cdfrf70aKsspqv
	OJ8sNIeM5vHsdeyUpLY=; b=Gzkut5WzrorEWlUhZlYMEM9MljlG7KEj6HF4zJ3U
	MxZxwNPg4JHi4ZrK3cYdjkaD0swPV1w6ug7wLttiy1UWxfvaopJJHPngHFTyfJ/O
	uASD2yAqn3mPlhh50ybKzNa6RBUkm4WO8t61j425x2WL2PAqNALX7dUozJQ+Jlew
	Kg/YAObUr1oqrQZ/9jTfHV7vlKP4hZItJVDZMbdjkI8vrBn3NtVzkANAIxda+CU7
	NjCkKOV8XOG4HCwZyFBmttblQnlmsKdG/m594cxxNCCB/Xoo2FnynMlTKz9FGU8z
	Ilb5A/0f18WNwnx4m2iCXICgzM+WcM1VXwuWppXNMNJJCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dgrnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 14:58:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so5577647985a.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 06:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772722686; x=1773327486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTzgaNxNx/Cdfrf70aKsspqvOJ8sNIeM5vHsdeyUpLY=;
        b=e3Huz1TUPAHprZLYsuqHpNhpq6AUVcyqOYahv47ImO/WBABFtjC6W4R+0x7uVYO4aG
         EvaF+aee9FR5E6Q2A7qbC/ADLufS4Aut8NVX4rau/a48BV/qtfsqmtWfYg4Ba3QFdw25
         ugm8BKapUyMMvL3ZvsTA75cyHtYA55bpUvGazkuC9ZesvbaHIKMrgyQIs9lcWpYpbKfs
         J0z8EFS9Vj2ZHp8WnD+Xp+C508O8fMjrkTGQ0OBhjrNYmOz4Gp9jcABvKzV4kOUDzi7L
         wiSk26NGS33XdAGK7SsM2AIr7Rl225zDGz6KfV9/g0ESIsYjR9Cy+Eh7Y9jekK1hkhHh
         8X7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722686; x=1773327486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTzgaNxNx/Cdfrf70aKsspqvOJ8sNIeM5vHsdeyUpLY=;
        b=KwHOqOx+z5HBwGp74xV49M/ZUmTDOZCIA/iZCQ+ERDwOdRxPGwrqrHxqh3X8ECWvVO
         LiVJYoCTSHU3JqAfn2k4cGbVC4GS/XNChNrPBqoj/EkZ7X5KRFANeLUYcbkT1pq27t0P
         xeYjnXuNAiISbL8+doRj/WUEe3HXui/50sLGzcxOBC8X49ViQXqx2JVKTDRBblNpY5o3
         vgjXIb5lVcRSiWh/nr78bxnFA/B2xWfN05rC/nDLHcvIUgISIRfoT+fXSrCaSxnP05pk
         bxRlsanwKAeMiwjX33HDee5yIUbt6V0SyWpvnyT25EDd5T9D9uRYVqlz0PjKI3wTKF92
         EEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzJzacdjICJ6xxt/nijFImRVDWGeIyigZuOM46XsC02IhZs632vrlI3VV7kiiKL1Q0k1TXmEJr6pw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy4wlWXQN1Xv5vNy2KTx8bzJRs/e9f3Bm3N1z3Rj3RFn/B+C2Y
	cUpNypDXYYlMuAaCcy2YWF3Gq7omk7RKTE+QfU7lBJc1KK7AlBMrZRfH1+OpCNAPztzwdC180i2
	NlKa+nS5CnsEOHNPYEBtbEgDM7eBKSV/oOieyKXSKYY4FeJi1k7HnIPj9Dd0rhsA=
X-Gm-Gg: ATEYQzx9L01bbi3lqy3FmMptFPozAE3rbB+2b/Ig2wuMjhdB59SzufHUBmTL9MhWIne
	A5ctX6YZVYy+yiQd9jlKrpuHiOkuJi1HnQIaghsnICJBYb2QByDdYhirQn3auO7V9njKsoUM0WX
	1pbo/kPUantHr+vRWtxKZLT1jaB6gNY9hkRGxxzhxyFO4ZgGgcQ8u3yw09WzLNmuj6W48dhYh5A
	CrcY/bW7ajLjqC65rxwhAmMdsfqwZiAlxcdotQEnOxX17rY6dJbPZcQdv86fKGymr306l9rMh4R
	FuGlz2gPkXzDwSB/untHMIBg5yoaY8WgMwJCrlsRUHsaF4Rmrv+oc4o8f+U68/WN3iUEy0m9uT5
	rq5lSdgHmz0DyS5kjVa7O6i0eUTDj7wRD8uq33uWXMUtUSvK1hsiX+Ex/gSm/RDjIclMkfRpqkn
	3suTP/QEPuFSkP03lZXqsoU8h4QHIFlJ8vwM8=
X-Received: by 2002:a05:620a:28c1:b0:8bb:a346:8c84 with SMTP id af79cd13be357-8cd5aefc384mr725825885a.30.1772722686359;
        Thu, 05 Mar 2026 06:58:06 -0800 (PST)
X-Received: by 2002:a05:620a:28c1:b0:8bb:a346:8c84 with SMTP id af79cd13be357-8cd5aefc384mr725821685a.30.1772722685857;
        Thu, 05 Mar 2026 06:58:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a125ceeafbsm1667416e87.85.2026.03.05.06.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:58:04 -0800 (PST)
Date: Thu, 5 Mar 2026 16:58:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: AceLan Kao <acelan.kao@canonical.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Pooja Katiyar <pooja.katiyar@intel.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Andrei Kuchynski <akuchynski@chromium.org>,
        Venkat Jayaraman <venkat.jayaraman@intel.com>,
        "Christian A. Ehrhardt" <lk@c--e.de>, Pei Xiao <xiaopei01@kylinos.cn>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <ffzdbsfxugeoca3csa56t3ieh5laxdyra3kx6mh646eokezhkr@v6xqqbjtn42m>
References: <20251224070022.4082182-1-acelan.kao@canonical.com>
 <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>
 <2026021124-badly-emit-e90f@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021124-badly-emit-e90f@gregkh>
X-Proofpoint-ORIG-GUID: ElGN1Etb4MFfs2axiMCMPiUR9ViS8-N1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExOSBTYWx0ZWRfX49QOHvJ7XvWJ
 B0IG7iCAWfONt5d73siSmPfQMNaq0pYlLpgQYokEvdd8kieujuDMFSn/mwgESVolt5LLuNUqf8B
 rcYzTuDM0JDFOgwA9IcNyCsAdzRov3bNHzbmxVs4psKBFk94PlrZnm2x7AuHxoYhdOmewZKUM6p
 ifcjvo0GrcB+5PsKeFHNliHTVgS3THw2k6fNzBTM0AbjVgVZZUCJNXSwDRZEwGSR5VB0pwywXiQ
 vBGOIt7TKedBVB+fyb9Lkq0OoEnYsLf9lR6s4VU2Na498BUtTBsKmoxdwh7RIO1mAdcEknxm6PR
 5Bw4o392S40TVlzDB0Fn9vfpA8YlQFfK+aSI+7IshfTB7/J47QXELVZFx7nv1WKLftZah6jKklo
 Yv7RUD5+v56z/GOoI2Bnr2Yxc/As2n/3Gzmzdrrtlx9d1T+Zymfkh9H45lExvTN+bWL6KzLpVEm
 EHQN+ozU80uo6KwAH3Q==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a999ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=eedDb6zOIMHHe8PJWVkA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ElGN1Etb4MFfs2axiMCMPiUR9ViS8-N1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050119
X-Rspamd-Queue-Id: 68F4F214410
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34111-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 06:37:41AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 11, 2026 at 11:32:37AM +0800, AceLan Kao wrote:
> > A gentle ping.
> > Please help to review these patches, thanks.
> 
> Wait, no, we rejected this series and said "fix the firmware".
> 
> What happened to doing that?

Having a similar problem with other platforms. It's not always possible
to fix the firmware. I have one platform with a similar issue, but that
laptop is EOLed long ago (Lenovo Yoga C630, the issue has been worked
around in the EC driver, but I'd be really happy to switch to the
generic fixup). At this point it really feels that there might
be more UCSI implemetations having this issue. 

-- 
With best wishes
Dmitry

