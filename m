Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6545A7211DD
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jun 2023 21:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjFCTY6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Jun 2023 15:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjFCTY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Jun 2023 15:24:57 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C03A9
        for <linux-usb@vger.kernel.org>; Sat,  3 Jun 2023 12:24:56 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1a86cdec6so33576791fa.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Jun 2023 12:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685820294; x=1688412294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPBP7cFM65VK4d7cGXRs2PFYxb1iGHlHiPDJNyNspqs=;
        b=qjDVhSbRudndFN94sgFtzcXRAF0RLN2NenNNISxg/WESffzwKEQiXG2H6Nm185sFX/
         +StmS923OMStCEjigtgVh7jaWKyDOWO/KTG7pMm0LvaKJDxY0jhe1RnGW+P2Fvo7wUD9
         KnagPZoQSOcvs/1CnajzhVF3xhWt4Q3+b5Kp3c6/FvKj58NFk5f5yE3j9SZ1tjsqpYCj
         sczMiommne8Kp0JqnbrX/KA6MyTuCZ6FUjn1StddpTm5J1pWGrXjL3O28ghrzAijyajd
         xmpzHvYzvD7mITfoGIAAQOtGFsvBRQFzcOdXZ02jnyl+QV4f3RQAmTmzlFkvjK26Iv9N
         /LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685820294; x=1688412294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPBP7cFM65VK4d7cGXRs2PFYxb1iGHlHiPDJNyNspqs=;
        b=XzUWKPntl0b598xx1+MIznjxWrDt2RhCIwE2A8xgb8ThDY8XuYX+xEngkUl0h1NVQm
         9/cJX7uYVKnd03AAPed/l/bvZr9fyoL3Xb4oGco8i5rPFP+2MFV65T2QAaH/6cX7gtn7
         G0iQNUGHMG757RLu+b2z+4imddH4Navz/7g+fVdE32y6I03kJSe6q7U9wB7wP2M3cRkx
         yxEwwDe/JGZnMr7ayA8Y9p+/lnjfTRdBgIf5KebZW8gcBs0zOhAb5g86a7NZp/tL0NJT
         tKid1asRhmWC75rLW9VcOSsMl3Ank9Ph5TwfAtGrqibMrFesfjHwde8JDNGN06BB6Pwg
         8xpw==
X-Gm-Message-State: AC+VfDzLg4txM1JjIxfJtEPoQ1NVXajcdO4oWVqQsNrUoVHeEg08lGfT
        eamjY8clHRq8MY+BFdCUSRQtMG5VRU3bz+4huOQ=
X-Google-Smtp-Source: ACHHUZ5FJc3453i6H7Lqo9H/Gcoh+uKvdawJ7aJJkzfTj04Fvl3J2S+9+sd8IiB2pGr7Y3IBXqkhlon+eHXGIeqogyo=
X-Received: by 2002:a2e:b16b:0:b0:2af:1817:26e1 with SMTP id
 a11-20020a2eb16b000000b002af181726e1mr2022620ljm.30.1685820293995; Sat, 03
 Jun 2023 12:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230602091055.65049-1-mika.westerberg@linux.intel.com> <20230602091055.65049-4-mika.westerberg@linux.intel.com>
In-Reply-To: <20230602091055.65049-4-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Sat, 3 Jun 2023 22:24:38 +0300
Message-ID: <CA+CmpXs2K8Bi2xHk_hhWC3x6rVeTQ=SbtjuxLSBV+3rjHRwxVQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] thunderbolt: Enable/disable sideband depending on
 USB4 port offline mode
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh H Patel <utkarsh.h.patel@intel.com>
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

On Fri, Jun 2, 2023 at 12:11=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> When USB4 port is in offline mode (this mean there is no device
> attached) we want to keep the sideband up to make it possible to
> communicate with the retimers. In the same way there is no need to
> enable sideband transactions when the USB4 port is not offline as they
> are already up.
>
> For this reason make the enabling/disabling depend on the USB4 port
> offline status.

I'm probably missing something here, but if we don't allow disabling it whe=
n the
port is offline, and when the port is online the sideband is enabled, when =
can
it be disabled? If we can manually disable it when the port is online, on
enablement we can't assume that it's already enabled just because the port
is online, as we might have manually disabled it earlier.
