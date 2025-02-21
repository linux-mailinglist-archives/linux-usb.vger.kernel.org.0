Return-Path: <linux-usb+bounces-20907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A71DA3EB81
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 04:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32BC817C3E1
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 03:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238318633A;
	Fri, 21 Feb 2025 03:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MdoQ+p/i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90631D86F2
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740109743; cv=none; b=bjA5t3MDPoEBWL1gftFvGXiX39v48sp2OPXaeUmqXGzhqPCOufjWibnCUNIEexp57nGUUnuO/9TJXZnBuQ/wtsc0BZmy2/zDURUfA+X/l7L1JPNq1k2fqByCyJVcq+llWyeivhgMQqspD+TpCxytqaQYdm1bq24vjCgn4SmFAr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740109743; c=relaxed/simple;
	bh=xhkT06minOaTkf8wZ6rirZdUYd9gm7Mgu2p44K15dwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIXcURBJBbRjx5H6XrZkhSgxu8PpgSbxqCkCK9Trm970cr7Xry/Y0uhhdXIMy9QpetegJoi5xTUwtrseDYCUJB946iFF0I9IVtbyEJuV8oNBZE5bjvWL4gMxTFB+174h03r0HuWxZkMNKvZ0MsF+RfKax5O2TP23/Qi2oGJIM4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MdoQ+p/i; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30a2d4b61e4so12361311fa.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 19:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740109740; x=1740714540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d1AVackadfhPpCMLLKH7Bg03NDXVVtj9z1+w6CdVYcg=;
        b=MdoQ+p/iQ9vKLQkrdK9sFWKd4/s2MOutj1kVIEmpH1cv2D5+Atd8uSChsczYHcHPXg
         eqRsEHgXyrBurIi/ykiG53e/BkkKmWk6qgiB3/CQpwaemfJkOMvvWBeHzTyuiAhrj7j6
         QDGucE/XgdwBYMuGKHcd9mp7W6MyAnmjwqzYuljutIIVLqogTLEtsU3eryC6Ut7NlUU5
         4Pozun0i7yqCNny32k8wZ+WjnEt1NIR8u6kh0GoD4yF5K5F9HTBgEmiFWq2TDlhtRPLF
         eCNvMJoQkasQlkHyZgZBcimeUutfPOhfprp9Qsq4GqVhmKZs89pMBlVXhJ1MsszaTra2
         nPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740109740; x=1740714540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1AVackadfhPpCMLLKH7Bg03NDXVVtj9z1+w6CdVYcg=;
        b=Ka7EHbCFFKSfttrhJCghZO1KZTASuOm0x6auMImrV6nauSoWbUyrkO0v4GE8tijaRF
         Xb9SJAQoqBY5/kB3HZq8jp6guShyRjEj37yMiim6XhlbzIxGG3ck4Irf2XiXuo1DXEDs
         yd/AFMKVu+de9Jeo8VKUxzsfBNd8IU1zVOJsN+abpC8020cnNIlBUxQ8+rNobJmhygwk
         yzwKdcdh7Uv9deSIuUx9fys6r/CU204reeXQHSQRY6cmrkPsK7F2TszGll2kW5ITGseM
         mod8owrQBXiQiumGaqErsmoQGkhl8/9TtP1Y1k7bINh1sqTUUHfPjXABCWX6+C4RH31V
         W7PA==
X-Forwarded-Encrypted: i=1; AJvYcCVbBzDHLFKTghTdFSJEB8xQXrzdbqgmqq/lsZoVnbeDkRX8qXWRrUZEnx0N1rds/fyGzISwi+qPsLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcOyaqv6P+r/HnIp+00q9tnQ5Pl+aaRtujlG68QlRXwHONycB1
	HqnSKhhKVhUj61dU47JZ2P3xf7s7uvSmt3SZXZXoBmMd/boPOt3X6p6SHk1LMZo=
