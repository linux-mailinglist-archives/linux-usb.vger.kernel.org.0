Return-Path: <linux-usb+bounces-38119-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP1mNVvWF2rASggAu9opvQ
	(envelope-from <linux-usb+bounces-38119-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 07:44:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 513EF5ECFD1
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 07:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0263105C8E
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 05:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFE73254A3;
	Thu, 28 May 2026 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXdctnOG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGQByzN5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B10731F983
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 05:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946737; cv=none; b=iM5a9dV7wWnl7aq8fbmQQI+9mqurEBF8sTQa1alSxFUNfbJdVzy7T+aMicZxh0+bcx+v6i7DCVcDS5A1awk4kQz9MsFJ0f533404UfImDNbPR+ifie9q4k5Myx8PrR7atrMX+Kzelpbe7sMdk+l4UqHXEZDVm6cQss9WIwAr9Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946737; c=relaxed/simple;
	bh=GdOC+CshXouT2hATXiFbsxVbdvwPJzYfydeFHK1N2M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJde28rdQamVIyAhQCbU3pc8BXfvh5xRin2vH+SNKEshdh0dGdCFopTKGKbQdYuxGfltp+/bffkF//+Slpcci48+ilVIM1ltPOdXphdbBloR7U3BqCXLBULgYvDwI9P66z2mAD2/FcqyxoJaededDZQ6Hpco507nkBx1It3InIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXdctnOG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGQByzN5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlXS12463985
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 05:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s/Koovz6nGSDFSvlYUwtNN70
	9Tu2Y7rOmSw5+IjDYCc=; b=FXdctnOG4BlvSK0ZgqimE+XELYOrsiECnk4/LihX
	yACjgNilvImXJpxko5WLyP9EypMKFmjR77vhVJJehNrkn03xwQMj8FkwgXL5bd/1
	lKTGhOnsnQLPeWKTfNgw2QRS1LQsbC3DPfa293mj8DiOI095twJYLhV54Gpt3dYi
	cIBQtOQoRVkte0OgcQ6iiw8fNquHAcdVVJryL9Zw/X9vNdLG05NCPdntbJymM3vN
	07yn6fqIYVq7TODzucPrerCeYFxG4DoCGt4ENzTZFITZZIKxmYewysg1zrsbrfJX
	fKJlnE9uwLbNzYVqx24M8mKKdy8CmtnMxsPhAkCu50fpJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y4sen6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 05:38:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-515224a8aa0so49275071cf.0
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 22:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779946734; x=1780551534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/Koovz6nGSDFSvlYUwtNN709Tu2Y7rOmSw5+IjDYCc=;
        b=UGQByzN5Gm76bAbETbyvewbsTzBvW41AuXpPLo+UGhiV88HPZwlschgM6UFZ+8xpd0
         V2msxu4fijftfcoKISAsde52Z87XuI5ZsbrodowJIrcPm2Of71prrNS7bT3p3ykliUBa
         6Dweq6if0f50otEdYNBDk7kQ1Aebpb40wQd9o5y47UjKVOrJsIVha+o59IALM01PMiHV
         eJCl5Yhk/jP3mgIF3kFCOTKwLmjxlFPwsVDhlT8nxcxA3Rph/QzqlvpIJH0voMdhQBDP
         5i3M5yhgc0qp4bOtANdRKJxIaQ8bWW3MKwGwTakq/CsE7fFKUuHqeIrzdFU5gzdFEbVo
         4Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946734; x=1780551534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/Koovz6nGSDFSvlYUwtNN709Tu2Y7rOmSw5+IjDYCc=;
        b=WRc7rbQUhyma6tiCVTTNcFr0pOWGdgqQvqO/Aupigpu4YWoJsdrptfPVUcckYOQIvQ
         M6khD19/iz/ewDexu/6OAlaOB4yz3gzz7ewIcAHcBHAZDfGp3+u253V5HaTYE+3VGzfL
         f48E2lx9DTjLQGdimpbC0nan67CUte+xlaKE8oKhXMDd9/hhtxPLRWj6s/+AUVrg3sj2
         tsFfRhtOCAGAwbQ1/3vYQXkxyOCW0tRWNH1KhUpP/b4l0vKr34WIKyAe9Ttdps8wVNie
         q1ypUd35ntKfjbX6P97cZutbPbb7Rb2/0S+/xi6F4KUfe1wFDEcLwX0D8tok+o59oS3k
         hVAw==
X-Forwarded-Encrypted: i=1; AFNElJ8kJG4s/S+YI9Gdz5cGr1tAR2GZ2BAwN2Lh/4Z1aP2PRGtguY+h7w3+RSLVyJq0/7jShemxAM9N0z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIWhI+cXkGqn2RPHTVidpGMHq67N1D5Io/CaytTPbIP1RTxqJo
	v8CltyGvIblaKL3f9Opu76+xGWJyuoMXC5oR8/TXYp99BrIXxQhgjG866Eg7Qy312P0x8B4OgKa
	dWJKWLjfnjuwqsWGhvmjmFq1gvBbHWgH8a0lSiUdgZzJziguLBm9Bjc7mQ2aymtQ=
X-Gm-Gg: Acq92OH6eEsvw5gw3wm+5VJmHsDzV2lLmukeo05dOGxifbveKqwKVugWFqq3BjnCrWh
	VDEIQwfVEDY0WeMyJ9XlKG5yaGHSRsXYJ8TPLX7fejn9eLMLwAWMv/F2rsZGf98lsdIaZSal8CU
	CWSc00qyjVudujlEnIv2GrlQJZDgItPCVKcaVCQ8rn0kfFJ9Kv8dPZQMwsI1s6fY183dZoCjtbX
	ohydy0vacQXhQvw8Gf0xIi320Xxte0E94NrliDyN2wtjEI5k6d1h0YRGifiT5cVqtuMV9hlo+j1
	2j1mfyzEh6Z4fwyfdIPxPKbUojnmN9A2ez8maL+tQbIG2Vx7FnaBh2ldAoY9s7IeFqFZQx4PuVL
	bN4SfAmYdrx5XlWyZx8zaA8ipo6oq9zVqjGB5ewwdI1cKHpB0dh0q/bwsLvAOzUKkYAhkB5187m
	mR0CcJ6AO2B99snS5QzFQsGsD5zFXGFPYLLcOauTU4B0evIA==
X-Received: by 2002:a05:622a:1809:b0:517:1481:54a with SMTP id d75a77b69052e-51714810844mr66284371cf.53.1779946734330;
        Wed, 27 May 2026 22:38:54 -0700 (PDT)
X-Received: by 2002:a05:622a:1809:b0:517:1481:54a with SMTP id d75a77b69052e-51714810844mr66284171cf.53.1779946733812;
        Wed, 27 May 2026 22:38:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4633663csm1657472e87.70.2026.05.27.22.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:38:52 -0700 (PDT)
Date: Thu, 28 May 2026 08:38:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
Message-ID: <jwbt56rrgbishoi4bbiigjpilh2ktf47qbhbk776biji6ggtk7@pulvagfzjr7y>
References: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
 <y4b3qbt4xhnahtfmfw2qx3lazlnogcp5dfrpd2wyicevoc57p5@puqv4wjzcijn>
 <3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com>
 <ahd_VjrHp-u6thMT@vbox>
 <aheMJFKI_kBTH3jH@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aheMJFKI_kBTH3jH@vbox>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA1MyBTYWx0ZWRfX7NtClqQg2M9M
 2CsIGlPjprU1qKP2agoZ+TBjhb2sGEEEK4OG054qCqqn+kpXt2M1XUHPgS6n/zRBJuUcz45NmtT
 dAayVmPUWmX49CYV1c0JZuVzZ2DUXJcx5Or+OPMx9t/sdPYT7O+K57NhgxWzSH7uULAT9eyBe4C
 jUEZ3kddPYYDzNpxKRfVy451vQP9IAEZ2n5bu9Dkfb5yz/HbiQAHxL47PCUKH8Fjb/1IOTfbYBR
 fiQ9PSYNxrb++/Lm7K3Jfp8FcLN2vs3hF9ldANz4PytYP8M3cmRtTlTSmCH+JeMT/oCI49PdtBb
 x1gOWyn2Z8YOoBc0/a2zu4+ktQy21UDhZliqFaq3+O+1IGoqR62tXrJvWegtRfI8RM3NV9WuIFp
 iPfXIFm3Ha8KuQQAW14yzlXTdRWD9K5ft8KPDUhr0MfcVJo3rua3bMdpL+JRZVgR6NGQBE/FPSy
 5hXpOP76r97HLf0dnvg==
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a17d4ee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=31RHWENJIUVAEVAQUyMA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xxquodU8WEhi5LwUUssfuCH94EEZRgYd
X-Proofpoint-ORIG-GUID: xxquodU8WEhi5LwUUssfuCH94EEZRgYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280053
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38119-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 513EF5ECFD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 12:46:53AM +0000, Thinh Nguyen wrote:
> On Wed, May 27, 2026, Thinh Nguyen wrote:
> > On Thu, May 21, 2026, Konrad Dybcio wrote:
> > > On 5/13/26 10:48 PM, Dmitry Baryshkov wrote:
> > > > On Mon, May 11, 2026 at 03:14:22PM +0530, Krishna Kurapati wrote:
> > > >> eUSB2 targets handle wakeup interrupts differently depending on device
> > > >> speed when operating in host mode.
> > > >>
> > > >> According to the eUSB2 specification, remote wakeup signaling in host
> > > >> mode is detected via different data-line assertions based on the
> > > >> connected device speed.
> > > >>
> > > >> When a low-speed device is connected, the host repeater drives eD+ to
> > > >> logic '1' upon detecting a K-state on the USB lines during remote wakeup
> > > >> (eUSB2 specification, Section 5.5.14).
> > > >>
> > > >> When a full-speed or high-speed device is connected, the host repeater
> > > >> drives eD- to logic '1' upon detecting a K-state on the USB line during
> > > >> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
> > > >>
> > > >> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
> > > >> eD- line states, configure the wakeup interrupts accordingly
> > > >>
> > > >> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > >> ---
> > > 
> > > [...]
> > > 
> > > >> +	{
> > > >> +		.compatible = "qcom,x1e80100-dwc3-mp",
> > > >> +		.data = &dwc3_qcom_glymur_pdata,
> > > > 
> > > > This would result in the list of the platforms keeping on growing.
> > > > Would you mind instead detecting eUSB2 by checking that HS PHY has its
> > > > own phys property?
> > > 
> > > I think we've had a very similar issue on some other patch.. we could
> > > use phy_mode, but it'd require first fixing this mess:
> > > 
> > > 28:     PHY_MODE_USB_HOST,
> > > 29:     PHY_MODE_USB_HOST_LS,
> > > 30:     PHY_MODE_USB_HOST_FS,
> > > 31:     PHY_MODE_USB_HOST_HS,
> > > 32:     PHY_MODE_USB_HOST_SS,
> > > 33:     PHY_MODE_USB_DEVICE,
> > > 34:     PHY_MODE_USB_DEVICE_LS,
> > > 35:     PHY_MODE_USB_DEVICE_FS,
> > > 36:     PHY_MODE_USB_DEVICE_HS,
> > > 37:     PHY_MODE_USB_DEVICE_SS,
> > > 38:     PHY_MODE_USB_OTG
> > > 
> > > into PHY_MODE_USB + submodes and phy_opts
> > > 
> > 
> > IMHO, this seems to fit better in the DT binding, ie. a DT property
> > "qcom,eusb2-phy" would be a cleaner solution than trying to match this
> > with to compatible string.
> 
> Actually, it should be "qcom,has-eusb2-phy".

No, it's a bad idea from my point of view. The platform defines whether
it is using eUSB2 or not. As such, it already can be determined from DT.
The property seems to be a duplicate of the information.

-- 
With best wishes
Dmitry

