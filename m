Return-Path: <linux-usb+bounces-30977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32367C8B6EA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 19:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4F1A3B3B87
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 18:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CE93128DC;
	Wed, 26 Nov 2025 18:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="jGozHsju"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A7331282A;
	Wed, 26 Nov 2025 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181558; cv=none; b=sDyERTBmc0oPQBMRyel6vhIyEvUV9Hd+/y7PWm5JS3zWTzhCt7VEs2BXHRlu2CAC4QbUff6fiQcvoaPz/TwBgm2fJhcxgh8ecgeKeXLck8Eexnbu0u5sm5tH1BVLiSGOgLTPupShJgpmMa7/38vZZk1uz1briviuufPvLyCHK0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181558; c=relaxed/simple;
	bh=6KvJOR8Q+wOFVKXGPY6tuOCMpAwGjo9hufwrZLDvfTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1Hk/IySLeKAOZZ8s9JqlbaIg2GITDhO2IxrcAo2QF4AB4ruODTnysFqBk88O4g2BJb/OePKp6S6vR/dnpQs4QZG/dEHIiejymfJfAld0ZoO/WJ/U/6RtoCOx2ULZO4LYGQOOYrysgPJGgDRr9ij0yJEuhUXUeOpT2ju/cOkvJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=jGozHsju; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4dGp0B4ymwz47nf;
	Wed, 26 Nov 2025 13:25:46 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1764181547; bh=6KvJOR8Q+wOFVKXGPY6tuOCMpAwGjo9hufwrZLDvfTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jGozHsjuPBD+MtsXJGUjwUc4PhpYd4eZ512iOlwUlNJLZl4lHhz/P5G98lhyEHJov
	 nuS+Zv4aiubhXyCouT7uStwyn1MQR628B71ko4wAyEgdzHZgzxMq1Us2mxlVCqDOaV
	 0ArNrBPgmdImN9ugyBicSdlD8jq/bXA+3Lz+s6wE=
Message-ID: <75b9b15b-4473-4564-bf63-4511bef8ce6d@panix.com>
Date: Wed, 26 Nov 2025 10:25:45 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: typec: ucsi: Get connector status after enable
 notifications
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kenneth C <kenny@panix.com>
References: <20251125-ucsi-v4-1-8c94568ddaa5@chromium.org>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20251125-ucsi-v4-1-8c94568ddaa5@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/25 01:31, Hsin-Te Yuan wrote:

> Originally, the notification for connector change will be enabled after
> the first read of the connector status. Therefore, if the event happens
> during this window, it will be missing and make the status unsynced.
> 
> Get the connector status only after enabling the notification for
> connector change to ensure the status is synced.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Changes in v4:
> - Handle a single connector in ucsi_init_port() and call it in a loop
> - Link to v3: https://lore.kernel.org/r/20251121-ucsi-v3-1-b1047ca371b8@chromium.org

Tested-By: Kenneth R. Crudup <kenny@panix.com>

> ---
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> change-id: 20251117-ucsi-c2dfe8c006d7

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


