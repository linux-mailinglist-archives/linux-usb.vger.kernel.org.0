Return-Path: <linux-usb+bounces-7449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C386FA5F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 07:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ABF31C20F8F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 06:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D983D125D3;
	Mon,  4 Mar 2024 06:58:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C371125AD
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709535511; cv=none; b=I6EaHP8wSaUvH+ZifoLVSe3PvC5zfzdWJ95pWGwwt/Acxe0lBNTU0h0cxO4pgkPtuVfgBoFuSsnTBtcAPtvDgGOy8tVZix5wMYTWRuWbIkUvizgfuFwuhl4rj3wo4oR9zgfhC4aeR9CmVYPe3EaH0BWZXc499p8ZBPFHQfafNH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709535511; c=relaxed/simple;
	bh=SiQpVP7687b5imMAY7NV0SRQSIRsAP9Jilt6xur37MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SbLriKL9uWfdPiHhIcqzs2AyOKvZSK+Eqa2yjkEH7hnFpNV0ii2XfNCktUPqITsSerPjjaEgRl7kgRwvNMmu0GUb+cJ8bbIBgWAW0RQgefYaPdvTkMTJ1h4Cnflr6CrSEJQzmaB9xGdUWqSYEUcirR0FAMVpjvgpURxufxP4T38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5aeda0.dynamic.kabel-deutschland.de [95.90.237.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 626F061E5FE01;
	Mon,  4 Mar 2024 07:57:58 +0100 (CET)
Message-ID: <7c10e063-39d0-425a-8f4f-29d411675864@molgen.mpg.de>
Date: Mon, 4 Mar 2024 07:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux warns `usb: port power management may be unreliable` on
 several systems
To: Ivan Hu <ivan.hu@canonical.com>
Cc: fwts-devel@lists.ubuntu.com, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <5406d361-f5b7-4309-b0e6-8c94408f7d75@molgen.mpg.de>
 <7efc3c5b-3237-30c9-1ff2-88747897ed57@linux.intel.com>
 <0cd07b3e-148f-9d0b-7ef4-917b0ed23cbd@linux.intel.com>
 <9c53ec38-812f-f701-d2f6-91e28367bb82@linux.intel.com>
 <62595888-9339-41fa-aab6-f76e581e371f@molgen.mpg.de>
 <fac3f92f-a13e-43b7-b707-e226ac47b256@canonical.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <fac3f92f-a13e-43b7-b707-e226ac47b256@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Ivan,


Thank you for your prompt response.


Am 04.03.24 um 03:13 schrieb ivanhu:
> Paul, thanks for report this.
> 
> Could you help to file a bug on launchpad of fwts?
> Please refer to, 
> https://wiki.ubuntu.com/FirmwareTestSuite/FirmwareTestSuiteReportBug

Done [1].


Kind regards,

Paul


[1]: https://bugs.launchpad.net/fwts/+bug/2051336
      "[FEAT] enable the dumping debug messages on S0ix failure for 
intel platforms"

