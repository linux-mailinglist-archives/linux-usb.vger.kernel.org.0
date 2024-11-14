Return-Path: <linux-usb+bounces-17596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689D9C8BC1
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 14:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96DBD283097
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 13:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7991FAF00;
	Thu, 14 Nov 2024 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7cUMFOS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68391F9EC0
	for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731590805; cv=none; b=Mm4bnPFnsMRcNF1i+zmj1lfPxwKkP5kqhfn5mPzwPWb91qBiuv7fhnTiSKUM/4Zxggd7bItKJdKOHZUepwPWrPzPmjEdB97VtVCuEgvEU7ET5CWUKcyt20iZP5T57CJXkwFmqsiO76AfxYQ3oeFdQu0JZD8KyIGqYg9/pUOwYW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731590805; c=relaxed/simple;
	bh=HC8zIVJhmZGBaTgVFGCULFt5nrR2kYgDBpJlRO/4s24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MBVQAdppsYypLCW029J0qhDCPlUfeDa93QDUEVazeczIYGwh87IuZAdoaHTELFHc+pgWJDJp1zt31Xyll1P2/lkOo23fty6BmnsgPN0Ev3x+ZCux2ie75mCRyk7ZFxeYXSNtx5QaG59IjTaLAE1qaD1EuhVumFvjyU/syiJlzGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h7cUMFOS; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea7c26e195so6835627b3.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 05:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731590803; x=1732195603; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=44Uknm2sw9kBbdVK3KPiUzPorxfNwDSfI3ZnmRNP3ac=;
        b=h7cUMFOSzOMwGjm7rgA8orgvarcVteVUJ4CkUj4NRaU59IYac7yOM2SiiOQ0MESCe2
         /we5kxWZUkWuqxTUemeMhH2RE7V5wMrYqri9IzafZr6y3EorMywjv3AzVIDcoldl0vcH
         8om2WME2s7tA+NUcVCXLfq7Hdg7OF5WGH6VqJ5FrvQXvCamuDIyqmlvDatGnK/UFnICG
         JP6/rt/8eC5xWvL4L8zm1nNsyRv2IBJHQFLjbMmMhW7ObHaV731Sh6Z0h5UdrJEDNv/A
         RotY5uqhilS8A1pkWkyV3nx+37K7ktNFtkdDErUSQeB7Z6yHS9s9dMypdlM/k+QccPzs
         jFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731590803; x=1732195603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Uknm2sw9kBbdVK3KPiUzPorxfNwDSfI3ZnmRNP3ac=;
        b=pzz2bYKqZvgVjba87Zq7BfnRI2y1BGYLzy3JX1/480CIpxrefq8phqtNAgmVhRfVnU
         8BA8FlBhoqhfAsjOrInAp8H5S/gLbLfkC8/jzDdjCfQtSX1bgwA2R54nrMYtqRsQyahU
         BW3Dbw8ZTMrxUgbJ6gzgf1DAq8EbcPK9hoKVXvLRsWJEAmVLDL5yxuMXg7rcYoILytvm
         Z/U5gvEy1BG4CoiC38ezMi33S3RZzezK5YA3d5V1VJ8VIpd4SUbzi69lOWv++ED+vpAv
         csmVfnb21zY9NCJHqyrYoeEa90ftgfE6Q2FpiayedIwd4yshw3nWn+ZG0PfKQRkYu2mE
         gW4g==
X-Forwarded-Encrypted: i=1; AJvYcCXtDeaAZrWQAq5W5r/oweg+N1OWH+dNm0LxtD1pxCRy9Li0evDPqEnUqtNhqasUQDUsCKVxoFIBn3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkT8mcgioRfkf8qo6rcuYZcnGApbKGP3DopwnhE3n9mVFkzRy4
	AEytJUuWP5mwPZ2B2NruP9/TzvYPQjivdn6+FPpTCkdmNR0gJZdQO8P/OsNrrXNT1SEkWNLVyPk
	+heWC0d1mddx5L0fuCq77fNK6d+LxUDbUH+9cmA==
X-Google-Smtp-Source: AGHT+IFwf8z1mFNYgsE8PD3lTDBZomFAHFwSNm4/O3SWdpkSZXwgnQCoA5dTaVPjasFbh6e4N903GF7+1g2FDtRLHK4=
X-Received: by 2002:a05:690c:4482:b0:6ee:3f5e:1c18 with SMTP id
 00721157ae682-6ee3f5e2b1amr33209767b3.4.1731590802836; Thu, 14 Nov 2024
 05:26:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114074722.4085319-1-quic_varada@quicinc.com>
 <20241114074722.4085319-5-quic_varada@quicinc.com> <7e293d68-73c1-425d-ae52-e0893c8e0a61@oss.qualcomm.com>
In-Reply-To: <7e293d68-73c1-425d-ae52-e0893c8e0a61@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Nov 2024 15:26:32 +0200
Message-ID: <CAA8EJprqOxcm9NPdNZkA0XzCbv1E+MXicTcqx72sgCpZoE2sUg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] phy: qcom: qmp: Enable IPQ5424 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, andersson@kernel.org, konradybcio@kernel.org, 
	mantas@8devices.com, quic_kbajaj@quicinc.com, quic_kriskura@quicinc.com, 
	quic_rohiagar@quicinc.com, abel.vesa@linaro.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Nov 2024 at 14:47, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 14.11.2024 8:47 AM, Varadarajan Narayanan wrote:
> > Enable QMP USB3 phy support for IPQ5424 SoC.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v2: Add 'Reviewed-by: Dmitry Baryshkov'
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> > index acd6075bf6d9..f43823539a3b 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> > @@ -2298,6 +2298,9 @@ static int qmp_usb_probe(struct platform_device *pdev)
> >
> >  static const struct of_device_id qmp_usb_of_match_table[] = {
> >       {
> > +             .compatible = "qcom,ipq5424-qmp-usb3-phy",
> > +             .data = &ipq9574_usb3phy_cfg,
> > +     }, {
>
> If the software interface is the same, can this just use ipq9574 as a
> fallback compatible?

Generally I'd agree here, but as PHY tables include not just setup
values, but also platform and chip-specific tunes, I think it's better
to have multiple entries rather than having to cope with the possible
issues. The only "fallback" compatibles that we have are qcs615-ufs ->
sm6115-ufs and qcs8300-ufs -> sa8775p-ufs. Thus I think it's better to
stay within the single-compat model.

-- 
With best wishes
Dmitry

