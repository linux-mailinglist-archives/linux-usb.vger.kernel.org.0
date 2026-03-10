Return-Path: <linux-usb+bounces-34479-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL4qH/0xsGl2hAIAu9opvQ
	(envelope-from <linux-usb+bounces-34479-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 16:00:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C740252C4E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 16:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAD6A346718C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 14:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F7D3033FD;
	Tue, 10 Mar 2026 14:38:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99757302165;
	Tue, 10 Mar 2026 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153528; cv=none; b=O8yu9ZqRq/TPTqFqSeqWa7khGyenT8voOfGR0lhpag8vtYC55NpLEDX8fq1kJoVlq4WeSiZ6VYSSX0PvWI2X/hkFV8WCUtXBDK6mvGRYQJi/a/MEk8/oz4NcCQGkZoq11qgC0zLQKqdNWdVAum4NFzWqCxspFPg5JMnhE8L2kYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153528; c=relaxed/simple;
	bh=ZW6EibVxrWLyQJ1r2ArB4kdwviO6eRse6MrbE++RZbY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZaczIzq18uw0LfxbiIiKAzZo8Pf1OkraN4OTTjgRL9jDQwJoElz91NQNe3uloKX8R2PuFT0OFr/ZyU9RAhBPxcirIaV2i7XbTkpSN7u73NL/VsrUFOC4yFq4Q0MGSALsUGUjohqDo3BP7mnzlSVlcSqFF4kp3yPAXg5RwfgkRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 8483F5808A2;
	Tue, 10 Mar 2026 14:38:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25712205DE;
	Tue, 10 Mar 2026 14:38:31 +0000 (UTC)
Message-ID: <1a459d29a8837059fb75cd64d311424497828aee.camel@hadess.net>
Subject: Re: [PATCH 1/2] USB: apple-mfi-fastcharge: drop redundant device
 reference
From: Bastien Nocera <hadess@hadess.net>
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>,  Hongren Zheng	 <i@zenithal.me>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Mar 2026 15:38:30 +0100
In-Reply-To: <20260305133851.2952-2-johan@kernel.org>
References: <20260305133851.2952-1-johan@kernel.org>
	 <20260305133851.2952-2-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuegrshhtihgvnhcupfhotggvrhgruceohhgruggvshhssehhrgguvghsshdrnhgvtheqnecuggftrfgrthhtvghrnhepieffgfehtedtgefgjeeggfffgeeuvdegveekveejfeekkedujeehteffueefffeunecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeglkffrvheimedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfegnpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepvdehjeduvddvtdehfffgpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepjedprhgtphhtthhopehjohhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghti
 hhonhdrohhrghdprhgtphhtthhopehvrghlvghnthhinhgrmhgrnhgvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihesiigvnhhithhhrghlrdhmvgdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-State: clean
X-Rspamd-Queue-Id: 0C740252C4E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,zenithal.me,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34479-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DMARC_NA(0.00)[hadess.net];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-usb@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.422];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hadess.net:mid,hadess.net:email]
X-Rspamd-Action: no action

On Thu, 2026-03-05 at 14:38 +0100, Johan Hovold wrote:
> Driver core holds a reference to the USB device while it is bound to
> a
> driver and there is no need to take additional references unless the
> structure is needed after disconnect.
>=20
> Drop the redundant device reference to reduce cargo culting, make it
> easier to spot drivers where an extra reference is needed, and reduce
> the risk of memory leaks when drivers fail to release it.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
> =C2=A0drivers/usb/misc/apple-mfi-fastcharge.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c
> b/drivers/usb/misc/apple-mfi-fastcharge.c
> index 339f6cd2e9b2..af266e19f2fd 100644
> --- a/drivers/usb/misc/apple-mfi-fastcharge.c
> +++ b/drivers/usb/misc/apple-mfi-fastcharge.c
> @@ -210,7 +210,7 @@ static int mfi_fc_probe(struct usb_device *udev)
> =C2=A0		goto err_free_name;
> =C2=A0	}
> =C2=A0
> -	mfi->udev =3D usb_get_dev(udev);
> +	mfi->udev =3D udev;
> =C2=A0	dev_set_drvdata(&udev->dev, mfi);
> =C2=A0
> =C2=A0	return 0;
> @@ -231,7 +231,6 @@ static void mfi_fc_disconnect(struct usb_device
> *udev)
> =C2=A0		power_supply_unregister(mfi->battery);
> =C2=A0	kfree(mfi->battery_desc.name);
> =C2=A0	dev_set_drvdata(&udev->dev, NULL);
> -	usb_put_dev(mfi->udev);
> =C2=A0	kfree(mfi);
> =C2=A0}
> =C2=A0

