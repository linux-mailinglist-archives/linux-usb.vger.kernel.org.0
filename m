Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8B012F608
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 10:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgACJ0C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 04:26:02 -0500
Received: from mail-lf1-f42.google.com ([209.85.167.42]:36231 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgACJ0C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 04:26:02 -0500
Received: by mail-lf1-f42.google.com with SMTP id n12so31523882lfe.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Jan 2020 01:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=YGFzVUyRsW9OZB5wW8k9jHCw25OfdoUDfesQnQSrdxA=;
        b=efuWm2QrnvJ9sixIu9r8R0KCmSMOIN1LTx0/345Q9jeHB87hzpCHgM5XqoCQz78a0b
         8CIS/wuSDoJ9aIatLx695x6STBE69yoYcY4q3mcS7c9M6vywk3wjen5OAZ22e75WVMNp
         eCVxQS3aLZM/W/pZKtF2KKVWSa0G1kMSEiHWbVXJ0s1e1Nebs+h+JX58RxQsFU5WsAG8
         eWYcseRovezi9M3KA6gsKdEsgVwOjBuMsdFYE7xeHJ9ryFkp8xHwvID4lCeL3vdSGZxb
         cTOSvefZrVDMIcrl4/rV5vKrRLea4XsDy+6QVJ2BrPPCiUa4J6Y3VnEclrbzltFH7/CQ
         0I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=YGFzVUyRsW9OZB5wW8k9jHCw25OfdoUDfesQnQSrdxA=;
        b=Lkn11FMeIeLiyCE6RTxCwZAi4D/xobf/U1ZtIM+fNWwDC4ZnKuf8cS/zHf37SQbed5
         tN3HbAUYmEfozlFPm8Uk9KuwcHMAb5S50rnQnHiwYNCutUid2XZ2vrT02LU2XibMmbw5
         u/xShnYLxSaUkIIIIY3l7UJNJqe9rpyiIM0+goYNuMPQIsQdeBW3Wv95EZlJgeVNTD3G
         GvcM8US074TAIcg7BJA3qNnmmr9+XmpL/k/Z8aPWcsWfMdYbtDV14Rpkcg5dXKQUkBbs
         kRtyk6ku5CWZ4Shx5o3oxKHlCM2o7lp9mDOeu4Kkaiev0Rt5HpIclDO2H/cVoqSLUt3g
         3zaQ==
X-Gm-Message-State: APjAAAUdzAMNUyfbIkB7f0dsHXUWh8GhqMJMbdNKIyha2Mmwoh4GPVxp
        Pg2J2jX1Os1oKSviy4xAmJE=
X-Google-Smtp-Source: APXvYqyvYTsH98mLbPZeShn/kZzn4CJ9rTbQk6IpfoZBepIQeFa22929dK3qjHZRbF5mOkzrheMocg==
X-Received: by 2002:ac2:5088:: with SMTP id f8mr49675925lfm.163.1578043559819;
        Fri, 03 Jan 2020 01:25:59 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id g27sm24439006lfh.57.2020.01.03.01.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 01:25:58 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell\@cadence.com" <pawell@cadence.com>,
        "rogerq\@ti.com" <rogerq@ti.com>,
        "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
In-Reply-To: <VI1PR04MB53274DD899A84806D84C5FBB8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1577426348-31227-1-git-send-email-peter.chen@nxp.com> <878smqksjo.fsf@kernel.org> <VI1PR04MB532770282A2C0701BD2A0EBA8B230@VI1PR04MB5327.eurprd04.prod.outlook.com> <CADBw62roaEi6UWV3X2NtqQ55w_SONactEn=JxrPShMV7oj98vQ@mail.gmail.com> <VI1PR04MB53274DD899A84806D84C5FBB8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date:   Fri, 03 Jan 2020 11:26:40 +0200
Message-ID: <87y2uoki0f.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:
>=20=20
>> > Hi Felipe,
>> >
>> > How to make sure it works? Except for enabling CONFIG_COMPLIE_TEST,
>> > what else I need to do? Thanks.
>>=20
>> Felipe's suggestion is you should change your config dependency as:
>> depends on ARCH_MXC || COMPILE_TEST
>>=20
>> Then user can compile your driver to find warning or something else thou=
gh the
>> ARCH_MXC config is not enabled.
>
> Hi Baolin,
>
> I know that, I have already changed that,  unset ARCH_MXC and enable
> CONFIG_COMPILE_TEST. What else I could do to make sure it could compile OK
> at every architecture?

If it works fine on ARM and x86 it's rather unlikely that it will break
anywhere else. In any case, once I apply the patch to my tree, it will
be compiled by 0-day build service in several different architectures.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4PCNAACgkQzL64meEa
mQaWHg//bbDmba8N8LkZLW8ccKpxi4dwrQ9ZAgZW+O8bvEYcgB6KpEtgMVtKnp/G
pI2FYuvnibF3U3hRwfuXUKdtPBXsPhFb0HwFX5GRcopMcLBAFn346ZK9ehIqWUeW
wXDdIZ0Yk8zLPymJiQw++sMvFcRxFyXFiZvclwNIgt7nWPeiKdYQWCjgz8moa+oq
TH2Xfj9mRnm5/IYHcfS2tZ3m8VJgFiCQ16e2gO9AZh33/dEG6xh2kVLRdLX2RqKS
iIdAQp1ywlKqFn+ezsK1iAffZpjdpCmzFnUGhP1Op7GIQDxSFLbRdLKSYp1hWTtS
6Bo+eoFsm9SAFC80/yJ4ohE4fw8vUtQYtTm3ZlaY3NoJFVlKdvmmPrRVvYMvaxf8
y9CllMtxlMnxtML0vGHkf8mOi13/rXoV7jBZDstKE2IfJJ2bInodA/Y1ph4mxPbG
83/fcW3wlNKoyVp5B4iZEy+p2WZI0JaHrWrN5O7ynsMkmkj/PrXE3x466H+gKvgN
fKjwWuGN51qQLDIG2hKz4BwtaEkuuZpt0HaB8LSdbZ/DvBXpHL6u23gopkCnP8la
dSBxvd02y8F+1R2ntG5XCt+08pjzrlMqIdUZ+kFiuY9i14SwU8p0bX3v2IAEawfd
4fa1XxIcP2xbeoiQL1ybTkBZHsH5ekO1oRU46wlRHl0F8f7G3UA=
=6F61
-----END PGP SIGNATURE-----
--=-=-=--
