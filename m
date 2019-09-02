Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97C21A5079
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 09:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbfIBH52 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Sep 2019 03:57:28 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51966 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729475AbfIBH52 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Sep 2019 03:57:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id k1so13407825wmi.1;
        Mon, 02 Sep 2019 00:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OQtsDwA9I+Tza2Y0yTXKMLIS8kMN4BbKk5t3LW7GgBI=;
        b=lyRP1dn+10bSUGSHIXjfWpd8HHoPYyVSVchAhVfoqGXf9d0wdLfndLzGSSVi4LZhDy
         JvI/xgfusFuaPUI2At1xC5AIITzffO0vnUVeI0nbK/mtITytCfHoVLoyLm2Vk75jXhnA
         LhSNJAbGtKu4wAxlEIHxCm5tEXJj5Dg7Z6NDLS3CactFDMY3cLnfMLkXKwS5Tpr71AnB
         HGRGziEyDMeEVJLgOdJ4I70m3KTYh048JvnRDy5pSIWivrJ4F2JUfSrVPUCci+UrVjMm
         ms6UkRuLwRLJ863bXew1Kz6sW0fkC0bYf96HZ49rjc7A2Vvp5suQG2s9Qn6MyR30UQ5h
         9rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OQtsDwA9I+Tza2Y0yTXKMLIS8kMN4BbKk5t3LW7GgBI=;
        b=SwfSEZbY0AisjlCzkcSPwpII7X8JQN2d20KGwOSoBzNruHJijK2QF7ZfcfsZaLHHF9
         bbvwKZg+9gKXVso6OyzWZoXMPlW95EZlWJ6SvsQnZnd3v0wEttMuNbm6kdTkDdPDKPSz
         ktJ/zaUFjltSaVqXdWRPUYz4DnH3tQuEvLYJf/r2R7xOuumJQ8G1b1CK6VOKBB3TbQM5
         LooOuGYtXDtJQ8uUeHMEVAqwC/TnYnK7XXJNQ9rtVYxKOLQ5w6uq3rJUqDdHT5OqNOVN
         rVPZU7aB2ZxZu8ZehIH946Ad11rJSrwD1oTAkuTWR9jua+7TyReMyMyxC6K20EZM1zsU
         qYCw==
X-Gm-Message-State: APjAAAVcaKzggautxCgzgMel6A9+jrwPAIGHxZx0cX9QGlK1d/EcrrdQ
        tn3k71eEEH6xKwZminsBVh8=
X-Google-Smtp-Source: APXvYqwWcZcKzr1xmd2INvFXdVEfqkNMRz7QhHyKaFpUFetoAzagS4B7LivGvj4hRXJQBT1jKaS6XQ==
X-Received: by 2002:a1c:a383:: with SMTP id m125mr34695970wme.57.1567411045251;
        Mon, 02 Sep 2019 00:57:25 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id v186sm32502768wmb.5.2019.09.02.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 00:57:23 -0700 (PDT)
Date:   Mon, 2 Sep 2019 09:57:23 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: tegra: mbox registers address in"soc" data
Message-ID: <20190902075723.GD930@ulmo>
References: <20190902035445.32046-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline
In-Reply-To: <20190902035445.32046-1-jckuo@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 11:54:45AM +0800, JC Kuo wrote:
> Tegra194 XUSB host controller has rearranged mailbox registers. This
> commit makes mailbox registers address a part of "soc" data so that
> xhci-tegra driver can be used for Tegra194.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 51 ++++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 12 deletions(-)

I'd perhaps reformulate the subject a little to be something like:

	xhci: tegra: Parameterize mailbox register addresses

Two other minor comments below.

> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index dafc65911fc0..b92a03bbbd2c 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -146,6 +146,13 @@ struct tegra_xusb_phy_type {
>  	unsigned int num;
>  };
> =20
> +struct tega_xusb_mbox_regs {
> +	u32 cmd;
> +	u32 data_in;
> +	u32 data_out;
> +	u32 owner;
> +};

Perhaps make these unsigned int (or unsigned long). Making these
explicitly sized variables suggests (at least to me) that they are
register values, whereas they really are offsets. So I prefer to use
"unsized" types to distinguish between register offsets and values.

