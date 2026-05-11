Return-Path: <linux-usb+bounces-37274-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHvdCbUfAmq+oAEAu9opvQ
	(envelope-from <linux-usb+bounces-37274-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 20:28:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A37514701
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 20:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7470930433AE
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 18:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790BC47B43F;
	Mon, 11 May 2026 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KpsuUuia"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0818478E34;
	Mon, 11 May 2026 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523908; cv=none; b=SimR/Z3qpBRI7ZMtXfD13JMrzATg1X6JJkv5fYX9prUeFosH+V1UPW6G3DhO533gpbmFO45ak+3phbztfnWFaVkC8p7Rv2utUBYKH7d6IchndDsBiDQ5Pw05m32iliDlBa4ifSIZUBKbCmROYDZUAXzp798/UxlgVwWkaBCTf8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523908; c=relaxed/simple;
	bh=hCEAWOYFZOMNkCupI4q1ELkm9Ic0SgA3EWCoStJMdZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+cDiIryPPdYduyNsusB4ntiiTZ9Kv4Qm0mm1OjpumMyblRQwM7OvfzP2zNlhZGS5m6l0DrBqAffZPyHurq7xVlgQZIn0Hl5aKVzLfm4uwfzcyP5JeC5fY/9NMEmCS/h2vjcBAK4nVDU2JzQ21iRFGRhCba95BJodBTohcw72II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KpsuUuia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35264C2BCB0;
	Mon, 11 May 2026 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778523907;
	bh=hCEAWOYFZOMNkCupI4q1ELkm9Ic0SgA3EWCoStJMdZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpsuUuiarenoIOPulJisKwFkiyuZNtla5XdbG9TaJxSqZA3NJMTGftB809d15a1II
	 62e1ZpD8O+amMRSzKHpo4diUcYIqwb4Y5F+EzckRocsk/2pnG6wT3sw5u+OMJBfx9g
	 pur+ciIZXclsvFFAgNmaa/NyXfbyASiQY7SoeV3g=
Date: Mon, 11 May 2026 20:25:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rong Zhang <i@rong.moe>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Disable on devices with broken
 firmware
Message-ID: <2026051146-husked-ladybug-0c9f@gregkh>
References: <20260512-ucsi-acpi-broken-devices-v1-1-0f8cd90c35b5@rong.moe>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-ucsi-acpi-broken-devices-v1-1-0f8cd90c35b5@rong.moe>
X-Rspamd-Queue-Id: 97A37514701
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37274-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rong.moe:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 01:59:34AM +0800, Rong Zhang wrote:
> Some Lenovo devices have broken firmware, which reads/writes half-valid-
> half-garbage values.

How does this work with this firmware on other operating systems?  What
is the odds of fixing the firmware?

> Given that everything is broken, disable ucsi_acpi on these devices. The
> impact of disabling it is minimal, as Lenovo laptops usually have most
> USCI commands more or less stubbed, and the EC can always handles USB-C
> events on its own.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221065#c33
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 91 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 6b92f296e985..7632b441d401 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -155,6 +155,91 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
>  	{ }
>  };
>  
> +static const struct dmi_system_id ucsi_acpi_broken_devices[] = {
> +	/* Firmware reads/writes half-valid-half-garbage values. */
> +
> +	/* BIOS: P1CN??WW */
> +	{
> +		.ident = "Lenovo IdeaPad 5 2-in-1 14AHP9",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83DR"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo IdeaPad 5 2-in-1 16AHP9",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83DS"),
> +		},
> +	},
> +
> +	/* BIOS: R0CN??WW */
> +	{
> +		.ident = "Lenovo IdeaPad Slim 5 14AKP10",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83NJ"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo IdeaPad Slim 5 14AKP10",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83HX"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo IdeaPad Slim 5 16AKP10",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83HY"),
> +		},
> +	},
> +
> +	/* BIOS: QXCN??WW */
> +	{
> +		.ident = "Lenovo Yoga 7 2-in-1 14AKP10",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83JR"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo Yoga 7 2-in-1 16AKP10",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83JU"),
> +		},
> +	},
> +
> +	/* BIOS: LNCN??WW */
> +	{
> +		.ident = "Lenovo Yoga Pro 7 14ARP8",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83AU"),
> +		},
> +	},
> +	{
> +		.ident = "Lenovo Slim Pro 7 14ARP8",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83AX"),
> +		},
> +	},
> +
> +	/* BIOS: PSCN??WW */
> +	{
> +		.ident = "Lenovo Yoga Pro 7 14ASP9",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
> +		},
> +	},
> +	{ }
> +};

That is a lot of devices to exclude, are you sure that none of them will
ever work properly?

thanks,

greg k-h

