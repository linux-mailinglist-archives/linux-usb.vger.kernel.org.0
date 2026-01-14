Return-Path: <linux-usb+bounces-32314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71CD1CA3A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 07:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87DF930C9110
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 06:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0322C36BCDC;
	Wed, 14 Jan 2026 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P51OLQiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtbYKP6/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26CD2ED17C
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 06:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768370960; cv=none; b=GvERwARHTyC5ae4ll70A4US7t/a15adJgtj7+gqt0z0Y54KN0vqJuFsW7dihfeKzoTM45xOxizPu8HqgHJumn/aq3rBcRvstBFRW8xBv1N5hLpM35+TY4yxVshWgsDTmXVc58Ixxxi4DvDzfKJY2e0424CGMMdLY6aeEKl2Qd0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768370960; c=relaxed/simple;
	bh=A7Yjh1ilXgNEn5j4OWYI6qnxQwYvh8K19GYr0XwIkTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOeoE7gBEHqxBBkOjTJ0a8m13qinirNAQ+xvo1NzKVtRPwqfmUDyphio89HcXq88+dOK0pGVz6dBanew0uaUAWWPOpH2qC+TUlmcKQNNDnYdxoHeXzYKmdDigK5rcNmtZlFNF8nmnzJoF5ytOmxthjC9SEfiW35ZxNyB76vtEZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P51OLQiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtbYKP6/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E65xJq3059373
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 06:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C1h4g2wKN0nIzSG+gugjdS+tH1AxQN8ueKnGhYuUmjk=; b=P51OLQiH4tW6vauQ
	tLofs9EBbTILhvMW9syi9hQ4fn52RtUwc9qBNhgUVwfs5vZOTdzDprcfzDO/FyFI
	fJvSNg+VM+/kND2Pr2NNLOL8np06ybk049JbviOT+1oRz/GjLO6hbszRSwA4tqcT
	LEylCNRAH8yvJ5XX0B7BHPD5iGxCiNwzo4doM6Av+pLVKaryuH9sz4QFK+PVJ8jV
	uLSLwFBilKyaYtXLALaHy2Aitjzdt9p3kD9Svz4ZOHCstuBRgk2YgQtuhfWecTrj
	luvM4NCiYgiOfFZ2uwuslt+jyU5Nl+lbS8LsyH0VOLKlHVrbG2jrdfjVhpnNu7Uu
	Qe4O4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bns8v2ghr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 06:09:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso817609685a.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 22:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768370948; x=1768975748; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1h4g2wKN0nIzSG+gugjdS+tH1AxQN8ueKnGhYuUmjk=;
        b=UtbYKP6/rcbvNE3YlLA50jHuhi5AKaBY7dId8rQb5vfj5j/SlNKcm+NO4gNqIZt7Hp
         SrjWH9gDjqFp5RVL4+HXVBLqpuk8XXCSHNGe4NvbV9zB3TEJvRiaoApBDvboJbI/61Nr
         ZIhKJsHIjKZT+e5AB6hcpCe0+2Kvmn/eWo/dfQE4z7QT8Tdd7lN9hhEhZ0oPnX9cbNbi
         XV6XhNcR0gxWU/tZB4KJZZ0GXHZP7jlLmupFQ+TlufAsCBACjfCxI67ol4BdkqvtmEhu
         uBKch6d8CG3HfBkJSpT3+VfkxYh5L6Q3XXOgKSkWnMZy/r/t/qcj+7yjpzClLHdA4yMh
         gbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768370948; x=1768975748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1h4g2wKN0nIzSG+gugjdS+tH1AxQN8ueKnGhYuUmjk=;
        b=tjDq4y3X2FsKg96ukbjn2qHut6tPLUWigOEcVPK8FQ6gfb6q6mGZREEMyvNLb5EJk6
         o0b6VDWVXZWHnxPUPE9AAzIn0k6jeiY3cjjPuvMEAF8BZka2Clg2ij96DKVNsJ99MZ6y
         itLV8Ouruq4XcUxDahI+2n6xe3j7EtQVWDJdmwI7RwmXT2IUne6eEJFaaAMWkuuvveH1
         /5ZIf2KQq7bWlV94Uzy//Sd8kI+OciUGXeqEvxjp9/EG8foylLYiB24KI20h3+cII4Fk
         kNOkcMmjgf96naah+4EKK8nsDnSHdv8oKq0lGDHHg1T3PvPsgvFZ4zcs4TGNPzeqPJ9l
         Qh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXlRwd6FcQYafGmEzZxPjkdSTh/Ri+Hb6WO3hnSzbpc0rqNaGQGzw8mLApTRaQJpjfo82B6QWyMLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY0gOM8vuVi4wuE04lbSY36wN044yo3CXzyToag80P7JkghgU2
	XmfzA99d3G1ICgr6S0nXQGo7gX46fI+wWTFygJXq8IOBmxtUucHdwBWLmzUGpSdHr4I9EXBmSJq
	JP/kMBU9z+ie6K0XOZQFVv1Icc9CvygxXuEbxl3qwfPSj5L7UoEBKibAmmgEDPFI=
