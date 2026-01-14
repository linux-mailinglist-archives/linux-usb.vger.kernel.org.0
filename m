Return-Path: <linux-usb+bounces-32313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A624CD1C998
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 06:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B4EC30039D2
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 05:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99ABC36BCE0;
	Wed, 14 Jan 2026 05:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkSyw4M8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxOoKxsN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA534E75D
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 05:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768369258; cv=none; b=tyeniBnn/XMZPB+nFDllc93PNmCcrnGwP352kdEO+d0NtOwCtEuMnTW92aSdD+QIB/kDyoLt10Ip1aGnMZOyFgKl1QFLex5i/K8wr2wzdPsfekOIsa/wEih+FRLlntw1IkMHTlYoZNrNtqMClxh1DHrqyFlNA4LI9qyJp3wM76k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768369258; c=relaxed/simple;
	bh=a4WsXzZWoNjdg0FfAqolDc7/Dwwielkku9o9g6uKcQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxDVAjJeRk3PmaOclFaQt7+Wenwfi34hWmXlyxOY8NRcTiJ41T0cA0Ke6H0Ht9P/ZfggbFEgTDw14CUfEiYrWhXTny3gdS4lByMeSXauo5IwqwAO6TTc34QnEwpwAVUsZdcAWzeG/DKFBiuUiCLL4TFLNYXqvO9nZY+3N9CrDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkSyw4M8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxOoKxsN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E5EZS82029354
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 05:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YltZYJZ8/FFCqWJQVPD4dTiy7205pY/75qTvfZ0+xvI=; b=hkSyw4M8nm/XdsIo
	bEdd72AoWWkJb9CaYG+R40/+NCSF3mAeKKZDDPtKY3DX4i1kBZQ7zebb7juQmVbx
	K5o1B9jNCrVNU9zZSQ6AB55ksRKg2t4P2z7giRRJPS5iFCeyVEQYUsxXQonfaXTy
	nz8LV3rqLqg90Sr43GJIfOWhYnAfWXC1GeNzuljYRhF+eyMUHoZgR1lVs1iXqgrY
	j5sS0/ywqudIPj6BUpZKFw9Vvp5JkFIyrIR1KlimVSoTJv6DtoSktEJXd1YwmPz7
	1c7+KOUJtGYvMz/YjQ2Tp6vHp1HDeFEYVsnBnjSyT5AVDuJNGiC7z5MXdgD8bDpK
	VQemaA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0dukdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 05:40:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a2cc5b548so11488766d6.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 21:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768369238; x=1768974038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YltZYJZ8/FFCqWJQVPD4dTiy7205pY/75qTvfZ0+xvI=;
        b=jxOoKxsNch3FlFit7qa6TAKD8XrnLfU4VsewTyRJogr4U+jEynSl5FPi5vwSB+w58X
         yzMlbUb9jzUcOJcoCl060Dbp26C6ch3xMjnChrphvvC821LPwBRpkdc2IiBlU6XkNDoI
         byAQ1IQLxB1ra3KLcjoyGHjatDBHL2qpEZNmISrURMyT1Vpbs5gxxH36okK1uKyYtnU2
         yHRoal4KX0XMtH2dfMcE+OexBn9N/wDcxZpt7MOSObVLXYgJRK3wX/T0jKnDIC9pbOjA
         U/pidH1HD1KE5vpxMU5gSaNCXAl0ULXmtRrp80OBIpPxCLKyFjCiKM7Tj1LvRWbKal8p
         Jv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768369238; x=1768974038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YltZYJZ8/FFCqWJQVPD4dTiy7205pY/75qTvfZ0+xvI=;
        b=eKgLY07kV5n2JnhdjFDgXRrRk8Mx1CDDGJGTWxoqUpS4EZ+0cw3NucyQyeP8B+3k6x
         9uQ3mBH0Eis499kLK3JGW9MyQAQvt1xYOpXr3bGOYBpwLV8iTiBK23wgjLrUKAdBemFv
         P9YSVvW0R8VOO9NEccoyCMhEwA/rq0IFFXh+z2cCS4xtC4Yz0mPfx2YvDVqYet1j0V6i
         2DDlIflETZkrqB2uNzV4sUz8Qr35CaXZrGCF3nnq94nUHWGrgglQwTOPn0Nzh/baRNvA
         l8/kHkBQvMjeXg6QgZxp8eGIff7N9dvZfFQA73E8PZkUxvzbiPWeh3HtZDwRQz+NwcQ8
         EPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDXEduL0mf4VZUt2MMtRIiXVLlOBAoHvimd3RM2UWnLhMwQwENecrqTBmBxy2ErVDdWPt7pOlOptQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAvl+oFMKfi1kxnG7rfuKto3KfRwWU1HMUa3aCdA4Gl9ZxbLR
	6IZg3Do8FdusfSk+2tOUp/rDH4XX57uyqrIzUrBvepm3s5NpjmaV4irhKqUjuB40FeW3HQ8RsFm
	4AUXA5ZvyGf9YO5gcj3ui5XJq0jX+xb4zDP1xm6WaAMtTiCtdxFxKyZb1G/+o5SdcSrcU5y7gwN
	A+MO9/WWlMyYniP5jQcLCUI1xG2Xa4Wjve8a+rZw==
