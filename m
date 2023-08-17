Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC4377F776
	for <lists+linux-usb@lfdr.de>; Thu, 17 Aug 2023 15:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351356AbjHQNO0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 09:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351466AbjHQNOY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 09:14:24 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEFE30FB
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 06:14:10 -0700 (PDT)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B0383F442
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692278049;
        bh=HsybNoEMSgHDZRacHwfTuFQ9qWZp8fRwqKZOz1990Xo=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=B9IAl4jEbCg4U71Zyq0/t+hgRrl8/tUIIZiHZVYrL61JiB9fr+lYjcDHlPxCD+LZJ
         7ZdhO6grCGSkV/2qJfEfIAkifWBHnTSZJRlww/atg2OOjhnYhThi5/nUYJsSLNb/Eo
         h4T314JkGj3JwrFb51tVSfb9Sf6zVeWlKD6uoeHyF/zzmvTXMyFtE3SSjZlF/hzBUC
         4p2xIBQp9zfzobKYKWs3szshnBVEPTSJ0/lY/9uao6uQ50aKYeHvpPpFgE2RkOpOIL
         E8HdCv9li2S6Qxw17wmQZjuIYiV7XHPvFb+2Kg+I6oA/Y9s+2kMtK71DXT5OjWMJ0X
         E0AUQolYovFtA==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-26b29b33f0cso1180929a91.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 06:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692278047; x=1692882847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsybNoEMSgHDZRacHwfTuFQ9qWZp8fRwqKZOz1990Xo=;
        b=C37V1/DasgIkiblKlN9ab1nPREOE9Gkp+GcmiFN71QNrIjOSjWrjymKziVg+CqQXTo
         sfe0CXJrWbGIDhDlbYEmm6D4BVCdvASqGbCSw6/MMEXVStQjulAy16Jn8Hf3IUkWULxr
         vCvHA97PEWSy3y8Q+uTpqN3EKX7xTgiDgMGAhGgW2YNdZ+1ZKLX6YebKTtVDLYko95q6
         TBqdjXKMDd62QEqy27ghhavb9/TDNyV4VGt3L9MjFvjgWvYX177VQON6lOdd+SldJjTT
         tH9d2hI8ivoFyCn/11ljkbez/Rcw+2s38qNRf9KcX6PiXfmrhPN5pa373H6AGAzLdkp4
         Zaew==
X-Gm-Message-State: AOJu0Yz3T2PwhkBHhGX6VLrfHFvXrQ2hlQw4O3F+fNGByVKlEKgi9J7y
        gaclvK0m1URTSu0TZ3yYRloLEB9koh/C/CDTvev1anokWK2FzNxyy5dYx9nfSsVjFFIthQyJcl7
        mE9xJxfvrGyMK7uSJ3735sqTNAlhz5BRuQhZrdVDjh0f/UiY+YSyQGLGNt3Zaww==
X-Received: by 2002:a17:90a:d30c:b0:268:8ff2:5c0d with SMTP id p12-20020a17090ad30c00b002688ff25c0dmr3458278pju.17.1692278047744;
        Thu, 17 Aug 2023 06:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu7nzNS6adVEfFVLFWCjZeNyh0DiAJBdKwEJ+hKj2hzssbywbhshEvJ3CS/H+HebaaLPPDUM3yGv6iSJOVvM4=
X-Received: by 2002:a17:90a:d30c:b0:268:8ff2:5c0d with SMTP id
 p12-20020a17090ad30c00b002688ff25c0dmr3458251pju.17.1692278047440; Thu, 17
 Aug 2023 06:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230817093305.212821-1-kai.heng.feng@canonical.com>
 <cc271e17-6204-b610-b40e-5c882ad6be36@suse.com> <ef189a18-98ba-52c9-13a3-ce8531fc18cf@linux.intel.com>
In-Reply-To: <ef189a18-98ba-52c9-13a3-ce8531fc18cf@linux.intel.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Thu, 17 Aug 2023 21:13:55 +0800
Message-ID: <CAAd53p67m3o1nz3cKjiSJWDMWnsoB-4=pFWwBhpaoZ+ns22-tw@mail.gmail.com>
Subject: Re: [PATCH] xhci: Disable connect, disconnect and over-current wakeup
 on system suspend
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 17, 2023 at 8:52=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 17.8.2023 14.18, Oliver Neukum wrote:
> > On 17.08.23 11:33, Kai-Heng Feng wrote:
> >
> > Hi,
> >
> >> So for system-wide suspend, also disable connect, disconnect and
> >> over-current wakeup to prevent spurious wakeup.
> >
> > isn't this breaking the ability to effectively use your root hub
> > as a source of system wakeups? That is, even if you want the
> > system to wake up if somebody attaches a new device, it no longer works=
?
> >
>
> I got the same concern about this.

Per my test, it doesn't work with or without this change. This applies
to disconnection too, disconnecting USB devices doesn't wake the
system up.
Furthermore, if the newly attached device is a USB keyboard, pressing
it doesn't wake the system up either. Probably because remote wakeup
isn't configured when the system is suspended.

Kai-Heng

>
> -Mathias
