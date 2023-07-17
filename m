Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756717563DB
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 15:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjGQNJG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 09:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjGQNJB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 09:09:01 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85681702
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 06:08:55 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4036bd4fff1so517981cf.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689599334; x=1692191334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwG4pLwbZpbFz2f3UA6M57C15TupxBqSjFfM0xiN0Bs=;
        b=LkZLyoCtKwuPaDgwjMHTWolxgkFRRuSNSK/4tmQJNiypXR3syR61t3f/pVa96sfK1c
         +C3+qein6/FUMNUMIAkSdsO6hFPayWQGE2EdZxMvWsyPWcadTBIXvfwnXCuytgq11K1+
         xt7u2293j6E4Z4X7z83THXO77GcftUNmzfrH+2P5EqhZAu+pm8JOkF/1mjEkw1IfhUow
         OeCkLzenry+/JPgObmaWcpQ4n7G+xfLG+pIK7kAIad0x0bqDz4QgZgHnuz7mQBIPDl8Z
         hkOF9FhiPVmTC54ddJ7XmekvR5VP1ie/JxkMCgeXkbPYBRswxddSis3L4SWJ+h6y2Hgo
         Ywkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689599334; x=1692191334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwG4pLwbZpbFz2f3UA6M57C15TupxBqSjFfM0xiN0Bs=;
        b=EmlRcebWPngthJ/r1jbK8+JWh7LpKLseUKtArFhHIABn0BqZJf3eJKofraJMFhB5Uw
         MQLkyn4sn3eWMr70dMZY1Bw6f8gczHrO8+Ang3n7zS+2jvFvfu5/p8ciAzCKWmX/KA0o
         +giXHznYKq+q7ofaBPvOOLrVkG5nkbPCq4N5cCoSjoRQ3xESUThjBNs9Xc+rXilIRW5n
         yCGQbj1XvY61i1owUejZM01uixmAnN/RpKkAFdZiXQcfqH59k6DaNHkFqhTLko5fgune
         /ZPFpPE8jvjlI4AK4BvTjppBBG/ftLHq/6aYLrVo1X0OkhTaSDRedAPYjk5+wsmGo0hJ
         ijIA==
X-Gm-Message-State: ABy/qLZ2ozXFMcFWy2RbA05x31+32kur5X9jNKxEfcedyiHqAvox/fH3
        JUPXZGX+03TWqcfi4cTyVMbtA2ZzNoQoTff1eFaouUu3rO8/9H28uv3L9Q==
X-Google-Smtp-Source: APBJJlEzIwNRmj7Q3owFw5MctOPvb+9dGkANchM532Bs3lCdASQgBI+y5KaXn0Lzx4BwCDAgO1yL5/laqQe50ve5MWY=
X-Received: by 2002:a05:622a:307:b0:403:b1e5:bcae with SMTP id
 q7-20020a05622a030700b00403b1e5bcaemr1385264qtw.10.1689599334071; Mon, 17 Jul
 2023 06:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230712072853.1755559-1-kyletso@google.com> <20230712072853.1755559-2-kyletso@google.com>
 <20230714160912.GA3920890-robh@kernel.org>
In-Reply-To: <20230714160912.GA3920890-robh@kernel.org>
From:   Kyle Tso <kyletso@google.com>
Date:   Mon, 17 Jul 2023 21:08:38 +0800
Message-ID: <CAGZ6i=3yjsLha8RvwoZiJZ+eqM5Mcntw2X312j6k9yvnZQN62Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: connector: Add child nodes for multiple
 PD capabilities
To:     Rob Herring <robh@kernel.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, badhri@google.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 15, 2023 at 12:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Jul 12, 2023 at 03:28:52PM +0800, Kyle Tso wrote:
> > Define a new optional property "capabilities" which is a child node
> > under connector to contain multiple USB Power Delivery capabilities.
>
> Is multiple capabilities a USB spec thing or some Linux feature? I think
> DT should only define the limits of the h/w capabilities and if the OS
> wants to define multiple profiles within those limits that's its
> problem.
>

It is a feature introduced in the commit 662a60102c12 ("usb: typec:
Separate USB Power Delivery from USB Type-C")

> >
> > Define a new property with pattern (e.g. caps0, caps1) which is a child
> > node under "capabilities". Each node contains PDO data of a selectable
> > Power Delivery capability.
> >
> > Signed-off-by: Kyle Tso <kyletso@google.com>
> > ---
> >  .../bindings/connector/usb-connector.yaml     | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/usb-connector.=
yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > index 1c4d3eb87763..b8c96d0a127a 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -228,6 +228,50 @@ properties:
> >        SNK_READY for non-pd link.
> >      type: boolean
> >
> > +  capabilities:
> > +    description: A child node to contain all the selectable USB Power =
Delivery capabilities.
> > +    type: object
> > +
> > +    patternProperties:
> > +      "^caps[0-9]+$":
>
> caps-[0-9] is more the convention.
>

will update in v2

> > +        description: Child nodes under "capabilities" node. Each node =
contains a selectable USB
> > +          Power Delivery capability.
> > +        type: object
> > +
> > +        properties:
> > +          source-pdos:
>
> You are now defining the same property twice. You can use '$defs' to
> define common properties and then reference them. Or put all the PD
> properties into its own schema file and reference it.
>

will update in v2

> > +            description: An array of u32 with each entry providing sup=
ported power
> > +              source data object(PDO), the detailed bit definitions of=
 PDO can be found
> > +              in "Universal Serial Bus Power Delivery Specification" c=
hapter 6.4.1.2
> > +              Source_Capabilities Message, the order of each entry(PDO=
) should follow
> > +              the PD spec chapter 6.4.1. Required for power source and=
 power dual role.
> > +              User can specify the source PDO array via PDO_FIXED/BATT=
/VAR/PPS_APDO()
> > +              defined in dt-bindings/usb/pd.h.
> > +            $ref: /schemas/types.yaml#/definitions/uint32-array
> > +            minItems: 1
> > +            maxItems: 7
> > +
> > +          sink-pdos:
> > +            description: An array of u32 with each entry providing sup=
ported power sink
> > +              data object(PDO), the detailed bit definitions of PDO ca=
n be found in
> > +              "Universal Serial Bus Power Delivery Specification" chap=
ter 6.4.1.3
> > +              Sink Capabilities Message, the order of each entry(PDO) =
should follow the
> > +              PD spec chapter 6.4.1. Required for power sink and power=
 dual role. User
> > +              can specify the sink PDO array via PDO_FIXED/BATT/VAR/PP=
S_APDO() defined
> > +              in dt-bindings/usb/pd.h.
> > +            $ref: /schemas/types.yaml#/definitions/uint32-array
> > +            minItems: 1
> > +            maxItems: 7
> > +
> > +          op-sink-microwatt:
> > +            description: Sink required operating power in microwatt, i=
f source can't
> > +              offer the power, Capability Mismatch is set. Required fo=
r power sink and
> > +              power dual role.
> > +
> > +        additionalProperties: false
> > +
> > +    additionalProperties: false
> > +
> >  dependencies:
> >    sink-vdos-v1: [ 'sink-vdos' ]
> >    sink-vdos: [ 'sink-vdos-v1' ]
> > --
> > 2.41.0.255.g8b1d071c50-goog
> >
