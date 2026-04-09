Return-Path: <linux-usb+bounces-36083-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL7oKaZX12kFMggAu9opvQ
	(envelope-from <linux-usb+bounces-36083-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:39:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB13C7206
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D59D3008C30
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 07:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFE337C929;
	Thu,  9 Apr 2026 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="hgTf+7pq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19073290B7
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720352; cv=pass; b=GMDzuBIAYHc6hIglsgK0L7QNF+hjoz+oiWANlua55L0fLEDJSIY8X49Mxa/LYVS1DIc7OQHGZQ9uhj6OAmVATwC5FiopZZ27+WHIVgSGbZfobiBcBv8nC+HMwAZT2kxQIQUjuAzdF5mYs+qhFnfmreInnVRdGQbIx10L+hxJmTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720352; c=relaxed/simple;
	bh=3FgneMfmSZvBmGVUZNDZOU/z5vLC0MLmUAZd8nOxzaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szSMk4xeIT8o/YoCMz8C65Yumkvj4chZ23BEHoeO0L4sJcXA1pGSa5S6IT8CGWuS2a6JnRm4VjvCZbE214wdIQP+syPhB9Cg9xQ90cUpmKFybJQyjpxF7O25Rq97blO+5i3PBAtmaZCvJDrDNWjF3BqqfAS8Y2l3Y6ahYYNVclE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=hgTf+7pq; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6501e465a8eso602905d50.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 00:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775720349; cv=none;
        d=google.com; s=arc-20240605;
        b=WL48IjrdJAhTPizPIVJ64dLL54Y4UATxsZAyd8NmndJMd68O5nI8jfyouuiZm5UFLX
         Nz4Osno9ffxT657YAjeaE5D3xVkhjJmA47eGcCfWJaFt75sIseYDIt9gDaC8RNar1vhZ
         l7rgEFLmh6Bpm7DdXa80BLtcN5sWa1sk7NuLdPGKaZrg8tZ4hEiUUOfZgJTWy8WtRCrC
         thtq3PF0y+66gYiknNIunM/vrMB4A60vOha3yoUsliV+NI8hHig9QMdyc/0/U5aalmag
         ZlYK2nIhEfnndwqAQfGDfwKK9jmlATvsxTFcl/MxctChdWS7f88amOcqYZZWZpeJrplP
         NenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3cBtzKA6zOvJq0dVyyoDONOpQrZn2nA943/DyCLWNqM=;
        fh=IXJR+5piZYb1G5VCKUPhPgys086TDNDMa1v+N2SMV9I=;
        b=jiuaPqKO9aYYqjrq6qfb/h1WzdK2mgKhPS1lS+G+rH35JjNhyjV4ocWtq9rm/Nt5Nu
         Favbl9+/3aHZhnjqv4lsmMr2d2lipulcmmYbvtVK20QiwX0oahvfHeWZKvuzI4Fdo2aP
         wnSzNFdioHADhr3Ll80YuzZcGmhU4562ob9EFCbqkf3PVSmI3MyhT4cR/po442GF7o1H
         6oQVifk+Ct2VeTDo7Nvh0YxkCYaWV/BEHqyDvpVSmKiW1vEFEcdCw3KV6/A5ZUGf/KQ3
         Sv0HoiFSUZfOEohAa5nBg0gXtwULwwGKLhvsX0KTfskLNhhV+xXg4KV+c0HLpymlJkH4
         g+cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775720349; x=1776325149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cBtzKA6zOvJq0dVyyoDONOpQrZn2nA943/DyCLWNqM=;
        b=hgTf+7pqRgdRhN0Pc2ziGSGsg2jkow+NZTh9id1Z502cX5UvwQAVFbWETKNYjFA4W8
         80zI0+Htk5bP4rTtEdx0vqHb/zkcnA/dBSJpvcGNq4PIUnyOH5MLk4qtvPvUeqG0o0no
         ViIyWRRNOtj+wpuhJzTCid5R1douH2Wq5AZyoPtWnJh+eoIrBavFqpGE9y2A2ppeW+2j
         sWql2jCkk9wrzFqlCLczvYnmN6rWt2JwVov5vh44+3oqwLCo7zU81X7BS82Qoe1MRTpn
         dR+Kx5uY09x/OGvCSYmmakOpRiEU0I3haqF6IJNhXi9gLdo68TE6U76wLUK5qGVEdeMY
         GGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720349; x=1776325149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3cBtzKA6zOvJq0dVyyoDONOpQrZn2nA943/DyCLWNqM=;
        b=gw5Szfju9v71JJz3ycA/U+iss7BI1DfiPT8yL6tRakU/Fjbx5QzcU7wZpSUo1rrIzU
         qokPAqP3BQTWYgJz43swd2g/ghxoiyKaeyMq+NQW8QcZ25ef++5fYZ5a5Y6+d3TDVWKs
         xYU5QYoHdFyttnKU/+Q+Q0cPQyQBINRQ8HZROfq1TT2VViZqsMUQgHjoni4+IwBkOpYL
         3bFV4tbLzkYFosT5yOxSECrUz9KLE9qNHyIfeXUit1IIKcFPpUipatcWyuz7HqL0cBmH
         J35UHALkNOhSlR42bzHN2iYw65yixBI6em9VKr2bArGsqznAQhwAn6z0WIug8UelPcwY
         hHzw==
X-Forwarded-Encrypted: i=1; AJvYcCUIGrHJpv2gKqS6mq3Lzbv4KTYJ/hfc4eyZZN69Zt42NDudbyIqwq9kdfqcdA2gDrNsuTIfvD1vtiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7izzIS7NloAv3y0YnDaGZFtEGZjgbMQP8QDUrHUvIxATWZIM7
	52JSQ5XE7T7n/Exu57hqQA0eJZrehWuvUbI5eEU3k1CBtbMCNA0Xf/1dUnTz9Lnu6vYnMfUkT+X
	/wP0O9JB7GJM14PAafrxjRqaOevLebx7olE6N8Enc
X-Gm-Gg: AeBDiesenbovorCgjEM1A+Itp8e+tRl/tY6LXU88CkRAB/kdjZ39w9w/hxJemyQHqqe
	JFasws6HwlmpKqoYnZAE+vH+Ht83OCgL4E/DOlnd+6n0A6zilBOlNDJJeU7P/fRvE95ax20QCyq
	ecVkjeDpNpqHqaQ7zUuT/Sl2Xz/DPs3Uil0Kjhv5NuToekJxYW9E8E5ypndcgEA6rSjYrGaQOUy
	ypDHMbosovGK8oXi8k91gufzUJdyAhh8ByFOoP0FOOK7Bnmt5R+s3myV9aAKQzsgOgVaD43LzcP
	FCK7
X-Received: by 2002:a53:cb4d:0:b0:650:4854:10ec with SMTP id
 956f58d0204a3-6518724c408mr1415526d50.35.1775720349504; Thu, 09 Apr 2026
 00:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-4-jp@jphein.com>
 <CANiDSCs2Mt1XziD9w6Dv1uid82UdkeQ2EuyU0+W1RxtqaHTyPw@mail.gmail.com>
In-Reply-To: <CANiDSCs2Mt1XziD9w6Dv1uid82UdkeQ2EuyU0+W1RxtqaHTyPw@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 00:38:57 -0700
X-Gm-Features: AQROBzDdDRMw_0wKog-GLSZlGIy1Z2m8p2K4km-SpSb6lQdMirbNnmXbHdqt6FU
Message-ID: <CAD5VvzCRd=3UPFTgxsq7CzcfWBbDionHL1=UeW-31rFPx5fU9w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-36083-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:email,jphein.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email,mail.gmail.com:mid,launchpad.net:url]
X-Rspamd-Queue-Id: 91BB13C7206
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

