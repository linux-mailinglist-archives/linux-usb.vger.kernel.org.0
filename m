Return-Path: <linux-usb+bounces-810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C47B3A26
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 20:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 1EACD28319B
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 18:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F75441E48;
	Fri, 29 Sep 2023 18:42:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64018F70;
	Fri, 29 Sep 2023 18:42:12 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AA6193;
	Fri, 29 Sep 2023 11:42:11 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-27730028198so2308575a91.1;
        Fri, 29 Sep 2023 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696012931; x=1696617731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkGSOCYv1tPAleL7tBKhRj+busAnbZvp+a3IKl82kps=;
        b=T/jo/HjDTAgseA3KSI7bRoZ5XO2e2sgdxudJWwCDc9Y+EIxyCAnqp7f00LkeUaNQrA
         5b4uJEXg2LI+8THeUnK5KRxQpYrlOIMINL/xsBwgWZbQ9DvAS3pQpu1SDrAB6GFg+9d9
         rc+2xHok9WZ+Uj+h+hgSn8xwasRKtSscCwWwVI//l6nMUklvZ+F9D9QNyy2wGAHEavQn
         IIMqp/h2BKUjpzXoQdKQ+Z8jh+11HkinhsuPnsn3skfO+wOReqUx1kSdpvPOTCffhTrj
         ipzGnQHZd5NrFPgrwON2V3Oa3T1rTY2PVnJUBN5YjM++ze9Qp504w2e6haky1u5xwtXf
         9dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696012931; x=1696617731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkGSOCYv1tPAleL7tBKhRj+busAnbZvp+a3IKl82kps=;
        b=Kp50uVBkfYK8LmQAN5K39CiLK4uCF5I8uVqSUNHEv7cwhNURIEULLQTKfSns1ZIV3M
         xzhl5N9qdwh755g36mVIxJcmy1pcfXcOhTbwl2dho25AIZ+ETVkjTvLL2QVHMy3BBKHq
         pxk7/HTVrPc+nxtF4TLFjcVfX57s8yAyQCxt9mP7KR06tan2dyTcNjeh9InnrCOg8sfJ
         nfhcfk+XLU7G8gwc7Mm0btap0hCI2OPnXRs9e75KaDG2RIIgGl8sK1uOjaKDchcWEZ0D
         oV/liFTUEHXgJM5XlyrwEl2ZU013IfkZZ37fnGV90f5qPs0fDpWm2CMNMnGUSrE+gfAC
         2MZQ==
X-Gm-Message-State: AOJu0Yz6SBjWHBDQB1+oU1gZ3Di8Pddq5iVK0w9uZ/4wahXX0HRRHypd
	BOjWdVKCd2vcD/+F9/Y0WvhuyCvcwU/m4aTcBjU=
X-Google-Smtp-Source: AGHT+IH2TAe0Ek5+8uBZzzMMVX6XxOShbFKHaCSjekpMJ0dM36nl6Pb/W7GYqfj9pNcov3wl1rviH8dX5Jb+qCyaSZM=
X-Received: by 2002:a17:90a:3d0a:b0:26b:5fad:e71c with SMTP id
 h10-20020a17090a3d0a00b0026b5fade71cmr4628002pjc.2.1696012931295; Fri, 29 Sep
 2023 11:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230927123511.45085-1-festevam@gmail.com> <20230927123511.45085-2-festevam@gmail.com>
 <20230928-machine-pushcart-6e68b11afc7c@spud>
In-Reply-To: <20230928-machine-pushcart-6e68b11afc7c@spud>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 29 Sep 2023 15:41:58 -0300
Message-ID: <CAOMZO5B=MEDUE4bEnkri1npUG93KQZSp=JYaV8R8hKNY2qQtQA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: usb: gpio-sbu-mux: Make 'mode-switch'
 not required
To: Conor Dooley <conor@kernel.org>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andersson@kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, jun.li@nxp.com, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Conor,

On Thu, Sep 28, 2023 at 2:04=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Sep 27, 2023 at 09:35:11AM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > On a i.MX8QXP MEK board that has an NXP CBDTU02043 mux, there is
> > no mode-switch, only an orientation switch.
> >
> > Make the 'mode-switch' property a non-required one.
>
> There seem to be very few compatibles in this file, so I guess
> everything uses the generic compatible. I'm not expecting you to know
> why it's like this, but should we add a compatible for this particular
> mux & only relax the requirement for it specifically?

I am not sure.

Bjorn, do you have any suggestions, please?

> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> > Changes since v2:
> > - Newly introduced.
> >
> >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/=
Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > index b61dcf8b4aad..d3b2b666ec2a 100644
> > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > @@ -51,7 +51,6 @@ required:
> >    - compatible
> >    - enable-gpios
> >    - select-gpios
> > -  - mode-switch
> >    - orientation-switch
> >    - port
> >
> > --
> > 2.34.1
> >

