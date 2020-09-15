Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6343C26AA40
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 19:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgIORLb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 13:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbgIORKu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 13:10:50 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05E5C061355
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 09:58:24 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id e14so2300262vsa.9
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2020 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VOZJDXmk4I7sBQkBNkbqiC999QN+5QxW+u+FQGNFV0A=;
        b=e63A8UNiaTNJGTTvmfggSIGCDE9Qr29ZZD6JllO168qvrxrxA3DUc1Nc0Aj64EKijO
         Txj7oJYWDhWJsEevrKKrmbyk5rdsc34U+SxKZ5QUiont8CyFcs3xM360KOTJ8ULfk9OY
         YEz49gC2k6VoBo85MxV1gabmZfVlicl5IiEV4VD6hFQOpw8BTV8zcn5j3akI0pQ9z30i
         BZWkl8m6eDs47dLDELpUGMKc+pKg3BL8DjV62J8OW6zpRnEzMT891r2wzsXZgvekwgbe
         VIdQ8pgY6bgxwrEU6dhpJJxf+mjUd5WpZdwwKWjuyQ3AIqQsBeVwjKEkpKm6wnlhTvx/
         Z9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VOZJDXmk4I7sBQkBNkbqiC999QN+5QxW+u+FQGNFV0A=;
        b=ExA9JMKZpDJLYIUYqmKc+2TKyjQCuswEJSCCOmYqSrvHxSx/ooCfrmXOa2Y3GKtPiI
         ljD+gqCEpUlVXV9Iir5bMGPiXrDO4gt8onJokZtVIs+veLgR9KnF+DpX8Gnfwai+b38p
         tQdpW6UXfLmc41EyETd9a5zF1Tje4JbUNCRCR/XIy4q1oZb16d/z0NxLK10mRy5xmxNa
         MTDF5b9jPehn4imNxFOS/HLiRj23x9SFaKfYnOKVqxGAv7dVp602OcC60OXKMalV5AlE
         MZBp+keAZOUEijj/L35yIGZqPd842qC6EMZi4qj3ldnkefUk8yrCDJKYe54zZL/fVGsz
         vxEA==
X-Gm-Message-State: AOAM530yBhsgqVn2moMbjsOcq5bcOmKFf/mAieS84r0atB5ZCr4Al3Mr
        xvC9bgUrCiffz6xBNCeyAnC0dIwDv4WhcQfEM7kyHg==
X-Google-Smtp-Source: ABdhPJysYGKFNHZgqc12O3FvnUz67CSwz/ASv1bmn+v0ghVePdGTd1m+Au6nssZDFksIeluLQWCCUm7G4yZU6Dv7DF0=
X-Received: by 2002:a67:ee1a:: with SMTP id f26mr2206910vsp.48.1600189102861;
 Tue, 15 Sep 2020 09:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com> <20200915120927.GA1139641@kuha.fi.intel.com>
In-Reply-To: <20200915120927.GA1139641@kuha.fi.intel.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 15 Sep 2020 09:57:46 -0700
Message-ID: <CAPTae5KUMmSGJLj8K8UbGwAwyZyK6YCEYQotOKW24sxRwUrSTg@mail.gmail.com>
Subject: Re: [PATCH v6 00/14] TCPM support for FRS and AutoDischarge Disconnect
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 15, 2020 at 5:09 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 31, 2020 at 07:59:13PM -0700, Badhri Jagan Sridharan wrote:
> > First of all apologies for mixing up the patch version as noted by
> > Heikki and Greg. All of them were v1's but since I was manually adding
> > the version numbers I mixed them up. Using the --reroll-count option
> > now. Updating the patch version to v6 (highest version number in the
> > previous patchset + 1) to avoid confusion.
>
> If this is v6, then where are v2 - v5? And what changed? Why didn't
> you just make this v2?

Frankly, I did not know how to fix the version numbers that I messed
up in the original
patchset. I had, by mistake, versioned the patch5 in the series v5 in
the original patchset.
So I thought I will consistently call them V6 and update all the patches
to version v6 to avoid confusion. To confirm there is no v2-v5 for most of them.
I have also mentioned the actual code changes and versioning changes in the
change history for each patch. Hopefully that mitigates the confusion.
Again apologies for messing up the versioning in the original patchset !
I have started to double check the patch version numbers before sending.

Thanks,
Badhri

>
>
> > I also rebased on to off of the recent usb-next tip:
> > 5fedf0d295d3 (origin/usb-testing, origin/usb-next) Merge 5.9-rc3 into usb-next
> > Which had the following changes causing merge conflict:
> > 3ed8e1c2ac99 usb: typec: tcpm: Migrate workqueue to RT priority for processing events
> > 6bbe2a90a0bb usb: typec: tcpm: During PR_SWAP, source caps should be sent only after tSwapSourceStart
> >
> > Addressed comments from Heikki and Randy which have described in the
> > individual commit's change history as well.
> >
> > Badhri Jagan Sridharan (14):
> >   usb: typec: tcpci: Add register definitions to tcpci
> >   usb: typec: tcpci: Add support when hidden tx registers are
> >     inaccessible
> >   usb: typec: tcpci: update ROLE_CONTROL for DRP
> >   usb: typec: tcpci: Add a getter method to retrieve tcpm_port reference
> >   usb: typec: tcpci: Add set_vbus tcpci callback
> >   dt-bindings: usb: Maxim type-c controller device tree binding document
> >   usb: typec: tcpci_maxim: Chip level TCPC driver
> >   dt-bindings: connector: Add property to set initial current cap for
> >     FRS
> >   usb: typec: tcpm: Add support for Sink Fast Role SWAP(FRS)
> >   usb: typec: tcpci: Implement callbacks for FRS
> >   usb: typec: tcpci_maxim: Add support for Sink FRS
> >   usb: typec: tcpm: Implement enabling Auto Discharge disconnect support
> >   usb: typec: tcpci: Implement Auto discharge disconnect callbacks
> >   usb: typec: tcpci_maxim: Implemnent set_auto_vbus_discharge_threshold
> >
> >  .../bindings/connector/usb-connector.txt      | 128 ++++
> >  .../devicetree/bindings/usb/maxim,tcpci.txt   |  44 ++
> >  drivers/usb/typec/tcpm/Kconfig                |   5 +
> >  drivers/usb/typec/tcpm/Makefile               |  13 +-
> >  drivers/usb/typec/tcpm/tcpci.c                | 146 ++++-
> >  drivers/usb/typec/tcpm/tcpci.h                |  43 ++
> >  drivers/usb/typec/tcpm/tcpci_maxim.c          | 564 ++++++++++++++++++
> >  drivers/usb/typec/tcpm/tcpm.c                 | 291 ++++++++-
> >  include/dt-bindings/usb/pd.h                  |  10 +
> >  include/linux/usb/pd.h                        |  19 +-
> >  include/linux/usb/tcpm.h                      |  24 +-
> >  include/linux/usb/typec.h                     |  13 +
> >  12 files changed, 1266 insertions(+), 34 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/maxim,tcpci.txt
> >  create mode 100644 drivers/usb/typec/tcpm/tcpci_maxim.c
> >
> >
> > base-commit: 5fedf0d295d3ef69fd85fdee4cb68fd3756b54c2
> > --
> > 2.28.0.402.g5ffc5be6b7-goog
>
> --
> heikki
