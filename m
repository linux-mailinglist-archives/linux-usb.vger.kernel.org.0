Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E39D27BB2D
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbgI2Cuz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:50:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgI2Cux (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:50:53 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9029C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:50:51 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id z46so2909061uac.13
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9GAx9Hq+6Fd4bQwloLgfvRlKb4EZ2XSFfzzTZelLVOg=;
        b=XGMpnQZ0Z8QdS1DSFWNLhlhz1hHsTJbzGZnnAf2lMIp8bD1BwTVwxkL4kQtCH9W4rt
         XSmDhTptjQcg3tPs6EiP5Sz0xlUzDHRdvj/gGkdVNO5wFOmif2ji72sIDCxfcS1O8V3O
         jM+Zp+Bk8R5brBRSuSuFdWDZWD3slhpiIIUzkrek1IKSd3EiwW7inuLNbAfFwKzRRRwO
         oYLUyv96YseczUFA48+rSFMTYjVhig7h0yBTc+yHPP9IpjGHkQDop7e8cEXZ8Ra1fLaG
         txuZck9nGQ3rzk01QLBfJc7bCefclzdyMomYNlfagywutaBQa2laMskGv7mQRgsX2bmc
         9VhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9GAx9Hq+6Fd4bQwloLgfvRlKb4EZ2XSFfzzTZelLVOg=;
        b=fuYavLA1AOKKhz8LomDiH+YJdZWjhdFA9TkpqEgnTaMSAurPEqR7Ub5zNZiW1BXZ5V
         MmWU4FwF1oRmlikHqvery8Jw1EF+Lzg1DFttG2PegLihu0WFmylmP1uzx0LWvGUtwHX1
         3K4bqrk8Mc1EBLLIjzAMDJPIdwEihC0pWWrF/9xPiI+EYYAE01lcNnb9Qc+ApaEG2hu7
         nsMcdiEercR6Yc/4V0QZGTRgV3bfReEN4Iqg2Yrqgjh7BNoMndUWcr+dYSc2Xo1FHTqm
         FLY/318+DTuR+6ORXqKvWR8Ej+r22V/qdperMC4q0tcN/W8ChxiBbIFp/cZP0XSoDTg9
         v42Q==
X-Gm-Message-State: AOAM530BWSTWPK/XffpRrhGybSKqdzbvOkqiuyfmcp/+ZT9AOY3zr0dj
        6DfmHnrP2nC418AGf9VX3ahtlyFguBbtJtMwN1X3QQ==
X-Google-Smtp-Source: ABdhPJykPD/wVu/GuqVLoAl0CUFyZ7Ig8IoI86G9PLllJY5ozDYdyZ0XkHUtE//4LZNoNAjteIoKJ2UvMV/tMEXoelM=
X-Received: by 2002:ab0:26d0:: with SMTP id b16mr2589802uap.1.1601347850564;
 Mon, 28 Sep 2020 19:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200921195555.1050731-1-badhri@google.com> <20200921195555.1050731-5-badhri@google.com>
 <20200922160411.GB2759479@bogus>
In-Reply-To: <20200922160411.GB2759479@bogus>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 28 Sep 2020 19:50:13 -0700
Message-ID: <CAPTae5+Pe1m=TUhmPJY91eJbP+B6UroqBo3u7m0AC8YS1WPu9g@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] dt-bindings: connector: Add property to set
 initial current cap for FRS
To:     Rob Herring <robh@kernel.org>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 9:04 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Sep 21, 2020 at 12:55:49PM -0700, Badhri Jagan Sridharan wrote:
> > This change adds frs-typec-current which allows setting the initial current
> > capability of the new source when vSafe5V is applied during PD3.0
> > sink Fast Role Swap.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> > Changes since v1:
> > - Changing patch version to v6 to fix version number confusion.
> >
> > Changes since v6:
> > - Removed the redundant usb-connector.txt that I created by mistake.
> > - Moved to yaml.
> >
> > Changes since v7:
> > - Rebase
> > ---
> >  .../devicetree/bindings/connector/usb-connector.yaml   |  8 ++++++++
> >  include/dt-bindings/usb/pd.h                           | 10 ++++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > index 9bd52e63c935..1ca8e6a337e5 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -142,6 +142,14 @@ properties:
> >      required:
> >        - port@0
> >
> > +  frs-typec-current:
> > +    description: Initial current capability of the new source when vSafe5V
> > +      is applied during PD3.0 Fast Role Swap. "Table 6-14 Fixed Supply PDO - Sink"
> > +      of "USB Power Delivery Specification Revision 3.0, Version 1.2" provides the
> > +      different power levels and "6.4.1.3.1.6 Fast Role Swap USB Type-C Current"
> > +      provides a detailed description of the field.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Looks the same/similar to this[1]. Please come up with a common
> approach to cover both.
>
> Rob
>
> https://lore.kernel.org/linux-arm-kernel/20200902075707.9052-2-amelie.delaunay@st.com/

Hi Rob,

The values will not be an exact overlap as it's a different
functionality. [1] introduces a property
for defining the power operation mode for the type-c connector.
However [2] introduces a property
to define the new-source's current capability during Fast role swap operation.
However, I modified [2] to use string based enums to follow the
pattern in [1] in v9 version of the
patch which I just sent out.

1. https://lore.kernel.org/linux-arm-kernel/20200902075707.9052-2-amelie.delaunay@st.com/
2. https://lore.kernel.org/patchwork/patch/1309792/

Thanks,
Badhri
