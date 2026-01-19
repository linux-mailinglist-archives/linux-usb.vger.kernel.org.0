Return-Path: <linux-usb+bounces-32464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4CCD39D6D
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 05:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2ED933009762
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 04:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5572D5932;
	Mon, 19 Jan 2026 04:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUDVxL/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEZhfejH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B8D32ED39
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 04:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768795937; cv=pass; b=YoAVS0B4teL0qqlrBl2NHdjUayv/F1E2zBDEesc/WW5ZFlNKopdJruCoBgOBOC086iIIkVxa0lbKEgswmhsXyrhj7Jtp2Pwx5Q9s2ezP8c4Jg9o8kM5ajgMXnQ8MHhpokHBPHpUovgF1KYIigk44DfKO9UJDCWmCvP6w3ykPlkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768795937; c=relaxed/simple;
	bh=LC5ldM7Pp7O2NQNIduQOdZIIWMw96vpR+TP8tSA1Uvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGMTtwC0yAAMB8odFDlGEsT2N0wE9+A1NuNWlwAf+FjJLtVv/mHw25EMUQDrpOoydMxWebTV/vD3qFfbSfCtJyhGJ2zWKFbMOw7ochjGf+UQ0cogR2456WCcGrJkiltTJHyjafKC3et09Ot/w0VWbo+Oi4AhJoopS+rgSvbWjhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUDVxL/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEZhfejH; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IMql0t3345357
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 04:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSLP4RuctikhYrzYVyzS+NfVa/9EWKcdFmTCTAmuic0=; b=bUDVxL/hJhe6aWD8
	06Da4M1fU6zdQsVJe0rYbPQemxmr9NW3fQzy/ZvUeV6yDdYeOoJwrgEjWfVWvlLJ
	D1Sa0XWWZE2M53QSQJmApLrUV5mdrwrhWdzmBa8Cnja+KXzdAqm+ubKE6gAKVkrR
	7b1j26R0QjWRnabkbE2AZaBZKVLgVH9B7eYgveceYpx1yhOC7lhvd7apYxLg951H
	kVr3bXgMRn2xD6QzL4MHuxlKbSdNzHTEUwuCeyAKVdqQZI+jqJduRXLjM0x/cp47
	rF+n4snt1wTVuOq7n9s5luqc41I9sBTl2473BPap0/b4RaLyyaHJbKK2bKM8jrAY
	P085zg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs7880kvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 04:12:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3a4af701so97113306d6.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Jan 2026 20:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768795935; cv=none;
        d=google.com; s=arc-20240605;
        b=OBtyywM7cl1A9xVzILPZeK1FVDKZSArqp5wcD3n6CqriC+/AzjyOeWQOAu8kh3Y8oV
         A/xDmGAXUGBE2meANAFm76gF8Tw08FVNtL8eKrdNVIQXhX5bb9BE1FQyimzfpFkH4xb+
         xfd1ziyPsHdHXS5JkHdCXbpAnvBf3g5xL57uxhGvZorzDZ9KP8/U00N0GL5fdhV3Y2i7
         BvxVhXnFtt/fVs3fPt+uGDmn/LQzMpETeRKhzQg2wlS2EalUqbS5layUZ2p0Aa40nNq+
         Syg6WLFVwxp1iKAVRNCYYZN090axvX3cH+p8ik58ak19wNZCzO/fn6YRPiLKMEB3jn0p
         Agrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSLP4RuctikhYrzYVyzS+NfVa/9EWKcdFmTCTAmuic0=;
        fh=cQF6W5JwFdVdd/u8R4gtrfxked3qb2ZxExSSCY2t9qU=;
        b=T0GUjGIRivoQKDI6CqFSOe6I7npn2PSH3XFL/9IvUxfnea0UG2kAQNNjKD+MJBq/Fa
         AFESilKggllTPpLt8wL1HqTEiJYittd7XnK645ibjXlUp5q/OCLUj62DfYlv4zoXdNGn
         aleM+w2Oul5rHAChTaUEwToXFsBBnrRl1hyHWac7lO5WOztRODWuI0DJQUzGrTSc9jf7
         SbXyoCBVXMSO9u04D0rWxE7l9zi6GR0IPT6dbFqU4OwbMwkeePs/cMGWqBABOg54fXaP
         C+zGBxLEq1iRiWqy8DaYhkAlc8vYZNtAZAKObn+2kQ9DgP5vaDHRQxizuo3WlO6EVidY
         62Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768795935; x=1769400735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSLP4RuctikhYrzYVyzS+NfVa/9EWKcdFmTCTAmuic0=;
        b=QEZhfejH7Gn7B5ZK3pAJ/bxePnYl+qlch1y60ZXzY02zUn6E1OTOo0cchOkWkT/Tg5
         yqqRsutW0MSWlLbQpEsMPT1tgE+6NOaP5oWnjPMJ6J8uc8/cCs1a6ow59XRg6B9xFgdy
         cpO3msMvTQus45xkQuNP5rXkDVSC550Va8hn4gNJcMaYVf90sVF1o5eGt0QPOOtK4cmA
         H/u9t3LPwK2VZfsHCJoXImtKZAmkkg1iD/yhi4U0979wgO5bgFWYfu11VyvgGHvRiei6
         6sRhDroE2e9Fe2h41xkfcB9tp/olV7xyK9PoyA9gWj64Px2uBpvCD0k5p1pLJlBWjLrh
         siNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768795935; x=1769400735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSLP4RuctikhYrzYVyzS+NfVa/9EWKcdFmTCTAmuic0=;
        b=lZarvrb6BYK6MojtNL+sApZ4BZtjPol+CRXuQ8fpkm0x3W5CfpBRxS+tCSDCqqhCdB
         BdmixvUQ98wt5wFhM5jtChDt6DV7t+OrKt88f80BOgirzNzOfLYGf6EbxHBZgE7Y+fZu
         gAokVIOkgVqeLDm1QIlPvX+FRUYDiz/D5MiOZCI/ZcOY+g1HIhhGT7mq1F5QipHsCSfU
         b8aQkkJaCEmaMZEJbfeIWrJJtz+f9uatm6bytemWs7dExR1vqKKHPMD2an8rBOI1VeKo
         tUVfPzz3Enl4u8rX4qNGkwtPNYwGZnVFLK0lzOFd8gJfM3ghpmQmJbC1IxHhHGIn3CZu
         pXmw==
