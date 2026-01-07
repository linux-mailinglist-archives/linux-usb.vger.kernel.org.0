Return-Path: <linux-usb+bounces-32014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8E0CFEE73
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 17:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 117D6342A64E
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 16:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B8A36CDF7;
	Wed,  7 Jan 2026 16:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S2QrhmF6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62331346A12
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802007; cv=none; b=OgabBbzrakNlSVXavkOD/i3Pk9F7TSWaL91uVdnkXHBgjGycDa8ndkUQvQqE2jIcMfocANRA15jfv1qDoyXC10UjrIOGoc33sMFninjyVUobPjt1pHPQ2+Taq4QoFSSsun2IO/m46IJRMtY7xB3mn9axcc7CRYdpRGxqJOBcwF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802007; c=relaxed/simple;
	bh=A3uLN2sLXFl+jQQ0nuNHBt9MpYlXFtanOmU/VazI8BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsHbqDuhDhw5x9bGy0x6DG8igO2KdrsYGzIugb1ECBEvJy/98ao+AvtFclkGEjqhgNha+dSpDgGK6yTdDvSn5HsM7r45wirIg2eb/zDF2xbXJ6m9nmqvgFW3WGlB7MfwQcKJst3hvA64oazaDNCXZLgC/XpcJmABhqatp1gj6M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=S2QrhmF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54F9C4CEF1;
	Wed,  7 Jan 2026 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767802005;
	bh=A3uLN2sLXFl+jQQ0nuNHBt9MpYlXFtanOmU/VazI8BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2QrhmF6Azxqe1jX2CJSpz8TVYHRxp2Dl3ufjWYEm87oAlXLTd4yR9ok/tesAMGU8
	 HF1vA5S3AvvsWWgKyVfPedUlopLLI+mu6hQl3FyydrQbfobSsJ12iizqRXXL2wav6+
	 hyMTURhwXadDLg1y+28xLowbqpEC3PaQcUQmbFLk=
Date: Wed, 7 Jan 2026 17:06:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Johannes =?iso-8859-1?Q?Br=FCderl?= <johannes.bruederl@gmail.com>
Cc: linux-usb@vger.kernel.org, larsm17@gmail.com
Subject: Re: [PATCH v3 1/1] usb: core: add USB_QUIRK_NO_BOS for devices that
 hang on BOS descriptor
Message-ID: <2026010722-desecrate-tribunal-9934@gregkh>
References: <a9088e84-3800-4a87-a639-9a2a48036873@gmail.com>
 <20251207090220.14807-1-johannes.bruederl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251207090220.14807-1-johannes.bruederl@gmail.com>

On Sun, Dec 07, 2025 at 10:02:20AM +0100, Johannes Brüderl wrote:
> Add USB_QUIRK_NO_BOS quirk flag to skip requesting the BOS descriptor
> for devices that cannot handle it.
> 
> Add Elgato 4K X (0fd9:009b) to the quirk table. This device hangs when
> the BOS descriptor is requested at SuperSpeed Plus (10Gbps).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220027
> Signed-off-by: Johannes Brüderl <johannes.bruederl@gmail.com>
> ---
> Hi Lars,
> you are right, good catch! This should be correctly sorted now.
> 
> v3: Move quirk entry to correct position in sorted VID:PID order.
> v2: Return -ENOMSG instead of 0 to properly indicate no BOS data.

Ok, in playing with this some more, I think this is the best thing for
now.  I'll go queue this up now.

thanks,

greg k-h

