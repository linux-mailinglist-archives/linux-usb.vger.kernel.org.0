Return-Path: <linux-usb+bounces-2775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB447E7B25
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 11:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 970B21C20CD9
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 10:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0F9134C8;
	Fri, 10 Nov 2023 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ARVo/PIX"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F77134A0
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 10:05:02 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C15726323
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 02:05:01 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-77ba6d5123fso245157185a.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 02:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699610699; x=1700215499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JTh2PjtP0OKf6/BbjRju5hZ6Q5wateJL2w104j8DLtE=;
        b=ARVo/PIXIZmWNtOVMWfQxSRzyqeGmgDBYOeTUBycIOgnjRJgge28pWfD82+1iIWP3r
         LDERjb2xY8htMsT+Pah55i+etnWB90KySU4WhwphNdifLsmBnkVxPCQxh6crdvTzr3MU
         sFL3fyl2MMjG5wOk+OQG1UWecWFQ42MDqdr8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699610699; x=1700215499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTh2PjtP0OKf6/BbjRju5hZ6Q5wateJL2w104j8DLtE=;
        b=V0gmPCfk1UUhC983Q4Eb90NmvQEsrWQEPnvq8dQm2uxF+YmF2POIahbMhe1KTMAubN
         iod4wGNpZnkgZK9yQV89kWPmhF1EwKjcA9mPougJG4YfMGI2Yg5wFH1ug2yxZPLJS/ZF
         xiwnypl/79NMXBuEoeANrKNxk01ppQAY06HWMlH7bM+/jkO+3lMcw/uFDpANKdqPg3ov
         bQQi6EEMWtifQoBwOuij52Nz64RIjxeJIQgGhHizSnaFedVAEe+eC63J52AhTZyZfeme
         evnyC8u0EIS5EukIxCoF139rNFQorDcGUhtJXRyoV3DYbwhS79Yy39HD8mlY5kXfIUYo
         mshw==
X-Gm-Message-State: AOJu0Yx3/8g1Mu7Tx92pdOeVPhqQvITVKsMjPeTExgRFNj0SN2qT1eXX
	k7X0cSSWwd77pwJqXI/fSOLqAwNrzydEPp1+o/A=
X-Google-Smtp-Source: AGHT+IFrFzxBoLUYMpqU3NQ8UpWQ+gNSAFLtdNi3sH+8QYY7Te9PKiYFtRF79pZVwdt4eCoPF8b3Yw==
X-Received: by 2002:a05:620a:178a:b0:76e:f686:cad8 with SMTP id ay10-20020a05620a178a00b0076ef686cad8mr2727294qkb.13.1699610699563;
        Fri, 10 Nov 2023 02:04:59 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id c12-20020a05620a134c00b0077bc5299c85sm553973qkl.124.2023.11.10.02.04.59
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 02:04:59 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-77ba6d5123fso245155885a.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 02:04:59 -0800 (PST)
X-Received: by 2002:a05:620a:2952:b0:775:8fab:8c6f with SMTP id
 n18-20020a05620a295200b007758fab8c6fmr2773310qkp.29.1699610698754; Fri, 10
 Nov 2023 02:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231026-dwc3-v2-1-1d4fd5c3e067@chromium.org> <20231031232227.xkk4ju3hxifj3vee@synopsys.com>
In-Reply-To: <20231031232227.xkk4ju3hxifj3vee@synopsys.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 10 Nov 2023 11:04:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCvEyjHFT3KQbsbURjUadpQYEfQ=M8esdcHnpWe9VsK=2w@mail.gmail.com>
Message-ID: <CANiDSCvEyjHFT3KQbsbURjUadpQYEfQ=M8esdcHnpWe9VsK=2w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: set the dma max_seg_size
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Zubin Mithra <zsm@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thinh

On Wed, 1 Nov 2023 at 00:22, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> On Fri, Oct 27, 2023, Ricardo Ribalda wrote:
> > Allow devices to have dma operations beyond 4K, and avoid warnings such
> > as:
> >
> > DMA-API: dwc3 a600000.usb: mapping sg segment longer than device claims to support [len=86016] [max=65536]
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
> > Reported-by: Zubin Mithra <zsm@chromium.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Found while running
> > yavta -f YUYV -s 1280x720 -c  /dev/video0
> >
> > with:
> >
> > CONFIG_DMA_API_DEBUG=y
> > ---
> > Changes in v2:
> > - Add stable tag
> > - Link to v1: https://urldefense.com/v3/__https://lore.kernel.org/r/20231026-dwc3-v1-1-643c74771599@chromium.org__;!!A4F2R9G_pg!b22b7Wx1QOpnFtMi7rJ0TS-rhOnMmy_sOCX3kdfln7ezNjslyMhBwHvWaXbK8D5BkKPjjn3HdID-7Ls5R3eR_4o$
> > ---
> >  drivers/usb/dwc3/core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 343d2570189f..65f73dd8ef47 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1918,6 +1918,8 @@ static int dwc3_probe(struct platform_device *pdev)
> >
> >       pm_runtime_put(dev);
> >
> > +     dma_set_max_seg_size(dev, UINT_MAX);
> > +
> >       return 0;
> >
> >  err_exit_debugfs:
> >
> > ---
> > base-commit: 611da07b89fdd53f140d7b33013f255bf0ed8f34
> > change-id: 20231026-dwc3-fac74fcb3b2a
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>
> >
>
> Probably better to have the Closes: tag with the link to the reported
> issue. Regardless,

It was reported internally, so I have no link to share.

In this cases it seems that Reported-by with no link in good enough:
https://lore.kernel.org/all/ab557ae6-7550-189a-81dd-6e3346d84620@leemhuis.info/


>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Thanks!
>
> Thanks,
> Thinh



-- 
Ricardo Ribalda

