Return-Path: <linux-usb+bounces-34124-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LqWO9X/qWk1JQEAu9opvQ
	(envelope-from <linux-usb+bounces-34124-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 23:12:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33B218D15
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 23:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACE563036767
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 22:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CF5361DC4;
	Thu,  5 Mar 2026 22:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DOI8T6md"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127B335E55D
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 22:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772748709; cv=pass; b=FhzEv9H+9NJflls4K526Tc7457QfXXB1hqHpVpKHdMCjQZkj0WY7DjFbmfTYtHxuFq/Bd1jLFu6KBvIK0cp6zVsbyyH7kbl5yQ34u24HitUiK0IgkoZK8q4eX0WxQjhqtgghJdplN6I6/WZTS2q99y1wHbEqA+ZdApRKe1+St2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772748709; c=relaxed/simple;
	bh=7MxVFjGmawKQXY3xM/uqGd23Krw/OYZ1EZEEu/8Pros=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9tkpzuh/2OIKYwAHx59HnTg8Jo4IXsuj+ByB6PObvURriRlryNP7WSPYoZCvnOZ4O+aAF+yXdYag+ef9aYkbTGyvhVCUb7C3YbBFIkEPh6Ye6Hj/n2U9geB6DATEyhkJ4gd7GW1/1gRLImDul9O5m7qodbKF1wWm2RLqUX9jfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DOI8T6md; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40946982a78so1525383fac.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 14:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772748706; cv=none;
        d=google.com; s=arc-20240605;
        b=KA330Htf5f0bXPNvLe2sepxljf8jLCR8WyyQ3gJh+Qa/xNpazPhiR5wKNbsBnmhTA9
         2pcgwQHatjyb7uygTzKldGNbDc82tKwSWVq2cztY9Dp8/jLaE0OizDhE0NJ7b/EN+TSt
         EaDHXcrEmn98qkmSh4JGLj/5ggYkpzj81E//6RKhZ15PQiAG0WbcW6ALB78Fcj6QrXCW
         wmCrgC8T0GQhVvx4wVK0YXBjYYsaWTEFFrVwgC/JlA+c9gH4BHgebLHOubAUYcnRVN3H
         hXafPFX48DU1WPW3fCc/IqGXU9IvtKMVU+XpskwCr04ejcVOO4iCcTTh94syivWbqZfF
         VTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2S5UrH7lP9tywnp3Wdnyb1KYpD7D1yyMflWo2M+GqP0=;
        fh=76WGb9WittgRTCDahtTIEpgyOOcNgG2CnENuy8UJgkk=;
        b=YYBewFowGkNhNNB1B77uaj+WBWQX0pX+bgOW1tVgLBuVmi/hSPCwits5oOQ9Z603sC
         97rKnmOLspPk+uBmmSHP7Ih1fTPQViRPfqGI73yAlundR8Ux6ml9fLEWnydeey1jJzsN
         hC3x+ar7PCdUdIl8ctxDYGXk74arkR9K+X+QmS2kkW9YwIQMJFrYThUJhtyAlS8iDj7u
         Zswb6VXOjfSeW0AmuDK1Z0OikpXcXZ2XHZikM35zA4Qhpea6RFwEMSMnZcA03srWKWsI
         YZko5WP3By/ZiEvcV6yhz9AAZ22sDC4dztwsebQD5DK6HlAWmD4BMlXukcshdol2xef+
         8GtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772748706; x=1773353506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S5UrH7lP9tywnp3Wdnyb1KYpD7D1yyMflWo2M+GqP0=;
        b=DOI8T6mdTU48uo47KGICMefsl4B9HALrfKgBztQ9nsYvRJes+h/bw7vHr0w/IoWIbb
         4sMHpruSffR9Zs0ZMdmkACInCpNijz0h+ra2+JoHNPNEIMLe6nCiU2kGFyIBYKWwHGv/
         IW51v3oMvlrOkxyGFDLZePRECB7H1HD4vM1UbCY3yyUt96f1BKDkqwtLbuD0ZH6htjGA
         mflF9VltKWZ98Ri2ik9exEESh+f9/qSeyu42Jf/pCghBbsUL57Xohm/9T7NRZhlHCmiX
         SE0d0Zp+7dMbn4jXaFouOfEDqTul2ONAFk4c3LJ2KNDo8prJh0scjzOkv5FPuhxPLpOc
         O0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772748706; x=1773353506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2S5UrH7lP9tywnp3Wdnyb1KYpD7D1yyMflWo2M+GqP0=;
        b=qzPVKFY8Ny5+fDkMEEkjLhlfXMSDQn37oRpkcboHlFJHeRRgkS4m2VGVkz8dRfa8Le
         oqas1DvYlJyvNZGzGGweX7XeJIrja+FkfKq71jJEBDRDyNrGQe9cT3rIfSYXQ5ozAQAF
         6L9/+wB5TkLC6YV7Up3By0enrbpWU5zNMJLQ3cL05gv3yYjxRFk4vv+sINSUf+qp4Nv/
         DH75BojbxdeEpVj9NPCAqevRddWMlf0YPpEJIKRok98FwJVWdErJGqmc+uZ1NvHIoNZ5
         ryHiOXC9od0Z98PeC0Fm1zN2DHyq1C+tg0hxs1LHf+J0yDOHznNh9PVVu0mNNS4+Z44r
         2Ulg==
X-Forwarded-Encrypted: i=1; AJvYcCXRCYDiSzxiF5MlY64OeKOYgFYQXmLmjcydXwf3CcFeaxYaSW80KpVxtp6NuogPamdMte8xsu7LyLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyUx7rgPWSqPYOfffIegw19x2V1pVpbHU1sX5lK0IEhRzQ6NrO
	Y+daAC/ZPKagtk+KmNHjkjXCdvP9co5cicZEh1RGhO+qInIEMfyrxkKWemRHDbHe+9R2hRhD3E6
	9EIcDhY+EaBbaE9cV6AX9yXsdSmYRmii1yNQsYd6k
X-Gm-Gg: ATEYQzwr0gd+Qd0rpKESS5ZaGfd6yuCmTGLnj52FWdVbnmSS5lcRTrdDjErro+eHfVm
	pKx9TcuL/twlK0El+gwzWEyudSSUVafJZ+ZPjuCesYy/ARnx8SXuj1RFeH1dHUlWy0AiR85K1Rc
	C8k8vd+tZ55k3UVH56D39W02SudQGi6BOpe2BmZy+kBykw6wKIxTl59hEO3zUqkgJcMMtCKijZ6
	H827NYgUZf/fLifZk3W25OdvxbY5bp7TIhbWfJsN/+F0WfaBZBAlOPYB4nWh4ZIy1adumV+hPQW
	6wf2D1KwJwYl5JOKWcdr6rCdGNcHq/nPcsoq7Q==
X-Received: by 2002:a05:6870:8092:b0:408:9c83:5b1a with SMTP id
 586e51a60fabf-416e3ea8cbcmr11261fac.4.1772748705651; Thu, 05 Mar 2026
 14:11:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-tcpm-discover-modes-nak-fix-v2-1-5a630070025a@collabora.com>
In-Reply-To: <20260303-tcpm-discover-modes-nak-fix-v2-1-5a630070025a@collabora.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 5 Mar 2026 14:11:09 -0800
X-Gm-Features: AaiRm53_zjz33-tP74RcnsVNiwqmROLVrBKjQJc9wO9dxIBzC4JHKLRA0HcGnc8
Message-ID: <CAPTae5J+psuXX9m0boHYMYpfi8aNQ3erdyUU5Qnq9DFWbZDRFQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: improve handling of DISCOVER_MODES failures
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, RD Babiera <rdbabiera@google.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4F33B218D15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34124-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 8:29=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> UGREEN USB-C Multifunction Adapter Model CM512 (AKA "Revodok 107")
> exposes two SVIDs: 0xff01 (DP Alt Mode) and 0x1d5c. The DISCOVER_MODES
> step succeeds for 0xff01 and gets a NAK for 0x1d5c. Currently this
> results in DP Alt Mode not being registered either, since the modes
> are only registered once all of them have been discovered. The NAK
> results in the processing being stopped and thus no Alt modes being
> registered.
>
> Improve the situation by handling the NAK gracefully and continue
> processing the other modes.
>
> Before this change, the TCPM log ends like this:
>
> (more log entries before this)
> [    5.028287] AMS DISCOVER_SVIDS finished
> [    5.028291] cc:=3D4
> [    5.040040] SVID 1: 0xff01
> [    5.040054] SVID 2: 0x1d5c
> [    5.040082] AMS DISCOVER_MODES start
> [    5.040096] PD TX, header: 0x1b6f
> [    5.050946] PD TX complete, status: 0
> [    5.059609] PD RX, header: 0x264f [1]
> [    5.059626] Rx VDM cmd 0xff018043 type 1 cmd 3 len 2
> [    5.059640] AMS DISCOVER_MODES finished
> [    5.059644] cc:=3D4
> [    5.069994]  Alternate mode 0: SVID 0xff01, VDO 1: 0x000c0045
> [    5.070029] AMS DISCOVER_MODES start
> [    5.070043] PD TX, header: 0x1d6f
> [    5.081139] PD TX complete, status: 0
> [    5.087498] PD RX, header: 0x184f [1]
> [    5.087515] Rx VDM cmd 0x1d5c8083 type 2 cmd 3 len 1
> [    5.087529] AMS DISCOVER_MODES finished
> [    5.087534] cc:=3D4
> (no further log entries after this point)
>
> After this patch the TCPM log looks exactly the same, but then
> continues like this:
>
> [    5.100222] Skip SVID 0x1d5c (failed to discover mode)
> [    5.101699] AMS DFP_TO_UFP_ENTER_MODE start
> (log goes on as the system initializes DP AltMode)
>
> Cc: stable@vger.kernel.org
> Fixes: 41d9d75344d9 ("usb: typec: tcpm: add discover svids and discover m=
odes support for sop'")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>


Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> ---
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20260213-tcpm-discover-modes-nak-=
fix-v1-0-9bcb5adb4ef6@collabora.com
> - Squash patches (Badhri Jagan Sridharan)
> - Add Fixes tag (Badhri Jagan Sridharan)
> - Move common svdm_consume_modes out of conditional statement (Badhri Jag=
an Sridharan)
> - Add TCPM log to commit message (Badhri Jagan Sridharan)
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 97 +++++++++++++++++++++++++++----------=
------
>  1 file changed, 61 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 1d2f3af034c5..cd5260f408fb 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1995,6 +1995,55 @@ static bool tcpm_cable_vdm_supported(struct tcpm_p=
ort *port)
>                tcpm_can_communicate_sop_prime(port);
>  }
>
> +static void tcpm_handle_discover_mode(struct tcpm_port *port,
> +                                     const u32 *p, int cnt, u32 *respons=
e,
> +                                     enum tcpm_transmit_type rx_sop_type=
,
> +                                     enum tcpm_transmit_type *response_t=
x_sop_type,
> +                                     struct pd_mode_data *modep,
> +                                     struct pd_mode_data *modep_prime,
> +                                     int svdm_version, int *rlen,
> +                                     bool success)
> +
> +{
> +       struct typec_port *typec =3D port->typec_port;
> +
> +       /* 6.4.4.3.3 */
> +       if (success)
> +               svdm_consume_modes(port, p, cnt, rx_sop_type);
> +
> +       if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> +               modep->svid_index++;
> +               if (modep->svid_index < modep->nsvids) {
> +                       u16 svid =3D modep->svids[modep->svid_index];
> +                       *response_tx_sop_type =3D TCPC_TX_SOP;
> +                       response[0] =3D VDO(svid, 1, svdm_version,
> +                                         CMD_DISCOVER_MODES);
> +                       *rlen =3D 1;
> +               } else if (tcpm_cable_vdm_supported(port)) {
> +                       *response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       response[0] =3D VDO(USB_SID_PD, 1,
> +                                         typec_get_cable_svdm_version(ty=
pec),
> +                                         CMD_DISCOVER_SVID);
> +                       *rlen =3D 1;
> +               } else {
> +                       tcpm_register_partner_altmodes(port);
> +               }
> +       } else if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> +               modep_prime->svid_index++;
> +               if (modep_prime->svid_index < modep_prime->nsvids) {
> +                       u16 svid =3D modep_prime->svids[modep_prime->svid=
_index];
> +                       *response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       response[0] =3D VDO(svid, 1,
> +                                         typec_get_cable_svdm_version(ty=
pec),
> +                                         CMD_DISCOVER_MODES);
> +                       *rlen =3D 1;
> +               } else {
> +                       tcpm_register_plug_altmodes(port);
> +                       tcpm_register_partner_altmodes(port);
> +               }
> +       }
> +}
> +
>  static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *ad=
ev,
>                         const u32 *p, int cnt, u32 *response,
>                         enum adev_actions *adev_action,
> @@ -2252,41 +2301,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, s=
truct typec_altmode *adev,
>                         }
>                         break;
>                 case CMD_DISCOVER_MODES:
> -                       if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> -                               /* 6.4.4.3.3 */
> -                               svdm_consume_modes(port, p, cnt, rx_sop_t=
ype);
> -                               modep->svid_index++;
> -                               if (modep->svid_index < modep->nsvids) {
> -                                       u16 svid =3D modep->svids[modep->=
svid_index];
> -                                       *response_tx_sop_type =3D TCPC_TX=
_SOP;
> -                                       response[0] =3D VDO(svid, 1, svdm=
_version,
> -                                                         CMD_DISCOVER_MO=
DES);
> -                                       rlen =3D 1;
> -                               } else if (tcpm_cable_vdm_supported(port)=
) {
> -                                       *response_tx_sop_type =3D TCPC_TX=
_SOP_PRIME;
> -                                       response[0] =3D VDO(USB_SID_PD, 1=
,
> -                                                         typec_get_cable=
_svdm_version(typec),
> -                                                         CMD_DISCOVER_SV=
ID);
> -                                       rlen =3D 1;
> -                               } else {
> -                                       tcpm_register_partner_altmodes(po=
rt);
> -                               }
> -                       } else if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) =
{
> -                               /* 6.4.4.3.3 */
> -                               svdm_consume_modes(port, p, cnt, rx_sop_t=
ype);
> -                               modep_prime->svid_index++;
> -                               if (modep_prime->svid_index < modep_prime=
->nsvids) {
> -                                       u16 svid =3D modep_prime->svids[m=
odep_prime->svid_index];
> -                                       *response_tx_sop_type =3D TCPC_TX=
_SOP_PRIME;
> -                                       response[0] =3D VDO(svid, 1,
> -                                                         typec_get_cable=
_svdm_version(typec),
> -                                                         CMD_DISCOVER_MO=
DES);
> -                                       rlen =3D 1;
> -                               } else {
> -                                       tcpm_register_plug_altmodes(port)=
;
> -                                       tcpm_register_partner_altmodes(po=
rt);
> -                               }
> -                       }
> +                       tcpm_handle_discover_mode(port, p, cnt, response,
> +                                                 rx_sop_type, response_t=
x_sop_type,
> +                                                 modep, modep_prime, svd=
m_version,
> +                                                 &rlen, true);
>                         break;
>                 case CMD_ENTER_MODE:
>                         *response_tx_sop_type =3D rx_sop_type;
> @@ -2329,9 +2347,16 @@ static int tcpm_pd_svdm(struct tcpm_port *port, st=
ruct typec_altmode *adev,
>                 switch (cmd) {
>                 case CMD_DISCOVER_IDENT:
>                 case CMD_DISCOVER_SVID:
> -               case CMD_DISCOVER_MODES:
>                 case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
>                         break;
> +               case CMD_DISCOVER_MODES:
> +                       tcpm_log(port, "Skip SVID 0x%04x (failed to disco=
ver mode)",
> +                                PD_VDO_SVID_SVID0(p[0]));
> +                       tcpm_handle_discover_mode(port, p, cnt, response,
> +                                                 rx_sop_type, response_t=
x_sop_type,
> +                                                 modep, modep_prime, svd=
m_version,
> +                                                 &rlen, false);
> +                       break;
>                 case CMD_ENTER_MODE:
>                         /* Back to USB Operation */
>                         *adev_action =3D ADEV_NOTIFY_USB_AND_QUEUE_VDM;
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260213-tcpm-discover-modes-nak-fix-09070bb529c5
>
> Best regards,
> --
> Sebastian Reichel <sebastian.reichel@collabora.com>
>

