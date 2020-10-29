Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B639E29E670
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 09:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgJ2Ico (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 04:32:44 -0400
Received: from mx01-muc.bfs.de ([193.174.230.67]:49149 "EHLO mx01-muc.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbgJ2Icm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 04:32:42 -0400
X-Greylist: delayed 640 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Oct 2020 04:32:40 EDT
Received: from SRVEX01-SZ.bfs.intern (exchange-sz.bfs.de [10.129.90.31])
        by mx01-muc.bfs.de (Postfix) with ESMTPS id 6523C203C8;
        Thu, 29 Oct 2020 09:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1603959718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CYQAH9csP8QGRDf7LtXxC+wt7BW/zX41/XbhhgtAe20=;
        b=HhBNWZUlHfx/axhARbFs0Dd25Si5aj+/bm2vqSKwrFMgFQLRQYazJ0JQNiQEuX4SGFewaU
        XNqfy+1Icx8O5tQ4+DDCB/j/aIzzkLCboJhYzgSZwKj9KB1j7ciO37C2sKhM+oR3mzxSUi
        SvmYyaHMYnhnEvQ+OWzCUg7HaHH1u9Ek322r1vGyr0tOerhgGi6E/B5HJCyPPsOZLZUnaA
        11NBRmet1Pdvf9vtr0wJIpsCh855DrC4TxGBDZ2SOG3dGJJBnZgRQqAH7DaW7ekiGquL/0
        HvvUN+TagbBBNh3S3w8RO0LdtEQhfgO3URo1KGrXXgJhktSKcNh+fIa5tNmL3w==
Received: from SRVEX01-SZ.bfs.intern (10.129.90.31) by SRVEX01-SZ.bfs.intern
 (10.129.90.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Thu, 29 Oct
 2020 09:21:57 +0100
Received: from SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a]) by
 SRVEX01-SZ.bfs.intern ([fe80::7d2d:f9cb:2761:d24a%6]) with mapi id
 15.01.2106.002; Thu, 29 Oct 2020 09:21:57 +0100
From:   Walter Harms <wharms@bfs.de>
To:     Amelie DELAUNAY <amelie.delaunay@st.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: AW: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
Thread-Topic: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
Thread-Index: AQHWqS8S3xHqI4tRUkqlroDZcdJWrKms5+4AgAFeuGw=
Date:   Thu, 29 Oct 2020 08:21:57 +0000
Message-ID: <f843e2866d6f421d83b4455582809a95@bfs.de>
References: <20201023112412.GD282278@mwanda>,<625bf21d-e3bb-f952-9368-d93bee05a461@st.com>
In-Reply-To: <625bf21d-e3bb-f952-9368-d93bee05a461@st.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.137.16.40]
x-tm-as-product-ver: SMEX-14.0.0.3031-8.6.1012-25754.005
x-tm-as-result: No-10--9.185000-5.000000
x-tmase-matchedrid: 1w4R1hu8EHXRubRCcrbc5pzEHTUOuMX33dCmvEa6IiGoLZarzrrPmc3d
        fdcf5CPdoWsJojAyUJyGDu7ShAWPZ3FhLHosE8p6fid4LSHtIANXjjsM2/DfxsuSXx71bvSLIZR
        vYk3GLWq4YWZ0oVWPemVAX9X3abiHypZAXK5m7sRuh7qwx+D6T47P8sslRxoeqJNb9gU3W4vbJM
        bTT9K/Ta3aC25avUua2v4PzRk1tzKasf4YibpLR/lZlPYYWH6dZ9CBzdVRKc7W3gJMbmpEll+vE
        FKOZZiQ585VzGMOFzABi3kqJOK62QtuKBGekqUpm+MB6kaZ2g76kpEM3zHz8HW0K4TFHL9zQH0k
        K6Hw87saFLZ7VYI8Taulqb26SWs8NwNxUX+px0HAEmceWg05FuqNmlaeXBL4ZXzBJxA4dXjG61L
        W3xarQYiiduc0eATAz+phZh9BMadJA4+6YYiS7boOfFLgUu3n
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--9.185000-5.000000
x-tmase-version: SMEX-14.0.0.3031-8.6.1012-25754.005
x-tm-snts-smtp: 07A5B888ED6E5FB23C630DD95E134F535C28DC98D31275935501040763F82A3A2000:9
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Spam-Status: No, score=0.83
Authentication-Results: mx01-muc.bfs.de;
        none
X-Spamd-Result: default: False [0.83 / 7.00];
         ARC_NA(0.00)[];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         HAS_XOIP(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         BAYES_SPAM(0.83)[79.66%];
         RCPT_COUNT_FIVE(0.00)[6];
         DKIM_SIGNED(0.00)[];
         NEURAL_HAM(-0.00)[-0.994];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[]
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

this is much better to read
________________________________________
Von: Amelie DELAUNAY [amelie.delaunay@st.com]
Gesendet: Mittwoch, 28. Oktober 2020 13:26
An: Dan Carpenter; Heikki Krogerus
Cc: Greg Kroah-Hartman; linux-usb@vger.kernel.org; kernel-janitors@vger.ker=
nel.org
Betreff: Re: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs

Hi Dan,

On 10/23/20 1:24 PM, Dan Carpenter wrote:
> These variables are enums but in this situation GCC will treat them as
> unsigned so the conditions are never true.
>
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C contro=
ller family")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/usb/typec/stusb160x.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.=
c
> index f7369e371dd4..da7f1957bcb3 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -545,7 +545,7 @@ static int stusb160x_get_fw_caps(struct stusb160x *ch=
ip,
>       ret =3D fwnode_property_read_string(fwnode, "power-role", &cap_str)=
;
>       if (!ret) {
>               chip->port_type =3D typec_find_port_power_role(cap_str);
> -             if (chip->port_type < 0) {
> +             if ((int)chip->port_type < 0) {
>                       ret =3D chip->port_type;
>                       return ret;
>               }

I was preparing a patch for this one, and it uses the ret instead of the
cast:
        ret =3D fwnode_property_read_string(fwnode, "power-role", &cap_str)=
;
        if (!ret) {
                ret =3D typec_find_port_power_role(cap_str);
                if (ret < 0)
                        return ret;
                chip->port_type =3D ret;

        }

> @@ -567,9 +567,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *c=
hip,
>       if (!ret) {
>               chip->pwr_opmode =3D typec_find_pwr_opmode(cap_str);
>               /* Power delivery not yet supported */
> -             if (chip->pwr_opmode < 0 ||
> +             if ((int)chip->pwr_opmode < 0 ||
>                   chip->pwr_opmode =3D=3D TYPEC_PWR_MODE_PD) {
> -                     ret =3D chip->pwr_opmode < 0 ? chip->pwr_opmode : -=
EINVAL;
> +                     ret =3D (int)chip->pwr_opmode < 0 ? chip->pwr_opmod=
e :
> +                                                       -EINVAL;
>                       dev_err(chip->dev, "bad power operation mode: %d\n"=
,
>                               chip->pwr_opmode);
>                       return ret;
>

        if (!ret) {
                ret =3D typec_find_pwr_opmode(cap_str);
                /* Power delivery not yet supported */
                if (ret < 0 || ret =3D=3D TYPEC_PWR_MODE_PD) {
                        dev_err(chip->dev, "bad power operation mode: %d\n"=
, ret);
                        return -EINVAL;
                }
                chip->pwr_opmode =3D ret;
        }


So, which fix sounds better ? IMHO using ret make the code more readable.

Regards,
Amelie
