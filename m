Return-Path: <linux-usb+bounces-46-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A537C7A015F
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAA281C20AFA
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 10:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9801F927;
	Thu, 14 Sep 2023 10:14:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95CFF9FF
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 10:14:07 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3B61BE9;
	Thu, 14 Sep 2023 03:14:07 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5EA6166072FF;
	Thu, 14 Sep 2023 11:14:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694686445;
	bh=OFvsdCQ1KzQj5G85fRFDOIGP6wxoxx66ab2XPVsGYNo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O5eUS/j1EBqT+GT8lG7w3gmWCXNr2WoXzTo1g6W1TgY2sSvzHB3bBi3TJdiAlBan4
	 +WjXI2p4inBo+YqHFBQc/e86tTAYh+SSrDojVvTurYT4QYCNbcIp9RCBLdplp3BO4f
	 0oQTHfsVeS3RffWfG5UPpm1qh6asxrLn4fw7I8NLK7YDoPsZa5ce501l6C4R/+OD1N
	 n9z15xKyg7cdpENK/KbCGPyTsMgitMdqV8MarY+8xbWePdNJSK1QtS9PpGjVi3YfwM
	 cZezC6cCVVTomAhDjI6+L+evhMvinI0oqdQxpDTHyq7BG2S0L0Mm/3Qb5mbUcn9Hvc
	 vo8IGJqCve3/g==
Message-ID: <712ab5f3-eb61-f7e5-fc67-c6c175beaac0@collabora.com>
Date: Thu, 14 Sep 2023 12:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] usb: xhci-mtk: add a bandwidth budget table
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230830122820.18859-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230830122820.18859-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 30/08/23 14:28, Chunfeng Yun ha scritto:
> In order to estimate when fs/ls transactions appear on a downstream bus,
> the host must calculate a best case full-speed budget, use a table to
> track how many bytes occure in each microframe.
> This patch is prepared for introducing an improved bandwidth scheduling.
> 

Hello Chunfeng,

it would be helpful if you add a cover letter with some test results for
the BW improvements that you're seeing here.

Thanks,
Angelo

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk-sch.c | 113 +++++++++++++++++++++++---------
>   drivers/usb/host/xhci-mtk.h     |   4 +-
>   2 files changed, 85 insertions(+), 32 deletions(-)
> 


