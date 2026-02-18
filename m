Return-Path: <linux-usb+bounces-33423-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M3lOhgplWl2MQIAu9opvQ
	(envelope-from <linux-usb+bounces-33423-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:51:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C7152BC3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2AAD3027953
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 02:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA2E35966;
	Wed, 18 Feb 2026 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fi9wQH2A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773172DB794
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 02:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771383061; cv=pass; b=LQHpnhPjooKyR3ao58Y+NVk1hNnC3OssQAh7K4OrcSceVG0b6jR97NxRfivH3SAj3OtYvwOTvNVs4VARBP6Ls/7QoBCoCoZIBdgSCOhNDa5zf2koC6Hk/CcksazlloAZZsDWOf9qaym9MQ3Xweep3YbdiXCmBx3J7hffxGoj5BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771383061; c=relaxed/simple;
	bh=DrDA6JVWJ4p6nWsU9Oj29QWb9OfLFZN9DdA1LmCpF90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/W2JdAhSskxq7CD+u7+y3bKMqYtWaYvPaMKcNpiNQ62TMp1KcY8E7R8ktCZ0DiSLmbloqqoFgmu4kJWXvm5RstpcU2AS/1teZdiGyfaE8xMakdeangDsNBZ9s6Mke7Twta5Dk/wXlG6nmWnnM54zVAFMeBlIuAYMmJiau/uTcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fi9wQH2A; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d4c307db9aso2891257a34.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 18:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771383058; cv=none;
        d=google.com; s=arc-20240605;
        b=PEXzJN2a3+WCN+skzqxFUz9mJR/WG64cqHpnUKeqdS0Mqi8aQVV9G8NGCRAKsr2ZHi
         hAEihvxRHruqoLTlva/4zmDc2Vpxb01EqP5J9So9x40axRUG1CL56fOh6ZwUMVb2jggj
         ECkoigDRQhAQ1yNrVwY/wlFymRQfrQO2h5+mI6m+4kVpvsOrxYtJBNxaxCo2TGjqRNhF
         ZJkqeTA6FETjN4W1tQffxLZwruTmslt/zxVJzMGRyqLMQ7tiY7UGQ9U1j8GVwZwjKzAJ
         OZLkN/8Pod5a20crwCCmpzU8B37HD4ZsMdhmRXJTHllzjqHnF+a4DspnmT4AFSEiwtdJ
         sokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kAxrKJW5I1YHutwvFjv9QeTWcD+yuD9Vb4MDLqLVrII=;
        fh=cmd5DEtgpc/yQbPWIWh10iQP4b1ZoVwagGYTNezBHk4=;
        b=EfWGh7WMvIxwUcg/ELUhybCs/KxvGlP7omGzmm8obJml/d9NtKB9SPmzrD5ETuiPpJ
         eOQ2kgfAA6Tb2hxA6ETjGL2fJ06Z6XVSIiScX4DDl5YFgA01nk0wwfM2zUjfWuAbhfmg
         Vu6BMU8AtYUX6WjrvFaWeuWAvdvBtNCUaZGWLq97D9gmSSTQ1w8e/cfdQTuxUZ9w31oK
         uvSoCZk/36KmQXDRF6PQxis/4Ca3FK0fVLZXZvG8ki95DjmZv6PqaR0TUMGJEBbdy82W
         HgEeyw8Un8US0hANiUtMWiAkJbf7C+0+1VEsgHc6hiAVwrskVkhD2T9DK+FgBByw3iwh
         XSeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771383058; x=1771987858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAxrKJW5I1YHutwvFjv9QeTWcD+yuD9Vb4MDLqLVrII=;
        b=Fi9wQH2AH947PxtX2vbcZzI4rwCg0eUmzEnkwKjyZaPPurFvswRsxRio3i2OHevdDQ
         P/gbhKBCmd+xdO6SosiYnqaJScpKzkEqCk2qpMI3VjhkD4UUhPxuytSEOhmbcr3dVQeR
         abnm+T23RfxwD3tu9qoQ4lEpQDbqKmjHTygDuGtutDj3nJiCvvtjrhTyN5NaZmDxBgJf
         FRpxHaLiiBsQTB75CUdc/qvoMWsZToXvUX3GQFUKoJy9BnTexwieIeOpNP7/QJChu60l
         W9/KGsnu9bNqnTI+2uBivPmvpmmMomzEn4oQ6ypgyJowjv9PgkiPsZyanhHuaX3SRszh
         GObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771383058; x=1771987858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kAxrKJW5I1YHutwvFjv9QeTWcD+yuD9Vb4MDLqLVrII=;
        b=RNwSE+fLf2BZYXejAXa0vQnoS3FUBWSefIT4AmxVQ4VKFmwrP0VgX0LwZjWL4XvjlX
         oUI9cbEkHEXVj2hmaVImmYPa6aJPXrHGLcwOH3W15snTCOGBRBJKIwN2cTE9yhFoRZkL
         MfTyue0eFmc3DHKAUKtgk34qynjf1GBQT5MtMxoTX7YHXqg41yUaS9vyOPhVzjHgUAt+
         xLcIVdLbomP8Nufta18zZzh/PqUeUx3arNgzGew07ftgbAOx5XCtzkGHYUVo7PmnHqUj
         AXdjFQlPkKG8c4XH5XvAmku/MEEJhvR+ymsoypVTYX51qlsY8vtdyj2hx2t8UYxRhGGa
         X1nA==
X-Forwarded-Encrypted: i=1; AJvYcCUEiag4J1W1QhWEdJtKlQp9amQtnI+grFjXNlpM6ulAJIgBBahELjCu+4jdEUadTvb7pv7qvYwGWo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXmCoJ33lkIfAceq517lYIUsAx+rLN5BLSCeIb4I9rKVbAJplL
	Vt4NSCvAU19LDd7ctOyKBMrFFDsn5cO2lupxqqg5r+7mx71HvH0xubxpKJ6Vxh48f12Pe2wIspy
	ucprsVkhQFkKPuFBB531k+WOtKEMtCe6OhKN456v2dfjpleLHoTcjttZqTR4=
X-Gm-Gg: AZuq6aI9NKapmYG1wZ8jc4OsPZUmDcR+A/iPesBRm0d4gqdX63FgFtSUj23jZeZl0jL
	Y4sALMC7n7kbz+ft2uvE/zIoLQMnnPR3ea2c2OM/gI0l9Ar93QXB/5TJ0Hmx/vrO6zG+YbCUAXt
	Ff1+hv7tGHi5PCF79wJRb2hfZVTGmPMKohkxSDIl7eLbSG/uQ+/iqXh5eWD2Om9l8QJsp5/RxGd
	ogM2QXT7GH0oyS/KfZxFq8/Z02jLzBuVKnBE35UQl34y0x5itBTBJkdOqI/iin5+9u6Pz7ZOiLi
	DVfnwtmfj68R1gOeSnsKZjMVisKLiuXEDMQ3vw==
X-Received: by 2002:a05:6830:a91:b0:7d1:582d:71db with SMTP id
 46e09a7af769-7d4d0c78d66mr9823002a34.38.1771383057832; Tue, 17 Feb 2026
 18:50:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
 <20260213-tcpm-discover-modes-nak-fix-v1-1-9bcb5adb4ef6@collabora.com>
In-Reply-To: <20260213-tcpm-discover-modes-nak-fix-v1-1-9bcb5adb4ef6@collabora.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 17 Feb 2026 18:50:21 -0800
X-Gm-Features: AaiRm51w0llI2hakzyR0CioN-FDNIJLwa1vJwEETWYlCsUPSaULMI_fKY8tIA8w
Message-ID: <CAPTae5LvoGfXxvtHX7U2SaHVnmn-ESVqwxukrVga9w_9ySoX3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: tcpm: improve handling of DISCOVER_MODES failures
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33423-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mail.gmail.com:mid];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Queue-Id: 463C7152BC3
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 11:48=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> UGREEN USB-C Multifunction Adapter Model CM512 (AKA "Revodok 107")
> exposes two SVIDs: 0xff01 (DP Alt Mode) and 0x1d5c. The DISCOVER_MODES
> step succeeds for 0xff01 and gets a NAK for 0x1d5c. Currently this
> results in DP Alt Mode not being registered either, since the modes are
> only registered once all of them have been discovered. The NAK results
> in the processing being stopped and thus no Alt modes being registered.
>
> Improve the situation by handling the NAK gracefully and continue
> processing the other modes.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