> +
>  struct tegra_xusb_soc {
>  	const char *firmware;
>  	const char * const *supply_names;
> @@ -160,6 +167,8 @@ struct tegra_xusb_soc {
>  		} usb2, ulpi, hsic, usb3;
>  	} ports;
> =20
> +	struct tega_xusb_mbox_regs mbox;
> +
>  	bool scale_ss_clock;
>  	bool has_ipfs;
>  };
> @@ -395,15 +404,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *=
tegra,
>  	 * ACK/NAK messages.
>  	 */
>  	if (!(msg->cmd =3D=3D MBOX_CMD_ACK || msg->cmd =3D=3D MBOX_CMD_NAK)) {
> -		value =3D fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
> +		value =3D fpci_readl(tegra, tegra->soc->mbox.owner);
>  		if (value !=3D MBOX_OWNER_NONE) {
>  			dev_err(tegra->dev, "mailbox is busy\n");
>  			return -EBUSY;
>  		}
> =20
> -		fpci_writel(tegra, MBOX_OWNER_SW, XUSB_CFG_ARU_MBOX_OWNER);
> +		fpci_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
> =20
> -		value =3D fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
> +		value =3D fpci_readl(tegra, tegra->soc->mbox.owner);
>  		if (value !=3D MBOX_OWNER_SW) {
>  			dev_err(tegra->dev, "failed to acquire mailbox\n");
>  			return -EBUSY;
> @@ -413,17 +422,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *=
tegra,
>  	}
> =20
>  	value =3D tegra_xusb_mbox_pack(msg);
> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_DATA_IN);
> +	fpci_writel(tegra, value, tegra->soc->mbox.data_in);
> =20
> -	value =3D fpci_readl(tegra, XUSB_CFG_ARU_MBOX_CMD);
> +	value =3D fpci_readl(tegra, tegra->soc->mbox.cmd);
>  	value |=3D MBOX_INT_EN | MBOX_DEST_FALC;
> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_CMD);
> +	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
> =20
>  	if (wait_for_idle) {
>  		unsigned long timeout =3D jiffies + msecs_to_jiffies(250);
> =20
>  		while (time_before(jiffies, timeout)) {
> -			value =3D fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
> +			value =3D fpci_readl(tegra, tegra->soc->mbox.owner);
>  			if (value =3D=3D MBOX_OWNER_NONE)
>  				break;
> =20
> @@ -431,7 +440,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *te=
gra,
>  		}
> =20
>  		if (time_after(jiffies, timeout))
> -			value =3D fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
> +			value =3D fpci_readl(tegra, tegra->soc->mbox.owner);
> =20
>  		if (value !=3D MBOX_OWNER_NONE)
>  			return -ETIMEDOUT;
> @@ -598,16 +607,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, =
void *data)
> =20
>  	mutex_lock(&tegra->lock);
> =20
> -	value =3D fpci_readl(tegra, XUSB_CFG_ARU_MBOX_DATA_OUT);
> +	value =3D fpci_readl(tegra, tegra->soc->mbox.data_out);
>  	tegra_xusb_mbox_unpack(&msg, value);
> =20
> -	value =3D fpci_readl(tegra, XUSB_CFG_ARU_MBOX_CMD);
> +	value =3D fpci_readl(tegra, tegra->soc->mbox.cmd);
>  	value &=3D ~MBOX_DEST_SMI;
> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_CMD);
> +	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
> =20
>  	/* clear mailbox owner if no ACK/NAK is required */
>  	if (!tegra_xusb_mbox_cmd_requires_ack(msg.cmd))
> -		fpci_writel(tegra, MBOX_OWNER_NONE, XUSB_CFG_ARU_MBOX_OWNER);
> +		fpci_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
> =20
>  	tegra_xusb_mbox_handle(tegra, &msg);
> =20
> @@ -1365,6 +1374,12 @@ static const struct tegra_xusb_soc tegra124_soc =
=3D {
>  	},
>  	.scale_ss_clock =3D true,
>  	.has_ipfs =3D true,
> +	.mbox =3D {
> +		.cmd =3D XUSB_CFG_ARU_MBOX_CMD,
> +		.data_in =3D XUSB_CFG_ARU_MBOX_DATA_IN,
> +		.data_out =3D XUSB_CFG_ARU_MBOX_DATA_OUT,
> +		.owner =3D XUSB_CFG_ARU_MBOX_OWNER,
> +	},
>  };
>  MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
> =20
> @@ -1397,6 +1412,12 @@ static const struct tegra_xusb_soc tegra210_soc =
=3D {
>  	},
>  	.scale_ss_clock =3D false,
>  	.has_ipfs =3D true,
> +	.mbox =3D {
> +		.cmd =3D XUSB_CFG_ARU_MBOX_CMD,
> +		.data_in =3D XUSB_CFG_ARU_MBOX_DATA_IN,
> +		.data_out =3D XUSB_CFG_ARU_MBOX_DATA_OUT,
> +		.owner =3D XUSB_CFG_ARU_MBOX_OWNER,
> +	},
>  };
>  MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
> =20
> @@ -1422,6 +1443,12 @@ static const struct tegra_xusb_soc tegra186_soc =
=3D {
>  	},
>  	.scale_ss_clock =3D false,
>  	.has_ipfs =3D false,
> +	.mbox =3D {
> +		.cmd =3D XUSB_CFG_ARU_MBOX_CMD,
> +		.data_in =3D XUSB_CFG_ARU_MBOX_DATA_IN,
> +		.data_out =3D XUSB_CFG_ARU_MBOX_DATA_OUT,
> +		.owner =3D XUSB_CFG_ARU_MBOX_OWNER,
> +	},

