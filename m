Return-Path: <linux-usb+bounces-37540-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hk9OKa2CGp42QMAu9opvQ
	(envelope-from <linux-usb+bounces-37540-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 20:25:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6065555D162
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 20:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64F2E3009F04
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 18:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B4D3246ED;
	Sat, 16 May 2026 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ES+fd/9H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3403254A2
	for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778955933; cv=pass; b=Cov2S7hnspd6WDISLuq8eULzGqoGWQyMf6gnMRcSkfXd8cWOmDL84weYI5K+KYR4/Srd931HLW8DF8sJuVStUJkCK97Etbc27dNOZYnIIJgKSV0+RdeQvES/c08m1OVHU+SAlYN2VDqAVGPFaLoWPkel98vBdXr/mZKcBoBPI50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778955933; c=relaxed/simple;
	bh=rlnP6BSKk3y+57gPpnvq0Nwo15+DtNNEApQU1WzrYAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNXsfx9+iDsJt217aiM05S6UeqVvPm/7Bczj62jYO45dXEFycKunofnyLghp6EejD5Ghi41PKooHDKsjaswP6VOh2cC/oDoDxwbiZOEgC6WhpDqbJB2wTfXTmzZ3/ZqsbhOBcMbTpX3Y8EXsdxTPSn7OTbCHZrXndUgat1MoMOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ES+fd/9H; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-63169437ac7so772398137.1
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 11:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778955927; cv=none;
        d=google.com; s=arc-20240605;
        b=NZEVkcdj/QZCI9TgXg+FkYqoEhcsuR7m1+W94XjHisOMKyVRJgtK2Nd/3Io8ZG5TGF
         6V7HVoGj7pRWJQgzWWJ0QnM4eijbYwQ+ZMbsQMBoMiQnQlVLXwkUVftd9lfsIBe8Yvt2
         s9xvjJkV4aEZg2JAlU9fGmSZMF+GPgKjfLU4EYm95C2nGpItGOKc92nNaxYrN7Pj5yG/
         1OLcxZ2Efsp6kmPKShuwyKk4aOWuYoJR8/UHZevk5HRofMipI7MeYQ5Lf7Y76gqnNoEI
         6x286hgNa2/8JU5r1mX24jZDR8J5XUFVBntGGHUTbfjT5iPbpsUG31rHyC4KcrMiege4
         +9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        fh=ab9j8YzIDCHMCoCZqXEYWUMquE5mfFsbUB2lJnXFO6Q=;
        b=A3kvQ78qUbxjs+fSGG8Y7KTQCxFODTrS4kbfY+mbbiNS9ZdXh2fXbAJV29ltBs+yR9
         U9QAsskfgLWcBGRTFS0pai5VyFkioFpIBFIfvBeEKKYTLUsGCZbgA/Wo1dSOcZ6M7yeB
         9L3iLdWvX23pyMHMb96GzHK+2YvvlZGns7kvmND3TJ1qW9rNbFceVJjbyZw+5PmfnjHu
         ErIN+6bwSVlzDAz6+fFwdwjtvYBMwOCrFnJFOH9oMPCAfvxTaGQ9vc1ym5BjPfeLeXB7
         hRvnZSWRXnm9+J993Hvu8djcLagmuQIpHdWvz/WlRCgQAgm11benDv0ts6bg1XAW6GTz
         dW3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778955927; x=1779560727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        b=ES+fd/9HVUTBK/AFLWTqVNgFscVrwTfDjYH2vxAQ7Yzc68Gc4Qs/67E6evV0QrLa2k
         Fo5IOxOO4kcwPuTsNxempHvhN/DZTwhMRXQgtLrxUhHz966+x40+bxFlBD+Qtf259qLg
         nx2m5OrbtocZJqLBXmPexEwdg5JJy/3Azxux1+CUvmyq9yFrcZDaCIkSQd4UTfwX+Qz5
         jJrO6A5JC/y579nBDV25BUKAIdmS+s48uIY0qchQ5zwcjom1Zt12PvBJOsHiYetUNayi
         Cipahwq4tl2U4uFitIv4cZBDFz/A9JPdbm4L1DQzZijS8W1UaM1FbKWnZ1rmrSrs7O0G
         os+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778955927; x=1779560727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        b=QzfTOtj8abWSotejz4Tddmha9rQjA4L/7qojg4EwaC9O8i/V11oeae0n8GNH0kaKUL
         yYvhbz+SOR/ht/6B+er2A7e6r6BBIzywSiyWovTsVmZ9E5kC8xnKZ8l8MDceds9DciBH
         PBbHZ98Z+SvoYcK6/1HtVVo0tvd07rT49I+tTGqOp3JdOvk7LNWIVZC6PFZtLXakLUqn
         CdOe5l9w6JqB28SKi/lbRg3MHSpvsXsOHgDLyA8nno0N9u2agMtz5mNdr6QJDDWDjYBb
         CUIuFRqky0+u4X1OuPWuS4l7Dv3Cbyg+Tr2K298zKjCZwdXVtCTiF8bgqrE9Ojij12uP
         3DcA==
X-Forwarded-Encrypted: i=1; AFNElJ/Fz+m/KlcqsjwPOQPuQutGob/QUmWNzIGubJXuauRzFFgAzk/ThgxBW5/S7yw16MDfHp4p2O79+sI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg9+S/vWazRJl8KqwrcNJtSz1pXA+WNcHFKjTD8Sjb9aNl4NGQ
	w9r0tmoN9ym7QRQTLLgTIOO58FzQfi0Ku89hg3i69kL8TGSAtQCFLMgXpH5E/oBvN+etf5Nq3Xi
	zz2MZTzeV9/cKqPClU2EhfB0PssFe/A==
X-Gm-Gg: Acq92OEaTwOVOhzXm6i5Cg1hnnFBHCOicY/qqoWyqnCwd3JpX23L8TqyP9MVoWQaqyS
	0v78TMSswWPNIMzsld/hPboKynt7t5iWT3IVtKZS2NXM8mX8HJ/pHZVtO2wUiEJYMbtHVcrsfEH
	Pn2esh512MPhoELUZ5GJs47gH5egM7MXBmzyOFwnDFsbGzFTYpMeUc3MtiCe3q2CHmhztJvayuG
	EGcpa0yIMqvi6Fp221ySjVAZN7aOtBPhLX3J+jJQh6PjkSQ4+YBumG5fGyR40itWwxDaHNk4/UR
	z0vDwCPaDEsK2TvSFMTZ5ea2YO9CJNg2QkEWmvxL
X-Received: by 2002:a05:6102:a4a:b0:631:3cbe:24a9 with SMTP id
 ada2fe7eead31-63a403acd61mr5104520137.31.1778955927317; Sat, 16 May 2026
 11:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org> <20260504-wip-fix-core-v3-1-ce1f11f4968f@kernel.org>
In-Reply-To: <20260504-wip-fix-core-v3-1-ce1f11f4968f@kernel.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 16 May 2026 14:25:15 -0400
X-Gm-Features: AVHnY4Ld3uQxrMVDp5dOpfkW5jEH4X-4ObNKlmAwKJn9zSPCBkcMEhByKE4-YXg
Message-ID: <CAMzpN2ijE3vqnh30T0ETQBp6qcVbsxNZZ32h4oEri9nBFUd-UQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] HID: pass the buffer size to hid_report_raw_event
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6065555D162
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37540-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgerst@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, May 4, 2026 at 4:48=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.o=
rg> wrote:
>
> commit 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
> bogus memset()") enforced the provided data to be at least the size of
> the declared buffer in the report descriptor to prevent a buffer
> overflow. However, we can try to be smarter by providing both the buffer
> size and the data size, meaning that hid_report_raw_event() can make
> better decision whether we should plaining reject the buffer (buffer
> overflow attempt) or if we can safely memset it to 0 and pass it to the
> rest of the stack.
>
> Fixes: 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing bogus=
 memset()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
