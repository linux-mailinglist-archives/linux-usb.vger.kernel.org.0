Return-Path: <linux-usb+bounces-1122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F77B9C93
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 12:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id DFAA21C20970
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 10:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CDD125DD;
	Thu,  5 Oct 2023 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC9kMnuU"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C08125AD;
	Thu,  5 Oct 2023 10:46:17 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A868222C9A;
	Thu,  5 Oct 2023 03:46:15 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c12ae20a5cso9758871fa.2;
        Thu, 05 Oct 2023 03:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696502774; x=1697107574; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tD4m0iMVb4bl/p6r/AX6bYY/PolPxwjEJ+dZDSZwBHQ=;
        b=GC9kMnuUoMy7iKlaeGE/ul+ghEz/ntWBcFdY0pOlQXy7+DcqkgOF5IgYrn071Dx0jx
         ODON18gPYqIXgR1Hj8h8CFtDeRiyCKTfkGDqj+rUgZihIHTVKvInxCg24wZfpwG7khyk
         KRFYGQsR8eZPS/ouu+6Kk1Pd2vzBEjTNXnnU7bV7ProGNlnGYSWTD39YjLmGCmTbBQbU
         rifmustdlP/8d2U6xD4jCkqLZWHFtECJnZLFP1Tn0XO2X+TtveI6evB+daeQ9uTLJuTx
         0U39uiMa4KYqOf7Ms2uPyQzvQURhOk7sJpEh1HEeM5p6Jxqag+jcv8rWjpAuW89ZYiWm
         c5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696502774; x=1697107574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tD4m0iMVb4bl/p6r/AX6bYY/PolPxwjEJ+dZDSZwBHQ=;
        b=wWiXnEKD1qGdshAET/vURgdAoaLAU4MAxKFAzquSZ24c/qF5+FhRssfXWbYjxbOe7W
         rXBQ6hnY9I/aUkYU1b46GzUueTP34xNbr/XxLAwIyo5SepA9biP+Z/9cZZPMA8ZXR+QI
         /nBOhaITXU5vVKkxfdDZdyLPjlMHtIFKXzM4X22Amtw5XwSMkOmiABK7Y26m9UfCPVC+
         y56saNiEFMEgk6Uu5/RLHNC86kpavm3JI/NzrQLQZ2NU78FZnOgHLi95mU6t2oXiEoy4
         EjL1NQkPAQlv6vqhfd5pvHUpbkJe4zp1DinVyPLF+XSOCyiw+r/lj3tzxbv04QH7YFNP
         Xfbw==
X-Gm-Message-State: AOJu0YwBNm+TimJ6/+/tQijioAv3nrBAgsC9izdtYvW9wm3GdTATlAOJ
	OOh/i/Y0oig4nOu2zs5riptTeAUkaO582U02cb0=
X-Google-Smtp-Source: AGHT+IEStT65q1wnfYcU7aKZf01nOo1p1LQWPYHAgwHMmL8hEGmDyGD/+zh/g1iKp/Mz0aAqs1/CD+KqWZXYU8bZAMM=
X-Received: by 2002:a2e:9794:0:b0:2b9:e1dd:5756 with SMTP id
 y20-20020a2e9794000000b002b9e1dd5756mr4574929lji.45.1696502773682; Thu, 05
 Oct 2023 03:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231003110130.229711-1-tmaimon77@gmail.com> <20231003110130.229711-3-tmaimon77@gmail.com>
 <25e8c953-8bf1-4107-9531-263d68c41128@linaro.org>
In-Reply-To: <25e8c953-8bf1-4107-9531-263d68c41128@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 5 Oct 2023 13:46:02 +0300
Message-ID: <CAP6Zq1gwbYfE4xg0-TCC+Wfoo_1omdsWukupJqpZekMem0xeMA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: usb: ci-hdrc-usb2: add npcm750 and
 npcm845 compatible
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
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Krzysztof,

Thanks for your comment

On Wed, 4 Oct 2023 at 11:03, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/10/2023 13:01, Tomer Maimon wrote:
> > Add a compatible string for Nuvoton BMC NPCM750 and Nuvoton BMC NPCM845.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > index 1394557517b1..a9e173432002 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> > @@ -16,6 +16,8 @@ properties:
> >        - enum:
> >            - chipidea,usb2
> >            - lsi,zevio-usb
> > +          - nuvoton,npcm750-udc
> > +          - nuvoton,npcm845-udc
>
> Your driver clearly suggests these are compatible. If they are not, why
> commit msg does no explain anything here?
Do you mean to add nuvoton,npcmxxx-udc as described below to the end
of the compatible property?
      - items:
          - enum:
              - nuvoton,npcm845-udc
          - const: nuvoton,npcm750-udc
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer

