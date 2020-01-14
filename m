Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B3813B357
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 21:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgANUEz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 15:04:55 -0500
Received: from dougal.metanate.com ([90.155.101.14]:60237 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728733AbgANUEz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 15:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=metanate.com;
         s=stronger; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References
        :In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=RJiYsyXErnAEUIJ0fbwVWhwrEimGLi4n818exekwj+0=; b=Dlt8IVM4UTFnc3tTZRxsTCFxTz
        0GRvuoFzzoI1QvXFEA/3x9zKGavPhqgcqqqHLpR//MI65CuOG/c1IVPSzFhNvXlmcopu3P73lplPX
        gcSZ7dD+SS5Kvefa2uO3iu9hjhfO0SBnVhCNgu17BBlaT8qvQZvsxzk8+xiyOWgAZnktsVH2nJojs
        9JF1Ps4nWvgdizxW0+oT2k8e2mYOC234iJR/qxkaVKOfKG0dI/5iFZDSu4Z013qtTh7lblyxK2JER
        PStDT4ZyGqUKD0rF2vwSejzuFZ3KkZ3EDpqSwwyhspmw0VKTt8szyaSqpkZhN6753941dZSeF05tx
        ccQLaDFw==;
Received: from johnkeeping.plus.com ([81.174.171.191] helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1irSQl-0007r5-Gd; Tue, 14 Jan 2020 20:04:51 +0000
Date:   Tue, 14 Jan 2020 20:04:50 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: USB:UAC2: Incorrect req->length > maxpacket*mc - cause likely
 found
Message-ID: <20200114200450.064cd521.john@metanate.com>
In-Reply-To: <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
        <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
        <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Authenticated: YES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

On Tue, 14 Jan 2020 19:39:05 +0100
Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 11. 01. 20 v 10:31 Pavel Hofman napsal(a):
> > Hi,
> >=20
> > Dne 10. 01. 20 v 8:29 Pavel Hofman napsal(a): =20
> >> Hi,
> >>
> >> Together with dwc2 maintainer Minas Harutyunyan we have been
> >> troubleshooting various issues of dwc2 on RPi4. We hit a problem where
> >> the g_audio in capture (EP OUT, playback from USB host) requests req->
> >> length larger than maxpacket*mc. =20
>=20
> My question relates to the recent patch=20
> https://marc.info/?l=3Dlinux-usb&m=3D157901102706577&w=3D2
> >=20
> > IMO the problem is here=20
> > https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/functi=
on/f_uac2.c#L675=20
> > :
> >=20
> > However, a few lines later the agdev->out_ep_maxpsize is set as maximum=
=20
> > from these two values=20
> > https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/functi=
on/f_uac2.c#L700=20
> > :
> >=20
> > agdev->out_ep_maxpsize =3D max_t(u16,=20
> > le16_to_cpu(fs_epout_desc.wMaxPacketSize),=20
> > le16_to_cpu(hs_epout_desc.wMaxPacketSize));
> >=20
> >=20
> > Unfortunately I do not know the reason for selection of the maximum=20
> > value from FS and HS, I cannot create a patch. Very likely there is mor=
e=20
> > hidden know-how which I do not know.
> >  =20
>=20
> Please can we solve this issue so that the gadget can work for any=20
> bInterval value?

I've taken a look at this and the patch below fixes it in my simple
testing.  But note that this doesn't adjust the PCM's min_period_bytes
which will be necessary if you want to minimize latency with an adjusted
high-speed bInterval setting.

I'm not sure what the right answer is for that; we could update
min_period_bytes if the PCM is opened after the gadget attaches, but
then if it is re-attached at a slower speed the PCM configuration will
be wrong.

-- >8 --
=46rom 1809582b8acfa4127fb507a97206e598fa47f55a Mon Sep 17 00:00:00 2001
From: John Keeping <john@metanate.com>
Date: Tue, 14 Jan 2020 19:16:10 +0000
Subject: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size

Prior to commit eb9fecb9e69b ("usb: gadget: f_uac2: split out audio
core") the maximum packet size was calculated only from the high-speed
descriptor but now we use the largest of the full-speed and high-speed
descriptors.

This is correct, but the full-speed value is likely to be higher than
that for high-speed and this leads to submitting requests for OUT
transfers (received by the gadget) which are larger than the endpoint's
maximum packet size.  These are rightly rejected by the gadget core.

config_ep_by_speed() already sets up the correct maximum packet size for
the enumerated speed in the usb_ep structure, so we can simply use this
instead of the overall value that has been used to allocate buffers for
requests.

Note that the minimum period for ALSA is still set from the largest
value, and this is unavoidable because it's possible to open the audio
device before the gadget has been enumerated.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/usb/gadget/function/u_audio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/fun=
ction/u_audio.c
index 6d956f190f5a..e6d32c536781 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -361,7 +361,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	ep =3D audio_dev->out_ep;
 	prm =3D &uac->c_prm;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
-	req_len =3D prm->max_psize;
+	req_len =3D ep->maxpacket;
=20
 	prm->ep_enabled =3D true;
 	usb_ep_enable(ep);
@@ -379,7 +379,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 			req->context =3D &prm->ureq[i];
 			req->length =3D req_len;
 			req->complete =3D u_audio_iso_complete;
-			req->buf =3D prm->rbuf + i * prm->max_psize;
+			req->buf =3D prm->rbuf + i * ep->maxpacket;
 		}
=20
 		if (usb_ep_queue(ep, prm->ureq[i].req, GFP_ATOMIC))
@@ -430,9 +430,9 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	uac->p_pktsize =3D min_t(unsigned int,
 				uac->p_framesize *
 					(params->p_srate / uac->p_interval),
-				prm->max_psize);
+				ep->maxpacket);
=20
-	if (uac->p_pktsize < prm->max_psize)
+	if (uac->p_pktsize < ep->maxpacket)
 		uac->p_pktsize_residue =3D uac->p_framesize *
 			(params->p_srate % uac->p_interval);
 	else
@@ -457,7 +457,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 			req->context =3D &prm->ureq[i];
 			req->length =3D req_len;
 			req->complete =3D u_audio_iso_complete;
-			req->buf =3D prm->rbuf + i * prm->max_psize;
+			req->buf =3D prm->rbuf + i * ep->maxpacket;
 		}
=20
 		if (usb_ep_queue(ep, prm->ureq[i].req, GFP_ATOMIC))
--=20
2.24.1