X-Forwarded-Encrypted: i=1; AJvYcCWkvYRtLeoO3poJbHhQcNyjf3KLvw08FzX7i12P8pAHG4s774cDw/F9MFPUIOefd0Qfq0A64pPZIBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGJQq0OkSWhNe0FjKKw5Exe0Ci9fowlnzjQFcprWJUzcZpG7xn
	9N8EgQa/O+om+AC/ioiwy9ELicZkBxkf8rI6QVbQUFsjlN04sQ+srpuTLM5sCNDbN8ZYd3lYvnX
	zGGAkR5b3da7wERTYo6oBvosTuMUPAJGtV0ciDMcXTvywxFJ3IACl70yw3L2IizqbGwJVzRVeK6
	pKnC85WiwlAgLhr91dtDsQK03RkfMrUoh5JIy9Bg==
X-Gm-Gg: AY/fxX6qfeVlnn2R1k3Zy6A2plOVUOAa8WBtRyNEUJ9UqeQOn6KeMvrXCanGFhkKClX
	XvHKVoLA79f4tQPqeftetqYVxoS1LBtmHVO16eYlXbLWbm/+rNMjMy/uCFiiz0X4gh12tvny/fA
	JjXFaYCiYeaySPgA5nATGnyP/X4t4nvJ6+zOGENF3DF5My0S7ubrw79UgaHNe3jkzRQTg=
X-Received: by 2002:ad4:5bef:0:b0:888:4938:49e6 with SMTP id 6a1803df08f44-8942ddc1868mr166168766d6.70.1768795934497;
        Sun, 18 Jan 2026 20:12:14 -0800 (PST)
X-Received: by 2002:ad4:5bef:0:b0:888:4938:49e6 with SMTP id
 6a1803df08f44-8942ddc1868mr166168636d6.70.1768795934060; Sun, 18 Jan 2026
 20:12:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com> <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
 <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
 <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
 <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com> <zkvwy56jkya6eogwqlmbhoo64zlzatxsdtkhy4hqfudoqtfbkg@fwiy46l3c337>
In-Reply-To: <zkvwy56jkya6eogwqlmbhoo64zlzatxsdtkhy4hqfudoqtfbkg@fwiy46l3c337>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 09:42:03 +0530
X-Gm-Features: AZwV_Qhmg9tHGp52VrTvw7vw7uA1PDc2XX4NC6WqoGa6QZ-b3fjgVIR8u0EvQLM
Message-ID: <CAHz4bYuE6LS=+3272x2qat7EyjgVuODC7Otz_f4zP78ZQ=BWDA@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=KLVXzVFo c=1 sm=1 tr=0 ts=696daf1f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=G1Sdl2PVBONlc36WVvQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAzMiBTYWx0ZWRfX/kYiOkBbVSLN
 h6C83Hr3EiQ3sxVwNqxtjnSTnFtg0jVrgEsK1jEv2lLFBECH+PRg+zTQKmwzI0MflqQ5wYtgPoS
 R4Y61oNLj4OBjqxQXD6tWQPITe167UFclmB/LQmUbfjRb9DWR8f3WP1I4nniJ9EYb8q1f8LVfpS
 zGB4g8b3At3IPpQPYiOnYorYefWgq2OTZ2iWLHqs8S6GgyaxehLmmsGX5nmzZcr/SpsEmOqV1mq
 LyXEyvP4q5ccqPv02tN04M6cJiKtD9FOB/MiW55NfaYU28sqSUBHNMJlZ/UvxHOFEqkU+vJ4Oli
 6fU88zg95ljjva8tF3V7wHMV09F/ti+R5RHYwdPw3thWC1iFAxh2IUj0ro6iTP4LgnWJqGT/7D0
 Q6lByiWewjdik5Ybtece+i9Ccmm3GohaWgzF1JYRcMFUiDs4FVA5CsxqV2LyH51dsMio44WikYA
 wyS11D5OX5v/aeakD1A==
