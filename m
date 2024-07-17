Return-Path: <linux-usb+bounces-12252-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8B933F61
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 17:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18EB8284C4A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 15:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14143181CE7;
	Wed, 17 Jul 2024 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="utHiNNVN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E8A17F4F1
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721229326; cv=none; b=M8qIjQM80BFGdGCzm6T/E4RnWeDpoKZoo2S2du0RoO0EtvccpZ9NFOaoNaKhOtXylBF1viSuVae+Z9S7juPZTcmRWfipLFspU3lV5BFV1vrZEQxhAoUeORtpNldysorzZ0RK9Cydv2lLUID9HQTv1tzhtZP/4NzvyCtqofUzvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721229326; c=relaxed/simple;
	bh=+6h+uoCC6ecRahffc4o+OWUG2/gvSp4Q0jZz2hWIoKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNSyNZR09zt/DcFTmiMDSgZzz+Xxfrjqg3s5tuiYWjGGCDQqbos/CnDOpb9AKBvRHyxuWyeUduluTbaQJd5jUz8MEHSaTnoKZ29K9sFXtn8jZKd3SfcnNbYh7i3n0QhnSfUtI+rTy+W2LswPHiJCojPs7xVWp2WTrKEaEKSjyT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=utHiNNVN; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so7653942e87.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721229322; x=1721834122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KpIRTuJDSCxod/Onaz2pIZfESLPtdGiWZKWdvFkOVHc=;
        b=utHiNNVNDI+JuPkect+1woWeZ0DsEC2UOj4Rj3/UWZr9tgQtk0KihWum5nofAlJR+J
         ZT3wW3fx01lIOe9DbjiY5MMdRwaM/qbfyRsYc+3fGY3V77M5XAJE0aqYid+4EDFOAe0w
         E2XMKlnLwsn2YmvmWMRMxn41uJoUomCy5fqBKBCelIbmQttBXr7KOBTgJurBC2Nw66Za
         qZrcDJgbLiuCQOlplRct+SBbTOyE9/y4kg809OmK/6V0NCseKpUg5DRYX4P1WLXlBt2r
         ZG4bXKxZNGntVNyb3cPknxvqTBAsKXlM+j66LHdhJTxhWnsJZ23UaZdb2IeWrzQKRvxU
         X9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721229322; x=1721834122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpIRTuJDSCxod/Onaz2pIZfESLPtdGiWZKWdvFkOVHc=;
        b=DxYjc29DbHhMD3pbtguZdHyHQXnpdEYkwszDlcRqMix0riULIYlbjG9kQHX6/F/WA5
         DdYv4WsS9ZqrpXQSgDFilJlRVYsXhwrz53f0fvY6/CREVsq287utMUED3l+AM43MIGLf
         24XOQ7MkZPi9IKwMhIDjJIzWgSXExIAsb9a0F7S1Thw3CT6km9Gw+x2qCTrpLKpg10Gv
         D6HyL6aqP6U4giH1aO1fBLrB0VFzts4pkAWIn1G+kwTlGI760xSyw1eLPcV0EZP5jghM
         oX7lMQwL8V1SFMYo7hegdjnFE3x5gNxa29YJ9BPAoAqkQyBp8AGfKxtzdBSKx4vxv6Rc
         cAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJC2Px9gg/bJ+h3IrLHgqoUUGtutcfVg0YCmHkUC02f5GwJEoIT73ZlywM0PE/dGe7wIZ9/vBbTpfSVNXK73qnMz2sZzPjkRrS
X-Gm-Message-State: AOJu0Yw5hiNhtTA7rwQrqrJRddfzn2lnw6pGLvpturG7GP4/5JeaPcyE
	qU0lbGS+/P7TjGKFqJ2yOUogQSIttwwhz38fYfDh7M/5UX0fEMlBtxG6k64r1PTZtk+ICWp4qLh
	g
X-Google-Smtp-Source: AGHT+IGK5/cIA7lUzPTSuIt0sTisGdUdeww47gAgu/jR81KTPuWynbwJ56cEpHr+zkLay7ST0RQ2sQ==
X-Received: by 2002:a05:6512:23a2:b0:52c:9e82:a971 with SMTP id 2adb3069b0e04-52ee53c3f3fmr1541722e87.7.1721229322039;
        Wed, 17 Jul 2024 08:15:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed2532113sm1503972e87.187.2024.07.17.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:15:21 -0700 (PDT)
Date: Wed, 17 Jul 2024 18:15:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
	gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, quic_wcheng@quicinc.com, quic_kriskura@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5332: Fix interrupt trigger
 type for usb
Message-ID: <b7udcnmseh4lnc5giteu7qyssxtxkcng5ivfkt3g4mupb5zcn4@f4rsh4motwih>
References: <20240717094848.3536239-1-quic_varada@quicinc.com>
 <20240717094848.3536239-2-quic_varada@quicinc.com>
 <442956f4-ca5b-4ff8-bc02-bcad4dce50e9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <442956f4-ca5b-4ff8-bc02-bcad4dce50e9@linaro.org>

On Wed, Jul 17, 2024 at 11:55:44AM GMT, Konrad Dybcio wrote:
> On 17.07.2024 11:48 AM, Varadarajan Narayanan wrote:
> > Trigger type is incorrectly specified as IRQ_TYPE_EDGE_BOTH
> > instead of IRQ_TYPE_LEVEL_HIGH. This trigger type is not
> > supported for SPIs and results in probe failure with -EINVAL.
> > 
> > Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> > index f58fd70be826..56304f996dbf 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> > @@ -322,8 +322,8 @@ usb: usb@8af8800 {
> >  			reg = <0x08af8800 0x400>;
> >  
> >  			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> > -				     <GIC_SPI 53 IRQ_TYPE_EDGE_BOTH>,
> > -				     <GIC_SPI 52 IRQ_TYPE_EDGE_BOTH>;
> > +				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Probably worth asking, is there a MPM/PDC on this platform?

Judging by the vendor DT, there is none:

https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-files/-/blob/NHSS.QSDK.12.4.5.r5/arch/arm64/boot/dts/qcom/ipq5332.dtsi?ref_type=heads


-- 
With best wishes
Dmitry

