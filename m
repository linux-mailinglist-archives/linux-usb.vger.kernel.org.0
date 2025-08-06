Return-Path: <linux-usb+bounces-26542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10764B1C7E2
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 16:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA8083ACA06
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 14:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DCE1990A7;
	Wed,  6 Aug 2025 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Q1gJfF0Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994181D63DF
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491715; cv=none; b=X7IhBpSrseTddzHKcpSfJgWB8mG/puV6KWR569jtKoliTzdxcfYVTwhIJMqU9mhBX5qhoAw44SqOx7kiBht2yBEOR8RUPsFZ/jIK7xQmV7KpXECSCRhLxlHPXM6NiKgJiCpARN5YPQjCEAZ3SQHcitgXSUDsIe9HJJvfOQWM0PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491715; c=relaxed/simple;
	bh=/WaxHr/fcNNvwBMyYXeMTnOq8nei6iL8c2DAY83YZms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8V/bJ/GY44PepkdzUX78nuU4/7gD6IBm660TRS0Cm5vhcsRphJj316MM98IC8Htbyulz17MBvnHdEJNnFF1dFRub+hciBmUasE244mo1Yh6Iqdn5pR6oy+VOmm+EMJQsXHAVJLnNgrVjvk4tapQz5Wx7vUVLQl0GPRrFoaJBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Q1gJfF0Z; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e6696eb422so678493885a.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1754491712; x=1755096512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+IXGiQjY6etL1HijGeumViSvmoghZhD/MAbBHOTCY8=;
        b=Q1gJfF0ZJQ2wuJsuUHFtQcwByclcU9u8lhDUxFvwQg+8F+uHc42W/w5B3VtMbOr/pD
         2fEb1QzbNc1QQG7qMvUVy3piA86xu+ZD2wgGp6K9R9nHzIlybeKFVKN4nt3AL4QbLCX5
         HOhFLI7UZjQDVx/VzWWKPbCFsQwolGzePLe5s49++dxiXktVdjbSX65R2uxiQoPPvq1A
         Do+PU6xj7g0HHRscGN8G014BaDhyLj/o34Wedj5FYoVj9KVsT1E22UdSzTYKOgisM99p
         4MSsKBO5ssSN410aAoe0IR/MFAcF1QaP+ZZppVxOp8G+sc/lJ3ukNMG8BV9ySMT3t81j
         mhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491712; x=1755096512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+IXGiQjY6etL1HijGeumViSvmoghZhD/MAbBHOTCY8=;
        b=vFkSeZ0bngdfTpnlcQ0uakoi2Rx7bfgQdkUeM8pHBzweOLMg3pBrekpqVt8vUSlNnG
         NvQi5KlDLkkdG+/iyQ+x+6cPPas695dLSnzuSzFMwZwpzR44sFEj9BGKCIhZsyN1UIGh
         1lbqDPqpi64SWL1H7kE0Ujie0D33uxuybF3xAan9enCkFkxZ+jEd+Kn57iP4SIzlG9Gg
         AKspzN9gXnCFywpMWFVkiIvwlGgWaXgvqctAXFxgy+w2OWZxWR2AmM+xFgEzteuTy6wE
         YkciSzdXlgtuOeOrcsyaWeHdMC7XOM5wRVIDuKpbv22O4pD3KAi3w1H4YC/UhaRGyNAt
         VqIg==
X-Forwarded-Encrypted: i=1; AJvYcCVd9oGK6w6DCEq9CxNIW951My8teSW7DstSnzYn8zbk9JrrahRMEq8kiBrAy9BiSOZzYn0/R8FW8AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEet0b3kpzIqK6DxKIGoUda2gLGHKMyYo0AqzreigGrSIJuJi
	etcxC6Cda2sHncptr6HHCVl4sQxHNhbhl0BYs9vQM+ySoirZlmISygm1j9Zsd0ocnQ==
X-Gm-Gg: ASbGncsvJyz9EFAOgRoDbX2ruC2hb+ZQ5IB+WmPMjlkvY+Yry11CSakFali7+LkoLO8
	kPjdyK2Mvm81IZ6mdWSvVbOVVsSKrpR7ZZpNY1UA4en+u7fRYNtnqnkZ9blKXcu3ZLs0GABD6oB
	wiQdbHzon6/Li6QMWc2N7JcArCQPb3KgOnG5kWhc5cvEPm22+hjShgVyMxUcmUUfLT2S3OzF/yl
	n03LaK30igKFmWOkYWxzkEl0foQ5NEvzUmMPYq5rGp50/cfN8JQImtC28uJ4cyGT3urYbpvOT08
	D93nQBqhhYhxaDYYHfYWskprz1Txb21Imh7icw/JgWGWkP1gWxDP26c9A6mVY4ayKt+ZWcepPbn
	bUSwsnLrKzePeWQh6/FreqalwgqApZyVq+qMtbkIC
X-Google-Smtp-Source: AGHT+IEoV2J1KPJpYzF/n7at19yY+noWoVgVnUNgi+OTjlcXhUx/F0riVfkSgi2p1CxUP3mVELiYww==
X-Received: by 2002:a05:620a:2914:b0:7e6:9c12:f0ce with SMTP id af79cd13be357-7e814ed1dadmr517512885a.66.1754491712397;
        Wed, 06 Aug 2025 07:48:32 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm445254285a.82.2025.08.06.07.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 07:48:31 -0700 (PDT)
Date: Wed, 6 Aug 2025 10:48:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	jun.li@nxp.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, andriy.shevchenko@linux.intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: core: hcd: fix accessing unmapped memory in
 SINGLE_STEP_SET_FEATURE test
Message-ID: <2f0148fa-ba18-4711-81dd-89da3bdd1627@rowland.harvard.edu>
References: <20250806083955.3325299-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806083955.3325299-1-xu.yang_2@nxp.com>

On Wed, Aug 06, 2025 at 04:39:55PM +0800, Xu Yang wrote:
> The USB core will unmap urb->transfer_dma after SETUP stage completes.
> Then the USB controller will access unmapped memory when it received
> device descriptor. If iommu is equipped, the entire test can't be
> completed due to the memory accessing is blocked.
> 
> Fix it by calling map_urb_for_dma() again for IN stage. To reduce
> redundant map for urb->transfer_buffer, this will also set
> URB_NO_TRANSFER_DMA_MAP flag before first map_urb_for_dma() to skip
> dma map for urb->transfer_buffer and clear URB_NO_TRANSFER_DMA_MAP
> flag before second map_urb_for_dma().
> 
> Fixes: 216e0e563d81 ("usb: core: hcd: use map_urb_for_dma for single step set feature urb")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

I guess we both overlooked the fact that the URBs used in this debugging 
pathway get submitted in two partial steps.

Alan Stern

