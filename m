Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8B87801EF
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 01:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356297AbjHQXuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 19:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356330AbjHQXtz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 19:49:55 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578FF3A86
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 16:49:37 -0700 (PDT)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C817F3FA9C
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 23:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692316175;
        bh=6BbeXo8UTwYrifJVaAXx6UEqDSfopA4U70/DY2zh8Ok=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=K3G0fOU+beAY1QsIlZASgv02pX/TG0WdYD0oHgeR6LfBqSfg1BYTmmSZ/aImeNGBO
         4is5ub9EAduhyd0u86LAv4jeou6r7tlqAuoVBz8Fxq/qswvnSJgMQ/suPDoxHwfhHD
         Tz0NVx5gQ+DhImezNiNXvipyUh53vXlJo8f+csbp6cPXI1kv3acfLyEUBYo23CE0ax
         M5ZOR47ToW+86hLN33Zme2F7fIkveC3CEtrCrPHbaf+6HNwshgIg9nFNfFglnUCt6+
         zRdAD1eSdsmuZcY4IxYXQJKK+KOFcAF54VU767Fon2GP24HzKIOeyXkUANUSdfAgrw
         ueWrYMQaKFvBQ==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-268099fd4f5so443400a91.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 16:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316174; x=1692920974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BbeXo8UTwYrifJVaAXx6UEqDSfopA4U70/DY2zh8Ok=;
        b=d7tzu0HM7dm5gicJZL/agiqc5LQXhbyj3IuzmXoMR3quUozFjyyoW3vuluuLfm5w3f
         RcyGwBE2mS8/0OdCREZhM81enQftkFhva8ZE9Qf7Er47561CO0MkhVqo+Mui5AS7szgy
         ok7lyq1iFA2tjlZa7g9GbNgmwVWKUjuEPETRh7OIu/6D2xMo8AFApSUgLiQgyN/fIhhC
         yCK+0eZlsYKTbiFNI6PKzl7mWvg07uQJrEU4iuE3C1MRrq05RpRMFOd4UorRU3EfxTvJ
         wCn0LU2DubdjXDd7Dh9WelIM3aBxe4OBd0mttYTvU0OLv6mmzRDQev/OFJXZwApv5Qzy
         Xh3g==
X-Gm-Message-State: AOJu0YzBmxGWZR3Bkd7zd9446GEBBRRcvaJ1ZO8LooKZHT3p/WYBnG/O
        gc21sYugiaBr8KkURwuqI8bMwtJaYOcNC544uvc4v8Vn800+MJiNPnlhmtMjdr1+Stx/inxDavh
        D31RQYim6gME+AqIG4L9eV5FeO2TV0/GvcW9cuVkQGAOlEbCh9QEkyRUxIMKooAQM
X-Received: by 2002:a17:90b:3715:b0:269:2195:c322 with SMTP id mg21-20020a17090b371500b002692195c322mr910296pjb.41.1692316174484;
        Thu, 17 Aug 2023 16:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGARXfDGrVgmDDreuvzjSlxCUtzMIVjFnjG2nKpHFQ3+dVGwso6ygAunD4DVB1W7Fwz+vcbPSZZj7jTM7XyqjY=
X-Received: by 2002:a17:90b:3715:b0:269:2195:c322 with SMTP id
 mg21-20020a17090b371500b002692195c322mr910289pjb.41.1692316174170; Thu, 17
 Aug 2023 16:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230817093305.212821-1-kai.heng.feng@canonical.com>
 <cc271e17-6204-b610-b40e-5c882ad6be36@suse.com> <ef189a18-98ba-52c9-13a3-ce8531fc18cf@linux.intel.com>
 <CAAd53p67m3o1nz3cKjiSJWDMWnsoB-4=pFWwBhpaoZ+ns22-tw@mail.gmail.com> <cc190b72-03cc-400b-9dc4-abef21562eff@rowland.harvard.edu>
In-Reply-To: <cc190b72-03cc-400b-9dc4-abef21562eff@rowland.harvard.edu>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Fri, 18 Aug 2023 07:49:20 +0800
Message-ID: <CAAd53p4oSHqqaMPdh5MuBXMD2bLhGqqZBGbJWPWiij3wU=DX4Q@mail.gmail.com>
Subject: Re: [PATCH] xhci: Disable connect, disconnect and over-current wakeup
 on system suspend
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 17, 2023 at 10:03=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Thu, Aug 17, 2023 at 09:13:55PM +0800, Kai-Heng Feng wrote:
> > On Thu, Aug 17, 2023 at 8:52=E2=80=AFPM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> > >
> > > On 17.8.2023 14.18, Oliver Neukum wrote:
> > > > On 17.08.23 11:33, Kai-Heng Feng wrote:
> > > >
> > > > Hi,
> > > >
> > > >> So for system-wide suspend, also disable connect, disconnect and
> > > >> over-current wakeup to prevent spurious wakeup.
> > > >
> > > > isn't this breaking the ability to effectively use your root hub
> > > > as a source of system wakeups? That is, even if you want the
> > > > system to wake up if somebody attaches a new device, it no longer w=
orks?
> > > >
> > >
> > > I got the same concern about this.
> >
> > Per my test, it doesn't work with or without this change. This applies
> > to disconnection too, disconnecting USB devices doesn't wake the
> > system up.
> > Furthermore, if the newly attached device is a USB keyboard, pressing
> > it doesn't wake the system up either. Probably because remote wakeup
> > isn't configured when the system is suspended.
>
> If remote wakeup isn't enabled then the do_wakeup variable will be 0,
> so your patch wouldn't make any difference.  The question is what
> happens when remote wakeup _is_ enabled.

Nothing happens either per my testing.

For USB keyboard, the remote wakeup is enabled, unplugging it when
suspend is suspended doesn't wake the system up, despite of
PORT_WKDISC_E being set.
Plugging it back doesn't wake the system up either, despite of PORT_WKCONN_=
E.

>
> Did you check the settings in the controller's and root hub's
> power/wakeup sysfs files?

Yes. It's all correct as keyboard press can wake the system up.

Kai-Heng

>
> Alan Stern
