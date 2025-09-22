Return-Path: <linux-usb+bounces-28474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73BB918A2
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 15:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9512A0DAA
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0EA30EF90;
	Mon, 22 Sep 2025 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CPg+PFRT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0465A30E821
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549500; cv=none; b=ZpxQOoTLNoO0BsWfyew5qRTvYzwXOQxoG8Vw4SQrcw2vi64rEDgN6h2XqzDaWHCRX+Z8xE8anDiZjdTkgcNpbA+VkQmmOHmeHMFrkoa85k52jnyXVH/Y4gmBexGWxbX3qCB/dxeNH0d8ryMcW9Qn7zholzSwKGEvnT3ydw9d5uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549500; c=relaxed/simple;
	bh=/bByTikaDpZO4dIRnrvdQkhLXizAJIrSrRF7ztsfqEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kec4XRSO3xHPLMIDz0/vyaY0t7FybWFLtZiH8nmOB1s+2N3jOJubwLwzLmmScx0Pqvv7/HQH0LSQHb6kkD6+V9iMFOZ8I/1h04UrJErBcGA123z6lCOmZM1ojB5mBjfKbzeH/RzWpS1XSFX3FGhAztZOOJNxb1VgEGIqGAEn1Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CPg+PFRT; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4d21a3da5d8so411591cf.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758549498; x=1759154298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qXzUT3wmSEFa7kkyt4eL+Bcr+Ou5keciQCQXtOX12iQ=;
        b=CPg+PFRTnZ5QgxUjnzN2Il86DPxkoatOhuaEHkl8Q3Rs7rFmTZTtnw39JWtLHlh7JW
         h02YBKj53b9jXD1niEJUb7zHj/carCFdFem3VnotbSDVT55XdlonvHfwGj2KK3Guzo/Y
         EXAjHTaThUoeh2Jynz6GeSTJLJauuD3a1rUGb+awZuL1dKlpL5/ieDNFxeKUjksdLRye
         EjTuL5p2lt/6zBu9UkW3mx+qxJGhuxa/mwvLIgQTpAWmRRrVKLD5Cpy/vwqFeXd+N6RQ
         lCvJTJ2Vhaqq7vW87RBxXayjeLK3gq3erCc6yOtSUp5aYSG6CYYyHblCVf/wfZjwV2K6
         PuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549498; x=1759154298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXzUT3wmSEFa7kkyt4eL+Bcr+Ou5keciQCQXtOX12iQ=;
        b=pdN9hBY1rkHzp6vRRXm80XbpPVj4+PA7R7o8HMlnXPk+sWXGxacNpILcd180lsW0iG
         6lXHJv0MCXI8zr1z9kaDAa/aa/icyOyYunewtE35JrURpT1fI7jlPA3XEba6RViIx4yG
         CqqPeAV9+IImI8rplpTF3puzHoYsBiGnB7Zvq9qWJDsES+VsjlHs7gwURukOWAJsv8ke
         zJXBGfubs7dB21M4kZX9myfEQfW1RJojIFdS6/GDNOw26xoYjr5A3xoRXLyOe9WDlW2X
         K634fsc7A87CYj0r2P4TR+Zxtoly6N1A7qkJ1r1LlkBKB1yJSTMH3Bdpox2yEoGPZLPN
         CuAA==
X-Forwarded-Encrypted: i=1; AJvYcCUhjMneFFlg4qepZ41vdav6Yf0PuivhqmVT3nGot2JBdFXulmbLTJigkVT1WIKIh1JFw/hmDFGsvI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/y/ExsPF6qssHOsZa97YsR5GPBPLDBd6KnZoQbvnQPEHJsdN
	jA+RQ8SJPfpXt4FjUh277f6loBhN+LZqMNpvM3MFmp8rLTkJbbN/TQG6OYTEuAyVvDfsKfdrYil
	SGrw=
X-Gm-Gg: ASbGnctORclVxuBtL+bv/CWxdgaasuhlKjf45VT0HMTkAyQifoC2T8HjfvU+sSEWEeQ
	x35T8lVXpLyhYgb9Z4UhSlt8QtJZHj3bdt1iZ1ukxo0MAhYBUuLl15JwampomUwX/SEr2htgDXa
	boWo6nANTVr4i+w1G2iz2bMP41/7WbFAjLYMDW8Ihe9VPIA5roawRkZtbUXS6RTVMzhIcKt43TN
	sAaQYTUbQjDso3vNwfucO0qobo7pGUz2NkqnfY8iP6BsPdznoNJlLjPB9JmlAH1dsPushg3FWOe
	6XHtE0ORn6MoYLhShSVJmLMBKpnRQTNYkuG5Y34zxKdWirMrxPoMLtN5Rueo5hrydDNAuAsa05t
	qOcRtWGufC/sfPMt+KZSCidtm3y1dJgcttWhw/Wy11w==
X-Google-Smtp-Source: AGHT+IHtndZm+LoDIY6i4VIuumAfRCnHjP4xtexFeR9g5QzIS3AMNSm/jB38OCE/Tg2E+A3OLhfCDQ==
X-Received: by 2002:ac8:57c2:0:b0:4b7:925b:43ff with SMTP id d75a77b69052e-4c06ef831afmr135708501cf.35.1758549497820;
        Mon, 22 Sep 2025 06:58:17 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4c99c644758sm18559371cf.41.2025.09.22.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:58:17 -0700 (PDT)
Date: Mon, 22 Sep 2025 09:58:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add Aspeed AST2700 uhci support
Message-ID: <67259dbb-4586-4099-9762-5c1d143db7db@rowland.harvard.edu>
References: <20250922052045.2421480-1-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922052045.2421480-1-ryan_chen@aspeedtech.com>

On Mon, Sep 22, 2025 at 01:20:41PM +0800, Ryan Chen wrote:
> This patch series adds support for the UHCI controller found on the
> Aspeed AST2700 SoC.
> 
> Compared to earlier SoCs (AST2400/2500/2600), AST2700 UHCI:
>  - requires a reset line to be deasserted before use
>  - supports 64-bit DMA addressing
> 
> This series updates the bindings and platform driver accordingly.

For patches 2/4 and 4/4:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> v4:
> - usb-uhci.yaml
>  - fix errors 'make dt_binding_check'
> - uhci-platform.c
>  - remove IS_ERR_OR_NULL(uhci->rsts) check, due to reset_control_assert
>    will return 0, when uhci->rsts is null.
>  - use dma_mask_32 as default, and just add aspeed,ast2700-uhci for dma_64.
> 
> v3:
> - uhci-platform.c
>  - add reset_control_assert in uhci_hcd_platform_remove.
> 
> v2:
> - usb-uhci.yaml
>  - add required resets for aspeed,ast2700-uhci
> - uhci-platform.c
>  - change the err_clk before err_reset.
> 
> Ryan Chen (4):
>   dt-bindings: usb: uhci: Add reset property
>   usb: uhci: Add reset control support
>   dt-bindings: usb: uhci: Add Aspeed AST2700 compatible
>   usb: uhci: Add Aspeed AST2700 support
> 
>  .../devicetree/bindings/usb/usb-uhci.yaml     | 13 ++++++++
>  drivers/usb/host/uhci-hcd.h                   |  1 +
>  drivers/usb/host/uhci-platform.c              | 31 ++++++++++++++++---
>  3 files changed, 41 insertions(+), 4 deletions(-)
> 
> -- 
> 2.34.1
> 

