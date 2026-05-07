Return-Path: <linux-usb+bounces-37087-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJX4ErWe/Gn3RwAAu9opvQ
	(envelope-from <linux-usb+bounces-37087-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 16:16:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D55FD4E9F5E
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 16:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F46C301D69E
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 14:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E43402BBB;
	Thu,  7 May 2026 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OydIGyjn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A563FB7D9;
	Thu,  7 May 2026 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163204; cv=none; b=eYIdgydohihBr/xNYm3nk89pwE/cr+V3AXjc0HNuQViLlHhXlXo3qxQi1EPdIF7dRtVJMubbNJQrqAGRi7zu+wWmnhqehL7KmW7Vo6/JcJBpFRxgMJIe4Abl29fkaGdV1FieKtqSSlUCtBWYMIuGevEan9Qc5RmDRiUAjOT4xSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163204; c=relaxed/simple;
	bh=O6Tzhw3Ome/+LwTqlHUnprQL96WbB/qZqHFXwAUIeNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRn1unLkCeI0EfUSc0hlDgkLWiOhzSvq7hkzcTqDd9ahbXVKf/iA/GNzhm2IHwIeJHZMs13s0yQWdBiWbLeTDBXNKkDpCqdjQXdLdlizu2LjNhJXijbDGT1MI8olVJ0crxCC9JPSg7rJiQLWR4BjBMti3hgedvQy4DH+ZKCfAMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OydIGyjn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B328C2BCB2;
	Thu,  7 May 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778163204;
	bh=O6Tzhw3Ome/+LwTqlHUnprQL96WbB/qZqHFXwAUIeNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OydIGyjncdvPwyJM0HvqgbqGQ4aauCY1dz+BxHz2gOIx/P5HqIVbwC6iMxe5msEwD
	 s6H4OWgEI/wFkSSGP6sN6vcE/uFIddIjcDq35vupCiO/1XjGXjjpGoVq2NjeOaR/3t
	 9DzV/UFdWf9slla4mh9fCuVDOLw7YEE2Lk/pyV/GO13VJexsLqY0kyMXNReXQncXth
	 d1liXk/cEFUpYw7W6rOkegGzpi5myVz2g9Fzv9hXFMDJZjkG3CcdNTCfKx9eTHxRXf
	 tZTO9n2kAq1h2jZEDYcPVlCRmZJTbczFhWeyBCXznwpJuJSAyuszM36bPJ9GK48Q8c
	 YBOXBYp2WA76Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wKzTd-00000001C1t-2dLi;
	Thu, 07 May 2026 16:13:21 +0200
Date: Thu, 7 May 2026 16:13:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] usb: serial: mxuport: add support for more MXU50U
 UART devices
Message-ID: <afyeAYp76FpbP7Co@hovoldconsulting.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-2-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324035041.352190-2-crescentcy.hsieh@moxa.com>
X-Rspamd-Queue-Id: D55FD4E9F5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37087-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 24, 2026 at 11:50:38AM +0800, Crescent Hsieh wrote:
> Add support for additional Moxa devices using the MXU50U UART family.

Please mention which models since its not obvious from the PID defines
which mostly reflects the PID itself.

You should amend the driver header as well which lists the currently
supported models.

> Extend the device ID table and port-count handling for 3-, 5-, 6- and
> 7-port devices, and update firmware selection to use the matching
> MXU50U firmware images and version offsets.
> 
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>
> ---
>  drivers/usb/serial/mxuport.c | 132 +++++++++++++++++++++++++++++++----
>  1 file changed, 118 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index ad5fdf55a02e..034b506322c2 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c
> @@ -39,6 +39,25 @@
>  #define MX_UPORT1613_PID	0x1613
>  #define MX_UPORT1653_PID	0x1653
>  
> +#define MX_UPORT1252_PID	0x1252
> +#define MX_UPORT1253_PID	0x1253
> +#define MX_UPORT1411_PID	0x1411
> +#define MX_UPORT1452_PID	0x1452
> +#define MX_UPORT1453_PID	0x1453
> +#define MX_UPORT1619_PID	0x1619
> +#define MX_UPORT1659_PID	0x1659
> +#define MX_UPORT165A_PID	0x165A
> +#define MX_UPORT165B_PID	0x165B
> +
> +#define MX_MU250U_PID		0x0250
> +#define MX_MU450U_PID		0x0450
> +#define MX_MU850U_PID		0x0850
> +
> +#define MX_MU850U_6PORT_PID	0x7002
> +#define MX_MUX50U_3PORT_PID	0x7003
> +#define MX_MU850U_5PORT_PID	0x7004
> +#define MX_MU850U_7PORT_PID	0x7005
> +
>  /* Definitions for USB info */
>  #define HEADER_SIZE		4
>  #define EVENT_LENGTH		8
> @@ -48,6 +67,9 @@
>  #define VER_ADDR_1		0x20
>  #define VER_ADDR_2		0x24
>  #define VER_ADDR_3		0x28
> +#define NEW_ADDR_1		0x86
> +#define NEW_ADDR_2		0x88
> +#define NEW_ADDR_3		0x8A

These are still offsets for the version so please include that in the
name. And "new" tends to get old, better to include the family name, so
something like:

	MXU50U_VER_ADDR_n

>  /* Definitions for USB vendor request */
>  #define RQ_VENDOR_NONE			0x00
> @@ -147,9 +169,13 @@
>  #define MX_WAIT_FOR_SEND_NEXT		0x0080
>  
>  #define MX_UPORT_2_PORT			BIT(0)
> -#define MX_UPORT_4_PORT			BIT(1)
> -#define MX_UPORT_8_PORT			BIT(2)
> -#define MX_UPORT_16_PORT		BIT(3)
> +#define MX_UPORT_3_PORT			BIT(1)
> +#define MX_UPORT_4_PORT			BIT(2)
> +#define MX_UPORT_5_PORT			BIT(3)
> +#define MX_UPORT_6_PORT			BIT(4)
> +#define MX_UPORT_7_PORT			BIT(5)
> +#define MX_UPORT_8_PORT			BIT(6)
> +#define MX_UPORT_16_PORT		BIT(7)

