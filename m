Return-Path: <linux-usb+bounces-37447-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ1aMCgYBmrGegIAu9opvQ
	(envelope-from <linux-usb+bounces-37447-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 20:44:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B98545FCD
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 20:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E80043070A1B
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 18:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4F93A544B;
	Thu, 14 May 2026 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vRpxwa3M"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFCD39E184
	for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784200; cv=pass; b=eT3wrIk6hfBC8dx3CzQxyNiOxi96eD7PP+5zHAGNNocPqjMoSAMmUYFP392yZzEs5CNdwzOiUHK6KOTvQp0pzBkzUqflVbG/zvs2IZB68wmdw7vtQBHtkjDZw8D8vxnWlUTsf/45V/01X5nd9Qh+oWU4Jb2c3bI78bUMWLRd+cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784200; c=relaxed/simple;
	bh=yJAh/s83NSLNBsW+Qy6pLh69ax1E1IRQiV4TzvoqhK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiP7hIVj230iBY15uBCz5wqKZvjJ8JBBu2SxolCPp/fzYV50ovbRUQHsunR3XtfchZvG9wnfBfJGkZoklA1eIF2NhZ9EVLBhdVnl3jww+zGfmfXeFyZOLyUgXYfOFgMRicjmXZjlQq7h0ux6IDRfco9+NSif8dXJHuTRxYM1oTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vRpxwa3M; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-47bdee5bfc4so125111b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 11:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778784195; cv=none;
        d=google.com; s=arc-20240605;
        b=FrFVcgOgKfvt8bqjZudLQ2gRCJ3PgcKaMogkt4W7Fj8hCFrmXsYbzaf4LhY2A4rvEi
         YOQWCjne8zMMjCWyKXMLMZciubULnvCJKq/4SEJSMvE8tUGVc52mNcQ9eHLXnerfyPVh
         A4gFO2kmKenqo7RONUD5dtILUae//UB2QdzxEC6hA8dBZDB2dkQzQ4xO4Y8oWOu/Xl4H
         cvVSD0YgmyYKMxmm4X2qZGCV6+u99JxdbploHRFL7US5AyIfdam8cnk11vEW6BRUoWq9
         TvzqANnCDWOG6Pi4NcZaS03HDZqoow5XEOKJO4uXTBX8/ar2u7Uav3IC8re/D05swkF5
         w/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+r8Ceao2P033y9hF0Xrlb17AqPBbQOwStyV+uZPyGDk=;
        fh=Hr6/hTTXa2Hjgw3fWigQ7VJLT9bLe8ok7VGjX1Gz6sU=;
        b=MbpIV32hewijsNJNUiAh1ZLA0CJvXS2ZVZymIR6qLv9AEwEmCetFzwFvWZeCCACvZV
         vNbC15auUf4xeLKGY51dxBo91zyTKLfW6IxEKQrp1fRmqhaIXxvMgID5DgvbMRaOAb0H
         NCD+zIS/bijJEwuY+RO7uHPeMkspuup5PK49BTolA4vsEHX+aQPHsro4wir7/sNU5ePw
         fVpR63f/u9OQ9xOiCc3skvkpbDb1M4G8ACUmLEZq+EDtkw/uO231lzIQSZtfq6nqm1gK
         jauGiHBaaWlFIdjCCAj4LfRoV6Hze5oCwT8gFiXExjcyH4KvSccZM+XPAZS9Jd4bXws5
         +OkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778784195; x=1779388995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+r8Ceao2P033y9hF0Xrlb17AqPBbQOwStyV+uZPyGDk=;
        b=vRpxwa3MqkTohpukEYUvpN1bMXEFWfM7DO25sjwm4eajg4NPMl/keU3oDHW2coopzG
         bbnc+tAtZd82rom/Jug3PHg7H3plGEao08uABAC7UxcMD+G32W5mntppHypkMLQohMpZ
         OX91ZOKQyhyAzr6Gf416GlCxM6fG7zNoQOtIqY6C3s3QtaqpQHRXq6dbcXH9CRFv8bNt
         TTgqCShUUhDMiTCmDl8Jy+ZhciHtFo8xpWf3GPfc4tMByhFQrNuLbqv8p97srwhVDOwn
         r7M5VzV3wB6fFc0AYH7nxsM6o6lYChKbLm7n+8BlttpuJ1NH4yxkYpptt5ZevPfKZnYg
         hULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784195; x=1779388995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+r8Ceao2P033y9hF0Xrlb17AqPBbQOwStyV+uZPyGDk=;
        b=SVrnaU8MGYFgA2Izslg0Ba+teCdeVUJ8B0WGzhtUa3n7YFqs5MOU9f6YLGWdQfO5HU
         f72OuIvb5BSSXDOQ/eCxLov6aF1Mlq8yAm3Em3IG6b1HFkcQtZ80njNohrJj/wBCwXcB
         NuL/Nl0JaMg8h8/gc87Sczot+Xfac7EVP35EkyOIyPN3/FR+/JYtJ126+KrOUhQC+UJ/
         X7x5mKPTvBl+7iAGeBrOHvHHgdEag2RfprEk8IuUEfUQHNo9uZa29+kdEoKj/6hRNCti
         XUrT1QKVhXXv8hZqXxC/zV9xxZkLOmeA/RLXFpttQS4rD27w4fRD4EzksBjwr5rpGiqT
         eezQ==
X-Forwarded-Encrypted: i=1; AFNElJ93J8gYvDZl5MF9FtcBQH4vsgL5oACSFm8VTfeD//ikHEiJlV5HUrmWozSkWP4zbzpdgUte3KtTcp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxVbVmPvvos3QSUYWPWFnsbdMxk323VPnszmX+T6RytaI0KCN
	TIwAyRByRkL4nCkx8Xu9u45B0zEZQfBb3KHQ7GN+7S+wuGWMs+PMOU8ScrGiydUNH6CQns9LM65
	jP8dzfb2lgxUmjQTwVPd+Jf4eebvRQmvBixjj09/8
X-Gm-Gg: Acq92OHuCU8FtYVGqMSkPU7E+dqKeDuS35kqtR04IRCu83dohBQ7LeP1PPwBmBo/jGY
	OWJW2TRRu4GF6zB3a7yPANA29LmWyO1DN/U4GNbuQ+MxIm0h5jrfxdZZoLMMvt1Jm5rcslOKhZl
	ABwO1CN3kJcV4CQ7A1K9l0ufyv3yYREBuRjLxZBvodDHXlZjUPH7B/BvqfPJN/wPMJh1w2k1Ujd
	0m45LuZk4aBpWfVOVVuAzykIvuPmw8xidSUZNm1wRvZLs1g+bCuAhmHp0nd2xVc9oeX/gzi4973
	hH//808jmy3eBOTbrgmMWh1pDjLGr2IBQ4SDOQ6LjJryndp8
X-Received: by 2002:a05:6808:158f:b0:467:153a:2d9c with SMTP id
 5614622812f47-482cb7bfabbmr2820387b6e.15.1778784194657; Thu, 14 May 2026
 11:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-tcpm-discover-modes-nak-fix-v4-1-75945d0ed30f@collabora.com>
 <CALzBnUGhad0r3oLDTG3TrFPBsJpyGa_Ra7DCM0Gju0-rKSxx9A@mail.gmail.com>
In-Reply-To: <CALzBnUGhad0r3oLDTG3TrFPBsJpyGa_Ra7DCM0Gju0-rKSxx9A@mail.gmail.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 14 May 2026 11:42:38 -0700
X-Gm-Features: AVHnY4LxQ0219RIul-nYjocBNNZyHTWnKIyQVZ8yXw_y4QEyxeeLKknyKVpAvww
Message-ID: <CAPTae5K5=J25gDNmVb42eXXpfFmF7z81JSumHJobrVm9a1oOcQ@mail.gmail.com>
Subject: Re: [PATCH v4] usb: typec: tcpm: improve handling of DISCOVER_MODES failures
To: RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 25B98545FCD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37447-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 4:52=E2=80=AFPM RD Babiera <rdbabiera@google.com> w=
rote:
>
> On Wed, Apr 29, 2026 at 9:33=E2=80=AFAM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > UGREEN USB-C Multifunction Adapter Model CM512 (AKA "Revodok 107")
> > exposes two SVIDs: 0xff01 (DP Alt Mode) and 0x1d5c. The DISCOVER_MODES
> > step succeeds for 0xff01 and gets a NAK for 0x1d5c. Currently this
> > results in DP Alt Mode not being registered either, since the modes
> > are only registered once all of them have been discovered. The NAK
> > results in the processing being stopped and thus no Alt modes being
> > registered.
> >
> > Improve the situation by handling the NAK gracefully and continue
> > processing the other modes.
> >
> > Before this change, the TCPM log ends like this:
> >
> > (more log entries before this)
> > [    5.028287] AMS DISCOVER_SVIDS finished
> > [    5.028291] cc:=3D4
> > [    5.040040] SVID 1: 0xff01
> > [    5.040054] SVID 2: 0x1d5c
> > [    5.040082] AMS DISCOVER_MODES start
> > [    5.040096] PD TX, header: 0x1b6f
> > [    5.050946] PD TX complete, status: 0
> > [    5.059609] PD RX, header: 0x264f [1]
> > [    5.059626] Rx VDM cmd 0xff018043 type 1 cmd 3 len 2
> > [    5.059640] AMS DISCOVER_MODES finished
> > [    5.059644] cc:=3D4
> > [    5.069994]  Alternate mode 0: SVID 0xff01, VDO 1: 0x000c0045
> > [    5.070029] AMS DISCOVER_MODES start
> > [    5.070043] PD TX, header: 0x1d6f
> > [    5.081139] PD TX complete, status: 0
> > [    5.087498] PD RX, header: 0x184f [1]
> > [    5.087515] Rx VDM cmd 0x1d5c8083 type 2 cmd 3 len 1
> > [    5.087529] AMS DISCOVER_MODES finished
> > [    5.087534] cc:=3D4
> > (no further log entries after this point)
> >
> > After this patch the TCPM log looks exactly the same, but then
> > continues like this:
> >
> > [    5.100222] Skip SVID 0x1d5c (failed to discover mode)
> > [    5.101699] AMS DFP_TO_UFP_ENTER_MODE start
> > (log goes on as the system initializes DP AltMode)
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 41d9d75344d9 ("usb: typec: tcpm: add discover svids and discover=
 modes support for sop'")
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>
> Reviewed-by: RD Babiera <rdbabiera@google.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> > ---
> > Changes in v4:
> > - Link to v3: https://lore.kernel.org/r/20260309-tcpm-discover-modes-na=
k-fix-v3-1-a4447f5c1c61@collabora.com
> > - Rebase to v7.1-rc1
> > - Collect Reviewed-by from Heikki Krogerus
> >
> > Changes in v3:
> > - Link to v2: https://lore.kernel.org/r/20260303-tcpm-discover-modes-na=
k-fix-v2-1-5a630070025a@collabora.com
> > - Move svdm_consume_modes() out of tcpm_handle_discover_mode() (Heikki =
Krogerus)
> > - Move rlen return pointer argument into proper return code (Heikki Kro=
gerus)
> > - Drop multiple tcpm_handle_discover_mode() arguments by re-getting the=
m
> >   in the function  (Heikki Krogerus)
> > - Restructure if/else branches after these changes to make checkpatch h=
appy
> > - Did not pick up R-b tag from Badhri Jagan Sridharan due to the amount
> >   of changes
> >
> > Changes in v2:
> > - Link to v1: https://lore.kernel.org/r/20260213-tcpm-discover-modes-na=
k-fix-v1-0-9bcb5adb4ef6@collabora.com
> > - Squash patches (Badhri Jagan Sridharan)
> > - Add Fixes tag (Badhri Jagan Sridharan)
> > - Move common svdm_consume_modes out of conditional statement (Badhri J=
agan Sridharan)
> > - Add TCPM log to commit message (Badhri Jagan Sridharan)
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 97 +++++++++++++++++++++++++++--------=
--------
> >  1 file changed, 61 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index dfbb94ddc98a..44ab7e0e5d50 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -2142,6 +2142,55 @@ static bool tcpm_cable_vdm_supported(struct tcpm=
_port *port)
> >                tcpm_can_communicate_sop_prime(port);
> >  }
> >
> > +static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *resp=
onse,
> > +                                    enum tcpm_transmit_type rx_sop_typ=
e,
> > +                                    enum tcpm_transmit_type *response_=
tx_sop_type)
> > +{
> > +       struct typec_port *typec =3D port->typec_port;
> > +       struct pd_mode_data *modep;
> > +
> > +       if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> > +               modep =3D &port->mode_data;
> > +               modep->svid_index++;
> > +
> > +               if (modep->svid_index < modep->nsvids) {
> > +                       u16 svid =3D modep->svids[modep->svid_index];
> > +                       *response_tx_sop_type =3D TCPC_TX_SOP;
> > +                       response[0] =3D VDO(svid, 1,
> > +                                         typec_get_negotiated_svdm_ver=
sion(typec),
> > +                                         CMD_DISCOVER_MODES);
> > +                       return 1;
> > +               }
> > +
> > +               if (tcpm_cable_vdm_supported(port)) {
> > +                       *response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
> > +                       response[0] =3D VDO(USB_SID_PD, 1,
> > +                                         typec_get_cable_svdm_version(=
typec),
> > +                                         CMD_DISCOVER_SVID);
> > +                       return 1;
> > +               }
> > +
> > +               tcpm_register_partner_altmodes(port);
> > +       } else if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> > +               modep =3D &port->mode_data_prime;
> > +               modep->svid_index++;
> > +
> > +               if (modep->svid_index < modep->nsvids) {
> > +                       u16 svid =3D modep->svids[modep->svid_index];
> > +                       *response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
> > +                       response[0] =3D VDO(svid, 1,
> > +                                         typec_get_cable_svdm_version(=
typec),
> > +                                         CMD_DISCOVER_MODES);
> > +                       return 1;
> > +               }
> > +
> > +               tcpm_register_plug_altmodes(port);
> > +               tcpm_register_partner_altmodes(port);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *=
adev,
> >                         const u32 *p, int cnt, u32 *response,
> >                         enum adev_actions *adev_action,
> > @@ -2399,41 +2448,11 @@ static int tcpm_pd_svdm(struct tcpm_port *port,=
 struct typec_altmode *adev,
> >                         }
> >                         break;
> >                 case CMD_DISCOVER_MODES:
> > -                       if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> > -                               /* 6.4.4.3.3 */
> > -                               svdm_consume_modes(port, p, cnt, rx_sop=
_type);
> > -                               modep->svid_index++;
> > -                               if (modep->svid_index < modep->nsvids) =
{
> > -                                       u16 svid =3D modep->svids[modep=
->svid_index];
> > -                                       *response_tx_sop_type =3D TCPC_=
TX_SOP;
> > -                                       response[0] =3D VDO(svid, 1, sv=
dm_version,
> > -                                                         CMD_DISCOVER_=
MODES);
> > -                                       rlen =3D 1;
> > -                               } else if (tcpm_cable_vdm_supported(por=
t)) {
> > -                                       *response_tx_sop_type =3D TCPC_=
TX_SOP_PRIME;
> > -                                       response[0] =3D VDO(USB_SID_PD,=
 1,
> > -                                                         typec_get_cab=
le_svdm_version(typec),
> > -                                                         CMD_DISCOVER_=
SVID);
> > -                                       rlen =3D 1;
> > -                               } else {
> > -                                       tcpm_register_partner_altmodes(=
port);
> > -                               }
> > -                       } else if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME=
) {
> > -                               /* 6.4.4.3.3 */
> > -                               svdm_consume_modes(port, p, cnt, rx_sop=
_type);
> > -                               modep_prime->svid_index++;
> > -                               if (modep_prime->svid_index < modep_pri=
me->nsvids) {
> > -                                       u16 svid =3D modep_prime->svids=
[modep_prime->svid_index];
> > -                                       *response_tx_sop_type =3D TCPC_=
TX_SOP_PRIME;
> > -                                       response[0] =3D VDO(svid, 1,
> > -                                                         typec_get_cab=
le_svdm_version(typec),
> > -                                                         CMD_DISCOVER_=
MODES);
> > -                                       rlen =3D 1;
> > -                               } else {
> > -                                       tcpm_register_plug_altmodes(por=
t);
> > -                                       tcpm_register_partner_altmodes(=
port);
> > -                               }
> > -                       }
> > +                       /* 6.4.4.3.3 */
> > +                       svdm_consume_modes(port, p, cnt, rx_sop_type);
> > +                       rlen =3D tcpm_handle_discover_mode(port, respon=
se,
> > +                                                        rx_sop_type,
> > +                                                        response_tx_so=
p_type);
> >                         break;
> >                 case CMD_ENTER_MODE:
> >                         *response_tx_sop_type =3D rx_sop_type;
> > @@ -2476,9 +2495,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, =
struct typec_altmode *adev,
> >                 switch (cmd) {
> >                 case CMD_DISCOVER_IDENT:
> >                 case CMD_DISCOVER_SVID:
> > -               case CMD_DISCOVER_MODES:
> >                 case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
> >                         break;
> > +               case CMD_DISCOVER_MODES:
> > +                       tcpm_log(port, "Skip SVID 0x%04x (failed to dis=
cover mode)",
> > +                                PD_VDO_SVID_SVID0(p[0]));
> > +                       rlen =3D tcpm_handle_discover_mode(port, respon=
se,
> > +                                                        rx_sop_type,
> > +                                                        response_tx_so=
p_type);
> > +                       break;
> >                 case CMD_ENTER_MODE:
> >                         /* Back to USB Operation */
> >                         *adev_action =3D ADEV_NOTIFY_USB_AND_QUEUE_VDM;
> >
> > ---
> > base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> > change-id: 20260213-tcpm-discover-modes-nak-fix-09070bb529c5
> >
> > Best regards,
> > --
> > Sebastian Reichel <sebastian.reichel@collabora.com>
> >

