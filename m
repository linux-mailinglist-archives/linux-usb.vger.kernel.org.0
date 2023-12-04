Return-Path: <linux-usb+bounces-3703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86183803B5D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 18:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01089B20B1D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 17:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988482E828;
	Mon,  4 Dec 2023 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eokOZBp0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF32A9
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 09:24:27 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4255cc2bcdaso223091cf.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Dec 2023 09:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701710666; x=1702315466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP4cvc0Driv28VGSNnxC3FA51bSIIb687QRO9gk4a5M=;
        b=eokOZBp06cKJSsoVwc+zSM5fLYK9paQQR8+ZvV1fZ2c2MrQ0In6DtNVDa4VXLveSwe
         /b6kXk7gqjZWINjppurJvwP9StVb3jkgkBsXZSMpp5lP97IAFx0UZbvmbHBUZrPjkGqZ
         786tix4UuGVMmwbMQMxaLt5cil8CzDaXWMoJhd3nedifTygZV/bKXtYoncuspWg7j+rG
         +wjAD6LwEIReFCOO+hTmYlg/BqeTjtnzUA7TwS6i2XxtXrhkTzNq9hMQbniG+J9M8GQm
         my39tDwcKTBIlhRcCygBaMT1zvx2P7tz0ynOSYW01fuKU0Dg2plLpMVl9K5V146IPixK
         T+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701710666; x=1702315466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP4cvc0Driv28VGSNnxC3FA51bSIIb687QRO9gk4a5M=;
        b=KP+mUgWnW/r8aa7jtsERamIEXuLxwoGnauJyThG6WlOc+VLdSP/o0YL0s44OlnMUMQ
         +BYPhfUIckDcSHfCQKJOeDjhOj4CruwDm8u/Zx4cd3Hungnrdd+C56SZYe1vVm/mKmbj
         FbaxfCYaPKsAh88kT+y1d3G6KyZ6YEoT8YVHvN6aBTQOLBBP0jcW+fMeunFCLtTSf/GD
         Zc26shvwkMi4IGsFrU3yDzLkIObHAVANf0r4uOONZeZV7dxjLzg1Iz8PmQAHfiQMW+2Z
         RJ+Te1TewK4faa5t4whcwZIiBVFlf+PhhSCAu6WaERCIgOHU/p4X8wEkdUigs+QYttIe
         Om8g==
X-Gm-Message-State: AOJu0YwTZX9H+cVNOKNMXS7SsNi0RkM5hBcRwgAbxbV3WGVpGap9LLlA
	toIaRB8AOjvCxbcy1ywfTgOObNV8OqIgdhuyJ64Dgw==
X-Google-Smtp-Source: AGHT+IHxH3q4A/7JsH6yk/RnS8O2o0T5tf68JUS/fiRWVu/44O9eklOOT/sed1ITRauNUnIQE+Y11mSDXlOTlggE+2s=
X-Received: by 2002:ac8:5a08:0:b0:421:6310:b4a6 with SMTP id
 n8-20020ac85a08000000b004216310b4a6mr862294qta.8.1701710665858; Mon, 04 Dec
 2023 09:24:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230807174159.1140957-1-kyletso@google.com> <20230807174159.1140957-2-kyletso@google.com>
 <20230821162517.GA1832382-robh@kernel.org> <CAGZ6i=0ey+94YYgc=os5iQ_pNmNVB=qZQD0=jB4fRTKggZPSWA@mail.gmail.com>
 <CAL_JsqLjAooY27pG4GQHRdpiB_=0RCYrkKOjzAvmvz=5yU71Og@mail.gmail.com>
In-Reply-To: <CAL_JsqLjAooY27pG4GQHRdpiB_=0RCYrkKOjzAvmvz=5yU71Og@mail.gmail.com>
From: Kyle Tso <kyletso@google.com>
Date: Tue, 5 Dec 2023 01:24:09 +0800
Message-ID: <CAGZ6i=2qoi12OJGNmuvVm7wDgbGTnuywpuC=EYZ_MfdNPazNqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: connector: Add child nodes for
 multiple PD capabilities
To: Rob Herring <robh@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 11:36=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Oct 18, 2023 at 12:19=E2=80=AFPM Kyle Tso <kyletso@google.com> wr=
ote:
> >
> > On Tue, Aug 22, 2023 at 12:25=E2=80=AFAM Rob Herring <robh@kernel.org> =
wrote:
> > >
> >
> > Sorry for the late response...
> >
> > > On Tue, Aug 08, 2023 at 01:41:58AM +0800, Kyle Tso wrote:
> > > > Define a new optional property "capabilities" which is a child node
> > > > under connector to contain multiple USB Power Delivery capabilities=
.
> > > >
> > > > Define a new property with pattern (e.g. caps-0, caps-1) which is a
> > >
> > > A property in json-schema terms, but for DT it's a node not a propert=
y.
> > > 'Define a child node ...' would be clearer.
> > >
> >
> > Will do in the future patch
> >
> > > > child node under "capabilities". Each node contains PDO data of a
> > > > selectable Power Delivery capability.
> > > >
> > > > Also define common properties for source-pdos, sink-pdos, and
> > > > op-sink-microwatt that can be referenced.
> > >
> > > Why do we need this? What issue does this solve? The commit message
> > > should answer those questions (always).
> > >
> >
> > Will state the rationale in the future patch
> >
> > > > Signed-off-by: Kyle Tso <kyletso@google.com>
> > > > ---
> > > > v1 -> v2:
> > > > - move source/sink-pdos to $defs and reference them in properties
> > > >
> > > >  .../bindings/connector/usb-connector.yaml     | 80 +++++++++++++--=
----
> > > >  1 file changed, 57 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/connector/usb-connec=
tor.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > index 1c4d3eb87763..c6b02dbda83f 100644
> > > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yam=
l
> > > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yam=
l
> > > > @@ -117,28 +117,10 @@ properties:
> > > >    # The following are optional properties for "usb-c-connector" wi=
th power
> > > >    # delivery support.
> > > >    source-pdos:
> > > > -    description: An array of u32 with each entry providing support=
ed power
> > > > -      source data object(PDO), the detailed bit definitions of PDO=
 can be found
