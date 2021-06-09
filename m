Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0B93A1BFB
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 19:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhFIRln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 13:41:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34986 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229947AbhFIRln (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 13:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623260388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=52gpFG6Pp70xMd7h2f0kY9hXJHUtEvS+Bt7rkxrgLM4=;
        b=fqP5tu5vUC+GNdGIxvBngs/tRk4zMKSCancG2Ag+PdcUAw+a22ymuJ6YA7HmjOyrX6DEiV
        VLYuKqu+wlX3D2pLFYpsdQyd6fRdLdYzEeeKSHMgcmIhZCeWCfnmeawv4YcoJlKf3JCxlp
        OJrZMbGtj0QqdKCg62+5XuoT2EvCMIE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-vylCE0fCPXK4Hb6aquztcA-1; Wed, 09 Jun 2021 13:39:46 -0400
X-MC-Unique: vylCE0fCPXK4Hb6aquztcA-1
Received: by mail-ed1-f72.google.com with SMTP id f12-20020a056402150cb029038fdcfb6ea2so12684098edw.14
        for <linux-usb@vger.kernel.org>; Wed, 09 Jun 2021 10:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=52gpFG6Pp70xMd7h2f0kY9hXJHUtEvS+Bt7rkxrgLM4=;
        b=dQ/UK9zMVkB/RHzuc/yyE2Me+sJP78kKt1ObLh6Y+Qfd1gEfvtC94POa0oB6DxzTkF
         O5KX2zCU0JzGgSgkmVucnTyadE+mXs1n9Ag3nEdVlpksA8PL2xgGRhSAKoTTKBnbH6aL
         Uqkw2NiJELo3TwLIqB3NENal3UxDYm48XGAt0PyyLJ30Vh4ozZk276Fei7WPGUfzMqNF
         AtnwZ7R3/6n0Vs60kLm95Ocy1z0eimEjamtaHKvOJa1ttfmdvYrF7LklkuSF88U8w77O
         XFZbll276LDTCt0OPvJYH86lowGnLN5+KCPY//TeIiwKbcCvIPo+RiriKCBaPQ2bGszY
         0qYQ==
X-Gm-Message-State: AOAM530CtjjPePchmeReTatWNQqNXsi6uMX5BC+7995240ZoEipBskNX
        FAIvGLoZRueN98zN8YbLSAD/TCOGszL5Ef4HLuyqc1ozX8BV/GblRU6ccmYEsCtNz8r2K08eSrM
        M5ul+b9MjrE6ZrI8fJuXi
X-Received: by 2002:a17:906:f889:: with SMTP id lg9mr991140ejb.82.1623260384812;
        Wed, 09 Jun 2021 10:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAZ8LQNhK2gfSHZeWpIHuHZloYWg/fiwHuRLAIZeZwmeOz6MZFAXiWXGg3UYf9+9YHVvmoTQ==
X-Received: by 2002:a17:906:f889:: with SMTP id lg9mr991131ejb.82.1623260384661;
        Wed, 09 Jun 2021 10:39:44 -0700 (PDT)
Received: from [10.0.4.217] ([83.135.237.164])
        by smtp.gmail.com with ESMTPSA id au11sm142561ejc.88.2021.06.09.10.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 10:39:43 -0700 (PDT)
Message-ID: <0bf4d8fc6d64ac553a319b8c5af49a3d7705842d.camel@redhat.com>
Subject: Re: [RFC PATCH 0/7] usb: typec: ucsi: Polling the alt modes and PDOs
From:   Benjamin Berg <bberg@redhat.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Jun 2021 19:39:41 +0200
In-Reply-To: <YMC6fgoWiAe1C3uZ@kuha.fi.intel.com>
References: <20210607131442.20121-1-heikki.krogerus@linux.intel.com>
         <4a76d2152f016b58298bec16aa2003a6ec55f8a8.camel@redhat.com>
         <YL8RPiVsEFOM9PBo@kuha.fi.intel.com> <YL8UD+nlBSSQGIMO@kuha.fi.intel.com>
         <f9e1640d4d1a2acbaacf83dee021cd4aa55f233f.camel@redhat.com>
         <YMClRTC8wW82IrDT@kuha.fi.intel.com> <YMCxfC+S9EJNEiwq@kuha.fi.intel.com>
         <YMC6fgoWiAe1C3uZ@kuha.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-gkc6gHB5soYAjJVqW247"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-gkc6gHB5soYAjJVqW247
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-06-09 at 15:56 +0300, Heikki Krogerus wrote:
> On Wed, Jun 09, 2021 at 03:18:04PM +0300, Heikki Krogerus wrote:
> >=20
> > I'm trying to get a confirmation on my suspecion that we do always
> > actually get an event from the EC firmware, but we just end up
> > filtering it out in this case because we are too slow in the driver.
> > I
> > have an idea what could be done about that, but I need to test if
> > that
> > really is the case.
> >=20
> > I'll prepare a new version out of this entire series.
>=20
> Actually, it's easier if you could just test this attached patch on
> top of this series. It makes sure the every single event is
> considered. I'm sorry about the hassle.

No worries! I probably should have included some more information
earlier (i.e. enabling the debug print for spurious events).

With the patch, I am seeing the following on plug

   kworker/u16:1-6847    [002] ....  1375.485010: ucsi_connector_change: po=
rt1 status: change=3D4a04, opmode=3D5, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
   kworker/u16:2-6848    [006] ....  1375.561811: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D5, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
   kworker/u16:2-6848    [007] ....  1375.634275: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D5, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
   kworker/u16:2-6848    [003] ....  1375.743161: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D3, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1

and unplug

   kworker/u16:1-6847    [005] ....  1394.062501: ucsi_connector_change: po=
rt1 status: change=3D4804, opmode=3D0, connected=3D0, sourcing=3D0, partner=
_flags=3D0, partner_type=3D0, request_data_obj=3D00000000, BC status=3D0
   kworker/u16:1-6847    [005] ....  1394.161612: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D0, connected=3D0, sourcing=3D0, partner=
_flags=3D0, partner_type=3D0, request_data_obj=3D00000000, BC status=3D0
   kworker/u16:1-6847    [005] ....  1394.251503: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D0, connected=3D0, sourcing=3D0, partner=
_flags=3D0, partner_type=3D0, request_data_obj=3D00000000, BC status=3D0

where all but the first event are spurious events. I believe that in
the above spurious event with the change to opmode=3D3, the PPM should be
reporting change=3D0004 (i.e. UCSI_CONSTAT_POWER_OPMODE_CHANGE).

Occasionally I also see the following on plug. Note the non-spurious
event with change=3D0040 (UCSI_CONSTAT_POWER_LEVEL_CHANGE) right before
the event where opmode changes.

  kworker/u16:11-2201    [001] ....  3240.124431: ucsi_connector_change: po=
rt1 status: change=3D4a04, opmode=3D5, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
   kworker/u16:3-7469    [003] ....  3240.222799: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D5, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
   kworker/u16:3-7469    [003] ....  3240.325946: ucsi_connector_change: po=
rt1 status: change=3D0040, opmode=3D5, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
   kworker/u16:3-7469    [003] ....  3240.423503: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D3, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
   kworker/u16:3-7469    [003] ....  3240.861986: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D3, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
   kworker/u16:3-7469    [007] ....  3240.999048: ucsi_connector_change: po=
rt1 status: change=3D4000, opmode=3D3, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1


My thought when I first ran into the issue was that the PPM simply
resets the change bitfield on ACK, effectively discarding any changes
that happened after the last GET_CONNECTOR_STATUS call. I believed to
have confirmed this by inserting an msleep in between.
However, I have to admit that I have never really looked for
alternative explanations.

Benjamin

--=-gkc6gHB5soYAjJVqW247
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAmDA/N0ACgkQq6ZWhpmF
Y3DavA/9ELup2xi4o7YWMWixrZzC12o1ZFG/kFvYLdrOFo3bGHlbrgigdcu1btkv
WXeFOZO7PoT9KRR2CF5FESeSlKar+pQzXhe8YmYtkXRtAucarR5fRAl2IS7uurLK
/VTCotKm1tDu5CZxFtWHaBkguZPj4XZ7xR2yN+O0sMrh+Ty3gUsEjNYOnehO7oGu
kGhVEjgMmbVbUez7VQwiaxFiRyr5ysdaouKfm0Blc5QTxvtRgG9CpL0V2ScxapYj
26CrsmGzKZz404fh9x+evviYcYmScmWlWZBZswDB52L4NhrzCE2lVon7OcSivkHr
QAQ6mfWUfhDxxuUDC4KV+HtxViSmZjLFfUIWb64sGH1XzrbGc6yqiGG/qV2tyzb3
77zueXGmAqzoYt1t7/dznO7EMOUqT9GM1cEoY2AAKDTRLrNrXU9QH7+hs+48UG9U
NuEz11pnLZMFCg8HeHwp/+HMZdoowbUm0RUgOjzfTG4n1X7R1myJDjtvZk3YjFn9
/IOlA/AtXqUmMM3GCI8EEzqdJ2pwucmJcIkUNGEhVn14rZkVmlWqHku+cx803eTS
dPobAtRgZfglOkvNaApgGhD+mrs71ogp8HAsV7R1z/qLISB6FunAnU3SPiyw7YXN
bT0vasjOWq5CY49tMoDm8NDDPMbqC0j8Jk3zCX1BrZv7zcHN6V0=
=Qu5O
-----END PGP SIGNATURE-----

--=-gkc6gHB5soYAjJVqW247--

