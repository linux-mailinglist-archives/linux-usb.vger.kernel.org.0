Return-Path: <linux-usb+bounces-32226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD09D1733A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9E69301C91D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 08:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD1436E476;
	Tue, 13 Jan 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrfGh8ae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOjy34U3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144DF352C2C
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291385; cv=none; b=PIroIBviPms7P0Bmt8OxgFMT3tAA80VlagBUgH/GW5HTP20cntFPXZeVHem+VlLb7imnv5RYgmrgDVds34NYKL3Z5nRdetk0AxgsUeGb0y10Bk4GDiJ11ZdLe26HKtMo3g71CWfuLRkBzFRNCFucd3x1WWb9Nk0XGfKDPqC4c8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291385; c=relaxed/simple;
	bh=nkBL5kRLdo/zoDrr0XI7fSJ1DukrlAYjv88wfR7CXfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8gbCa52TwNbqczaOPhKGrZJQNw3BuwhCE/dRSl8bYrX387gN75c3PK2cOBVaZpbzK7vuUJBIRup3rGpdZ7oIwJcGXLJoMs//D2kuoBiOHBGvoxHTyt1sv3ZLx5ULgx+UgSrQVkOST+qtEvUeZUxTIinoZJnA57sJscjsk1cVLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrfGh8ae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOjy34U3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7Jdwo177668
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 08:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6N9oyam4luPWb3/lWFVBCNIH3UwuJUcQqBFJqUvP+c=; b=VrfGh8aefgQ4i/R5
	2SdeaYdk9NCKB6biEt/FPsVLgbCGSTXpZeAyGx+FLgPwKoz9vCU/j09fjZ+agOjS
	HnAzHEq1gjwR+R2XOifMzFjbchYV4QHga1bAMK+z9fdY4pnbArOnXLoiYUUumJRx
	yiMb49UstLZfQGiIxf9lo+5u3Ih8ZqkSdF6dT+380H87o5TrtDkukNU79gXkeoG6
	r8DO7dtCPj3K55FVVSYlIS/YX8HFrRKcO7h2rB6lwmBbSCMoll/Iz5l1VDdBIhX1
	ONwGySP0qlJb4LfesHLom6Pg44NHpIYJNz5+VHyWfT7DrJux2y8pLD7SO1SG7jVu
	rSe7Eg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn52f2b0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 08:02:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2e9e09e6so214567926d6.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291373; x=1768896173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6N9oyam4luPWb3/lWFVBCNIH3UwuJUcQqBFJqUvP+c=;
        b=HOjy34U3BwI9apMRQJHmljKby2SM0nVk6MAzVOWiMC7jrmx+RNk2HWUOUiQLd9w3TE
         Pv0X+aUyYLf4z/NViWCK0gjj9ZgDuDlNPD0UroB2q9V31QtSlWEhLneGScME/TcW7b7s
         r+ZcygCAyrAmD2xekJl5TPjn8Jp70k373nzHhWTaGzPtznzMejfd897oUttz24uw024p
         1KQSB4Pnq7/YnII28PuleQ+d2PZq2WKRwPyO+w5fbDJ/otGyqMZYcqVWKpUMaw4EfZoy
         5pm//W2B8LyyGOgiC0jTWNJ/ADskAFlpJjSR250rWMlYS5gkGm9VhOHsPScQ4T2g8i6x
         TInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291373; x=1768896173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6N9oyam4luPWb3/lWFVBCNIH3UwuJUcQqBFJqUvP+c=;
        b=BH0C8RQg+VcbI8NjkBBuRAOumjXvtsyhDrBh694eoEvxV2wjxPdItPfbEP9JRfPWEx
         C837wPJsY2FgufQqK9LEXbIye0yrfYzI9AyKVIpDT/cbBdzH1pDn9Z34FnGuuXUDZPXl
         LVA4FL8R8UXZ7KheqIPFoSG4zqXr3y2r7+nr82+ZFWnC5i7IeWDH3q+8VSNiAKqvpGgw
         807sP6oC9H8vFrcmap+wHcUJNTGUJVFrWNF69x6VhS/z8KJjWe6/4v47ce8RYFkMWP9d
         BJLRFkoimR+AcHO2w/bg/rwnePUHEeSpLQcDhyamaVb//mA/t+KcaK6ZZYqBV2mN2/lL
         BLfw==
X-Forwarded-Encrypted: i=1; AJvYcCUYHBnz4B4heG8tbjhYGjoA5Vqly2MR85tDyFWWFJkARPorUPdJ64WnXDko4qWAM2KpC7L3ZFOkchE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjKxnEbo9Yrq3euRl/D8IG+T9UaCQpLNa5sosPJat9Or/ITYpi
	J5XZ4T2hbokkrgKHO350rI7AOQ2YIpdiQJ9OOnGfXAL6hw9ve8HGRHkFsLl4YpKytlblIN+eukM
	9OdxWPhKrwTpokNp6AM7H1XBIqJ7b+bt9bbbQBf2p722YjbtB+AemtkcmEZ4rXYXFyZlV7rKYMM
	OSOTgDCPgloFz/bE9ZLLNWnArjsV2vK3y+RPBqkw==
