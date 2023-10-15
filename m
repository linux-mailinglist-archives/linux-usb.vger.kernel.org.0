Return-Path: <linux-usb+bounces-1631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771157C986A
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 11:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADC92B20C52
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 09:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2161A2119;
	Sun, 15 Oct 2023 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwuunF8Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B420F7
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 09:00:56 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7803DA;
	Sun, 15 Oct 2023 02:00:54 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so24988771fa.0;
        Sun, 15 Oct 2023 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697360453; x=1697965253; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sUKXBDAU7yRvgkxOo63NtcyklMaDwxQR1L1y1/Du95g=;
        b=RwuunF8ZDfImH594IqLgMh/owDkdzw2XZvP9Jwjj2KSJTV1bzf/7HN/bV/E1AAtTeq
         a5wIS53T6q8gHE2tWlTtA7aVnSIJyDsq/t3gLfXqakgf0nM7vksF0cDCfZndYBFX5i78
         /+dXhSLeoW9EE320DwM4sEH3Fv9fS/0RZkhW43A49IaDdSHN4M8IXihPAsCDZzbuOl0V
         o/p1sUTkHkokemU0vYovU57yVTy0CPvLm6TFu02J70itAV7UNAInS17pceefWj5pAaVK
         m8vJH5UGQQnH4bZExlCx0Pp8AgNx6Dr9ngyw3AyNwMUeFVpkMMDArxiQJk24obOf8hOs
         lZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697360453; x=1697965253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUKXBDAU7yRvgkxOo63NtcyklMaDwxQR1L1y1/Du95g=;
        b=kRhJ+dKS3jMulZTNAR+YY3RfwuWRuqHW5xEvk6++noioCdvImvMt+P86NQFOVAtw/+
         FC7Zgphuu3TewBnHEcvCVGNuxvtrJcoLd+spAXlm/K2LFeM99/A/+W8d4we0DH5ahWi3
         3Wq7LwswgoMe4330Gn+BJQR1DpEesBAxOETprwWZjen0G4JWbyAJfu6oLOgPoPGIrKPo
         8/XinV5jLLZAq7HC9RHjXFTRXKLra2Dh+L6SRATPv+pxwlbKWuwlqWuz+caBdIXlNHgy
         lp+z5Hzb/FFb901PXUwdnTGSPkOyW+mDov/WdXy95tddnkzSgwhrEPL7P9Z3RchopyAM
         sC4Q==
X-Gm-Message-State: AOJu0YxOLIP5lTiWWUXXT3GUHba3auTZBWRh6wUV2sXZ9WAykEt5f9Iq
	ZdT0K//dJBDxvHFlnt0CLw1qDyR2RRsYGUgo9Js=
X-Google-Smtp-Source: AGHT+IEeRq5SP6mqrb0AloTKLb9pI1Hmn2zRyq5heXljQOw5f+hV25tMCL00qCO52s4kDz7hA9KXi+cggZZEr6EGgvE=
X-Received: by 2002:a2e:2413:0:b0:2bf:fd6c:ddfc with SMTP id
 k19-20020a2e2413000000b002bffd6cddfcmr24524661ljk.45.1697360452663; Sun, 15
 Oct 2023 02:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231012230057.3365626-1-tmaimon77@gmail.com> <20231012230057.3365626-3-tmaimon77@gmail.com>
 <7598fcfa-7047-434d-be03-41cb2bb46ecb@kernel.org>
In-Reply-To: <7598fcfa-7047-434d-be03-41cb2bb46ecb@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 15 Oct 2023 12:00:41 +0300
Message-ID: <CAP6Zq1iOyGfYAEQ+psK9Xz-QYXc4Poo6sJhUsNH3m80HmE7v2w@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: usb: ci-hdrc-usb2: add npcm750 and
 npcm845 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, avifishman70@gmail.com, 
	tali.perry1@gmail.com, joel@jms.id.au, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Krzysztof,

Thanks a lot for your comments, I really appreciate it!

I will run scripts/get_maintainers.pl to the latest kernel.

After running scripts/get_maintainers.pl do I need to send the
patchset with resend on V6 or do I need to send V7 with the new
maintainers list

Thanks,

Tomer

On Fri, 13 Oct 2023 at 16:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/10/2023 01:00, Tomer Maimon wrote:
> > Add a compatible string for Nuvoton BMC NPCM750 and Nuvoton BMC NPCM845.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
>
> Best regards,
> Krzysztof
>