X-Gm-Gg: AY/fxX6QfVDpuuDNQHzEbudjC2mFaM3zQrQ4S67UZjt3iz6y7yhIJA5CFyWJv/+EFqy
	YkopHMjMLUs+HAtlcL4G9bXVTUgIOxQRUD5N85sWKK2bGx8JX+MKJyn4ksTN2aYX52ejJvE+RIx
	si/XsnMVho/wx97k8lufWDYiI4YjU3RPwgP+4XttDQYuXDCWYJ0DfA3QaswFxNT4uwtMs=
X-Received: by 2002:a05:6214:301e:b0:888:4930:7989 with SMTP id 6a1803df08f44-89274188cedmr21693476d6.36.1768369238489;
        Tue, 13 Jan 2026 21:40:38 -0800 (PST)
X-Received: by 2002:a05:6214:301e:b0:888:4930:7989 with SMTP id
 6a1803df08f44-89274188cedmr21693246d6.36.1768369238047; Tue, 13 Jan 2026
 21:40:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com> <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
 <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com> <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
In-Reply-To: <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:10:26 +0530
X-Gm-Features: AZwV_QjHwh5ovf5EN6Tyl3Ug9Cf5imbrDy6Du4j2KN4SYA_3sBdnF4y6Nbv7fyg
Message-ID: <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=69672c57 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=d3pjDsmsH-2TaDM6u_MA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: qiEHyp76KFTRhmCXnqG5y1MERx34I2jM
X-Proofpoint-GUID: qiEHyp76KFTRhmCXnqG5y1MERx34I2jM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0MSBTYWx0ZWRfX5PNTciOuxqF2
 xGyFclEfXtUAdGlUdMHy3mMKZ5tSs4+FhLD1umPnFfjCZcNqgOipEeDS4DXo7SgYSlJaLmzVYuF
 ToSkhFO0htKyHMBQgKXYBwhZawnIm4zq65FRIsIHjPdXs+Ywh901mMjZQKdIyu+ImhM6QXIsXCP
 TFnNemXQUF0lIF5fDmSkwWOTnIrRfDT/SzFC4FTJcJDLJrTgAUA9iuy1uu2MdFgZxs+Ria+rTFO
 5GVVtiNQSEfSc7NkWwobiXKX6XQN/WkJO5nYS9lQgoCa9aIRNhdQPNlGU1qmFj3QyBqUHsUNNp+
 qwyp8jUmTmKyvgPWKv1X3w7v3vVEQTeaHcROdsJfKu6qoZhJXA2PlfelFahA0uuaXA3FU0u65wT
 0ZJTDY61gZ5HTKY6Z+OA29+ToaDbtJh5/nG8dinffyDbE5p3nwJ4oZoslEXS7lCoqc33M5rPV8K
 Lfmtdt1hdMU8U8iXgoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140041

On Tue, Jan 13, 2026 at 4:59=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jan 13, 2026 at 01:32:41PM +0530, Swati Agarwal wrote:
> > On Sat, Dec 20, 2025 at 9:47=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > > > Enable secondary USB controller in host mode on lemans EVK Platform=
.
> > > >
> > > > For secondary USB Typec port, there is a genesys USB HUB GL3590 hav=
ing 4
> > > > ports sitting in between SOC and HD3SS3220 Type-C port controller a=
nd SS
> > > > lines run from the SoC through the hub to the Port controller. Mark=
 the
