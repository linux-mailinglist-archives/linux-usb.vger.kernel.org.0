Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA4611531C
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfLFO15 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:27:57 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33051 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfLFO14 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:27:56 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so8015795wrq.0;
        Fri, 06 Dec 2019 06:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o7dmVZgG7TaC0WQ5Oo7x+rRhJuQUkkLyapuWxVPDGVw=;
        b=jlxuZkBUUtMNeQTsSFCVpZdFwhHNmMGrN4nfbBlbTu6euJYceiE1dpI9TcfFG462/1
         cRtR0vKgGA5fuecbLy02qkRr83QsijTIc8S3NAqluzoDlJQBi248QtjaCu8ykV6VXxEI
         6xdKVwFUxsUfqh5bFPulC9XnqLnyu/9wjiM0yE5QxYsTZsMa7uS3yYLu1YQG3P0N2h6S
         O6VFwF25XF0g2JsObYPbzdt1WHb/agsAjvTGNCm0QV5Cro0fFdepyGMWmX7kjDlz+XkH
         EIkjqCV/qEcArmB3YiwxeGGSjmX0ec5ew1+zgACJon/G0i4gTpE+fha1zES1FJYaHkhH
         4qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o7dmVZgG7TaC0WQ5Oo7x+rRhJuQUkkLyapuWxVPDGVw=;
        b=aWWGyrmPBAsap/asga7YpCt2ilaOeb3mzCWWhWqHUL2UFHUB1jTKFX1xmP+31IGVfg
         T8XV7FdUZ1hRuYucp6I6sYSzxsy7lsDFkEFYhHbaQWm02YGyIzjcQalsORYyK/k87keC
         sZggr0kPZf2kt08pbcy5bU+UozywcIvKxVFzlJffsJuO6QtvTYn197Y+hQ4yGj7XMcEm
         7m9u7r9fR+zg5nnvRIgu5O4mL6Ody1lgZAgpptOcj7RFeprayqW4t0OEEcaD3lqwoKpO
         eulMuRwPD8amN850a+aES29vg0pnGnuWhShHW4Wvtog+HebXlLu//w1DKlZC4OCZUBzh
         RzOw==
X-Gm-Message-State: APjAAAXktY7XC++C4uQYP5rVb8rPxutFbRKvhc3PYsCKM9Kdi7mn0QH0
        HS95avGj/ce8UElyYnpupQE=
X-Google-Smtp-Source: APXvYqz98sLs2I4t3xKh9q2kFeDP9x/Yu1Syx9wS5IjuVtT6uldwkC7VgtmLjfr4kIaJ2BYyDQod3g==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr16777052wro.105.1575642473589;
        Fri, 06 Dec 2019 06:27:53 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id z4sm3615846wme.17.2019.12.06.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:27:52 -0800 (PST)
Date:   Fri, 6 Dec 2019 15:27:51 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 10/10] usb: host: xhci-tegra: Implement basic ELPG support
Message-ID: <20191206142751.GA2085684@ulmo>
References: <20191125123210.1564323-1-thierry.reding@gmail.com>
 <20191125123210.1564323-11-thierry.reding@gmail.com>
 <ceee6a21-c46f-c63f-d38f-78daf7a72969@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <ceee6a21-c46f-c63f-d38f-78daf7a72969@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2019 at 05:43:15PM +0200, Mathias Nyman wrote:
