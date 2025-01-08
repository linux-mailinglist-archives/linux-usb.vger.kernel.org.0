Return-Path: <linux-usb+bounces-19129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63625A057C7
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 11:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41D843A2AA7
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 10:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E641F5407;
	Wed,  8 Jan 2025 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffzFtV0q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFD31F0E33;
	Wed,  8 Jan 2025 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736331223; cv=none; b=HGM50iigBL/4LyJr2fdDWT/TBFiqh+gH9B0ubtz1XgMA7XXOUzM8asXBk+MHn8bK1TEaxfOeEeRg+sMcDhacjUNQclKmbYInRSu5n93qg4p8akTDNpCy6+zKVPsuxnQB9/Kwi7BJVxh8+LA4e/0unfm5R7unbBM9URdZKRuELL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736331223; c=relaxed/simple;
	bh=YXgqajB/pBAvr7CqhE8JBIT6Aoral1OrpZPBcXebkjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPCaGl1UAuFoJEnb042RCGjThFYGTzrJyDl4JwiaRJmdqY0e+jx/HvHCpa1Uy+xJp8ltKFOquYimtuui3G1i/PxzyLv6d+pEGWkZ7U6nDQC269w5xkzPeZBhnoMBUF2lN6uNkEUe1mA1BR/ocmHfjts+nFGobF24Svm9NLKVvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffzFtV0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FE5C4CEE0;
	Wed,  8 Jan 2025 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331222;
	bh=YXgqajB/pBAvr7CqhE8JBIT6Aoral1OrpZPBcXebkjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffzFtV0qhovL6yRmHEFam4U0hO7K+GxnQfrSMov2RKxnumfMjXhcodbOe6c9gt9Mn
	 pM3yTsxtNa+B/AGejAIHwlaridIdregBf6E1YaLEH4fCzf7IaRZs3vWaZc8HK0wp7V
	 iDmTY3StNbIEG2+ccFb98qZEggQgJR7En4sBNEwU4OmmP3BqKUjZnmKr71G4IEXDkw
	 AGKf9S0AyvDc/WGlmsiUSEXfHVTb0IpARf2PwsR4XNX8sc7MsDvlmepLo8RnzF1z+/
	 85WWKsadpT6T1GUDcje9hvvBEZshbYsbP/+GKJIVkAriux7VOhrgW6d3G4D7tLj8RY
	 kqyaAuhWKjgOg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVT4H-000000007uT-0i84;
	Wed, 08 Jan 2025 11:13:41 +0100
Date: Wed, 8 Jan 2025 11:13:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Lode Willems <me@lodewillems.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: CH341: add hardware flow control RTS/CTS
Message-ID: <Z35P1UNKlGzNSQiU@hovoldconsulting.com>
References: <20241218173611.10307-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218173611.10307-1-me@lodewillems.com>

On Wed, Dec 18, 2024 at 06:25:05PM +0100, Lode Willems wrote:
> This adds support for enabling and disabling
> RTS/CTS hardware flow control.
> Tested using CH341A and CH340E.
> 
> Fixes part of the following bug report:
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=197109
> 
> Signed-off-by: Lode Willems <me@lodewillems.com>
> ---
> 
> Changes in v2:
>  - Change the CH341_FLOW_CTL_* values to be 8 bits wide
>  - Set flow control setting unconditionally
>  - Prepare parameters and do one control request
>  - Drop the error message

Thanks for the update.

> +#define CH341_REG_FLOW_CTL     0x27

> +#define CH341_FLOW_CTL_NONE    0x00
> +#define CH341_FLOW_CTL_RTSCTS  0x01

> +static void ch341_set_flow_control(struct tty_struct *tty,
> +				   struct usb_serial_port *port,
> +				   const struct ktermios *old_termios)
> +{
> +	int r;
> +	u16 flow_ctl;
> +
> +	if (C_CRTSCTS(tty))
> +		flow_ctl = ((u16)CH341_FLOW_CTL_RTSCTS << 8) | CH341_FLOW_CTL_RTSCTS;
> +	else
> +		flow_ctl = ((u16)CH341_FLOW_CTL_NONE << 8) | CH341_FLOW_CTL_NONE;
> +
> +	r = ch341_control_out(port->serial->dev,
> +			      CH341_REQ_WRITE_REG,
> +			      ((u16)CH341_REG_FLOW_CTL << 8) | CH341_REG_FLOW_CTL,
> +			      flow_ctl);

I dropped the unnecessary casts above (and will follow-up with a patch
removing one such cast from the existing code). I also think preparing
the index argument once in the call (i.e. (flow_ctl << 8) | flow_ctl))
makes the code a bit more readable.

End result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next&id=35478bc369a67b703a079ee123c6e58290114aae	

Johan

