Return-Path: <linux-usb+bounces-36206-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFgEBuff3GnrXgkAu9opvQ
	(envelope-from <linux-usb+bounces-36206-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 14:21:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2443EBD83
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 14:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63B3303DD35
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 12:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142783C345A;
	Mon, 13 Apr 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNdpYOTu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B07294A10
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082555; cv=pass; b=GzOfrOsYL9SZdR0RL0EojwGvfzfsjabn14Fk5DkQiaOwy4oAlNn9FZ11uSFCKIXJdSkT54TwRrteIG0RsSycZw6buRbLmW0ePdPjpkc/rd+riydh7gK57JxggE1mDaKkl3nRZSF7RRd4SI7rHhuYa9O3nj7gZzZow7zSoqPz97I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082555; c=relaxed/simple;
	bh=kurWP3u4eyR5Cum+Vf9IwOL5d7ABG+/C8fjz2fPBB0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZiFDqCEUMWvODQIz707c0OwwDyBe3NzPxQvKN+toHzjj1T3yc9+9Zwz5spNXVIzEp4cbecetsR57ecmLd17L2kAizJkUYRd1uByzndHaDeZNBV1cHhHsU3/xopXZPXiF+KzPyhxDkbHZJ2jRsijk4aALD9ekoW136rCslIPKn1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNdpYOTu; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50d58c513dbso32859421cf.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 05:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776082553; cv=none;
        d=google.com; s=arc-20240605;
        b=d3+7N4CstgmVAkkFRzyCr8YjAnwNfYXHM+EjUL5f1RdTPXK739jiXrn8wYCtg2ZKSU
         eePFr4WWOqMmP1fjm0XawwTj3aV4dbViMH0lhCOlT+3vGVYh1o0oyyg4kNRWhsZihrhM
         iAVgeKUiJV7u63DrnUcsqBjim/vfBohKwRSSoVgbew2PTEDPeP2U6jF/SdKp43bw/XDP
         eG4jxrodkWjoFNHqZU0cU10DYESoY3TNpxCCMRbokGurqjEnmjCZyfJt1SetdgEGbC8z
         YI5adpjquy1KK5Y6x1+gX+/ndJbE4TKjtVJ2+iIkDwYmK4UsHPd96LIkxEcWQRDNGP9s
         DgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fjs99NWze0a+U5fEj1zHS73LbQpSsymQExl2/ROYZXQ=;
        fh=C3ICjEGUg3lbL+WL2m1o4tnd1LCDP4ZgyAwYlUJvLDA=;
        b=BzPboU3S8TnVHjOcUMF/ftcHeiZib9ukA4uF9uiVqq4qcfHhGsXjfRcXsBP437xFAq
         nznel/GpKcLjeq5NnxFnHvkvUVXR4k29EiLtXaBJsAmz1Xv6oKE0LVWrT88blGp5uxEn
         //tnwpjtFl+UXpcGcSesI5g5Fw/DcT/E/tN8qmYyEGqGYfncqsqeJBX/z3d0lpighCcN
         yPcC7fbzFz5l12zSJaBrsmyvSYsxkl1Rh6gVl1SjNesDuiHRWJyHF0o0jY4by2QsJtJf
         QJZEqAazqTY3wdWvzu2D7aDX4bzbgRT6RjnLrKZtbfkDaGZMXuIjOhXuQR2NScaJJZ2q
         n4/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776082553; x=1776687353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjs99NWze0a+U5fEj1zHS73LbQpSsymQExl2/ROYZXQ=;
        b=NNdpYOTuqpZYas22zixrjGrX3YGQ8e3QAqduzkTnYSKBpeJJ9VZhNbp3kqsa+pRMSe
         8gVnIzWRLwbysXmD19jCIw0hj4CqNkw4RklzRrong2tBrgtFnyFwDf4XtW6Jc67LX1Cv
         lE1eer7gqIJIgDzfEpO/n+EHNHxVUyX1VrMe0eBQBq9/l3KQrxyhPjr7KJ4vtLg6IjPv
         ycTj1itu3nWw9QfDkqNjpbhHplMef2bh3dAWUDy1JlSAGJRol8t0VpIf5pbckVelTT3b
         +3Rtds6OGYjEarP5GZLFKW6ewE81K6oYaDpF0prA1MLmQBKbbC9xeYwA+43aNrMw/j0F
         2a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082553; x=1776687353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fjs99NWze0a+U5fEj1zHS73LbQpSsymQExl2/ROYZXQ=;
        b=e51eDVm9+7FFiDXCHdyKT/swD0Qdw+duOa1JKXeE1+JYKyhXuxSngUow2IoxEs0aAU
         RSDBkPYJP7QGdiMveXWWDpWGOXBxsfMUK4Ie2unIguFyiqvJDp8EO/Hc1NmFj/y2XCPw
         VHe8ecQ6o++N0Ct45/XdY2Pa9ikCgKCuVU3m5uw6TEG4X3OSsGM67vRHPBfRZoZ2PgKn
         sMueyz3fgeLIerjWTIZsid7vx43bNyA2kJRqCItrEicULiiTUE9OBLp7XWT8dwbir0er
         5cxHSDGYDek/wN+z/8Q0tncmcHEhiZZFtqlWHzsiQeEMix9d3zDiZrJ0xVNMwDSvTYXs
         9Q5A==
X-Gm-Message-State: AOJu0YxeMwljK/TrC2GIEYpp26ul9tL+/KdRCeJMHPu05m4BZsA4Fyc+
	VLCydTqmj6xxuB4eqLiyZttN616ZMAYk5U3+NPguYTslOyYue60kdczmWVUT8Ja882vmxZyhnG5
	mnErdK4LQq8uuordErgfS2wJ5YPHz9R0Lg19H/tA=
X-Gm-Gg: AeBDies+7zgnbrkBYcd8EF5XLcn2sdD3eLVU517lw3vN3f2o/69Sf/4PQNuNNKHusdm
	b6HRAIDZjlEpxqnuH95X6FDjOSl+DWsw+Se4aIjiSaEssXhnUxkFrkeqP1hH22m5eAXQsFvslMf
	K01ZkXec9laeVrUPx7MIjeonRWjLq2XHjAAwMMYGR0CMb2Y2TtXV/zR9D+p66LcUFeunbEFOnXF
	4RGoVgs41YTEoLVySLpuYlusw3z2FFjZdRTrroF6Y99WsUpqwVRBir96daOQqZMqQGpmX9J4yJS
	cdI/KWHNrlc5tsjJzca+uf0SEkxzfmi2mtcN1yBGRgEl4aNLdlwuClUS5pq8yWeEyMszNdJETx1
	MrZzUoJ4OFR0gu+qC/McfB1Pd
X-Received: by 2002:a05:622a:2488:b0:50d:860a:8fb0 with SMTP id
 d75a77b69052e-50dd5af115fmr208584621cf.21.1776082553250; Mon, 13 Apr 2026
 05:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adjNpgyF8W5Aen7Q@stanley.mountain>
In-Reply-To: <adjNpgyF8W5Aen7Q@stanley.mountain>
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
Date: Mon, 13 Apr 2026 14:15:42 +0200
X-Gm-Features: AQROBzC_3t-UUkyyNcSZOu0QN7I0SQPiUIoSPqmcGHpGWcTtq_Kuq5CT4O6MRIM
Message-ID: <CAN9vWDLK45+c1St8hwrsg8j9DC8z9p7U6Pa5OyX_kBxgjs6oZg@mail.gmail.com>
Subject: Re: [bug report] usb: gadget: f_hid: don't call cdev_init while cdev
 in use
To: Dan Carpenter <error27@gmail.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-36206-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmaepsilon92@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8A2443EBD83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 12:15=E2=80=AFPM Dan Carpenter <error27@gmail.com> =
wrote:
>
> Hello Michael Zimmermann,
>
> Commit 81ebd43cc0d6 ("usb: gadget: f_hid: don't call cdev_init while
> cdev in use") from Mar 27, 2026 (linux-next), leads to the following
> Smatch static checker warning:
>
>         drivers/usb/gadget/function/f_hid.c:1282 hidg_bind()
>         warn: missing error code here? 'cdev_alloc()' failed. 'status' =
=3D '0'
>
> drivers/usb/gadget/function/f_hid.c
>     1263         if (status)
>     1264                 goto fail;
>     1265
>     1266         hidg->write_pending =3D 1;
>     1267         hidg->req =3D NULL;
>     1268
>     1269         INIT_WORK(&hidg->work, get_report_workqueue_handler);
>     1270         hidg->workqueue =3D alloc_workqueue("report_work",
>     1271                                           WQ_FREEZABLE | WQ_MEM_=
RECLAIM | WQ_PERCPU,
>     1272                                           1);
>     1273
>     1274         if (!hidg->workqueue) {
>     1275                 status =3D -ENOMEM;
>     1276                 goto fail_free_descs;
>     1277         }
>     1278
>     1279         /* create char device */
>     1280         hidg->cdev =3D cdev_alloc();
>     1281         if (!hidg->cdev)
> --> 1282                 goto fail_free_all;
>
> status =3D -ENOMEM;
>
>     1283         hidg->cdev->ops =3D &f_hidg_fops;
>     1284
>     1285         status =3D cdev_device_add(hidg->cdev, &hidg->dev);
>     1286         if (status)
>     1287                 goto fail_free_all;
>     1288
>     1289         return 0;
>     1290 fail_free_all:
>     1291         destroy_workqueue(hidg->workqueue);
>     1292 fail_free_descs:
>     1293         usb_free_all_descriptors(f);
>     1294 fail:
>     1295         ERROR(f->config->cdev, "hidg_bind FAILED\n");
>     1296         if (hidg->req !=3D NULL)
>     1297                 free_ep_req(hidg->in_ep, hidg->req);
>     1298
>     1299         usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req)=
;
>     1300         hidg->get_req =3D NULL;
>     1301
>     1302         return status;
>     1303 }
>
> This email is a free service from the Smatch-CI project [smatch.sf.net].
>
> regards,
> dan carpenter

This was already found and fixed by Ethan Tidmore, but thanks for
running the tests.
https://lore.kernel.org/linux-usb/20260402180008.64233-1-ethantidmore06@gma=
il.com/

