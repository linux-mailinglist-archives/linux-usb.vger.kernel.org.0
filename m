Return-Path: <linux-usb+bounces-34606-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB/9FC22sWl0EwAAu9opvQ
	(envelope-from <linux-usb+bounces-34606-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:36:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FF268B21
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4FFA31F14EB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 18:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0183E8675;
	Wed, 11 Mar 2026 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcPKneft"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25B3E6DD3;
	Wed, 11 Mar 2026 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253983; cv=none; b=jZvdGqp+Y4SZrooTVx7plsEDi9JlD1JI5SHkoJq+IyiAC5d6Bza3wXDgCI1a8rAkrnc0+o+HGiHBBwP9qfXXrIhTcMoK+Xv5GYNGituSjM4PNmaHA8dEI/1pPahBrpIxzX98ZuiJYBAioSepAjARS5/SPclZdllE8i+CMD4Wg9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253983; c=relaxed/simple;
	bh=yZO0XCw5nlpw0ZrBkeaUHqUFtS/67i2s1DwerNiMRzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuxIYu4SkyRlh/JsTiWtcX1qSrnrV122pDOjKDypa2zEqDdCRns37DRDS4XW0uTXnC0+8gggSuzQya4qhxjbKgduVgT+KKhbIVpqqdUTBqOZy+jxMWbWf6AzaMa7xPRx2oZM5df7jslVD4zGwA3mwC/UkuG6+aOLnpykr9khBL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcPKneft; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DE6C4CEF7;
	Wed, 11 Mar 2026 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773253983;
	bh=yZO0XCw5nlpw0ZrBkeaUHqUFtS/67i2s1DwerNiMRzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcPKneftO7e7cu9I7wgKPzvE8rp8REWFnWWbp21ahdEYs9EDKKOZmkP3roGjxWIfD
	 t4mC/LkqBtsgwuqeWUGk3xE7DGC7juInc5PfVKdi3I7wUYligM2PUbyrQYjdr/df6N
	 L4u3asf4kEV7p8NO/QXs9G8zKMJXBjmA6KDUSTyumC1wSeoF9Nm7KLiBKPLJoJpXMj
	 3KdrlL28pYRF6ueS7YwzYEzrVvj8JWRECq4VNn/7LudeYLWM7z1FF8juOXR8QMtwfZ
	 2vLJKq3CyhfdJ9ed1g9QR4e6nj+1vUo8WYqZeM+UguI/n1z4jbtRvJ9MPYkcPdGClR
	 8w6cNP3UEM1qw==
Date: Wed, 11 Mar 2026 18:32:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add support for Hynetek
 HUSB311
Message-ID: <20260311-married-democrat-f6eb1c651e97@spud>
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
 <20260311-husb311-v1-3-f25bcb58cff7@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6tI4BFSm5nhCNk5R"
Content-Disposition: inline
In-Reply-To: <20260311-husb311-v1-3-f25bcb58cff7@flipper.net>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34606-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xkwy2018.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,flipper.net:email]
X-Rspamd-Queue-Id: B57FF268B21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--6tI4BFSm5nhCNk5R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 08:20:46PM +0400, Alexey Charkov wrote:
> HUSB311 is a pin-compatible and register-compatible drop-in replacement
> for RT1711H, so add its IDs to the existing driver.
>=20
> Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4f0=
9-bacd-0440d2c21088.pdf
> Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Branc=
h_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%2020210526=
=2Epdf
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/t=
cpm/tcpci_rt1711h.c
> index 88c50b984e8a..ac5917c1e253 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -18,6 +18,9 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> =20
> +#define HUSB311_VID		0x2E99
> +#define HUSB311_PID		0x0311
> +#define HUSB311_DID		0x0000
>  #define RT1711H_VID		0x29CF
>  #define RT1711H_PID		0x1711
>  #define RT1711H_DID		0x2171
> @@ -55,6 +58,8 @@
> =20
>  struct rt1711h_chip_info {
>  	u32 rxdz_sel;
> +	u16 vid;
> +	u16 pid;
>  	u16 did;
>  	bool enable_pd30_extended_message;
>  };
> @@ -308,14 +313,14 @@ static int rt1711h_check_revision(struct i2c_client=
 *i2c, struct rt1711h_chip *c
>  	ret =3D i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
>  	if (ret < 0)
>  		return ret;
> -	if (ret !=3D RT1711H_VID) {
> +	if (ret !=3D chip->info->vid) {
>  		dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);

Why are we checking vids and pids here? Rejecting a non-match prevents
using fallback compatibles, so I'd like to know why the code exists.

Is it just here for the sake of it, or to prevent some actual issues?
Not really familiar with USB devices unfortunately.

>  		return -ENODEV;
>  	}
>  	ret =3D i2c_smbus_read_word_data(i2c, TCPC_PRODUCT_ID);
>  	if (ret < 0)
>  		return ret;
> -	if (ret !=3D RT1711H_PID) {
> +	if (ret !=3D chip->info->pid) {
>  		dev_err(&i2c->dev, "pid is not correct, 0x%04x\n", ret);
>  		return -ENODEV;
>  	}
> @@ -405,17 +410,28 @@ static void rt1711h_remove(struct i2c_client *clien=
t)
>  	tcpci_unregister_port(chip->tcpci);
>  }
> =20
> +static const struct rt1711h_chip_info husb311 =3D {
> +	.vid =3D HUSB311_VID,
> +	.pid =3D HUSB311_PID,
> +	.did =3D HUSB311_DID,
> +};
> +
>  static const struct rt1711h_chip_info rt1711h =3D {
> +	.vid =3D RT1711H_VID,
> +	.pid =3D RT1711H_PID,
>  	.did =3D RT1711H_DID,
>  };
> =20
>  static const struct rt1711h_chip_info rt1715 =3D {
>  	.rxdz_sel =3D RT1711H_BMCIO_RXDZSEL,
> +	.vid =3D RT1711H_VID,
> +	.pid =3D RT1711H_PID,
>  	.did =3D RT1715_DID,
>  	.enable_pd30_extended_message =3D true,
>  };
> =20
>  static const struct i2c_device_id rt1711h_id[] =3D {
> +	{ "husb311", (kernel_ulong_t)&husb311 },
>  	{ "rt1711h", (kernel_ulong_t)&rt1711h },
>  	{ "rt1715", (kernel_ulong_t)&rt1715 },
>  	{}
> @@ -423,6 +439,7 @@ static const struct i2c_device_id rt1711h_id[] =3D {
>  MODULE_DEVICE_TABLE(i2c, rt1711h_id);
> =20
>  static const struct of_device_id rt1711h_of_match[] =3D {
> +	{ .compatible =3D "hynetek,husb311", .data =3D &husb311 },
>  	{ .compatible =3D "richtek,rt1711h", .data =3D &rt1711h },
>  	{ .compatible =3D "richtek,rt1715", .data =3D &rt1715 },
>  	{}
>=20
> --=20
> 2.52.0
>=20

--6tI4BFSm5nhCNk5R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabG1WQAKCRB4tDGHoIJi
0kgrAP4upuFyR0UGawjbINMrbZloUR3MmjPrqCZPfQMR31V5TgEAviKDrsSRZ9rJ
nTbMVK1OVS0AhYAEUqnwLHuvJiFYaAw=
=1/re
-----END PGP SIGNATURE-----

--6tI4BFSm5nhCNk5R--

