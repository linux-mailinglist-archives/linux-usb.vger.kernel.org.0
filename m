Return-Path: <linux-usb+bounces-36684-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QORxAFbj8WlZlAEAu9opvQ
	(envelope-from <linux-usb+bounces-36684-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 12:54:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A5493381
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 12:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72F9D305542E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 10:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0CC3EF0DA;
	Wed, 29 Apr 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="QQqdWd4j"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B7C3EB7F0;
	Wed, 29 Apr 2026 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459740; cv=pass; b=jqX4qIDOgDo2382Cosn8n80KXaV2Uee3uI8Rr6HVju5wRkVb4N/YsYHGS43/9vBLG+MeNPJuJ0E1eoVlHIIBS4ghQ/KzRqbhAo+fp/FkUIFvVRYdVhr4I8HFgK3Nyt08zbz+8+uXopXrJKwx0xYEBP9S0TtdoVHRwOPCZ4DsLL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459740; c=relaxed/simple;
	bh=n+XEzd35V5TVE/3fJD22Wkv86AdUN7RgfON7Jl7TAwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvU5n9QOpqR3+a0SKr65Y09Ai48X6CZKAnFD9Bp3jWfHVd7FNHlSVAwovx1UJsFPm/DIe7qriZbrIC2a54arlgY9YX0gLcM4AQBMy8INAEMmxyl/NMdXivtgiAmF3cQsK9o04hafZc6qBqI/9NsGi7aouz65oiurlyn4pBbhtAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=QQqdWd4j; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1777459734; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BMmdd9U4sNbczuyvfzq5v9Lqh9m3OTIg4LRFfT7Hi/eEgjtLdOQFAnhQ3tsStvgiNgz1/T+lU9ZDja9Ou/LStJKknTWCgQkKVhpu2KyBMpU5o0c8jWot7IsjpVUHGWB3N45gDn+ep5NuIjjoeYt928Hp1rqq2H4S/ZpqAYsb70Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777459734; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bW2XSaTHlR/SLI0WVuREvEKeZHp89AVgJnUeaB+guSE=; 
	b=bdPF/InJPLq1jvbnXCZjwBgz3C7IM699pXniDQQfSPh7VJGUkTsN2XWeTMabIxOo4H/b2sS/qJlr7aNrmhWNnYJx+YBVQj0OG2AZGloLQi5YdJGsYMZo4+H+I8ncpP3PDRHCEq6eE8uM8XF2dkT3zaAQZ88YTrljYoQbYq7llVE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777459734;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=bW2XSaTHlR/SLI0WVuREvEKeZHp89AVgJnUeaB+guSE=;
	b=QQqdWd4jiZnKvC0evdDhZ7QZU9ugA9xL4lfmdgAMuF6zT9P4GqXg39N2d+w8TudB
	FuuOsP5jnM1mbqgxVZfxc6g374oLQwPpW+hnzeiAn6VcRXEm4QRav2weET6gorIL8oQ
	xyClzxR02+dxDX2KdYgKebKJZVVQsNIgbkweuZrQ=
Received: by mx.zohomail.com with SMTPS id 1777459731003732.6365893277916;
	Wed, 29 Apr 2026 03:48:51 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id E5882180D23; Wed, 29 Apr 2026 12:48:47 +0200 (CEST)
Date: Wed, 29 Apr 2026 12:48:47 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: fusb302: Fix resource leak when
 devm_drm_dp_hpd_bridge_add() fails
Message-ID: <afHh6Xya9PM-qlSZ@venus>
References: <20260428-fusb-v2-1-aa3b5942cabb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7z4xjklhkkh7mywg"
Content-Disposition: inline
In-Reply-To: <20260428-fusb-v2-1-aa3b5942cabb@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.2.1.5.2/277.446.87
X-ZohoMailClient: External
X-Rspamd-Queue-Id: 8A3A5493381
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36684-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email]


--7z4xjklhkkh7mywg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] usb: typec: fusb302: Fix resource leak when
 devm_drm_dp_hpd_bridge_add() fails
MIME-Version: 1.0

Hi,