X-Gm-Gg: AY/fxX6YdHSsaX9rItGAUfwh+qv7rTst1cDPsy4TW8NXnuKXKXu9sfraMhyW6VkLt8z
	uUs4DeYz9HHXsuZoO+6809SZZGlVoQbEvz96IZshiMYw/0tRZSvrNEZmkWWqYlgvYKGrdngFlPa
	qPAX97w1iOeKQdg8bjQHhODw9qoSl8Rti49x+GauKqZMs5AWcjBzx7dTauJ1uRUcszKgUUyodTo
	HljoU5GHx2g9jfr1IxkUOxD/u29/zcV4gDDRRZiGHIb1cOzCBemmjcSCudkJ8WJnx3OacRVycBW
	X3jDCmT6U4T3wJbKjNkq2HCXZnOHaV0jW6YNSflC5Wd9eARlWIk2EeEwkgKr64kk5cFZfCs9SW9
	UoigHOJ7uDtfid+Gp1bbsLCQe/aqNtNLwtgmdABSeS04zbv1jH2TvXkoqhhvDzqkT1tpowxPMPT
	EW4+iWJRFrkeussUrQryVukUI=
X-Received: by 2002:a05:620a:1a2a:b0:8a1:ac72:e3dc with SMTP id af79cd13be357-8c5317f0af2mr132116385a.43.1768370948328;
        Tue, 13 Jan 2026 22:09:08 -0800 (PST)
X-Received: by 2002:a05:620a:1a2a:b0:8a1:ac72:e3dc with SMTP id af79cd13be357-8c5317f0af2mr132114085a.43.1768370947809;
        Tue, 13 Jan 2026 22:09:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1045964sm381373e87.68.2026.01.13.22.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:09:06 -0800 (PST)
Date: Wed, 14 Jan 2026 08:09:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <zkvwy56jkya6eogwqlmbhoo64zlzatxsdtkhy4hqfudoqtfbkg@fwiy46l3c337>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
 <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
 <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
 <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
 <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=aY5sXBot c=1 sm=1 tr=0 ts=69673305 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UsA3aJdYp-BRMntT3CkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EIwNO0pLPUdgJazTA_32RUhcmrWgnfAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0NSBTYWx0ZWRfXwjdo6Vr4EC2G
 cI55WRdIWbjWsIqPV904tWi24GnhBtbpiJlnd9dWazKpkSLpEk0PkXYbChtvLyQL+AtCWLqedf3
 b1COqk7NKIEByRmDie93gzLJ2zWtPx2takJQ+wzMLCDfwNBKH5lGcrQkLclfyAzyNntdJ9A9lGa
 wAfB6aFloIm4lnzOX2BDUIqxnUDXpbrfZcHgeQVwQfISVcL106GNIMTP8d4WOkLveCtY0RmM6gK
 vLnTUE4PgPjAKDPexbgXgiKjnAOxzeeHnv8l6R19dlKO0MKrFf4coMbqMVqv51T0mJxEry1P+nG
 6tunNBv0yQmmPkD3qMRRpctVGyuBA+iWfBbMAY/gAqSEWwotPQ3Xn49Cr/weCQDDoWtrjTovNpY
 Okj/ix0Gs/05OOA25CpajhWu9iQE5Q7XHobGI5HGVEzE4fquX0XoxM+71oZaEsB4iep1N1EZkN4
 BD4ln3mQAtOUEVbLkdA==
X-Proofpoint-GUID: EIwNO0pLPUdgJazTA_32RUhcmrWgnfAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140045