> On 25.11.2019 14.32, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This implements basic engine-level powergate support which allows the
> > XUSB controller to be put into a low power mode on system sleep and get
> > it out of that low power mode again on resume.
> >=20
> > Based on work by JC Kuo <jckuo@nvidia.com>.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/usb/host/xhci-tegra.c | 137 ++++++++++++++++++++++++++++++++--
> >   1 file changed, 129 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegr=
a.c
> > index cd3afec408ea..d0e30927a73f 100644
> > --- a/drivers/usb/host/xhci-tegra.c
> > +++ b/drivers/usb/host/xhci-tegra.c
> > @@ -1451,6 +1451,45 @@ static int tegra_xusb_remove(struct platform_dev=
ice *pdev)
> >   }
> >   #ifdef CONFIG_PM_SLEEP
> > +static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
> > +{
> > +	struct device *dev =3D hub->hcd->self.controller;
> > +	bool status =3D true;
> > +	unsigned int i;
> > +	u32 value;
> > +
> > +	for (i =3D 0; i < hub->num_ports; i++) {
> > +		value =3D readl(hub->ports[i]->addr);
> > +		if ((value & PORT_PE) =3D=3D 0)
> > +			continue;
> > +
> > +		if ((value & PORT_PLS_MASK) !=3D XDEV_U3) {
> > +			dev_info(dev, "%u-%u isn't suspended: %#010x\n",
> > +				 hub->hcd->self.busnum, i + 1, value);
> > +			status =3D false;
> > +		}
> > +	}
> > +
> > +	return status;
> > +}
> > +
> > +static int tegra_xusb_check_ports(struct tegra_xusb *tegra)
> > +{
> > +	struct xhci_hcd *xhci =3D hcd_to_xhci(tegra->hcd);
> > +	unsigned long flags;
> > +	int err =3D 0;
> > +
> > +	spin_lock_irqsave(&xhci->lock, flags);
> > +
> > +	if (!xhci_hub_ports_suspended(&xhci->usb2_rhub) ||
> > +	    !xhci_hub_ports_suspended(&xhci->usb3_rhub))
> > +		err =3D -EBUSY;
> > +
> > +	spin_unlock_irqrestore(&xhci->lock, flags);
> > +
> > +	return err;
> > +}
> > +
> >   static void tegra_xusb_save_context(struct tegra_xusb *tegra)
> >   {
> >   	const struct tegra_xusb_context_soc *soc =3D tegra->soc->context;
> > @@ -1485,31 +1524,113 @@ static void tegra_xusb_restore_context(struct =
tegra_xusb *tegra)
> >   	}
> >   }
> > -static int tegra_xusb_suspend(struct device *dev)
> > +static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool wakeup)
> >   {
> > -	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
> >   	struct xhci_hcd *xhci =3D hcd_to_xhci(tegra->hcd);
> > -	bool wakeup =3D device_may_wakeup(dev);
> > +	u32 value;
> >   	int err;
> > -	/* TODO: Powergate controller across suspend/resume. */
> > +	err =3D tegra_xusb_check_ports(tegra);
> > +	if (err < 0) {
> > +		dev_err(tegra->dev, "not all ports suspended: %d\n", err);
> > +		return err;
> > +	}
> > +
> >   	err =3D xhci_suspend(xhci, wakeup);
> > -	if (err < 0)
> > +	if (err < 0) {
> > +		dev_err(tegra->dev, "failed to suspend XHCI: %d\n", err);
> >   		return err;
> > +	}
> >   	tegra_xusb_save_context(tegra);
> > +	tegra_xusb_phy_disable(tegra);
> > +	tegra_xusb_clk_disable(tegra);
> >   	return 0;
> >   }
> > -static int tegra_xusb_resume(struct device *dev)
> > +static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool wakeup)
> >   {
> > -	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
> >   	struct xhci_hcd *xhci =3D hcd_to_xhci(tegra->hcd);
> > +	u32 value;
> > +	int err;
> > +	err =3D tegra_xusb_clk_enable(tegra);
> > +	if (err < 0) {
> > +		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
> > +		return err;
> > +	}
> > +
> > +	err =3D tegra_xusb_phy_enable(tegra);
> > +	if (err < 0) {
> > +		dev_err(tegra->dev, "failed to enable PHYs: %d\n", err);
> > +		goto disable_clk;
> > +	}
> > +
> > +	tegra_xusb_config(tegra);
> >   	tegra_xusb_restore_context(tegra);
> > -	return xhci_resume(xhci, false);
> > +	err =3D tegra_xusb_load_firmware(tegra);
> > +	if (err < 0) {
> > +		dev_err(tegra->dev, "failed to load firmware: %d\n", err);
> > +		goto disable_phy;
> > +	}
> > +
> > +	err =3D __tegra_xusb_enable_firmware_messages(tegra);
> > +	if (err < 0) {
> > +		dev_err(tegra->dev, "failed to enable messages: %d\n", err);
> > +		goto disable_phy;
> > +	}
> > +
> > +	err =3D xhci_resume(xhci, true);
> > +	if (err < 0) {
> > +		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
> > +		goto disable_phy;
> > +	}
> > +
> > +	return 0;
> > +
> > +disable_phy:
> > +	tegra_xusb_phy_disable(tegra);
> > +disable_clk:
> > +	tegra_xusb_clk_disable(tegra);
> > +	return err;
> > +}
> > +
> > +static int tegra_xusb_suspend(struct device *dev)
> > +{
> > +	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
> > +	bool wakeup =3D device_may_wakeup(dev);
> > +	int err;
> > +
> > +	synchronize_irq(tegra->mbox_irq);
> > +
> > +	mutex_lock(&tegra->lock);
> > +
> > +	err =3D tegra_xusb_enter_elpg(tegra, wakeup);
> > +	if (err < 0)
> > +		goto unlock;
>=20
> Is there some code missing here, or just preparing for some future featur=
e?

This is just leftover I forgot to cleanup after I removed debug printk's
here. There's likely going to be some changes around this for better
runtime PM support, but that will all live in tegra_xusb_enter_elpg(),
so I think we can skip this. I've sent out a v2 with this...

>=20
> > +
> > +unlock:
> > +	mutex_unlock(&tegra->lock);
> > +	return err;
> > +}
> > +
> > +static int tegra_xusb_resume(struct device *dev)
> > +{
> > +	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
> > +	bool wakeup =3D device_may_wakeup(dev);
> > +	int err;
> > +
> > +	mutex_lock(&tegra->lock);
> > +
> > +	err =3D tegra_xusb_exit_elpg(tegra, wakeup);
> > +	if (err < 0)
> > +		goto unlock;
> > +
> > +unlock:
> > +	mutex_unlock(&tegra->lock);
> > +	return err;
> >   }
> >   #endif

