Return-Path: <linux-usb+bounces-36087-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHRrG4la12lqMwgAu9opvQ
	(envelope-from <linux-usb+bounces-36087-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:51:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBD3C7465
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 09:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 321883008C0E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 07:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3181C37AA77;
	Thu,  9 Apr 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="aWqTxAh+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C14137CD4B
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721091; cv=pass; b=BNG4G8MUuO7O+aAsvRerzICmhPgpZuWwt3U8sUBr8/6lKnZt+xmVPmAEirfJlqfEfHW0P2Iw2wyXp3g3+VGIg1YRsT1KTBdMPklvLaZDHi4THNJZE/euppXE76gDIjdWq6aWctgDY3cIY7LG0DD/P4GshKpWJAmRZh12UiNVqHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721091; c=relaxed/simple;
	bh=C7KVOtSC9ooo76nN8CKOmFFkIDMARyug/PSVK9e1yf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVyEurUTNT2VtP+F79CYpsvcTaSHjLgYHm2eTGxBu0YJtZ8gO3sr+UpeYRnuHP1Da++5DGK8TTSOzCuvYV59OmZUEDm8E5dVfv5O5s/2b2MPglmJyvGzR/CT2PbYo9DZ+obpTJHCr9mHT0eotKCdzyKRMDPBLPbYARtwICZvqJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=aWqTxAh+; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ef161129bso454451d50.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 00:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775721088; cv=none;
        d=google.com; s=arc-20240605;
        b=eV8T+ORkxDhR9N2F8IoMSMpnyt0teiVmOBo2cPj9qQ0N4J9XjsMoV9LQ/fBROIXrkv
         tjXIiJieBMkZK6ZeAqZmC1nhGfuXVrkJjhb44NMHFE06/ZOHlYXpMPjK9s0ZkS948UOx
         GB1eg952ZpoNgERV8ilYh0XBgQ17pfpY4wLJZVuyJZbYpT/1s/7a7WEpULjDQz1HJyMw
         R9TdZ73z1MXCDnVHsjr84H24yohCDwB33T+Ym1y5YPVu+gF4/Br9hO7jZYB3QnZYPmmu
         GBb8tMV+BgUrw7KRcaDLuVtHyKnhrBYowmll8tJwEdp/dGEbtm07MGRFnyo9TTqnPN2b
         pXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L6aJUNlSsXw2SpNpH15YLZikxobDr9nZf4oRGaly4Ug=;
        fh=mDAGdTO1rqQPW3UqflYk6K/Vuq+fJ/O0pZ4RfjQF48w=;
        b=YW4P22pWIhdNMynzTiXGDcvEUtCvIPvhf7JWJK2pX29PV7sXZkoG1wm37wMxjNMkNi
         +LvqtSy/6iR0tnFRgKQcRFZ7e4qlddjj1KH/nvIcQVOgQxDSZldKhrpRpiyW07HBagfv
         fN8iLU8UPlAmjePANiStv5WEhCQHqtizdlnmTbQjHcqzNfFgAzxI1B4Q2jKlhZvR6zWI
         qlOaUFILWHV/xR2Ti+u2zxNkGzZf0fSUA0NicTYe2XmLN07P7e/YR7zFJQxK6UV9u/kc
         VRj9/eJyyIaCqxEV3q75hGWHTq/3Gl2PgjxustMwbLVUvTRNU9fuOPZzhGUzReWYz6FB
         d9oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775721088; x=1776325888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6aJUNlSsXw2SpNpH15YLZikxobDr9nZf4oRGaly4Ug=;
        b=aWqTxAh+9o+G/ucZf6uWucXiOijyS1pBA3J74G0B5O2GFxOE9hYNH1Ns0D3j/FjgUU
         wwbHjUa+mJDzEHqj8X+65+/jgrzLWxEilue6m1u6hmui4z+Bzs6TuaK80hnE0huy8ub4
         ZaUqHvwxpbMC6k3sZOn6GtycCI8T4xhGC7bDdRPn633erHcTv2+I8gXre8Zeyf+0uUhV
         X2uGdViOF9sMxRCFL6+aokCRBgOe2N5N8YOOG1gYJtN/Sc3pZTsusVq34y4unKof7tR8
         OSiAjAPKlMrWfptmH4dor0FTiA0wlR0JPoLUN77sRCKsSmD+rbi+wMHXYngestT9xw6f
         EbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721088; x=1776325888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6aJUNlSsXw2SpNpH15YLZikxobDr9nZf4oRGaly4Ug=;
        b=NoCc/Sht8TGJQmzdHJ9Xo9BpI9EcAkoX4d5CRZrYiJubGQJdufJx4BCFDrsQMrFbZ1
         /3KUXI4OzAn8LO4MoTq0lnXG/ADUGvUGo1zThzHdBEBYnUiLRb37wbeCtt4dexqTiJj4
         8H2kQLxGfgI0h1XB/iYYJ6MV/I1Mq0+C+Ve7+M8f5UCf3Zl/4nTrTnGRJS0xJfvATGF3
         GDx66nJZEhz4rLCCM3lxxsh5YEpLl3Gyjm2s8yzIJKb/WFZC2A+PvpSMwJdwAIz0jjuw
         aRneH3QlHBQ3Ld+01zdO2gzfkEwoRBdEfK/o8kXN91AuFOCmys8dEuMcsdbUVxEBvmm2
         NSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYBY4KzbWJgCg9jP8Epb6XwMOZ9zgYOzH592zG1+W4Clo4ZBJs7kbyyeKWBJTx6wFkL9v3Mbfch08=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZoG+EubM5ExuzPqi219WqvRA9SUomc1g9dBxq4q04muN961FJ
	ZAeJpuTvlCdZ8grvIkY46RsGDX4jxRmACO8erlu96eGk6NkdK9upRdReayhUHARwPIVny9U7zUi
	DMuXJC0m7enHfUW8ydy61ZRToRoptFavm1oDHl3gI
X-Gm-Gg: AeBDieuGnqN2fxVzfwOKdm9XXr4z4G6uhAzTmVvmCFDMRCmzM90vVB5M2n++m9uIl4g
	cSmiDsuEEU6tW3yW//upmyeicn5hBEwnkEniBOx+RFiQOQ48TFOqI6oWyIdDVW0pQRZF+D+e70B
	M+y7dgyZSWQCKzLyonnaJlP/dMjjXG325mvJ6hEZEDQtdAc4nnqI8/9nzXa3nr2XnH84nRaHzgu
	yqLflJhSc99U1xX28jd4K4MrwMCHnYl6Wzh/4xBglf33gZuCQvoWRQmP8894Lwovi46fEaoUDA8
	TyKk
X-Received: by 2002:a05:690e:191a:b0:650:70da:bc25 with SMTP id
 956f58d0204a3-65070dabc8bmr12098902d50.58.1775721088090; Thu, 09 Apr 2026
 00:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com> <CAD5VvzAu8+Qz7hEEBzuKvO11X=YD-wrtX3_Tk77g2Cq5rZZD0Q@mail.gmail.com>
In-Reply-To: <CAD5VvzAu8+Qz7hEEBzuKvO11X=YD-wrtX3_Tk77g2Cq5rZZD0Q@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 00:51:17 -0700
X-Gm-Features: AQROBzCxJCsnggkClFbbxyjOvF_Wfs6s-qSUVP_xD4dgFk-wRaWBzxMMF5KblRI
Message-ID: <CAD5VvzD6WDEaQF_v+bg63FRV+LB=youG=TjW87D+DBo6ntrBkA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Michal Pecio <michal.pecio@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,gmail.com,ideasonboard.com,kernel.org,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36087-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:email,jphein.com:dkim,jphein.com:email]
X-Rspamd-Queue-Id: 16BBD3C7465
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