On Thu, 9 Apr 2026 at 08:49, Ricardo Ribalda <ribalda@chromium.org> wrote:
> When we add a quirk to the list we include the output of `lsusb -v -d
> 1532:` to the commit message. Please add it to your next version.

Added the Device Descriptor section from lsusb -v to the v6 commit
message for patch 2/2.

Thanks,
JP

On Wed, Apr 8, 2026 at 11:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi JP
>
> When we add a quirk to the list we include the output of `lsusb -v -d
> 1532:` to the commit message. Please add it to your next version.
>
> Thanks!
>
> On Tue, 31 Mar 2026 at 02:38, JP Hein <jp@jphein.com> wrote:
> >
> > The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
> > two failure modes that cascade into full xHCI host controller death,
> > disconnecting every USB device on the bus:
> >
> >   1. LPM/autosuspend resume: the device fails to reinitialize its UVC
> >      endpoints on resume, producing EPIPE on SET_CUR. The stalled
> >      endpoint triggers an xHCI stop-endpoint timeout.
> >
> >   2. Rapid control transfers: sustained rapid SET_CUR operations
> >      (hundreds over several seconds) overwhelm the firmware.
> >
> > Add the device to the UVC driver table with:
> >
> >   - UVC_QUIRK_CTRL_THROTTLE: rate-limit SET_CUR (50ms interval) and
> >     skip error-code queries after EPIPE to prevent crash trigger #2.
> >
> >   - UVC_QUIRK_DISABLE_AUTOSUSPEND: prevent USB autosuspend transitions
> >     that trigger crash #1. Same approach as Insta360 Link.
> >
> >   - UVC_QUIRK_NO_RESET_RESUME: avoid the fragile reset-during-resume
> >     path. Same approach as Logitech Rally Bar.
> >
> > Cc: stable@vger.kernel.org
> > Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
> > Signed-off-by: JP Hein <jp@jphein.com>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc=
/uvc_driver.c
> > index b0ca81d92..e8b4de942 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -2920,6 +2920,23 @@ static const struct usb_device_id uvc_ids[] =3D =
{
> >           .bInterfaceSubClass   =3D 1,
> >           .bInterfaceProtocol   =3D 0,
> >           .driver_info          =3D (kernel_ulong_t)&uvc_quirk_probe_mi=
nmax },
> > +
> > +       /*
> > +        * Razer Kiyo Pro -- firmware crashes under rapid control trans=
fers
> > +        * and on LPM/autosuspend resume, cascading into xHCI controlle=
r
> > +        * death that disconnects all USB devices on the bus.
> > +        */
> > +       { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> > +                               | USB_DEVICE_ID_MATCH_INT_INFO,
> > +         .idVendor             =3D 0x1532,
> > +         .idProduct            =3D 0x0e05,
> > +         .bInterfaceClass      =3D USB_CLASS_VIDEO,
> > +         .bInterfaceSubClass   =3D 1,
> > +         .bInterfaceProtocol   =3D 0,
> > +         .driver_info          =3D UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROT=
TLE
> > +                                       | UVC_QUIRK_DISABLE_AUTOSUSPEND
> > +                                       | UVC_QUIRK_NO_RESET_RESUME) },
> > +
> >         /* Kurokesu C1 PRO */
> >         { .match_flags          =3D USB_DEVICE_ID_MATCH_DEVICE
> >                                 | USB_DEVICE_ID_MATCH_INT_INFO,
> > --
> > 2.43.0
> >
>
>
> --
> Ricardo Ribalda



--=20
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

