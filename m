Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4D741612A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Sep 2021 16:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241517AbhIWOji (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Sep 2021 10:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37516 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241637AbhIWOji (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Sep 2021 10:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632407886;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hv5Ip03uv8SeMpyZU2pb5Lb01AcGIOBYhVtEvkGDS1w=;
        b=MQ94XGxJu9hM+NrzduUqaTy5MBENcHW9GFUqKbSO/h1iFV4JMJ8sCVWdGfSMwmN+NyrLL4
        qcTn/wdoyusS6i3pUG0DOterZbqleB5Na7loLqsTv7yi7y5pLbFkcFKjPHkPrIvbguilkE
        RHs9prdjETNzAz9QWMz84VMnYb2oNck=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-wRj9eYe4M92hqGsA-8q-yw-1; Thu, 23 Sep 2021 10:38:05 -0400
X-MC-Unique: wRj9eYe4M92hqGsA-8q-yw-1
Received: by mail-wr1-f71.google.com with SMTP id r15-20020adfce8f000000b0015df1098ccbso5338852wrn.4
        for <linux-usb@vger.kernel.org>; Thu, 23 Sep 2021 07:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=hv5Ip03uv8SeMpyZU2pb5Lb01AcGIOBYhVtEvkGDS1w=;
        b=QehLj/LA5ptpqIjbA95etJd9ksHScIonXQMWZin02CcipJuRiTsjWqrSxlluDCPvn7
         50FJllp899JbFu4uii+E7QVdXgIS33EcPdS+DDu2O5X8lBYB6a2vSQYzt0zQoEQOJpLK
         uMAL+0q3TMzngfMTm/HilRX9XDcgkXBTeA0XfOs7L2PH1z5qvLiBGs8SWmyAnLy1Mcv1
         4BdTmhdjjC/J/BipzjbHF2I/DeIPYd4h68rxfAXtLTKaHD6bMFTX+bU8Sq56KHt0f3UQ
         wPRKahf/zxENwCkyXPu/akGW+OIShGhsIYA8mmvvvp6WB5G0NLAc99aXZoK3xqxvl7r6
         Ew7w==
X-Gm-Message-State: AOAM531jnkjoBBAlrQl098q9f+KuxdwPiOUBE47NejrTpcwCOtUyMlcZ
        KIqHtWhEbMjFYvJAYO92lmIH00NMo9JoSwLHU4R6gSLRew0tbQhceKoEmZk7qIYNHoksBBBjrhz
        nuLKLcl3qDdBrCfypo6jS
X-Received: by 2002:a7b:c947:: with SMTP id i7mr16236773wml.136.1632407883564;
        Thu, 23 Sep 2021 07:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhCrI4wAWL4epXVyEm8QbPercmJFg7P3pUkEaWdRbeU1bR+NoQTfhq9vmXHTeLXjyfqgtWUQ==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr16236754wml.136.1632407883302;
        Thu, 23 Sep 2021 07:38:03 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2d17:72fc::185? ([2001:16b8:2d17:72fc::185])
        by smtp.gmail.com with ESMTPSA id a75sm5827615wmd.4.2021.09.23.07.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 07:38:02 -0700 (PDT)
Message-ID: <52591c12693733a3caf11d2bb5999acdfe177054.camel@redhat.com>
Subject: Re: [PATCH 0/7] usb: typec: ucsi: Driver improvements
From:   Benjamin Berg <bberg@redhat.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ulrich Huber <ulrich@huberulrich.de>, linux-usb@vger.kernel.org
Date:   Thu, 23 Sep 2021 16:38:00 +0200
In-Reply-To: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
References: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-pktP9CDU/cNmbhPvNTdy"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-pktP9CDU/cNmbhPvNTdy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2021-09-20 at 17:24 +0300, Heikki Krogerus wrote:
> The goal of this series was to improve the alt mode handling in the
> driver, but now it seems that we can use the "poll worker" that was
> introduced for that to handle other tasks better as well.
>=20
> Ulrich reported some problems that are caused by the second
> GET_CONNECTOR_STATUS right after the first one that was introduced in
> 217504a05532 ("usb: typec: ucsi: Work around PPM losing change
> information"). In the last patch I try to improve that workaround by
> extracting it out of the generic event handler into its own task and
> executing it only when it's really needed. That seems to improve the
> situation.
>=20
> These patches definitely improve the quality of the driver by making
> it a bit more readable, but they also appear to make the behaviour a
> bit more predictably and uniform on different platforms.
>=20
> Benjamin, can you test these?

I just gave this a spin on a X1 Carbon Gen 8 with a Lenovo TB 3 Dock.
Unfortunately, I can still reproduce the issue occasionally. My take is
that the rate is much lower than it was before my patch was introduced.
However, unfortunately the patchset does appear to cause a regression
on the machine I tested.

As before. The "online" status of the UCSI power supply is reported as
"1" occasionally even after the cable was unplugged. And the issue
seems to only happens with a dock, not if I use a USB-C charger.

Benjamin

> Heikki Krogerus (7):
>   usb: typec: ucsi: Always cancel the command if PPM reports BUSY
>     condition
>   usb: typec: ucsi: Don't stop alt mode registration on busy condition
>   usb: typec: ucsi: Add polling mechanism for partner tasks like alt
>     mode checking
>   usb: typec: ucsi: acpi: Reduce the command completion timeout
>   usb: typec: ucsi: Check the partner alt modes always if there is PD
>     contract
>   usb: typec: ucsi: Read the PDOs in separate work
>   usb: typec: ucsi: Better fix for missing unplug events issue
>=20
>  drivers/usb/typec/ucsi/ucsi.c      | 337 ++++++++++++++---------------
>  drivers/usb/typec/ucsi/ucsi.h      |   3 +-
>  drivers/usb/typec/ucsi/ucsi_acpi.c |   2 +-
>  3 files changed, 167 insertions(+), 175 deletions(-)
>=20


--=-pktP9CDU/cNmbhPvNTdy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAmFMkUgACgkQq6ZWhpmF
Y3BTPw/+M7IKVy/lg5Z0VyxsE9YD4IklcrAmufDoASAycl/TmM2WAgZTcQHcBmft
FF9TVfVrJK/lkCW0wcEWI0/zp8fZMOExio1mqmVQmHrLD4hNP4OKVLUK2N+u+7W7
oTPNHeWq5MIOYkXp8+aIzPSSL+K3gds1LlctZX1jKs78B6z4xxzffs0dyHjsmMQf
eZM1wUyaF176p9jeqg+L3GZgjIs3RO23GopHDY1vvh//FkINWr/0QEbpFuiDKjaA
RgbrfquWL5YUdiH8nRiBr4IAvJduQuKYIkAkIr6epdRYu3xLnimUgzg8njmLgQkb
Y5hpQalUEjbucgp3P1VxKWPRk/vWF4MEptd8bF5Gthu3MvkQ78l8V4CqiFcvMDBE
5cleIkd5LqYgFX9TQEHbhAWTCK1pRUWaGfGAGCREzL2QQqexY0ZsXCNMCnkQs1rC
LyqkXJ4DZ8jjupWNtbDlMZ7miqhhA8IZt9YyodVooiWHjpZqDR/w0SaBKMBrvBjU
6UIdSBr68rhQRfcCP84yOJ/fF6/1B8vft2q4EScCoBhjrQz6Uk3g3hhYrsT65XNM
aw69ZR2y1GM9mnggfWBLSER/E1z6frR0FeXH1WRS1E69aphffEwhagf5tXK/x0j8
6BGHxdLqs8kFb2s/IA/9PwSuQPVd5dMLLjBa1zIJ661BpKZamlw=
=7WQo
-----END PGP SIGNATURE-----

--=-pktP9CDU/cNmbhPvNTdy--

