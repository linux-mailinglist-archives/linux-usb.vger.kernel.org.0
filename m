Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8203D1D2D23
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 12:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgENKnw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 06:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgENKnw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 06:43:52 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68CFC061A0C
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 03:43:51 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d22so2181273lfm.11
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 03:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=LoQz6LDaAJjOrfFsfHvHBvYXtO/ZJjmXMxP/MBfVSgw=;
        b=SkcRB/jXbjSplcQJRsAf99RDWTbBETF8NHq82V/HROa3uomQqNKL03NxZv512LCBU1
         OdgeG5td0/sI7xeH6W37fsxpMe5/stdEMYjM5KNHVWOIhqGcuvbPnOxDfOGoiNdPVAN+
         oktBYAlk+v+4V9CGXjAnoOscOc68J30jbRTLNvCZ/Dsxokj9K9xbUv/6Cg0uWkVHO46z
         adt7jUGbFa1TcMl7j9jwkuG1NNiuFMQkeHOa7ddfOceG4zn9NqDGB6GNtAPpBFfMygFW
         Q8ufvybMbBQRvzCyYHXUoT+rgp/7mz/dU27hAFzL0gxOeOxUSg0mub+YeU6gh1JhTRrb
         5ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=LoQz6LDaAJjOrfFsfHvHBvYXtO/ZJjmXMxP/MBfVSgw=;
        b=F3O48Q4hxlUJLabf4Zi4Are+kJTCXR+fi0Mf+T9aeVOCMMQ6rjG2oGem6Eslbkql5X
         Avg5ZOw02P03+RrM8Ivk/TKaRK10L+JBqXU9LzFotWsK5hR1Y9PhOVuv0mlEXQDqUgBF
         i1nK6O4uP6ogZq4LJz8jR1raEZVuc2nqY9AGcw0KD5j3HUp5gJNJbPYwVtTpPfgGQkd8
         xuuDojHmeMocn2ZpGG2v9hsFnd2ZYUU+U3STSgXunUAWoHGZBZ8ztDag8RwGotc7Pvob
         wtDTDrd1WxcqfuPVXlo0WPun2+nUwXur+yPFCnuT/Nb6sQjbka8n7fIKFgLD327aE5ah
         j3PQ==
X-Gm-Message-State: AOAM532xEUM7cW6UQp6liUJ/rBG2+ZX88TFsPsf2WjnJsyKjO1Zrr1So
        xD4TCFkVdVf+PQ9thloCwbglPzV8Bj+nUQ==
X-Google-Smtp-Source: ABdhPJwqfsLK2pm4BRoMekB624tQycAv07OXsS6ITPRv8bL03O67yzT4miW/Be30ZlYxW2k0i2RYug==
X-Received: by 2002:a19:5f04:: with SMTP id t4mr2947165lfb.208.1589453030034;
        Thu, 14 May 2020 03:43:50 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id f2sm1261158ljg.98.2020.05.14.03.43.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 03:43:49 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 00/11] usb: dwc3: gadget: Handle streams
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
Date:   Thu, 14 May 2020 13:43:45 +0300
Message-ID: <87imgy4x0e.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Overview of stream transfer requirement:
>  * A transfer will have a set of TRBs of the same stream ID.
>  * A transfer is started with a stream ID in START_TRANSFER command.
>  * A new stream will only start when the previous completes.
>
> Overview of stream events:
>  * A "prime" from host indicates that its endpoints are active
>    (buffers prepared and ready to receive/transmit data). The controller
>    automatically initiates stream if it sees this.
>  * A "NoStream" rejection event indicates that the host isn't ready.
>    Host will put the endpoint back to idle state. Device may need to
>    reinitiate the stream to start transfer again.
>  * A Stream Found event means host accepted device initiated stream.
>    Nothing needs to be done from driver.
>
> To initiate a stream, the driver will issue START_TRANSFER command with a
> stream ID. To reinitiate the stream, the driver must issue END_TRANSFER a=
nd
> restart the transfer with START_TRANSFER command with the same stream ID.
>
> This implementation handles device-initated streams (e.g. UASP driver).  =
It
> also handles some hosts' quirky behavior where they only prime each endpo=
int
> once.
>
> Prerequisite:
>   This series requires DWC_usb32 patch series
>   https://patchwork.kernel.org/project/linux-usb/list/?series=3D269641
>
>   [PATCH 1/2] usb: dwc3: Add support for DWC_usb32 IP
>   [PATCH 2/2] usb: dwc3: Get MDWIDTH for DWC_usb32
>
>
> Changes in v2:
>  - Update cover letter
>  - Split handling of stream and of transfer completion into smaller patch=
es
>  - Reword usb_request->is_last to strictly use for streams
>  - Enforce transfer completion handling to only for stream capable endpoi=
nts
>
>
> Thinh Nguyen (11):
>   usb: gadget: Introduce usb_request->is_last
>   usb: gadget: f_tcm: Inform last stream request
>   usb: dwc3: gadget: Continue to process pending requests
>   usb: dwc3: gadget: Check for in-progress END_TRANSFER
>   usb: dwc3: gadget: Refactor TRB completion handler
>   usb: dwc3: gadget: Enable XferComplete event
>   usb: dwc3: gadget: Handle XferComplete for streams
>   usb: dwc3: gadget: Wait for transfer completion
>   usb: dwc3: gadget: Don't prepare beyond a transfer
>   usb: dwc3: gadget: Handle stream transfers
>   usb: dwc3: gadget: Use SET_EP_PRIME for NoStream

This seris is now in testing/next. Can you check that everything looks
fine for you? I had to manually apply one patch.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl69IOEACgkQzL64meEa
mQYqXhAAsEfuoZTedmjUIVnHNhBdq180mdjLXEW/1s/bHHbTVXV7a/3wURukoBKF
/jCbGZviz+UauHVpZn1wFB2olJ9Q9ld9ULsb5gt8VJaPazb7azUpbnTQZq5gnSON
1H5VKWyjhBJZSTkfke+TmiUHClsAjY8e8QPKEizcmNKgMOj2QvpR9iKlXE8FQ8Q8
7l9A7onka+iFf+qWOpti/UcSQ8jlR0WVxhdrLZB7M0iezjxcemEyiLIFUbaNwgFy
bsXyhCtYYthqhA2JnkyNMqcSX/yBa6NRWuR0ZA9bAXDXCuv3tk2/BklUybniRX+W
8NhQd+4yin0JaUzSL4AAdOsdj/2L5SpFlZ+Jsx80H0LUIIg6GJEDMTamTsb7u57H
H5T6SYLjvpqt/uGDAOLnRViMPP4Djv07qoEwC1X4ec1OGccRnQEL5ObeHg7lueB+
4kD+LlcxIhdzUoYMAmOKINqs/H55GCa81zqTrYXzsq7RGYHOCCi6F/SztOd3n4A3
7senLJ0wrP14saDVg6UgE/HHI2zFmwd1PWUydEtfebu53P0j7O1mFX/86tni6rHj
g+DH6yPwB1igwGauW+BLAyNan4Ag68zlqLp4FLGQNVhrgJa+9ARq/eF8TM86Xh0X
fAeKKRM2laMMcVCsdOdMmKsyW1pN7QVF5hpg0q5KViByBWRSrIk=
=nBwd
-----END PGP SIGNATURE-----
--=-=-=--
