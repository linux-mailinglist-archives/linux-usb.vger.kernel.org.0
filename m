Return-Path: <linux-usb+bounces-38063-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKIOJdyPFWrUWQcAu9opvQ
	(envelope-from <linux-usb+bounces-38063-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 14:19:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 043905D56F5
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 14:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03C97304A8DC
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 12:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858073F8EDB;
	Tue, 26 May 2026 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfCXKccX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F03F788D
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797714; cv=none; b=kKPTACqBFO08GT35ffwuLhzPQsAleNesgZZgId8Y4IRtyo4MUq7jxpx6OXaPGW6JoAO09tQQP5oY5nkWIXllUEpQupUv5aQgXn24JZ2ku+oLyhHLUA/Zlijf+/FdIhkw5q6NT0XbM8iGoijp4+1PPJQNJRurXQa2f/dxakk882I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797714; c=relaxed/simple;
	bh=OSn6bDmKawvSjfgAUvf88Iaqe73jnCPjYLNYehHdVQg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNiIYzLDwopp79sjUQZR2qu3OwKB0uqT8RaMTAleNJW2KaS9Rc2ijP98hTm84SqHEh1U0oJZlOi270AoPuYChj6xCmZGE0Xsk6IFwJNyKeU5KLBSmAF96UdRqsUe3qUka3uqE9MVSi7J9b7rs4/hc1EiwDww1Y5Q7W3kGZdjEUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfCXKccX; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa46a95e9eso759832e87.3
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779797711; x=1780402511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXFphSiOq5l2XJRMw9xsaJQ0NmMlS70C7omHZtJC+7w=;
        b=PfCXKccX7O3hApcIX6We7M81KcXuURGvlh/saS1Qi77uvBq94Vnynx95XhmLOqdcnu
         EIbI0IZK5z59jX2Rz5Wi1qtXD0v5+p9x5KtradP2EwiWO7IYtpQhlJoHRQdHUA06/r8F
         Xq3RfT7DxPEtAqg48bCsGshYZ/m5hhX1omBXCE1yE3URTJQ5qPFxyCFBdibE9j6sG91p
         x0yGWQK5kzW15eVkJKrWbTJ0MGArTNmZhPeA2ISAgAPZNHN2o+8TEf3CxKTcOXG8OURs
         EPagVsfRshnO21+sAJJDNR1WWW2/SfjV3uU47FfQhQS3vRJcdtb3fIZDMl42PHCL6BW6
         qBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779797711; x=1780402511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXFphSiOq5l2XJRMw9xsaJQ0NmMlS70C7omHZtJC+7w=;
        b=P58u/dbW2iEI5GKjc3Z6Srto6gyFL3MLDBkCleSew+aGHKGRiegetqkQpvNYLe+TYA
         Syio8AZUZgcCDHmt898Y1hjxAvnvfjS/pqctsPykQ9mr8x5zqPBeF43Fd+9SlCbr5sRb
         6/BWNd8bhcaFaKEbsOU8YvFuLW1q70RxZepQSRYdoHsibEmVoOKFurnv036GXKHB6zmo
         HJxGBDJY8/4bkX0pmolJ6y3P/zlAE0bYDAEBpU36QlkP7lST6jz3t2ylDJKALb8pkTmq
         9+0h/IdV52eP3vbadOaDXt+5xRaJ8tpO1lEaJwY7DxPoogzVTyZ3jkVOFv/86k0gl+pW
         0LFQ==
X-Forwarded-Encrypted: i=1; AFNElJ965Xn6iJ4qdNGLwQQwW4sNEFfash7NlelCZXMRBZN4L+CvLVd0ZLN0yBAXABdMhtbE7MZRQhoPZjg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2P5Ex1i+gpfTQBSopEFF4q8CxKzYEFEHlHXntB4VwYYR5g9FK
	Xd8zH4jnd88aguLRo4bZESxdYf+3dfFYkhS66m/3ibrpabdoypeA6Wji
X-Gm-Gg: Acq92OFF7DTWeIBy10HGQ9nzW0D1CTqX1CB/D6ftDo4jBaZImn4KlnPHR+BhNJHGtUS
	6HTFG1MKzzPxdlDkj58L/yxhzrKWW0sHqjPxHHigOAY/HkT1c7hMhP+PzlJYzd34vYOpHcKSdGP
	l9olLwBqSV20eevzkMmnlYQAebe/IGGUBQEmyka5HYLowm3kUgRP7PspNNf0zc/xkp2ixODDvGF
	ffuKdmaLhGlVZ2FdCTtJ67RPw/NZ4eAz9DGvZrdkb8k5VSSS3W+CnvTpJO+4GO8okMDuuTkdQKU
	n6UUR8hpS4VgsG5Tpi0qL9sOe+OAmavjLYaBdAHVAusuNmWdiMoqhAXVsTic1Job8SFYAzHUpas
	9Tr5guFKmp7+LRtGbI2gt5lks60XZf9TEnw0mdnQ30xZZHGlJYZznKbAP+dryuMkTO/ADWkTOmB
	s0zoaUl5Q3tq46VzwS5iaPdiQzjD2oD0H+rcLLiBwT9m51tQ==
X-Received: by 2002:ac2:46cf:0:b0:5a8:7425:5659 with SMTP id 2adb3069b0e04-5aa323ab929mr3799400e87.39.1779797710441;
        Tue, 26 May 2026 05:15:10 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa46330d6esm402235e87.57.2026.05.26.05.15.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 26 May 2026 05:15:09 -0700 (PDT)
Date: Tue, 26 May 2026 14:15:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 stern@rowland.harvard.edu
Subject: Re: [RFT PATCHv3 3/3] xhci: tune urb->start_frame in ring overrun
 and underrun cases
Message-ID: <20260526141505.455ab0c3.michal.pecio@gmail.com>
In-Reply-To: <CA+Df+jcBu2zhzwfeT9AuWdK4QoqoQeJ1EB7nzRVvDMrcevQ1_A@mail.gmail.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
	<20260521152715.288995-1-mathias.nyman@linux.intel.com>
	<20260521152715.288995-3-mathias.nyman@linux.intel.com>
	<CA+Df+jcBu2zhzwfeT9AuWdK4QoqoQeJ1EB7nzRVvDMrcevQ1_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38063-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 043905D56F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 20:49:15 -0400, Dylan Robinson wrote:
> On Thu, May 21, 2026 at 11:27=E2=80=AFAM Mathias Nyman wrote:
> > Make sure a new urb->start_frame is calculated for isoc URBs
> > submitted late mid stream, i.e. isoc URB is submitted to an empty
> > ring after a ring underrun or overrun event.
> >
> > If URB was queud late, but before xhci driver handles the ring
> > underrun/overrun event then kick the urb->start_frame forward by one
> > ESIT for that delayed URB.
> >
> > the gap in urb->start_frame allows class drivers to detect the
> > glitch in isochronous transfers. =20
>=20
> This does appear to create a detectable gap, but urb->start_frame
> still drifts relative to the actual frame id. After each
> underrun/overrun, urb->start_frame becomes increasingly offset.

That's not surprising, the exact delay is unpredictable, which will
affect drivers that tolarate the gap and continue their stream.

>=20
> > +       /* re-calculate urb->start_frame on next urb enqueue */
> > +       if (list_empty(&ep->ring->td_list)) {
> > +               ep->next_uframe =3D -2; // FIXME define something, or u=
se suitable -EXXX
> > +               ep->skip =3D false;  // maybe, or is it the wrong place?
> > +               return 0;
> > +       } =20
>=20
> Since mid-stream URBs can be submitted after an underrun or overrun
> has already occurred, but before the xrun event has been handled, the
> TD list is not necessarily empty here and all subsequent URBs will
> still be scheduled as SIA.

Yes, they have already been written to the ring as SIA. (And if they
weren't SIA, the HW is empirically known to do weird things. The 1.0
spec was weird and so is the HW which implements it).

These URBs will very likely execute in a wrong interval, unless we stop
the endpoint to remove them (which we may fail to do quickly enough)
or completely prevent submissions violating the IST in the first place.

> I think the only way to prevent this drift would be to intentionally
> introduce an additional gap so that the host controller driver can
> restart the stream on a known frame.

If we want to gamble that maybe a slight IST violation will still
succeed anyway, this seems to be the only recovery when we lose.

Either way, we need to fail certain IST-violating submissions with
-EXDEV or complete them immediately with -EXDEV status. Which is what
I was working on and finding various issues with (the driver doesn't
expect queued URBs which aren't written to the ring). Unfortunately,
it still isn't finished as I have little free time currently.

By the way, do you know what Windows does in such cases?

Regards,
Michal

