Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12EEA712C91
	for <lists+linux-usb@lfdr.de>; Fri, 26 May 2023 20:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243357AbjEZSgg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 May 2023 14:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242366AbjEZSgQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 May 2023 14:36:16 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB72410E5
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 11:35:50 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-307d20548adso664650f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 26 May 2023 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685126120; x=1687718120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db6jce3gu9KBtT7vEVL8/DVaa8B/fE0qESwZRWKsFv0=;
        b=SdQe8CYKsvFXiQ9Mze3z5+9i2pnkTJEWtbfw/zmx/IepfX0Pyr/P4NjSGYErc9taTn
         dtqhxXxkQpr4Yh7m9W7ULyal75hEQhX+E3sbFAx6l8uJpPTnC5L6DORJKTXQGhf7Pv3c
         rEOizQFF860JDads6tzSKhMu/Qrn0y2IiFq6NG5B7qzZCC4NNn4fO4K1uxCvgIr+ZPWV
         DJnkvuSwxUaWee5tj1ohC5xWwqaEzgw+m6tEhaolfSwWP8u+FRv96PP7qwfpxnqhbuoG
         skVXO7zOsZC51vVMlF1e9+7ac0yAB41/SaJUIGMpm4bHDlXQdZHrqpxltGDJN3xst/XD
         2AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685126120; x=1687718120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db6jce3gu9KBtT7vEVL8/DVaa8B/fE0qESwZRWKsFv0=;
        b=RRChmj+fH0NSTlhdSQNxDUgv0ZgaMCL4pRV2xcGxMMABblckIHfpnZgO0tm+W55FJl
         +jAfmLqxzzkMjN+PAEFmh8c5kuR+sH0faNmDUspJKn19xa/Ra13tVaZcgp322XNmIbs2
         dIXGJ59cpVg+1h7UkrlWKzh+rCkpFZIdMgAOggPISauo7R1w93ss2zTHs2RXqSfI3cC6
         ezNTB7ssbjLENcM40wYXhWg3hoiKMfd/F/sYyJmXACFfEfDHuT/++u20k3CAj9gVhApP
         s0p+pXaqPdJjFDf342Jn4Ktn3fuXQZV4HQRttI/chIAP4IHrtAMC12GWiS6Z7iouHrLh
         vcTg==
X-Gm-Message-State: AC+VfDzilrcQ4YrOzSaJAI1Zvrmm5+kxgJ7OVVMTI5PC6XCpM+9IEsPn
        8ML+NwoWsVtfGmhR8/3oL5lZAdFfO7iL4iw6t4P1Yw==
X-Google-Smtp-Source: ACHHUZ7JOO0prDa7r9iHlcXUDiMDx7oe5IuwiCDbhLPSVGjcsA9iJMjUg2G9PlkSOJZelw18UwvaT436hRdcz0VBoik=
X-Received: by 2002:a5d:6644:0:b0:304:6fef:f375 with SMTP id
 f4-20020a5d6644000000b003046feff375mr2068602wrw.70.1685126120355; Fri, 26 May
 2023 11:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230525173818.219633-1-royluo@google.com> <2023052600-survey-fondness-27ce@gregkh>
In-Reply-To: <2023052600-survey-fondness-27ce@gregkh>
From:   Roy Luo <royluo@google.com>
Date:   Fri, 26 May 2023 11:34:44 -0700
Message-ID: <CA+zupgzTe7pVhByLPVr4tn-94kCMZbzNHxf_iVyTa3qi6bzvAQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1] usb: core: add sysfs entry for usb device state
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     raychi@google.com, badhri@google.com,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Bastien Nocera <hadess@hadess.net>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Douglas Anderson <dianders@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
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

On Thu, May 25, 2023 at 5:50=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, May 25, 2023 at 01:31:17PM -0700, Roy Luo wrote:
> > On Thu, May 25, 2023 at 12:10=E2=80=AFPM Alan Stern <stern@rowland.harv=
ard.edu> wrote:
> > >
> > > On Thu, May 25, 2023 at 11:46:23AM -0700, Roy Luo wrote:
> > > > Alan, thanks for the quick response!
> > > > Yes, port_dev->state is indeed the same as port_dev->child->state. =
However,
> > > > I still add port_dev->state because port_dev->child won't be assign=
ed until
> > > > the corresponding usb_device is in ADDRESS state.
> > > > I wish I can assign get port_dev->child assigned earlier, but I thi=
nk
> > > > the current design - assign port_dev->child and device_add() after =
ADDRESS
> > > > state - also makes sense because there are many ways that the enume=
ration
> > > > could fail in the early stage. By adding port_dev->state, I can lin=
k
> > > > usb_device->state to usb_port as soon as the usb_device is created =
to get
> > > > around the limitation of port_dev->child.
> > > > I would be very happy to hear other ideas.
> > >
> > > Is there any real reason not to set port_dev->child as soon as the
> > > usb_device structure is created?  If enumeration fails, the pointer c=
an
> > > be cleared.
> > >
> > > Alan Stern
> >
> > Currently the usb core assumes the usb_device that port_dev->child poin=
ts
> > to is enumerated and port_dev->child->dev is registered when
> > port_dev->child is present. Setting port_dev->child early would break t=
his
> > fundamental assumption, hence I'm a bit reluctant to go this way.
>
> Well, you could remove that assumption by adding a "child_is_registered"
> flag and explicitly checking it.
>
> Alan Stern

Agree that's doable, with the following overheads:
1. We can no longer safely access port_dev->child without checking
    "child_is_registered", and there are plenty of places in the usb core t=
hat
    touch port_dev->child. The implicit assumption could also hurt code
    maintainability.
2. In the worst case where enumeration keeps failing, the retry loop in
    hub_port_connect() would frequently hold device_state_lock in order
    to link/unlink the usb_device to port_dev->child.
This would definitely make sense if more places need port_dev->child early.
However, we only need port_dev->child->state at this point, so it does not
seem like a good deal to me.

On Fri, May 26, 2023 at 12:42=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 25, 2023 at 05:38:18PM +0000, Roy Luo wrote:
> > + * @work: workqueue for sysfs_notify()
>
> Do you really need this?  This should be possible to call in any context
> as kernfs_notify() says that it is safe to do that, right?
>

Thanks for pointing this out!
Yes, kernfs_notify() or sysfs_notify_dirent() should work, will take
that into the next patch.

> Also, what userspace code is now calling poll() on your new sysfs file?
>
> thanks,
>
> greg k-h

We are looking at adding the code to the generic userspace components
if not hardware abstraction layer in the userspace.

Thanks,
Roy
