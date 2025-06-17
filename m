Return-Path: <linux-usb+bounces-24823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E472ADC480
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 10:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F12168DD9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 08:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D733A290092;
	Tue, 17 Jun 2025 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOkIy1gb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22E28ECCB;
	Tue, 17 Jun 2025 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148395; cv=none; b=Ip/JQ6oNnuzpzUVzTf7OVmmmiAk5HzN/gKe2nWQYlllqRPCZnCUvH+oEAzk2nTptncxdUWL/POC8wGu7gkMf8wxEZf7Rjuu/Of4/ikmYCHBJp0ED1euEOLKZE8LOizXkjkGY47PqQUIfrWf1IR8/1AKyoBCGIxErSFdJK7FN1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148395; c=relaxed/simple;
	bh=gxwg5xziIv+aRfRJLFFmItst7LG95nO7HUIdm7RqaTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeUdUdyfn25A2jEQEf3Yol5oaP9/EZqqeczU/C6F9whGgu785inMQC+0ayLu3QnKDv7sum/cKXbo6OZA4MW2ijXC7aVBZ5u6lFO+cupHg7vsyJekSzQi6G0uAgSp58+5U9kKPXG4WAw3iIwvoBZFC8A0d9OT8BeK4ZQvz1lQ3Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOkIy1gb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379C4C4CEE3;
	Tue, 17 Jun 2025 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750148394;
	bh=gxwg5xziIv+aRfRJLFFmItst7LG95nO7HUIdm7RqaTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOkIy1gbpvSM6i19tbNNAQUpDWergsLLSwb06WEOfpdQ3xN3afJyk2bVaXArfuXMk
	 dxSekLxizTylM2saFYQITnJV/SbPUcGJM95+iVX2sYT04S1R3Zj1LS3IvTP3ACQ/Bb
	 oiePt/x5k26XSTJxCmrjeGH9QEF2wsFYlyH2VeozUkQjQw9b8wUmdZ72IR/rePLs1C
	 Ng65cp3eFaPsOLoCJenyzYpOvOdTtJqfTkgRU+r24d4Ss8xWXNQMs7XMUZUqGlX9M7
	 ebCy9OVysIwsHPlJ4IquqynnuXicv/08g8zIkf+QQz9e/GN+hlamihKkQxbVBNN/FZ
	 82fZA/zlaN43Q==
Date: Tue, 17 Jun 2025 16:19:45 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] implement workaround for ERR051725
Message-ID: <20250617081945.GA1716298@nchen-desktop>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614125645.207732-1-xu.yang_2@nxp.com>

On 25-06-14 20:56:42, Xu Yang wrote:
> Currently, the USB2.0 phy on some imx7d compliant Soc has below issue.
> 
> ERR051725:
> USB: With the USB controller configured as device mode, Clearing the RS
> bit of USBCMD register fails to cause USB device to be detached
> 
> Description
> 1. USB controller working as high speed device mode with USB gadget
>    function enabled
> 2. Cable plugged into USB host
> 3. Use case is software-controlled detach from USB device side
> 
> The expected result is device side terminations removed, increase in USB
> signal amplitude, USB host detect device is detached. But the issue is
> that the clear RS bit of USBCMD register cannot cause device detach event.
> 
> Workaround
>   - Use the below steps to detach from the host:
>       write USBCMD.RS = 0b
>       write CTRL2[7:6] = 01b
>       write CTRL2[8] = 1b
>   - As CTRL2[8] is set at detach case, so attach the steps should add clear
>     CTRL2[8]:
>       write USBCMD.RS = 1b
>       write CTRL2[8] = 0b
> 
> This will add workaround for it.

Is it imx7d specific PHY issue, since other i.mx SoCs which use chipidea
IP don't have such issue?

Peter
> 
> Xu Yang (3):
>   usb: chipidea: udc: add CI_HDRC_CONTROLLER_PULLUP_EVENT event
>   usb: chipidea: imx: add imx_usbmisc_pullup() hook
>   usb: chipidea: imx: implement workaround for ERR051725
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c |  5 ++++
>  drivers/usb/chipidea/ci_hdrc_imx.h |  1 +
>  drivers/usb/chipidea/udc.c         |  5 ++++
>  drivers/usb/chipidea/usbmisc_imx.c | 39 ++++++++++++++++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  5 files changed, 51 insertions(+)
> 
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

