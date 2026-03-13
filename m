Return-Path: <linux-usb+bounces-34727-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOgRFMzIs2kqawAAu9opvQ
	(envelope-from <linux-usb+bounces-34727-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 09:20:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D227F7F6
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 09:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DED7230F33BB
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 08:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B0837BE98;
	Fri, 13 Mar 2026 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOxN7BbP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AE42CCC5
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389722; cv=pass; b=RT7VFICTmpH3DvdQRuvKFPvnz08cin/4FVbMCPkgFyrNxQDl8bKMuDbLejVCG0i/F+bOR/0nYq+xJAvRXWRFuaTEtWCfNfm1zlATEEk0QnSAqTBbNeM+B98kOLdiKmEHe4ZUeypBPpNOJ3LQ8NMX88lz2jsTPm/qGkk18KLGFWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389722; c=relaxed/simple;
	bh=LR+qa+n5VabQ+oHB3plSgf/U4Zfu9zl/N6Xb9uxWKv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bn8+ycuY3u/N5tQ6AGDAWznQ+0rWhYG9We5AEQrBZ9W1mKsloL4wyf9RcB9G1oATQAmXgV+SQJ2vkN7x4foPUy35wC+pUKEOyPNzalKPZ5rkQTKM4jA3h4YTtGWvaJHFJ018KRU2PJqQsg7dlzE077gS5LsuW/knquj2U1+tBk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOxN7BbP; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50917e02472so23299391cf.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 01:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773389717; cv=none;
        d=google.com; s=arc-20240605;
        b=T5T+dtrMi3pDX50/cfaD+nXfOK6yfeDKII6877pOoXldBFHBnBcN+d3mciE5S3lBQB
         qGaPQRKaCzka3p0jRyldQKj0wqGSK+zF0sPWDXeq8EB6VVzuTgF+HczIJFGREeUIlOMB
         nqXOQVKStNNusgBg9ZVYdiOTmwgxPWsPQSut7M1Zu9fYY7GfBz1EJyECQBZHs3x/JV4T
         Vd/3voYnlnrY36SecHpSSBmkUl3XVJIEQtNOeQ48EU70yLl6PRob9R/tqZvnLJFCwyoJ
         IuYqoGop6Noanv0GWaudnP+aX83z6kDThB5Y0OR9LdB96pGiNSpst7izcIJ6lTYKFicX
         e7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9d09QEvkkscrgJ2kDo/3CfZoDPDZTU90SVEmzvGNF9k=;
        fh=QwnQYOFCc7G4A3/uraITbOWGK/nLOmCGsgzDvYdY9A8=;
        b=UheWdPz4RNyXvtKMQ0MZ2tBtUQ3CA3A1NgikWaWZOBVt8A9R0goZw7Ct6szj80dM4O
         pNmkfbOgSbHxAuMcL8Oy2dCcCp0q8DCUSkt6YvIlUAI8xQDzJjVHwl/3MW2ljy1PTJwa
         s4PhqSSPzrKn9izPCThhE1YAjWNk6F6adg/Mwr7YIwfAR4StNsEuN1JyFIrNyCWHK+nU
         6Vx5zb6IJVQwp4mrp8Xehaa/0exD/ppLT/rjYIBRKJ2RtaJgFZSZKfooR5n6/gfmySfR
         a+sqViLG9SP+xtEFnWhuuJ7xMvRr/PCo2EUkn1hBL9HpvVMoBfYLqPCdDJH+jPgv3rpU
         24pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773389717; x=1773994517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d09QEvkkscrgJ2kDo/3CfZoDPDZTU90SVEmzvGNF9k=;
        b=cOxN7BbPFjzNdpwGmOMmLWO61Pw2a9N3IC2AQYA6X87kj0Yvxm1nsSf88dvajEAJs2
         m26FdF+ZWUP+gG0IwL8VUyQ3BCFsub4tiyyG/Gdxv4YOjSA9VdAr80FhAfh3mwPLLsNR
         9qcecYTVKiU3Kmc3cXDDMgXBchpGp1GvKSBqTzAABocs6eAc7OPW8Kxi7Fi/vqoWGUop
         hIxxNwdjPaF/wUAN6xcTAD94RByVJ7Jre5Uvp87Vg/M7Zxo2NTeFI1DVXMIZ4PoiGrj9
         ibC9bltT/poIucI2NqIh2RCFTOEPoKXGjwuMSNxpYgZG6LuaxgdpMFibqGcbJ+8M2y1g
         kDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773389717; x=1773994517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9d09QEvkkscrgJ2kDo/3CfZoDPDZTU90SVEmzvGNF9k=;
        b=FCCHbOrzTqnyDI/GUcEvHouAKjlXHDPg6Z71FLEZztm0GpnQkEMBm+6qWFqr6oh13o
         ooPtUz7TwAta30Xjqej5gIMPw6cuYEopCPKuCwRnd8uCLox1JYVmNBaXt3beUjzaATtg
         uWkoZSTdD7ysn4Kut3glgMv7rtGILp+0JIQ12wq0LIBL1h3Hms9csn7+DRE4i5GPv7QR
         KKL/NgayXGvZtZg/KlhoV2faoWiAzKljn9Ugw370ez8XldWI3Ts9RA6RNNeiTn4R5nMb
         ONI32Yq+Pv2MOhXCD0ygINnISbrqH/HLeNy/DrU7OiYvgtzB8MBvBEMe1d4FSqSpq2Ay
         UEsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiU60B2O069Y67UOKMNvq76j/decFS18j17YaX3pO0B/SBa14+MPH9WpRZagngUGo9Y+wm5d5gbDw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ehA9YfU3Ppoa0J6kLY6YlpXAJsK13Sqwip4w8whu/PXREid9
	0/kA1B0s1/MyHzayfzKZ28ZRtr7U1uEYNmNiHAxeSJPS/XiouZhBVcaQNFoRz3v2O6GlkVtcUJM
	cRu+XG2pEKX8Y/ig4u/EJ/+areGLrk38=
X-Gm-Gg: ATEYQzwRXgKLkX5nC4s/CZet8B9CYUkZx2xHL5FfDCy8kP6FFXNyrwfeYzc2mhs5abd
	J9s2qxxsX/W1bLFHeMULZtC65OZwRnl/wXXlVuUlkZqASxFVJum0U8w5NCqkyR9SP24vvfRVZ6a
	bSW9w9rS4ytkUSN4bqQdufwRjHCm/D4hYG5c8mezKHvJYppoSMWJWkNucKGj4w6TW7QbwIKtgYK
	4btdu4tGk35Q8Au5gJZ+zN2Z+7QUnIr8IkrpW/6D4qTVY3xD6NauOlYgK+ym3y6+GeLfu7uVm1V
	NfidA9JXMWiIxTKiFw==
X-Received: by 2002:a05:622a:60f:b0:509:3940:3100 with SMTP id
 d75a77b69052e-50957df8dd2mr29336351cf.53.1773389716875; Fri, 13 Mar 2026
 01:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-fusb302-drm-dp-hpd-bridge-v1-1-ffd41ef9afe3@collabora.com>
In-Reply-To: <20260310-fusb302-drm-dp-hpd-bridge-v1-1-ffd41ef9afe3@collabora.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Mar 2026 12:15:08 +0400
X-Gm-Features: AaiRm52DpikKPgcRRQIitPkKMOmFzEQ5o6nk26O70B2bW2SaGjs2zbmFZy-oAtw
Message-ID: <CABjd4YxCQw94qg30mC7a9CJWvYje_NrUkzw+gu5wzWx55SidEA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: add DRM DP HPD bridge support
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34727-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_PROHIBIT(0.00)[0.0.0.22:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2ac50000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,rk3576:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0E7D227F7F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sebastian,

On Tue, Mar 10, 2026 at 9:17=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Add support to use fusb302 based USB-C connectors with the DP altmode
> helper code on devicetree based platforms. To get this working there
> must be a DRM bridge chain from the DisplayPort controller to the USB-C
> connector. E.g. on Rockchip RK3576:
>
> root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
> bridge[0]: dw_dp_bridge_funcs
>         refcount: 7
>         type: [10] DP
>         OF: /soc/dp@27e40000:rockchip,rk3576-dp
>         ops: [0x47] detect edid hpd
> bridge[1]: drm_aux_bridge_funcs
>         refcount: 4
>         type: [0] Unknown
>         OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
>         ops: [0x0]
> bridge[2]: drm_aux_hpd_bridge_funcs
>         refcount: 5
>         type: [10] DP
>         OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
>         ops: [0x4] hpd
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> To make this usable on Rockchip RK3588 and RK3576 platforms as shown in
> the commit message, the Designware DP driver and the USBDP PHY driver
> also need changes. Those are being send separately as the fusb302 patch
> can be merged completley independently.
> ---
>  drivers/usb/typec/tcpm/Kconfig   |  2 ++
>  drivers/usb/typec/tcpm/fusb302.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kcon=
fig
> index 8cdd84ca5d6f..00baa7503d45 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -58,6 +58,8 @@ config TYPEC_FUSB302
>         tristate "Fairchild FUSB302 Type-C chip driver"
>         depends on I2C
>         depends on EXTCON || !EXTCON
> +       depends on DRM || DRM=3Dn
> +       select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>         help
>           The Fairchild FUSB302 Type-C chip driver that works with
>           Type-C Port Controller Manager to provide USB PD and USB
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 19ff8217818e..ce7069fb4be6 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -5,6 +5,7 @@
>   * Fairchild FUSB302 Type-C Chip Driver
>   */
>
> +#include <drm/bridge/aux-bridge.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> @@ -1689,6 +1690,7 @@ static int fusb302_probe(struct i2c_client *client)
>  {
>         struct fusb302_chip *chip;
>         struct i2c_adapter *adapter =3D client->adapter;
> +       struct auxiliary_device *bridge_dev;
>         struct device *dev =3D &client->dev;
>         const char *name;
>         int ret =3D 0;
> @@ -1747,6 +1749,13 @@ static int fusb302_probe(struct i2c_client *client=
)
>                 goto destroy_workqueue;
>         }
>
> +       bridge_dev =3D devm_drm_dp_hpd_bridge_alloc(chip->dev, to_of_node=
(chip->tcpc_dev.fwnode));
> +       if (IS_ERR(bridge_dev)) {
> +               ret =3D PTR_ERR(bridge_dev);
> +               dev_err_probe(chip->dev, ret, "failed to alloc bridge\n")=
;
> +               goto destroy_workqueue;
> +       }
> +
>         chip->tcpm_port =3D tcpm_register_port(&client->dev, &chip->tcpc_=
dev);
>         if (IS_ERR(chip->tcpm_port)) {
>                 fwnode_handle_put(chip->tcpc_dev.fwnode);
> @@ -1764,6 +1773,10 @@ static int fusb302_probe(struct i2c_client *client=
)
>         enable_irq_wake(chip->gpio_int_n_irq);
>         i2c_set_clientdata(client, chip);
>
> +       ret =3D devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> +       if (ret)
> +               return ret;
> +
>         return ret;

Nit: how about

return devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);

Saves three lines :)

Thanks a lot,
Alexey

