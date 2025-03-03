Return-Path: <linux-usb+bounces-21289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495AA4CAE4
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 19:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D9CB175026
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 18:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49FE22333D;
	Mon,  3 Mar 2025 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="RSl71dNj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6992163B2
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 18:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741026035; cv=none; b=J3PPFxDQzJDKFk3Cv3wlCjobZ4ai/UW3FRBWtiuqMcr3BLgqNnI7R+oUmR7217OMtLZzmw0oKGfU187X4Ut+0zEb7UF3wa3YXGzCXUHONkVb/GH0uTywyLq/hHcB7XPGIjRgagk7qlSDgFVrM83h2Qn88sakdKzaueaNpX7FdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741026035; c=relaxed/simple;
	bh=HqBoeLDQJVqvNELpOxnOLEFi637GP0hIohYTBoe54sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMC1O4P0cmu3lY2WPy4q54si1yAUSqCISSL5XNoV0EAALjy94ZH8aSlaxDf9S3qaGKYUlD13jztbu06eBnNrUJcdB48lH5ezk6Mbso2Nz+I7YcKcNByNKmGdpG3CoDXHqmnO41pN0UDE8R1u1eMKVu9w6L311H+TBp44AUqyrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=RSl71dNj; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.122] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z66Yq2jsCz4C12;
	Mon,  3 Mar 2025 13:20:31 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741026031; bh=HqBoeLDQJVqvNELpOxnOLEFi637GP0hIohYTBoe54sg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RSl71dNjUh/ETUuj6gyr2B6qWohyjU4blcdlHU32V+yrocbZ1K4t7TUMr2hfCf4G8
	 jh9YopKGRIIwh8uTIs1e9xAHM0c0bSDa4Uevbrd629/b8716Sf2Iado/Sr5IFPPkqh
	 uq7cuuiXOfTiEXdHp5NkJ/9CJcej54wQTV0C7L7w=
Message-ID: <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
Date: Mon, 3 Mar 2025 10:20:30 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
 <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303175818.GB3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/3/25 09:58, Mika Westerberg wrote:
> For discovery we never start the DPRX negotiation but
> we still ended up calling tb_dp_dprx_stop() which does tb_tunnel_put() and
> this releases the tunnel object. All accesses after this and up touching
> already freed memory!

> I've played with the below patch for a while and I have not seen that issue
> anymore. Can you try it out on your end too?

Building now. Fingers crossed!

-K

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


