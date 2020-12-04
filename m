Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA4E2CEFE1
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 15:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgLDOks (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 09:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729521AbgLDOkr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 09:40:47 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D3EC061A51
        for <linux-usb@vger.kernel.org>; Fri,  4 Dec 2020 06:40:07 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id s75so3271248oih.1
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 06:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pdoHrzd3dQ6nDKhIuf9c80i4AedVCEsjXDh9pEQefuE=;
        b=VOBlQqh2iGZDKnoXzzi1FmZYqXmyW1Orcc6nqBYmrj9eeyU8UyPD8fsXr4iJuvZ0t2
         KKDfBx4Ebv8CR6FyBfNzI6x+ZAvBn8pcXHX/J4ElDh2IF+OMMTMDRDPCW9bpK3w/Iz/D
         xVOiqNSi3eE6sIJD1mhLEJMDneKJQr4HFl79CngKs/cLhTWb9HFE6weJwiRg/cGiaexy
         ie/5Te8MDrCl6u5KVoAb0QBxE5sbG10bElfjMCf0E1TuI4HdEg7CgYLH5PW3sWBhrOSL
         Dt9ri0qCDShfdnjJEzDL8c19BD6E6QT1N5Mh0HojzCVvYi3fd/c08OgFpVb1FF1pPX7u
         lZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pdoHrzd3dQ6nDKhIuf9c80i4AedVCEsjXDh9pEQefuE=;
        b=nDN3I/gJ+38z0xyJ49NFtXTKa+UItiZJx/S24pgDMzU1LFxwZBZ0HhoKA7Zr3jg4fu
         ZjEVSQoSuv7MyojTBtpgYdbhK7NQFwCrBAbSLDnHGs9JjAQPSAvDwcwPaawz2lGMKBCH
         0CyhbJCnHXLfplODAzmR/MpumVwp2TThlbwQXxi8zVLZKOKwrCaN33hgoLuLF5jMDv+y
         Yp6c1qtICggG/JnZEVeZs9XfcEgQ75G6w5jk73sQCwayHnbffLJ3tNB/pWAmzqHmWRgm
         ts51SMEy2NlVkMSmPQNPvY2IknMF+6e/HwEkV2ygk88jMJhiSs637vnaA6AWn/wXIk49
         7X3Q==
X-Gm-Message-State: AOAM5317K+PbpEJCissA7EwRhLpOnRkN/1Rksb35NMy+QIRfmEFjr+KO
        qVFq8dyksJC49ZmpV280G0Frej3u2gxnq6iJYzl3nvJZ/SCbbg==
X-Google-Smtp-Source: ABdhPJxQ628UzKLXhrJScu5dRK36Xd+PJ+tOdTOFrwVPqNWoNq05mxI8RGlgaquNTSKT9+j3K9e5yAdSdxzMsX/J/Fk=
X-Received: by 2002:aca:dec2:: with SMTP id v185mr3475960oig.6.1607092806536;
 Fri, 04 Dec 2020 06:40:06 -0800 (PST)
MIME-Version: 1.0
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <20201111092941.GJ14896@b29397-desktop> <CAB=otbSAGhDYxim9_fsyH4pZCLqgq+bxNJfv5hXqgQRVngVaig@mail.gmail.com>
 <CAMS2kBF5Gvhnf7AzdeSFeVeWBLhtHM_hHfTvMLTN-3Jkh=BwHw@mail.gmail.com>
 <CAB=otbTK0j03HjiLS-tqqaBTuavaFEJs49hpKPj2Df8e1_WN+A@mail.gmail.com>
 <1jblfk8di1.fsf@starbuckisacylon.baylibre.com> <8bf995b1-7b95-4c79-fbe8-275f29716c0e@ivitera.com>
In-Reply-To: <8bf995b1-7b95-4c79-fbe8-275f29716c0e@ivitera.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Fri, 4 Dec 2020 16:39:54 +0200
Message-ID: <CAB=otbS0RdXyLEHrkHXWZN+S-CKwdBONifrH11hiAf-3SL9cSQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Glenn Schmottlach <gschmottlach@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 26, 2020 at 3:44 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
> Dne 26. 11. 20 v 14:16 Jerome Brunet napsal(a):
> >
> >> Maximum data rates that I used were (AFAIR) 8 channel 192kHz/32bit,
> >> but there is another issue with high data rate if someone uses so many
> >> channels, very high sampling frequency or sample size that data can't
> >> fit into allowed (by USB spec) max packet size of endpoint. In this case
> >> need to decrease bInterval of endpoint.
>
> Should anyone test the patches with RPi4 dwc2 as the gadget, please note
> the recently accepted patch
> https://patchwork.kernel.org/project/linux-usb/patch/e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com/
> which allows using full 1024 bytes maxpacketsize on EP OUT. It is not an
> enumeration issue, but the old (= existing) RX FIFO size drops data with
> packet sizes above 960 bytes.

Thanks for bringing this to our attention. Does it affect RPi 3 as well?
I'm going to test feedback feature on this board

Regards,
Ruslan
