Return-Path: <linux-usb+bounces-37456-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJdMLK6rBmq4mQIAu9opvQ
	(envelope-from <linux-usb+bounces-37456-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:14:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7045497B8
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 161AC3018466
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 05:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339A63D812A;
	Fri, 15 May 2026 05:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TSod781m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBCC3C5DC3
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778822053; cv=pass; b=gKptLcd6BR0hXrULPdvIDzVTu381Xkbo+YPhbgMEoaUh8yDqLETiELgPGz1TJP+rrTYfGHcT8HMxGY6HhXPp11zJeQlacRm1X3bYMyNAkz0MONPAL4MTzRRtF/TQg6wbbJ9O6hVzyRn+2nUDKx9IoVFNHAvDEYpGv0zff7O6ojU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778822053; c=relaxed/simple;
	bh=0Hr/HWrBph9yrkb3EwjDPV8KtCBWrKjoZzM49F0ygsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVvZfZJIlCyjUcvwg69sRdUcyh6IvdpAKG8CCwFgkPl06lzy3tqqV4+zQwQvrDY3gQcqPdkSUrHvaR38w7JUbY3/ndJfjPjoIgtVND77+ev9Q/b6HfM8bFMDy/03e2zX+LMV8+x7l4V6wuGCyD4VKZM743pa8MnNbYxKam2Dzg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TSod781m; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7de7c57b52cso7081729a34.3
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 22:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778822051; cv=none;
        d=google.com; s=arc-20240605;
        b=MzcC+NqI+Iezk/RZQ5BJ7RrVH421g5GzlvaQGOAFjNBiNdIniygh1s4E7LAVdXjOYJ
         +ogII0LVE3fJAJ4AVRXe1XqF9t/DMxN3/eZ39pbg+d54UraTpPHOnFH/5Q5NRYzhexr+
         KuJZwdPhodEP9e1B3hp7d71QJrrH7ziOqAtjVyj4T3uc4Vr2KIaACNJo2c+5hgfTlIiF
         FeOwsSuSr4PNgplFxF8ZBDa8K2v8ctOf+qoLz9iwN2EXevecxGq8/hvi0lET3NcfzhwY
         ZrLcucrUc82j1RiWu+PYcya3w6Di8iOVphBjV83EHxvVEUhQ42ivsMHyC+cCU2+ZqPA0
         dieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G3dIANZ4aFT6S3zSRBVQ9ShZn8S6WLuxcizHOjCqjwA=;
        fh=TdA6/7x1xdw4RBSkJtvSpojpIff9RX3pZ/ghIz+ETfA=;
        b=LDowPFm19/ugE4LzfDDrsqF1S2iOvA0NefFtDhhpyxDFVk3ZBggPWBYioJ+iCKH7gR
         lLSsnmPcDguu80GNW2SN9PzL5O7Ti2RyjavFYnE0q+nqeoN0IoAJ2Wai4CoiUh8p4iLx
         8vqP001YhO2YeMkO65981unXjKfI/+SG2mQuprxYR4Ll7tm28x0JjVHYsB688S85jUga
         AtSAQoZzjFMyFhaoNT6vWMXBZx9Lgy3Mm/Fm8+iK1Yan/77mqxuIbUerW5kpK4/pIg+m
         /Z2HFnIsbqoT5DgZotBowKNwpAorqfRl8WzoVmAyzqAIw3tNy+wABW5pQqzR5v2wvFX+
         ZsQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778822051; x=1779426851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3dIANZ4aFT6S3zSRBVQ9ShZn8S6WLuxcizHOjCqjwA=;
        b=TSod781m5sPzMMXOaI09ZVcnjdJuCsAynkmk1PhKNqxl7gbb19FnY5w29t0ZpbFyJP
         uS7h4Hl+henFgy5p6aobzggEC1kgu/YOB8xpnWhMutNxKwqOoV/KkwdIb8Iqc7xxcXtE
         sXh3yiMIXnNLciEvD1mHZi3iQs6BV3QvqpBE/GqqSO35md28CVwrjPWqhQ+YQBUB6+gH
         vtlAba3ngtU+MoyUOrR8f91tXUH1eCfjRApZsZBkpzh6aGQrvYr062PZMf6/NxaYLnz3
         +0u2G7tnv3AWUMnHyGTEQAVkqBLQjJi9wTPhApCu+xDoUXQbDsOvF66Nk2eIm3mNbCDa
         OfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778822051; x=1779426851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3dIANZ4aFT6S3zSRBVQ9ShZn8S6WLuxcizHOjCqjwA=;
        b=XofnfX/vOkexIbxueRypEdqPmB8C0j/kfWLsrYg8n3X0LaDB/sX0tW6JD1/tgNxOvt
         XvjKizfYncavlJ5Ht4zN7kob0MmhHjIQ2nugSI1ngNNRQG/VWWDQzmvTVA+hlIS1n6YV
         KSBiQhLoE0fDT/r7YkI8UrRvrFOlnJiZzcouwrEy9L7Fgg4MppS9wxJkdUYyOb8l3+um
         1cC/6wfic0LXT+/XVtL3OuIW8ANkJX6OQX9T06lewQhlI2I7KmaZ7zu+8uM/kdQJVTIL
         Ya3a4PRGkIVR2MRZCwSV+IagVyVuJKjQBfwwsjpFRKyLDBlmszzSv7NGdyURN//Ut2RY
         G/mA==
X-Gm-Message-State: AOJu0YzJsxjFun6I0zUGl69n7BO9g5cNDuZekaVjq6dlJzGk8SFnIDM5
	9vyTFZ+OKINmRmIuEzbUrh+mrzvxJ0k9+oESXUWHPzvhaIKTUlHVMN8d2RpxFToNp20pX8oBW2+
	d3G3GeHrjuZqfQFJsoHa8xYj7LOGGhqGiD8hMgiok
X-Gm-Gg: Acq92OGL+3Z3AUyYWb0rMCWSXMp5uMazyvurS/tAZQcp3das8CThTjFq63rFnqigWfe
	VbKSU4RVzo/Bvv/XjDQuXnw4/Bygjz9CpSpawM/B7FPIeed0eIE1IwJyAqpPeVYbQU0EdmqTgj8
	oONGLFdnC3G5EZXcvxA/YYsHmhmioJ7xc8wnG6mzrMAJMJsTooRQqM576HvfIhseG8wbDfedHtr
	6MLRHUQUfT4o29vzaedjE/AwjPzWPbPGJYoa3e0Fkey84K4fSfQFSn17M/WMzzYcQgS6Pvj89AY
	axkNaPxhcUCuF+tJNEJmmqH4c7RFkZpj61ORv1G8SPTkvYJQ7ys=
X-Received: by 2002:a05:6820:16a6:b0:694:8bfa:7819 with SMTP id
 006d021491bc7-69c942c4ce5mr1597774eaf.13.1778822050737; Thu, 14 May 2026
 22:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026051347-clustered-deflected-9543@gregkh> <2026051350-plated-salute-0efe@gregkh>
In-Reply-To: <2026051350-plated-salute-0efe@gregkh>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 14 May 2026 22:13:33 -0700
X-Gm-Features: AVHnY4LgRc3wHEkUPTsm9y9A_dVefQ6vusBPcEsoGl6LSEXYfCnJRnWNec1jsoQ
Message-ID: <CAPTae5JhhCr+W4xUBWcbrS7j4_BZ9SCxdEbn5quAD5aP7hDx8A@mail.gmail.com>
Subject: Re: [PATCH 4/8] usb: typec: tcpm: validate VDO count in Discover
 Identity ACK handlers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AC7045497B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37456-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 8:52=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Properly validate the count passed from a device when calling
> svdm_consume_identity() or svdm_consume_identity_sop_prime() as the
> device-controlled value could index off of the static arrays, which
> could leak data.
>
> Assisted-by: gkh_clanker_t1000
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 55fee96d3342..44dab6c32c33 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1855,6 +1855,9 @@ static void svdm_consume_identity(struct tcpm_port =
*port, const u32 *p, int cnt)
>         u32 vdo =3D p[VDO_INDEX_IDH];
>         u32 product =3D p[VDO_INDEX_PRODUCT];
>
> +       if (cnt <=3D VDO_INDEX_PRODUCT)
> +               return;
> +
>         memset(&port->mode_data, 0, sizeof(port->mode_data));
>
>         port->partner_ident.id_header =3D vdo;
> @@ -1875,6 +1878,9 @@ static void svdm_consume_identity_sop_prime(struct =
tcpm_port *port, const u32 *p
>         u32 product =3D p[VDO_INDEX_PRODUCT];
>         int svdm_version;
>
> +       if (cnt <=3D VDO_INDEX_CABLE_1)
> +               return;
> +
>         /*
>          * Attempt to consume identity only if cable currently is not set
>          */
> @@ -1898,7 +1904,7 @@ static void svdm_consume_identity_sop_prime(struct =
tcpm_port *port, const u32 *p
>         switch (port->negotiated_rev_prime) {
>         case PD_REV30:
>                 port->cable_desc.pd_revision =3D 0x0300;
> -               if (port->cable_desc.active)
> +               if (port->cable_desc.active && cnt > VDO_INDEX_CABLE_2)
>                         port->cable_ident.vdo[1] =3D p[VDO_INDEX_CABLE_2]=
;
>                 break;
>         case PD_REV20:
> --
> 2.54.0
>

