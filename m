Return-Path: <linux-usb+bounces-37583-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJuRAuPZCmoA8wQAu9opvQ
	(envelope-from <linux-usb+bounces-37583-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:20:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0035698D7
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97D4A3078705
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 09:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585623E51ED;
	Mon, 18 May 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rc8gMTDY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD93E3C60
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095620; cv=pass; b=lx6vNzs03FxuyX8GmpyufAZzVBsZfRqryodMGQ4x3jRXQf51hg3EWI21xCjyAabWcId42uiZ4fFSEiXjJTOADCWO0/voESCyiFDc+d+tg3qtjjUoZF+Zow8wpXWdYUM7CyKjuPbgftiWaUhziu6Epnchykz3xBKFV/de1WL806Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095620; c=relaxed/simple;
	bh=kw2FaFkRYggKmHsD3zbceTzDrnmQSt6sP83wo4d+5i0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8iWTXnsPGzOJCZZFvim0ut0cF+tAy7BDxkXPsxqIr6aZ4ThbCVH2Kt2CZQe7vZB57c8DpAMfSULEoKrspsGp7W69taoY72e/2w4jDkOkMEC0I0eBk66BjkDYOMvYsKBFe9giq4N1cIytNXbz/TnvZPOxunyxC8iRZM+BT1LyIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rc8gMTDY; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393925cb1baso24477171fa.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 02:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779095618; cv=none;
        d=google.com; s=arc-20240605;
        b=LMCrKaBhzdN5l16B1lvGroBgClyxbwhsnhVwmfY4vHlrnIGi1ui58rwAgPKO9sF2Zh
         hcaf3Pp7Ay19uzC+DqCdYzgOcL3QbaIw0tnipV6moOlS+oiDxjlsZhk02AvZRxE7L2Qx
         +9TwkIwOzKjJ1DcTIlycN/Ah9GVHozJw7oMDpZkBFQx4WmKixQ0aBqQimC2MyCaLFhvI
         WKBQgZxXdPRRgb83DmLBLEoukpZb6bHXuaUE+2VNwY++c27y8I758yjArTkwd5R00UVF
         Y8IE37Tq8q6rcnpwf2NimCcAMUpR+wbOJH2plgTQvIDC5j82TVI3fVy7P1jD6gSjxykw
         ssiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        fh=37F5bvaK0VK+AI6Ctpf45agoY7vziZjK6mkcA4uNNeI=;
        b=WeOXHyylgNOFCWPvRoiqPeMB5ElTTdR9pbZVixwKJtm6Nt1v4zM5Ld432u4ViNZ+r3
         EVw8MSOKIj5RTyJi8HksICMcZoS0In/mJTOuo+f5RpKG+OyE3EsN/EF8IFj1yWQ4r7ct
         F0JkAelg9ocBthjcKmTHBcAW81PaCCB8eTBUGq8R7lbYgCuInJsHvUYdF9Zz0SuyAUUA
         nTUKQDAEqusCqM4Z+l/NHd0/BOuqY4Nwq1WGPbg/8sRB5Ch3gcNT87E7zitFj8gMNJPb
         sOuHuY47x+Lke8qBVhcwp4HheD0qnfkr+W9F1wLKhaSsEB1csrQFTjOd90ledc07IzQB
         1c3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779095618; x=1779700418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        b=Rc8gMTDYJWiN51N2hXBaBljzOuBiK53ip6mgeFN2jwKbqsOHcJPWNgokM1W3qyZcMt
         rN97B9PALBJGc+z1d9EMjwdS5KOmS1kB1mln+PyuxmXjFxI+my1KaDSTt1CfooM99e9s
         BbGJyM/7ymRlW0+B3Xt9YrkNfdRTXAOdib3Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095618; x=1779700418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        b=p+SBi573DAIrmoY40oX4RZCbhYnUvpUFNS5WHNkD/vhUQbjxWAPMtYISHAOrDpAKId
         YvMZmTmTjXLGvsY2nsFk1fby5Nhq20wsJ81obfco3mq1s0Sz/DP7A8HawWf5O5DxaG1q
         oxXKvtDojaNu71rkNcKslK2MNNwJiAF2WQl5s3ZSvjtkU7uxwfm6hrM4E259l8YTzXbn
         Wxf4R1U+S26ewe581mTC76tCy8LP+3vgZH4VYNU+Bj3Dm2j4FdJj5ijLJ7ZwLcZFAYPs
         tQZcSFK8+gvtbf44r7WBQX3RAqXpDIfTNh9smTPpuXgaMDI9kRR+bP7240H+EA2/iqKm
         fOwg==
X-Forwarded-Encrypted: i=1; AFNElJ9pNio4jy90BAypsq7YuRPTGk4JYZhovjcrW8F+v5d9iqjYypi/gwomWTgru6OkFYkLFEb7E9NmphI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcKV1QxjxMbW8uIUuo3S+PCcrKAs+swBR2zRpFOVXPGUo9VDNX
	H8oymGOz2Iaew5OL+LVXuj0G8+km31eXJd1PN9gy3c98h5Sn+njjwfQUz39Xj9jL6wAiWQOn4FM
	IPYTvKCfwbGRXb5IZcyFqgwNJphYaP0SGYq5NABEt
X-Gm-Gg: Acq92OGo4iBxbYcYCf/zvnS6ITEw+ANbOsdDUGCnUGrnGQZ8SMt5g/dbaswMZ8Y6luS
	6rYhuqSWYCw/b5yAT+UkxHFfmOfQsmmN/5q/1VKZZQsS/Y56lBuF/snGGi1RajPCiFvVnSsGPQO
	90GZXTsIv5tpafFqUS3KQE0EhkcPYr8RqVqPikJCGZGvvbqLyyoPBPghOQewKaES5K+/wljZVgQ
	4q0b8n2stO2bhA3ZvkUF5z/AoJniViFlGQxhKYK5r/ZP49Uz7dGE80CyUBIV1YsJGv7z7XyawoA
	UsxAbxRVCSuY+aL5EFEOT6nIeZyjvKasMQv3VarC0134Xttt
X-Received: by 2002:a05:6512:3e14:b0:5a8:9f6f:3212 with SMTP id
 2adb3069b0e04-5aa0e741fd0mr3969603e87.34.1779095617441; Mon, 18 May 2026
 02:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <20260515090149.3169406-6-wenst@chromium.org>
 <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
In-Reply-To: <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 May 2026 17:13:25 +0800
X-Gm-Features: AVHnY4KWMoq2C1egFaF2o_wZ2pbZmcxOkUhi_AoDtPCF3Cwz3jQrR0zfOzxPPG4
Message-ID: <CAGXv+5GT8vS87owuNJvMxWBnwCELCV28SbwsUXFr-Ne5O3EgsQ@mail.gmail.com>
Subject: Re: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key connectors
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BC0035698D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37583-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,mail.gmail.com:mid,harvard.edu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 10:39=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, May 15, 2026 at 05:01:41PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 90ea597d42ae..4165f71e212b 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -31,7 +31,9 @@
> >  #include <linux/minmax.h>
> >  #include <linux/mutex.h>
> >  #include <linux/random.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/kobject.h>
> >
> >  #include <linux/bitfield.h>
> > @@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hde=
v, struct usb_hub *hub,
> >  {
> >       int ret;
> >
> > +     if (set)
> > +             ret =3D pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> > +     else
> > +             ret =3D pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (set)
> >               ret =3D set_port_feature(hdev, port1, USB_PORT_FEAT_POWER=
);
> >       else
> >               ret =3D usb_clear_port_feature(hdev, port1, USB_PORT_FEAT=
_POWER);
> >
> > -     if (ret)
> > +     if (ret) {
> > +             if (set)
> > +                     pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> > +             else
> > +                     pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> >               return ret;
> > +     }
> >
> >       if (set)
> >               set_bit(port1, hub->power_bits);
> > @@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, =
const struct usb_device_id *id)
> >       struct usb_host_interface *desc;
> >       struct usb_device *hdev;
> >       struct usb_hub *hub;
> > +     int ret;
> >
> >       desc =3D intf->cur_altsetting;
> >       hdev =3D interface_to_usbdev(intf);
>
> This change is totally useless.  Didn't you get a warning from the
> compiler when you built it?

Apologies. This should have been part of the previous patch.

> > diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> > index 9ebc5ef54a32..6039e5f5dcd7 100644
> > --- a/drivers/usb/core/hub.h
> > +++ b/drivers/usb/core/hub.h
> > @@ -85,6 +85,7 @@ struct usb_hub {
> >   * @port_owner: port's owner
> >   * @peer: related usb2 and usb3 ports (share the same connector)
> >   * @connector: USB Type-C connector
> > + * @pwrseq: power sequencing descriptor for the port
> >   * @req: default pm qos request for hubs without port power control
> >   * @connect_type: port's connect type
> >   * @state: device state of the usb device attached to the port
> > @@ -104,6 +105,7 @@ struct usb_port {
> >       struct usb_dev_state *port_owner;
> >       struct usb_port *peer;
> >       struct typec_connector *connector;
> > +     struct pwrseq_desc *pwrseq;
> >       struct dev_pm_qos_request *req;
> >       enum usb_port_connect_type connect_type;
> >       enum usb_device_state state;
>
> The fact that hub.h uses struct pwrseq_desc indicates that it ought to
> #include <linux/pwrseq/consumer.h>, instead of making the .c files do
> so themselves.  Then you wouldn't have to add the #include lines to
> hub.c and port.c.

I couldn't tell if the existing pattern in this file was to include
the headers or not, as it's missing a whole bunch.

Regardless of whether this header file includes linux/pwrseq/consumer.h
or has a forward declaration or nothing, I think that if the .c files
use the API, then they should include the corresponding header file
directly.

> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384c..2d09037fee93 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -7,11 +7,14 @@
> >   * Author: Lan Tianyu <tianyu.lan@intel.com>
> >   */
> >
> > +#include <linux/cleanup.h>
>
> Why is this needed?

For the __free() in usb_hub_port_pwrseq_get() below:

    struct device_node *np __free(device_node) =3D NULL;


Thanks
ChenYu


> >  #include <linux/kstrtox.h>
> >  #include <linux/slab.h>
> >  #include <linux/string_choices.h>
> >  #include <linux/sysfs.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/component.h>
> >  #include <linux/usb/of.h>
> >
>
> Alan Stern

