Return-Path: <linux-usb+bounces-7727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5A8763A9
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 12:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B25282949
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 11:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A856856743;
	Fri,  8 Mar 2024 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="m6Z2B9ki"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C305645C
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 11:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709898778; cv=none; b=U15Zb0TCxvTpbx8thcae/W2HZK507nioAeGGFHtSh5/7nCV+ywjRb97e5D5nuQLocL8Ucq8Vw6IUTCtdsdhYv8S2yrQR5frbnKgGIh34InbBQgwnfjcyZGeQ5XGqf4sY0mI04zj9/Cb+/VAJlsoehAgI6X3hp/3h1K6HK2PUN+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709898778; c=relaxed/simple;
	bh=47LPPDaz7lrJErYBNhcjaCyCKxO0cLiShhaU4RxK2Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRNMzAO3XJ6jrChw/2asEtAJJ2s/WuMF6Gh/wqoibzrkL/vcZHjvi5BOiOMKBmOCyI4VNXa6M8h8ffnWXSoITfm7JLPUi+EbAe1SC//hqgdBkieUB8ZpGUrRDZrXMuSW1nuatWhE5ChMf5NckzLSf3iQGfbpaNWWnL6ppEsgyeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=m6Z2B9ki; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Om6ct9ir0Uo8G1CdIyR0hxI9H0pu5I/UArfWef6382o=; b=m6Z2B9kiIQHFGToJcGBWp2/rSz
	TTp353MIIIhfgATmlqrSHOBdpcd4Sb/Y84JE7Km8UfALYYNlRT4MUlpMzQ1xa73ylO68AMpgrBV1B
	MUcXl26Rk4a4zGZ6mFTByCOxnyfPLdDxJ3oZAABID2APrF2QwcOk3PyepIphTXwaTsnj3CmusInwY
	HORSAOspJGLUq7A4oDfvI7zklmRFMPJ+ZfVDXjAzlWKAE3DjWu4BryjkLQlQ8hpe9tT/7QB4s9wxu
	0EQ9xWRMHvfdok+dnWbIYzjT9mU7beKFW3PNMFb5HnfL3L/gSZq3+Ct46p411qiSDBj2/rHisoGri
	XfQWWgPg==;
Received: from [177.62.247.190] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1riYmM-007l9H-9S; Fri, 08 Mar 2024 12:52:46 +0100
Message-ID: <f8452c1a-f13f-2ed0-466b-a0f00c65e15d@igalia.com>
Date: Fri, 8 Mar 2024 08:52:35 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Vivek Dasmohapatra <vivek@collabora.com>,
 "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>
References: <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
 <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
 <20240208235300.pjife5zxfz5onqvk@synopsys.com>
 <b9495221-54be-ae5d-774a-f1450290b104@igalia.com>
 <7594701a-34d7-579b-6c9c-05a18d3ab651@igalia.com>
 <20240307003955.js57ik6cuxhhsae3@synopsys.com>
 <70a7692d-647c-9be7-00a6-06fc60f77294@igalia.com>
 <20240308024222.oaxnvagajnnstxrh@synopsys.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240308024222.oaxnvagajnnstxrh@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2024 23:42, Thinh Nguyen wrote:
> [...]
>> And when in host mode, with USB connected, I see the following on dmesg:
>> "xhci-hcd xhci-hcd.2.auto: xhci_plat_suspend: device_may_wakeup: 1"
> 
> That's great! I assumed you tested remote wakeup from the keyboard?
> 

Hi Thinh, uh..I didn't test keyboard wakeup yday, but tried just now heh
It doesn't work, but I don't think it's related with this patch.

I've also tested with pure XHCI (by disabling DRD mode on BIOS) and it
doesn't wakeup too. So, I personally don't think that "diminishes" this
patch, which is a proper fix. Oh, and also I'm testing through a very
very cheap OTG adapter, so not 100% confidence.

> [...]
> Thanks for testing! I sent out the patch. I think it can be done in a
> single patch. Your Tested-by will be very helpful.
> 

Thank you Thinh, for the great support here - much appreciated!
Cheers,


Guilherme