>  drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++++--
>  drivers/hid/hid-core.c             | 42 +++++++++++++++++++++++++-------=
------
>  drivers/hid/hid-gfrm.c             |  4 ++--
>  drivers/hid/hid-logitech-hidpp.c   |  2 +-
>  drivers/hid/hid-multitouch.c       |  2 +-
>  drivers/hid/hid-primax.c           |  2 +-
>  drivers/hid/hid-vivaldi-common.c   |  2 +-
>  drivers/hid/wacom_sys.c            |  6 +++---
>  drivers/staging/greybus/hid.c      |  2 +-
>  include/linux/hid.h                |  4 ++--
>  include/linux/hid_bpf.h            | 14 ++++++++-----
>  11 files changed, 53 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf=
_dispatch.c
> index 50c7b45c59e3..d0130658091b 100644
> --- a/drivers/hid/bpf/hid_bpf_dispatch.c
> +++ b/drivers/hid/bpf/hid_bpf_dispatch.c
> @@ -24,7 +24,8 @@ EXPORT_SYMBOL(hid_ops);
>
>  u8 *
>  dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_t=
ype type, u8 *data,
> -                             u32 *size, int interrupt, u64 source, bool =
from_bpf)
> +                             size_t *buf_size, u32 *size, int interrupt,=
 u64 source,
