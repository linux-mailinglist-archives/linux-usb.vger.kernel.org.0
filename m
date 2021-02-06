Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71C9311E19
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 15:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhBFO4i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Feb 2021 09:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhBFO42 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Feb 2021 09:56:28 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0C8C061797
        for <linux-usb@vger.kernel.org>; Sat,  6 Feb 2021 06:55:27 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id f14so17629934ejc.8
        for <linux-usb@vger.kernel.org>; Sat, 06 Feb 2021 06:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=pH4HPozQqV9KFhmJi4ejr7uhXwGKo1eiMrsOL5wzQtBzaz1Dc23ClTW3PwppguNuBX
         8zRtYXMbiy4s0UDHIqxgK5weemlNbs5zp9N4EAmdC8m5pX7TBVW92FEAWNGvIm/gDj72
         +PXcQYkBHm+ogJVyUnABCqkpUGWYxKmIQINw5bNQOaeIfHEwFh7V9b67bGVyWjRUIewh
         nV1Gae/ZFfyNZ8Zkg9JTgJQZ5pLgknhH/1G5Xf6Hmy0KQJHLGShL+3WiOf6BIbkF+srw
         O7NZigDzwVmXZeZLgdonz3IxHpP7rkH47qFM4eZvEzJ/RbPDNzPSBUQySG2eCYIgOVoq
         QIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=Cu33d6yUBASDWsp9gurUKnPJb2CJg2vH+XWwiWdWiHRBZfsBJEXncKk4CBI8xVEjbv
         Kz2BlZDYLHR+Hd7YVxhRGp7HYlgW4bbOI2d+ImLci52cqUMEH07En5H5ZDNcN/5SNhJ2
         cF65yYXM5Ir69KXuoQBTXZFN5uLETCysguPutBorC/1dQVq4NOnw30vCoDk1XKAJ98gH
         hj8FVXm22iXx4MAf1eHCCcbVToq9FsBuhVGvJn+dNK7ZkWVO/kEaWajV7NAGlgycTyTO
         f7NYyDXBbwFUbDrk4/3e1y19yUWhIlF+fAY4Y8sZCrATwb3tyEYiCyyrDEu4T9AFiWRr
         CZaQ==
X-Gm-Message-State: AOAM532yiU6C/6Jah5p2cSO22tEfZ2r0f7SK3nhmxx6qcuEAOkh+8Qgv
        /P/cogyG1PAY0B1n7UOo8C9Cgg7GUfSLvq6C/K983blvKio=
X-Google-Smtp-Source: ABdhPJwHU6txPxzzBy8IWp7Ku3rDq1bEw0HUp8r3leXrGTAHG2vbKmnpDthJEiUtX7neXJxaVqL8r5g7DwG6Kdcef3k=
X-Received: by 2002:a17:906:5659:: with SMTP id v25mr9403850ejr.8.1612623326665;
 Sat, 06 Feb 2021 06:55:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:55:26
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:55:26 +0100
Message-ID: <CAGSHw-DWoS9pVOTJHrH-gLzXAO-xFO0WbCFx1uMqoCPnh_wpZQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
