Return-Path: <linux-usb+bounces-12027-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0821E9289F5
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 15:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B21B228286D
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 13:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F0B14B07D;
	Fri,  5 Jul 2024 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bpWpiZWt"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A45314B973
	for <linux-usb@vger.kernel.org>; Fri,  5 Jul 2024 13:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720186949; cv=none; b=i6NHtzpDuoH9oe+JDloNAqrgC5ezWXzllvehjDpvKznN9lJbcSYfXo8MFGbHv+RUb0rl6dk9fFZg80xtCjpqV/0IXMUdXRvay9eYj9kQVWdF9RNKmusyLJo8eG12sGznVNQRxXuZC/zzj7ssIez41FjE4yCJcaWZSodEC5mvWMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720186949; c=relaxed/simple;
	bh=xAiLtazfBXSZFhUCuJv5iLA8GUS2Erahe3O/6nbCjGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB+QFOeYb99vvprnMbBvGiSkQ0tlgPnB0joCiyDWI/ELeIVcP9Q8TtEVAufD39HLp2kqFLeQJHOQBBuUp8kaHLJaKkZq+mlCGGrjY7IRLvo8bOZl0gqREit+kt1/iNasOD+mRpib8osGdGrHWm5agtorCjc18uDXMHNPW5ri3I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bpWpiZWt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720186947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lNWQiXa5WTonO6VnFXHoZW4uvs/niJejriJYafDuJeE=;
	b=bpWpiZWtGij1UUtfdU8lo/VBPlZfJZBgH5ziz7t0RvheZGq/0IgI/1AS3c2TAMF6Ivp+yZ
	siXFJZMR9y4pIWaaRPvJEePB0u4N/HkuekY66gXr00j9aCtjCUNjouYubmr9RdTtAqNFMj
	JcxJ+Kog6hrcDU48UmIjUmN+P3ob5d0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-aJY9ZQvUNh2BSe8hmsOOEA-1; Fri, 05 Jul 2024 09:42:25 -0400
X-MC-Unique: aJY9ZQvUNh2BSe8hmsOOEA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-79ef8e8387bso76471985a.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Jul 2024 06:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720186945; x=1720791745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNWQiXa5WTonO6VnFXHoZW4uvs/niJejriJYafDuJeE=;
        b=qxWOSyiqw2PM+eUND2dDkzNibQ8Tn1ysuBrVM559sYU6xzbxpgGqrPDrgdc4IAybzX
         8tH9pJ8yUBx2Lb58SD6oBbHOXbuX4dHr3oNIZJEh0AaUsYan2CbPTsC4AolKrnKw4zOP
         t26bfELuNnRErv7vD4EtNpacGvSGcQYbCdiNeUqFdIuKzfFYknLSBMAhVhsvC/cCviDO
         TpVSvhH/VJM/VtLJyWzJealP92cZYSPM9SI2V4uGiiNY2ES7Q2yfvGkcL0J9skvrbTOJ
         vqs3HKiysfbo+BHwu9lfVc/zaAD0AFOwBAPFgdmNYBjbBk1m88N2/LNrSnfzr5gemo8Z
         I2gA==
X-Forwarded-Encrypted: i=1; AJvYcCUyYapgEefjkYE9o02n33Ej/Qy848bAf3A7Yz7Z+dlOS5GyXqBYNdaPMa/E9QCyBIP8rq5V8vVDeq04ZO3qOy3TXPoCwGkzGndR
X-Gm-Message-State: AOJu0YwG00BqEy5dT4xATYidbPKzpf+kfdmR6NK7QwfBMR703PvmOKkk
	XcD/J6/VyQW2pQRRlA4EQR+EhXORdXFZ5Lt6fzclESd9ABbVjbknLATgoAYxtMwCqRz/GPcgwJs
	W16JzemNzXMSU1ACRFqsq3XhwYEFE7gcz30pHLLHscpLCSGSrIUYy5dUmGw==
X-Received: by 2002:a05:620a:13d2:b0:79d:7e5a:d044 with SMTP id af79cd13be357-79eef4c0f06mr737795885a.28.1720186944973;
        Fri, 05 Jul 2024 06:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzRoLCo4GeRRFCdesL0t0J6Xc2rhP3ZGCRDtPGGaxotQxYNzT1wzmgDzK5ccFskQ+43Nbdxg==
