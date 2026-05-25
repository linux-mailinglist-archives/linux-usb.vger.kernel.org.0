Return-Path: <linux-usb+bounces-38020-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULXSDnJeFGqgMwcAu9opvQ
	(envelope-from <linux-usb+bounces-38020-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:36:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF575CBCAA
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A4E301700C
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 14:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9DD14ABE;
	Mon, 25 May 2026 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9+NvMPc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B2C38888F
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779719776; cv=pass; b=C2V2RSBAdyNVt50XZgDd6SIKsf4o/1fXF2rL6IcZKnTQSI4PX+9X1XZoW7m9d9TVe+gQBSH2NLmuIhjmKckI2PQid34+rJQUIzi5zOrSd3HhjH7qqhANDrF0mrGoFNAG3r5r/HuJmVW3T9E0ndn3gGFTCXk4e5EQr3pAO7hrXLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779719776; c=relaxed/simple;
	bh=xbfgY9K4K4xm6UEcPk5FCl7v9OkT0RSF6VjPe2Hp8iE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkL37t1vHVbnr40aU4O4csrOQZ6c4vA6s+6ard77dvg8gfJjT6rEtEyfy3yZq0aZ1oaq0GdUU1yXEWWg6HelRUZpGOpFe7GFXcYpg+EfMsgfQBjiontqnMBmoZz9GXaUHRSy1gQ23BK/9NjGQXxYUYbR652HPLNsnrYau7xcUVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9+NvMPc; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e5fd39cf11so3102981a34.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 07:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779719773; cv=none;
        d=google.com; s=arc-20240605;
        b=GRoARPAH9D/MYQPDNI66rt07hHZ8xCTpAWQyo7eu0O4woJRR4QLgKFzfqulCAp9vJe
         huaEeMDgqmQUS4zX2hpZwFd1AsdWahDbBvQ2e/ChQ4deIMK3ZMlvFYgmlZMHt4sVocAV
         k09NOcs5p8QqFyFYjBHgy9B4IQRCjBrwRMl4AttUb3id241qF7rDYufoA5i4hWZz158+
         H+1x8yR9L8eiwhx/3Ir15/K9bm0N8ivXoJRAiLNNZEasKEsO4jNU53S9JbqJiCyExNdS
         xTyf6ETaI8fJM5MB9xs/MxlcwadRNgX6p+nduH1a5NUbEptdqONk9mkHEXxI6IFFEzX3
         o7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7vh5+nGCcojR+mAKtMSQTCHdrcvNuEZMJUU28+NBtA=;
        fh=ZWrVR8Is0iQ1zhOSlfgOBR4Cd4Sra6V5e3fz69cbUBk=;
        b=SpRDIJS6JjNCT+KfLcImKAWMtMMyn7X2n4xKkTK3xE6Atugs8fW2k2u8GZP1gRKbaO
         SHu0dBG8z8v2+vQZhXMaEeVMis6tlG67wVDA1WOV+jEsw2IOs/ZPAzMNyWNe64eMTOKC
         0Kedvl7FrxzaYP2SRR/10Vt0cRtipB5q4qSI9YsqPBhPWoIJm2lyh30eajkCm27UWFLd
         Urxfc7NM5BbVW6mLmPvjKHgsMVDeW8tbfnhZ5zsaWsL/HWkAhPLym9G5hH0j9csWtvj6
         YNJvTOwVydQiFzJq45JqOzgPk4uAENdT6f3AkBEcdiR5E8eOTK7P+QhActwQxGm3Yxkj
         wCEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779719773; x=1780324573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7vh5+nGCcojR+mAKtMSQTCHdrcvNuEZMJUU28+NBtA=;
        b=f9+NvMPcMpgwWftQAaHz2k0QQr6H+H8sDiPcnPu4eEfqPcg7WzflVAqYG5QjZDVpXt
         +Rf8gDGdugJ/fgogYXwiqFGjskyJh002GBAkNaxbpUmXUhYsRmEbAvp/LuTwujdwzRm2
         5CPLmTz+KRnW1bL0ZXRztx70m5xpkW43/XgqQWX0MugP3BqXOz8Wi1AWJeB3z+iGknZb
         A7hWR/Q+1lOYoOsl8nft+OafZehASsr9C/rYPwlHFpzep+h8r84+60mpjSCxeXo/1pp/
         Gov5V161dfu8SW8T9HaiyQ62ftNydVrlSpMpulINW3Dhf0WJhwSadqDBe1F1ScCoDWP7
         TKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779719773; x=1780324573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A7vh5+nGCcojR+mAKtMSQTCHdrcvNuEZMJUU28+NBtA=;
        b=DrCLjbl2pgawViBGL6oa1RTLkY9WR9MHizhZqZ35KW6ie+r+TNt7zuqUdF64FUMct3
         5g0SJ0tLEHsCvxoj2Svo7ocvUwOKNNhgfEmMGDmX19/VktBF5I/m859JHKUNUlxtQ68k
         NS+Kfr0YhtP2zTgLa9hSm5H/2TZcERc67dE+mGCH3sr7O1JvY3bDwPa9Z4gPJhTB8PX5
         ULugU2Z9JYqWAztvoBgL2mXkuLCuLUXj2f1lKMqLhv3w06O+rfBygFCzesTPmCbg19lf
         vIzWfBwUKow22gKy2hp+0m2QKewFgosg2Y/Y9YdUmNOVgVc3B1g0TFr857Z8JX2nYPti
         83Iw==
X-Gm-Message-State: AOJu0YxQmW7rke5Mm5RS3/lU0BQalMMaASYro0zzfvZwDwiqsG++wGzX
	fpRFYG2S0B7S6iybOx09a3sGNg24B5mHddmTyqNMyThzqkmUf7/Mz8Q+0Sgm1mOcKbHmCNU7CZY
	ZbA6frDWaPXX5Q+LSNeftklxxwUic87i5x9JPf9Ty2g==
X-Gm-Gg: Acq92OHiYN+pD3c8f4TR9EQJbqlD01+HMDv+lj3e8bXLF8s6VjyR8kSVLESUtK9HLeV
	7EzbFdcPRBusW9/iNC2hQeAiw5vCio91uK7bYDjJ3Jeuqst4SDeXCYTwa0Y7XBHhenoKdC64Er2
	QlHR9WPgd8++Klec74wOIMtw2rUcfZ7m4isv3+Nf3LSOH1owXYDGHfSuUXagLbEBpenvoG9pErY
	KH3cHf8tGCq8rPdAPOrnhxOHtIEQ0cxOF1Iedc7wujxlyCtBUEFkhuffb/dwamAQG+ZtVVUXqZD
	ZcX9vwYIYnpV/jQoR3FiFmgtz5/DmnKmSVtt6h9lTMywFAayDhj5hOUnsuZ14TBKFgo+VYFxJA=
	=
X-Received: by 2002:a05:6830:452a:b0:7dd:f615:a84e with SMTP id
 46e09a7af769-7e5fee240e4mr8511824a34.18.1779719773457; Mon, 25 May 2026
 07:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADgB2mFBdTbad5+W=bDOMO+fe1S4jg+aCNjkgd3B3Guq0WFQdw@mail.gmail.com>
 <2026052528-resupply-fanatic-496a@gregkh> <CADgB2mH8VayssgQmuyfMJn8Vv-o8_udfL6msVGrHrL1hO9nd4g@mail.gmail.com>
In-Reply-To: <CADgB2mH8VayssgQmuyfMJn8Vv-o8_udfL6msVGrHrL1hO9nd4g@mail.gmail.com>
From: Adrian Korwel <adriank20047@gmail.com>
Date: Mon, 25 May 2026 09:36:02 -0500
X-Gm-Features: AVHnY4LLwxWin-HC0cTaFeL3AKTkbjUjKgeVPLsX6rKgZKWTqFJe9VTE3o1_Yew
Message-ID: <CADgB2mEFy15-yMa5n+oLoha1D5Qvy+WwZwe8BDgf+uzADN7rng@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: fix use-after-free in gaudio_open_snd_dev()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38020-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BFF575CBCAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[PATCH v3 3/4] usb: gadget: f_uac1_legacy: cancel work in f_audio_disable()

f_audio_disable() was an empty stub that simply returned without
cancelling the pending playback work item. The work function
f_audio_playback_work() accesses audio->lock, audio->play_queue and
audio->card which reside in the audio struct that is freed by
f_audio_free() after disable returns.

Fix by adding cancel_work_sync() to ensure the playback work item is
not in flight when the audio struct is freed.

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1
implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c
b/drivers/usb/gadget/function/f_uac1_legacy.c
index 6ad4b16769b7..798fbb8550bc 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -697,7 +697,9 @@ static int f_audio_get_alt(struct usb_function *f,
unsigned intf)

 static void f_audio_disable(struct usb_function *f)
 {
-       return;
+       struct f_audio *audio =3D func_to_audio(f);
+
+       cancel_work_sync(&audio->playback_work);
 }

 /*------------------------------------------------------------------------=
-*/
--=20
2.43.0

On Mon, May 25, 2026 at 9:30=E2=80=AFAM Adrian Korwel <adriank20047@gmail.c=
om> wrote:
>
> On Mon, May 26, 2026 at 12:57AM, Greg KH wrote:
> > Why is this not broken up into smaller patches...
> > The "changes" go below the --- line, right?
>
> Apologies for the formatting issues. Please find v3 below as a series
> of 4 patches. Fixes split into separate patches and changelog moved
> below the --- line.
>
> Adrian Korwel (4):
>   usb: gadget: f_uac1_legacy: fix file handle leaks in gaudio_open_snd_de=
v()
>   usb: gadget: f_uac1_legacy: fix use-after-free caused by bound guard
>   usb: gadget: f_uac1_legacy: cancel work in f_audio_disable()
>   usb: typec: thunderbolt: cancel work before altmode is removed
>
>  drivers/usb/gadget/function/f_uac1_legacy.c | 15 +++++++--------
>  drivers/usb/gadget/function/u_uac1_legacy.c | 10 +++++++++-
>  drivers/usb/gadget/function/u_uac1_legacy.h |  1 -
>  drivers/usb/typec/altmodes/thunderbolt.c    |  2 ++
>  4 files changed, 18 insertions(+), 10 deletions(-)
>
> On Mon, May 25, 2026 at 12:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> >
> > On Sun, May 24, 2026 at 11:33:21PM -0500, Adrian Korwel wrote:
> > > Three bugs exist in this driver related to ALSA device file lifetime:
> > >
> > > 1. gaudio_open_snd_dev() opens the ALSA control file first, then the
> > >    PCM playback file. If filp_open() for playback fails, the function
> > >    returns without closing the already-opened control file handle.
> > >
> > > 2. playback_default_hw_params() return value was ignored. If it fails=
,
> > >    both the control and playback file handles are leaked, causing
> > >    gaudio_cleanup() to call filp_close() on already-freed file object=
s.
> > >
> > > 3. f_audio_bind() guards gaudio_setup() with an 'audio_opts->bound'
> > >    flag to prevent re-initialization, but the fail: error path
> > >    unconditionally calls gaudio_cleanup(). On repeated bind attempts
> > >    after failure, this closes file handles that were opened in a
> > >    previous bind invocation and already freed by RCU, causing a
> > >    use-after-free detected by KASAN:
> > >
> > >    BUG: KASAN: slab-use-after-free in filp_flush+0x23/0x1b0
> > >    Read of size 8 at addr ffff88810d5523a8 by task bash/306
> > >    ...
> > >    gaudio_cleanup+0x59/0x100
> > >    f_audio_bind+0x4b0/0x590
> > >
> > > Fix all three issues:
> > > - Close already-opened file handles on each error path in
> > >   gaudio_open_snd_dev().
> > > - Check and propagate the return value of playback_default_hw_params(=
).
> > > - Remove the 'bound' guard and call gaudio_setup() unconditionally in
> > >   f_audio_bind(), making setup and cleanup a matched pair within each
> > >   bind invocation. Remove the now-unused 'bound' field from the opts
> > >   struct.
> >
> > Why is this not broken up into smaller patches to corrispond with each
> > issue/fix?  Please do so.
> >
> >
> > >
> > > Additionally, f_audio_disable() was an empty stub. Add
> > > cancel_work_sync() to ensure the playback work item is not in flight
> > > when the function is unbound and the audio struct is freed.
> > >
> > > Changes since v1:
> > > - Added removal of the 'bound' guard in f_audio_bind() which was the
> > >   root cause of the repeated-bind UAF
> > > - Added cancel_work_sync() to f_audio_disable()
> > > - Removed now-unused 'bound' field from struct f_uac1_legacy_opts
> >
> > The "changes" go below the --- line, right?
> >
> > thanks,
> >
> > greg k-h

