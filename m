Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76EAE42B9B7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 09:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbhJMH5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 03:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhJMH5P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Oct 2021 03:57:15 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B35C061570
        for <linux-usb@vger.kernel.org>; Wed, 13 Oct 2021 00:55:12 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id n15-20020a4ad12f000000b002b6e3e5fd5dso540765oor.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Oct 2021 00:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pNqkeBYSB1CUBjV40OnSSen/EOp8E2sKB+A/BqEXBjs=;
        b=Z/yV3xJOv68ab7pnBqiWIQXi4yEicoH0dGH//zkiOVA2/bTTtT9Nkodm538FAMGC4S
         b2NusFrA8c2XY0dDLGwYniIe+3uS9LUhDfr5n4FSArE9O+r17bHfADfbekip3C+R/LaH
         IohKEZMSnGE6PKSp5gy4hrMea5QmC7mo+jx3I73dUczdat+DHLwUi8VjOcQwvenqSYMc
         wTbzafbE9Rsc/T4pNHMystJT4Dm1qGD5xNoDC3qeJhL3EScQL5T1XLtGHnA71xXH8HI/
         KQCzetLvEyMkJs2jvqf0t7Sv3BTmqyaCuoPy1EQ19KbZ80zY5Nuj0qyCzSYuSePLq/sK
         pN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pNqkeBYSB1CUBjV40OnSSen/EOp8E2sKB+A/BqEXBjs=;
        b=ttyA7KYsr8Xf1XUphSGV/ONRprXb+80LqJSH6y3PgiGrKUz3M7I4HsTQ/dbqts2i/z
         xOXLIaDKuiQmxfIZkOPdUog4nQDSFGRbCC3Bnrb/wMNgBNDtXihNz9wUTRVK0YczyJ88
         p4/vFldvtCHDHJvrY4lSzBDtjZEk9eWm0M5d4HAwhvN/ySbdcKlrgp3tpxDilmmfp7hC
         0Pz0dW7es0EfrZKYN0lmyFE3omUFtF5k8B4SDZWd3Ipd575YTP4OqmLloXGfRNRzPfUR
         dU1N6x63IIP0KoS/iH2UjDkiRro0Ci/9eOyaBYiOcMM97B3Vi95UdZbnRq6/Mc3KNoW3
         k23g==
X-Gm-Message-State: AOAM530kVGLIeBtXLLyH7uXSs0z7q0LVg1Uxlu22Yx19YglWkvP2/ZUh
        1RbQKlAd1mO4HMXDR8i35zL0g9K9s2G0Yph0QTc=
X-Google-Smtp-Source: ABdhPJzr9TwtOGJaXXSvscfsgk2ldlOYZutwetett2IIj+0h16ayMS/01iokS7zm81szrUMzEuVrj/xocELaBrcjw90=
X-Received: by 2002:a4a:e9f0:: with SMTP id w16mr728714ooc.3.1634111711754;
 Wed, 13 Oct 2021 00:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211012165314.338619-1-t123yh@outlook.com> <20211012165314.338619-2-t123yh@outlook.com>
 <YWaDl19xQ83bKU6V@kroah.com>
In-Reply-To: <YWaDl19xQ83bKU6V@kroah.com>
From:   Yunhao Tian <t123yh.xyz@gmail.com>
Date:   Wed, 13 Oct 2021 15:54:55 +0800
Message-ID: <CAFQXTv1ZLZnKNx8oz=F==0w7uqD0NFgibxntHp1jjJQbA7-4OQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: u_audio: remove unnecessary array
 declaration of snd_kcontrol_new
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg Kroah-Hartman <gregkh@linuxfoundation.org> =E4=BA=8E2021=E5=B9=B410=E6=
=9C=8813=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=882:58=E5=86=99=E9=81=
=93=EF=BC=9A
>
> [Meta comment, you didn't have anyone on the To: line, so that messes
> with replies...]
>
I'll add To: line in my next email, thanks for pointing out.

