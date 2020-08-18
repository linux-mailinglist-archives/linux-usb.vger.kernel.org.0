Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48FA248B87
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 18:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgHRQ0Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 12:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbgHRQZO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 12:25:14 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D1BC061343
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:25:13 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id z6so21764841iow.6
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1EGlJ3vRpK0OVKnO3LZ6YgJMgPZKY5QLFjmybrChjJ0=;
        b=hVGr41tsP9m30hrJNqv1SCLX2mc8EkkaRBkSI17dZcmWS+0EYbSBmXbtN1c+/lZ2nj
         kqwXvYRC3znUxb3b1jCAdyQjewuP5pxHTetPn9EV8PfbahfnbBImt0RkEd4lPd5CADpf
         SfkQtGPGhmQbK4+9AuGNMrACrZA0VsI3MRL51ppaBAe3KeB6RfIsPwPumXkpz8LJ5TBh
         E7hdjD2GntRrH3ZLU/9NXaxVmV9BmueCac3pLtwloWrtZ3l7dsVHfDEdhBAdgPk4/oZs
         jf5k9vSPnu9XZCQ4DMRz8CugqMiog9ehuOsM2/nCDd+csbKOUW+Ix1fzqWWPA+K4IxD2
         REqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1EGlJ3vRpK0OVKnO3LZ6YgJMgPZKY5QLFjmybrChjJ0=;
        b=q57uidoxpOK3naUQ3BMK2pG8YlQ/zACMwpwCtG9phDHRTcJMdzsb3Uf3wuPkJFLXMa
         VixSQWrdBdLu2paXRmuWKggoJyQxOEDPnD3srnKxOm5bb4lDptd3zO03dQaswC+2Lz1/
         0eYXFMGNSIFK1TabwM4GrKifSvSE8xDo5cD0/dsqh2bLMgjsD5G7EA1CckJ8jviwLD+7
         BSX/qC/gkKbs4UEoAweD1DyMFSRhDLaK7Mk7R5sh9gv3oGRvixaEKe0VwH/kOISsyEsK
         603J9d9tYtgv8aFmYQPBqQKU7CjGMhHBK/OsuSMnyenYekjhdgX8tJvFLgcpvJHKbzs/
         K/Iw==
X-Gm-Message-State: AOAM531MPgxjyNee855fTdp1RWKI8eA/jsnDAzH5j0xfvwm0vTMMVMIc
        tz4Vo8hYBeInVPKVuDBI3j5MymQgz4EEcIVRIoPb2dJcJu4=
X-Google-Smtp-Source: ABdhPJyk9OfBfZfe/aLDMTtfb5GrKix7yme9dVSPuzP8k+5mXqVJYagQIbGPzzPrK1NUQH0iBg9UKyixjKCU6NSTL6U=
X-Received: by 2002:a05:6638:1643:: with SMTP id a3mr20370577jat.104.1597767912201;
 Tue, 18 Aug 2020 09:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200806161643.1694266-1-lorenzo@google.com> <CAHo-Ooxh7OWkkGP58YPE-0aeQ5wn6juGb0rfgMmuHC53quJaZA@mail.gmail.com>
In-Reply-To: <CAHo-Ooxh7OWkkGP58YPE-0aeQ5wn6juGb0rfgMmuHC53quJaZA@mail.gmail.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Wed, 19 Aug 2020 01:25:00 +0900
Message-ID: <CAKD1Yr1FBrn2koGJYvkg+=KiwqfFPL1Wxi2P=NN8-7Np9JiCBw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_ether: enable qmult on SuperSpeed Plus as well
To:     =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>
>
> Though I think this probably deserves a fixes tag of some sort.
> Probably:
>
> Fixes: 04617db7aa68 ("usb: gadget: add SS descriptors to Ethernet gadget"=
)
>
> since that's the commit that did:
>
> -MODULE_PARM_DESC(qmult, "queue length multiplier at high speed");
> +MODULE_PARM_DESC(qmult, "queue length multiplier at high/super speed");

Thanks for the review. Added Fixes: tag in v2.
