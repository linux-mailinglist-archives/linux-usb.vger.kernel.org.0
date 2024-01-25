Return-Path: <linux-usb+bounces-5517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F64083D027
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 00:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B4C11F21956
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jan 2024 23:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7E4125BC;
	Thu, 25 Jan 2024 23:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LHqVUSHd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F42111A1
	for <linux-usb@vger.kernel.org>; Thu, 25 Jan 2024 23:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223706; cv=none; b=kRViFtCzki0E30sMQWXfsm2OjKbu2LDinD/KBeUvcQsdyxZBE2lKnIWehhG+evgvkYVbeFAl1tu2gU8Pk/RmoVWVgVz+JGKOsHXj0/qg9IDjrVru/mm5Aq3SPTJDRtxn/pxQQ7toghH/4k1LsLtfDKj1YqulyeFLQ9ZkLlRb3Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223706; c=relaxed/simple;
	bh=pXJ8cEJj5qIdsEqMg4Uyxic/n4QlIxzK9rW37t+oNLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4fWJo8Npu2dGFMnfjX2USVdfKka9fKLfNqjys2E0DYEggw9BWEirF+aj/XaSnxDD1PrgXOAe6r6Bs8Uj9W1ZViC/9zGiXv5qgMsYQ6uQP+E9Ef8VM+nphFQb+zon64lg3lu3ff7ElG/5f66clH6W8a8LuNFV1xtbA6hFhnEyCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LHqVUSHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A81C433C7;
	Thu, 25 Jan 2024 23:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706223705;
	bh=pXJ8cEJj5qIdsEqMg4Uyxic/n4QlIxzK9rW37t+oNLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHqVUSHdrerKwe8JiWHTUn1pp+J/MPK/rkcvMhJV5L06Hv4UCibfj5Gjd5U5BhyJu
	 z8wPU6h9SAkn3ga88YH8UamqB40lq6AsUrGozHSk6qFiSkNmWy7iB0qJ/6n0ufdvD1
	 cXQNE37aBKetauUYLVOStI0kbZEa1A0o4CqqTWp0=
Date: Thu, 25 Jan 2024 15:01:44 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhangzhansheng <zhang.zhansheng@h3c.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Ladislav Michl <oss-lists@triops.cz>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Sneeker Yeh <sneeker.yeh@gmail.com>,
	Wangxiaoqing <wangxiaoqing@h3c.com>,
	Xinhaining <xinhaining@h3c.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiDnrZTlpI0=?= =?utf-8?Q?=3A?= [Consulting about: xHCI host
 dies on device unplug]
Message-ID: <2024012550-irritate-rectangle-981f@gregkh>
References: <7b049561ce33406ab9b5d0cee7fbd497@h3c.com>
 <9e8bebd2-e51a-cd24-3522-a781bb0b237e@linux.intel.com>
 <e7fddc9147af4adc84f76c07b559ed77@h3c.com>
 <57883406-83f3-9956-16c3-2954ab3744ca@linux.intel.com>
 <64e4153a5cd54cf9bc3eaaf823ba0a31@h3c.com>
 <c756521f-ea5b-7816-5d60-0c61f3275305@linux.intel.com>
 <7e00c498947c4efdb8a96f970656ee03@h3c.com>
 <2024012415-unleash-john-ff32@gregkh>
 <f9a4a3fe96514ab4ade2e4e0dcbd77e6@h3c.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9a4a3fe96514ab4ade2e4e0dcbd77e6@h3c.com>

On Thu, Jan 25, 2024 at 01:02:33AM +0000, Zhangzhansheng wrote:
> 
> > >Because the kernel version of our company is 4.65 , I need to put the patch to our 4.65 kernel we used.
> 
> >There is no such kernel version.
> Sorry, I remembered wrongly , the kernel version is 4.4.65.

That is a very very old and obsolete and totally insecure kernel
version, you should not be using that at all.

good luck!

greg k-h