On Tue, Apr 28, 2026 at 09:18:21PM +0800, Felix Gu wrote:
> If devm_drm_dp_hpd_bridge_add() fails during fusb302_probe(), the original
> code returned directly without cleaning up the resources.
>=20
> Move bridge registration before the IRQ is requested and route bridge
> registration failures through the existing TCPM unregister and fwnode
> cleanup path.
>=20
> Fixes: 5d79c525405d ("usb: typec: fusb302: add DRM DP HPD bridge support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Fix Heikki's comment.
> - Link to v1: https://lore.kernel.org/r/20260421-fusb-v1-1-0a9dd64e785b@g=
mail.com
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/usb/typec/tcpm/fusb302.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 889c4c29c1b8..9ab1277b7ed1 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1751,19 +1751,22 @@ static int fusb302_probe(struct i2c_client *clien=
t)
> =20
>  	bridge_dev =3D devm_drm_dp_hpd_bridge_alloc(chip->dev, to_of_node(chip-=
>tcpc_dev.fwnode));
>  	if (IS_ERR(bridge_dev)) {
> -		ret =3D PTR_ERR(bridge_dev);
> -		dev_err_probe(chip->dev, ret, "failed to alloc bridge\n");
> -		goto destroy_workqueue;
> +		ret =3D dev_err_probe(chip->dev, PTR_ERR(bridge_dev),
> +				    "failed to alloc bridge\n");
> +		goto fwnode_put;
>  	}
> =20
>  	chip->tcpm_port =3D tcpm_register_port(&client->dev, &chip->tcpc_dev);
>  	if (IS_ERR(chip->tcpm_port)) {
> -		fwnode_handle_put(chip->tcpc_dev.fwnode);
>  		ret =3D dev_err_probe(dev, PTR_ERR(chip->tcpm_port),
>  				    "cannot register tcpm port\n");
> -		goto destroy_workqueue;
> +		goto fwnode_put;
>  	}
> =20
> +	ret =3D devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> +	if (ret)
> +		goto tcpm_unregister_port;
> +
>  	ret =3D request_threaded_irq(chip->gpio_int_n_irq, NULL, fusb302_irq_in=
tn,
>  				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>  				   "fsc_interrupt_int_n", chip);
> @@ -1774,14 +1777,11 @@ static int fusb302_probe(struct i2c_client *clien=
t)
>  	enable_irq_wake(chip->gpio_int_n_irq);
>  	i2c_set_clientdata(client, chip);
> =20
> -	ret =3D devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> -	if (ret)
> -		return ret;
> -
> -	return ret;
> +	return 0;
> =20
>  tcpm_unregister_port:
>  	tcpm_unregister_port(chip->tcpm_port);
> +fwnode_put:
>  	fwnode_handle_put(chip->tcpc_dev.fwnode);
>  destroy_workqueue:
>  	fusb302_debugfs_exit(chip);
>=20
> ---
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> change-id: 20260421-fusb-0e7085ce431a
>=20
> Best regards,
> --=20
> Felix Gu <ustc.gu@gmail.com>
>=20

--7z4xjklhkkh7mywg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmnx4ggACgkQ2O7X88g7
+ppYgA/+OZ34XEeKIoyWCrrqm5+JaBrmX/40l6wHQ1vxO1lsvSOAf2s6+1vFr+VK
Vf+0SeXcl33mwvqpwhXZG4pjr69rnekCfa91PEJYcRnCcjTp0N/j455e8gBPZOZw
cMIvUhXeUuvTs+N59S0ln3K0EEIKceaei7V2W7kr0iHLrVSHEzSO94PyIowZI//E
quo4j2yKGh4WO8fb819T3lCvTs7NJPLD/kvAQfWwa4XDBGLxLqndKFKynbB6ni6s
C7bMmmftXbDpDk9JM2ZLVsTAYGAsJ8Ov3UnrhTJinIzDmZtQK5+Cz5ZJL5bRuFk0
IUkl8tDvslKPKReTCQ8+ZZIs/gaQYnKixrmx7GeaUHcnTvv5QAXzKAYczrHuM5Li
N33uNdoAIptchW4VKGUfn7o7sZv0sOxM374b4MZpmF0kS2WLjsT7HhqRuV2+VXGV
ldBD67Jwq6CY4CL0qLWrrtc7HrwzFbAcLja+5QfkMW7OwQskZWPv8rtICErJR4io
6PRh4cf5prHzS9tcrJbS0IyVgdUBsaxLST/J+ZpkDgAbWZENtV7Y13Dd9oYYNA9f
DB69j0m3wnL9p9XTCbetgEVxVjl9LktewmN24nGIWEycnYQkJ34+g8VytWaHcJ9p
yDGP7uyLu5onc17ozPtGe8E/JhVK40tf3e81sJtky5DjxuKQOEg=
=br90
-----END PGP SIGNATURE-----

--7z4xjklhkkh7mywg--

