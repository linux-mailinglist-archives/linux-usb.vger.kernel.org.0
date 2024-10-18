Return-Path: <linux-usb+bounces-16409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 341739A3BFD
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 12:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4A451F221EB
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 10:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68FE202647;
	Fri, 18 Oct 2024 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBRPAQEO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18CE202631
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 10:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248549; cv=none; b=aNRkZc45Z7V8TPjPEzFStudNFLzLsrryrGziCe5J0A2+zDl8pfzFCcTWFUo5E2DmcsxXCFTTqLyudpXK+zo/7QY0k9S3taHyeV40cAkZWYSt07RFhEd3cphSNAazO48YKSQqqqheR8xQ0kTfuwT13rNRk+7+tyyDN4EHkkVp/S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248549; c=relaxed/simple;
	bh=wr1iRFq7iN4x+9pRN12+7fDUIC9HMcj38lG/hyXOCnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EI+sOaBPx8QtvSaoxULCvpC53OPmDk2SLZKQ8RV/rWwB7o13ebHablJs5w4A2u1ninzEooAMJJyghguQuF/rvgE+YniE/RDp96rl0jgZ93UNTSeQeyFBPojR8oL6/+yhSaPBQXrZYz4WDupATWROGnWNgq7y0p6wwF8/aQ+c/B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBRPAQEO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fbbadf83so2577488e87.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 03:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729248546; x=1729853346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gNtj1520nO/dJZLvoCXMLAGQoHCtBOdOq7yx+2L3fGM=;
        b=RBRPAQEOlVUOg5dOsofpTnDUjeIWwW3R7i5yYFQ0EI/DIgN34Zzg81u9YAmXY6+snp
         yIYxVI0CRrEeoAIL+tnzcdbZxslNcFQlQekUGwZibhVPhhpi/TlkVG5/y1bNK6lSP3Kr
         /gU9Le/6q+pRHHazNG5tnw1DHZ2rzl63lCeFHhWTXouEqu2utA4rYwG9PJVhE4VZh/f3
         LgNf06CtzTMXzkC2MU7XIEG53Rv8WBidCJaNS5B63W/6Y2JH8Mt1CbeLkoM54L8QSn4L
         jpY7RTZG82ciP92Ozz2BeXqcKgXnSfxs31m3Br2D+0/sQRhYZMsfP0mVEUA4fy5TvLnE
         e6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729248546; x=1729853346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNtj1520nO/dJZLvoCXMLAGQoHCtBOdOq7yx+2L3fGM=;
        b=JF+LhtWvmf15+Irc88jJCwJnYCf1XbZ0F8ov0V5FKMO7WJL+xVfGPqTcWPJU4eO/zX
         zmf2ilwFajtHJIlj9/ZewB0Ul9qymLB9jygTraLN4dcyvgxmqdUv/ku9oV82PXXxHKWh
         +IYg9/Nov3FjHmdO12+TtHU2DKRex7eokOOtTciKXryi0xelCwVjv6I8pzkWHpSThWdg
         WYG7RytL3abiN0Ev30qWMVQ0jEvFCZuXZeSN6TMkPtvle4yHNaY0iIkvbxGZbGMme/O1
         r+hEfjF9AIb8AA7JTEeYzpdA8wxDLxZqLmupnOjFxiru8ur5EgeDA4axme9viFJS9pVv
         sLNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxJAVR/vYpLRI80uHp0Ae4wNJN185xFfPXADzqyESt/koW+GfdqjILj5F460xm2sIXPboljfjao54=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZ++FCNpDSbs8CzknOrutjkHqsAm5y2tFNJIcArevR426QZvL
	9p73CimKoZCnjmFoUkmBQwjpQPEzf+frZyYm1nagF15QnpVWUkLcJH3FOE1azR0=
X-Google-Smtp-Source: AGHT+IHE+iZFyneUUs1Mw89eQrR5BtWwMErFKT+LuOvyRT6hNtiWczLi1qhZhpeMOJbbPBh7L5Fw0w==
X-Received: by 2002:a05:6512:398f:b0:539:f2f6:c6fe with SMTP id 2adb3069b0e04-53a1545ddeemr1184531e87.16.1729248545189;
        Fri, 18 Oct 2024 03:49:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a1520482bsm184384e87.239.2024.10.18.03.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:49:03 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:49:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 5/5] phy: qcom: qmp-usbc: Add qmp configuration for
 QCS615
