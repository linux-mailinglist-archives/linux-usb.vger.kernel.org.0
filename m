Return-Path: <linux-usb+bounces-32966-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADsFAbhifmlNYAIAu9opvQ
	(envelope-from <linux-usb+bounces-32966-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 21:14:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F7C3DA0
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 21:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60701300D574
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 20:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7781337647E;
	Sat, 31 Jan 2026 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tnS/G4TN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442E376469
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 20:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769890471; cv=pass; b=lWn2Y0BBUA/Yj/loLE2QFeZXh7mVNJGjhf48ky1xWb9Mzml2oMfg9sNXOxZRTJHyBuuV1rvGi74PDdwfOxP8EHV0Xv7J3GJEA9/NKbds9Hl5B5KCFqS+XrYBSNl3TEXrQxNr9pjJCcMKeqrxKoaAp0XX6WxKdqxV0VgydqY3yso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769890471; c=relaxed/simple;
	bh=yMZHFitBveSwTiyRgSyxNN1NEBI5FO4K9xicZu7zkl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acqDvmBYH2lrSUYGGzgx8K1ja0BpAkxDUociftmpmk5cOowa9ehHNo1XM4Vm3zoRdZKORgwsDcJXavZIVXcEXnRUROCcQxSulaZTgVqH60+zulJlJjUFuYvYSVRSwfTZH+r7IoeO/MVsTNhSMMG0VqJso+62gMCiW4dATVvOtV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tnS/G4TN; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so6578730a12.0
        for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 12:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769890468; cv=none;
        d=google.com; s=arc-20240605;
        b=i0iroYdIF/hISnecR2FpA2hq74iLEP2CqRrGVeu+XKCj75FjyYspvko0wZl0zcMpFf
         AAjAnIhCkRkf86qwTi6zji1SmfOyzILMDJgGVjM10dkO3RyA3VVNNj+Gqu+NVWBYO2mX
         gGLGRWLvghuBhdvrpdHIkAPOyIKi0148Yqlr4Hv6ibSM+WWS5+2YWSiGbElPQ/LVbXBe
         BZduw7eHPLWqIR0EoPhHp1EK4awfCndnTditjYHCReFr2S8BptdlpAn/TQQdgzNxHo7A
         EwvckU6JsFkDCQq0f0RnyBdlW4EhGLNZEm7iSkQWgjZvGr6od57NkQOJ+26aAQw+NwzS
         CPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=km8kplnm0XUJRbZI5k8OFXrzF6vf8FSgEbZtSrDmOz4=;
        fh=cqJEla+5PDZOZxd59BjbO+CtnOAwkhBYvap6L7ehgFI=;
        b=HzDprSIRw17yJbfax2+nWsM5WeSbjHeRj42x27ew0JM8IWXGa+2Y0Wa0Ggk1DInEzc
         LinkyA9kb1h34+Hj1n6Wf+7MbS2cgd7ITzxEAY1+P3DBryOmrKPcZQZmHwde1dWVi2Cv
         wiHBHPCA1v8nXlCu/JTMeNew8F60S6id+CPTopIh4E5Dh163EUNgDmGHsaiOhMyeaTcS
         RApqG9EAKow6ftudltZFESEHIhXng+8ZkArbVH2m9+hHzQ8rBT1WRswESNrxXdC0uHLg
         4SqnVhVPbF/kkqE1LEPLaVZyeOqVnze5VZ7PHRJ75AXYrxuTyNd+m6jIgZ2Pgma2YZ3s
         s93g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769890468; x=1770495268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km8kplnm0XUJRbZI5k8OFXrzF6vf8FSgEbZtSrDmOz4=;
        b=tnS/G4TNEedmNr80OFoKem8ANs3tt3BZcWf8YQpk9OyLKiA89e1lPKqDHo1IAB8pHA
         EPYHJj8G/qWsfd3DsYU2EOCA/Jn4Pp0ZfMF+DUBEprY4CEoQMUYc3KiIFwIFMEJ04I69
         J+Bn80+H3EThh1iautNEZvzWsYTpk+TiVXyLUfpuIWk9SH7e737Bf+AYoJPGlbzQnvBa
         ofIsqEZVwxoaluliTZ46jHbPbyFAeV7q6IJRO92IIYdXncwGDtR9zk5eWrNVvuyENY2p
         Rt1uUNsSNia1f4arhgaaZuDXwKuPP3bnxbd8D0C4m1d4NyMuLxjK/0bjmaAerBh0509C
         aZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769890468; x=1770495268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=km8kplnm0XUJRbZI5k8OFXrzF6vf8FSgEbZtSrDmOz4=;
        b=SgDDjyG1mQzBW4ogQdEJ6DY+U9axtP9pkmOn+tlFxBdKErytZS6QlD9+3opC8TkuBg
         cRKri7KptASRnVuQJPooB2NicR0CMuNTAzWFBbsDk4IVnjJLauKor943X8OmAJY2JW59
         n71YBaB2Kaqf6X89GnRytCNXCOZT5xWxuHW+D734ODBddaD2P3pl1kPyyuffrIl7uz7L
         zcOqBe1tN5ml5I3v0vzpkeXP6o43GgcNMEKgti7evPdgrXfGNYbBHOXHM6s4Da7LIain
         w5y8S57ACiTmpZc7g90ocRdaYUt2yU7yL0YIJefSqhCOAiYoR1TBWfLew/9NzCD4njC/
         8zbg==
X-Forwarded-Encrypted: i=1; AJvYcCUg/mtb/ZBdpSiwrjokFTLEU0IlHYkM7UjIrUyPGiUhO+YBC9tPkhz+L1y4ptVxLE56sUwKF/3QmHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qSJrVxx/z+nodYZ6fohpsB6ksaDLfUa2sFvdDtlUv/g37Fe1
	ha0XSbhEDpSK+gLMYUdhuejv/2yvSr1rTcA9mRmb45bOg4bmKa/c+t1El2WpNzlZ4gDYezuszia
	T2LXA9Or60h6KipO8IAogF8V/wKrNjbcNvZo3oGLF
X-Gm-Gg: AZuq6aIRw8GW0R6Hy/298fB5uwAfqXqWoQ1xIurVvxWICBvLTS2c3gcZqvefy1DFVdX
	+gI43XyKylDCv5LIaETGHlycLt2k5TGjxndcWKUVqCQ6cW6B2Gsm+Fqf/IlWLlQlCMsao0TPcY1
	HENwVsLy31psj4SvC63FMdH5lkkPgFu2V+Gj1RQgD4XyEKc7xiWP8wxZAJ/2ZtOmr005O+emJsO
	Ux1FuBtZ/sDJPSLdeucCKPLOQwR/M9eRnR7fvzemysz/nceUKVs0oPDtvAyZ1Y/6J4o
X-Received: by 2002:a17:907:720a:b0:b07:87f1:fc42 with SMTP id
 a640c23a62f3a-b8dff432d83mr474220066b.16.1769890467383; Sat, 31 Jan 2026
 12:14:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129111403.3081730-1-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260129111403.3081730-1-prashanth.k@oss.qualcomm.com>
From: Samuel Wu <wusamuel@google.com>
Date: Sat, 31 Jan 2026 12:14:16 -0800
X-Gm-Features: AZwV_QidVxFPSSU4X1IAAyjblyzS6gM99DWlGcx5x-nNJW2TuFYl1jr8vKw-2Xw
Message-ID: <CAG2Kcto8GZmSkWMmdWkZaQLrt-HS8e5XQ2LWKVxv08PyQDjpjQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Move vbus draw to workqueue context
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32966-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1D4F7C3DA0
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 3:14=E2=80=AFAM Prashanth K
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

On Pixel 6 with this patch applied on 6.19-rc7, I am no longer seeing
the following lockdep:

[ BUG: Invalid wait context ]
6.19.0-rc7-mainline-maybe-dirty-4k #1 Tainted: G        W  O
-----------------------------
irq/360-dwc3/1244 is trying to lock:
ffffff8018110eb8 (&psy->extensions_sem){.+.+}-{3:3}, at:
__power_supply_set_property+0x40/0x180
other info that might help us debug this:
context-{4:4}
1 lock held by irq/360-dwc3/1244:
 #0: ffffff80368d78f8 (&gi->spinlock){....}-{2:2}, at:
configfs_composite_suspend+0x28/0x68
stack backtrace:
goodixfp: Succeed to open device. irq =3D 417
CPU: 0 UID: 0 PID: 1244 Comm: irq/360-dwc3 Tainted: G        W  O
  6.19.0-rc7-mainline-maybe-dirty-4k #1 PREEMPT
Tainted: [W]=3DWARN, [O]=3DOOT_MODULE
Hardware name: Oriole EVT 1.0 (DT)
Call trace:
 show_stack+0x18/0x28 (C)
 __dump_stack+0x28/0x3c
 dump_stack_lvl+0xac/0xf0
 dump_stack+0x18/0x3c
 __lock_acquire+0x794/0x2b08
 lock_acquire+0x138/0x2c4
 down_read+0x3c/0x17c
 __power_supply_set_property+0x40/0x180
 power_supply_set_property+0x14/0x20
 dwc3_gadget_vbus_draw+0x8c/0xcc
 usb_gadget_vbus_draw+0x48/0x128
 composite_suspend+0xcc/0xe4
 configfs_composite_suspend+0x44/0x68
 dwc3_thread_interrupt+0x7b4/0xc7c
 irq_thread_fn+0x48/0xa8
 irq_thread+0x16c/0x338
 kthread+0x150/0x280
 ret_from_fork+0x10/0x20

Tested-by: Samuel Wu <wusamuel@google.com>

