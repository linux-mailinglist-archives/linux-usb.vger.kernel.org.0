Return-Path: <linux-usb+bounces-3045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 807237F1E31
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 21:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D274AB216F7
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 20:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF08225CA;
	Mon, 20 Nov 2023 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e85fxMWv"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA88D2
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 12:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700513457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NCdqcULXYaAlWiWs9GD5NBT5ezqfDctqKAHvvwYWuQA=;
	b=e85fxMWv2ml0hK2Qn6W/n2cCcVZSj22ObQIeaev5UIoY3pXYPFyIAxwfkCEHdfK9hvnNLV
	UslHnJGaNJ0Uw4+ll6800HacHGGRP6yotlLSuoc6TqhJZGMYmTqthJMvANH2lKfPQgkCWZ
	yht1BOwro/H86wUwP20tkJCTtoXkOHA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-yk-k3DtBOrGjA-gIGfRMNw-1; Mon, 20 Nov 2023 15:50:55 -0500
X-MC-Unique: yk-k3DtBOrGjA-gIGfRMNw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-679e650f9f0so6361086d6.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 12:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700513455; x=1701118255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCdqcULXYaAlWiWs9GD5NBT5ezqfDctqKAHvvwYWuQA=;
        b=XdSgP1A9f0PtFO25RFuOvVy1XtiBHPfFebIeMMzJQw3X7xV+LdPGfZCLB62XXz9ovU
         kZzH3YU44L8H3gjD6rUssjFh58KHugOzFzuZtAxhhKVOUnHkXG6iMndGht7uw6/dJgvv
         RlHA8WWRpiNt5A2bCU9OWOL+xgotn3cqGqWem2FuyJH38wrw3sdI5avcSg9Hutmb/4Bv
         LE7XihaG0Kh0SjhDJ6OdFP+dv6KqQVfijoF1rXMNpVsCq51XrETBsD4J8i3bBorEVQ1L
         kLvu6eOFsVBKQ3pmdKmeS5mfuvMd+Msk9k8PYkiIUQoH+se+wJ4HRLj18tZn4qVDu8hu
         v3aA==
X-Gm-Message-State: AOJu0YwNkyIQQvCyIrffPEwtPZdFzxxYYSUBLGSKCvNNG4Rc9yluS40M
	eOxW3OhHGHfzH2Q8/kFLkGy2zITuzDSFdRvHvkcFqzyIwkpSLud9QLa56OTzZqFoOOuH35gHOOc
	AUIJ6Itb2sGDHxQdLwDel
X-Received: by 2002:a05:6214:4113:b0:677:987e:87d with SMTP id kc19-20020a056214411300b00677987e087dmr11471414qvb.2.1700513455002;
        Mon, 20 Nov 2023 12:50:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtRRwGNlAO1HQ0kkAEKi4KQv7QcnNP8gXcJ/KT7pderSTsF9taEhMUrn0aqII8AFLOEpg+lQ==
X-Received: by 2002:a05:6214:4113:b0:677:987e:87d with SMTP id kc19-20020a056214411300b00677987e087dmr11471400qvb.2.1700513454735;
        Mon, 20 Nov 2023 12:50:54 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id rv13-20020a05620a688d00b0077a7d02cffbsm2951878qkn.24.2023.11.20.12.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 12:50:54 -0800 (PST)
Date: Mon, 20 Nov 2023 14:50:52 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] USB: dwc3: qcom: fix wakeup after probe deferral
Message-ID: <3ff65t36p6n3k7faw2z75t2vfi6rb5p64x7wqosetsksbhhwli@5xaxnm7zz4tu>
References: <20231120161607.7405-1-johan+linaro@kernel.org>
 <20231120161607.7405-3-johan+linaro@kernel.org>
 <pgmtla6j3dshuq5zdxstszbkkssxcthtzelv2etcbrlstdw4nu@wixz6v5dfpum>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pgmtla6j3dshuq5zdxstszbkkssxcthtzelv2etcbrlstdw4nu@wixz6v5dfpum>

