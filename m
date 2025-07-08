Return-Path: <linux-usb+bounces-25569-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E552AAFC24B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 07:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7F16189D790
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jul 2025 05:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8426021C9FD;
	Tue,  8 Jul 2025 05:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EU6Dt2Iw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB761FCFF1
	for <linux-usb@vger.kernel.org>; Tue,  8 Jul 2025 05:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751954052; cv=none; b=cq/ZpM2HVjJoKJfmZMb2geD+njbRdALceM5ws9/07ZCfDnEPNNnU6mqLB+68EkoILqnc5RdQeFU9sk3feuHe67Mwmnz8vUszGw0mqLCzl2Fbbwt330fK0r14sr/kD6FS9couyMoJryXBUTVrcVpjjhdSCNiAYXx5CJeFx90rqE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751954052; c=relaxed/simple;
	bh=Ts/erfI/1U95juCnNCnHSS+t4688tJmeinxH2Afpx9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdUvBfT4NlFo6JWdrHNrXR6IN5aZhwoYlajmTs/e6Kg0hCLYDkRTW9mCTAFmOTwZSAzwFpc2k7kro+NPZsIlZTk9iXWL66+cxfq91Ed5Uqx9TUXtkPyM1jfV50iwOzT0Pp8C2r5XSx+utNg3Bppj3MZGtEoPj+a/jMiRy8xz1jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EU6Dt2Iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567JWFje013480
	for <linux-usb@vger.kernel.org>; Tue, 8 Jul 2025 05:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GmNWG+f9cfzqdcMMSlVKHfNJeTBBI9yl9OtdiG/Ptg=; b=EU6Dt2Iw39reaJ9o
	JeBZHeaE+aHBIAWsOnsMtTCfrXUfBe6NnjyjDhcWPloxGShENUaXZicEalIbUgds
	tn0OlKGBsV+eKnEyQOsbc7JPV2teRdPmhHEvGjEfj93WNNpzjqhldga88XrBg3se
	jkq+rOyhjTwiXvICusrUK8awrfzYhy+j1aHIckrHafxgANGfUjOT7cyOsRiMeAHh
	FvjxhidYG2NzzWcrcHp0q3dL31fHg3wPsvmTXq53BqMn7N8VC34H+xuoQnItYbfh
	QT0WY0NDW/eV5s/SyS+yWhILu6RmcXAlXeEl43+4xcr9TcoxJ4Pi3setmFbcuCny
	HKry8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmub52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 08 Jul 2025 05:54:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a9783eabc0so82972591cf.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 22:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751954048; x=1752558848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GmNWG+f9cfzqdcMMSlVKHfNJeTBBI9yl9OtdiG/Ptg=;
        b=CaD7Z3zBqNd8wfxIr2yr3k1uoZw0wDRdnMoGcKdMA+L/Dq/9B8jhGiwTNC6nkYuw8E
         2VTw9NQ0kRUQyyLFbJ3q1YJqlxSVfFYHXgg4O4hr61ygDCze5Ed1A+XXzhqTa2UF3BAP
         QWslj8rWhlvon/GFsz4yyao4Jg6xNkzvgxNL35gTtOe47Km/hSr91lVlNHvloVrlD8HX
         BExisgtPoOoz33dIteiQNO0dopIDHvD4CTWMr25yr6j64BiknKJAOpxwHXGfAv8ikytY
         R1NFv1AS3uPpS19zc7dyrZs+KzDYH+uqDmhJQnJDw6Y+u1Ifn58bFNcUGeyWfUhS7rhT
         cbhw==
