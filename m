Return-Path: <linux-usb+bounces-33757-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO4JAbeRoGllkwQAu9opvQ
	(envelope-from <linux-usb+bounces-33757-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:32:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952A1ADB3E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F246D305845B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC3336F43D;
	Thu, 26 Feb 2026 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aj/msVqG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A5F364953
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129948; cv=pass; b=NAQVzeSFMvQY+2gT3Ukfd2Fsfojq+jSbo8Hg2PROJ5AV1pum8JZF5/FGb8MuHhOBLHJ6l8OxeCSsNzWjPy7+Ykcn0c279Odgj8UtWIVgUsODGFc+ZFYpb4VJDTEBDnoKEa69jApJW6tsBPpHpodoZKAN33OI70eJWLX1ZhyUc1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129948; c=relaxed/simple;
	bh=C429WIoHj4+beuFRq3PZmiGHM0z/qSwgi+/P10QJYlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lc2/poEg0rf7vaLIBT1zS76Ax1C4zoNDegwqwM+HRaMtvLso5QkdJGP9kX2MjTAQUOG3vxjJVOipkZBKw6DeAJgISJqYSOiE8W/UgearHA7jcE2M/DKuMtD20qdMx0xkmc2rHko0D7hg9qosyRTgeMcUE/pubM5o4c6Vzt1Ya10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aj/msVqG; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48372efa020so9967715e9.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 10:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772129945; cv=none;
        d=google.com; s=arc-20240605;
        b=El/CCICOPwNS+kGnZ91hadiIsocdVeSIgpY27jBP4AOMgOkrLLthxTgJ2fxEM3n9Di
         6xIBv21xrbiN3sjVU+ZXz61Mm7+NBdxGEzadRo1Wc7IKYUDaoYkkKWRSfadG9e+B1SDX
         BncSny5YCBCg7OKB5ZDDJjQ4jauPYst8Lw8seq3NzFVdeSoH841ihrtZj/L0fXlRH4/i
         pe1/P8IIim05NcVbAjw9w9P3+mnlNZDC1sYklQSRNtKRba/L1saBUzHMrWzOMJzAOEm5
         uqTOzpUeE2nPwVdUC+aNeTAxKQt7H0dsy2v7MqVPizxEUlXFO4T23Kpn39sDdSDvrWzX
         W67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+GOuLAnOCx2r6eVKHroCtaQmRIo6h6u3lXiEehnBNF4=;
        fh=MIDPCYeb6V4r59rlRiq+CA5LcWve+kcE4zdoOA8VKKM=;
        b=kHgWVKCjsKoExa1Jeqy+UWGdRexe5dVGrar3PnxZ/8nOiof7gaZp3BBSZ7tqdUOMEg
         Dq12H+FXWJ30ufqA5LchL5i+LpCgp4afe7FQ6fphRSGlD4cmp+TVbBa5zTTLpyJWh1rd
         hyBPeo1CcmiUpzIpbXNqZRw/kLR0T+vRMD4EMyjWV6abJ81QIKX5HwVjUN+aa1UAQVRJ
         cs5JmQNkSU8gjokqD9h1H3OrwFIn5MQFFpEyRTov2YagIsOwXK4Vt5UobbnzE7ZxwDJ3
         vLwkhfnNSq4yzgBQW3VqtnlrEKhiyU4YI7cfg8dAs0Upf28ylwKuB1PYsH8VbSSXgUCk
         DizQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772129945; x=1772734745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+GOuLAnOCx2r6eVKHroCtaQmRIo6h6u3lXiEehnBNF4=;
        b=aj/msVqGTV4J1V8E8vURF6fr6qEtGqGsSDpHqlgqnWzq1Rfi54vy8wVWzQdxYDThAk
         VYgozeS6k6dFQwzBoTwwYSKqc4vLTBZryJv3CSEBa6L8ZItVZUUrLe1k+h7sQKZgnZ5L
         9jVejMNjK0NP/cnTzTA3uzbTQKcB0VfZflc6dGvmQYJMQ7+wk5hY6vy1lwa+PovhR1uz
         ZfEI8z3WRaR+18zpSllxq45zrYDm/+blNfZfTmYRYIuT4DnPWaxcLb+88is49c5mVqWd
         uVyNlOmQ/rZuJ6kqaeLinO90B7ZJuilp1ZfGzS+ez1MKnGUhD3aJAGcs4lIXhgVs42O5
         WnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129945; x=1772734745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GOuLAnOCx2r6eVKHroCtaQmRIo6h6u3lXiEehnBNF4=;
        b=LmJvyzFk03lTWD2BjgBPNZPoZxphlkk/PpOH5ndLC6rOp+SPGSe9uE/iJELr69aohT
         B/GUBjkmtlo38WCTwyI63gDLuXbq1BbTIrXvjTXiq3pK9ivM/d1Vjqzo++zakqjMbK/F
         YIKiYWMHk8IDkSNVAjiSfKqhqHQORuwkRMVoSpn1UFhuaQEbOOffIBxPE5r33xgduwOk
         7bovBjH7x366dkASmlgtyKsBWhsHA2g+xl2wbmcuvqLK82iMcdhwfBN06y+B3Geh2yDs
         kq24UKckiR0c48UqjSp91MDl6VYzCadmczh061xnCFJoBZOdZCheWG30HPKyMr8d+Hih
         9vDA==
X-Forwarded-Encrypted: i=1; AJvYcCVGYWFE6rKBrGGfmETLIrLRUVkk3kpwk3zYoAJGjTfCq2LzXaErXvEqzJx0ruwE4PHgjXOiNtfliaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCnulSdlaMe02+8HFQgE1N1LpSf8p+5fENQHlQJmuw3LZIxgTa
	ALarhtFhG3xF+dPWt7Ij1tJCLJr/fv00cNgsYBqfAS4J1cD7Jf63+dUavX5oTItTrzx0Ex8w9m5
	65CZmwICdQ2vUMeTmGzH4RbEtrAq9yXs=
X-Gm-Gg: ATEYQzzs4HbPs9QzgJwfjDa+wmC4pw/GGU/ctyafGV/e/gVOFRrNwlYRiRxXznfOFui
	wuTjQEH0zFhRvuwZ2ocQ59IyJu/tulF3Ihit1IE6sa9tY9+msSxRcCpxEKMXTJ5ovIa/QdEhSnX
	eWz54kPFdQDJs4j/R2IJFO7lgfkHM04Td7A7ABy9p2z1Qm88Oh0l/JNWwP0H6tP4IXBqYlsIMBP
	tKLw3lm5AFhoJaOXEJDg2jk83CdbLn0f2S135ZuEXpeiv+I9pdZrsrrTLVjcnfLggT0DewdxvCY
	KjDn5hU=
X-Received: by 2002:a05:6000:603:b0:439:5ebf:df29 with SMTP id
 ffacd0b85a97d-439942fbb72mr10085745f8f.48.1772129944896; Thu, 26 Feb 2026
 10:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com>
 <95ccf5a6-975b-4543-80a3-595f1ee20543@redhat.com> <CAGRyCJE85fLOahUR3PAUnS_jH4+qpBq37qpged=nvObbg1m+Qw@mail.gmail.com>
 <20260225170155.0ae83ae9@kernel.org> <CAGRyCJGYLemYFDNw8cfcCHoxe8YqfRRgnJXgz03WVssKDYXhUA@mail.gmail.com>
 <a481bb1e-d0a9-4545-bb8b-beb72506478a@redhat.com>
In-Reply-To: <a481bb1e-d0a9-4545-bb8b-beb72506478a@redhat.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Thu, 26 Feb 2026 19:18:53 +0100
X-Gm-Features: AaiRm53S1aC15XYTnI8L68bLVpVbVtMMl6rsqFOBiLmGiOFTr4QbYHNLGZDrSmc
Message-ID: <CAGRyCJGc+gxF2AcKapr4NJFWVdwF8CBEp7SuxQ2ZHnEUva6XwQ@mail.gmail.com>
Subject: Re: commit 662dc80a5e86 breaks rmnet over usb
To: Laurent Vivier <lvivier@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Koen Vandeputte <koen.vandeputte@citymesh.com>, oneukum@suse.com, 
	andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>, pabeni@redhat.com, 
	netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33757-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnlplm@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8952A1ADB3E
X-Rspamd-Action: no action

Il giorno gio 26 feb 2026 alle ore 10:09 Laurent Vivier
<lvivier@redhat.com> ha scritto:
>
> On 2/26/26 09:26, Daniele Palmas wrote:
> > Hello Jakub,
> >
> > Il giorno gio 26 feb 2026 alle ore 02:01 Jakub Kicinski
> > <kuba@kernel.org> ha scritto:
> >>
> >> On Wed, 25 Feb 2026 08:19:46 +0100 Daniele Palmas wrote:
> >>>> Could you try something like:
> >>>>
> >>>> diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
> >>>> index 3a4985b582cb..6b4796fac692 100644
> >>>> --- a/drivers/net/usb/qmi_wwan.c
> >>>> +++ b/drivers/net/usb/qmi_wwan.c
> >>>> @@ -788,6 +788,8 @@ static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
> >>>>                   usbnet_get_ethernet_addr(dev, cdc_ether->iMACAddress);
> >>>>           }
> >>>>
> >>>> +       dev->rx_urb_size = 32768;
> >>>> +
> >>>
> >>> So far userspace tools (e.g. also the most important one which is
> >>> ModemManager) rely on changing the rx_urb_size by changing the MTU: I
> >>> know this is ugly, but it is a behavior that has been there since a
> >>> lot of time, not sure how many tools based on this assumption could
> >>> break.
> >>
> >> What's the policy in ModemManager to change the rx_urb_size?
> >> Increase it to make sure it can hold some specific cmd / packet?
> >>
> >> I wonder if having rx_urb_size max of (mtu, 32k) would break anything.
> >>
> >
> > Typically the host sends a QMI request to the modem for setting the
> > size of the maximum QMAP aggregated packets block. Then the modem
> > replies with the maximum size it supports and that one is then set by
> > the host through changing the MTU of the netdevice. Low-cat modems
> > usually support 4-8 KB, while 5G 16-32KB.
> >
> > On ModemManager side this is currently fixed at 16KB, but one can use
> > other tools e.g. qmicli to set custom values as far as they are
> > supported by the modem.
> >
> >> Since we're talking about rx buffer config the right API to configure
> >> it is likely ethtool -G rx-buf-len :(
> >>
> >
> > Thanks for the hint, I'll try to have a look at that to improve qmi_wwan.
> >
> >>> There's also the chance that there are modems which require a higher
> >>> rx_urb_size, so having this fixed could not work well.
> >>>
> >>> Unfortunately usbnet serves many drivers, I agree with Koen that a
> >>> revert is the safest option.
> >>
> >> Then again the usbnet driver is brittle enough as is, if it's just qmi
> >> that needs this workaround we would be making common code less robust
> >> for a benefit of a single "hack" (for lack of a better term)
> >
> > Makes sense, also Laurent proposed a solution to keep his fix in
> > usbnet and make qmi_wwan the exception.
>
> I was thinking to something like that (see below), but I'm not really able to test it. If
> everyone thinks it's the path to follow, I can send a patch.

I think I can test this by the end of the week and let you know.

Thanks,
Daniele

>
> Thanks,
> Laurent
>
> diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
> index 3a4985b582cb..05acac10cd2b 100644
> --- a/drivers/net/usb/qmi_wwan.c
> +++ b/drivers/net/usb/qmi_wwan.c
> @@ -928,7 +928,7 @@ static int qmi_wwan_resume(struct usb_interface *intf)
>
>   static const struct driver_info       qmi_wwan_info = {
>         .description    = "WWAN/QMI device",
> -       .flags          = FLAG_WWAN | FLAG_SEND_ZLP,
> +       .flags          = FLAG_WWAN | FLAG_NOMAXMTU | FLAG_SEND_ZLP,
>         .bind           = qmi_wwan_bind,
>         .unbind         = qmi_wwan_unbind,
>         .manage_power   = qmi_wwan_manage_power,
> @@ -937,7 +937,7 @@ static const struct driver_info     qmi_wwan_info = {
>
>   static const struct driver_info       qmi_wwan_info_quirk_dtr = {
>         .description    = "WWAN/QMI device",
> -       .flags          = FLAG_WWAN | FLAG_SEND_ZLP,
> +       .flags          = FLAG_WWAN | FLAG_NOMAXMTU | FLAG_SEND_ZLP,
>         .bind           = qmi_wwan_bind,
>         .unbind         = qmi_wwan_unbind,
>         .manage_power   = qmi_wwan_manage_power,
> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
> index ed86ba87ca4e..b72ba0803392 100644
> --- a/drivers/net/usb/usbnet.c
> +++ b/drivers/net/usb/usbnet.c
> @@ -1829,11 +1829,12 @@ usbnet_probe(struct usb_interface *udev, const struct
> usb_device_id *prod)
>                 if ((dev->driver_info->flags & FLAG_NOARP) != 0)
>                         net->flags |= IFF_NOARP;
>
> -               if (net->max_mtu > (dev->hard_mtu - net->hard_header_len))
> +               if ((dev->driver_info->flags & FLAG_NOMAXMTU) == 0 &&
> +                   net->max_mtu > (dev->hard_mtu - net->hard_header_len))
>                         net->max_mtu = dev->hard_mtu - net->hard_header_len;
>
> -               if (net->mtu > net->max_mtu)
> -                       net->mtu = net->max_mtu;
> +               if (net->mtu > (dev->hard_mtu - net->hard_header_len))
> +                       net->mtu = dev->hard_mtu - net->hard_header_len;
>
>         } else if (!info->in || !info->out)
>                 status = usbnet_get_endpoints(dev, udev);
> diff --git a/include/linux/usb/usbnet.h b/include/linux/usb/usbnet.h
> index b0e84896e6ac..bbf799ccf3b3 100644
> --- a/include/linux/usb/usbnet.h
> +++ b/include/linux/usb/usbnet.h
> @@ -132,6 +132,7 @@ struct driver_info {
>   #define FLAG_MULTI_PACKET     0x2000
>   #define FLAG_RX_ASSEMBLE      0x4000  /* rx packets may span >1 frames */
>   #define FLAG_NOARP            0x8000  /* device can't do ARP */
> +#define FLAG_NOMAXMTU          0x10000 /* allow max_mtu above hard_mtu */
>
>         /* init device ... can sleep, or cause probe() failure */
>         int     (*bind)(struct usbnet *, struct usb_interface *);
>
>

