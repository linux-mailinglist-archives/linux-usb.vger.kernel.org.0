Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01A516F623E
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 01:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjECXw7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 19:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjECXw6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 19:52:58 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53910903A
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 16:52:51 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-24e4f674356so1133817a91.3
        for <linux-usb@vger.kernel.org>; Wed, 03 May 2023 16:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683157971; x=1685749971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIk186o9zoU+mH9r76xErzn/99J8aYL+vdhv+aIdc+U=;
        b=SqfLZAXg/l88TDO+OsrXZVcZFb6V6f1Q+efyB31p2r9PNxlRc3eTU52bgTZRc+jQYq
         DuX+kmZM38KFAEPH9tqVJZO7ED+df11RKSSXsKOA3jH5bSUSivfS2TdDkHpb8lj+QI1T
         2zyJ9Rn7faPmjPqhhJRmx4PBguV2dpspCQjVS1q1O+lCuyO6DU7mgGKC7vNQaZDEnM9R
         Nr83bdxfjPEKs/N8AQh+D3B1fWfhMu+SIE/GPBRnmd5xJW9CCMLrkPm16GvfluGgZFOX
         m5P1g/+3x+4vDYjdZbJfCHgvhNXvWR9TFx82p9z+dULbdSNKWosOnBryG6ekyWTNstTh
         4oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683157971; x=1685749971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIk186o9zoU+mH9r76xErzn/99J8aYL+vdhv+aIdc+U=;
        b=ZoOASYsg7lMFl0bPMFO6YTZpmRfOqr984aQxlzUNB7Fxhh935gHal8tzv2BbOPLiwr
         7ksZIQsiP3/mVvk/bgOahKCcjIlTp81jL6GHfcIl0HyM3WERNTcFBHnGoqRr/93cY71q
         ZY0e0/sTpoOJ4RoBdSEBBVw2ODmYyAp0mgWthGwKv5gTsSXRfsbR6T7LNSB1dSUysokg
         A0sf/rvWyZLYP25j5VPG2lqFhBnTO1U3/dB2KVts6YRdbN+2SjUSu44Bo3a31DPAjDd4
         mRvLug7jByDE0XPOtBJ43pb9io57rP/JEHM5mdwzuC26IO6ytPX3Duh33QrJ5spCWlDd
         N5tQ==
X-Gm-Message-State: AC+VfDxZYl+9cRN54sJQ8ePsVhvjrr4R1S2H5j5mj+PItkiNAzphOBDb
        LzhrhigjBF8oXR0LtWig+txOVmBHMY9Euo4iyOYHQw==
X-Google-Smtp-Source: ACHHUZ6IvK70ra4SbMwggP39kQV39c9YHLb6NIq/oUHesC3ufy/d/lgHtkxwpjTxLgX6H0Oi5Yq7MhZjRGw8RemgCx8=
X-Received: by 2002:a17:90a:883:b0:24e:20df:e74d with SMTP id
 v3-20020a17090a088300b0024e20dfe74dmr334855pjc.18.1683157970566; Wed, 03 May
 2023 16:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230503003144.3782774-1-royluo@google.com> <20230503230053.mbhh6p2h4qakfc65@synopsys.com>
In-Reply-To: <20230503230053.mbhh6p2h4qakfc65@synopsys.com>
From:   Roy Luo <royluo@google.com>
Date:   Wed, 3 May 2023 16:52:14 -0700
Message-ID: <CA+zupgxGesS5MVUW6uHAzA7QzS_gq-CYQdfP+ZBVCv_2NSDVeQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: Add error logs for unknown endpoint events
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "badhri@google.com" <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 3, 2023 at 4:01=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Wed, May 03, 2023, Roy Luo wrote:
> > In cases where the controller somehow fails to write to event buffer
> > memory (e.g. due to incorrect MMU config), the driver would receive
> > all-zero dwc3 events. However, the abnormal event is silently dropped
> > as a regular ep0out event.
>
> When it does happen, will these prints flood the dmesg log?

When this does happen, the driver cannot do the required actions to
move things forward in correspondence to the HW events (e.g.
Xfercomplete, reset, connection done, etc.).
Therefore, the controller might throw some events in the beginning but
it would cease quickly until the host does a new move that triggers
the controller to send new events.

>
> > Add error logs when an unknown endpoint event is received to highlight
> > the anamoly.
>
> anomaly?

Thanks for catching this typo, will fix it in the next patchset.

>
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/ep0.c    | 2 ++
> >  drivers/usb/dwc3/gadget.c | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> > index 953b752a5052..8c9560a9999e 100644
> > --- a/drivers/usb/dwc3/ep0.c
> > +++ b/drivers/usb/dwc3/ep0.c
> > @@ -1207,5 +1207,7 @@ void dwc3_ep0_interrupt(struct dwc3 *dwc,
> >                       dep->flags &=3D ~DWC3_EP_TRANSFER_STARTED;
> >               }
> >               break;
> > +     default:
> > +             dev_err(dwc->dev, "unknown endpoint event %d\n", event->e=
ndpoint_event);
>
> Can we add a break here?

Sure ,will do it in the next patchset.

>
> >       }
> >  }
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index c0ca4d12f95d..054f6f297e17 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -3803,6 +3803,8 @@ static void dwc3_endpoint_interrupt(struct dwc3 *=
dwc,
> >               break;
> >       case DWC3_DEPEVT_RXTXFIFOEVT:
> >               break;
> > +     default:
> > +             dev_err(dwc->dev, "unknown endpoint event %d\n", event->e=
ndpoint_event);
>
> and here too.

Sure ,will do.

>
> >       }
> >  }
> >
> >
> > base-commit: c8c655c34e33544aec9d64b660872ab33c29b5f1
> > --
> > 2.40.1.495.gc816e09b53d-goog
> >
>
> Thanks,
> Thinh

Regards,
Roy Luo
