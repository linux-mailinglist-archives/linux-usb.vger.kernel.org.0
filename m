Return-Path: <linux-usb+bounces-33069-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMIJAk/EgmkpaAMAu9opvQ
	(envelope-from <linux-usb+bounces-33069-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 05:00:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F5DE1718
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 05:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 768C03080FE6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 04:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AF12EB859;
	Wed,  4 Feb 2026 04:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vbnzt9Ng"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D62E3360
	for <linux-usb@vger.kernel.org>; Wed,  4 Feb 2026 03:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177601; cv=pass; b=AuqgpxDLKsenxMJO0OWJCLjESdX6iD+xadXNnzWJcf++1WT+TecHLRAb+Blk+Cku43RmJmPOcChrxVIjxtHs9bKhB07qylTC3WN2wLUdpdUYCfkHdHoHRTLtRvCUneJgvy8UbRkBQZ4EnrojM6gufLenyu6RRpCwH9dgIOY0Wbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177601; c=relaxed/simple;
	bh=HlG8hmZ++Pg1EYq32n4D5lHrhSuKPurkhGYIygFAZaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIuBy4Usj/8xCCwyIHzgjF6WA371xVIWNr6fMbHCtMZuLy861XFYZx+Xxs59iH4agJDT4x5GjqDelS6j2mKr++8kegMBIgKuRuPBJbd9QPiKUTfWkPdtNlFB4SRyR3T13fw16CWCEfG+2MLmvOsKQr6Fx16PZV27V8YjqNcCqUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vbnzt9Ng; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a54f6e39so2871c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 19:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770177599; cv=none;
        d=google.com; s=arc-20240605;
        b=k+8BKRdsDIMYLV6xvPJqiOu6281pVQXtnm6KaKJZeJpuuW9dWcd/rC1MT9DvnEt3hp
         bSuvkUP2+eIdwiV9H84pyzNOYqe6qRrDf+ACt+kLcSSDj5YVrlUIZvnK/C4jsAXMukSg
         1R5Dz/A6rp87xsUVmy2s4MY+IxQfM5pWA1b+EdYvEi05zCZjAYu8OZmpzeFiCOPF1Y8P
         aC8Rfy5yWdhW/a8yAfw3vaZ0Qh4Qzp9O3zTgBqVqyW5UTM0aW+kUczDblFQomZBfuBrF
         YkiUXq3dXgZqu8O+enD/jIFHFDsRihY+OxCsE7o0lfAruChZrZX9ZahSfSKXuy6eajNp
         wgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a4O+pONr+0Q4kl2uHAE0DisLaRexdUT2mqWyoSffJ/U=;
        fh=7Dxfab3ptpr1r7ftHebiRUczvUJNS62sn7Kc2KQgTZE=;
        b=CnAdjg+Co7SAP+6pihGlxxry3Y2Qg/OTR9A+e8nWrMeJUaNTY9ycXOMPniXsCpgJw5
         4lueakUtYB3yhtzaemk1VaucNZFxdxXoZCAVCWy+uOT+CJzR9X0CnYpltIzOsaJy1irL
         jl/EmE2ojVtxVDbHEk5H4msKtEv9G/3pmjVt33GIWJyjpUbhpz8Nu+87DBOyQPz5SLH4
         dryT1OtpPsuSeVmRuq+usmoN6EHJrsnyFaK/euxADokCBHDWEP+VOfuLLm/3bzAZv4kI
         4J6DKbD/P1YWFzc1OF1IiqtYeHteekuioYg5Tbzn1/AbFyDFs3ppOW1Nf2B3n3zPLvQQ
         8iMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770177599; x=1770782399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4O+pONr+0Q4kl2uHAE0DisLaRexdUT2mqWyoSffJ/U=;
        b=vbnzt9NgtZ+ynPCdegxR4PiQY2AqFpVJ1HyM0o9bL4cJGTJlOn0qGGpsjfvp8Kxbri
         AdtHUWfFg1cX9A3F6n/V57l9dq+Csfpc/EcPTRxwWJIFvxEugMPr6hgQoNHx0yDhWkMg
         P033n2YRgC151nVnprsA0K8knvKDL/hwc2V4S75DCssU2A5Yztmc6QYSWHxvro6lZx8o
         plpg+H4wo5QIqiUKmthFcZybITvVLK0SypzwvecSLTMw6hXh46a5dSaPDoSgHlpkV6kA
         jl3qM1XN8gzTS3F5/s2pNmCblb1mVsc/dZsE/eolOLjILl4T3mroF6xWlMMlGBEDWNBl
         3DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177599; x=1770782399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a4O+pONr+0Q4kl2uHAE0DisLaRexdUT2mqWyoSffJ/U=;
        b=DPPI3LX6RxRH4CRcwzzxJIyr86tNhBZEGUey/SAnrxLCQ0yffJI1ewQaSFqrkYzMCF
         DvidJNH6k3YcyW8hratl9h0JlojjS067qUicPcD/3WtWl8jRVtToRy2iQY/geEmxFDFA
         wlbZFiSLgwivhsk7maxDb41pZlREZ3cEABR0jKbLsyfcQbvBFL/gRGWveQiErMjI7dtX
         8F6geyNJ8qiZzmZVrIzsYoUyfzvqOBh5J2/C8rxKB/oIPgW4/ix+8rm9a/f1mshQE6Jr
         hR3Cv3DvqEz61dMnQBgZKrORdYhDNnxCq3dGeaVQZ/mtigrPPX4avCk6T70wiU9DD7IH
         hyVg==
X-Forwarded-Encrypted: i=1; AJvYcCVCZR4Sy8rJWGBOgxdt1PIrDKeMrgRX/zX2kZ7/ZV9tmieIsfPmpSavVs14d1c4AXLJehqM8DvEIGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvrKQMwDvnxrMnt+tKPrRk8K/41TYrZjwluR0TREo5jmf5L8ta
	Cgu4YNePKCElr5ATQJ4IVDcrHN7/Mf9kTLPVnalaspF2LMwv9PedoWf1iBFhqLzoq9jWa1q2Rq6
	tE2gid9GITNXRhv88UK8fSOQEN/MBQ18xrq4RxrxN
X-Gm-Gg: AZuq6aJOd9/YDAvdbqHcWU9bBnt+G+SVtVNsazrS43yjQN+zVMQTWd29EcV8EOKHHtH
	RqyhwX4EYahDYQOMsJ/K+LFhkx35PSTq2SPXgh7EH2a4kUEuR+pB8JWYgmwsFGKszyYaQ7hp1a6
	fcZuQPDJL23I0IEBQ790BqBwHjHnKflXPy6Z0hyR3o05AsWKmc0xU/AUY4VXTwMV69yHdsK+e+6
	KXvcdKgxTqyuELvLg8SMzjXcMCkZrU0ykUJGzk3DCIG9LDcULWTem3HcHV+oov9roKNxuePII8c
	+ETMQRP0XUlYW+mr9+acylOG
X-Received: by 2002:a05:7022:69a1:b0:119:e55a:8084 with SMTP id
 a92af1059eb24-126f5ee5947mr36512c88.1.1770177598191; Tue, 03 Feb 2026
 19:59:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129111403.3081730-1-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260129111403.3081730-1-prashanth.k@oss.qualcomm.com>
From: Kyle Tso <kyletso@google.com>
Date: Wed, 4 Feb 2026 11:59:41 +0800
X-Gm-Features: AZwV_Qj_yUmmocwsEWC3uKxxv0iNFrtw0fA8HLgbu99EItmGDR8lJSETBMRgwWs
Message-ID: <CAGZ6i=3ZJ3aihjmXnPq9C-mpVYa6rqzfWTn3qXmavYUiZtE24A@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Move vbus draw to workqueue context
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33069-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyletso@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 57F5DE1718
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 7:16=E2=80=AFPM Prashanth K
<prashanth.k@oss.qualcomm.com> wrote:
>
> Currently dwc3_gadget_vbus_draw() can be called from atomic
> context, which in turn invokes power-supply-core APIs. And
> some these PMIC APIs have operations that may sleep, leading
> to kernel panic.
>
> Fix this by moving the vbus_draw into a workqueue context.
>
> Fixes: 66e0ea341a2a ("usb: dwc3: core: Defer the probe until USB power su=
pply ready")

I think the following patch is the one to fix:

https://lore.kernel.org/all/20210222115149.3606776-3-raychi@google.com/

> Cc: stable@vger.kernel.org
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/core.c   | 19 ++++++++++++++++++-
>  drivers/usb/dwc3/core.h   |  4 ++++
>  drivers/usb/dwc3/gadget.c |  8 +++-----
>  3 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index f32b67bf73a4..c9af126b9695 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2155,6 +2155,20 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
>         return 0;
>  }
>
> +static void dwc3_vbus_draw_work(struct work_struct *work)
> +{
> +       struct dwc3 *dwc =3D container_of(work, struct dwc3, vbus_draw_wo=
rk);
> +       union power_supply_propval val =3D {0};
> +       int ret;
> +
> +       val.intval =3D 1000 * (dwc->vbus_draw_current);
> +       ret =3D power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP=
_INPUT_CURRENT_LIMIT, &val);
> +
> +       if (ret < 0)
> +               dev_dbg(dwc->dev, "Error (%d) setting vbus draw (%d mA)\n=
",
> +                       ret, dwc->vbus_draw_current);
> +}
> +
>  static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
>  {
>         struct power_supply *usb_psy;
> @@ -2169,6 +2183,7 @@ static struct power_supply *dwc3_get_usb_power_supp=
ly(struct dwc3 *dwc)
>         if (!usb_psy)
>                 return ERR_PTR(-EPROBE_DEFER);
>
> +       INIT_WORK(&dwc->vbus_draw_work, dwc3_vbus_draw_work);
>         return usb_psy;
>  }
>
> @@ -2395,8 +2410,10 @@ void dwc3_core_remove(struct dwc3 *dwc)
>
>         dwc3_free_event_buffers(dwc);
>
> -       if (dwc->usb_psy)
> +       if (dwc->usb_psy) {
> +               cancel_work_sync(&dwc->vbus_draw_work);
>                 power_supply_put(dwc->usb_psy);
> +       }
>  }
>  EXPORT_SYMBOL_GPL(dwc3_core_remove);
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 08cc6f2b5c23..052fb18c6b5c 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1178,6 +1178,8 @@ struct dwc3_glue_ops {
>   * @wakeup_pending_funcs: Indicates whether any interface has requested =
for
>   *                      function wakeup in bitmap format where bit posit=
ion
>   *                      represents interface_id.
> + * @vbus_draw_work: Workqueue used for scheduling vbus draw work
> + * @vbus_draw_current: How much current to draw from vbus, in milliAmper=
es.
>   */
>  struct dwc3 {
>         struct work_struct      drd_work;
> @@ -1413,6 +1415,8 @@ struct dwc3 {
>         struct dentry           *debug_root;
>         u32                     gsbuscfg0_reqinfo;
>         u32                     wakeup_pending_funcs;
> +       struct work_struct      vbus_draw_work;
> +       unsigned int            vbus_draw_current;
>  };
>
>  #define INCRX_BURST_MODE 0
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 9355c952c140..03d8a3a151e0 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -3124,8 +3124,6 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gad=
get *g,
>  static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
>  {
>         struct dwc3             *dwc =3D gadget_to_dwc(g);
> -       union power_supply_propval      val =3D {0};
> -       int                             ret;
>
>         if (dwc->usb2_phy)
>                 return usb_phy_set_power(dwc->usb2_phy, mA);
> @@ -3133,10 +3131,10 @@ static int dwc3_gadget_vbus_draw(struct usb_gadge=
t *g, unsigned int mA)
>         if (!dwc->usb_psy)
>                 return -EOPNOTSUPP;
>
> -       val.intval =3D 1000 * mA;
> -       ret =3D power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP=
_INPUT_CURRENT_LIMIT, &val);
> +       dwc->vbus_draw_current =3D mA;
> +       schedule_work(&dwc->vbus_draw_work);
>
> -       return ret;
> +       return 0;
>  }
>
>  /**
> --
> 2.34.1
>
>