X-Gm-Gg: ASbGnctvMw0dzCjWxrYyV8tan3cLxSYKFGLEvID7NT3SgsqZ8hep2DYBI+naiDvrQ8G
	yFPI18PbTOAYwlOF71/fcKuNumYvUyto41SKLsBBADDZf/Rwht44T/b2HbHt5MSkZvL4xbSP0zx
	8a7pASlRdWd2VsWT4vW4kHE4+opGPCAoLuorcAcNedUm/upBqFbHw2ISJGSi+4zToKmQPIsGjNN
	NU2UTNfQvFmJFa1FNP+kQsBivqoLBEf67LixdYa3/+b3UdHSBWe4uM4D7gf4+NCvej2I1zAQdnp
	+dxUPEpzxTkjpxsLtusXPXZ5KHNVKN3gSFvJOvYWbkn3anRCLbXaZ28uH2wB3QWxeeafo3iiZ8z
	PhJjf6w==
X-Google-Smtp-Source: AGHT+IGHQWaI+wsylt7S3+XMOx8A5/5l6dC9pJ61ZYifwIoKtpegMA7wiwgbweb1ZJRIrUmonpuh9w==
X-Received: by 2002:a2e:2c11:0:b0:308:fedf:8c12 with SMTP id 38308e7fff4ca-30a59858cc9mr4238971fa.5.1740109739700;
        Thu, 20 Feb 2025 19:48:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a29ab47adsm16752891fa.97.2025.02.20.19.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 19:48:58 -0800 (PST)
Date: Fri, 21 Feb 2025 05:48:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Message-ID: <p6ytfgzhcyqzmc3elxkpi5m2sdp3aweladrhzvtwpjpot5jh4w@nbjsg6jumc3s>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
 <a42wtus7y72mt5adklbwg2hjbuayxkeucs7t4xuzmxyag2mx7b@6wlsomzj4gha>
 <a1dbb65a-d437-46e1-80ac-8dff3c97b81c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1dbb65a-d437-46e1-80ac-8dff3c97b81c@quicinc.com>

On Thu, Feb 20, 2025 at 07:16:44PM -0800, Wesley Cheng wrote:
> Hi Dmitry,
> 
> On 1/14/2025 2:12 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:52:08PM -0800, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> >> binding definition for the PHY driver.
> >>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> >> ---
> >>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
> >>  1 file changed, 84 insertions(+)
> >>
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> >> +    #include <dt-bindings/clock/qcom,rpmh.h>
> >> +    #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> > 
> > This a typical comment, please actually update your internal
> > documentation: don't use GCC's and other clock controller's bindings in
> > examples for other blocks.
> > 
> 
> I can see that other examples also reference bindings from external
> drivers, otherwise I think it would throw an error for not being able to
> find the parents in properties such as, resets and clocks.  I tried to
> update my dtschema to ensure that this failure was not missed.

Just use ephemeral nodes. Instead of <&tcsrcc TCSR_USB2_CLKREF_EN> you
can write <&tcsrcc_usb2_clkref_en>. It is an example, nothing more.

> 
> I checked and made sure that no errors were not seen, so I started to
> wonder if maybe when this series was submitted the qcom,sm8750-gcc.h wasn't
> yet present on the kernel tree.  To confirm this, I removed the
> aforementioned header file, and got the same error/issue.  Now that the
> sm8750 gcc header has landed upstream, I believe that this error should be
> resolved.
> 
> Thanks
> Wesley Cheng
> 
> >> +
> >> +    usb_1_hsphy: phy@88e3000 {
> >> +        compatible = "qcom,sm8750-m31-eusb2-phy";
> >> +        reg = <0x88e3000 0x29c>;
> >> +
> >> +        clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> >> +        clock-names = "ref";
> >> +
> >> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> >> +
> >> +        #phy-cells = <0>;
> >> +
> >> +        vdd-supply = <&vreg_l2d_0p88>;
> >> +        vdda12-supply = <&vreg_l3g_1p2>;
> >> +
> >> +    };
> >>
> >> -- 
> >> 2.46.1
> >>
> > 

-- 
With best wishes
Dmitry

