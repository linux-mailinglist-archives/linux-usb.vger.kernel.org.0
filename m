Return-Path: <linux-usb+bounces-2929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FED7EE243
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 15:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3491F2629A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 14:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0D0315BF;
	Thu, 16 Nov 2023 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C32D5D;
	Thu, 16 Nov 2023 06:02:12 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5afabb23900so9349287b3.2;
        Thu, 16 Nov 2023 06:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700143331; x=1700748131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab9TuKeTeOe6Tu419AbiqmgHmcWN5UW8aVt812inTFM=;
        b=hKcXApGjRam3UpWHZsqmk3Xh6lg+8DCNFhNEKqwpFAPutwM6kECfINzKs/JBKp01oO
         G9/thaIVyrq9u9P3fJlsaknovvL5/hpk4O0Ckvmq44DeSfRWvpZR7k4LtmbXHWnRQNpU
         s+BmCLWhN9gbDSgEzZ6Wcj5FE7m2KJSkesavQlz1fsaD4RrjdGibdZaSpHOnHXl2dx4y
         nscpuyJ0BsiKIchZGyCLiPLgEsdODF1stgPuKI714UdPW/1xUQRE9w9vQbfJ+t/gNMBc
         dzRQie09GwhioKMIooWH/pd08j0nihepuMSmT/eFm/RlW931y2qQUosLfF86GkDHWynJ
         Re7A==
X-Gm-Message-State: AOJu0Yz6tD+FgskDtCLDzfTuW/J5x5obPl0OHrDxah6Y9IV+NAzhkeIk
	S9n563rGvsOcTvq+xsj5ZNGSMvOCKuygEQ==
X-Google-Smtp-Source: AGHT+IGXitV1/KEj9/oj/owEHj+5Er3SQ5zz/Mbf3W4OUN8GJJ6vy/a65gwm+mJIeXhlqd6eBNHWUg==
X-Received: by 2002:a0d:ed06:0:b0:59f:5361:d18c with SMTP id w6-20020a0ded06000000b0059f5361d18cmr17263354ywe.41.1700143325529;
        Thu, 16 Nov 2023 06:02:05 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id f125-20020a0ddc83000000b005a7bbd713ddsm990344ywe.108.2023.11.16.06.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:02:05 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5afabb23900so9347237b3.2;
        Thu, 16 Nov 2023 06:02:05 -0800 (PST)
X-Received: by 2002:a05:690c:2c08:b0:5c1:25f:5674 with SMTP id
 eo8-20020a05690c2c0800b005c1025f5674mr14330375ywb.32.1700143324843; Thu, 16
 Nov 2023 06:02:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115211407.32067-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20231115211407.32067-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2023 15:01:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrepNfzdjpsQnKMB9XZa_AgfuTD2hbSq23HD6v9w8jXw@mail.gmail.com>
Message-ID: <CAMuHMdXrepNfzdjpsQnKMB9XZa_AgfuTD2hbSq23HD6v9w8jXw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,usbhs: Document RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 10:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The USBHS IP block on the RZ/Five SoC is identical to one found on the
> RZ/G2UL SoC. "renesas,usbhs-r9a07g043" compatible string will be used on
> the RZ/Five SoC so to make this clear and to keep this file consistent,
> update the comment to include RZ/Five SoC.
>
> No driver changes are required as generic compatible string
> "renesas,rza2-usbhs" will be used as a fallback on RZ/Five SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