X-Forwarded-Encrypted: i=1; AJvYcCWWR9+68/lTitEiWKH8ZLEIRHoCjRni/pyzVrENK8CaS6+zZIo8YhkNb/hXY9OWbjbG3aln5y/xudg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0IT57YQTYpYv2WVlX+0Ry1Msva6rJAupPl4ev7vUmGe01Reh
	toISqRfenD/bwEKalzdBewor2+FkEMZBoFaNFX9Lh1cLPiyBXHdOyw6TgfHPpaY1umQnu+xkOhs
	UEOVdY4FrO8Lf2gATokhScJmp9ameyg0/WpqAsKorw226eQ9o/UsnLDb6O8SrET/b1JPnb7JbJc
	n95odyUSEJwrcqaQdjVerAocLPEhyFQJ4GWysC3w==
X-Gm-Gg: ASbGnctbZpwuP33AVBLAJwQTvFb1xRc6f6oLLexllDzNh8B69RLE0H3ec8Qti+OTTej
	SGQSOusU4qOZds14mqcRF6609iymh3TrMrFgEn6kw//DS5qAk7iMR10toQWjPEmC7jxil6VLM3g
	qQVD3h2A==
X-Received: by 2002:a05:622a:11d3:b0:4a9:a8fd:e9b6 with SMTP id d75a77b69052e-4a9ccde0c6dmr28981721cf.43.1751954048030;
        Mon, 07 Jul 2025 22:54:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkG1/PSmURffRz+0DyrY9TkdVduj7SqUgcOww7V+BMUeR9MlSOMnFuQ7oVlpqf/7eAZK6d7px/g5X1y38kNsY=
X-Received: by 2002:a05:622a:11d3:b0:4a9:a8fd:e9b6 with SMTP id
 d75a77b69052e-4a9ccde0c6dmr28981421cf.43.1751954047335; Mon, 07 Jul 2025
 22:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627125131.27606-1-komal.bajaj@oss.qualcomm.com> <2025062812-passive-untracked-1231@gregkh>
In-Reply-To: <2025062812-passive-untracked-1231@gregkh>
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 11:23:56 +0530
X-Gm-Features: Ac12FXwC05pfIP0vuicV5_xxuQYsfA7JDBPhIFqXwHeQhoKpkWFA1t07QrroD6g
Message-ID: <CAPHGfUOUR=m2rq-rFbUbWjF93qwY5ikHc+M0_KuHOut86z+Mqg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686cb281 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8
 a=3Jk0H8i_qCR-h2oskiIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: DyTBGgeFp6i6ST92kkQ6qCX6VsmAmnnu
X-Proofpoint-ORIG-GUID: DyTBGgeFp6i6ST92kkQ6qCX6VsmAmnnu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0NSBTYWx0ZWRfX6WRnMHsciTEi
 2GZ66r7+9X9I+6r2tsA5h0vi9OVOSvKpxg6gGQFOwSf1WZwmEyTQ4J13jgQN0MXtNQ8Vmrg9Jr4
 8Hh4Swe5fVcQ4NsTV0L1Cq123iy4pwHYXPi+Rs3+cAKwWDczLsMsPD15a+D6IRpHYFNMSIT6Lk/
 XIwxDRmKDAGb12qn+ZnB18fAlJwq0aGEMEEfm0wTgFhvRqPFCNQbBRMgEIEHw7tFh+2JIHeiNdu
 UZtYFDhtNVlskQIroo9oGFrEps3igpZRibpt+1++AS9SMVtP41YPu5zWWy3IsS4Gd++fkclDfJs
 mm2IzjqBdnixd8uWB+00QN3iNuHyGo+I00AvlPFSyoVgl3kPcN3XoT07ctHEmS3i1c1bkr13Lbb
 lJ8u33oDvFb9CQ0x6R58B8GhQShkQJ/p5e8wg+wsiEm/1mavCIy3uY6aCgVErud3oTrwsyLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080045

