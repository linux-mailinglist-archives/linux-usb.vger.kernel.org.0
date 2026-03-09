Return-Path: <linux-usb+bounces-34370-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDMRLbw9r2mDSgIAu9opvQ
	(envelope-from <linux-usb+bounces-34370-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 22:38:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393E241CDE
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 22:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D3C030EB5FD
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 21:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D649F36C0A0;
	Mon,  9 Mar 2026 21:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx4VO8xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g91xbJGa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552B9220F2D
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 21:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092043; cv=none; b=LSvYXTirbTVQyrNC5Fjtto89lmbHDIMMKTgX1VxCm2hKLMOlrUvxCmYc1dh0NRoSlqV9nG/jhPEV7qFB5D9Fi59KFXyif5k5oko2Je/lBNjbhWrDzjrmDXviqZeuunxoiZPMAub25FH7glIu45M9lwmN55pmjBnxJGLIzmoDrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092043; c=relaxed/simple;
	bh=reqmekH/iSpybK0ABbh7C8SmgHE6GCp94aYa0M/nO4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEh3l1v3IrdQ8sZIL5hlBvXbm8orowYB7zBTegn7ZKyS7t3joo3959mMS5NhKGrzfJ9u5MVf4UYI9o6Mw6sBTuTPPGHoOwMbw5WG3OLBMB9zIG9YhiqgwHkxmf1TvipzgYZuAKaEdFJh/UB47Yq4ckeVfkKBBDv8KC0WUKfsBqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx4VO8xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g91xbJGa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCNAd2428827
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 21:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hULBJxvAuvZHR9djX0lRgqPU
	HI91tBQCIAsTIDg4GJ4=; b=Xx4VO8xdWLlyzhkob4c+ef5wup1XxO+WulPfqk2L
	+2L21TNGuRR6IEjPYTz1+dFaP7M4mcLup4hi9emhs/ANMX+a2hfvDGrNv6twOsXS
	/1n2kuQf2uqLbIi+4NuwG7XnHZFgyAhF1EZJpS5RTepaegWxbs62J9NQkJ6cuXoy
	x7UvMtapw5qHkFtW66Qf9dotoAfbbD479Nl0jGVnJQ1XYysUL8qNw+SDXc856w9x
	8BedvvxYf0CuSkHVtB0U3BtLD1/1D/jj0fxR23KF3eEnYQa3cgX0TSyQC5HsLWX/
	z0AqjZtwMqG1umYQHeNQwFTRvxzAYhw7+iJQSp1NuMqbVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eks2k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 21:34:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77bc8186so2471554585a.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773092041; x=1773696841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hULBJxvAuvZHR9djX0lRgqPUHI91tBQCIAsTIDg4GJ4=;
        b=g91xbJGaTty3RkELkEjOOG3vLKjPGvpMpvVgVBYakgsCkZDUEOb5ywODsaE2m/en4j
         oH+HZ/ma4f6HsUpyXLNxoedb9p0+RQevK4172NUjIBWqEHwGF6ZVM1NPNk05wJBUhiMD
         wNbgVZ9pwGxbytYOWujdwfwtGPmbV+Zp2ExEjaHdqhSB9fZveGkQZmq0qb1JS6efU8ss
         BF1tnCEuqkAfIJAXCZKHGRjzHXnMIUk2KX1HshLW1Xh82SokDzesjqekS+hTqmMvsirs
         WiZD1//vUVdw+4iSKRkWrQqY9whz+wHJm2+BAmKXkXel8mfQiigYwnOX6YXTDXi9NcIJ
         RW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773092041; x=1773696841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hULBJxvAuvZHR9djX0lRgqPUHI91tBQCIAsTIDg4GJ4=;
        b=M1tG+FxOcY30q7lfHh83CDWzEa1vaJGdKkMa/vyfzTIDzMc0oGDZkYjlqqGMeYgRFo
         ZQkOps8uh69a+afXhZGXmwpiXOyuYFcDtBORkR8tgAkCLx+2gLOTVT8xIDymusmSCn9n
         Y/XkdbzRpEllcb7d0QZ5YonnhDlvrDScK3VqaxrCftL9H2wfxY+tQeQSotkt2PndzjK0
         Zq1z54Gz5wOoUNdNHJniUQGzKWF1l8i2H4CGD9K6YHpGJiaHJYw8jKq4uoh78bI4PXXq
         Qjs9H9nnr74RSm8XnLGozDQkp75kiaCs2yus81Lw+DYl7dxC2HEshcvHgzbEJuhP2Ffb
         Elyw==
X-Forwarded-Encrypted: i=1; AJvYcCVmjTv3FfLjlOrHmiAIIcMH2HazfYpLY7h9RlzTRDv+uyhoAf3EUOF4izwG+ccOAzKIKiIV7aLkJsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfXzq6cf7xdVLGLGe3SJ/flYbUJh7QPB6s/GB9lU4ZOL4uBW8H
	L/smo8mW6v4wTh01TYs+dPU93kR8ciUP4Q8XmJ9ilJkD0R5xLwPGFjHZVp9GAWc2xU4Tk+dyb5f
	8hMq8B3Idq5r67pUKXJeq5wNXSp+dG7wsY1EGjv86dNLVOHqykOxR1A9/Bi6tgM0=
X-Gm-Gg: ATEYQzwd+c3CnLesMbLEkm5dn1t5Lx1qq6iyRLFMs+IEb6SpOZbpjAUBC/S5pqzY3p5
	29XoqfirwHYR1/l4TShRz8wRxR/qUarWFrBQi6Iqb2Z4f5Ush2hCMNaP8bM4PxAny3QDpQgswpg
	qfzRNGqqi2qpuAlORoZS4oRprZeZVJ7BZtArImRvGFjApdqas+VmvUFTotE3lr4imqtNyxUL2sN
	GbiIiQyKDaiEG8pwYFGgz0B5znJYv95HqRzW4AemkeZS9LuUuNCf3qKKM6SWs6wlW1LoYx1kMu1
	QzlZ+6PhbWl7IWgTwjJURlds2GoG0jgVR08Q3f/RTq778cBmsugB7/5v4DDN23yTTqACurtZ/8X
	rlYDYKrXpznk4jPojzWpwEsIBjPwSd6pzUUMy48y87KBxVDcXwNU72kNoBbANEs+VAHc8BATE2y
	wqrZoFk5V8dzf8DIAb0M7YlS2ooTDEmoj/Me8=
X-Received: by 2002:a05:620a:700a:b0:8ca:105a:298f with SMTP id af79cd13be357-8cd6d4ec9b3mr1623735985a.68.1773092040775;
        Mon, 09 Mar 2026 14:34:00 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:8ca:105a:298f with SMTP id af79cd13be357-8cd6d4ec9b3mr1623734185a.68.1773092040360;
        Mon, 09 Mar 2026 14:34:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d02b860sm2360342e87.29.2026.03.09.14.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:33:59 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:33:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <secauapnexowr77eoxquyxvbzu7tokd7lpxfo24lle2ktvtgpv@p2qpnvqywwqt>
References: <20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com>
 <20260309-dts-qcom-glymur-add-usb-support-v4-2-6bdc41f58d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-dts-qcom-glymur-add-usb-support-v4-2-6bdc41f58d18@oss.qualcomm.com>
X-Proofpoint-GUID: MfnCgF1Kopusk17lRcEvfU_LzNmsP0wa
X-Proofpoint-ORIG-GUID: MfnCgF1Kopusk17lRcEvfU_LzNmsP0wa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE5MSBTYWx0ZWRfX3dpPog3iws+k
 Ql0W751b+7BTqs3IPLeNjiU8smCH+TApGtvRQUMNCXYSS07hKK8f59BVA+a/S021gUSokcfJ70x
 mj4WQPzDIFJ/zmpehR7l/UWCRKIVPFtUGCKBfZG0/opatDhHkjC0n5KJRUiMFbyi0EQl/qr0ql4
 k4zZrkCIbAVllNSvNu2my4Bf9xx1HHuCydjz8H/gNGoxluuAmSFAF8pLDvrqo8h7nZcpAVcvL5S
 fRln+FDDE8a3jN6nm0OkRFS/NxbV5gdb3pv74DdPCQ1KqLZ9CHyvqCmBJhXBqB1Q7O9QCWM5TFd
 Daofi/toLgU7xrXGhYWBCW7nUJiGb2QOyaxggzrIxHbsG8a9+8xLqCn0YDNRnURBup+IGu1u8ET
 pRrFVxgHxIeabdyu8DRHvtV/dYRGxaZu9Lqk3eswj1au8fO8Ca7YpNw/bcfdOi2JVl5WvytrD6q
 hWcq8uBDraYCwuMd6WA==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af3cc9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=o_jz2lA9kCOULBL2u_AA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090191
X-Rspamd-Queue-Id: 5393E241CDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34370-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 12:56:52PM +0200, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, 1 USB multiport
> controller and a USB 2.0 only controller. This encompasses 5 SS USB QMP
> PHYs (3 combo and 2 uni) and 6 M31 eUSB2 PHYs. All controllers are SNPS
> DWC3 based, so describe them as flattened DWC3 QCOM nodes.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 691 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 686 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