In v2, dont forget to add "Fixes:" and "Cc: stable@vger.kernel.org"

Thanks,
Badhri

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 40 +++++++++++++++++++++++++++++++++++++=
++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index be49a976428f..88cc27ad9514 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2329,8 +2329,46 @@ static int tcpm_pd_svdm(struct tcpm_port *port, st=
ruct typec_altmode *adev,
>                 switch (cmd) {
>                 case CMD_DISCOVER_IDENT:
>                 case CMD_DISCOVER_SVID:
> -               case CMD_DISCOVER_MODES:
>                 case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
> +                       break;
> +               case CMD_DISCOVER_MODES:
> +                       tcpm_log(port, "Skip SVID 0x%04x (failed to disco=
ver mode)",
> +                                PD_VDO_SVID_SVID0(p[0]));
> +
> +                       if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> +                               /* 6.4.4.3.3 */
> +                               modep->svid_index++;
> +                               if (modep->svid_index < modep->nsvids) {
> +                                       u16 svid =3D modep->svids[modep->=
svid_index];
> +                                       *response_tx_sop_type =3D TCPC_TX=
_SOP;
> +                                       response[0] =3D VDO(svid, 1, svdm=
_version,
> +                                                         CMD_DISCOVER_MO=
DES);
> +                                       rlen =3D 1;
> +                               } else if (tcpm_cable_vdm_supported(port)=
) {
> +                                       *response_tx_sop_type =3D TCPC_TX=
_SOP_PRIME;
> +                                       response[0] =3D VDO(USB_SID_PD, 1=
,
> +                                                         typec_get_cable=
_svdm_version(typec),
> +                                                         CMD_DISCOVER_SV=
ID);
> +                                       rlen =3D 1;
> +                               } else {
> +                                       tcpm_register_partner_altmodes(po=
rt);
> +                               }
> +                       } else if (rx_sop_type =3D=3D TCPC_TX_SOP_PRIME) =
{
> +                               /* 6.4.4.3.3 */
> +                               modep_prime->svid_index++;
> +                               if (modep_prime->svid_index < modep_prime=
->nsvids) {
> +                                       u16 svid =3D modep_prime->svids[m=
odep_prime->svid_index];
> +                                       *response_tx_sop_type =3D TCPC_TX=
_SOP_PRIME;
> +                                       response[0] =3D VDO(svid, 1,
> +                                                         typec_get_cable=
_svdm_version(typec),
> +                                                         CMD_DISCOVER_MO=
DES);
> +                                       rlen =3D 1;
> +                               } else {
> +                                       tcpm_register_plug_altmodes(port)=
;
> +                                       tcpm_register_partner_altmodes(po=
rt);
> +                               }
> +                       }
> +
>                         break;
>                 case CMD_ENTER_MODE:
>                         /* Back to USB Operation */
>
> --
> 2.51.0
>

