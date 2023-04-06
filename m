Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804026D9C01
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 17:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238857AbjDFPSW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 11:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238614AbjDFPSU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 11:18:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C818685
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680794258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qquXiU/2x3H25SnwC0hZNKZyA0Exo+GRpogdzQkyT7w=;
        b=HhUtlDLxAEmCJEzfD4sk9ZaJuzRZLNIf88WlEYlqTCwk+lknq3ZFusjhY1rR5VzWyMoufA
        OkCJTtbufxwrIb8QVW/h1myencQ3G0c17bkrBi0VxrOsfBO4cllTWd5lQ7CLwSOgK1q0KU
        GArhyhcnrhLHY5uKCoWbz/H8WWN1jeE=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-4MqoF0K-P9mR2OIeLyPlAA-1; Thu, 06 Apr 2023 11:17:37 -0400
X-MC-Unique: 4MqoF0K-P9mR2OIeLyPlAA-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5425c04765dso390595107b3.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Apr 2023 08:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qquXiU/2x3H25SnwC0hZNKZyA0Exo+GRpogdzQkyT7w=;
        b=Bd25AMpwGEz4SXDL29s8j+OfbEg4jnYGgs0ymj2gp2TLATSMT7GSDBNgZ2ZFxtwbxl
         shQj3Ssg7NQYndyILt16KMtnsfEzK5XHqPbEMB2TLiEBwwD1cWq3oA3FMIhD2g5Kval7
         UhesefrET7W37+cpykDYTJe6fPmZpMGRqzqWuTIPGwZ2aKNRaiDYSmDRlWF4r6mSn3wp
         JtEZvv3vbr2r8SsN8V6qYWF8JEwwQAKLp7qWWUspg/m61m0NWIaxJOB3419I6cDAlkVL
         2EzUPLcVSMalUuxqn0xDd9F1UetWNBNLk9sf/VA9m33GFaB7l8C6bG90lpH6WYsZOa66
         tiww==
X-Gm-Message-State: AAQBX9dNjdWuNvbJDM8yCdnHrpUcR7boAXj5ddFwiUmF+LCQLqfiH9se
        hjznOO5/Tlye/+pDyJZs+KXUfsybf6j9dP1nVrord/iJOm3Dmq//UmnuEc/Ef8gM+CYvkRAsDUJ
        jZg257kYafm27DdAu55fAvgbWJvuiX6DWgatI
X-Received: by 2002:a81:b612:0:b0:544:b8d8:339e with SMTP id u18-20020a81b612000000b00544b8d8339emr6240397ywh.5.1680794256425;
        Thu, 06 Apr 2023 08:17:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ahd0XtWJTYZLaoTAtWuWC/b/CgiFuvguCgXcTF2oZ4U+5mWKNFzH4aGGuc+hbNgldHR6RI4GryP0ucvW4yR3s=
X-Received: by 2002:a81:b612:0:b0:544:b8d8:339e with SMTP id
 u18-20020a81b612000000b00544b8d8339emr6240389ywh.5.1680794256203; Thu, 06 Apr
 2023 08:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230405092754.36579-1-hadess@hadess.net> <2023040554-obscurity-latter-b12b@gregkh>
 <8ee84f3383fb074f031b88c4f030757667635d96.camel@hadess.net> <2023040541-decipher-chowtime-42a3@gregkh>
In-Reply-To: <2023040541-decipher-chowtime-42a3@gregkh>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 6 Apr 2023 17:17:24 +0200
Message-ID: <CAO-hwJJyhWTUdsQri6Sd9GJUF14fkTEgWaZs=ZKKnMS8o170Qg@mail.gmail.com>
Subject: Re: [PATCH v2] USB: core: Fix docs warning caused by wireless_status feature
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 5, 2023 at 8:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 05, 2023 at 08:03:16PM +0200, Bastien Nocera wrote:
> > On Wed, 2023-04-05 at 19:13 +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Apr 05, 2023 at 11:27:54AM +0200, Bastien Nocera wrote:
> > > > Fix wrongly named 'dev' parameter in doc block, should have been
> > > > iface:
> > > > drivers/usb/core/message.c:1939: warning: Function parameter or
> > > > member 'iface' not described in 'usb_set_wireless_status'
> > > > drivers/usb/core/message.c:1939: warning: Excess function parameter
> > > > 'dev' description in 'usb_set_wireless_status'
> > > >
> > > > And fix missing struct member doc in kernel API, and reorder to
> > > > match struct:
> > > > include/linux/usb.h:270: warning: Function parameter or member
> > > > 'wireless_status_work' not described in 'usb_interface'
> > > >
> > > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Link:
> > > > https://lore.kernel.org/linux-next/20230405114807.5a57bf46@canb.auu=
g.org.au/T/#t
> > > > Fixes: 0a4db185f078 ("USB: core: Add API to change the
> > > > wireless_status")
> > >
> > > I do not see that git commit id anywhere, where is it from?  What
> > > tree?
> > >
> > > Ah, input tree, not much I can do there...
> >
> > Yes, it's from the hid tree.
> >
> > Benjamin is waiting on either Alan or yourself ack'ing the changes
> > before pushing it through the hid tree, to avoid stepping on somebody
> > else's toes.
> >
> > The patch seems to fix the warnings in my local tests, let me know if
> > you have any comments about the wording.
>
> Nope:
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>

Thanks!

I have fixed a small checkpatch warning about using space before tab
and applied as the b4 thank you notice should have already mentioned.

Cheers,
Benjamin

