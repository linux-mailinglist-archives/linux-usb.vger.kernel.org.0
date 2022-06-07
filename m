Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC535405FE
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 19:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347044AbiFGRcr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 13:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347831AbiFGRbS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 13:31:18 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEBD10A638
        for <linux-usb@vger.kernel.org>; Tue,  7 Jun 2022 10:28:32 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id q1so36625414ejz.9
        for <linux-usb@vger.kernel.org>; Tue, 07 Jun 2022 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GDjWLTXODTJxBJfiXt2y7M0qjTHj2KDSDDIwqP8WQ5M=;
        b=eWNkAw36eW7rbw+ZvYv2KhpceTUczp9VaAl35P4uN0BdQf+0EaFK4cwb3P+1EzIqWq
         VhWZXLP9mhOh1FBPVIxT4CF4ezsUwp8otsE295i2PYeecU9smlrggCVG7VVrChlzCqVi
         bMhY9cdUiwg6aNvgONVP4pWZ1Wey1+BxDXgWjgBlWMiOe1+LnIceYYg3fcp1FBdXQuIK
         NcBgJbkXEwE2lwaxXDrFU3bKAhpevjBB1B4Bcbe1iMWffCxR19L7bLXQnnGic7zLQMLz
         IfoiLyffLVjpa8vKIM3opzR+i3K9AFzWD8dbxoLxW7jTbS0QpyNtAW0gfFGAW/owx1Id
         1RnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GDjWLTXODTJxBJfiXt2y7M0qjTHj2KDSDDIwqP8WQ5M=;
        b=MTRqszAGvDwEJ/BORp5deBcsw/gpAcPh/qRXdD7YANH/xpnzR2sP+NNL3xs2yBJ6Ww
         m1E1FP4suHZN7lZj8sm3fxfVXXIKLHC0VntECM0fTsiXbRpX2TiMOKjGAo2zKbwAvCCd
         A3QbpvChIU/USvob2VpmIaRWT1WzFFT5tP3/rkAZ+fWN6Qf63BFMEao8H5m5R/I8VAKg
         P6NY1nJe2TQF3GEh4BUGah/UI+GWjzyX9MlnrsMqcUU/CtJSMPMsaEMU0rEYgHy20B0U
         yhoFnG2NBvWfEJv/9FP5xrdqEUuOiSzv7v9mPgOFOy3/qDVNZxuoVnQ443SiLWqqXbRh
         yvFQ==
X-Gm-Message-State: AOAM5332p5HKlf08pGWzlhAyY2VIPMlzf3OKlW4SR+1VcMg+GClOMj4p
        KGLjjxS2zFgqNBbpisCjsy0eOZu4G7hgO/SDWZQ=
X-Google-Smtp-Source: ABdhPJzsE9uNeiUh9tIfZ2YSfGjx9yony9kryr0qkTdW8M/G7p/3TO8d+SjPR1L+2sW2kdQeilD/7FsxVXdcUln94Y4=
X-Received: by 2002:a17:907:2cc3:b0:6f8:5a21:4d62 with SMTP id
 hg3-20020a1709072cc300b006f85a214d62mr28911758ejc.256.1654622911077; Tue, 07
 Jun 2022 10:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
 <YpCVc6eYkpmjP9AF@lahna> <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
 <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
 <YpSUSk9u5z3ueufa@lahna> <92ab08fe65c12d6159966bdd7d2c4215044a00ff.camel@gmail.com>
In-Reply-To: <92ab08fe65c12d6159966bdd7d2c4215044a00ff.camel@gmail.com>
From:   Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Date:   Tue, 7 Jun 2022 19:28:19 +0200
Message-ID: <CALhB_QM+704m9hoDJHUycbZEFXAj5pCENoWZdcFaFzo-+VhWJg@mail.gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
To:     =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 2, 2022 at 9:34 PM Tomasz Mo=C5=84 <desowin@gmail.com> wrote:
>
> How do I determine that the cable is non-Thunderbolt Type-C?
>
> I have tried with two different brands 1m USB Type-C cables that are
> not advertised as Thunderbolt. Both cables are electronically marked
> and 5A capable. When the docking station is connected using these
> cables, it operates in Thunderbolt mode.

As far as I can tell, the physical wiring of a "full-featured USB-C
cable" and a "Thunderbolt cable" are exactly the same - see
https://en.wikipedia.org/wiki/USB-C#Alternate_Mode_partner_specifications

I could imagine that Thunderbolt cable might be produced / designed to
have better quality (better shielding, reduced tolerances, et al), but
apart from that ... ?
https://www.usb.org/sites/default/files/D2T2-2%20-%20USB4%20Cable%20and%20S=
ystem.pdf
looks pretty, but I will not pretend to understand much of what is
written there.
