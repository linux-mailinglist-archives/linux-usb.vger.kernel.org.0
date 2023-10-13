Return-Path: <linux-usb+bounces-1551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1267C7AFA
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 02:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C783C282CAF
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 00:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6EE807;
	Fri, 13 Oct 2023 00:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gin+SHcd"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493DD7E4;
	Fri, 13 Oct 2023 00:52:52 +0000 (UTC)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67038B7;
	Thu, 12 Oct 2023 17:52:50 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-57e40f0189aso857943eaf.1;
        Thu, 12 Oct 2023 17:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697158369; x=1697763169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NgbXxVbGqIFPYsCBLUD8u2AlR8FZtniaK/XWevM8Oew=;
        b=gin+SHcdQvUNZWMubz1k8cCQimM19f/JvmCd0qCHlDU9a9tGgetf6992QmB7NPDYcj
         /NIKOqwtfhxUBmjrTf06FhmAjJrSaq2c8nIqILcpL/yXkkoH7qsq+DngkC75Gw3yW5ST
         aHmwjU04gC+p4kNhNrUuDZYtE9QWI3DUI8bS3cVsR8roCujixsBkn+mFTEtun52lgKoJ
         TbEZvzsGH6BysayapB7Xa/QZNpbRvHNabyPhSaXtQHWJZFv0M/5GjXOlfT8soQCeuShE
         LCL+Hlh+cN/QhOYu5+O1I6ME5JqQ8pr3yhk4teIBWqNLjXUCK4Tt1fVNZz5nfzRs2nzQ
         UZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697158369; x=1697763169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgbXxVbGqIFPYsCBLUD8u2AlR8FZtniaK/XWevM8Oew=;
        b=Ay+NeLcGFcXS5PbUH9feNoEqB4xtk82/n/2mSeqNLKlHEU4XlPak5MvwcfpHUa2Yy8
         W8UP532JObKreEGNHEQKvjFcbnC/B+jJmJmjP+S1lWuP91Mpw4OTSzTCFKAIZ0UJJyL5
         CpeBnaszSEGr29dQdZzE0WlK+22kwABpYvY6X8i0L3/tvd+pvrpLfOoDehFeK8XesFVd
         LhV2tPxlVhM1O4i1cfIQG/ZOu3Q748voRTlZRM+9SoTAXWcc9wXXN+JPpO8oqAEt9vDp
         YXys9vXuoU+v+W+ja1QHGW+4mI82x+HMC0LLSol5zjLmrYj7v5blzVE77oC/QuwXxIEf
         yrdQ==
X-Gm-Message-State: AOJu0YyR9LpZIj4W7/A+cLJ22zJcF4wLvLxIJ3rmEgT02FYKhZksiwCT
	wSOhARXl6K7F3sVrM+HT8qVCsY+NH35QTXax5DLiZWmgS9Scyw==
X-Google-Smtp-Source: AGHT+IF1uPJDZ+hHF3vTdBvAhz6dWN9MwQJVAybEOh9fV9Qz+HwL7Eej8iBYD3FJMlyHpreEM5QFBm1u+XCv78K6Z3s=
X-Received: by 2002:a4a:9d17:0:b0:57b:7145:310f with SMTP id
 w23-20020a4a9d17000000b0057b7145310fmr23920026ooj.0.1697158369604; Thu, 12
 Oct 2023 17:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231011051152.133257-1-linux.amoon@gmail.com>
 <abe72aae-c43c-487a-8021-2c0f54319a5b@linaro.org> <CANAwSgQa3_ROnYyDZA958ZvFu0tb7qsVJ0Loij0saYRKEec_xw@mail.gmail.com>
 <0acc7647-7b9a-463c-aaed-10100cac94a2@linaro.org>
In-Reply-To: <0acc7647-7b9a-463c-aaed-10100cac94a2@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 13 Oct 2023 06:22:34 +0530
Message-ID: <CANAwSgRjviW7XcXRuec3LNVfcGqYnKKj6FGQHvsJLw1X393TPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Krzysztof,

On Thu, 12 Oct 2023 at 23:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/10/2023 18:37, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Thu, 12 Oct 2023 at 13:13, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 11/10/2023 07:11, Anand Moon wrote:
> >>> Add the binding example for the USB3.1 Genesys Logic GL3523
> >>> integrates with USB 3.1 Gen 1 Super Speed and USB 2.0 High-Speed
> >>> hub.
> >>
> >> That's not what the patch does.
> >
> > Ok I have tried to add an example below the original changes
> > but the device tree complained of duplicate entries. Hence I
> > modified these changes.
> >
> > This change was requested to update the peer-hub example below.
> > [0] https://lore.kernel.org/all/9fe7d0d2-3582-4b62-be9b-aa9134c18023@linaro.org/
>
> Neil did not ask you to add it to the example but to the binding.
> Existing example should be extended, but that's byproduct of main change.
>

Do you want me to add a new binding file to support this example.

# Documentation/devicetree/bindings/usb/genesys,gpn76.yaml

> Best regards,
> Krzysztof
>

Thanks
-Anand

