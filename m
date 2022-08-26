Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2F95A294C
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 16:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240737AbiHZOYV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Aug 2022 10:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbiHZOYU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Aug 2022 10:24:20 -0400
Received: from mout.web.de (mout.web.de [217.72.192.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23A15282B
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1661523857;
        bh=YrlNGEys70/OYQwN8QBRgt/Zp642y0dNt1dq0B/3PqA=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=B5PHGfzCXuz6/ilzpfcHqvb+7GPnVBWPnUIMq+iyqYzfZVT8AGIJeXqQ9ZhWPMeEC
         5+mZY3m2zSSj4iN5PvsBOdSq7GQsk/1INI2HrpQjRFzDHp7uAFevtx6jQFdtjmOJGe
         ILoro//SCMmV6HBENNoznZxNLGLrC8tgo1xeL2XU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [10.236.197.4] ([10.236.197.4]) by
 msvc-mesg-web107.server.lan (via HTTP); Fri, 26 Aug 2022 16:19:06 +0200
MIME-Version: 1.0
Message-ID: <trinity-819f9db2-d3e1-40e9-a669-9c245817c046-1661523546680@msvc-mesg-web108>
From:   Radisson97@web.de
To:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: new enry for cp210x.c
Content-Type: text/plain; charset=UTF-8
Importance: normal
Sensitivity: Normal
Date:   Fri, 26 Aug 2022 16:19:06 +0200
X-Priority: 3
X-Provags-ID: V03:K1:iwr4RyHOImpltVjBTJbKZ+Ut0EXthPh9TqvHDi2N+O4zsRCg4u4H0lTzqaTGo+xIaCu2L
 XUloFC8xiIn6PkLHnbZKrYwNmdr5fNuSOs3Xckh3podLYzzG2Tkzj1ySnk4ypK22Dcs6da0RLMlq
 O6XvN6iUVq5DfJBYpm4GTPZmYBcaWfOvNkeaLOc7E5ajK+PFkduyCtOsaoEKYEbyq4Hbktb0WW2G
 Ld50tBPilyhRkY4boOyRoyt4yQjCSFSJ9gtEkM2UA1pHfMaPpyvZGoD0v2fEpLc6zYEPX6KJiy/n
 6Qfp178hKET/BzV9s6E6wxB
X-UI-Out-Filterresults: notjunk:1;V03:K0:dPpfCEt8AMQ=:3/oHIA1vvEi7Jop3g/r3hE
 gNbkSc74jXoUvEwmrCTrZEzSlvIajCV457PXVqaDDNgSXjTp/H3z0M39mBCAFiwAkCf8K0qyz
 rWVNkczpTaVPTcCKjIhSRKTD1niycNpxFT/otnqN8mxOCWLpr2TaHFGYqYQy5OrmrrKe90lK7
 YRC22UIROPuh8aQT9NylKpkE3IUplp80+Q2KqwkhTSonbmBc0B+OGTVwe+c0Y63u2oGtYVcR1
 Ex4SiuoPcLyu4oxrdg61o2iXq53LyjGg8xA19Povk3H9TfKXkOHpqSkW6EC9h2n/Jc9SZkNIN
 LpvJgpzz5keSpZGUClHu3K7CAR2HNt984AKHdGFqqtqoJIhIGnoTDkBTv4vliXFTJ6hnSmIku
 nMuVZxuV4WtJRWZVGWVVLrM4MKRp8mCMvUzNV2LASqFDCcF2qC9Jkd0xgBklzESivaeIwWNVf
 8/ZUwE2APK5gANa0Tsxd5MzasGjqHa7si03EwFSlUmm3tSmelcaVlM+u+03Hnqgr8pGvuIRJP
 f3RwiQJIFl5yKkdYO154zD/zjhwgjKB/xRMLiWzi0F8p4VYxCqgyVA20XuP9hZrfrCnHAIo2h
 Y7KQanV5ys/mKoc40z/KbFDftbh2aRyNasoTEqhGXuiEB2g6fHG8oYxab3Yi92KpntfjY1j3W
 hbTqbtFLI8g7xdTyctWRhT7XsvGahyliFxpOg9f/QCjYNrpWsZczLtJ7jG3SUhUWyH4IhFOMX
 wAzAPaTME1iWcYV53lgIR/GsbkgIf6RzSyHOw1WTUo8Hiq9O5vSGJSH14J2vlhlAzCPDTdm/j
 1X6p5x6
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello list,
i needed a driver to connect a Decagon data logger to my linux system.
It turned out that the provided cable contained a cp210x chip set.

So i added to cp210x.c
    { USB_DEVICE(0x10c4, 0x8414) }, /* Decagon Devices */

and it worked. BTW the cable in question is a USB2ttl converter.
If somebody cares Decagon is now merged into "METER Group".

can somebody make a propper patch from this ? I do not want the whole
linux git just for one line.

If any question remain, reply directly, i am not a list member.

re,
 pr
