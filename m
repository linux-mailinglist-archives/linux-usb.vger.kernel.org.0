Return-Path: <linux-usb+bounces-5467-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8883AB83
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 15:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9D9E28ADF7
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32A87A70F;
	Wed, 24 Jan 2024 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iGdZfcMP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FF60DD1
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706105957; cv=none; b=GS8Th8qwCZ0XdnG1oHT9/1Fb5WLy7josQta2bkz8ypZciPUS8OpyMLfm3jneYAzapuswAWeMDBf4oVnR0XfI98vOFG53O6SGGpBuzwS9w29cQBoSPF0RlR69I+Pz+wy4HRdbM1GSozGNyW9iBRKb6LPj1111/vuWQ1wuTOenig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706105957; c=relaxed/simple;
	bh=RUGjrbYCpcx4ijiiY3i3NulHMSnp/6sYvFDRGR2dxBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=th+ZsqiA9JWg6uotshvH9NqcWfdbEwwHVhMSqRKMJsK37btIlEbHByQWdDnCS0lUn8chUsqi3SZlLEmlZvaVbeoRgBwL6vxanu68fyBJuOXL9rM7/DXW0rcy+NdtrOd9VMhS2+MSgrYq8kIuB1/ud3GN3D595aGtSJTHuDB5beg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iGdZfcMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DACCC433C7;
	Wed, 24 Jan 2024 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706105956;
	bh=RUGjrbYCpcx4ijiiY3i3NulHMSnp/6sYvFDRGR2dxBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGdZfcMPtLp3Wy0Tf2trRRBA/zEhx+KC1t1yMswPMutWbKGt1OPQWA9FgsK/qhk1c
	 N/GL9Bx2tOThOZE8QAS+2OmLPyomh6bk3ADHKfMIKYNGgwn03YZxCxTA8EDNJ/nvf9
	 asCFykhcs2OR/EvXhoUpRFFd8NgfI5kt2kzasOL4=
Date: Wed, 24 Jan 2024 06:19:14 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhangzhansheng <zhang.zhansheng@h3c.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Ladislav Michl <oss-lists@triops.cz>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Sneeker Yeh <sneeker.yeh@gmail.com>,
	Wangxiaoqing <wangxiaoqing@h3c.com>,
	Xinhaining <xinhaining@h3c.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?= =?utf-8?B?5aSNOg==?=
 [Consulting about: xHCI host dies on device unplug]
Message-ID: <2024012415-unleash-john-ff32@gregkh>
References: <7b049561ce33406ab9b5d0cee7fbd497@h3c.com>
 <9e8bebd2-e51a-cd24-3522-a781bb0b237e@linux.intel.com>
 <e7fddc9147af4adc84f76c07b559ed77@h3c.com>
 <57883406-83f3-9956-16c3-2954ab3744ca@linux.intel.com>
 <64e4153a5cd54cf9bc3eaaf823ba0a31@h3c.com>
 <c756521f-ea5b-7816-5d60-0c61f3275305@linux.intel.com>
 <7e00c498947c4efdb8a96f970656ee03@h3c.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e00c498947c4efdb8a96f970656ee03@h3c.com>

On Wed, Jan 24, 2024 at 02:09:43PM +0000, Zhangzhansheng wrote:
> Mathias：
> 
> Thank you very much!
> 
> > This issue was resolved in 5.19 kernel with patch:
> > 25355e046d29 xhci: use generic command timer for stop endpoint commands.
> 
> > After this patch the timer is started when xHC start processing the command, not when driver queues it.
> > I strongly recommend trying a more recent kernel where all these issues are fixed already.
>  
> I see 5.19 kernel has done what you say.
> 
> Because the kernel version of our company is 4.65 , I need to put the patch to our 4.65 kernel we used.

There is no such kernel version.

> Today compared to the latest kernel is 6.7, I found there are a lot of changes for usb module between kernel 4.65 and 6.7.
> 
> Could you provide me for the issues patch.

If you are stuck at an older kernel version, you are responsible for
keeping it up to date, please get support from the people who are
requiring you to use an older and obsolete kernel version, this is what
you are paying them for.

good luck!

greg k-h

