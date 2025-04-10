Return-Path: <linux-usb+bounces-22907-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCEFA843F8
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 15:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF99719E3058
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 13:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F769285413;
	Thu, 10 Apr 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="smbwOVSv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD3F3A8C1
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290210; cv=none; b=u6LafFqEOYd7SzFM8k1qzB2XgJKVnTpU2oXeQuCayoCTUXDRjZw+OheSBDCoeCueeyW7y4+FFHAK4OGQACKLG+XVDm7P39g5/D5K6NuBDrQZ11DJ9iRwk36ngGyjtg23QPlzaWt+kV7t+38cieV9CHwhMCeFuasK8sQNPdG5MiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290210; c=relaxed/simple;
	bh=iXDf1J1dqhhDW9mJYV7E4M+e5ldqdZ/I6/U2IyK1Qko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVgkH37DyVMojteesqUt2G38SpsIaGojLvgy4kYMDgfCvRiz/YXdCCxYmaDPDO81m/VPu7/nZow05/dgzLgO+aSDokkR6Lo1Ht0HySngkIoSNF0B7Stv08E+yE6oGxJihxw2E2ORJuAjifXigY8KGFjA624ltWjPDW5ENNxGiQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=smbwOVSv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82190C4CEDD;
	Thu, 10 Apr 2025 13:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744290210;
	bh=iXDf1J1dqhhDW9mJYV7E4M+e5ldqdZ/I6/U2IyK1Qko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=smbwOVSvJp4p999doMApuR7BQN5GEKQroH/sESGSVOeC5TTvz35/MUpdgbSUOM0Aa
	 cAGvPCBmQArlYhTiau6ZsGGI+hPcLwGQvQ9b62dYwqQgVd09csgzkKq0RhXJKhAt3+
	 5ZqwiPvKqm4cE/q7xWjDgjyKBXTAthYES17zUaog=
Date: Thu, 10 Apr 2025 15:01:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH 2/3] thunderbolt: Notify userspace about software CM
 tunneling events
Message-ID: <2025041035-jailbird-washed-c866@gregkh>
References: <20250410125600.3074417-1-mika.westerberg@linux.intel.com>
 <20250410125600.3074417-3-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410125600.3074417-3-mika.westerberg@linux.intel.com>

On Thu, Apr 10, 2025 at 03:55:59PM +0300, Mika Westerberg wrote:
> From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> 
> This adds notification whenever software connection manager activates,
> changes or deactivates a tunnel, and also if there is limitation in
> bandwidth.
> 
> The notification looks like below:
> 
>   TUNNEL_EVENT=activated|changed|deactivated|low bandwidth|
>   	       insufficient bandwidth
>   TUNNEL_DETAILS=0:12 <-> 1:20 (USB3)
> 
> Userspace can then listen these and inform user if needed. For example
> if there is not enough bandwidth, it can show warning dialog to the user.
> 
> Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

You didn't sign off on this?  :(

Also, you are adding a new user/kernel api here, where is it documented?

thanks,

greg k-h