> On Wed, Oct 13, 2021 at 12:53:14AM +0800, Yunhao Tian wrote:
> > From: Yunhao Tian <t123yh.xyz@gmail.com>
> >
> > Currently, an array is used to contain all snd_kcontrol_new objects
> > of the audio gadget. This is unnecessary and possibly prone to an
> > (unlikely happen) race condition between the assignment of name
> > and call of snd_ctl_new1 if two audio gadget is being set up simutaneou=
sly.
> > This patch removes the global snd_kcontrol_new array and initialize
> > individual snd_kcontrol_new object when it's being used.
> >
> > Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
> > ---
> >  drivers/usb/gadget/function/u_audio.c | 65 +++++++++++----------------
> >  1 file changed, 25 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget=
/function/u_audio.c
> > index c5f39998c653..1f4226d75dd8 100644
> > --- a/drivers/usb/gadget/function/u_audio.c
> > +++ b/drivers/usb/gadget/function/u_audio.c
> > @@ -27,12 +27,6 @@
> >  #define PRD_SIZE_MAX PAGE_SIZE
> >  #define MIN_PERIODS  4
> >
> > -enum {
> > -     UAC_FBACK_CTRL,
> > -     UAC_MUTE_CTRL,
> > -     UAC_VOLUME_CTRL,
> > -};
> > -
> >  /* Runtime data params for one stream */
> >  struct uac_rtd_params {
> >       struct snd_uac_chip *uac;       /* parent chip */
> > @@ -914,31 +908,6 @@ static int u_audio_volume_put(struct snd_kcontrol =
*kcontrol,
> >       return change;
> >  }
> >
> > -
> > -static struct snd_kcontrol_new u_audio_controls[]  =3D {
> > -     [UAC_FBACK_CTRL] {
> > -             .iface =3D        SNDRV_CTL_ELEM_IFACE_PCM,
> > -             .name =3D         "Capture Pitch 1000000",
> > -             .info =3D         u_audio_pitch_info,
> > -             .get =3D          u_audio_pitch_get,
> > -             .put =3D          u_audio_pitch_put,
> > -     },
> > -     [UAC_MUTE_CTRL] {
> > -             .iface =3D        SNDRV_CTL_ELEM_IFACE_MIXER,
> > -             .name =3D         "", /* will be filled later */
> > -             .info =3D         u_audio_mute_info,
> > -             .get =3D          u_audio_mute_get,
> > -             .put =3D          u_audio_mute_put,
> > -     },
> > -     [UAC_VOLUME_CTRL] {
> > -             .iface =3D        SNDRV_CTL_ELEM_IFACE_MIXER,
> > -             .name =3D         "", /* will be filled later */
> > -             .info =3D         u_audio_volume_info,
> > -             .get =3D          u_audio_volume_get,
> > -             .put =3D          u_audio_volume_put,
> > -     },
> > -};
> > -
> >  int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
> >                 const char *card_name)
> >  {
> > @@ -946,6 +915,7 @@ int g_audio_setup(struct g_audio *g_audio, const ch=
ar *pcm_name,
> >       struct snd_card *card;
> >       struct snd_pcm *pcm;
> >       struct snd_kcontrol *kctl;
> > +     struct snd_kcontrol_new kctl_new;
> >       struct uac_params *params;
> >       int p_chmask, c_chmask;
> >       int i, err;
> > @@ -1043,8 +1013,14 @@ int g_audio_setup(struct g_audio *g_audio, const=
 char *pcm_name,
> >               strscpy(card->mixername, card_name, sizeof(card->driver))=
;
> >
> >       if (c_chmask && g_audio->in_ep_fback) {
> > -             kctl =3D snd_ctl_new1(&u_audio_controls[UAC_FBACK_CTRL],
> > -                                 &uac->c_prm);
> > +             kctl_new =3D (struct snd_kcontrol_new) {
> > +                     .iface =3D        SNDRV_CTL_ELEM_IFACE_PCM,
> > +                     .name =3D         "Capture Pitch 1000000",
> > +                     .info =3D         u_audio_pitch_info,
> > +                     .get =3D          u_audio_pitch_get,
> > +                     .put =3D          u_audio_pitch_put,
> > +             };
> > +             kctl =3D snd_ctl_new1(&kctl_new, &uac->c_prm);
>
> Did you test this code?  Now this data is on the stack and will be
> removed later on, while the original code's data will persist after this
> function returns.
>
> Are you sure this is ok?
>
> thanks,
>
> greg k-h

Hi greg,

snd_ctl_new1 copies all members of the kctl_new struct to its own
data structure, shown in the following code (in which ncontrol is kctl_new)=
:

kctl->id.iface =3D ncontrol->iface;
kctl->id.device =3D ncontrol->device;
kctl->id.subdevice =3D ncontrol->subdevice;
if (ncontrol->name) {
    strscpy(kctl->id.name, ncontrol->name, sizeof(kctl->id.name));
    if (strcmp(ncontrol->name, kctl->id.name) !=3D 0)
        pr_warn("ALSA: Control name '%s' truncated to '%s'\n",
                       ncontrol->name, kctl->id.name);
}
kctl->id.index =3D ncontrol->index;

so the data in kctl_new doesn't matter after calling snd_ctl_new1.
IMO It's fine to put kctl_new on the stack.

The patch is tested to be working.
