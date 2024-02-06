Return-Path: <linux-usb+bounces-5926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 642E784B283
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 11:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F29131F25598
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB8918EB2;
	Tue,  6 Feb 2024 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZDjHqqaS"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0381AB7E2
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707215444; cv=none; b=jGyf0L77/0DuoLfacn/iUVmVlBs5O2MvYDFC11I7uAzURIdIf9W+k/wlBWdnFOOOwaazf1rmHP9yO/hjhxzmkymGfdJ9l1WOS+pS9boOmJD91mvU6T/kNaXZ+JYMuFBNF/92LT8TL1wVcvKFivVj0Cvo/43aOFqN+u56FxeiirA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707215444; c=relaxed/simple;
	bh=wT99Bvqlq0fgyBto5GkvCoj6M/dg+SknFH4eZMv0cRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TaQLY5vUuZIHWk1CJkjPN7/da6B5ToZ4J2AZ5Geg0cE0KRlyzlalMFYNblBt347boMrL5eDo11IiIeoGoHmnIVuXCesX9UmPnRG2YVK2IQNUSnMOX+dJx6qDkTaCbstSg/uddxr6tiI+mDM4sXHBr2Zftcwk4pJ+a7Nib05clsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZDjHqqaS; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I14+RlMoFyuC/gNqheel5M5V7d1oUULlC9YLnewItBg=; b=ZDjHqqaS0IpmaqDAKahi5Zl1Xo
	3qH7jfjhbCi/iI89lQ0oFWI8d9lxyrUQsjL1jHG/DySG64KdRqrEvUbOvYb2c+c15jbknrsmmMdCV
	QOia+XaQ/v/SW5CkKvGo823uLbAXoI7XS5D0iIADzoY42Ju3BvST5t1aKM8Oma6ebAMM/j2pYGQjI
	iU/Bhde2Y/rWs2IMMg1aK53MVvs25vE1Y/z+rclKqzQ5u31gW0PQnhbKIzu0jeNjkTkCX8uAmiZgC
	08pI/CZl6evyeb4Spfsldow/3SRl66JW5dErWZpJBy4wz/DqICasdR96FiudK8bLJqTm7GEi0LDd5
	MNSqlyuQ==;
Received: from [187.90.178.235] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rXIih-00EJOi-NO; Tue, 06 Feb 2024 11:30:27 +0100
Message-ID: <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
Date: Tue, 6 Feb 2024 07:30:21 -0300
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
References: <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2024 23:53, Thinh Nguyen wrote:
> [...]
> 
> Looks like it, the delta looks large. But looks like you'd need to do
> some conversion based on your clock frequency. That's not convenient.
> You can check other clock options to see which can print proper
> timestamp. In anycase, we probably don't need to pursue this too far.
> 

Makes sense, thanks!


>> [...]
> Did you still see this print in S3?
> 
> 	xhci-hcd xhci-hcd.2.auto: xhci_plat_suspend: device_may_wakeup: 0
> 
> Or was it this:
> 
> 	xhci-hcd xhci-hcd.2.auto: xhci_plat_suspend: device_may_wakeup: 1
> 

It always shows "device_may_wakeup: 0".
Cheers,


Guilherme