X-Gm-Gg: AY/fxX6hmMsOk09dyzVsG+OmL6sr2DHYNX763AukGadKZo/jwkD3rcbeXvpl8EmC6Qn
	KvU+fmzItK9T6pr5XBRZyP7t2LZpCluN79O3knlnGvyyeKtVlj8OFnIqJN1JQqnywugn2nZL4jJ
	luDkKG2YheBZaHQwCYFxH+QCJgZRCU7+fBest+KXVKDV7eClbhnvY8YdsYK6C1VDbXOotE
X-Received: by 2002:a05:6214:5687:b0:889:7c5b:8134 with SMTP id 6a1803df08f44-890841c88a5mr285816456d6.27.1768291373205;
        Tue, 13 Jan 2026 00:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDGIu4Dg8ZP94iBqh5DZqcZsX/AaRxPqITFb3eUEMO4jPYXNM8IMx4+5g371Bpd6RPfrrlIlEo1qQF/lxG1aA=
X-Received: by 2002:a05:6214:5687:b0:889:7c5b:8134 with SMTP id
 6a1803df08f44-890841c88a5mr285816066d6.27.1768291372777; Tue, 13 Jan 2026
 00:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com> <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
In-Reply-To: <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 13:32:41 +0530
X-Gm-Features: AZwV_QjkEC6ruPO6nTmB-CDI4g8kcjrgHKlljma_9lovnFDRP5LmTtxd5MA_ynw
Message-ID: <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX3GkwVOISyxmc
 W8Se8lNj+R7zC8JphourC5GV3kedAWVqIfF5jhvNzZIoDvb5n+AOfkQN9JtLM/NBLxw+NE4RkTs
 LTsiY1Hfs7RfDxJvWdNXvzNyYCwd90LeENVoteV1zutTs6JLWQi63BnghvPJ8vReKtsV4ptOKUP
 aHI9SP8rE1S2to2PxcBELvsuYjb4HORdYIO3wdPGd0rzNBHRJJhUcTx57GtdKL8InGj+zqx8cAZ
 LMhSij+GrUnetFPiIj9k+ShP6jWkhm398fjGC6TGJSsgVz6wQFUBLembn1fmOYuNtgYB4MujcWo
 wJCMYBggYdprzDvyc0odmNKM/bCFivSBd4LPf9Jo7aGkFN9mMCkBd4YNI2mceKFzoQinZbF9JZ7
 hQtDyEZOq6lcPhM69OcraxBat3UDDMXw9aYiZlDKjyy/OfsvH54FONFgxy4z2wA9E2mpXa/m1IF
 XxF7Aqku66yBjhj7gdw==
X-Authority-Analysis: v=2.4 cv=TcCbdBQh c=1 sm=1 tr=0 ts=6965fc2e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=03JeH7_DdWppPfD7oeIA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: P7FRcu8u0ffGfRcGM15U42OoBtVxBfBY
X-Proofpoint-ORIG-GUID: P7FRcu8u0ffGfRcGM15U42OoBtVxBfBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130066

On Sat, Dec 20, 2025 at 9:47=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > Enable secondary USB controller in host mode on lemans EVK Platform.
> >
> > For secondary USB Typec port, there is a genesys USB HUB GL3590 having =
4
> > ports sitting in between SOC and HD3SS3220 Type-C port controller and S=
S
> > lines run from the SoC through the hub to the Port controller. Mark the
> > second USB controller as host only capable.
> >
> > Add HD3SS3220 Type-C port controller along with Type-c connector for
> > controlling vbus supply.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/=
dts/qcom/lemans-evk.dts
> > index 70d85b6ba772..d72639479d75 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
> >               };
> >       };
> >
> > +     connector-1 {
> > +             compatible =3D "usb-c-connector";
> > +             label =3D "USB1-Type-C";
> > +             data-role =3D "host";
> > +             power-role =3D "dual";
> > +             try-power-role =3D "source";
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
> > +                                     remote-endpoint =3D <&usb_hub_3_1=
>;
> > +                             };
> > +
> > +                     };
> > +             };
> > +     };
> > +
> >       edp0-connector {
> >               compatible =3D "dp-connector";
> >               label =3D "EDP0";
> > @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
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
> > @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
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
> > +             };
> > +     };
> > +
> >  };
> >
> >  &i2c18 {
> > @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
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
> > @@ -849,6 +935,12 @@ usb_id: usb-id-state {
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
> > @@ -903,6 +995,72 @@ &usb_0_qmpphy {
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
> > +             peer-hub =3D <&usb_hub_3_x>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
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
>
> Are all other ports disconnected? If so, why do we need a hub?
Hi Dmitry,
I didn't understand your query, can you give more context to it?

Regards,
Swati
>
> > +                     };
> > +
> > +             };
> > +     };
> > +
> > +     usb_hub_3_x: hub@2 {
> > +             compatible =3D "usb5e3,625";
> > +             reg =3D <2>;
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