We don't need 8 bits to encode up to 16 ports. Please rebase this on the
patch I just submitted here which cleans this up:

	https://lore.kernel.org/r/20260507141114.284470-1-johan@kernel.org

> @@ -1053,6 +1119,7 @@ static int mxuport_probe(struct usb_serial *serial,
>  	int local_ver;
>  	char buf[32];
>  	int err;
> +	bool is_mux50u = false;
>  
>  	/* Load our firmware */
>  	err = mxuport_send_ctrl_urb(serial, RQ_VENDOR_QUERY_FW_CONFIG, 0, 0);
> @@ -1065,12 +1132,41 @@ static int mxuport_probe(struct usb_serial *serial,
>  	if (err < 0)
>  		return err;
>  
> -	dev_dbg(&serial->interface->dev, "Device firmware version v%x.%x.%x\n",
> +	dev_dbg(&serial->interface->dev, "Device firmware version v%d.%d.%d\n",

This looks like an unrelated change. Please do this in preparatory patch
explaining why you prefer decimal notation.

>  		(version & 0xff0000) >> 16,
>  		(version & 0xff00) >> 8,
>  		(version & 0xff));
>  
> -	snprintf(buf, sizeof(buf) - 1, "moxa/moxa-%04x.fw", productid);
> +	switch (productid) {
> +	case MX_UPORT1252_PID:
> +	case MX_UPORT1253_PID:
> +	case MX_UPORT1411_PID:
> +	case MX_UPORT1452_PID:
> +	case MX_UPORT1453_PID:
> +	case MX_UPORT1619_PID:
> +	case MX_UPORT1659_PID:
> +	case MX_UPORT165A_PID:
> +	case MX_UPORT165B_PID:
> +		is_mux50u = true;
> +		snprintf(buf, sizeof(buf) - 1, "moxa/moxa-up-mux50u.fw");
> +
> +		break;
> +	case MX_MU250U_PID:
> +	case MX_MU450U_PID:
> +	case MX_MU850U_PID:
> +	case MX_MU850U_6PORT_PID:
> +	case MX_MUX50U_3PORT_PID:
> +	case MX_MU850U_5PORT_PID:
> +	case MX_MU850U_7PORT_PID:
> +		is_mux50u = true;
> +		snprintf(buf, sizeof(buf) - 1, "moxa/moxa-pf-mux50u.fw");

We shouldn't have to maintain two tables with PIDs so please encode this
information in the id-table (using two new flags) if you really can't
query the device about this.

We already request the running firmware version. That's not enough to
determine if this is a mux50u device? Perhaps there is some other way?
Can the descriptors be used (e.g. bcdUSB)?

What does "up" vs "pf" stand for? Please mention this in commit message
as well (i.e. the two subfamilies).

> +
> +		break;
> +	default:
> +		snprintf(buf, sizeof(buf) - 1, "moxa/moxa-%04x.fw", productid);
> +
> +		break;
> +	}
>  
>  	err = request_firmware(&fw_p, buf, &serial->interface->dev);
>  	if (err) {
> @@ -1080,14 +1176,22 @@ static int mxuport_probe(struct usb_serial *serial,
>  		/* Use the firmware already in the device */
>  		err = 0;
>  	} else {
> -		local_ver = ((fw_p->data[VER_ADDR_1] << 16) |
> -			     (fw_p->data[VER_ADDR_2] << 8) |
> -			     fw_p->data[VER_ADDR_3]);
> +		if (is_mux50u) {
> +			local_ver = ((fw_p->data[NEW_ADDR_1] << 16) |
> +				     (fw_p->data[NEW_ADDR_2] << 8) |
> +				     (fw_p->data[NEW_ADDR_3]));
> +		} else {
> +			local_ver = ((fw_p->data[VER_ADDR_1] << 16) |
> +				     (fw_p->data[VER_ADDR_2] << 8) |
> +				     (fw_p->data[VER_ADDR_3]));
> +		}

This is probably better handled in a helper function which can make sure
that the right offsets are used depending on the family. For example:

	mxuport_parse_fw_version(const struct firmware *fw, bool mux50u)

>  		dev_dbg(&serial->interface->dev,
> -			"Available firmware version v%x.%x.%x\n",
> -			fw_p->data[VER_ADDR_1], fw_p->data[VER_ADDR_2],
> -			fw_p->data[VER_ADDR_3]);
> -		if (local_ver > version) {
> +			"Available firmware version v%d.%d.%d\n",
> +			(local_ver & 0xff0000) >> 16,
> +			(local_ver & 0xff00) >> 8,
> +			(local_ver & 0xff));
> +
> +		if (local_ver != version) {

This looks like a behaviour change that should be motivated. Why is it
OK to downgrade the device fw?

>  			err = mxuport_download_fw(serial, fw_p);
>  			if (err)
>  				goto out;
> @@ -1098,7 +1202,7 @@ static int mxuport_probe(struct usb_serial *serial,
>  	}
>  
>  	dev_info(&serial->interface->dev,
> -		 "Using device firmware version v%x.%x.%x\n",
> +		 "Using device firmware version v%d.%d.%d\n",
>  		 (version & 0xff0000) >> 16,
>  		 (version & 0xff00) >> 8,
>  		 (version & 0xff));

Johan