On Thu, 9 Apr 2026 at 08:45, Ricardo Ribalda <ribalda@chromium.org> wrote:
> A usb device shall not be able crash the whole USB host. I believe
> that you already captured some logs and the USB guys are looking into
> it. I'd really like to hear what they have to say after reviewing
> them.

Agreed -- a single device shouldn't be able to take down the host.
Alan Stern raised the same point and asked whether xhci-hcd should
handle this. Michal Pecio noted that the stop-endpoint command timeout
is a controller-side failure and asked for dynamic debug traces on
newer kernels and non-Intel hardware.

I provided the 6.17 traces. The result: the stress test (control
transfers only) now passes 50/50 thanks to xHCI error handling
improvements between 6.8 and 6.17. But starting a video stream still
triggers hc_died() -- the firmware fails to disable LPM during stream
setup, the endpoint stalls, and the stop-endpoint command times out.

So there's an open question on the xHCI side about whether the
controller could recover from stop-endpoint timeouts instead of
killing the HC. The UVC quirks are defense-in-depth -- they prevent
the firmware from reaching the failure state that triggers the timeout
in the first place.

I'm also planning to test on additional Intel machines (and non-Intel
if I can source one) to determine whether the stop-endpoint timeout
is controller-specific, per Michal's request.

> Why don't do you do the rate-limit in __uvc_query_ctrl()?

