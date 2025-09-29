Return-Path: <linux-usb+bounces-28782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA1BA97E5
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 16:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6F1420376
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 14:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE5730ACE4;
	Mon, 29 Sep 2025 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="e4HQE3bc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2432A3090D6
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759154970; cv=none; b=pBy35q7bpfMgibz9YlTnpl4FSBm96PzAnCp1/4GdtxWO6VSdzSmNXej6XpM1iKT607stfy7c2LjxLuuMpM4wm4EY5L6ouhVhMkVSCJODbAzwpOZ2MRVw/SN6REiZ6cpK8oiI1F0PLCSpLa5SW2Z4c7Qc6Yw9nXOHMpwbXHMjoWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759154970; c=relaxed/simple;
	bh=gvG6NzvSMixtm2uPE0qaHPy782zK2nlOUQdpYZjESSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfDVguxkG9Wm0py+vPeZsd1x3dQsMA2Vz3cEgeXGwe37X3Sk0otgBU2fKxscd/yrW/iohM+ADQ/jtqiCN9GSlLa+T1AZFFmWa7pXT/f2d9OsfEG0h53z9paPhMYRciIC+KoqgPkNU4za0kYuygQOKc+aaozd1jr+5GdeX7zVgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=e4HQE3bc; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8599c274188so458123285a.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1759154967; x=1759759767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/D0SZIVZ9xKbqT8SP675XXBHG9S9E390zsa5x8oJXtw=;
        b=e4HQE3bccb4VReluZ9B9Z8pE9nCg4d0Mcd1ivnU8IA9o8hwgsm2aeQzGjlW7nQMIn5
         aikJ9u5idVnxnpn9vKdsMinrnb2J/wzbMspZEHpnWN1xpQiansKel0T0Kb4zW0DtQ5BQ
         U2rp0DFowWM16K8faHcdVyKpJi9oR6TI3Yd82w4eTSNOwQ4smSdA2vEefy7tAorhbM8K
         sbQeHdAgCH3oqeQ7mZ4roIb0mMkSSLJReM0lbhvXmSeCs0Y+PgYRbvys6+KSrJ8T+vvU
         OcOhWLs51GrYtvzfBiq9HcR1DcaS9E0iigx7H1fTnoLNQd4QUd7wc6f5hNRyYD8UOCcJ
         ftlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759154967; x=1759759767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/D0SZIVZ9xKbqT8SP675XXBHG9S9E390zsa5x8oJXtw=;
        b=Nk3oiMy9z8yL4jVRHwHdLi5v9jNmqZGauWbIYgSuUKxoCWS2p3X9tE1Ot7RXrun898
         1O7FBLi8wfhtxcPfn1VRLPM1PZuMZgvQCtiqwAUALRs1PmJJaPGYFdqmZ2kJpW3QSISD
         H6HNyrq7c0ILrBfGVhhTv0HU/ZBGnNvTal37z2MQqSz5OIdCJKHq1XkQZpf6OG3CPVl8
         I8OB9iN7uZisdGm5B5ae5QlVyxi+UiVqUhK49/BYWIBo430MpyWcyQkMURbE42Lhh80Z
         72s4XwRzJznRBui53Y36dFexj59Z2uUIM2DmDh4GYv+FNtTbG69W1az3oeSFnns8Fg3p
         ns7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYVLGj1lb03ajx7NRsiyyMxatmSy0Xby5gqQpd/O1rug4D/6+CjuLVYT54pjDVigc6YhA1WZ2shrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdYWlHO3CA1b5849W6gTACeQ9FxikmjBHn/420Pm2vMrkZIjP
	OGWgIYn7aRgZFGSsdXyApm5NAtI1ILgqyXrFfMIn3/BwIoUvMJbODzb9r93nYiGsRg==
X-Gm-Gg: ASbGncvy3atFXZ8ra3L3A/7Gvn1OSVUHieWApeOiqugHKtqgOgWoPaAOvGfj9LrCJSn
	NpIDTCY0n6UZXrUTpoRpdvgxzZUBWQPZ8RYUFe5GnFufZA7M+dZ4tvU+f7BcVJY1VGLH2UFOjiA
	QpWQ0gZfnlyjWabIsn5Negg8tznRf2ylBvhs7sHWFCuzBsWmqRCB1LrQ+/kCCa5xR5FAvNjQVY7
	IAOsjbmOdTYIVm64gs0dAhvq4pPbT7tFB23jW0DZc3sOG0X5vPg7O+QBO5NBxWkULzL44NYQQeL
	wFucbm9TNNj9JfO5VTejgTE/cj8ERNobsWHYXGIthdCM2AOdIaFBjZY6yKBcq0G2JsssAAYs4/D
	BF8S+RqhCLfi6lnrVTr2VVpSyys4J31GItjFd3Mx/vm8o6Q==
X-Google-Smtp-Source: AGHT+IGGGR/fMqOGihYTULCGpoFCZCyI+PK0x12cArykoie+vVMgbypc7wAJJB8SK0sKrDD4Z06haw==
X-Received: by 2002:a05:620a:1a90:b0:84f:2f6f:37ee with SMTP id af79cd13be357-85ae65da6eamr1849648985a.48.1759154966517;
        Mon, 29 Sep 2025 07:09:26 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c2737869esm823951485a.11.2025.09.29.07.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:09:26 -0700 (PDT)
Date: Mon, 29 Sep 2025 10:09:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] usb: ehci: Add Aspeed AST2700 support
Message-ID: <be6a9306-c88a-4cd5-9b88-dfd4d6e2933c@rowland.harvard.edu>
References: <20250928032407.27764-1-ryan_chen@aspeedtech.com>
 <20250928032407.27764-3-ryan_chen@aspeedtech.com>
 <0a12f3ac-2600-4ede-a738-f4ab43ad4bee@rowland.harvard.edu>
 <KUZSPRMB0005CC6A87F6FFC5A08F12BFF21BA@KUZSPRMB0005.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KUZSPRMB0005CC6A87F6FFC5A08F12BFF21BA@KUZSPRMB0005.apcprd06.prod.outlook.com>

On Mon, Sep 29, 2025 at 05:56:13AM +0000, Ryan Chen wrote:
> > > @@ -253,8 +256,13 @@ static int ehci_platform_probe(struct
> > platform_device *dev)
> > >  	if (!pdata)
> > >  		pdata = &ehci_platform_defaults;
> > >
> > > +	dma_mask_64 = pdata->dma_mask_64;
> > > +	match = of_match_device(dev->dev.driver->of_match_table, &dev->dev);
> > 
> > (I just noticed this.)  The "dev->dev.driver->of_match_table" part looks odd.
> > Why not just write "vt8500_ehci_ids"?  Do you expect that this could ever
> > have a different value?
> > 
> > Alan Stern
> Thanks your feedback.
> I used dev->dev.driver->of_match_table rather than hard-coding vt8500_ehci_ids
> to keep the probe code generic and tied to the driver model, not to a specific symbol.
> Functionally it's the same here, but this pattern avoids coupling the probe to a 
> particular table name.
> 
> How you think ?

The code doesn't need to be any more generic than the source file it 
containing it.  This particular probe function will never be called for 
a different driver, or a device that matches an OF table different from 
vt8500_ehci_ids, right?

Interestingly, there are two other places in drivers/usb/host/ that call 
of_match_device().  fsl-mph-dr-of.c uses my approach and xhci-plat.c 
uses yours.  The difference is that the xhci-platform probe routine 
_is_ called by other drivers, namely, by xhci-rcar.c.

I guess it's okay to keep this code as written, even though it's not 
strictly necessary

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

