Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B208B17B13D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 23:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgCEWKT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 17:10:19 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34917 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgCEWKT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 17:10:19 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so3235152plt.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2020 14:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wP8ZLcoVfjRLy2wd1F6p7whOnIttnSe9o981shhqduQ=;
        b=EW642PHINIK0QQBXUVu9+0zYb98h6yXBQ6W1ECVmuPNBpv+xTNekh/mPEorDGkXbrP
         8R/GZTy5gtZKaGotUgRHMrfabg8VJ1UKudix3XnEE4X0wo4xpwsNgzn259YyN7kdpphX
         +NkbZc+7O2mRuEKZocKBF4+CZJu68vbYYfirA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wP8ZLcoVfjRLy2wd1F6p7whOnIttnSe9o981shhqduQ=;
        b=PQJeHpTNSx4X3VsKBXr48v1c4SlyO+haS0A8cjydCxXpoi5pUxnkkqr0IXdfvSln7t
         juMzmzLzDaWQbzdDbwJTJbp+rdLihZeoZyOycnfCIJUiXrbe1aqDPngLJtVkMe42gTtN
         IbkzuYV5WLJIZKVNOyDAX5I2MeiWeUUHlL0uP1JOOJxjuOWixzlLSj1I6pqSJWei2Nmf
         9GnF5XArpU0V8IU/9APbXep7iSW9cTwJReCpLR1xYvFGFvhFg2dortwUsGUpvvc/eqUs
         8hqhVp1UvkGy7+okKJ4wSf+RKbVXSRUThshdn1Aqyg5ZKBctLXoGWc5x7ZqUB8DMg47+
         TxfQ==
X-Gm-Message-State: ANhLgQ1RdvItmA8/KXHALJJjuxpt+SmUt5SYloID2K9V2uZ7/xieUPqw
        DKkiaKiHtVjjf85KPrABvk4qgg==
X-Google-Smtp-Source: ADFU+vsGiwCvQZPWkXv7TRZ4jmXWr6psRLovg1wV5hcbdmqIqfAlL8UTuWw6Uuwi0lyBRg1ClCAohw==
X-Received: by 2002:a17:90a:9416:: with SMTP id r22mr293883pjo.2.1583446217711;
        Thu, 05 Mar 2020 14:10:17 -0800 (PST)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id q9sm32286268pgs.89.2020.03.05.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 14:10:17 -0800 (PST)
Date:   Thu, 5 Mar 2020 14:10:16 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] dt-bindings: Convert usb-connector to YAML format.
Message-ID: <20200305221016.GE142502@google.com>
References: <20200305030135.210675-1-pmalani@chromium.org>
 <CAL_JsqJcJf0JZVHEuY5y0eHLyw3e0Wr2ZDJvPs4=cZaSMWg97A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJcJf0JZVHEuY5y0eHLyw3e0Wr2ZDJvPs4=cZaSMWg97A@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob, Kindly see inline. Thanks as always.


On Thu, Mar 05, 2020 at 03:29:00PM -0600, Rob Herring wrote:
> On Wed, Mar 4, 2020 at 9:01 PM Prashant Malani <pmalani@chromium.org> wrote:
> >
> > Convert the usb-connector.txt bindings file to YAML format. This allows
> > it to be used in dt_bindings_check verification. This patch was
> > born out of a patch series for the addition of a Type C connector
> > class port driver[1].
> >
> > An attempt has been made to maintain the same documentation text and
> > example structure as was in the .txt file, but wherever needed
> > modifications have been made to satisfy dt_bindings_check.
> >
> > Also, update all references to usb-connector.txt to now use
> > usb-connector.yaml.
> >
> > [1]: https://lkml.org/lkml/2020/2/19/1232
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Added type references for some properties.
> > - Removed pinctrl properties.
> > - Updated power-role, try-power-role and data-role properties to be in
> >   valid schema format.
> > - Added OF graph data bus binding property according to reviewer
> >   suggestions.
> >
> >  .../connector/samsung,usb-connector-11pin.txt |   2 +-
> >  .../bindings/connector/usb-connector.txt      | 135 ------------
> >  .../bindings/connector/usb-connector.yaml     | 203 ++++++++++++++++++
> >  .../devicetree/bindings/usb/fcs,fusb302.txt   |   2 +-
> >  .../devicetree/bindings/usb/generic.txt       |   2 +-
> >  .../devicetree/bindings/usb/mediatek,mtu3.txt |   2 +-
> >  .../devicetree/bindings/usb/mediatek,musb.txt |   2 +-
> >  .../bindings/usb/richtek,rt1711h.txt          |   2 +-
> >  .../devicetree/bindings/usb/ti,hd3ss3220.txt  |   2 +-
> >  .../devicetree/bindings/usb/typec-tcpci.txt   |   2 +-
> >  .../devicetree/bindings/usb/usb-conn-gpio.txt |   4 +-
> >  11 files changed, 213 insertions(+), 145 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt
> >  create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.yaml
> 
> 
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > new file mode 100644
> > index 0000000000000..b386e2880405c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -0,0 +1,203 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/usb-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: USB Connector
> > +
> > +maintainers:
> > +  - linux-usb@vger.kernel.org
> 
> Person please. You can put me if no one else.
> 

I will list you as the maintainer.
> > +description:
> > +  A USB connector node represents a physical USB connector. It should be a child
> > +  of a USB interface controller.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - usb-a-connector
> > +      - usb-b-connector
> > +      - usb-c-connector
> > +
> > +  label:
> > +    description: Symbolic name for the connector.
> > +
> > +  type:
> > +    description: Size of the connector, should be specified in case of USB-A,
> > +      USB-B non-fullsize connectors.
> > +    $ref: /schemas/types.yaml#definitions/string
> 
> Needs to be under an 'allOf' or the enum is ignored.

Done.
> 
> Rob