On Sat, Jun 28, 2025 at 8:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jun 27, 2025 at 06:21:31PM +0530, Komal Bajaj wrote:
> > EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
> > as read-only for HLOS, enforcing access restrictions that prohibit
> > direct memory-mapped writes via writel().
> >
> > Attempts to write to this region from HLOS can result in silent failure=
s
> > or memory access violations, particularly when toggling EUD (Embedded
> > USB Debugger) state. To ensure secure register access, modify the drive=
r
> > to use qcom_scm_io_writel(), which routes the write operation to Qualco=
mm
> > Secure Channel Monitor (SCM). SCM has the necessary permissions to acce=
ss
> > protected memory regions, enabling reliable control over EUD state.
> >
> > SC7280, the only user of EUD is also affected, indicating that this cou=
ld
> > never have worked on a properly fused device.
> >
> > Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded U=
SB Debugger(EUD)")
> > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > * Drop separate compatible to be added for secure eud
> > * Use secure call to access EUD mode manager register
> > * Link to v1: https://lore.kernel.org/all/20240807183205.803847-1-quic_=
molvera@quicinc.com/
> >
> >  drivers/usb/misc/qcom_eud.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> > index 83079c414b4f..30c999c49eb0 100644
> > --- a/drivers/usb/misc/qcom_eud.c
> > +++ b/drivers/usb/misc/qcom_eud.c
> > @@ -16,6 +16,8 @@
> >  #include <linux/sysfs.h>
> >  #include <linux/usb/role.h>
> >
> > +#include <linux/firmware/qcom/qcom_scm.h>
>
> Why the blank line before this #include line?

The qcom_scm.h header has been placed in a distinct paragraph to clearly
differentiate it from generic subsystem headers, with a blank line included
for visual distinction

>
> > +
> >  #define EUD_REG_INT1_EN_MASK 0x0024
> >  #define EUD_REG_INT_STATUS_1 0x0044
> >  #define EUD_REG_CTL_OUT_1    0x0074
> > @@ -34,7 +36,7 @@ struct eud_chip {
> >       struct device                   *dev;
> >       struct usb_role_switch          *role_sw;
> >       void __iomem                    *base;
> > -     void __iomem                    *mode_mgr;
> > +     phys_addr_t                     mode_mgr;
> >       unsigned int                    int_status;
> >       int                             irq;
> >       bool                            enabled;
> > @@ -43,10 +45,14 @@ struct eud_chip {
> >
> >  static int enable_eud(struct eud_chip *priv)
> >  {
> > +     int ret;
> > +
> >       writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
> >       writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
> >                       priv->base + EUD_REG_INT1_EN_MASK);
> > -     writel(1, priv->mode_mgr + EUD_REG_EUD_EN2);
> > +     ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
> > +     if (ret)
> > +             return ret;
>
> So the previous writes are ok, but this one could fail?  And if it does
> fail, what did the previous writes cause to happen to the chip / system?

Thanks for pointing that out. I will move the SCM write before the direct
register writes to avoid any inconsistent state if the SCM call fails

>
> >       return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
> >  }
> > @@ -54,7 +60,7 @@ static int enable_eud(struct eud_chip *priv)
> >  static void disable_eud(struct eud_chip *priv)
> >  {
> >       writel(0, priv->base + EUD_REG_CSR_EUD_EN);
> > -     writel(0, priv->mode_mgr + EUD_REG_EUD_EN2);
> > +     qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
>
> No error checking needed?

ACK

>
>
> >  }
> >
> >  static ssize_t enable_show(struct device *dev,
> > @@ -178,6 +184,7 @@ static void eud_role_switch_release(void *data)
> >  static int eud_probe(struct platform_device *pdev)
> >  {
> >       struct eud_chip *chip;
> > +     struct resource *res;
> >       int ret;
> >
> >       chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> > @@ -200,9 +207,10 @@ static int eud_probe(struct platform_device *pdev)
> >       if (IS_ERR(chip->base))
> >               return PTR_ERR(chip->base);
> >
> > -     chip->mode_mgr =3D devm_platform_ioremap_resource(pdev, 1);
> > -     if (IS_ERR(chip->mode_mgr))
> > -             return PTR_ERR(chip->mode_mgr);
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +     if (!res)
> > +             return -ENODEV;
>
> -ENOMEM perhaps?

ACK

>
> thanks,
>
> greg k-h