=2E.. and this fixed.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3qZWQACgkQ3SOs138+
s6EXqw/+OzdTzdTXEVK2baWceAx4z9V8gMaoTKfrA049lcAuQReIb03XaY/7fVXp
Yrj/1Vq+ZhD0Hem32rIRecdmSD7HLJXwR5Ydw7QYvbTRSIqJW02sXqq23RpY8Pq3
6GSlVg1I9uze/HlKxLctJX8b+gD8Qk5hCPbAxKouM4m3+ilOPtNc4ufvYhTkgp5w
1hNNHgyKmyCRKBTQCQv0oKCsEHVPoDwG4oMeyaUBC+4cQOmp+kPZv7fh+q6Y5jAP
1Z7GICVZOEZPeQCzffN8SLkbjzaV4za3amPs5Mi6i5wnr+6PHhr9t1ixyZ2P8eog
bPqHNOHk6s3ER9aZX3CGXh8D6vIIFiC2beYYtDjBnwS3zNiIwyt+fxSsmWlXWadY
qlhmWw2pCwH+VNnc8X61pSBY/CIKhLDQukwsxbDELSntxm9eKasPSmGqEmtn2r15
yoEArzTG4ByaMZVUqTzrNtZz155qllufDa13zCnTi7hE1/vCorAX3cYlLx5l2pdM
v2XX1k20E5RsD7lVmWNg26zly22KmUczNq3vRvIq4r7C47darH9gYgBuzTOLamCt
DuUat4s/9lvJeX7E4/Sea/niZcjcix40Xp9SnIE+4IpRfOOQIE0aNI/kuCoVYalp
9eGZ9ycCuCiCmd6NOmvhO1DBnOyZnYGD9eLlIJAUgdhaQ7N4mVc=
=p6B8
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