Message-ID: <7fbr744shxfk4rf5k6izjs43lyd4suraznsdib5uanbwcll322@446iulvtwokd>
References: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
 <20241017130701.3301785-6-quic_kriskura@quicinc.com>
 <CAA8EJprcOU6qeJvHH+MVoPnQ+mGcos=pDOVBSeSUfBGw-KR6tA@mail.gmail.com>
 <aa68e5ab-86a6-430e-92d8-ed89b4eb37f7@quicinc.com>
 <CAA8EJprkq-Cct9Uk1Jwqc5Rn8mx8THTRgwCzDx=8ZgbCpwD7qw@mail.gmail.com>
 <684582c3-3559-4c54-8257-cb952bbfe2ec@quicinc.com>
 <l4wpt5qin3ezkowf3puvodrm5wjsptd4a32f4qrzcuuquo6kq6@j2orv5z5quln>
 <479f7aa2-0401-40d5-8e2f-d7512aeab0c0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <479f7aa2-0401-40d5-8e2f-d7512aeab0c0@quicinc.com>

On Fri, Oct 18, 2024 at 03:53:22PM +0530, Krishna Kurapati wrote:
> 
> 
> On 10/18/2024 3:41 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 18, 2024 at 05:01:48PM +0800, Tingwei Zhang wrote:
> > > On 10/18/2024 4:06 PM, Dmitry Baryshkov wrote:
> > > > On Fri, 18 Oct 2024 at 10:48, Tingwei Zhang <quic_tingweiz@quicinc.com> wrote:
> > > > > 
> > > > > On 10/18/2024 2:27 AM, Dmitry Baryshkov wrote:
> > > > > > On Thu, 17 Oct 2024 at 16:07, Krishna Kurapati
> > > > > > <quic_kriskura@quicinc.com> wrote:
> > > > > > > 
> > > > > > > Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
> > > > > > > 
> > > > > > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > 
> > > > > > After checking platform details,
> > > > > > 
> > > > > > Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > 
> > > > > > Please perform global s/QCS615/SM6150/ and s/qcs615/sm6150/
> > > > > 
> > > > > QCS615 and SM6150 are different variants of the same SoC. QCS615 is an
> > > > > IoT variant, while SM6150 is a mobile variant. We are currently adding
> > > > > QCS615 SoC support to the upstream Kernel, as it is in an active
> > > > > development stage and we anticipate many products based on this SoC. On
> > > > > the other hand, the SM6150 is an older mobile platform that is unlikely
> > > > > to be used in new designs. For a product introduction of the QCS615,
> > > > > please refer to
> > > > > https://docs.qualcomm.com/bundle/publicresource/87-83838-1_REV_A_Qualcomm_IQ6_Series_Product_Brief.pdf
> > > > 
> > > > Yes, I guessed so. It would have been nice if it was documented this
> > > > way from the beginning.
> > > > 
> > > > Please note that we usually get support for the mobile SoC first. So
> > > > in most of the cases devices use mobile compatible even for IoT
> > > > platforms, see qrb5165, qrb4210, qcm6490 and other similar platforms.
> > > > I simply asked to follow the established pattern.
> > > 
> > > Yes, we start from mobile variant for most of the platforms. There are some
> > > exceptions like sc7180 and sc7280 which we started from compute variant
> > > since they are widely used by compute platform on upstream Kernel. I think
> > > we have similar case here. QCS615 will be widely used by IOT products on
> > > upstream Kernel. We should have clarified this from beginning so there's no
> > > ambiguity.
> > 
> > After offline discussion with Krzysztof, I'll lift my objection, so
> > still Reviewed-by.
> > 
> 
> Thanks Dmitry.
> 
> Can you help review patch-4 of the series. I made the changes you suggested
> on v1 (uppercase to lowercase and removing un-necessary re-inits).

done

-- 
With best wishes
Dmitry

