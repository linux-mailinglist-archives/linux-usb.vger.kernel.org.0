Return-Path: <linux-usb+bounces-33422-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC55NE0nlWnRMAIAu9opvQ
	(envelope-from <linux-usb+bounces-33422-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:43:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38261152B8A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CD1930459DD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 02:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504782D0C95;
	Wed, 18 Feb 2026 02:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aamI38Xc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FD2222B2
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 02:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771382592; cv=pass; b=e/pI5Q6E89J9Q9lqFpIv+ibCvWgbIq+aHhGNj6gQdIzzayMSKlnyCqvQr5DwBnUHwnYkBKjBTOwJ4VUO1RfkOzpr2A/RtLtzFeXhkrFDRvTfieb1jkHr5KXyK8QYdO11mn0579Kypf9PyEuEF/dDhUfg/noIjMQqNMOvdZTNWkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771382592; c=relaxed/simple;
	bh=bf9U4dcMThyCLiYfx9nJCbr4wAYbj0xIYb1C40Zyr9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbG7etqZLslg47r4tW//ITNsCLXEcHDOa99DrL9PfoRXKkXztYHOSyFgzRSmbS3nszBN1AjJoIwmVv1MetBY0gp6Kd6374PGsMHllGtfx7fnCPALOA7/jlVlY5A+rky8GEcYO543mc00ZAX4HTpId0DshR5q45qj/kqT8Swzppc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aamI38Xc; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-46391e91e16so2912389b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 18:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771382589; cv=none;
        d=google.com; s=arc-20240605;
        b=jUtgktS9J4mZPYk5aLL/+ZE7bGyDWAvLdpHKb3WtAaEyLRLSobuzGAV5LnRl3v84Ce
         IXaqSEkOpH2GGp+GZGiagy6GnNwyfR9ezcPAnHJJP2APn0KIhijPnj5TnoYGXSv/AM/c
         tDU2dTFiNAje0DZf3Ze51F3XAQWxwSeKlKfz0cTSAv2fO2YcvDQzq2n1FOHDA/e0qERP
         j9WVK2jE4dMN0pEtExmO3KPkYednlhZlGYFKBzB9SCKecTI4u8aHOGLMzXflj+K2sauG
         nTvIOwHC0EU8ZJllQ5Hb1gTP8u2xs0ZRTWjtIawJEaB6AxZXYtdlSMkBQjF4ViEAVfOk
         jN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48hzASxdKx1p0cwHE/aLnbshp8xR+tBKHU/C1pf65Qw=;
        fh=/SDe+HoWpcRmPKm7a46uhrG4oXyTbsV4vNEZbUOLjlg=;
        b=ipAoapgkT+nfKlw0R6Wc0OAoSHvTpQWNm/mZx+yK1omrsMrcTRM3wChWjRyy6ioX71
         Pgd1v7CAdoyyWAfTe2VlZDuxjNUqOW79zvqfqlOGVmsiFgUusvccZGphIqkbKePWNGwL
         VDZecm9KNxQZmCgvbWO7OL5ktiQ9mBQy34bTxQnvj+F3xbLLkRwanhiNe0qqvi4jK1zm
         XuQ3iUZciYCx+WUMQezCNSH2aN8wAcqI3tNpqEsPZkJnW60vB7I+Ff5HfRhEqDXQAVUh
         r6MILvH2/gFbyEsx/xLO5BgjqPBOuJYp6qDtM2F2zwSn9sJ80t4ypO7WIYkJpXj6h9h6
         7w2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771382589; x=1771987389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48hzASxdKx1p0cwHE/aLnbshp8xR+tBKHU/C1pf65Qw=;
        b=aamI38Xc7yzpCR9uLs0DRAqfF03eXHzXypkBIRzlvgzd+iDmQ4DEgBCYgRAQhQ3OWa
         KcM8SrQBepMRByBjw/mbjNHlcfvbEN1HFob/lkuhXaym3TXXrwSZdItd3/o/rzsVOR9a
         zA6XGwdQVnoP1FpbGcwFfkEkeFGLFCUS7gAMBRoF9nA0GHWJWKFK2i4SVMqLFfTYLpBq
         4Mk5iZSdavdn8YRDx8j9YsUc1ILdqb4eNxFNKZX1ajeH8aoyZRA7QPEbSaPvtOy6E5tZ
         G2+VzmRnWcpqZYIZxc2dpQzQejUGHqDb3zkAYFDVksRACeUQfSWojERW0jFFxe63mTgk
         JV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771382589; x=1771987389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48hzASxdKx1p0cwHE/aLnbshp8xR+tBKHU/C1pf65Qw=;
        b=oqzkWjyhzF1y1P/Zh2EOroufX48Sf/FKlT4WAdPOAuusWIgEJWAdu39McB7b6pGjw4
         VH1PQJZDfdz6Q3p9iyulG1URpBgSn/BuciwSRWxeN8KBqh0c/iHTM6MqmqQNW+7c1+8a
         ytF++RRH14I9RNZywv3UWL4MrK2f1GqG0q/gKD2ukkbERYZkHw1lPwKplt+gTdWXyomF
         +VbgEFDJnb5biFMGqfvbmoojvxC79pBIqrsOU32/WNlAKopEDXyIn6poeAqz523Y8wL0
         rb48ju7SEaGE2MEuLT5dVZI7AWFDw3ICdFQ89d83Hh4vDV0cEuUQuFaApqNXO8HuCWLw
         qo6A==
X-Forwarded-Encrypted: i=1; AJvYcCWqCzphxkZcKsOh9xl8QGSlDX1g71pOB717eHyAH1rMeodrYL6hxW57tskeyjwE+Bd396bip5pu8QE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoEpaQvs8V3QaQT0hJVhpbDVTXUsARPZsGpwOSvE2+HQk/Qukq
	OgzQKYa5Wc8N6t1eGSfWv4MmxezIaz9wywLYAKU1rj2/XEgQJRtBpaKDhRv2fKa+xs9y6Qgw3uy
	oYNFn/aqvYNzwridvlp7z0wAeaU7HZKWZw61XDPEI
X-Gm-Gg: AZuq6aLs+YHakOEycNpzAM4aemR+wjYWLF0gCnSBxsvQkxFTbnAXi86xKLWHs64qtKa
	lt/u2JnUnM85RhHxXCUhgtwn7e4hphs/Z/p1841fI3a/7nJ8HyC3SdTgIYfvOE6+SEQpLgSOmWh
	GDcZkxkC0v4D9yTsUDbIjTB9MeTtoD2RfxJj3bnaPa96YLrl5DqZh3JM9rlnMiDQG1Sb6WY1eqx
	KBfAEIeb4MEYv/LuDgaxoMU8mYYCssYmpkDBLEon5n4h2Q2L0bPLRzY4uzgmD6Sj21te17/whrB
	bLqCIHuBt/98qyOuXeUj1+fcapsjAMsM7WSllg==
X-Received: by 2002:a05:6808:30a1:b0:45c:872a:57c with SMTP id
 5614622812f47-46410d152bfmr299261b6e.57.1771382589052; Tue, 17 Feb 2026
 18:43:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
 <20260213-tcpm-discover-modes-nak-fix-v1-2-9bcb5adb4ef6@collabora.com>
In-Reply-To: <20260213-tcpm-discover-modes-nak-fix-v1-2-9bcb5adb4ef6@collabora.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 17 Feb 2026 18:42:33 -0800
X-Gm-Features: AaiRm50n105qAqY3YP3_ftNAbR2IAYCeeXNXX-fAwsj3v5KKijTofKSwVLEW0dc
Message-ID: <CAPTae5LMx_cOd1nNe1c0bcMGhkpPBeokQ13=57BAd-bFHrBFfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: create helper function for DISCOVER_MODES
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
	TAGGED_FROM(0.00)[bounces-33422-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Queue-Id: 38261152B8A
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 11:48=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> The ACK and NAK response handling for DISCOVER_MODES is almost exactly
> the same. Create a helper function to reduce code duplication.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 129 +++++++++++++++++++-----------------=
------
>  1 file changed, 59 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 88cc27ad9514..dd4e7cd2db9e 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1995,6 +1995,57 @@ static bool tcpm_cable_vdm_supported(struct tcpm_p=
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
> +       if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> +               /* 6.4.4.3.3 */
> +               if (success)
> +                       svdm_consume_modes(port, p, cnt, rx_sop_type);

Can the above two lines be moved out of the if/else block as well ?
This logic seems to be common to both the if and the else branches.

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
> +               /* 6.4.4.3.3 */
> +               if (success)
> +                       svdm_consume_modes(port, p, cnt, rx_sop_type);
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
> @@ -2252,41 +2303,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, s=
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
> @@ -2334,41 +2354,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, s=
truct typec_altmode *adev,
>                 case CMD_DISCOVER_MODES:
>                         tcpm_log(port, "Skip SVID 0x%04x (failed to disco=
ver mode)",
>                                  PD_VDO_SVID_SVID0(p[0]));
> -
> -                       if (rx_sop_type =3D=3D TCPC_TX_SOP) {
> -                               /* 6.4.4.3.3 */
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
> -
> +                       tcpm_handle_discover_mode(port, p, cnt, response,
> +                                                 rx_sop_type, response_t=
x_sop_type,
> +                                                 modep, modep_prime, svd=
m_version,
> +                                                 &rlen, false);
>                         break;
>                 case CMD_ENTER_MODE:
>                         /* Back to USB Operation */
>
> --
> 2.51.0
>