> +                             bool from_bpf)
>  {
>         struct hid_bpf_ctx_kern ctx_kern =3D {
>                 .ctx =3D {
> @@ -74,6 +75,7 @@ dispatch_hid_bpf_device_event(struct hid_device *hdev, =
enum hid_report_type type
>                 *size =3D ret;
>         }
>
> +       *buf_size =3D ctx_kern.ctx.allocated_size;
>         return ctx_kern.data;
>  }
>  EXPORT_SYMBOL_GPL(dispatch_hid_bpf_device_event);
> @@ -505,7 +507,7 @@ __hid_bpf_input_report(struct hid_bpf_ctx *ctx, enum =
hid_report_type type, u8 *b
>         if (ret)
>                 return ret;
>
> -       return hid_ops->hid_input_report(ctx->hid, type, buf, size, 0, (u=
64)(long)ctx, true,
> +       return hid_ops->hid_input_report(ctx->hid, type, buf, size, size,=
 0, (u64)(long)ctx, true,
>                                          lock_already_taken);
>  }
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 61afec5915ec..a806820df7e5 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2033,24 +2033,32 @@ int __hid_request(struct hid_device *hid, struct =
hid_report *report,
>  }
>  EXPORT_SYMBOL_GPL(__hid_request);
>
> -int hid_report_raw_event(struct hid_device *hid, enum hid_report_type ty=
pe, u8 *data, u32 size,
> -                        int interrupt)
> +int hid_report_raw_event(struct hid_device *hid, enum hid_report_type ty=
pe, u8 *data,
> +                        size_t bufsize, u32 size, int interrupt)
>  {
>         struct hid_report_enum *report_enum =3D hid->report_enum + type;
>         struct hid_report *report;
>         struct hid_driver *hdrv;
>         int max_buffer_size =3D HID_MAX_BUFFER_SIZE;
>         u32 rsize, csize =3D size;
> +       size_t bsize =3D bufsize;
>         u8 *cdata =3D data;
>         int ret =3D 0;
>
>         report =3D hid_get_report(report_enum, data);
>         if (!report)
> -               goto out;
> +               return 0;
> +
> +       if (unlikely(bsize < csize)) {
> +               hid_warn_ratelimited(hid, "Event data for report %d is in=
correct (%d vs %ld)\n",
> +                                    report->id, csize, bsize);

This fails to build on 32-bit with this error:

In file included from ./include/linux/device.h:15,
                 from ./include/linux/input.h:19,
                 from drivers/hid/hid-core.c:25:
drivers/hid/hid-core.c: In function =E2=80=98hid_report_raw_event=E2=80=99:
drivers/hid/hid-core.c:2053:43: error: format =E2=80=98%ld=E2=80=99 expects=
 argument
of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=80=98size_t=
=E2=80=99 {aka =E2=80=98unsigned
int=E2=80=99} [-Werror=3Dformat=3D]
 2053 |                 hid_warn_ratelimited(hid, "Event data for
report %d is incorrect (%d vs %ld)\n",
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The proper format specifier for size_t is "%zu".

Brian Gerst