> > > > second USB controller as host only capable.
> > > >
> > > > Add HD3SS3220 Type-C port controller along with Type-c connector fo=
r
> > > > controlling vbus supply.
> > > >
> > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++=
++++
> > > >  1 file changed, 158 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/b=
oot/dts/qcom/lemans-evk.dts
> > > > index 70d85b6ba772..d72639479d75 100644
> > > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
> > > >               };
> > > >       };
> > > >
> > > > +     connector-1 {
> > > > +             compatible =3D "usb-c-connector";
> > > > +             label =3D "USB1-Type-C";
> > > > +             data-role =3D "host";
> > > > +             power-role =3D "dual";
> > > > +             try-power-role =3D "source";
> > > > +
> > > > +             vbus-supply =3D <&vbus_supply_regulator_1>;
> > > > +
> > > > +             ports {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     port@0 {
> > > > +                             reg =3D <0>;
> > > > +
> > > > +                             usb1_con_ss_ep: endpoint {
> > > > +                                     remote-endpoint =3D <&hd3ss32=
20_1_in_ep>;
> > > > +                             };
> > > > +                     };
> > > > +
> > > > +                     port@1 {
> > > > +                             reg =3D <1>;
> > > > +
> > > > +                             usb1_hs_in: endpoint {
> > > > +                                     remote-endpoint =3D <&usb_hub=
_2_1>;
> > > > +                             };
> > > > +
> > > > +                     };
> > > > +
> > > > +                     port@2 {
> > > > +                             reg =3D <2>;
> > > > +
> > > > +                             usb1_ss_in: endpoint {
> > > > +                                     remote-endpoint =3D <&usb_hub=
_3_1>;
> > > > +                             };
> > > > +
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > >       edp0-connector {
> > > >               compatible =3D "dp-connector";
> > > >               label =3D "EDP0";
> > > > @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply=
-0 {
> > > >               enable-active-high;
> > > >       };
> > > >
> > > > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > > > +             compatible =3D "regulator-fixed";
> > > > +             regulator-name =3D "vbus_supply_1";
> > > > +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> > > > +             regulator-min-microvolt =3D <5000000>;
> > > > +             regulator-max-microvolt =3D <5000000>;
> > > > +             regulator-boot-on;
> > > > +             enable-active-high;
> > > > +     };
> > > > +
> > > >       vmmc_sdc: regulator-vmmc-sdc {
> > > >               compatible =3D "regulator-fixed";
> > > >
> > > > @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
> > > >                       };
> > > >               };
> > > >       };
> > > > +
> > > > +     usb-typec@47 {
> > > > +             compatible =3D "ti,hd3ss3220";
> > > > +             reg =3D <0x47>;
> > > > +
> > > > +             interrupts-extended =3D <&pmm8654au_2_gpios 6 IRQ_TYP=
E_EDGE_FALLING>;
> > > > +
> > > > +             id-gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > > > +
> > > > +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> > > > +             pinctrl-names =3D "default";
> > > > +
> > > > +             ports {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     port@0 {
> > > > +                             reg =3D <0>;
> > > > +
> > > > +                             hd3ss3220_1_in_ep: endpoint {
> > > > +                                     remote-endpoint =3D <&usb1_co=
n_ss_ep>;
> > > > +                             };
> > > > +                     };
> > > > +
> > > > +             };
> > > > +     };
> > > > +
> > > >  };
> > > >
> > > >  &i2c18 {
> > > > @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
> > > >               bias-pull-up;
> > > >               power-source =3D <0>;
> > > >       };
> > > > +
> > > > +     usb1_intr: usb1-intr-state {
> > > > +             pins =3D "gpio6";
> > > > +             function =3D "normal";
> > > > +             input-enable;
> > > > +             bias-pull-up;
> > > > +             power-source =3D <0>;
> > > > +     };
> > > >  };
> > > >
> > > >  &qup_i2c19_default {
> > > > @@ -849,6 +935,12 @@ usb_id: usb-id-state {
> > > >               function =3D "gpio";
> > > >               bias-pull-up;
> > > >       };
> > > > +
> > > > +     usb1_id: usb1-id-state {
> > > > +             pins =3D "gpio51";
> > > > +             function =3D "gpio";
> > > > +             bias-pull-up;
> > > > +     };
> > > >  };
> > > >
> > > >  &uart10 {
> > > > @@ -903,6 +995,72 @@ &usb_0_qmpphy {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&usb_1 {
> > > > +     dr_mode =3D "host";
> > > > +
> > > > +     #address-cells =3D <1>;
> > > > +     #size-cells =3D <0>;
> > > > +
> > > > +     status =3D "okay";
> > > > +
> > > > +     usb_hub_2_x: hub@1 {
> > > > +             compatible =3D "usb5e3,610";
> > > > +             reg =3D <1>;
> > > > +             peer-hub =3D <&usb_hub_3_x>;
> > > > +             #address-cells =3D <1>;
> > > > +             #size-cells =3D <0>;
> > > > +
> > > > +             ports {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     port@1 {
> > > > +                             reg =3D <1>;
> > > > +
> > > > +                             usb_hub_2_1: endpoint {
> > > > +                                     remote-endpoint =3D <&usb1_hs=
_in>;
> > > > +                             };
> > >
> > > Are all other ports disconnected? If so, why do we need a hub?
> > Hi Dmitry,
> > I didn't understand your query, can you give more context to it?
>
> You have described one port of the hub. How are other ports routed? Are
> they connected to outer ports? To some other devices? Unconnected?
Hi Dmitry,
I would like to put it this way, USB HUB has 4 ports but only one port
of the hub is used between SOC and Type-C controller.
Remaining 3 ports are used by other devices.

Regards,
Swati

