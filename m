Return-Path: <linux-usb+bounces-38117-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIUZAoGUF2oiKAgAu9opvQ
	(envelope-from <linux-usb+bounces-38117-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 03:04:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0194B5EB796
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 03:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94DD03020E13
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 01:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A58230BD9;
	Thu, 28 May 2026 01:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="CkqyVaXy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4A2222AC
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 01:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779930229; cv=pass; b=McbIdRN+oQ23NGp0R3cPUKPsF35rZx6hLlk6LZucJsusmwLOq7n07ObPlpbGsN0Ec0Mqkg7VrwieG6CBMUscDKQ1xPmMhOtlmJRaUorGfM6Q8AKczLdHpbJBO+LSeA8rd718fbsz0PTaigMxr+USFbdpy9iT5ladXeKuQir57fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779930229; c=relaxed/simple;
	bh=15tAq8WwDZNpYeVyp735PNuPFlK2qKUqAu/rIEsw0/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OW7boCKwx/JsfTNL7vCxBlSfs2fvrgHyegvpfNMkOJaRqfbyr6EkOiVH8lQnGkxXSX1gscmCk+DDettxa7MEpze/GFS9Nd9Ep2+Z/GH0Z5Plbs5VKONnKbulQ6tUzGG718KRjlw+PG3RAhbql4Uqfg4LMkkFoVVJbel9KOflEio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=CkqyVaXy; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 981383F843
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 01:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779930223;
	bh=pd+rdlH+Bmci63A+62PP9PkWrVj3XNGIVgYLT4S5mo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CkqyVaXyTT66gRw2F1VMZhoDCfHhicjprcwixO9PEjZY2XiAIjsi4aWKGQApVP5mh
	 WXzB9f1LhXleKqburez9EnrfGO2D8mRbgK/ktzsnocWBH7VT2Nxae0/piXZr1AKT03
	 /9X14J8DjinQHqtaANquXBEy1XTY8PtDGze1rAlYiVkOe9WLPLCEixnLD0Xg3/fKvO
	 GDqiN9mtSdPTtkTWdOhYpL/YkytVJZRdudr/76Wchcj3oyL9rxN6zpdntfpwSKyKa6
	 NhbrziOhXBlTZ/a71ysz83fqJWHoZuX9F/7tN2/Ypf2aHJ7BRIVRvIB/b8v2NA2Dhk
	 Wq3nrelhdRqIcGczBNCE4/ecGgOnh04ojeRrBy9dmf0BLUJMvk42idbNPHgnutCA8J
	 eXSqDMLo0Sj9yASlEP09TEYvP01LY8zqnQKqyQPsACHTun8JQz6oB8RkmgnjFLPE41
	 hnkdHpuaRxItHk1dXvXEo6jA1u5+IBeYJ1HB9Y+3/jCoNd1BltQMuGg5TsH3vjVb/3
	 WdSpnK9pGhrYVTTMquhFVz1nSSQHC9H/bBbf/x7hNuq6sDh6gnj2rqYWO4oUzo+xkX
	 ELyyo156M6EhaoQW08dnC/koAo+q7SSwHa4fx9V3Xw40xmLzuCFhj2PH7UtHoXWny6
	 zmS0hTAPSrfklNWyAAjeKQ0U=
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4855acff336so651156b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 18:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779930222; cv=none;
        d=google.com; s=arc-20240605;
        b=eOp/0gxVTSqKF+n4FKHkx4Rdjdw7I7698n4/fFK7sNOiONWxTjoszO4/0+kvvoMFOx
         3q+KtXOjflpUgfIn/mYMKONdb2QQjecsCs8MZZx0azKGrLNAFfyUKD8+mWoIJPXXhkZY
         YMjDfiDQje4L9PiEEDZdH/ROgYrUn5vV51pnzs0vFnUD9rHtqDn8ID63RMHTeNVR7v6D
         qeEcWMfnUfVa30cBiGNxXz1ou2Pwlt+7lXfy/nJDtisyAgcE9nVaae2iZRmwBud+vQvu
         o5Yhrcq8odqAw+MalqX/EYNDU2Q7AxkZVawa7xO3W5Bp46pxlp72TyXgjJndI4GEtjGx
         ojsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=pd+rdlH+Bmci63A+62PP9PkWrVj3XNGIVgYLT4S5mo0=;
        fh=BFfoYSj/d+A0H0Wd8SX06i0qxld6gEdUQM+p0HxI+UA=;
        b=h0jvwBMvPijgj1gb/ERQOuMnTXB5v4KKIvcyZDIyWNmOrtHXVyKySRVKFZEXkH+OW7
         0ND8TFQjoPcwcUuANoOBjvBCe/5PH6LGJs3DqsL6azKFBMAuqv+qDl/S9kKBDwttMAsH
         NudK1UKZ3CmD0MU4AXJkJB9DoOpWjzmW7mMpyOpOyYy0rkhGuCMMg4UmPG8lrr1ScDhA
         aOCp1aOLZGLGsQZNCSUZ8YdN/Io1g4usnoU9/LD3ENrbKrHRjnwoIqqDlo3vBXJwXWfn
         q0PIRgwt4X4Yz5M0AJpem/42fzKa/PiAPfTDmAUsWGpgHXTFLqAspNCzzLwWuJqSFIxw
         qoeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779930222; x=1780535022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pd+rdlH+Bmci63A+62PP9PkWrVj3XNGIVgYLT4S5mo0=;
        b=f4LJR/GOQ3QGiIHz66JSB2OjJ5hSUMAkb/R3JekbUkJPUOvxx4e5IZUAhebhKVHei8
         Q0kklHF5HsTfVRLEHg7ZKfk6rj+UZms0xAblHURsBS8tXvFDYtWLv8a/eE6CGO0JCUFo
         Qi1ZfiMjyqCNgvVsLe6LCMLIT6jIGqHJ8AIEpgSDhT8lM8N90WoKfqhfMqR4z0Px1ZhU
         n1EEvnsjzLRgqqhd8r0OmytorT10UKWupaNeGmSOIuKdiwwVETpcwQZOLjpwYzWjQdM3
         38p02c5doKcam4yJ8bXfTT5OkrUE0tQd1eaM2wceilSW2bbUus1EjnpakQCc7Lre1W3x
         0okw==
X-Forwarded-Encrypted: i=1; AFNElJ9d86WfoTIF9ocLSYPPFXvBajHozRZcBf9X32wk1AeMfR3R45+Qhq3ZPUztbjtuNiyMR8ARRqg0zvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFDLR5YKxmM/Z12kjEFLs4K++k5Toitr8P70w3sEMT4opGgl9g
	Yp5H2znJodbRydi7J+AaT6eBGYd5q0iDR2frN9bPBLhMJBKop4A+jOUi0ZJ4VrwNs1ZB4Bl6VHR
	XRXcN4J2W2XVti45gUydmhKmsv5ISAb7Xb8DnE6w7RLyFKYT9+7M1ww+yOi4ORNW93LiI9i/ttO
	/hFIkcmI9qCVYvFOTo8xebW1EVIL0YlvAgkKYbzziy0yTgpKZTddhw
X-Gm-Gg: Acq92OGe5Iv8hBjvKiIXzFyKbB+cY/N6yIdJPB8EmNiMjiHMUTojC8It0K9+wv5yWqB
	JumwIwy7TMG8BQsR1zunBk6dVxvwEXyCIlkPm5ePXIhreyBZvKPUt9hYt+ol5PLsC+JCgH9ORJg
	Dolu1K+WCezhzDz/oYIGgQqL93EBi5MLpAbVFQV7NXzU50Jl3B6MzEb2JQMVKTwyaU6CtM1MHMu
	PTD2aiaCZ3235JdziPKdAZMqY2jxo43f/dQRK7B2b+ysHg9EThC1xT4PnnvrlsZ
X-Received: by 2002:a05:6808:159c:b0:485:5f33:92a9 with SMTP id 5614622812f47-485d0252cbbmr439450b6e.8.1779930222273;
        Wed, 27 May 2026 18:03:42 -0700 (PDT)
X-Received: by 2002:a05:6808:159c:b0:485:5f33:92a9 with SMTP id
 5614622812f47-485d0252cbbmr439434b6e.8.1779930221912; Wed, 27 May 2026
 18:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527064121.173952-1-an.wu@canonical.com> <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com>
In-Reply-To: <20260527071445.GB3102@black.igk.intel.com>
From: An Wu <an.wu@canonical.com>
Date: Thu, 28 May 2026 09:03:30 +0800
X-Gm-Features: AVHnY4JwA2epxF6VvfchhkscrYtBOV7Uf8TwInHGP6wEnOYLyIh7IBLdxq4E6ms
Message-ID: <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38117-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[an.wu@canonical.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[canonical.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,canonical.com:email,canonical.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 0194B5EB796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mika,

Thank you for the feedback.

Sorry for the mess, and I understand the concern that the Thunderbolt
CM core should not call PCI-specific functions, especially since the
direction is to support non-PCIe hosts as well.

Putting graphics drivers into the initramfs does not look practical
for us, because we may need to include many possible graphics drivers
and dependencies, which would increase the initramfs size and
complexity. Moving Thunderbolt out of the initramfs may also cause
regressions for users relying on Thunderbolt docks early in boot, such
as keyboards in the recovery/LUKS shell or network devices for
early/rootfs use cases.

The problem I am trying to solve is that graphics driver readiness can
affect Thunderbolt DP tunneling, but the graphics and Thunderbolt
drivers currently run independently without any coordination. As a
result, Thunderbolt may treat a temporary graphics-side readiness
issue as a permanent DP tunnel failure.

So the goal is not to make Thunderbolt depend on PCI, but to find an
acceptable way for these components to coordinate, or for Thunderbolt
to retry/check readiness in a more generic way without adding
PCI-specific logic into the CM core.

Could you please give us guidance on what direction would be
acceptable upstream?

BR
    An

On Wed, May 27, 2026 at 3:14=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Wed, May 27, 2026 at 02:41:21PM +0800, ChunAn Wu wrote:
> > When the Thunderbolt driver loads early (e.g., from initramfs)
> > and discovers a BIOS-established DisplayPort tunnel, it starts
> > asynchronous DPRX polling which checks if the GPU driver has
> > read DPCD from the connected monitor within a 12-second timeout
> > (TB_DPRX_TIMEOUT).
> >
> > On systems with Full Disk Encryption (FDE/LUKS), the GPU driver
> > (i915, xe, amdgpu, etc.) resides on the encrypted root filesystem
> > and cannot load until the user enters the passphrase. This creates
> > a driver load ordering issue where the DPRX timeout fires before
> > the GPU driver has had a chance to initialize, causing the
> > Thunderbolt driver to permanently tear down the DP tunnel and
> > remove the DP IN adapter from available resources. Recovery
> > requires a physical re-plug of the dock.
> >
> > Fix this by deferring the DP tunnel teardown when no PCI display
> > driver has bound yet. Register a PCI bus notifier that watches
> > for display class (PCI_BASE_CLASS_DISPLAY) driver bind events.
> > When the DPRX timeout fires:
> >
> >  - If no display driver is bound: tear down the tunnel but keep
> >    the DP IN adapter in the available resources list, allowing
> >    a retry.
> >  - If a display driver is already bound: proceed with the
> >    existing behavior of permanently removing the DP IN resource.
> >
> > When a display driver eventually binds, the notifier triggers a
> > DP tunnel retry via a scheduled work item, re-establishing the
> > connection.
> >
> > This approach requires no changes to GPU drivers and handles all
> > GPU vendors (Intel, AMD, NVIDIA) through the generic PCI base
> > class check (0x03xx covers VGA, XGA, 3D, and other display
> > controllers). It also handles the FDE case gracefully since the
> > defer and retry can span an unbounded passphrase wait.
> >
> > Tested on Dell Pro Max 14 MC14250 with Dell SD25TB5 Thunderbolt
> > 5 Dock and LUKS full disk encryption. Simulated a 58-second
> > delay between TB and GPU driver loading -- display came up
> > successfully after display driver bound.
> >
> > Signed-off-by: ChunAn Wu <an.wu@canonical.com>
> > ---
> >  drivers/thunderbolt/tb.c | 96 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 88 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 95d84612e06e..48e0b540fbec 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -62,6 +62,9 @@ MODULE_PARM_DESC(asym_threshold,
> >   * @remove_work: Work used to remove any unplugged routers after
> >   *            runtime resume
> >   * @groups: Bandwidth groups used in this domain.
> > + * @pci_nb: PCI bus notifier to detect when a display driver binds
> > + * @display_bound: Set when a PCI display driver has bound
> > + * @display_retry_work: Work to retry DP tunneling after display drive=
r binds
> >   */
> >  struct tb_cm {
> >       struct list_head tunnel_list;
> > @@ -69,6 +72,9 @@ struct tb_cm {
> >       bool hotplug_active;
> >       struct delayed_work remove_work;
> >       struct tb_bandwidth_group groups[MAX_GROUPS];
> > +     struct notifier_block pci_nb;
> > +     bool display_bound;
> > +     struct work_struct display_retry_work;
> >  };
> >
> >  static inline struct tb *tcm_to_tb(struct tb_cm *tcm)
> > @@ -1914,6 +1920,58 @@ static struct tb_port *tb_find_dp_out(struct tb =
*tb, struct tb_port *in)
> >       return NULL;
> >  }
> >
> > +static void tb_tunnel_dp(struct tb *tb);
> > +
> > +/*
> > + * Check if any PCI display class (0x03xx) device has a driver bound.
> > + * Used to decide whether to defer DPRX polling at boot.
> > + */
> > +static bool tb_is_display_driver_bound(void)
> > +{
> > +     struct pci_dev *pdev =3D NULL;
> > +
> > +     while ((pdev =3D pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev)=
)) {
>
> There is no way we are going to call PCI functions from the core of the C=
M.
> We are actually going to the opposite direction to be able to support
> non-PCIe hosts.
>
> Why not put the TB driver as part of the encrypted volume as well if the
> graphics driver is there? Or put the graphics drivers part of the
> initramfs?

