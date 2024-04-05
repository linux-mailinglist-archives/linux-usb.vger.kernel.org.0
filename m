Return-Path: <linux-usb+bounces-8976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64956899A5E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 12:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDC431F23811
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 10:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067B116193D;
	Fri,  5 Apr 2024 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYZFpbPq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D5161927
	for <linux-usb@vger.kernel.org>; Fri,  5 Apr 2024 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712311805; cv=none; b=X1/IbOUVH92rqZGHxLmwrl0kUARb/VPEcpRlhpn/4LoYT3yhJYVPXbdgWS5ObxGR47SFkwFD2uRFtX3gzsrayIYlpmXfiOjII7PSXl7REX3AzR+yR8SDiaDNw/CcZkRGBpa6yTvwM2WgXSY+OKLlNDYO8ra41rd1dZuDnhDAwiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712311805; c=relaxed/simple;
	bh=pXlCHD18+JNqKMC0Q8yK5DLhygH1z7qsFX/kL2YpaYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfQhepnCkxANHyQ3LZnF2sxyBtlc6kiBx3fgG70ojcessR5HYMO3txiXEpbVN/KYaRlRq5LMw6G3P+ES5zhhVM7LF6qyT3eqQer9aJ0AdDKaSnUydxEzDR1104uXCiTb+wiT/rlhXrsrqAeLWkXsFMdw+XLtOxut0F/bKYgxRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYZFpbPq; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e0acaf69aso2445008a12.1
        for <linux-usb@vger.kernel.org>; Fri, 05 Apr 2024 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712311802; x=1712916602; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1xkTiNucqnTHS3/UhZB76wiD/dcogo9aeAt8NSKEflE=;
        b=EYZFpbPq9j/YDcPQAkDupQ3zBpJ36FDcySg6N8bvPA5CaIQ3zuZxnwCzNhO1oKkN/t
         89oN8g0UXRO5a7OduXvEpVs87Za2p1S31Yn7CDHeMvZb9AxBt2UpFRFHnm3fXfqll9Uk
         5jGb5SePlvxmLqhW5FrGE81xOpHmqoepVX0A3z3j4QBiPDhxq1HdaT9BMMoDtna82mvt
         Yyexemte/tHI0uXSmEvXRp3RtMJCahXCTPBrWd2sxFEPn2pWL6y3m3o6JycrX2iOo4Ac
         DAKcFbf9xrtZI8eLGK+ruLYEeygFq9gMKqoe0h1XFrUQAMRkZ5ijdbNWzFGdV8S6k/IJ
         2BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712311802; x=1712916602;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xkTiNucqnTHS3/UhZB76wiD/dcogo9aeAt8NSKEflE=;
        b=uk0AzVyB8ATvFwyMH8X1k4tt2Edz1RiUCwCGByywIfxwXHeGSFTdlPgnUVgMDMBG1b
         /ntP3LQs1HQQqEZa7/9B2KKO0T4ctmoAYL0vBrhp4DOhEs+mPRBukMrnSkGxqlHfZNbR
         ZKZ6Nq0J4zfHx1KxVFEH0rz+SRXeRMsBns1QEbwSmo9LkgrYNsk6FPh71vdddmbUqSpo
         xweazwWIpPSKd6ZPT0swjB8UjtMN3dWgY/cFw+gxed9fwNvkK/JkSXO+KvM4JOSlmMI1
         PE+tGdBcoHpIwma83x+/3k+fwBZ4plUoe7dXqBZob+OwIzmloO2ZZhemR/5wmPCsPwCZ
         5u7g==
X-Gm-Message-State: AOJu0YwV4DcGSpqqtEoFHjL7n9NYRh7hWvR0ZzYZ/TDiz1xY7sy3Gkl0
	XQ4rN0ME3g94w/x66olVTt4KqzHLNADuRI26NP9V3alzaLGihMxMB0zmCJyyuC8=
X-Google-Smtp-Source: AGHT+IEPYgdWqnODFe3JGLabNaVIonYgaRMKRgYZ236iqvb4AzWgK6UnkdtxruTDh01vQP0zuffk/A==
X-Received: by 2002:a50:cd5d:0:b0:56e:355d:2ece with SMTP id d29-20020a50cd5d000000b0056e355d2ecemr284150edj.30.1712311802188;
        Fri, 05 Apr 2024 03:10:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dg3-20020a0564021d0300b0056ddcbd9362sm648449edb.51.2024.04.05.03.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 03:10:02 -0700 (PDT)
Date: Fri, 5 Apr 2024 13:09:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minas.Harutyunyan@synopsys.com
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: dwc2: host: Fix ISOC flow in DDMA mode
Message-ID: <ab2cc5d9-3fc9-43a2-abe8-a20338bdcd02@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Minas Harutyunyan,

This is a semi-automatic email about new static checker warnings.

Commit b258e4268850 ("usb: dwc2: host: Fix ISOC flow in DDMA mode")
from Mar 13, 2024, leads to the following Smatch complaint:

    drivers/usb/dwc2/hcd_ddma.c:874 dwc2_cmpl_host_isoc_dma_desc()
    warn: variable dereferenced before check 'qtd->urb' (see line 870)

drivers/usb/dwc2/hcd_ddma.c
   869		u16 frame_desc_idx;
   870		struct urb *usb_urb = qtd->urb->priv;
                                      ^^^^^^^^^^
The patch adds a dereference

   871		u16 remain = 0;
   872		int rc = 0;
   873	
   874		if (!qtd->urb)
                    ^^^^^^^^^
The existing check is too late now

   875			return -EINVAL;
   876	

regards,
dan carpenter

