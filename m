Return-Path: <linux-usb+bounces-19632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD80A1930E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 14:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403EC3AB35F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCED5213E67;
	Wed, 22 Jan 2025 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ktQxsJCE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DCE2135C1;
	Wed, 22 Jan 2025 13:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554026; cv=none; b=OWuNMOdJS0jlRE4KVz4TLaronOrWH5M3RsO4vtf+2e7VOqmcFWm0tNIKfRPLJSr30O629V8L9w3RAKH6t+azd0U1UwzRKuB6/741IoywzQHFU8nfHzLyXrvU6UDlggDGmL5MlUOTkNyWnucYXVhMtjIdHeZWSwB30ormkGJPHmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554026; c=relaxed/simple;
	bh=4Vf4u/DUS0He45PGO8oAhg2wt7aOYgByGuqAk0Ft1Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O92GtXkaEEMA8g/TQfTSUn+LWh05y/KTJfyOzGKrU7l0McPQ8dpKzDnaecJqqTrufguQxDVQKwStFS7BhkXkL1C9RJeSKj4cdbIqEc+5PYYY8fL9sZgixjrXiSrdMLh5TNTo/WpEcy/XDyKOoHSgG6AwhGeT+Nt3iYKTNWovY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ktQxsJCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4224EC4CED2;
	Wed, 22 Jan 2025 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737554025;
	bh=4Vf4u/DUS0He45PGO8oAhg2wt7aOYgByGuqAk0Ft1Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktQxsJCEGf0vPP3sGG+zxo7q2x6ZbkNI9PZwVCVFLJd6XP4jYFRf6KQXqda3e1xfM
	 xnGyIQwtQK3BrQ5uGLhaasSZQIpPGQthbY2TixHMskQeTEaQwX+ssH6M0yJfgJf8e/
	 DS3lc1AiN7u73MbBTMHODZuw3ZUW3OLJvQUbwjDw=
Date: Wed, 22 Jan 2025 14:53:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH] usb: core: support interface node for simple USB devices
Message-ID: <2025012200-activist-disprove-808a@gregkh>
References: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>

On Wed, Jan 22, 2025 at 02:47:32PM +0100, Catalin Popescu wrote:
> A simple usb device has a single configuration and a single interface
> and is considered as a "combined node" when defined in the devicetree.
> If available, its interface node is simply ignored which is a problem
> whenever the interface node has subnodes. To prevent that from happening
> first check for any subnode and ignore the interface node only if no
> subnode was found.
> 
> Example: FTDI chip FT234XD that has only one UART interface which is
> being used as a serdev by other driver.
> 
> device@1 {
> 	compatible = "usb403,6015";
> 	reg = <1>;
> 
> 	#address-cells = <2>;
> 	#size-cells = <0>;
> 
> 	interface@0 {
> 		compatible = "usbif403,6015.config1.0";
> 		reg = <0 1>;
> 
> 		bluetooth {
> 			compatible = "nxp,88w8987-bt";
> 		};
> 	};
> };

serdev can not use usb-serial devices due to the lack of hotplugging, so
why is this an issue?  I thought that just would not work.

confused,

greg k-h

