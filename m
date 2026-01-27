Return-Path: <linux-usb+bounces-32772-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGeIDPpLeGkipQEAu9opvQ
	(envelope-from <linux-usb+bounces-32772-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 06:24:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FFB901AF
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 06:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D064430107D6
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 05:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8196329C70;
	Tue, 27 Jan 2026 05:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEIyc1q5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CULRNVHt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DF92DC322
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769491442; cv=pass; b=Fuquda+NCZqK8OQ8ZI0HDh8GzMO/fDB/E21MmtDvPYlcWASBFdLCf/ptgr51crdawfa8p59KpGkx/G76FIYTIvXpszFEyD4hpi6evMO/HEUeB0fSULLlPv5B+2a6QvknXhq8XOJmMxP1tT0NH0b2Qi49/QQIB+zFSeyk3UwyU8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769491442; c=relaxed/simple;
	bh=5ZlTeowz3mTvEpFuyPP/h5cAPT1w+3Lo6jgfjO0QgW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FavW90u+RoCacaFw+AYF337/YKnmTRbkxkgPds5jZTeh/KMjIzDEhiGhCOu5K8kuEHsL5+GcEIjemZWo+11n/f1GBEPVN908EPFBkGfU4HvLLbo923B7Io1QDGaBuUrjrXlTGRMg4eMGwEU2AP+H2OJhkXRDT12u/1MNOD7Cg5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEIyc1q5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CULRNVHt; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U02G3857558
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 05:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65Dr++7k9piqDeeF3/jJFpw99hTaSa0WRcxnBV8/P6c=; b=LEIyc1q53oZymJgs
	GxHSC8vEmspOAgK7Vr5GXoWWoU7wlbRT4055J+H+sJOE0rCwsl0VCgbdU8rCUW59
	1FAtufAXt9EDY91YmUM4FqUbpknj13QlFK39TFVoDTxv06VNua65P0C6e7P+YZjj
	CgjtFOqhpr/Gu63/0Nfg5jKzYdqvIuorcPNJAnTU75GnZ00wGT+Rh/jb7ECLOMTE
	Fw3O2k2PPB9UpUZNp2njv+BqbJzRZ/H4ktSy6PkvQePDkQanuTNRJGUFPJMt4lmx
	eLVlOigLGYrXy9l2lnV6/rEeZ+4/1cn0y3sKUmE9Gljl6JUO5/rRlhKuxu4RjdKW
	fjofwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxffs177s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 05:23:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b4058909so1237125685a.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 21:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769491439; cv=none;
        d=google.com; s=arc-20240605;
        b=k4MNKE1HYG6+W9OQXa6988XbWi59PeR6mlaxsslWUuDx8c1qcN6LJ76M2V4tLEVysM
         Y/5Ql9ee73iV2UuttefikWka1rqPCxoCBER7HdamHcVuQso6/0t0mQzCoEhaURp6gjiZ
         H8TfsTq/x+4EqVTXTOwiawp8vAcYXnemmP2MV026xoBfFx2rPnUdu5lN7WysvLecXN+7
         v8GWZRcgGkW27uEXlIprBMgHohHCzZgTOsdACsqy2yQ74S8kDINPnG4atJk2I/w/etSR
         Obe2ZzRMPvz946rYNrK0z1orQY0484bquIn/p/tbjRMjKegOIkPX/eP7L9R1cyPjznfE
         Un8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=65Dr++7k9piqDeeF3/jJFpw99hTaSa0WRcxnBV8/P6c=;
        fh=XL9yUbXRybe+NnuU9MhpDLMWk/pD6I6EJjg5lbToSa8=;
        b=Bn9ltM3ZuKeEBcWHXAwWyRYlV147FtwZrCyzaQM1XC1E8BXh7tlDHu6H5bv8V47POD
         bgNMVIl2zHOEnBCw6t2JP5ZUzU4gmhFufAGNegejc+DDOH+lC2FZjjbxh0JY6fy8KHSm
         vgdrXbcsVCfcApJ7zxerCl21altv3eB9OAFSYeTpEg9ILZzP75xLRD0xiZX7RO8G0hd0
         dBJfdfbFdywHbQFxJ3c3TikmG0dfoT0dKEPLnAnOnR1q9L8Vw5dIMb/Gqcwq06gdSZs1
         FLbBg9EKSTrUROxizMpbj2uGrdM0aKqahJ2dspS0qxpHx0+VHskVD/B0atpfw+/XJwvy
         qr7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769491439; x=1770096239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65Dr++7k9piqDeeF3/jJFpw99hTaSa0WRcxnBV8/P6c=;
        b=CULRNVHtCT2fmbgKO0/iYf3gmLynffdZdtHc8o7BruwFAriYt5YIJAyQq1Nz6s+IxZ
         8tYx3J241tbSwcY8E4lUTN2nBhERk4n/IH8Ict07pd0VLUqm9xe8L+k7h+ahkEU9bVbS
         zFQJ0+biYWob8mBfGtFhh49zC7j8ZyXCLqO55/k2WT0lOYIxlnYksymV1ln6HkMbRCQ6
         rjQyCColJBNP3X6DYGWpdWtjwAsWRJOIFOwntNNGA9n5Mv7WfZBxOglC3dOHucu7wRv9
         LXCe7x+34mRYMujXfIlFePq932wrpxGCwq4FRq27gemr4M+v3Lp7Gng9bUGIK7FGWGTZ
         KJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769491439; x=1770096239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=65Dr++7k9piqDeeF3/jJFpw99hTaSa0WRcxnBV8/P6c=;
        b=kjcpcNCYX9issy13koqQEK/BvIzKJYLPvT4utWd8r1DkUr4lcLYc7DjB4BhwUz56+C
         2qancJlQOubU7znoYRfyaysNEBUCsGvL4F0a7AEvMi38MOqPalqTEJQ9EfnH2tHYQXDP
         CjhgU1mDADZEKd6zKhaacH/qnMYIXpx4KHKoTGPj1h8ZLNTqmmzRcpsL8sudjIWV0JdA
         i4jhJHmgq0+gr9BDFGGe+CTtp+s+SvZt0LrPQbNAAGwXLHSAS7PvK7ETnoyzJexJQ9/9
         qGaEuJ/CzhWv7hrz/mupyC7LWbQEHPZnXSGAyH58qwUbGbvVzcMJ7EoKOvqgsQb+PjUp
         pndg==
X-Forwarded-Encrypted: i=1; AJvYcCV1tPrFrXQHOj108LAQWYbvXA0jzgiRZVJ4WeYDMQJQZBfOsHgy4XrciBQ3X2PV3BwvZHyF99aAi0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV+kYTDfNwgJkzK23JUDbRsIgnIpoMh1sRxjEsB1ME/tN/oLQ6
	9384tJFXwQO3cSrWlLkrZs6DJrcKILmlAfhY8tcPApkTymdd6AMP7CFm5SNFDWyxqr8oLNLGN+X
	/vxQA2uFCKgaS8U/NUFcoqObsBwwKDNR7F6FQgeeCLrDDX1XtgP0kgjWXB00HwzhxYZe8PtTPMl
	q5+2j1TM7y9NqjZmdtRHJg+3xqNik3M/J7eeEp6w==
X-Gm-Gg: AZuq6aIIcBZPgwlP4Ziw1BxAnmhr8q7+HQAZt5fS6nqHtqY/qSVPkkKAXNfrRzeSCdA
	rOr3KfhCsGWvsf64W3UpQDIzgXXn9UuWTumBhjFdxcRIilrF226avWxOgFZLTIF19qSfPunuJG9
	LAXijPC9BMoeXWRXVWpwCUVu4srIbYQf8t55BFyWXQj7JIbW5ZHH7lviyYKDfp7J09+Pio
X-Received: by 2002:a05:620a:1a25:b0:8b2:e346:de72 with SMTP id af79cd13be357-8c70b8f27dcmr65743985a.57.1769491438752;
        Mon, 26 Jan 2026 21:23:58 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:8b2:e346:de72 with SMTP id
 af79cd13be357-8c70b8f27dcmr65740285a.57.1769491438241; Mon, 26 Jan 2026
 21:23:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com> <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
In-Reply-To: <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:53:46 +0530
X-Gm-Features: AZwV_Qg9D9OqySXSR2jfxBJ3tC1_VxJSXb3-ILFt4f7DklcV5aYmk8s-xW6NZ78
Message-ID: <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kQhX1wvZV182Gl65Y8JEZwYi_CLfz6FV
X-Authority-Analysis: v=2.4 cv=YpcChoYX c=1 sm=1 tr=0 ts=69784bef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=fSljc-vNTktiGYv43x4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kQhX1wvZV182Gl65Y8JEZwYi_CLfz6FV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA0MiBTYWx0ZWRfX8bnNJNJmUQif
 auLWsbVFgFWDz7pId/byv7tJulObdLmlqgonLvvkQa58qTT1cajj6zREotpIrHIXp/vu/PMP4BW
 f1/X5WrKOmSf3GQPD3prio5V43EFPofciBTOLneUMpWA7zb3M7Xyhm6s4E4SOts3uH6PNFju2vm
 DmyAEvYWUQUEDfxzu+ORZTrVhz2RyHrFvLgeL4yJ2ip02guYybjFFG6JZVfE1meFfCqvBkzQLew
 o8jk0ZZq9ia+A7dTk774PS6NIOdSNsCJL7wiGRR4AvYUC/DPH/5wZb+UFJKQ1CD3WJzbog9O956
 uGckkH9qo9uhaEWK9n8+jWzWC3LWjZ+LILLOyS5CU07es54BMvJDDP9AmEulVG5xvlyIMrqWUBH
 yQADCBOlKA5sAESdFGsQ9ovv8hbTr/Lrn9OuMbOCsti83f0XapbGywND4T/6KSMDjcFCqQFJOcG
 9u+Ssj/pTdykoQxrlmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32772-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.4:email];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,0.0.0.0:email,0.0.0.3:email,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,0.0.0.47:email]