Good point -- moved it there in v6. This covers all callers including
uvc_set_video_ctrl() which bypasses uvc_query_ctrl() for probe/commit.

> Are you sure that you only have to limit UVC_SET_CUR?

I haven't been able to isolate the crash to a specific query direction
-- our testing shows it's the sustained transfer rate that matters. v6
throttles all query types in __uvc_query_ctrl() to be safe.

v6 posted with these changes.

Thanks,
JP

>
> On Wed, Apr 8, 2026 at 11:45=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
>>
>> Hi JP
>>
>> On Tue, 31 Mar 2026 at 02:38, JP Hein <jp@jphein.com> wrote:
>> >
>> > Some USB webcams have firmware that crashes when it receives rapid
>> > consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
>> > (1532:0e05) is one such device -- after several hundred rapid control
>> > changes over a few seconds, the device stops responding entirely,
>> > triggering an xHCI stop-endpoint command timeout that causes the host
>> > controller to be declared dead, disconnecting every USB device on the
>> > bus.
>>
>> A usb device shall not be able crash the whole USB host. I believe
>> that you already captured some logs and the USB guys are looking into
>> it. I'd really like to hear what they have to say after reviewing
>> them.
>>
>> >
>> > The failure is amplified by the standard UVC error-code query: when a
>> > SET_CUR fails with EPIPE, the driver sends a second transfer (GET_CUR
>> > on UVC_VC_REQUEST_ERROR_CODE_CONTROL) to read the UVC error code. On a
>> > device that is already stalling, this second transfer pushes the
>> > firmware into a full lockup.
>> >
>> > Introduce UVC_QUIRK_CTRL_THROTTLE (0x00080000) to address both issues:
>> >
>> >   - Enforce a minimum 50ms interval between SET_CUR control transfers,
>> >     preventing the rapid-fire pattern that overwhelms the firmware.
>> >     50ms allows up to 20 control changes per second, which is sufficie=
nt
>> >     for interactive slider adjustments while keeping the device stable=
.
>> >
>> >   - Skip the UVC_VC_REQUEST_ERROR_CODE_CONTROL query after EPIPE error=
s
>> >     on devices with this quirk. EPIPE is returned directly without the
>> >     follow-up query that would amplify the failure.
>> >
>> > The UVC control path is serialized by ctrl_mutex, so last_ctrl_set_jif=
fies
>> > does not require additional locking.
>> >
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: JP Hein <jp@jphein.com>
>> > ---
>> >  drivers/media/usb/uvc/uvc_video.c | 32 ++++++++++++++++++++++++++++++=
+
>> >  drivers/media/usb/uvc/uvcvideo.h  |  3 +++
>> >  2 files changed, 35 insertions(+)
>> >
>> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc=
/uvc_video.c
>> > index 40c76c051..9f402f55e 100644
>> > --- a/drivers/media/usb/uvc/uvc_video.c
>> > +++ b/drivers/media/usb/uvc/uvc_video.c
>> > @@ -75,8 +75,30 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query=
, u8 unit,
>> >         u8 error;
>> >         u8 tmp;
>> >
>>
>> Why don't do you do the rate-limit in __uvc_query_ctrl()?
>>
>> Are you sure that you only have to limit UVC_SET_CUR?
>>
>> > +       /*
>> > +        * Rate-limit SET_CUR operations for devices with fragile firm=
ware.
>> > +        * The Razer Kiyo Pro locks up under sustained rapid SET_CUR
>> > +        * transfers (hundreds without delay), crashing the xHCI contr=
oller.
>> > +        */
>> > +       if (query =3D=3D UVC_SET_CUR &&
>> > +           (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)) {
>> > +               unsigned long min_interval =3D msecs_to_jiffies(50);
>> > +
>> > +               if (dev->last_ctrl_set_jiffies &&
>> > +                   time_before(jiffies,
>> > +                               dev->last_ctrl_set_jiffies + min_inter=
val)) {
>> > +                       unsigned long elapsed =3D dev->last_ctrl_set_j=
iffies +
>> > +                                               min_interval - jiffies=
;
>> > +                       msleep(jiffies_to_msecs(elapsed));
>> > +               }
>> > +       }
>> > +
>> >         ret =3D __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, =
size,
>> >                                 UVC_CTRL_CONTROL_TIMEOUT);
>> > +
>> > +       if (query =3D=3D UVC_SET_CUR &&
>> > +           (dev->quirks & UVC_QUIRK_CTRL_THROTTLE))
>> > +               dev->last_ctrl_set_jiffies =3D jiffies;
>> >         if (likely(ret =3D=3D size))
>> >                 return 0;
>> >
>> > @@ -108,6 +130,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 que=
ry, u8 unit,
>> >                 return ret < 0 ? ret : -EPIPE;
>> >         }
>> >
>> > +       /*
>> > +        * Skip the error code query for devices that crash under load=
.
>> > +        * The standard error-code query (GET_CUR on
>> > +        * UVC_VC_REQUEST_ERROR_CODE_CONTROL) sends a second USB trans=
fer to
>> > +        * a device that is already stalling, which can amplify the fa=
ilure
>> > +        * into a full firmware lockup and xHCI controller death.
>> > +        */
>> > +       if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)
>> > +               return -EPIPE;
>> > +
>> >         /* Reuse data[0] to request the error code. */
>> >         tmp =3D *(u8 *)data;
>> >
>> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/=
uvcvideo.h
>> > index 8480d65ec..cafc71457 100644
>> > --- a/drivers/media/usb/uvc/uvcvideo.h
>> > +++ b/drivers/media/usb/uvc/uvcvideo.h
>> > @@ -81,6 +81,7 @@
>> >  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
>> >  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
>> >  #define UVC_QUIRK_MSXU_META            0x00040000
>> > +#define UVC_QUIRK_CTRL_THROTTLE                0x00080000
>> >
>> >  /* Format flags */
>> >  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
>> > @@ -579,6 +580,8 @@ struct uvc_device {
>> >         struct usb_interface *intf;
>> >         unsigned long warnings;
>> >         u32 quirks;
>> > +       /* Control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
>> > +       unsigned long last_ctrl_set_jiffies;
>> >         int intfnum;
>> >         char name[32];
>> >
>> > --
>> > 2.43.0
>> >
>>
>>
>> --
>> Ricardo Ribalda

