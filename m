Return-Path: <linux-usb+bounces-38018-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIFZKgdeFGqgMwcAu9opvQ
	(envelope-from <linux-usb+bounces-38018-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:34:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB75CBC8C
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3E8A3018751
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 14:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BAF3ECBDD;
	Mon, 25 May 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwTmSUbo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524A814ABE
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779719607; cv=pass; b=my1ZgmwzKa4Xc38wfek9POkWwaexPX+JoI5hMs8MQrh2Mxgb702qtM7231za2cLikzb5pOo0pUCT3Cvmw/4rVOaqtG/S/mkBi14DaIk9DByAYKl20rLPuJr/tTgaqTj6dHEU6OZgoo9ejjx4rQvtOBgNt01rTOt0rzxYGrY5Uw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779719607; c=relaxed/simple;
	bh=OtFbGEQVfeG5TinyQvPxKxO6oryewACl1YAUIkCObWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9r7LEtAeQ72796N/SJbAgMc6dZ9z9HRchxc4nXnG5576UgzqD4/hjj4/aUMPY/EqJ44VwWkHiU2cUbANvzlbF0LKhTJQRPFnBtI1XrcpFboHP5/eeyzjHa89ykZUiv2r4dPTzf2RIStWQ/hDocNt5cBNQtG+4QFm5y9qwxqAlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwTmSUbo; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e4de538f83so5451201a34.1
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 07:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779719603; cv=none;
        d=google.com; s=arc-20240605;
        b=XyaunnP9z4aZy4TtMsyinUT3nPizhr3XBhzSnZ2pLGzLrX0/AdzTtaMUn/D1v/kC08
         IkTwqdert+K/2bssQumebNSwUmPdu/l4wzFxNUfhQZWaGCkohR8R7Fk/Ze6Wpz4JBahZ
         1ArqYV+qVKbwPU4e21RHI/6AkQD6MeX3JxAQyAqXR7Li0mdC8k+K9Ic27z66+ayEzWMw
         gIk3pJjnu276ntPdyCOsdi6T5lj/H//Mrw2px3abOixs71KSOOoCLjmhgKj+IUSq9RwT
         DI1CH7oiVZ62Oq4LZOSUMbJtnT0PFsNb0s2rTy8aZpFfXcUc0zCBIn+x0/5PjHOGNhAS
         rSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oIL2gGBaC/5Z3SWYEgd3sP1hDG7geJ91QNqMlfa1z4=;
        fh=ZWrVR8Is0iQ1zhOSlfgOBR4Cd4Sra6V5e3fz69cbUBk=;
        b=Q6bVYq+NrMDoT1HjyevyMpg4NhCx8iDYnA7KiJb815q5ynikeat4Dw1ErXvjSMVcam
         uAg/k2ifVW2FrAtrpb+vTATWRj4HrTd03FQ5iI0tbjZtLRW+ZFHc81Zt3TcUQ9Xfn+6t
         YaIwO2E3IetEHY+feA21k22dvFfvZOvs2yGwGQsW3IZvelIVB+NiQp+sbcsp68dFMKtm
         rGXBpM8TDfyc10M6TwKxhPm7AC1+HfYGvAgi0pVVmF1GiOgtumENZgcMAII5pwr5Ubnb
         NRvDqESjbt+KXvBLfUmgwhxTyQ7a2SBrNw2rCsiFDCxkMIQiKjxw+B2Mf9h8fnSjl5I3
         4hLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779719603; x=1780324403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oIL2gGBaC/5Z3SWYEgd3sP1hDG7geJ91QNqMlfa1z4=;
        b=fwTmSUbojA/lsmvFC0S72xD0WF4+zGxLgiCIaBTgyK3tz/W72aDcHyYjtBkZxHF4GY
         R8AjUbm/CS8cMUDnvT7Sdr3V3eWF0xh6OPk3sGGz7l03tzsarINhHoqn8oohyXGFgGK2
         th/utY0EhugBl16Jj4yMu/uxI4xqkPvT21hMSVPVNU2lfMsda9yaM8iFNRNjO9G4ep+q
         vyCl3tHDN6a3CTrIgYmVhxUFI48uwcWyd7sA34Du5DDjqbhehEEJ9S9vqewlp5/Fr6Ab
         lKnGuSO+t7iSCtBqkiEf3tv5Hv/0DXHY7QONjcA8Re1AGx4ytiByMuyvRmUy/ujr4xMh
         yMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779719603; x=1780324403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oIL2gGBaC/5Z3SWYEgd3sP1hDG7geJ91QNqMlfa1z4=;
        b=EcDv/HeS0udfS/88EESstDdrxyhEA9JprTtB8O3m1QeQHDrLjibYqLLziU/QiEx9o7
         OUz8csl9J5WNEc39x05IvfYOD61tYS+HW1r9Ua/mZZkwAzmYXtB34qupRUDNZgoOER7r
         Oglz1eaF0jqvYHo6Lc62H0RhW07tee5hYVpm0CB3deOuPJ/+0oczF9PmoFrPynELOyOe
         2gmIzTYDU/ddw9shm286heF2VetYjcAgn0f8M+vmRaDGRfPhd9hYgJ4f3h1IRnghHT80
         SVIIJ68y6ox5RPzae2Crc5Al8RQk2g/X3RgNXNMi6Rc4smzPsj4rYOwySrS3vRvWrjFV
         wVfA==
X-Gm-Message-State: AOJu0Yy5lJKZqNDNhu9VLrmoo8nfbdu3O5iChDn5FpWjy4DpzQXkZWaa
	hmxgAQgjgk+IcRVR0Qa0cVWwmb7Ga8G8R+f5cOVkCnc8YBeIrBie6mu0U+2qCDD40njInpfNZBW
	5sEv172Jut+SuVBSQTRM4dgd+35LBjnk=
X-Gm-Gg: Acq92OE4EmdLxztSepr0Ab+OYr9XQNXcqD6kzGCMNlRYXev49+H5K+IGSZnZ5e2O4Xx
	dJ/ouylBB9s/pu4hhidRHUaWSgQicbiW1p+TZLShtqmgr58LTjyHGERFUN/G7s2R8hSFagQBt1i
	W8CIoWM2+hRMbzfOq8LDsW+jP42C+BwZfKVzp2zjbqPzM1LsGqCmZAHOG88JpKKZhN0u3A7Sh4j
	mvkYUXI8NNek7i4lIrjT8j3QMYGerzs0/fME7LXZr/fXlpCO1hQzXtid/WxXb0akAQXc5moPOGL
	rrWC7LMLTpnk0Da2JQjeJnlD6XV0Upweqwg7avkT0B4gLnR9gmCmhbGBXSDzj9fE71gVJfaqlE2
	GXDQ47J50OJkB7JUGVKY=
X-Received: by 2002:a05:6830:7306:b0:7db:a8b7:c565 with SMTP id
 46e09a7af769-7e5ff02c891mr9121778a34.20.1779719603204; Mon, 25 May 2026
 07:33:23 -0700 (PDT)
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
Date: Mon, 25 May 2026 09:33:12 -0500
X-Gm-Features: AVHnY4KugvHsyb0T1WmtqV1x3vrJDgydgQxPLbCaKN77rloSZ436-1gk5jGR3nc
Message-ID: <CADgB2mHJG5dJwzjBML08C4yDUqLHJY=Vmv6yffiiczc98hqnNA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: fix use-after-free in gaudio_open_snd_dev()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38018-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 43EB75CBC8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[PATCH v3 1/4] usb: gadget: f_uac1_legacy: fix file handle leaks in
gaudio_open_snd_dev()

gaudio_open_snd_dev() opens the ALSA control device file first, then
opens the PCM playback device. On two error paths the control file
handle is leaked:

When filp_open() for the playback device fails, the function returns
immediately without closing the already-opened control file handle.

When playback_default_hw_params() fails, its return value was ignored
and both the playback and control file handles were leaked.

Both leaks result in gaudio_cleanup() calling filp_close() on already
freed file objects, causing a use-after-free.

Fix by closing previously opened file handles before returning on
each error path, and by checking the return value of
playback_default_hw_params().

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1
implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/u_uac1_legacy.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_uac1_legacy.c
b/drivers/usb/gadget/function/u_uac1_legacy.c
index 01016102fa17..5bcd3afd6366 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.c
+++ b/drivers/usb/gadget/function/u_uac1_legacy.c
@@ -226,12 +226,20 @@ static int gaudio_open_snd_dev(struct gaudio *card)

                ERROR(card, "No such PCM playback device: %s\n", fn_play);
                snd->filp =3D NULL;
+               filp_close(card->control.filp, NULL);
+               card->control.filp =3D NULL;
                return ret;
        }
        pcm_file =3D snd->filp->private_data;
        snd->substream =3D pcm_file->substream;
        snd->card =3D card;
-       playback_default_hw_params(snd);
+       if (playback_default_hw_params(snd) < 0) {
+               filp_close(snd->filp, NULL);
+               snd->filp =3D NULL;
+               filp_close(card->control.filp, NULL);
+               card->control.filp =3D NULL;
+               return -EINVAL;
+       }

        /* Open PCM capture device and setup substream */
        snd =3D &card->capture;
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

