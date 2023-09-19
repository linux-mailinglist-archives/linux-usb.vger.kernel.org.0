Return-Path: <linux-usb+bounces-357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57F17A593E
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 07:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E59491C20B5A
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 05:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B16034CFA;
	Tue, 19 Sep 2023 05:15:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57228E1D;
	Tue, 19 Sep 2023 05:15:08 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D89FC;
	Mon, 18 Sep 2023 22:15:06 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c008d8fd07so29866041fa.1;
        Mon, 18 Sep 2023 22:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695100505; x=1695705305; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=glQJiHiiQFXDprtTfi+FevimcPzsz0WU/CYVveuM5As=;
        b=eNJnhKmZrhYI+2FiPeDiPL2E/7kH82Nz4L55V8tbrtMePl+AzzX8hpufRVqsizFEy0
         vRTEQnlkrYBdBsQer3j92+i0gyVr5s++SqamVGgkXMN92yiciLncR+0eA80yipzT4tEE
         fGHNuP7wW2h9uBrbDDMXLh5VvJmfaTxNuD8esqQfw5itzVnKwrxBrp6vGNIn8BznlBe9
         7JFiC+2jJ4ssAP28m8ZuGJ/ZlhToswY5dYtHuE+6kUpmb+CsJWIddVdm3qhKuFSqwPOp
         95SCMiV64IWq87Io9q2ldyC+uUrG3G2mm4AxM9zEVqNNutSPzas/oCfQDcOTg5oD3i48
         dgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695100505; x=1695705305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glQJiHiiQFXDprtTfi+FevimcPzsz0WU/CYVveuM5As=;
        b=di+S47E86abRaIFOG++2toBB8IeecPV1OKAg81RdpelOC3pX6aTbJfKsc/xwPvdi0+
         wmVwRAKuBwn0VCeq4Pxj3tAV8qBiVT4GxIR32UGXjjtz8lmLG8OzbknK5mt+wa7JEQTK
         moiRI56Z+hZqdaxEaCj0fN1RiT3YKhg+pNRIdExJJQjfL5XMuoi9GYmxR5ZVJZJj7Jzc
         vuuhKQyiaz246CFv2NGwz3KzHoGWTCB+W+5Z9RpI/b8Is3eZIjbTZiUlNATc9I4AR3wl
         TiK677oDV2Tg+5rnWwNHcpZO6MZPugcbSvL/F12YD5kOqi0mfggpbSoL67A9/0aB4Wpq
         ngDQ==
X-Gm-Message-State: AOJu0YwNpoPNHQNsz0c59gLLD85NaEanlT+R0+S4b+9QWZqRyRH4FD+b
	fVTRY6A3h73QAOpcCuUJBGAlWeAQ9MjyyOFH6ISLVLYsz5M=
X-Google-Smtp-Source: AGHT+IEAH5kMAHAiTI5BtK+SJ3ujWEh5t5l0gqQHNUIbKLbzTbe83gQLNCM8UXCjLdKRdYq1Er8M9KFyhKgprmA8GKY=
X-Received: by 2002:a2e:9791:0:b0:2bd:1cd0:603f with SMTP id
 y17-20020a2e9791000000b002bd1cd0603fmr8591041lji.45.1695100504861; Mon, 18
 Sep 2023 22:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230918165958.2659-1-tmaimon77@gmail.com> <20230918165958.2659-2-tmaimon77@gmail.com>
 <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org>
In-Reply-To: <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 19 Sep 2023 08:14:53 +0300
Message-ID: <CAP6Zq1gSJYsNUuD-bexFW_1VpAUuF_WZkicNzZms6hVdo9LnMQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: usb: ci-hdrc-usb2: document Nuvoton
 NPCM supprt
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, xu.yang_2@nxp.com, peng.fan@nxp.com, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Krzysztof

Thanks for you comment

On Mon, 18 Sept 2023 at 23:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/09/2023 18:59, Tomer Maimon wrote:
> > Nuvoton NPCM BMC SoCs use ChipIdea silicon IP for the USB device controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. It's dt-bindings.
O.K. Thanks
>
>
> > ---
> >  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml    | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > index 1394557517b1..9de4dfe004d1 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > @@ -16,6 +16,7 @@ properties:
> >        - enum:
> >            - chipidea,usb2
> >            - lsi,zevio-usb
> > +          - nuvoton,npcm-udc
>
> You need SoC specific compatible.
O.K. Thanks,
>
> >            - nvidia,tegra20-ehci
> >            - nvidia,tegra20-udc
> >            - nvidia,tegra30-ehci
> > @@ -325,6 +326,20 @@ properties:
> >      type: boolean
> >      deprecated: true
> >
> > +  nuvoton,sysgcr:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to syscon that configures usb phy mux.
> > +          - description: offset of usb phy mux selection.
> > +          - description: mask usb phy mux selection.
> > +          - description: value usb phy mux selection.
> > +    description:
> > +      A phandle to syscon with three arguments that configure usb phy mux.
> > +      The argument one is the offset of usb phy mux selection, the argument two
> > +      is the mask usb phy mux selection, the argument three is the mask usb phy
> > +      mux selection.
>
> Sorry, you miss phy driver. Don't use syscon instead of proper hardware
> devices.
Sorry the role of nuvoton,sysgcr property is to handle a mux between
the different devices and not the handle the phy itself, handle the
mux done in the GCR.
Should we move the nuvoton,sysgcr description to another place in the
ci-hdrc-usb2.yaml
or
Should we use a different driver to handle the mux and call it from
the ci-hdrc-npcm driver, If yes which driver should we use?
>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