On Mon, Nov 20, 2023 at 11:39:07AM -0600, Andrew Halaney wrote:
> On Mon, Nov 20, 2023 at 05:16:06PM +0100, Johan Hovold wrote:
> > The Qualcomm glue driver is overriding the interrupt trigger types
> > defined by firmware when requesting the wakeup interrupts during probe.
> > 
> > This can lead to a failure to map the DP/DM wakeup interrupts after a
> > probe deferral as the firmware defined trigger types do not match the
> > type used for the initial mapping:
> > 
> > 	irq: type mismatch, failed to map hwirq-14 for interrupt-controller@b220000!
> > 	irq: type mismatch, failed to map hwirq-15 for interrupt-controller@b220000!
> > 
> > Fix this by not overriding the firmware provided trigger types when
> > requesting the wakeup interrupts.
> 
> This series looks good to me and makes sense except for one point that
> I'm struggling to understand. What exactly is the relationship with this
> failure and probe deferral?

Eric Chanudet pointed out to me (thanks!) offlist that if you:

    1. Probe
    2. Grab the IRQ
    3. Request it (and muck with the trigger from the firmware default)
    4. Defer out
    5. Reprobe
    6. Grab the IRQ again

You get that error, which I played with some this afternoon...
and can confirm.

It really seems like maybe we should consider reworking messing with the
trigger type at all (which is done later for runtime/system suspend)
in a follow-up series?

As far as I can tell if you were to remove the driver and reprobe after
a suspend you'd hit similar. I've been sitting here scratching my head a
bit trying to reason out why keeping it as IRQ_TYPE_EDGE_BOTH isn't
acceptable in dwc3_qcom_enable_interrupts()... Correct me if you think
that playing with the trigger there is really ok, but it seems like you
run the same risks if you do that and then modprobe -r dwc3-qcom.

I get that dwc3_qcom_enable_interrupts() limits the scope of what wakes us
up to what we expect given the current device (or lack thereof), but it
doesn't seem like you're really meant to play with the IRQ triggers,
or at least the warning you shared makes me think it is not a great idea
if you plan to probe the device ever again in the future.

I'll post the current comment in dwc3_qcom_enable_interrupts() to
explain the "limits the scope of what wakes us up" a bit more clearly:

	/*
	 * Configure DP/DM line interrupts based on the USB2 device attached to
	 * the root hub port. When HS/FS device is connected, configure the DP line
	 * as falling edge to detect both disconnect and remote wakeup scenarios. When
	 * LS device is connected, configure DM line as falling edge to detect both
	 * disconnect and remote wakeup. When no device is connected, configure both
	 * DP and DM lines as rising edge to detect HS/HS/LS device connect scenario.
	 */


> 
> Thanks,
> Andrew
> 
> > 
> > Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> > Cc: stable@vger.kernel.org      # 4.18
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 10fb481d943b..82544374110b 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -549,7 +549,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
> >  		irq_set_status_flags(irq, IRQ_NOAUTOEN);
> >  		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
> >  					qcom_dwc3_resume_irq,
> > -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > +					IRQF_ONESHOT,
> >  					"qcom_dwc3 HS", qcom);
> >  		if (ret) {
> >  			dev_err(qcom->dev, "hs_phy_irq failed: %d\n", ret);
> > @@ -564,7 +564,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
> >  		irq_set_status_flags(irq, IRQ_NOAUTOEN);
> >  		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
> >  					qcom_dwc3_resume_irq,
> > -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > +					IRQF_ONESHOT,
> >  					"qcom_dwc3 DP_HS", qcom);
> >  		if (ret) {
> >  			dev_err(qcom->dev, "dp_hs_phy_irq failed: %d\n", ret);
> > @@ -579,7 +579,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
> >  		irq_set_status_flags(irq, IRQ_NOAUTOEN);
> >  		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
> >  					qcom_dwc3_resume_irq,
> > -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > +					IRQF_ONESHOT,
> >  					"qcom_dwc3 DM_HS", qcom);
> >  		if (ret) {
> >  			dev_err(qcom->dev, "dm_hs_phy_irq failed: %d\n", ret);
> > @@ -594,7 +594,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
> >  		irq_set_status_flags(irq, IRQ_NOAUTOEN);
> >  		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
> >  					qcom_dwc3_resume_irq,
> > -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > +					IRQF_ONESHOT,
> >  					"qcom_dwc3 SS", qcom);
> >  		if (ret) {
> >  			dev_err(qcom->dev, "ss_phy_irq failed: %d\n", ret);
> > -- 
> > 2.41.0
> > 
> > 


