Return-Path: <linux-usb+bounces-10624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C501D8D16DA
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 11:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00ABD1C22A49
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 09:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE47213D89B;
	Tue, 28 May 2024 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C/90mX33"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC79A13D29B
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716887105; cv=none; b=BtjltJDZVXwf7G39VuUeWP+gwwMpDevSXa5WAx4T3G01qzvsgIzcKLWo2hb3e8QE5rEFLQ8i+qJz+qc1gGlqtsIZSh373oPOoAmOBiktSf0gcjDg3Ql2KjXpPIcK1koVGtKK6wswWEGwKqcR4Y8QIInlmvpIXjCZnvOzXAujwp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716887105; c=relaxed/simple;
	bh=ou2nPJXswciglO/60bjGMxpgyoL9GXfxVJshaAaHVbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uctqt02C1n8jf7/IdzQynVKDPLcXjeSAqgOnSPm02WCyWaxlo+MmEtkV+FjDI2eOki8PsV6ZMdWM8MajAFeqAFRZfgf75iJSN2ukACgP5c6zlbe9PWhf8JnCfXxVmTDIsMpvbFT4yhnq6wPS26FiK5aIacdDWPUsVo/zAPmPXVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C/90mX33; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-627ebbe7720so5174467b3.0
        for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716887103; x=1717491903; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qco2VkcgOsBroVWxxvK7SBMAfuOUTvOxLPV6N/M2lx4=;
        b=C/90mX33fUnQYrzOzJriV4r3l0Ea/psh8Sl9p4y7uHgpkdmXEE8bJeof7aHWidAteo
         qhYGLArSc1hYAEdE8PA14IFWg57a1pkKFmJ7i1OIGvrO/77o+oqrngaOhA8clqY6p8eP
         +YKrdLPpafOj24Xbg4E6x68k9cFRNC/jwwjk/C3yaR618xbhcMLKNdjQIwC6snrcfej2
         ZUupgG5+jYxjhPAt12ThhAWW9+PkKu9QOWTLWHdeOGK/bhtnCMhOAu5e10UVnJrBW2Dv
         yt+RixtJ+McW0KfoD96P/tRJiorGB1xIrNgd44pPIPiJuvSTDTactk3woKLk4xeG0CA6
         3M0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716887103; x=1717491903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qco2VkcgOsBroVWxxvK7SBMAfuOUTvOxLPV6N/M2lx4=;
        b=u8U2xgNpg7cwmwog+kHJ9xXsgkkrM/dTxMKrrtrDAC8WiTKHxODMWnUTPIgXp1SXOn
         3RUVPWsAcctiKDqLqEdpEz266mR0Nl27RYySvK0Pv4L3oWPDHxUntxlILYzqvPyUfQyd
         KYwlIgq5VkaZ8cDMsch8iA5YqFG8n0Zrxpndphf1w1zLW2+upOQQjYGupGYAC9NENS7H
         nsY20WmMkq5+Hc85opkH5EspJPPn8JHXD1+bux3OzIQGKVL5YHxg2H9y6I97LKA5yKDu
         WId7TwMqTNGQ5gmKA1tKilFkolfQULu1idaGf7ABppcogHikQ3KYK22DrD0qcqyTFWTN
         aqpw==
X-Forwarded-Encrypted: i=1; AJvYcCUWDhPBJIqF7hOM56FWOWFULZuQ+I+t2ZSa5AkhYHggfyseHgR0VXkJFxxQhpPl3J41s/ITdaXbLMhWV8NkMUZL0FjxWt0hl6KD
X-Gm-Message-State: AOJu0YxkiP0Zgfj7JFfyHHH6MuuRZIiZFq96U7Q1o3MYFNIiQQc3i0Fb
	F5FD1CzkAwNLZ2q3vG0yfoES8HYZLbG8c/G2spawVrX1kPyeEj/0FcASzqQMjkPeMCwudctj++U
	wUVZWYq6ksTRsfEXYgnAhPJ1Pn16qQpfihWMh/w==
X-Google-Smtp-Source: AGHT+IGNRUmYq16dA3M+ILETjfBKif7DHc9kvKF75lKaPWdpO1n294Imuj/CoPWaZS6n4gDEYE+TkgvaatUZy6PTcwQ=
X-Received: by 2002:a25:908:0:b0:df7:8fdd:1ca9 with SMTP id
 3f1490d57ef6-df78fdd289amr7264958276.1.1716887101840; Tue, 28 May 2024
 02:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
 <20240527-yoga-ec-driver-v3-4-327a9851dad5@linaro.org> <ceb1f7b3-2787-4166-846f-2427b44b3e62@suse.com>
 <vc5nd5dl4czkuxzikazn7ndy6wghlchqsrcgxf7n5w53w3o3m2@spyfgp5pwy4y> <9a0073a0-d598-4c1a-bb32-328d0a279152@suse.com>
In-Reply-To: <9a0073a0-d598-4c1a-bb32-328d0a279152@suse.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 12:04:50 +0300
Message-ID: <CAA8EJpoYq-MKyMkWfWFSjJq6=3ZRC02k=4oQaqtcp73hQTZZEw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] power: supply: lenovo_yoga_c630_battery: add
 Lenovo C630 driver
To: Oliver Neukum <oneukum@suse.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 May 2024 at 11:43, Oliver Neukum <oneukum@suse.com> wrote:
>
> On 28.05.24 01:15, Dmitry Baryshkov wrote:
> > On Mon, May 27, 2024 at 02:26:36PM +0200, Oliver Neukum wrote:
> >> On 27.05.24 12:03, Dmitry Baryshkov wrote:
>
> Hi,
>
> >>> +struct yoga_c630_psy {
> >>> +   struct yoga_c630_ec *ec;
> >>> +   struct device *dev;
> >>> +   struct device_node *of_node;
> >>> +   struct notifier_block nb;
> >>> +   struct mutex lock;
> >>> +
> >>> +   struct power_supply *adp_psy;
> >>> +   struct power_supply *bat_psy;
> >>> +
> >>> +   unsigned long last_status_update;
> >>> +
> >>> +   bool adapter_online;
> >>> +
> >>> +   bool unit_mA;
> >>> +
> >>> +   unsigned int scale;
> >>
> >> why do you store unit_mA and scale? This looks redundant and like a source
> >> of confusion to me.
> >
> > Here we just followed the AML code in ACPI tables. The unit_mA is a
> > returned from the_BIX method, the 'scale' is used internally in the DSDT.
> > If you think that it's better, I can change all '* scale * 1000' to
> > 'if unit_mA then foo = bar * 10000 else foo = bar * 1000'.
>
> I think that would indeed be better. Implementation details of the DSDT
> should not dictate data structures in a kernel driver.

Ack.

>
>         Regards
>                 Oliver
>


-- 
With best wishes
Dmitry