On Wed, Jan 14, 2026 at 11:10:26AM +0530, Swati Agarwal wrote:
> On Tue, Jan 13, 2026 at 4:59 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Jan 13, 2026 at 01:32:41PM +0530, Swati Agarwal wrote:
> > > On Sat, Dec 20, 2025 at 9:47 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > > > > Enable secondary USB controller in host mode on lemans EVK Platform.
> > > > >
> > > > > For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
> > > > > ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
> > > > > lines run from the SoC through the hub to the Port controller. Mark the
> > > > > second USB controller as host only capable.
> > > > >
> > > > > Add HD3SS3220 Type-C port controller along with Type-c connector for
> > > > > controlling vbus supply.
> > > > >
> > > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++++++
> > > > >  1 file changed, 158 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > index 70d85b6ba772..d72639479d75 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
> > > > >               };
> > > > >       };
> > > > >
> > > > > +     connector-1 {
> > > > > +             compatible = "usb-c-connector";
> > > > > +             label = "USB1-Type-C";
> > > > > +             data-role = "host";
> > > > > +             power-role = "dual";
> > > > > +             try-power-role = "source";
> > > > > +
> > > > > +             vbus-supply = <&vbus_supply_regulator_1>;
> > > > > +
> > > > > +             ports {
> > > > > +                     #address-cells = <1>;
> > > > > +                     #size-cells = <0>;
> > > > > +
> > > > > +                     port@0 {
> > > > > +                             reg = <0>;
> > > > > +
> > > > > +                             usb1_con_ss_ep: endpoint {
> > > > > +                                     remote-endpoint = <&hd3ss3220_1_in_ep>;
> > > > > +                             };
> > > > > +                     };
> > > > > +
> > > > > +                     port@1 {
> > > > > +                             reg = <1>;
> > > > > +
> > > > > +                             usb1_hs_in: endpoint {
> > > > > +                                     remote-endpoint = <&usb_hub_2_1>;
> > > > > +                             };
> > > > > +
> > > > > +                     };
> > > > > +
> > > > > +                     port@2 {
> > > > > +                             reg = <2>;
> > > > > +
> > > > > +                             usb1_ss_in: endpoint {
> > > > > +                                     remote-endpoint = <&usb_hub_3_1>;
> > > > > +                             };
> > > > > +
> > > > > +                     };
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > >       edp0-connector {
> > > > >               compatible = "dp-connector";
> > > > >               label = "EDP0";
> > > > > @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
> > > > >               enable-active-high;
> > > > >       };
> > > > >
> > > > > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > > > > +             compatible = "regulator-fixed";
> > > > > +             regulator-name = "vbus_supply_1";
> > > > > +             gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> > > > > +             regulator-min-microvolt = <5000000>;
> > > > > +             regulator-max-microvolt = <5000000>;
> > > > > +             regulator-boot-on;
> > > > > +             enable-active-high;
> > > > > +     };
> > > > > +
> > > > >       vmmc_sdc: regulator-vmmc-sdc {
> > > > >               compatible = "regulator-fixed";
> > > > >
> > > > > @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
> > > > >                       };
> > > > >               };
> > > > >       };
> > > > > +
> > > > > +     usb-typec@47 {
> > > > > +             compatible = "ti,hd3ss3220";
> > > > > +             reg = <0x47>;
> > > > > +
> > > > > +             interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> > > > > +
> > > > > +             id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > > > > +
> > > > > +             pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> > > > > +             pinctrl-names = "default";
> > > > > +
> > > > > +             ports {
> > > > > +                     #address-cells = <1>;
> > > > > +                     #size-cells = <0>;
> > > > > +
> > > > > +                     port@0 {
> > > > > +                             reg = <0>;
> > > > > +
> > > > > +                             hd3ss3220_1_in_ep: endpoint {
> > > > > +                                     remote-endpoint = <&usb1_con_ss_ep>;
> > > > > +                             };
> > > > > +                     };
> > > > > +
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > >  };
> > > > >
> > > > >  &i2c18 {
> > > > > @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
> > > > >               bias-pull-up;
> > > > >               power-source = <0>;
> > > > >       };
> > > > > +
> > > > > +     usb1_intr: usb1-intr-state {
> > > > > +             pins = "gpio6";
> > > > > +             function = "normal";
> > > > > +             input-enable;
> > > > > +             bias-pull-up;
> > > > > +             power-source = <0>;
> > > > > +     };
> > > > >  };
> > > > >
> > > > >  &qup_i2c19_default {
> > > > > @@ -849,6 +935,12 @@ usb_id: usb-id-state {
> > > > >               function = "gpio";
> > > > >               bias-pull-up;
> > > > >       };
> > > > > +
> > > > > +     usb1_id: usb1-id-state {
> > > > > +             pins = "gpio51";
> > > > > +             function = "gpio";
> > > > > +             bias-pull-up;
> > > > > +     };
> > > > >  };
> > > > >
> > > > >  &uart10 {
> > > > > @@ -903,6 +995,72 @@ &usb_0_qmpphy {
> > > > >       status = "okay";
> > > > >  };
> > > > >
> > > > > +&usb_1 {
> > > > > +     dr_mode = "host";
> > > > > +
> > > > > +     #address-cells = <1>;
> > > > > +     #size-cells = <0>;
> > > > > +
> > > > > +     status = "okay";
> > > > > +
> > > > > +     usb_hub_2_x: hub@1 {
> > > > > +             compatible = "usb5e3,610";
> > > > > +             reg = <1>;
> > > > > +             peer-hub = <&usb_hub_3_x>;
> > > > > +             #address-cells = <1>;
> > > > > +             #size-cells = <0>;
> > > > > +
> > > > > +             ports {
> > > > > +                     #address-cells = <1>;
> > > > > +                     #size-cells = <0>;
> > > > > +
> > > > > +                     port@1 {
> > > > > +                             reg = <1>;
> > > > > +
> > > > > +                             usb_hub_2_1: endpoint {
> > > > > +                                     remote-endpoint = <&usb1_hs_in>;
> > > > > +                             };
> > > >
> > > > Are all other ports disconnected? If so, why do we need a hub?
> > > Hi Dmitry,
> > > I didn't understand your query, can you give more context to it?
> >
> > You have described one port of the hub. How are other ports routed? Are
> > they connected to outer ports? To some other devices? Unconnected?
> Hi Dmitry,
> I would like to put it this way, USB HUB has 4 ports but only one port
> of the hub is used between SOC and Type-C controller.
> Remaining 3 ports are used by other devices.

Which devices?

-- 
With best wishes
Dmitry

