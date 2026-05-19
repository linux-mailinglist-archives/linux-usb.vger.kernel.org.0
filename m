Return-Path: <linux-usb+bounces-37738-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANMxLRDDDGqJlgUAu9opvQ
	(envelope-from <linux-usb+bounces-37738-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 22:07:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD165847B4
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 22:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDFC43057D42
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022553B813E;
	Tue, 19 May 2026 20:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nDi8JorI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418FC3B3BEC
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 20:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220957; cv=pass; b=J4xl1jxXQkMxhLZuVH+5fTfBKa0SwU1ptXTn4hUY/z9A7wtdofrMjaH9hMpN8cJKQe/lrhxPWpdcPuqG6f/0VeG4WnzHhcbYlpMrZ+usS20d1vCzvCjN7flBq5Ann56FHdlH6em9HFX8HEdyXqDJhN/g96G46PiYNmZlTv0Qa44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220957; c=relaxed/simple;
	bh=UQNRI/OInN61AnvAUcG5idpcvrRspB+il6WnfYD8G0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUefKYz/zaq3807xosd0C7Far7zq7ayX8coPiYvF7YGzvc7FMalhVT90Ucm7/JvASXFr0P/RKTPhv9hsrZn2OrVJTk3BsII/dhcZ9+q7mBitnuSpGe3W3+mwvNR47i4P/VQujBU5KyBdwYlXWNNRyZhJeruUoVugAUdn23ArnAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nDi8JorI; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3699cdeec05so1483515a91.3
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 13:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779220955; cv=none;
        d=google.com; s=arc-20240605;
        b=Pgp/LCzFrsh6jpVETZt+teQFH1bq9RD1//IB+IdbcJXA6msQYWi7VrVe/R3/KV/bCQ
         zpGaTHe5OnyBIbHqn1NTgEY3SKPVrOyHj9G4d/gvRJL4IkE5gnRQU30sRogdk8XqWnYD
         VJDjoY//v6hEAxFi18mf0m5o0o72bVWU5rNdz8N6xRNpoWja3bNUPevHEH03jiZrJ7y+
         ewOR3+T88UZjjzhSwYeG8XJZjS7inBsl6/ZU33H0yiFOd31YQrwbAhXA98cdNQddlz4L
         ULun6ZgHMjTGcbbdO8hnGAgeoKdLxuVO8uIlOX5FUS500/OQFai45STYB5jAaubmvIpb
         0CkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XSjdKUE/H4RdHwtqiKwpScd4TrAnwL1Ddyd+krGT1dY=;
        fh=uJxknxKIH73SJrj9TL26D4f15zp86wCfW+LzuyntdiM=;
        b=f5aRFTBIePtLRaNlrZG16/rIxLcM17DKG15ThT+E6HuLrsY2Zz9CyBblB+gjm6yUZ5
         8lSFRgR1Ks0KDtEtDwfjHgT7exwt56V1Db1Ligs8K87Q2m0MkJIm5vjVBqurRUz7ZUc5
         PO5ruDauAIgYqE545ccoNNU4LQhuOnExHbFGc8SDeF4CD02qzf93qRfCvFqd9rhcUshX
         9jvqDPM6BOeyX8iFdAZaiiVkBSUb8eRS0l3B2GW/OKl4hpd4PopS2cIeYvI3tAkliFkH
         Yxvryrcogzcv0BBwhCOxYh8qEb5rhkDzAYadfWrqF+W5mluodHsz0Bk91cOV5YYeUg6+
         f/pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779220955; x=1779825755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSjdKUE/H4RdHwtqiKwpScd4TrAnwL1Ddyd+krGT1dY=;
        b=nDi8JorImwRbJcX1FppZlSGsm7kL+aR1Vq1oD9dUmrLFqaZOZwXaAr8WJT4mwKuDuP
         0Vwv2QU4iSyKFWgp6aSSKqYrwdYXiGxIG9wlX3truNrA1ZTUu5WTb0FGIU5sHnZUWZCk
         9ZfQqlYpoPvUHktQ9bAe2FwfNrnJD/7gzPkjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779220955; x=1779825755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSjdKUE/H4RdHwtqiKwpScd4TrAnwL1Ddyd+krGT1dY=;
        b=IWejmRQAzG38P1IUrRSl+rVBU6HNQEMgKQqJSOJcXUHyNa5IXprYRl0FfN12AD/mfU
         sCXhSFv98MwtpeK4cD8wzUKmdU63rtC6RZ264L693SCi4Ky+8MdMX7ClnmXVuHaDNHgF
         sJurqhG3cKy0hBnCudkyyvCqeo9w18zRm5pBI5/2KCoKgX5LgTDjMFoK+bXU55DpwfE4
         evTX0ua/uJpb96K/WsTk5VcCo5MbuWvM3jGM1iZn1yhC+hO6enGLTkkcL8uXCVl9Xtnv
         LnTPXHaqJAj+awQNMIDC/dWmLTlt5EHJYseJDp41kQX6IwvEm8WPjOZkkR4JCvTNPBQv
         yQdQ==
X-Gm-Message-State: AOJu0YxajnVvK1mPSJsJjXO7AWX25dxKjofjmyH1VEdkSc9UEkzb3S1W
	gbvPg6YYEogBfqGv3EhGz7lW1/oY86maFJLWKc3tRKSLpSNEi/c/dd9tbnV7ooa6cl8uC+JtVJf
	3jh1mXBHB20yn9xmm6mjh1/f6Gt6DfXIf85WE9zqs
X-Gm-Gg: Acq92OE7vIBnE56AOFcTKnLIzZ6l2dUE5tiQmNPIUAPi+WxDfuHaPP1vOMILui4SBtO
	ootpK/upPMXXUqk6IIR0KNfi8l8R8Ut2aGlaRH73wKRTGfXYcq+InEk2XRj+xlJcval9yJucd2y
	xVgNc8456zLlhLQ/sFnpKmOucp2NzRP/iIVVbhonGMtZDixJ6DbBl/9xX/O4jbu1bBTx6Am7ccq
	/+ZBpbh7GJKiT0wRpBm58lJ43a4nUhsxys0ntGKZLNuMyLOcGHKOo0vfFeA7GeKbaUQlNX8s8ct
	YS6ed7bQVyEjIjXeiw==
X-Received: by 2002:a17:90b:58e4:b0:366:755:6fee with SMTP id
 98e67ed59e1d1-369519ea265mr19252900a91.12.1779220955583; Tue, 19 May 2026
 13:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026051347-clustered-deflected-9543@gregkh> <2026051351-vividly-flattered-eb3d@gregkh>
In-Reply-To: <2026051351-vividly-flattered-eb3d@gregkh>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 19 May 2026 13:02:19 -0700
X-Gm-Features: AVHnY4KGI_1xuawtal2DP3REUfhGEQWHlmbhygfhIo3Aunnq9PbKXTiUT1Zoiow
Message-ID: <CANFp7mXTfjHoo3z==6L7egG7AV6AwxuTMWOzULmfNo4bEEsV7w@mail.gmail.com>
Subject: Re: [PATCH 7/8] usb: typec: ucsi: displayport: NAK DP_CMD_CONFIGURE
 without a payload VDO
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Johan Hovold <johan@kernel.org>, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37738-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhishekpandit@chromium.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,mail.gmail.com:mid,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 1CD165847B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 9:01=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> ucsi_displayport_vdm() handles a DP_CMD_CONFIGURE by copying the first
> payload VDO from data[], but unlike the equivalent handler in
> altmodes/displayport.c it does not check that count covers a VDO beyond
> the header.  A header-only Configure VDM (count =3D=3D 1) would read one =
u32
> past the caller's array.
>
> In the normal UCSI path the caller controls count, so this is hardening
> for non-standard delivery paths.  NAK and bail when no configuration VDO
> is present, matching the generic DP altmode driver's existing guard.
>
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Pooja Katiyar <pooja.katiyar@intel.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

> ---
>  drivers/usb/typec/ucsi/displayport.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucs=
i/displayport.c
> index 8aae80b457d7..67a0991a7b76 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -240,6 +240,10 @@ static int ucsi_displayport_vdm(struct typec_altmode=
 *alt,
>                                 dp->header |=3D VDO_CMDT(CMDT_RSP_ACK);
>                         break;
>                 case DP_CMD_CONFIGURE:
> +                       if (count < 2) {
> +                               dp->header |=3D VDO_CMDT(CMDT_RSP_NAK);
> +                               break;
> +                       }
>                         dp->data.conf =3D *data;
>                         if (ucsi_displayport_configure(dp)) {
>                                 dp->header |=3D VDO_CMDT(CMDT_RSP_NAK);
> --
> 2.54.0
>
>

