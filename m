Return-Path: <linux-usb+bounces-7537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25489871E7F
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 13:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B86801F24DB5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 12:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2959A59B47;
	Tue,  5 Mar 2024 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ezwSalKD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC256758
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640273; cv=none; b=kaPuuEe0/cILSI6ejN7dW8cBagLYKJp05qDpt1IvoGflOLF1xVuTk2LMT4pQhxILaDrZCo5a6+x6+Jaq9Bd5l57e5PNfx/Rtztf/7gBvwoVcArxuSHEtvhPcFQtaSd7klTjQcGt1V08GVlCxjX6IcQhKSELxBfIK05AVAyYMH3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640273; c=relaxed/simple;
	bh=4GvGwRW7exuscAX/Ahlep/KkJmpZc7WIIUhTie9YrRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp0qSJEo8XnemCobVbInMJFFpO+heslalEliMeHlnanJyE86qN0Ja8qVrk4NvL1W+ljelRbnTE6l1XaNj7iS5lP0KnLonOcIyjizw3JAxE4m79zwJjw8PlhZORrSIgaJnxXL3WsaRZu70iyOeMjbyWPai8rjj4DMpO2GZJMdDeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ezwSalKD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C61C433C7;
	Tue,  5 Mar 2024 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709640273;
	bh=4GvGwRW7exuscAX/Ahlep/KkJmpZc7WIIUhTie9YrRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezwSalKD1mVqiC47hIsJAZY6lsEKKQMLyocELbDiDsXph2KUWY1P/yKUjcMbvbFjg
	 tJUrnP3di5OwxnjdOs2Oi1+ORLK6BKWI3T45j4zGA8x8pTZjLqE/h0NFSxJwiW2onb
	 96qXd+Zv9hKVWGAtJ+/U62TM237T+44xise5HcTU=
Date: Tue, 5 Mar 2024 12:04:29 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	mario.limonciello@amd.com,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [PATCH v3] xhci: Allow RPM on the USB controller (1022:43f7) by
 default
Message-ID: <2024030555-fervor-unlovely-98c5@gregkh>
References: <20240304054327.2564500-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304054327.2564500-1-Basavaraj.Natikar@amd.com>

On Mon, Mar 04, 2024 at 11:13:27AM +0530, Basavaraj Natikar wrote:
> Enable runtime PM by default for older AMD 1022:43f7 xHCI 1.1 host as it
> is proven to work.
> Driver enables runtime PM by default for newer xHCI 1.2 host.
> 
> Link: https://lore.kernel.org/all/12335218.O9o76ZdvQC@natalenko.name/
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
> Changes in v3:
> 	- Reworded the commit message.	
> 	- Removed fixes and stable tags.

Why?  Why doesn't this belong in a stable kernel?  It's a quirk fix,
don't you want this on systems that are running 6.1 and 6.6?  Or are you
willing to wait for 6.9?

thanks,

greg k-h

