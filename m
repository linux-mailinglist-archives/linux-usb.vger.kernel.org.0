Return-Path: <linux-usb+bounces-6119-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFF84EE8E
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 02:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33E951C21889
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 01:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4653A34;
	Fri,  9 Feb 2024 01:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="a1vdF4+D"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51248376
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707441502; cv=none; b=GOV5FYCF6J5df7w/mmD+rDfNrgs+Ezl1GeAZogzFjlp8oJc/TZyQfK8FmUmSDI8IMAAUJ+m4qbjCCWebg0gWrabBgTKuaAPiO7oq1YN3sduVQ7JEjxJKg912rMOKA7YQd8ZBjn5MIModYJXgtCmu40ZhAHWNHSOE9doCz04OurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707441502; c=relaxed/simple;
	bh=jEY44nmwvyp8hwvkKsREozTS68rqFfNBV7QgSjDBTgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mF+GN8AUJPrTn4x9vLiE25Q7uemt0oIOgeSepYVaqeat6sE3fkbzw3pHLbTVrkxJEyHFhJD6D3PN2t5IMg1Jl3UtEx4q4ZBeGsk5pEM6uJaw3+dXBSf7e3bYK2yy0CZ0j2xfV94vyX3e4xjFFsAsW9cwN/fDV6Y0zPneFacrFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=a1vdF4+D; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SxE/dlGHkaseF10m6IaRUCiN4JUMgPjd1zuBwkp2iq8=; b=a1vdF4+DVitCMmVrFz4HacnoqD
	4xilxyjyGxCX9y0Bzgjg8N8Zo40dNVIfNqC46NtSqXS3Ir2AKgN8XJaBFuFbboLm34NebnrQ8ITTL
	2v5dLXy5uoEduJcvdjlfDFYDg+xk+tBax7J3pDpi2w8GKaSvQzUsEgmFxfK749iYyjSgwL2PszYKS
	dVtjwsJgPaUfwbor/SA9ziV7wEWxP5lAZFSCbQl9+zxXMoe6W0Ihv1fgBQVFOCyR2ekEfHNWD5rD7
	zr+EZEreYVMqjrKIYgf3/bZ4JX+aNfBYgXA4u+zryTk0h+Oc7zyIe/YFWaoRjl4q0vvDRfWZF/lmc
	kiXNvdtA==;
Received: from [187.90.178.235] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rYFWs-00FQKM-VJ; Fri, 09 Feb 2024 02:18:11 +0100
Message-ID: <b9495221-54be-ae5d-774a-f1450290b104@igalia.com>
Date: Thu, 8 Feb 2024 22:18:03 -0300
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
References: <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
 <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
 <20240208235300.pjife5zxfz5onqvk@synopsys.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240208235300.pjife5zxfz5onqvk@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/02/2024 20:53, Thinh Nguyen wrote:
> [...]
> 
> Thanks. I have some suspicions of what happened. I'll create a patch,
> but I'll need some time.
> 
> Thanks,
> Thinh

Thank you a bunch! Let us know when you have a candidate, I can test it
quickly in the Steam Deck =)

Cheers,


Guilherme

