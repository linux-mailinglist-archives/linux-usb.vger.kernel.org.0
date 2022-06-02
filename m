Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE9853BED7
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 21:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238657AbiFBTei (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 15:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238669AbiFBTeg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 15:34:36 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3042C1BB
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 12:34:33 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y15so872442ljc.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Jun 2022 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Wpd7jRxiqf1UoJVhhFGdx6OtnuRlT2pIlGm7mG0GH9s=;
        b=eftqPpOUcOnajOopK+mBns+Dt3IEfQ//winUfaCQH+Mbv0/wDcNQsjByy1JISccaxh
         wfSYf2gasNVF3sxfWwR2kAlWxFVZQuLf/UfzKFbnYW/CCxUfKxMAVM6WSpsDOa4gXcGW
         Mwl35GT/2YNRZ0K/VBg2VBIDz4IqxvGHXVj3cZ7Ap9ctDzJd0Wy8DMdbxzKvdHZwa3Fn
         Qm0Ij81qg2ql5TJlQ3Zkk4UG7j/JVZfhvUIkfNcrEthRAYE57dCV/NBbhQWe0/vPw7IV
         7mr9PBs3B7j6Q+tYTA/IT4R54E8VEDigiaDMM6ngbGYDmAJFzG+1Xav9ALYZ67SgW+cD
         UI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Wpd7jRxiqf1UoJVhhFGdx6OtnuRlT2pIlGm7mG0GH9s=;
        b=ItngqdGXfzmFXCj5o1NMj+L21RmJnAekGf2gbHi2zNvJ6OcDdDbvPm9Ma0Xj7FOVIp
         4RusFSyZbhac+OrjVvecmIJBQuVQEOPcf5lZzqz4zDR/C8OIkKrSgVFgepjhaXUyulsz
         etfTOeMXozK9mU40HnKriPpAbAk/wEtO+/6NYV8r3plI1kPDK/TfJvbR0m1wc2rqWQzX
         f2LGoU7v+s/2NiTDUCVIjQTkUfRQ+6DmEV9P+YXwKaAS8kT1qYxqDueDLYQ+aoUBUKD8
         vUCemgp41Sp0PFPpSVIrCiGE5LIs5mTeBM3L6QX4CN4xlkzUaH7XaJslh8x3iTuTqvcE
         nh6Q==
X-Gm-Message-State: AOAM530y7or9HGy/uKYi+9fj4v681SDF+qYOWcaEBFSXT+Spmv1HEHiD
        lGJo4+hD/mdZMLHztU12GWk=
X-Google-Smtp-Source: ABdhPJzErFgUNfXALJgRLbI/6Skfpd6wWnHn6F4GYpQOREy+AIbvVMUMdlkfTB8XrGW8mCshTlTY1w==
X-Received: by 2002:a2e:a447:0:b0:249:5d85:aa54 with SMTP id v7-20020a2ea447000000b002495d85aa54mr42747654ljn.528.1654198470953;
        Thu, 02 Jun 2022 12:34:30 -0700 (PDT)
Received: from [192.168.1.168] (078088109026.wroclaw.vectranet.pl. [78.88.109.26])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512105500b00477932b5d8bsm1172895lfb.199.2022.06.02.12.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 12:34:29 -0700 (PDT)
Message-ID: <92ab08fe65c12d6159966bdd7d2c4215044a00ff.camel@gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <desowin@gmail.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Date:   Thu, 02 Jun 2022 21:34:27 +0200
In-Reply-To: <YpSUSk9u5z3ueufa@lahna>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
         <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
         <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
         <YpCVc6eYkpmjP9AF@lahna>
         <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
         <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
         <YpSUSk9u5z3ueufa@lahna>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2022-05-30 at 12:54 +0300, Mika Westerberg wrote:
> On Mon, May 30, 2022 at 10:33:06AM +0200, Tomasz Mo=C5=84 wrote:
> > On Sun, 2022-05-29 at 21:51 +0200, Stefan Hoffmeister wrote:
> > > I have managed to wedge the system into a state where it does not
> > > know about Thunderbolt, and now, on what I presume to be USB-C only
> > > ("usb_typec_revision" =3D=3D 1.2? Seems ... low?), both DisplayPort
> > > outputs on the docking station are now active, and I do get
> > > meaningful entries from the DRM subsystem (and hence X). I am half-
> > > way happy: I want exactly that over Thunderbolt for the bandwidth ;)
> >=20
> > Could you please tell how did you wedge the system into a state where
> > it does not know about Thunderbolt?
> >=20
> > > Now, when I unwedge the system to enable Thunderbolt again
> >=20
> > I am curious about the wedge/unwedge procedure.
>=20
> Probably just connecting the dock using non-Thunderbolt Type-C cable.
> That will enter USB (+DP altmode) or so instead of Thunderbolt altmode.

How do I determine that the cable is non-Thunderbolt Type-C?

I have tried with two different brands 1m USB Type-C cables that are
not advertised as Thunderbolt. Both cables are electronically marked
and 5A capable. When the docking station is connected using these
cables, it operates in Thunderbolt mode.

If the device was operating in USB (+DP altmode), I assume that boltctl
would show that the docking station status as disconnected?

Can I read the cable EMCA details in Linux?

Best Regards,
Tomasz Mo=C5=84
