Return-Path: <linux-usb+bounces-20751-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A904A39715
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 10:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47F6A18870F5
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2025 09:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF70814A614;
	Tue, 18 Feb 2025 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jO5KWb97"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902A232364
	for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2025 09:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870828; cv=none; b=WN0p6vQLm08OL3cOZZpjQnkJ4ewcLP0PxU061M9jG4xznwoyo5rnVQkxqiB/edWaMGHNgrYDRcJ7xPyeGyRllPNkNPT6gXBbhlyNWatY8bgG7hCKqkYbt9rJRR55ccCSW1sWmu9gArrenObOGpKjiyEqm7Zc0NQRJFp45LDLIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870828; c=relaxed/simple;
	bh=MriLzKzAAEIyF0n21wSKbavIuTWQW69OLGHxVTJ12Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ylvm8jq9nxzTQkIj4rRZuOMxAHX4mJmcwXUYo0MVr/iuqjlR6/Kr0D0wghF+y1iY6USlxFJmUJmFntJwyE6VfeBys8Tga1Oy3vpSZXTxKl+sD0kGL01799Blzf2Ndi5eAjg7a/dis+GkpdT8KggnZB6EaJXTL6BUci1gxYcRkf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jO5KWb97; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so672607266b.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2025 01:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739870824; x=1740475624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8BhUxzH6oEqhcLF8JGu78MOnEz5ur1uVJcS1EtL5slw=;
        b=jO5KWb97uNFlKaKdO3gCGyzxwWn6d60ZrDDylBIGmg6zk4Raig/ZmiqmUTnsTmZ1Xb
         z6jGxi8zvUmgmHTH0vTBjJVmgilWJV1eAAp3tHdipjXSiYdBHlZf6cBAkXgF2SZ+Ef36
         3YRCKa/dDS1Ky0ScUTzRTIwZ9Wf8hk5mDEFOJWl5FUduf8xmLbCjqYOhZpkU7Scf3VOG
         /u0xU70yLGkMEa3wUPv4FAUfgp0h2O1BhIcqk9k4C4FWXn0d6kB6Cu/ga6jHNGWGUqhS
         /7Drs2TiuUiAERjaWFM32sd2Q49uIvqQnI+zwl1houZhNqJdEvTlU0UrGpcC9MQm8b+F
         KGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739870824; x=1740475624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BhUxzH6oEqhcLF8JGu78MOnEz5ur1uVJcS1EtL5slw=;
        b=WMeAL65hVMn/fC+sBpg7vhPRdOFqxLg/5/bixSVWjbjQpXNq2fafz+TYVcMOtAhApH
         MHhM3r4JC9sxLnij0AZpNuetOC8N+MQm3t21mD0igOKFx6I8KnvV65+eT7znjIQ7zVS1
         xzUTtfsZ2AucV3mQlNnNYzMU/H34fV6CLCmfxt8uoyWYMTEQ2Om3KQihgOloSDShwkDC
         5ncMGSplKY9oUTyMW7zu23GnBhbTPpCOA+sAwUgpuRV/uRHO3Ex7nLsPV6opcR6oP6ta
         IdRHbnJrxh93T2UyCXfG6bTDYZm9+c5KxlUDD5V/jHsSRXaNy2xb4RfIDg0kHZhyWrkO
         hOMw==
X-Forwarded-Encrypted: i=1; AJvYcCVb8Y/F5teWwQ0QOv6NrPy0X7M6M30dxOfZRih+pMmL5veicyr7O+cS5TMmBxjqQA3WcLzP/TKrCZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHCuxEep/rg2SAQ6YROMq0034grlsFat7Nhk+pPyQGHEC6fyA8
	CaYyuMqfBCBWKk/c6bY2lt78T/0ZvuioL+nxcNwLSmBncBSH/BFKNpz+63dDUro=
X-Gm-Gg: ASbGncvsNlF7/G7HTa16Azo8+Z7N1vSTwZrlokbwzeEl2cqj0uUF/Yyz9oiCIrQmj/N
	uRz5Hi9Oe5T3+Kr3ipNRq9cFy67WbwS+/1q/bjWSTp3Cr1U5ok7PxgWBw8+7fs355Yr7SScgyYp
	/j8EpZ+U7LnswXc0kIKkcmt5P6uYs56P60p9b/9504KozPyi9Fm7rEQ8gRiL+I+jcg3+UmuYwsT
	cRO34nhrocqbXe7bJEc/V34N1x1QFUHYQmfDJZtdusC1mrXhCFDdzlA4nbaiemOJ8Lv+jGpncU7
	daagGixCKU+iQpHj5czaeEh6TAk=
