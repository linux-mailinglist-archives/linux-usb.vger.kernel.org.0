Return-Path: <linux-usb+bounces-34161-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMCIMiUoq2lhaQEAu9opvQ
	(envelope-from <linux-usb+bounces-34161-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 20:16:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 305EB226FD1
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 20:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFB0F301CCC1
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 19:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2332D8DD6;
	Fri,  6 Mar 2026 19:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6mjE6ZM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F325A2C9
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772824597; cv=pass; b=QoCXmE9LiyKJXm8Uz/NpjQ0u3WQaX3i8/YvGyxYl2OdsFGUADWOjb90Uknqm9lUPP6IpvTrvdBr04X+/8fzGx+1BlQskAk107ASlBnk1VFQY0DqmmWJ2enu0WtZqftNpyOpHaJVWZjthpfWCuEydYV0jqqwvErrSqMBCuKHQu2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772824597; c=relaxed/simple;
	bh=9g511vcaQ68wgb3bgfddkmWSMclMBk8o4icbii7da0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NrUDY/+a/rqslPrqD1tSYxaiRTcJioA1vkX5XODzDWbr1Jqj0ZZAfbuuQ756ZrUPPQdxx5eRsMkH2Z3yNu3tW63G6aQghyyGj44rdfVcFGpILKbi4CQJltMGBtC5IIaV2zZE/2Mop5EaSGkHlqUbKImQH/xARZFuWbIvGxVDg/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6mjE6ZM; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f9568e074so1626305566b.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2026 11:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772824595; cv=none;
        d=google.com; s=arc-20240605;
        b=GRsSabxhEKqGZWxkqPQqwT+wNRc2cUoq+UqFYIHOVartFAGAJgr3zfmB8cKLjAqdnZ
         mcrpvtJ8o3QJgnwrH1if/aGl11qIp0VJ6vHnrsduRkso0uSvcqFgM6sXpvvA4dBOYqXT
         nPp55ME5VuXFu3yOtWoNIMpcXmL9yKlFsEPgbD5o2RJXEEU01hmJL1fzMM3waENN8zlX
         hIWEPRtZ79UoYiKLQJXgzdZnk3uIUu7LPSrGDMf22CrTb1mZEmruvwnBh/F/wICphPo2
         wmwHDEVHDItH3fKHggSyKvvyQTF/n69ZxUSi993HS8kTU/d6PEL2YG30WoxDQeH2M5qX
         bAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RQl/k7H5TnGsHgAzmX0qeb615hkvz32yF+5OyK+sVKA=;
        fh=Z0P26Pv3h13WFpd/3ZF9oAAxRdevk2u/gsaVD0BbWrE=;
        b=M3Sk1hCEMJ0ASgMc3lrEBfs88AZT+NFQ675WRLVHwVoMGE62zQtaXjn0LLDIyTC5dP
         4JW+rHhzqpiD2NeWmodk7ABOXssjhlDssUlRMCgD68/3U3HaBkOLrFIDFgmH1IhT2BWK
         kHGi054Sgyy/eyr/xzLKDuRmIDyD7acVRGXDT7TVJ9sAvRQiKVGe8cHfCwjWo/ecHKAY
         b1mJr0RaPSiELJHFTdlQ/gbg1nOhUGUsPRhn+bKgC6qHamuDihbwYotf/7q7ej2uq9uI
         AyNOS4Axw+vMkfS2eEFsrmQ0ahTXbqT9PbQLiOLHl6uTChB2a8ShKfos9+IBSV80YdIX
         9bSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772824595; x=1773429395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQl/k7H5TnGsHgAzmX0qeb615hkvz32yF+5OyK+sVKA=;
        b=i6mjE6ZMC7PD48yo7brB/zqSXwNRdoR1wsPtOWzGWet9aOJ196OnPx+4kJFKVQ+JIF
         RsTHSDbIipZN2D1jYUGdWZMBaqKFn23emJy1x7xHzjX/Q89i5uDNrTJCJGWmFMntKP4H
         oGkOnC6iRl+TiGB8dKXE1x77kh+3RFHnRI7cf9gMax1cxzqLuzgKUuOWRA5z9fHHR4/b
         msavt7vfEq5TGW6FIx6VVWNaxW1A/l2GpTw+TxO2eBFeASI6boTTYPOnw5+mCgYYdENc
         kMVmSikK7ShXQxVb/T1vCMqwmJjWzdVkl2z2j3vQraZQ48EZHn6Fk1ZL98vC/TA8tBTm
         RUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772824595; x=1773429395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQl/k7H5TnGsHgAzmX0qeb615hkvz32yF+5OyK+sVKA=;
        b=hQWqX4dDCwu/LMw6Tv9UhbOywzhoqHiMkZK8eqq3eMk2e4VBqeeCGOdvUBP8KQwsRL
         er2wJQ88nMWsXiS81mXeHGgxdZ20+Peol8T7+qrU/2cex0DpD/DGsb18DVZv5zc4MO+h
         SsSIBpYQN0n16IfBq1LCKQay8nfEf4HfjJf2EHQ+bbv1f7+zpBzF48rpB2SiR+bipW4F
         5q7WhKPtxRl1YRND+LIW+O9sOfXg5K6xy0aJpa7IkW8batAybqeB/bggFecReIXZEi5g
         zdgXKBpCzjktXRNRbJuAGAPRb+N23CMZ5UQccuje5DDxyR5+h8umbq9fNIifisVmIOmV
         rB9A==
X-Gm-Message-State: AOJu0YwDwFE8NOqrZzKXJs6uu/UyLSFXwFTdsT9jKMSvOQn5a8DxZBUX
	p1Wm0/pYrFgqTar1z5HhsMf67vqIBmDHUIVCxb9ow2E68xgF9aqLIxNBrHUOLY+COYhpAsjeoCn
	Sspt1aP+RyvLx2XK9zxTT0KI9y0xXXaM=
X-Gm-Gg: ATEYQzxrz2VUJ3dt2XLwWjpJWunBtJI9l0DNQkvJiLhNnObExm85emoXZD3UTTVs7HV
	IB+sAzbhdr3YpAeJwJVcjU5drAM92oZ0Rvn6EIT+sEGaN0xEbusV9i4DeKhA15JE4/krSDvq4YP
	xHQaP0OpxrIKVES2XwkLMBt1u4KEzEvtXWFZ0e+g+0zMWTK/EzQnaId2CEp8KyZ+snDW4kIuk1Z
	uR0Nl7kmQEVEQiLXP82wN0FP19YtgnCVV7o+k+TbNu8kuSpr1H1CBHINPZVPy/VGQBAX9XSgoqc
	1jXjKNPy5EPu0Xj0OSohYREu/IbyTyqXrH3u/hWDC7sGpkN3K+/azFhx7/mo/aU10P1+m5CaRsY
	JltnkP7COfy9vHiJ7
X-Received: by 2002:a17:907:96a3:b0:b8e:4790:d7cf with SMTP id
 a640c23a62f3a-b942e0249b9mr197709866b.53.1772824594561; Fri, 06 Mar 2026
 11:16:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306031639.46942-1-rosenp@gmail.com> <be17111e-1c78-49ca-8bae-fadcd7af6905@embeddedor.com>
In-Reply-To: <be17111e-1c78-49ca-8bae-fadcd7af6905@embeddedor.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 6 Mar 2026 11:16:23 -0800
X-Gm-Features: AaiRm50wLh1_AThkRv_BjNof7MflCw4QqkJP8CGHD5V--3_dfluZWxf4oemtoVM
Message-ID: <CAKxU2N_qu73NFFaJqd+ejg855L-RvaPvQvEmGLqTUpnO5iOUxQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: kzalloc + kcalloc to kzalloc_flex
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: linux-usb@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 305EB226FD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34161-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.896];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,embeddedor.com:email]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 10:54=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 3/6/26 12:16, Rosen Penev wrote:
> > Simplifies allocation and allows using __counted_by for extra runtime
> > analysis.
>
> Are you finding these with Coccinelle or any other tool?
git grep -B 10 zalloc_objs\( | grep zalloc\(
git grep -B 10 calloc\( | grep zalloc\(

And seeing if it's something that can easily be dealt with. The
__counted_by thing is usually clear in _probe if it's correct.
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Thanks
> -Gustavo
>
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 19 +++++--------------
> >   1 file changed, 5 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 1d2f3af034c5..272f9187b12d 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -605,9 +605,9 @@ struct altmode_vdm_event {
> >       struct kthread_work work;
> >       struct tcpm_port *port;
> >       u32 header;
> > -     u32 *data;
> >       int cnt;
> >       enum tcpm_transmit_type tx_sop_type;
> > +     u32 data[] __counted_by(cnt);
> >   };
> >
> >   static const char * const pd_rev[] =3D {
> > @@ -1653,7 +1653,6 @@ static void tcpm_queue_vdm_work(struct kthread_wo=
rk *work)
> >       tcpm_queue_vdm(port, event->header, event->data, event->cnt, even=
t->tx_sop_type);
> >
> >   port_unlock:
> > -     kfree(event->data);
> >       kfree(event);
> >       mutex_unlock(&port->lock);
> >   }
> > @@ -1662,35 +1661,27 @@ static int tcpm_queue_vdm_unlocked(struct tcpm_=
port *port, const u32 header,
> >                                  const u32 *data, int cnt, enum tcpm_tr=
ansmit_type tx_sop_type)
> >   {
> >       struct altmode_vdm_event *event;
> > -     u32 *data_cpy;
> >       int ret =3D -ENOMEM;
> >
> > -     event =3D kzalloc_obj(*event);
> > +     event =3D kzalloc_flex(*event, data, cnt);
> >       if (!event)
> >               goto err_event;
> >
> > -     data_cpy =3D kcalloc(cnt, sizeof(u32), GFP_KERNEL);
> > -     if (!data_cpy)
> > -             goto err_data;
> > -
> >       kthread_init_work(&event->work, tcpm_queue_vdm_work);
> > +     event->cnt =3D cnt;
> >       event->port =3D port;
> >       event->header =3D header;
> > -     memcpy(data_cpy, data, sizeof(u32) * cnt);
> > -     event->data =3D data_cpy;
> > -     event->cnt =3D cnt;
> > +     memcpy(event->data, data, sizeof(u32) * cnt);
> >       event->tx_sop_type =3D tx_sop_type;
> >
> >       ret =3D kthread_queue_work(port->wq, &event->work);
> >       if (!ret) {
> >               ret =3D -EBUSY;
> > -             goto err_queue;
> > +             goto err_data;
> >       }
> >
> >       return 0;
> >
> > -err_queue:
> > -     kfree(data_cpy);
> >   err_data:
> >       kfree(event);
> >   err_event:
>

