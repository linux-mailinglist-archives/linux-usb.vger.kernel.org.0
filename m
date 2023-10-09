Return-Path: <linux-usb+bounces-1314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B1B7BED9E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 23:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35AB12818F4
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 21:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647A642C17;
	Mon,  9 Oct 2023 21:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=soulik.info header.i=@soulik.info header.b="LFrpe3Y9"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894B156E1
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 21:53:42 +0000 (UTC)
Received: from kozue.soulik.info (kozue.soulik.info [IPv6:2001:19f0:7000:8404:5400:ff:fe00:d7d6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A222A99
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 14:53:41 -0700 (PDT)
Received: from [192.168.10.7] (unknown [10.0.12.132])
	by kozue.soulik.info (Postfix) with ESMTPSA id B869F2FEB47;
	Tue, 10 Oct 2023 06:53:37 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 kozue.soulik.info B869F2FEB47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soulik.info; s=mail;
	t=1696888417; bh=faB/WYxE24l8xQ7I8lvT1dFlajYQvzyuiqUittzgSkI=;
	h=Date:To:From:Subject:Cc:From;
	b=LFrpe3Y9PlAQG4KXEa2owmaIRIJRJugHM6oN16KtQgV8KOMYGEl5imSpzodayMdaT
	 N6EzGt5mmmTPvz5HPZf4TYoIQtc/qMfgDdNSu0DVynGPNEmouUJpoQmpdh7fPDVcWL
	 yLsLEU/PdsfPt2F9ujIzgea0hYlWucPgHznvDdZA=
Message-ID: <38fbd171-2d88-4caf-9386-2c8ab45db643@soulik.info>
Date: Tue, 10 Oct 2023 05:53:38 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-usb@vger.kernel.org
From: Randy Li <ayaka@soulik.info>
Subject: a bulk urb with both PIO and DMA buffer?
Cc: linux-spi@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hello

I am trying to write a driver for a USB-SPI adapter(WCH347). The 
protocol of this chip would be consist with two parts, operate code and 
payload length would be the first part. SPI framework could prepare the 
sg_table for the second part which is the payload.

It is worth to do dma transfer for the second part of a bulk packet, but 
I have to prepend a small buffer before it. Then I have to copy the 
scatterlist from the sg_table to append to a new scatter list, that 
costs CPU a lot.

I wonder if there is a way that I could construct a bulk packet with two 
URBs or anyway to make the URB first try a bytes of PIO then DMA?

Sincerely

Randy