X-Rspamd-Queue-Id: 88FFB901AF
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 4:02=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:
> > Enable secondary USB controller in host mode on lemans EVK Platform.
> >
> > Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
> > having 4 ports. The ports of hub that are present on lemans EVK standal=
one
> > board are used as follows:-
> > 1) port-1 is connected to HD3SS3220 Type-C port controller.
> > 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses =
UART
> > for Bluetooth. This port is to be used only if user optionally replaces=
 the
> > WiFi card with the NFA765 chip which uses USB for Bluetooth.
> >
> > Remaining 2 ports will become functional when the interface plus mezzan=
ine
> > board is stacked on top of corekit:
> >
> > 3) port-2 is connected to another hub which is present on the mezz thro=
ugh
> > which 4 type-A ports are connected.
> > 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> > connected.
> >
> > Mark the second USB controller as host only capable and add the HD3SS32=
20
> > Type-C port controller along with Type-c connector for controlling vbus
> > supply.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++++
> >  1 file changed, 208 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/=
dts/qcom/lemans-evk.dts
> > index 074a1edd0334..a549f7fe53a1 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
> >               };
> >       };
> >
> > +     connector-1 {
> > +             compatible =3D "usb-c-connector";
> > +             label =3D "USB1-Type-C";
> > +             data-role =3D "host";
> > +             power-role =3D "source";
> > +
> > +             vbus-supply =3D <&vbus_supply_regulator_1>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             usb1_con_ss_ep: endpoint {
>
> This contradicts USB-C connector bindings. Why?
>
> > +                                     remote-endpoint =3D <&hd3ss3220_1=
_in_ep>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb1_hs_in: endpoint {
> > +                                     remote-endpoint =3D <&usb_hub_2_1=
>;
> > +                             };
> > +
> > +                     };
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb1_ss_in: endpoint {
>
> port@2 is for the SBU signals. It can't be connected to the hub.
>
> > +                                     remote-endpoint =3D <&usb_hub_3_1=
>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> >       edp0-connector {
> >               compatible =3D "dp-connector";
> >               label =3D "EDP0";
> > @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
> >               enable-active-high;
> >       };
> >
> > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vbus_supply_1";
> > +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-boot-on;
> > +             enable-active-high;
> > +     };
> > +
> >       vmmc_sdc: regulator-vmmc-sdc {
> >               compatible =3D "regulator-fixed";
> >
> > @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
> >                       };
> >               };
> >       };
> > +
> > +     usb-typec@47 {
> > +             compatible =3D "ti,hd3ss3220";
> > +             reg =3D <0x47>;
> > +
> > +             interrupts-extended =3D <&pmm8654au_2_gpios 6 IRQ_TYPE_ED=
GE_FALLING>;
> > +
> > +             id-gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> > +             pinctrl-names =3D "default";
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             hd3ss3220_1_in_ep: endpoint {
> > +                                     remote-endpoint =3D <&usb1_con_ss=
_ep>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             hd3ss3220_1_out_ep: endpoint {
> > +                             };
>
> Why is this port disconnected? It it really N/C?

Hi Dmitry,

Sorry for the confusion, Can we do it as follows:

hub:                    Hd3ss3220   typec-connector

usb_hub_2_1 <-> port@1       port@1 <-> empty
usb_hub_3_1 <-> port@2       port@2 <-> <empty>
                             port@0 <-> port@0

Regards,
Swati
>
> > +                     };
> > +             };
> > +     };
> > +
> >  };
> >
> >  &i2c18 {
> > @@ -699,6 +781,14 @@ usb0_intr_state: usb0-intr-state {
> >               bias-pull-up;
> >               power-source =3D <0>;
> >       };
> > +
> > +     usb1_intr: usb1-intr-state {
> > +             pins =3D "gpio6";
> > +             function =3D "normal";
> > +             input-enable;
> > +             bias-pull-up;
> > +             power-source =3D <0>;
> > +     };
> >  };
> >
> >  &qup_i2c19_default {
> > @@ -868,6 +958,12 @@ usb_id: usb-id-state {
> >               function =3D "gpio";
> >               bias-pull-up;
> >       };
> > +
> > +     usb1_id: usb1-id-state {
> > +             pins =3D "gpio51";
> > +             function =3D "gpio";
> > +             bias-pull-up;
> > +     };
> >  };
> >
> >  &uart10 {
> > @@ -922,6 +1018,118 @@ &usb_0_qmpphy {
> >       status =3D "okay";
> >  };
> >
> > +&usb_1 {
> > +     dr_mode =3D "host";
> > +
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> > +     status =3D "okay";
> > +
> > +     usb_hub_2_x: hub@1 {
> > +             compatible =3D "usb5e3,610";
> > +             reg =3D <1>;
> > +
> > +             peer-hub =3D <&usb_hub_3_x>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb_hub_2_1: endpoint {
> > +                                     remote-endpoint =3D <&usb1_hs_in>=
;
> > +                             };
> > +                     };
> > +
> > +                     /*
> > +                      * Port-2 and port-3 are not connected to anythin=
g on corekit.
>
> I thought that they are routed to the HS connectors. Are they not?
>
> > +                      */
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb_hub_2_2: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     port@3 {
> > +                             reg =3D <3>;
> > +
> > +                             usb_hub_2_3: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     /*
> > +                      * Port-4 is connected to M.2 E key connector on =
corekit.
> > +                      */
> > +                     port@4 {
> > +                             reg =3D <4>;
> > +
> > +                             usb_hub_2_4: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     usb_hub_3_x: hub@2 {
> > +             compatible =3D "usb5e3,625";
> > +             reg =3D <2>;
> > +
> > +             peer-hub =3D <&usb_hub_2_x>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb_hub_3_1: endpoint {
> > +                                     remote-endpoint =3D <&usb1_ss_in>=
;
> > +                             };
> > +                     };
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb_hub_3_2: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     port@3 {
> > +                             reg =3D <3>;
> > +
> > +                             usb_hub_3_3: endpoint {
> > +                             };
> > +                     };
> > +
> > +                     port@4 {
> > +                             reg =3D <4>;
> > +
> > +                             usb_hub_3_4: endpoint {
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&usb_1_hsphy {
> > +     vdda-pll-supply =3D <&vreg_l7a>;
> > +     vdda18-supply =3D <&vreg_l6c>;
> > +     vdda33-supply =3D <&vreg_l9a>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&usb_1_qmpphy {
> > +     vdda-phy-supply =3D <&vreg_l1c>;
> > +     vdda-pll-supply =3D <&vreg_l7a>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> >  &xo_board_clk {
> >       clock-frequency =3D <38400000>;
> >  };
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

