Return-Path: <linux-usb+bounces-37450-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE/DCntFBmqAhgIAu9opvQ
	(envelope-from <linux-usb+bounces-37450-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 23:58:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F4547446
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 23:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84E9B303594A
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 21:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385213D0914;
	Thu, 14 May 2026 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MEjcWrXs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC43D0921
	for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795770; cv=pass; b=q6o9fc1aAHqkvf0qVLh98gjmHs2od83CA9x9ZBqSq0QyAZQ4bWz5FALM2Gt8t48Q4aiLaEO5I8hI46Mh4Ngznv/2wf0YqICiXXzq00QnNCfbzleIq3+9/zqZUZIdPFCubBnOyiiYRp0g0TDSqa0kFfavFeBYpLdnf4m8TzDo06g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795770; c=relaxed/simple;
	bh=6jRXXlUq7WP8t/tLXyrUY/I38mV7MiJG/1POf9paE5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqDrin05ky/Vh+nx8hpY/X9YOuMib8u2emvNd7Q/KCZKV0F+FAm3+WESGeotWrPlFNP/1EONfae3xV2SJ76LKPErkMqYLPsmNZoRbeWDIrK52KUb4ri5515GRLzXXlFgX1vokeJBicDJx4HdyITwhn0RXtANx03oRb/HIVEDhm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MEjcWrXs; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-439712b3416so1732062fac.2
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 14:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778795768; cv=none;
        d=google.com; s=arc-20240605;
        b=d04z34xhr3iPAhySX6pGDXjq8lcDyircsKVlLmfbZamcHI+G/I6FcvJjzb7II5pNFM
         uWg8n0tg7nYzuxv6rGktB2ZZjxwzIFJj2itaxoLOhceAuGe1d1ebJVgCxLScg/9M8+TB
         0PSGs5q6+KUdyXubtIzzDbyePsKbpU16r8kk1e/vwY0oYcNE6ndqbWz6u6t4D6IMD02Y
         V7RM1xtfTtA1XG0RIJDmTDvzWdP93F+ay+wW8EGIPyNB240bNuW9+YxqDkIgBTV5xl3v
         vEtfvf28VsCCbjlcFC3+A1jrUkHH2lU16daUM0E8aGokR51MzOSAxMQ1MeSGhKoQPNnp
         8f/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FPK7WEylMXoSdKmV2G2dAhl9x6nJNsCePGpqw9ReIY0=;
        fh=TdA6/7x1xdw4RBSkJtvSpojpIff9RX3pZ/ghIz+ETfA=;
        b=RPfn83z8O6Szj2LNboEjnKTDzM7UVvYfRveA2MB/5QNRXpr85YIET06QJwubfzzgK+
         kZPGJ1vNc0BPiwpdCl2iKhBHkQImfNdyp4qCKrFKzjPPpcjX3K84J/KIY0aQmYRm4COi
         1Rjnf/KJrFVH385EzCa6FzOJoxm5H6nldnQBWq5gl4XmmbzHuizZa5S+bD2mcP2lxb2N
         p06RjyMWmpHouzqK2+IaXlqPN9A8fSn2PoxOYUNSOntL4FChf5MbA/eeuqRfJJAhoBzS
         iDiZ5/oEiVKsAGr8LbxZTpz1NX5q1mTmMLzERQnx+B7pcaaIKFuG5BlUCKJkw71r5JP6
         dfKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778795768; x=1779400568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPK7WEylMXoSdKmV2G2dAhl9x6nJNsCePGpqw9ReIY0=;
        b=MEjcWrXsa4oUqlc/G7zeS64Ne0uLiUIdNu8EVborXVtXIrX55FGGiljhQU5olF9GOL
         jhIJLGayKyN61aLbB+1A1OvI8JjFNsmaCubsCW/LwJT3ohai1bJoXpk9NGgseiUk7mit
         6Mp5vd2l7Q6h8FPD/npR7nhVYyEutdbMi8ffHw661ZGce4BoWyRcxfRAhz+gLJ65x1R7
         nmr4Ww17aH8ZKQQY6MEC9Rh2i8RerhI3kU/Nc0IbQywS11G+tiHd6sX/DafPOhXDiaT2
         fj9nTOxVdcwhDs0VjPZStjl49SygbYgveTkzQ2vVWqk0WuljH5QtyFhx06HNmnn0PCvs
         irCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778795768; x=1779400568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPK7WEylMXoSdKmV2G2dAhl9x6nJNsCePGpqw9ReIY0=;
        b=qqnsKMjFj/6FfohRdC9KwAX2sJk2NGnvohkTRmGlpwx1uh/n0qWs7Wo5+p9Tqq+0vI
         kmk/YdK5WtIBqXrmaClcRQ5/Nz6F+KOG6wPyUfrItEr/sq4g2Fhi5jU95il3hRQ8cLXO
         nYdxu/Um80JuUuPlspQk4Y6x1TRD8kFwZSE8DzgA+SnmhbAnhMMbJIQ21XjGrmf27U9m
         v2OWJkTqyexFTfHDPFPjMQ6AUiRnnrlBSh5oGcAJC1zYffUBzw352M9UJKyR6T/l84Xc
         9m3FhxZIJf6/5ZxzPyjnIkV8UrJAZ+Jnq+bqIkqV5+booCmDsST+TpHvP0s7ZLSAk1H/
         qy1A==
X-Gm-Message-State: AOJu0YyALLzCXDI8gZ0K6oRBKi+pNBo8CDmFnAyUKXQXbaHmFYP8tRva
	d7fnVTLtMESYjfZfDKWKPT4kvukXNJUh9iTQ5LEEmjzJNAICvC8X2EKuLL52AIi7HXkI5e07++o
	vhIL/fJERWlbcrlpbsekdFoECW1tOmEJ1Jj091egB
X-Gm-Gg: Acq92OEuLFjVDx5Y0xb1UWI4n2THA9GgaAF1NYUUThrehT8x2hzIXX4e9+PmB/BR/G6
	xZCWGDW5Y+JStDL1ewCOXFX+u+74Tu1KWkPVvereBQ5jDGg+yrU5lGE3AMAKMmERYcV4XLYZdPN
	iYTv3OkyeVYk3J5/IRFnVYMV+jhWswlk6xAaRQGCdLMZzIDWL4iJIvw5MmjY33j7rRl+kOtAGst
	vncdqxfx7htEfHUMgqEmAcZ4T+lmCt5LVhHrSME5qAhu+RZz9La8IpKAYGTEee+f3fTT4db5pqj
	W03zGf0JT2EfXMrDge9x9Pr/ClPFbvxwX3+Uf+ipoeS6A7Br
X-Received: by 2002:a05:6820:1a0d:b0:694:914a:ebe1 with SMTP id
 006d021491bc7-69c9c020cb4mr762221eaf.47.1778795767794; Thu, 14 May 2026
 14:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026051347-clustered-deflected-9543@gregkh> <2026051350-stimulus-cornflake-d7ae@gregkh>
In-Reply-To: <2026051350-stimulus-cornflake-d7ae@gregkh>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 14 May 2026 14:55:31 -0700
X-Gm-Features: AVHnY4LGuHGr-0W31-S98Pc_IYcU2m82Bes4D6BZvKDgv3ghi1cdiTtDlD-cMII
Message-ID: <CAPTae5JNa=LxRr_FPcgsVP9CkWRy6Sa8mFiTTsCHppQkqQodBw@mail.gmail.com>
Subject: Re: [PATCH 5/8] usb: typec: tcpm: validate VDO count before reading
 Attention status VDO
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C43F4547446
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37450-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email,intel.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 8:53=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> A broken/malicious device can send the incorrect count for an attention
> status VDO, which will cause the kernel to read uninitialized stack data
> and send it off elsewhere.
>
> Fix this up by correctly verifying the count for the attention object.
>
> Assisted-by: gkh_clanker_t1000
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 44dab6c32c33..2cab74ed71a7 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2639,6 +2639,8 @@ static void tcpm_handle_vdm_request(struct tcpm_por=
t *port,
>                         }
>                         break;
>                 case ADEV_ATTENTION:
> +                       if (cnt < 2)
> +                               break;
>                         if (typec_altmode_attention(adev, p[1]))
>                                 tcpm_log(port, "typec_altmode_attention n=
o port partner altmode");
>                         break;
> --

Hi Greg,

While the `cnt` check helps fix this specific case, I do see multiple
other instances in the same function where the validity of p[0] and
p[1] seems to be assumed (for instance calls to
typec_altmode_vdm(adev, p[0], &p[1], cnt)). To make the patch more
complete and robust, shouldn't p also be initialized to 0? This will
prevent leaking uninitialized stack data in those instances too.




> 2.54.0
>

