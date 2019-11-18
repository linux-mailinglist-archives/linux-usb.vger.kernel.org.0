Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284CEFFF4B
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 08:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfKRHG2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 02:06:28 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41126 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfKRHG2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 02:06:28 -0500
Received: by mail-lj1-f194.google.com with SMTP id m4so12633188ljj.8
        for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2019 23:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=XEC9RAmxwjz3n3Ze8MVv7UKSuejpTpNOXiKNyDSsnTk=;
        b=aTU1xn35yzxNMGztgGZJIc37w2tcBlMiB3jssstGLNZJP1HDeHPJ4Y6Q0L2p8/2KLE
         zLb+YD6eVnPxOA+NPscd/QO35+qAROtAZpObZ+QGCFR0/sFL4ZpQlqInIAfD8Who7M3I
         whnud48HgCriEPu21R3eiApKmrSPtlxPfjaH1lb2VeEy3801ICbbCCAr+X7pHNppyCd7
         DLlM+kQBoN+QyVXbYK/VyV1/7PP9sRXn//Qffnf8E+VkUEQESKndjIYnLebfa1CvXnGr
         s/dS54K/ledjrN6vBC1ftjH+brn9SjlNgK++gssObBeY1fu75Ks5ZvP5DLgw+Iglj9LG
         h8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=XEC9RAmxwjz3n3Ze8MVv7UKSuejpTpNOXiKNyDSsnTk=;
        b=TAUQPIYV3M613RzYpQKSOW1Nl/I4TvN68oUK04xWvBhsolxMSy2eH1MB9dCYVtqrMq
         0ansEpIE56czbuBadMJVg8e6tZtiLMbSABoxPb33k/HQwH13enWZVxkQ9joRjjvzuF3V
         fyyuzq13ktkxHPRpejQPl2Lc1fuiyKKRleIlObDInIsyHtFyZibsGuGr3Ap+5x84BOcV
         bia4nBZSUa4ir9MoksUEC46fAkQXpPzz6QRmM/C0Ox+8QJ/8wtFj6IhXdoC0bOBHdV7D
         AIlmqKvjPsJnFnISSeK/x2IAgo5rZBWjsKOHcaguuQcPJKTvnXqUcz8VvWLLAPnexHQg
         29Cg==
X-Gm-Message-State: APjAAAVf7cb/cfoVUi0l58eVmXDmLs4oZ+Mx2eL8p2u2TJSq+FIQiXST
        I923sDApDK7Ax4MfH4HRLpMGR8ywcbs=
X-Google-Smtp-Source: APXvYqwyULoK8Curg1ovLluNSQor1XnkC97E84oBHuW75kaIEsOyBkwBKmYGbJ56WDW8lIUdelmWcw==
X-Received: by 2002:a2e:8544:: with SMTP id u4mr20414565ljj.25.1574060785632;
        Sun, 17 Nov 2019 23:06:25 -0800 (PST)
Received: from saruman (85-76-32-252-nat.elisa-mobile.fi. [85.76.32.252])
        by smtp.gmail.com with ESMTPSA id a5sm7744136ljm.56.2019.11.17.23.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 23:06:24 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
In-Reply-To: <20191113141521.1696-1-b-liu@ti.com>
References: <20191113141521.1696-1-b-liu@ti.com>
Date:   Mon, 18 Nov 2019 09:07:18 +0200
Message-ID: <87blt9psrd.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Bin Liu <b-liu@ti.com> writes:

> VBUS should be turned off when leaving the host mode.
> Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin to
> turn off VBUS power.
>
> Fixes: 5f94adfeed97 ("usb: dwc3: core: refactor mode initialization to it=
s own function")
> Signed-off-by: Bin Liu <b-liu@ti.com>
> ---
>  drivers/usb/dwc3/core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 97d6ae3c4df2..76ac9cd54e64 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1201,6 +1201,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
>  		break;
>  	case USB_DR_MODE_HOST:
>  		dwc3_host_exit(dwc);
> +		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);

seems like this should be done as part of dwc3_host_exit()

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3SQyYACgkQzL64meEa
mQYNoA//eS5Rz2iLRl1W8ZKuO4isNtP3t7bP/0EEAF7EIBZgjaaTN3Y8F6dSYigJ
v2bPcJqJ0QN+Nd8CLuMLOgW6etNI/vcDEkgwnfP+NLtZHdWkcRvN0I7MJDUoG8GZ
PEdShfOeaEdFAoUfbzWW2KWBF1S8ET6tPqGuDXSLKFHgUjufdWmMNxMlpm5cLZ3G
ICjIWYBp3NzxsoZD0M7Sn+YCKaOtgKlpNCkLmOM4vXOX/1XN126Ekz02SOWKnKHX
QLa/c/7dTB1kA95gI/zJA1LJdpzdQNuzygAqt/wCMU/bCSZEpQGqJBOZHB2VtxpM
2CTD67WwkC8/PldA648Ixam0WBvZCskgVZoVoAbGJ/nakqkKiT3CGqi8EZBaTetL
e4fnZHdb5PUqx3ospvjPZ0RzNG6f5UxoB/fpG1x/J3UbyqAGS4C10zKHEgxo2TMa
WY7MlDHVGZ+BG2iOg5zokIei8UXAqgxfcjUEGptPqM7te8kBcr6Z7UybyPhT+57E
gxcZp31kbYjfxV/cD+R+jKqg40lTHmEplkQi2gfhPrdWMcyd7LLSKmdiYoXy9Ug0
UrlTW6Y+A3gy83ER4ZDc6KaBFhOnE2CZNTdlKSp3SHu8ms1K/NMJZS0n8PjvyE78
hUnzOPGiC4oarXlwsyodSO8NyHa8V/FPgC8Cy/0DTNCU3g0jfGY=
=z61E
-----END PGP SIGNATURE-----
--=-=-=--