X-Google-Smtp-Source: AGHT+IGjPWmulA6Wm4cfnS6vwEaBjcuzifQAXHXx0FB+cG+S71ZxSZy2T1iZVOVPgEyId5cZUv/+tw==
X-Received: by 2002:a17:906:4794:b0:ab7:e8d6:3b12 with SMTP id a640c23a62f3a-abb70a958eamr1318865766b.1.1739870823557;
        Tue, 18 Feb 2025 01:27:03 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:202d:2fec:52ff:5dac])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbb0fb63ecsm151544466b.115.2025.02.18.01.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 01:27:03 -0800 (PST)
Date: Tue, 18 Feb 2025 10:26:58 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <Z7RSYqQx72v-sPSt@linaro.org>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
 <20250206-x1e80100-ps8830-v6-2-60b1e49cfa8d@linaro.org>
 <Z68EUTlHcm6TxjlY@hovoldconsulting.com>
 <Z7Q8xwcfeE3tcBLL@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Q8xwcfeE3tcBLL@hovoldconsulting.com>

On Tue, Feb 18, 2025 at 08:54:47AM +0100, Johan Hovold wrote:
> On Fri, Feb 14, 2025 at 09:52:33AM +0100, Johan Hovold wrote:
> > On Thu, Feb 06, 2025 at 11:28:28AM +0200, Abel Vesa wrote:
> > > The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> > > controlled over I2C. It usually sits between a USB/DisplayPort PHY
> > > and the Type-C connector, and provides orientation and altmode handling.
> [...]
> > > +	/* skip resetting if already configured */
> > > +	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> > > +			     CONN_STATUS_0_CONNECTION_PRESENT) == 1)
> > > +		return gpiod_direction_output(retimer->reset_gpio, 0);
> > 
> > I'm still a little concerned about this. Won't you end up with i2c
> > timeout errors in the logs if the device is held in reset before probe?
> 
> You should be able to use i2c_smbus_read_byte() to avoid logging errors
> when the boot firmware has *not* enabled the device.
> 

FWIW, regmap_test_bits() doesn't seem to print any errors either, so I
don't think switching to i2c_smbus_read_byte() is necessary.

Since I was curious, I tried booting the X1E80100 with
 1. One PS8830 instance left as-is
 2. One PS8830 instance changed to invalid I2C address
 3. One PS8830 instance changed to have reset pin asserted via pinctrl

There are no errors whatsoever, even for the one with invalid I2C
address. In other words, the slightly more concerning part is that the
driver doesn't check that any of the regmap reads/writes actually
succeed.

The diff I used for testing is below. (1) prints "skipping reset", (2)
and (3) print "continuing reset".

Thanks,
Stephan

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index fee694a364ea..1f8d61239723 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -1010,9 +1010,9 @@ &i2c1 {
 
 	status = "okay";
 
-	typec-mux@8 {
+	typec-mux@42 {
 		compatible = "parade,ps8830";
-		reg = <0x08>;
+		reg = <0x42>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK5>;
 
@@ -1673,6 +1673,7 @@ rtmr1_default: rtmr1-reset-n-active-state {
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
+		output-low;
 	};
 
 	rtmr2_default: rtmr2-reset-n-active-state {
diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
index 10e407ab6b7f..04ed35d14fd6 100644
--- a/drivers/usb/typec/mux/ps883x.c
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -370,8 +370,12 @@ static int ps883x_retimer_probe(struct i2c_client *client)
 
 	/* skip resetting if already configured */
 	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
-			     CONN_STATUS_0_CONNECTION_PRESENT) == 1)
+			     CONN_STATUS_0_CONNECTION_PRESENT) == 1) {
+		dev_info(dev, "skipping reset\n");
 		return gpiod_direction_output(retimer->reset_gpio, 0);
+	} else {
+		dev_info(dev, "continuing reset\n");
+	}
 
 	gpiod_direction_output(retimer->reset_gpio, 1);
 