X-Received: by 2002:a05:620a:13d2:b0:79d:7e5a:d044 with SMTP id af79cd13be357-79eef4c0f06mr737789985a.28.1720186944583;
        Fri, 05 Jul 2024 06:42:24 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d69299b81sm773174785a.71.2024.07.05.06.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 06:42:24 -0700 (PDT)
Date: Fri, 5 Jul 2024 08:42:19 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	djakov@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	jassisinghbrar@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	manivannan.sadhasivam@linaro.org, will@kernel.org, joro@8bytes.org, conor@kernel.org, 
	tglx@linutronix.de, amitk@kernel.org, thara.gopinath@gmail.com, 
	linus.walleij@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net, rafael@kernel.org, 
	viresh.kumar@linaro.org, vkoul@kernel.org, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, robimarko@gmail.com, 
	bartosz.golaszewski@linaro.org, kishon@kernel.org, quic_wcheng@quicinc.com, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, agross@kernel.org, 
	gregkh@linuxfoundation.org, quic_tdas@quicinc.com, robin.murphy@arm.com, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	quic_rjendra@quicinc.com, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	otto.pflueger@abscue.de, luca@z3ntu.xyz, neil.armstrong@linaro.org, abel.vesa@linaro.org, 
	bhupesh.sharma@linaro.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, 
	joabreu@synopsys.com, netdev@vger.kernel.org, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, krzysztof.kozlowski@linaro.org, u.kleine-koenig@pengutronix.de, 
	dmitry.baryshkov@linaro.org, quic_cang@quicinc.com, danila@jiaxyga.com, 
	quic_nitirawa@quicinc.com, mantas@8devices.com, athierry@redhat.com, 
	quic_kbajaj@quicinc.com, quic_bjorande@quicinc.com, quic_msarkar@quicinc.com, 
	quic_devipriy@quicinc.com, quic_tsoni@quicinc.com, quic_rgottimu@quicinc.com, 
	quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com
Subject: Re: [PATCH 29/47] dt-bindings: net: qcom,ethqos: add description for
 qcs9100
Message-ID: <gt35pxlulfowpbca3sb6nf5ble4lhq3kolmjyc275vtdcmeixx@gkctewz6tbwv>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
 <20240703025850.2172008-30-quic_tengfan@quicinc.com>
 <u5ekupjqvgoehkl76pv7ljyqqzbnnyh6ci2dilfxfkcdvdy3dp@ehdujhkul7ow>
 <f4162b7f-d957-4dd6-90a0-f65c1cbc213a@quicinc.com>
 <add1bdda-2321-4c47-91ef-299f99385bc8@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <add1bdda-2321-4c47-91ef-299f99385bc8@lunn.ch>

On Thu, Jul 04, 2024 at 06:03:14PM GMT, Andrew Lunn wrote:
> On Thu, Jul 04, 2024 at 09:13:59AM +0800, Tengfei Fan wrote:
> > 
> > 
> > On 7/3/2024 11:09 PM, Andrew Halaney wrote:
> > > On Wed, Jul 03, 2024 at 10:58:32AM GMT, Tengfei Fan wrote:
> > > > Add the compatible for the MAC controller on qcs9100 platforms. This MAC
> > > > works with a single interrupt so add minItems to the interrupts property.
> > > > The fourth clock's name is different here so change it. Enable relevant
> > > > PHY properties. Add the relevant compatibles to the binding document for
> > > > snps,dwmac as well.
> > > 
> > > This description doesn't match what was done in this patch, its what
> > > Bart did when he made changes to add the sa8775 changes. Please consider
> > > using a blurb indicating that this is the same SoC as sa8775p, just with
> > > different firmware strategies or something along those lines?
> > 
> > I will update this commit message as you suggested.
> 
> Hi Andrew, Tengfei
> 
> Please trim emails when replying to just the needed context.
> 

Sorry, I'm always a little guilty of this. In this case I didn't trim
since the patch was small and trimming the diff out would then make it
tough to see how my comment about the description relates to the body of
the patch. But I'll try and trim when appropriate. Just replying here to
explain myself as this isn't the first time I've been suggested to trim
more aggressively and I don't want folks to think I'm completely ignoring them.

Thanks,
Andrew