You're already giving these registers names via the new parameters, so I
don't think we need the symbolic names. This usually just leads to weird
things like:

	#define XUSB_CFG_ARU_MBOX_CMD_T194 ...
	#define XUSB_CFG_ARU_MBOX_DATA_IN_T194 ...
	#define XUSB_CFG_ARU_MBOX_DATA_OUT_T194 ...
	#define XUSB_CFG_ARU_MBOX_OWNER_T194 ...

	.mbox =3D {
		.cmd =3D XUSB_CFG_ARU_MBOX_CMD_T194,
		.data_in =3D XUSB_CFG_ARU_MBOX_DATA_IN_T194,
		.data_out =3D XUSB_CFG_ARU_MBOX_DATA_OUT_T194,
		.owner =3D XUSB_CFG_ARU_MBOX_OWNER_T194,
	},

Just remove the symbolic names and use the literal address in the
structure definition.

Thierry

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1sy2IACgkQ3SOs138+
s6G1BQ//SbAHpIalH8MMOphTnzrBTAR16z41t8Afl0FKbG8vDM4OMRZf47wwzlZP
22WMBxjIY1B9eo0bEZl40gxsHuC05xKb/68crOwSks/LkKdvs5nThufA0emcKXjG
1gsDLDkXgqvXHRYzuVR9eVxJu5hrAhN1c+suWSjsPkrxz/bOYVEvhp5fI/uyvnO8
EC2MJOt6CAo6JJYNc8Ri9YAtiaSNvLPFp2TtTGVeD6BXwZgn5pigetwx0jZbzxyS
tWrqdVmGZXCLo0ql5KRoHdW9YfyGzZEnFg/Uw/j3gbu4FU74c9gUdolwATORQHZj
yUnSyHWGEfNvstrcTu9UObvgF8dc8Qmza9MBJeKtQoKx+xeVJ0YJWiX6O8TGfjuE
C94DqZZXqNbERsSiXUGz5cCCgSw8UHCXZZhNNzVlw5U6OgEVeYQgEXwdTYqhdG8a
NYpn4qvGyw8R6ro7jh95i421UcdxC2ixyYspD0PakD/eCiyV0L4T3IU9fMBzp/Q9
Rmt0VqPGZyYc9W+fp1z6DCPEkcGcMraX845CzJEB/X5l6S2NKSjVfCNoEPO5WiQu
G+xHgcHm7ZyZa6+1VkjiqbzcN5GAwvcPBt/U7wLWhSeH+XpLLIgxHdK/sz9oyabV
OysCcd4S7K3vf2bqMy1Q0v+ETIWom7OBLS4tdngNTGn8HvER3Dk=
=88oz
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