X-Proofpoint-GUID: L7QbBxR2vhtymbfK94yMoRu8uHjjHYjt
X-Proofpoint-ORIG-GUID: L7QbBxR2vhtymbfK94yMoRu8uHjjHYjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190032

On Wed, Jan 14, 2026 at 11:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Jan 14, 2026 at 11:10:26AM +0530, Swati Agarwal wrote:
> > On Tue, Jan 13, 2026 at 4:59=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Tue, Jan 13, 2026 at 01:32:41PM +0530, Swati Agarwal wrote:
> > > > On Sat, Dec 20, 2025 at 9:47=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > > > > > Enable secondary USB controller in host mode on lemans EVK Plat=
form.
> > > > > >
> > > > > > For secondary USB Typec port, there is a genesys USB HUB GL3590=
 having 4
> > > > > > ports sitting in between SOC and HD3SS3220 Type-C port controll=
er and SS
> > > > > > lines run from the SoC through the hub to the Port controller. =
Mark the
> > > > > > second USB controller as host only capable.
> > > > > >
> > > > > > Add HD3SS3220 Type-C port controller along with Type-c connecto=
r for
> > > > > > controlling vbus supply.
> > > > > >
> > > > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++=
++++++++
> > > > > >  1 file changed, 158 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm=
64/boot/dts/qcom/lemans-evk.dts
> > > > > > index 70d85b6ba772..d72639479d75 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > > @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
> > > > > >               };
> > > > > >       };
> > > > > >
> > > > > > +     connector-1 {
> > > > > > +             compatible =3D "usb-c-connector";
> > > > > > +             label =3D "USB1-Type-C";
> > > > > > +             data-role =3D "host";
> > > > > > +             power-role =3D "dual";
> > > > > > +             try-power-role =3D "source";
> > > > > > +
> > > > > > +             vbus-supply =3D <&vbus_supply_regulator_1>;
> > > > > > +
> > > > > > +             ports {
> > > > > > +                     #address-cells =3D <1>;
> > > > > > +                     #size-cells =3D <0>;
> > > > > > +
> > > > > > +                     port@0 {
> > > > > > +                             reg =3D <0>;
> > > > > > +
> > > > > > +                             usb1_con_ss_ep: endpoint {
> > > > > > +                                     remote-endpoint =3D <&hd3=
ss3220_1_in_ep>;
> > > > > > +                             };
> > > > > > +                     };
> > > > > > +
> > > > > > +                     port@1 {
> > > > > > +                             reg =3D <1>;
> > > > > > +
> > > > > > +                             usb1_hs_in: endpoint {
> > > > > > +                                     remote-endpoint =3D <&usb=
_hub_2_1>;
> > > > > > +                             };
> > > > > > +
> > > > > > +                     };
> > > > > > +
> > > > > > +                     port@2 {
> > > > > > +                             reg =3D <2>;
> > > > > > +
> > > > > > +                             usb1_ss_in: endpoint {
> > > > > > +                                     remote-endpoint =3D <&usb=
_hub_3_1>;
> > > > > > +                             };
> > > > > > +
> > > > > > +                     };
> > > > > > +             };
> > > > > > +     };
> > > > > > +
> > > > > >       edp0-connector {
> > > > > >               compatible =3D "dp-connector";
> > > > > >               label =3D "EDP0";
> > > > > > @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-su=
pply-0 {
> > > > > >               enable-active-high;
> > > > > >       };
> > > > > >
> > > > > > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > > > > > +             compatible =3D "regulator-fixed";
> > > > > > +             regulator-name =3D "vbus_supply_1";
> > > > > > +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> > > > > > +             regulator-min-microvolt =3D <5000000>;
> > > > > > +             regulator-max-microvolt =3D <5000000>;
> > > > > > +             regulator-boot-on;
> > > > > > +             enable-active-high;
> > > > > > +     };
> > > > > > +
> > > > > >       vmmc_sdc: regulator-vmmc-sdc {
> > > > > >               compatible =3D "regulator-fixed";
> > > > > >
> > > > > > @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
> > > > > >                       };
> > > > > >               };
> > > > > >       };
> > > > > > +
> > > > > > +     usb-typec@47 {
> > > > > > +             compatible =3D "ti,hd3ss3220";
> > > > > > +             reg =3D <0x47>;
> > > > > > +
> > > > > > +             interrupts-extended =3D <&pmm8654au_2_gpios 6 IRQ=
_TYPE_EDGE_FALLING>;
> > > > > > +
> > > > > > +             id-gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > > > > > +
> > > > > > +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> > > > > > +             pinctrl-names =3D "default";
> > > > > > +
> > > > > > +             ports {
> > > > > > +                     #address-cells =3D <1>;
> > > > > > +                     #size-cells =3D <0>;
> > > > > > +
> > > > > > +                     port@0 {
> > > > > > +                             reg =3D <0>;
> > > > > > +
> > > > > > +                             hd3ss3220_1_in_ep: endpoint {
> > > > > > +                                     remote-endpoint =3D <&usb=
1_con_ss_ep>;
> > > > > > +                             };
> > > > > > +                     };
> > > > > > +
> > > > > > +             };
> > > > > > +     };
> > > > > > +
> > > > > >  };
> > > > > >
> > > > > >  &i2c18 {
> > > > > > @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
> > > > > >               bias-pull-up;
> > > > > >               power-source =3D <0>;
> > > > > >       };
> > > > > > +
> > > > > > +     usb1_intr: usb1-intr-state {
> > > > > > +             pins =3D "gpio6";
> > > > > > +             function =3D "normal";
> > > > > > +             input-enable;
> > > > > > +             bias-pull-up;
> > > > > > +             power-source =3D <0>;
> > > > > > +     };
> > > > > >  };
> > > > > >
> > > > > >  &qup_i2c19_default {
> > > > > > @@ -849,6 +935,12 @@ usb_id: usb-id-state {
> > > > > >               function =3D "gpio";
> > > > > >               bias-pull-up;
> > > > > >       };
> > > > > > +
> > > > > > +     usb1_id: usb1-id-state {
> > > > > > +             pins =3D "gpio51";
> > > > > > +             function =3D "gpio";
> > > > > > +             bias-pull-up;
> > > > > > +     };
> > > > > >  };
> > > > > >
> > > > > >  &uart10 {
> > > > > > @@ -903,6 +995,72 @@ &usb_0_qmpphy {
> > > > > >       status =3D "okay";
> > > > > >  };
> > > > > >
> > > > > > +&usb_1 {
> > > > > > +     dr_mode =3D "host";
> > > > > > +
> > > > > > +     #address-cells =3D <1>;
> > > > > > +     #size-cells =3D <0>;
> > > > > > +
> > > > > > +     status =3D "okay";
> > > > > > +
> > > > > > +     usb_hub_2_x: hub@1 {
> > > > > > +             compatible =3D "usb5e3,610";
> > > > > > +             reg =3D <1>;
> > > > > > +             peer-hub =3D <&usb_hub_3_x>;
> > > > > > +             #address-cells =3D <1>;
> > > > > > +             #size-cells =3D <0>;
> > > > > > +
> > > > > > +             ports {
> > > > > > +                     #address-cells =3D <1>;
> > > > > > +                     #size-cells =3D <0>;
> > > > > > +
> > > > > > +                     port@1 {
> > > > > > +                             reg =3D <1>;
> > > > > > +
> > > > > > +                             usb_hub_2_1: endpoint {
> > > > > > +                                     remote-endpoint =3D <&usb=
1_hs_in>;
> > > > > > +                             };
> > > > >
> > > > > Are all other ports disconnected? If so, why do we need a hub?
> > > > Hi Dmitry,
> > > > I didn't understand your query, can you give more context to it?
> > >
> > > You have described one port of the hub. How are other ports routed? A=
re
> > > they connected to outer ports? To some other devices? Unconnected?
> > Hi Dmitry,
> > I would like to put it this way, USB HUB has 4 ports but only one port
> > of the hub is used between SOC and Type-C controller.
> > Remaining 3 ports are used by other devices.
>
> Which devices?
Hi Dmitry,

For Lemans EVK standalone corekit board, there are 4 ports as follows:-

1) p1 is connected to type c port controller.
2) p4 is used for the m.2 E key (NFA765 Bluetooth) on corekit. This
isn't used on a standard core kit, only if we optionally replace the
wifi card with the NFA765 which uses USB for BT. standard kits all use
UART for BT.

Remaining 2 ports will become functional when the interface plus
mezzanine is stacked on top of corekit.

3) p2 is connected to another hub which is present on the mezz through
which 4 type-A ports are connected.
4) p3 is used for the m.2 B key for a 5G card when the mezz is connected.


Regards,
Swati

