Return-Path: <linux-usb+bounces-7547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22E872096
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 14:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87223284721
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 13:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734B28613C;
	Tue,  5 Mar 2024 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YLmTQkMy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC21486136
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709646205; cv=none; b=lIfgZPvn5XcxLSobsrlH/0Uev5TKldnFZrRVG9ZxlaurjK1f4U4xCcbihdn2/3qX/Q5SbDnYFC4C8CQ1RLfqlXpo2Xze1udoldVOk03IcMmbjws5lx8Y77d+8MPUdKpQHE/DVXBLbGRoJy6Qyz5Hu7F0suZXjn0tZYPBqyihYus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709646205; c=relaxed/simple;
	bh=vqDSD+PK7HvzCqPFp1zEf/76QDhww0mM7NeR6HWG/ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sACJykzm2SRPwtRR8EIFxG3ztAy+lkC6Hn/ln88KnHQwHKFqpPv4sibeMGkJnd1Ds8oWMLTY6/cb4RkaLYI3OQ/Rl7EA1cbwQBhWX8dGuh/SGU8Kdbj4+p2YdgSS0x/j8e3TNWSkMlk9w+vTtc5OIpFs+Gay9QCwc1QqTOYTtuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YLmTQkMy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDDCC433C7;
	Tue,  5 Mar 2024 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709646204;
	bh=vqDSD+PK7HvzCqPFp1zEf/76QDhww0mM7NeR6HWG/ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLmTQkMyjE2kXDzKc4RhG5rXMLVawrRT6/I7DjnGOoKSL1Et796mc9UJVyk6EIYVb
	 FlU7hOplVeXEXaX3tXKSbKmNYxVzWw6pnoH9EDqEO3KV7fD8ULHtcIp7j+T+YKWFjm
	 ryDgE8cc0Vq73v4zHI2oCMmjon5rPClUHZdP8MLo=
Date: Tue, 5 Mar 2024 13:43:21 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, mario.limonciello@amd.com,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [PATCH v3] xhci: Allow RPM on the USB controller (1022:43f7) by
 default
Message-ID: <2024030509-reflected-reflux-c043@gregkh>
References: <20240304054327.2564500-1-Basavaraj.Natikar@amd.com>
 <2024030555-fervor-unlovely-98c5@gregkh>
 <f9f89ec1-6baf-4a61-e685-a0f311b5a298@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9f89ec1-6baf-4a61-e685-a0f311b5a298@linux.intel.com>

On Tue, Mar 05, 2024 at 03:08:58PM +0200, Mathias Nyman wrote:
> On 5.3.2024 14.04, Greg KH wrote:
> > On Mon, Mar 04, 2024 at 11:13:27AM +0530, Basavaraj Natikar wrote:
> > > Enable runtime PM by default for older AMD 1022:43f7 xHCI 1.1 host as it
> > > is proven to work.
> > > Driver enables runtime PM by default for newer xHCI 1.2 host.
> > > 
> > > Link: https://lore.kernel.org/all/12335218.O9o76ZdvQC@natalenko.name/
> > > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > > Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> > > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> > > ---
> > > Changes in v3:
> > > 	- Reworded the commit message.	
> > > 	- Removed fixes and stable tags.
> > 
> > Why?  Why doesn't this belong in a stable kernel?  It's a quirk fix,
> > don't you want this on systems that are running 6.1 and 6.6?  Or are you
> > willing to wait for 6.9?
> 
> Might be better to add it to stable after it has been upstream for some time.
> 
> Previous attempt to enable default runtime PM for AMD xHCI 1.1 hosts caused
> regressions and had to be reverted from everywhere:
> 
> https://lore.kernel.org/r/20231205090548.1377667-1-mathias.nyman@linux.intel.com

Ok, can you ack this so I can get it into -rc1?

thanks,

greg k-h