> > > > -      in "Universal Serial Bus Power Delivery Specification" chapt=
er 6.4.1.2
> > > > -      Source_Capabilities Message, the order of each entry(PDO) sh=
ould follow
> > > > -      the PD spec chapter 6.4.1. Required for power source and pow=
er dual role.
> > > > -      User can specify the source PDO array via PDO_FIXED/BATT/VAR=
/PPS_APDO()
> > > > -      defined in dt-bindings/usb/pd.h.
> > > > -    minItems: 1
> > > > -    maxItems: 7
> > > > -    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    $ref: "#/$defs/source-pdos"
> > > >
> > > >    sink-pdos:
> > > > -    description: An array of u32 with each entry providing support=
ed power sink
> > > > -      data object(PDO), the detailed bit definitions of PDO can be=
 found in
> > > > -      "Universal Serial Bus Power Delivery Specification" chapter =
6.4.1.3
> > > > -      Sink Capabilities Message, the order of each entry(PDO) shou=
ld follow the
> > > > -      PD spec chapter 6.4.1. Required for power sink and power dua=
l role. User
> > > > -      can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_AP=
DO() defined
> > > > -      in dt-bindings/usb/pd.h.
> > > > -    minItems: 1
> > > > -    maxItems: 7
> > > > -    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    $ref: "#/$defs/sink-pdos"
> > > >
> > > >    sink-vdos:
> > > >      description: An array of u32 with each entry, a Vendor Defined=
 Message Object (VDO),
> > > > @@ -164,9 +146,7 @@ properties:
> > > >      $ref: /schemas/types.yaml#/definitions/uint32-array
> > > >
> > > >    op-sink-microwatt:
> > > > -    description: Sink required operating power in microwatt, if so=
urce can't
> > > > -      offer the power, Capability Mismatch is set. Required for po=
wer sink and
> > > > -      power dual role.
> > > > +    $ref: "#/$defs/op-sink-microwatt"
> > > >
> > > >    port:
> > > >      $ref: /schemas/graph.yaml#/properties/port
> > > > @@ -228,6 +208,30 @@ properties:
> > > >        SNK_READY for non-pd link.
> > > >      type: boolean
> > > >
> > > > +  capabilities:
> > > > +    description: A child node to contain all the selectable USB Po=
wer Delivery capabilities.
> > > > +    type: object
> > > > +
> > > > +    patternProperties:
> > > > +      "^caps-[0-9]+$":
> > > > +        description: Child nodes under "capabilities" node. Each n=
ode contains a selectable USB
> > > > +          Power Delivery capability.
> > > > +        type: object
> > > > +
> > > > +        properties:
> > > > +          source-pdos:
> > > > +            $ref: "#/$defs/source-pdos"
> > > > +
> > > > +          sink-pdos:
> > > > +            $ref: "#/$defs/sink-pdos"
> > > > +
> > > > +          op-sink-microwatt:
> > > > +            $ref: "#/$defs/op-sink-microwatt"
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > >  dependencies:
> > > >    sink-vdos-v1: [ 'sink-vdos' ]
> > > >    sink-vdos: [ 'sink-vdos-v1' ]
> > > > @@ -235,6 +239,36 @@ dependencies:
> > > >  required:
> > > >    - compatible
> > > >
> > > > +$defs:
> > >
> > > Make this:
> > >
> > > $defs:
> > >   capabilities:
> > >     properties:
> > >       ...
> > >
> > > And then just reference "#/$defs/capabilities" at the top-level and i=
n
> > > caps-[0-9] node schema.
> > >
> > > You'll need to use unevaluatedProperties instead of additionalPropert=
ies
> > > as well.
> > >
> >
> > I am sorry I don't understand this part. Could you explain more?
> >
> > In $defs, define a whole structure of "capabilities" which has
> > patternProperties "caps-[0-9]+", and inside "caps-[0-9]+" there are
> > properties "source/sink-pdos" ?
>
> No, define a list of properties under a def. Here's a more complete examp=
le:
>
> $defs:
>   capabilities:
>     properties:
>       source-pdos:
>         ...
>
>       sink-pdos:
>         ...
>
> And then add "$ref: '#/$defs/capabilities'" at the top-level of this
> schema doc and under "caps-[0-9]+":
>
>     patternProperties:
>       "^caps-[0-9]+$":
>         description: Child nodes under "capabilities" node. Each node
> contains a selectable USB
>           Power Delivery capability.
>         type: object
>         $ref: "#/$defs/capabilities"
>         unevaluatedProperties: false
>
> unevaluatedProperties is needed because it can "see" properties
> defined in a $ref to get the full list of properties for a node.
>
> Rob

Thanks! Will update in v4

Kyle

