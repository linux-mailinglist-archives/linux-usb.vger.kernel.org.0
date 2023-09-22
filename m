Return-Path: <linux-usb+bounces-510-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B96D7AB131
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 13:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 0C246282E01
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 11:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F212E200AF;
	Fri, 22 Sep 2023 11:50:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4033E1DDD0
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 11:50:10 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE455FB;
	Fri, 22 Sep 2023 04:50:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93A1EB53;
	Fri, 22 Sep 2023 13:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1695383309;
	bh=2GbyfCzifSVASFE59umZegd9PqtBJFhWiw0YjYIKeP8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cI3D16xI4CIWHi6aWJvFBJKBlrwQlU18GVC95revLpVQ26H2Dg2pBMw5TLz9CZ9lc
	 O96GvT9BeeOkO69AUG8Eyp9sS6uNEbBNcfhX8Tc8v0pCk5fQ6ICBTRUeinRDM/nM/m
	 ulUd09pgZxWn9kE5LKdfFdUvjT9ojepGTBtOYfvw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230922080421.35145-2-wsa+renesas@sang-engineering.com>
References: <20230922080421.35145-1-wsa+renesas@sang-engineering.com> <20230922080421.35145-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/3] usb: typec: drop check because i2c_unregister_device() is NULL safe
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
Date: Fri, 22 Sep 2023 12:50:05 +0100
Message-ID: <169538340502.2915094.11564554500846900939@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Quoting Wolfram Sang (2023-09-22 09:04:18)
> No need to check the argument of i2c_unregister_device() because the
> function itself does it.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

And this is the same pattern here so:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Build tested only. Please apply to your tree.
>=20
>  drivers/usb/typec/anx7411.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 221604f933a4..b12a07edc71b 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1550,8 +1550,7 @@ static void anx7411_i2c_remove(struct i2c_client *c=
lient)
>         if (plat->workqueue)
>                 destroy_workqueue(plat->workqueue);
> =20
> -       if (plat->spi_client)
> -               i2c_unregister_device(plat->spi_client);
> +       i2c_unregister_device(plat->spi_client);
> =20
>         if (plat->typec.role_sw)
>                 usb_role_switch_put(plat->typec.role_sw);
> --=20
> 2.30.2
>

