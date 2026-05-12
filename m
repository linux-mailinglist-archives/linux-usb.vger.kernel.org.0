Return-Path: <linux-usb+bounces-37357-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id riIpFl29A2og9wEAu9opvQ
	(envelope-from <linux-usb+bounces-37357-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 01:53:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B867452B65E
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 01:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 408D530882A5
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 23:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF743655D9;
	Tue, 12 May 2026 23:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K8KC0TzI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF8B351C25
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 23:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778629977; cv=pass; b=j4Q6n8DzgtSqGe7P6P0kV+SbsgIJW1m6VL89bTq1Gfvv99++CAtQfj7WxLTojqKepTjCvpOvlUJJRbkqo04bQzzt0tPNuetxgo+P6jGfVCrUV3DYReO228Zww/s9d9hSzO+fWQOiG7Pa5KkUydTNNArXvrUXKXGfh7Phztt18wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778629977; c=relaxed/simple;
	bh=M4OskHsBAFUee/E1HyOtty5ctmQ+ue41zkwBlCBiRQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHpUtMxblzMfOs21ZZjHiFTfXLV7eIF2+2VFdKbSfTtBjwlqiwLZaXECK1q/ZIF9NimzXimQ1GeZfLpRwG76EKQuwQgDEnl80VziE+/fL3fQCn3UD0ROusxEhhddlbMKhqD/yTeEe9WRDczTRAVfJyNNOInbWQwYBJUZA806MUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K8KC0TzI; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso5240449a34.0
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 16:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778629975; cv=none;
        d=google.com; s=arc-20240605;
        b=DvHDHd2HyhM6s54sJyJx95kJWEOPq4NWUezr4hAS117xFdbXwDrhrhO3q4gSnMGtJt
         hbiIA3x02W9NPH/2OKzmg158ZIBHosnJQKSlwe/qmnMHVNHVMG41bNiPLCiN3T7i1C3U
         Oj5bBeV6lzcRyRt6CXh9WdE9sOBU7MI5oxogewgd54ZU4UMgvJuB3OB9l9w8YUdlJl0f
         TNV7UTBQgoU51SQTTFkWTuG99Kk22CxWYVZgBG5w2JY/Vo4W9+4OMHtgzIk55Xzw6Ewd
         pzt+Vn7Focg5UVkkuz5/Fw6QGE1KNWIBqVX2CCqp50vYGHZL02uiYpm8RiY9HSyGYoRd
         RTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+FGA8pZgJ3IPsHpCBVW+DHejdlYtVVwJny+rnPHDZOg=;
        fh=2gZQtcIDynJxgGas1ZByhmd/LpIppyW3AfdiB6ek+y4=;
        b=PROqGz7ZTXFEcns/EIDmxBkR+UwOZxShUHpgYsvYWYK7L0+QcC67oDBgGUi2RabGOH
         7A2M/z6oo7E3hpo5r8hmi2AaZ76YHEGvY3j9/jegk+bPJjPUToAvb+fDz4T1bCfmlsBV
         4ac0yB7yESdWrDGtwMFd0swxUeTaqbFTi1oReP7LP3PYwYklDNFEzzv7NhKfJ8tGMTDK
         pF5gU5JRsJCFynpQQjpWJEBdbCEnc/xuXgay10Ea1amshLKbiFbNTJu+VcrVuB+bHvfd
         eEhLwQNxvR6rbmmaLsMoQuY2nPQiU/IGEj0gUwcUfkgNFG4FDeUlsrpcJ0VAqS3YAmWp
         oZvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778629975; x=1779234775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FGA8pZgJ3IPsHpCBVW+DHejdlYtVVwJny+rnPHDZOg=;
        b=K8KC0TzISBY1O1cO1dOy6ieW9wXIoLOWpsuvuV8EWQn4096GsjghGLzTFLHtivUw/O
         2WLt4WTRhXOBdD+zGqr2WkUb+Og7lv+1DNW0qF6J46HrGBbsxeqVpRHxDIVxvFov/GTo
         Xw0x7rC8LkATweFmKKP/uH+NlMkW46lgtVnGHieWB+d0BkJtxjwXmO5wR0QRu4QupeSu
         +t/grIR3B8r08FK9UpTr3UIUd8uCVL0wwdsL8vtBx28ly69mxgvC4oXO4F3mqfKT0oWD
         DnBQH++KggPmJVcsL4AbZBlk7WM02g6vfcv6UNNO1xVRPRwnpGUiiInmurEcMTPaotgM
         lSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778629975; x=1779234775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FGA8pZgJ3IPsHpCBVW+DHejdlYtVVwJny+rnPHDZOg=;
        b=iA2/QJtcGdK1w+3ME+2b5whHutHRRweR5tUbZSn2VkVO/m1MBu6pOV51kFr5uZfKfH
         2I+eSdup5LiFCCdYYEvWkne1o1N4hj8n3Ck1O36FP76yUfDBjSzdJPOrOIIS5/f/XVNV
         iazhX+YtqNuvHOLnJqJsFF8/s2Z2u2dLGwI8KhRB1wj2/521e1iOuTCXw54sE9DanSqs
         MIjopRfkZHKNlGJywR3rfoZEVqz6gPQS9ObIp3k8b8xGhsgqjXWBwUFQ9tgu0+8fKzBe
         6pOaGSiqGu08weLCMQ4x7URJ5kbmVY1AtN1ualgkIdivpj+KbKe4nLbZVgph8MFIQrXV
         8wyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wq7YdRd6L9sEkgTDVoQDEC8NIGsU3LfYtfg0TDyPFNb5JPVQlH5RDhXCz7sqUzk7d2yEFJLpWOyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyR/V0Qnrp6EdUM9tIed7YzYxSM0fFL0ekA6xsxr1P2XwLperK
	LYUksNbrMes1m5JuGYMe5d6aFUYHqjh13B7ti0Qfbc+jgMEjppKUYuFnbNnWK44G1N0pWfg1Z92
	Miw29Ngv+dOCJcIboz5MJmXqGjBZHEgCit79cy+s8
X-Gm-Gg: Acq92OHdEM2bl6Ik0RQbOLHcbadSc+KsKJs1PgVtrtwX2bxUBjaMqzpSpNG7egfk38x
	xYC9vv1HXCelObcXMOxhxW4Zf5aEGWVmLPN7zWIRCnvkTvWkBKDbZSc2cFF4W2Y28ZUDYZJvchf
	4L4ahdhANjwcV1O/8MRXmyYsi6/v42SeHhbUYdixUVZlIs5v99y79heYj37r8SY+UFo5qJj6x56
	1GO3BCh0Y1VYZ7BDy/OEd+NjP+xP6qy2qzEsftDN2sIXWUlT6Q/ymcngh+08QPq9cUNpa7rvKdy
	796sE1CJovUmuSx6AL2xWRm5Wztx+8skZZxKttqAqCvxc7E89QAaCjfSMII=
X-Received: by 2002:a05:6820:1908:b0:694:9e10:fdce with SMTP id
 006d021491bc7-69b78d48a1fmr540205eaf.4.1778629974495; Tue, 12 May 2026
 16:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-tcpm-discover-modes-nak-fix-v4-1-75945d0ed30f@collabora.com>
In-Reply-To: <20260429-tcpm-discover-modes-nak-fix-v4-1-75945d0ed30f@collabora.com>
From: RD Babiera <rdbabiera@google.com>
Date: Tue, 12 May 2026 16:52:41 -0700
X-Gm-Features: AVHnY4LfJ8Mvw0TkiFibkz2XCR8My-z9f4kN448nFcDnUZezatAPoamXYLKTZro
Message-ID: <CALzBnUGhad0r3oLDTG3TrFPBsJpyGa_Ra7DCM0Gju0-rKSxx9A@mail.gmail.com>
Subject: Re: [PATCH v4] usb: typec: tcpm: improve handling of DISCOVER_MODES failures
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B867452B65E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37357-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdbabiera@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,collabora.com:email,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, Apr 29, 2026 at 9:33=E2=80=AFAM Sebastian Reichel
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
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: RD Babiera <rdbabiera@google.com>

> ---
> Changes in v4:
> - Link to v3: https://lore.kernel.org/r/20260309-tcpm-discover-modes-nak-=
fix-v3-1-a4447f5c1c61@collabora.com
> - Rebase to v7.1-rc1
> - Collect Reviewed-by from Heikki Krogerus
>
> Changes in v3:
> - Link to v2: https://lore.kernel.org/r/20260303-tcpm-discover-modes-nak-=
fix-v2-1-5a630070025a@collabora.com
> - Move svdm_consume_modes() out of tcpm_handle_discover_mode() (Heikki Kr=
ogerus)
> - Move rlen return pointer argument into proper return code (Heikki Kroge=
rus)
> - Drop multiple tcpm_handle_discover_mode() arguments by re-getting them
>   in the function  (Heikki Krogerus)
> - Restructure if/else branches after these changes to make checkpatch hap=
py
> - Did not pick up R-b tag from Badhri Jagan Sridharan due to the amount
>   of changes
>
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
> index dfbb94ddc98a..44ab7e0e5d50 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2142,6 +2142,55 @@ static bool tcpm_cable_vdm_supported(struct tcpm_p=
ort *port)
>                tcpm_can_communicate_sop_prime(port);
>  }
>
> +static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *respon=
se,
> +                                    enum tcpm_transmit_type rx_sop_type,
> +                                    enum tcpm_transmit_type *response_tx=
_sop_type)
> +{
> +       struct typec_port *typec =3D port->typec_port;
> +       struct pd_mode_data *modep;
> +
> +       if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> +               modep =3D &port->mode_data;
> +               modep->svid_index++;
> +
> +               if (modep->svid_index < modep->nsvids) {
> +                       u16 svid =3D modep->svids[modep->svid_index];
> +                       *response_tx_sop_type =3D TCPC_TX_SOP;
> +                       response[0] =3D VDO(svid, 1,
> +                                         typec_get_negotiated_svdm_versi=
on(typec),
> +                                         CMD_DISCOVER_MODES);
> +                       return 1;
> +               }
> +
> +               if (tcpm_cable_vdm_supported(port)) {
> +                       *response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       response[0] =3D VDO(USB_SID_PD, 1,
> +                                         typec_get_cable_svdm_version(ty=
pec),
> +                                         CMD_DISCOVER_SVID);
> +                       return 1;
> +               }
> +
> +               tcpm_register_partner_altmodes(port);
> +       } else if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) {
> +               modep =3D &port->mode_data_prime;
> +               modep->svid_index++;
> +
> +               if (modep->svid_index < modep->nsvids) {
> +                       u16 svid =3D modep->svids[modep->svid_index];
> +                       *response_tx_sop_type =3D TCPC_TX_SOP_PRIME;
> +                       response[0] =3D VDO(svid, 1,
> +                                         typec_get_cable_svdm_version(ty=
pec),
> +                                         CMD_DISCOVER_MODES);
> +                       return 1;
> +               }
> +
> +               tcpm_register_plug_altmodes(port);
> +               tcpm_register_partner_altmodes(port);
> +       }
> +
> +       return 0;
> +}
> +
>  static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *ad=
ev,
>                         const u32 *p, int cnt, u32 *response,
>                         enum adev_actions *adev_action,
> @@ -2399,41 +2448,11 @@ static int tcpm_pd_svdm(struct tcpm_port *port, s=
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
> +                       /* 6.4.4.3.3 */
> +                       svdm_consume_modes(port, p, cnt, rx_sop_type);
> +                       rlen =3D tcpm_handle_discover_mode(port, response=
,
> +                                                        rx_sop_type,
> +                                                        response_tx_sop_=
type);
>                         break;
>                 case CMD_ENTER_MODE:
>                         *response_tx_sop_type =3D rx_sop_type;
> @@ -2476,9 +2495,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, st=
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
> +                       rlen =3D tcpm_handle_discover_mode(port, response=
,
> +                                                        rx_sop_type,
> +                                                        response_tx_sop_=
type);
> +                       break;
>                 case CMD_ENTER_MODE:
>                         /* Back to USB Operation */
>                         *adev_action =3D ADEV_NOTIFY_USB_AND_QUEUE_VDM;
>
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260213-tcpm-discover-modes-nak-fix-09070bb529c5
>
> Best regards,
> --
> Sebastian Reichel <sebastian.reichel@collabora.com>
>

