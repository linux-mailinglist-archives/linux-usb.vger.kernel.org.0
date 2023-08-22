Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 116307842A3
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 15:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236210AbjHVN7J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 09:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236217AbjHVN7I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 09:59:08 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9982A1B0
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 06:59:06 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so14055a12.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692712745; x=1693317545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPGM5RVHi5jU+limoUaeJUjHT2RNv1A7hPggc62V3I4=;
        b=XS+OgnEf49/14lamU0axwa3HkbbVCTdijXW7xATkRaqeuAwn2tzzGlQTfPiKhoqR+1
         JmwYjClfgQwyEeXS+XbAPWaO9nQqsYGg0Ye5n5STs8l2OJI923hcQ2bWWN+p8mYxsd8E
         e3EsA27C0cko2OC9bSAWW/VKJP0FGytxgeRhSWHzx6kRmAEpDT+oEwqigSt9DlYunvlp
         6MrCUXF8zqN+onuIwQcNoONhN0abn+5ZuTBxbQ9p7vLe52fLFdkK4AG2spk5NAFdB2hk
         FTgfYXPbg3yobXvQcSoHIR4hbzZTo1VQzPHKKP2ScR6SKn93tVQwzCivSySIedOtP1ua
         wK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692712745; x=1693317545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPGM5RVHi5jU+limoUaeJUjHT2RNv1A7hPggc62V3I4=;
        b=H/ChtAYfNaO43QFAH+VFge0BPHChlhExS/8fWB2IYQYfHyvhl531i9T1l2/xNL/sU2
         rAGylT8ZkfOlOfmPNXQMX8DU2UcZ+jyVQqkZfDoY9RCN5SisNR9lt/GdpaQvbTx8ZlDX
         k/kAga4iJ8fsSMMUlCm6IiLdwlYy3Gzal6Uc1KnZjGkbIXTTKLYSfVHnaZemH286uM6C
         w0MfqYvjjxd5e1cCmS6rrH6QGNBTy2xeI/Njb2e9URzJnYrg6Ws4YjnUYnxzp4tM0Gp+
         iE5qsa9QZ/rlguUq1i53eKGfHIP02uxo8SOOQ0yqc3RyImaHDxZDs+pdM6tIJD03ZQkI
         iPNA==
X-Gm-Message-State: AOJu0YxoOiLef6tP+XLUTtCBiN0rOivlRhM1+WylL8oNCNu7PgNgSIoq
        mbpBGBQphvVsTx60gwtRQ119iwN0qxwc2oRd2Cm4Yg==
X-Google-Smtp-Source: AGHT+IEmv5mcdpnQaS8lFmuRhq5zxQ+OmAWLSEX052jQOosQoZXyiFB2C8spoUj8fsAiRl/5osUV+P+IQGAc/qrISiQ=
X-Received: by 2002:a50:d5db:0:b0:522:41c9:9b9 with SMTP id
 g27-20020a50d5db000000b0052241c909b9mr100866edj.5.1692712744855; Tue, 22 Aug
 2023 06:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20230822133205.2063210-1-heikki.krogerus@linux.intel.com>
From:   Benson Leung <bleung@google.com>
Date:   Tue, 22 Aug 2023 06:58:52 -0700
Message-ID: <CANLzEku0C9YuRHJLMnvOKUn5StYzn=1FD0-0aFyZM3CgE+kaSQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] usb: Link USB devices with their USB Type-C
 partner counterparts
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Jameson Thies <jthies@google.com>,
        Prashant Malani <pmalani@google.com>,
        Won Chung <wonchung@google.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Tue, Aug 22, 2023 at 6:32=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Benson,
>
> RFC for now. I can't test these properly. If you guys could take over
> this, I would much appreciated. I hope this is at least close to your
> proposal.

Much appreciated for the quick turnaround. Yes, I can test this on our
systems that have subsystem linking enabled. (speaking of which, would
be interested in getting a sample of one of our Chromebook systems
that fully implement the typec subsystem linking)?

>
> With this (or something like it) you should be able to get
> notification about USB connections and disconnections to your port
> driver by implementing the new "attach" and "deattach" callbacks in
> struct typec_partner_desc. The typec partner devices will also have
> symlinks to the enumerated USB devices and vise versa.
>

Got it, i'll modify the cros_ec_typec driver to implement these
callbacks, and look for the new symlinks.


> I took a little shortcut and did not implement a proper device list.
> Instead there is now only a member for the USB2 device and a member
> for the USB3 device in struct typec_port, so with this only USB is
> supported. But the API does not deal with struct usb_device, so
> extending this to support other devices (TBT, Displayport, etc.) by
> adding the actual device list should be fairly easy.

Excellent! Thank you.

Benson

>
> thanks,
>
> Heikki Krogerus (2):
>   usb: typec: Link enumerated USB devices with Type-C partner
>   usb: Inform the USB Type-C class about enumerated devices
>
>  drivers/usb/core/hub.c          |   4 ++
>  drivers/usb/core/hub.h          |   3 +
>  drivers/usb/core/port.c         |  19 +++++-
>  drivers/usb/typec/class.c       | 108 +++++++++++++++++++++++++++++---
>  drivers/usb/typec/class.h       |  16 +++++
>  drivers/usb/typec/port-mapper.c |   9 ++-
>  include/linux/usb/typec.h       |  37 +++++++++++
>  7 files changed, 184 insertions(+), 12 deletions(-)
>
> --
> 2.40.1
>


--
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
