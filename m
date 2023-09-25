Return-Path: <linux-usb+bounces-564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646D7AD765
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 14:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id BADFD2814FE
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 12:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ADD19BD3;
	Mon, 25 Sep 2023 12:00:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE0107A7
	for <linux-usb@vger.kernel.org>; Mon, 25 Sep 2023 12:00:35 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96604115;
	Mon, 25 Sep 2023 05:00:34 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59f82ad1e09so14030147b3.0;
        Mon, 25 Sep 2023 05:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695643233; x=1696248033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxIabBvGqpbG1wNxuk24gm0Cs/wYojXdzcK6/ZMn/hc=;
        b=htqtBt14p/Xz6/pb33SZJKoPUirBQFzL9xtZ+ZaECezDHYU0DQFikSDZAHPk1yU2w2
         1DJyfeQcBlpmOJAhbIjzeEhzc7NcpAaewSvNSBjS2G1S76UnCOdMUbH4O94CbyvJbh/J
         ds/mWHhW0vG/WTq13nRS2IEjInWT1zE67DR6nLPuwTqBgrBykOPy/FvmLP4WM6d70tVI
         GKmVzmDHfbsyZzSbN8sDLt6hSoXnvx506TEKuFABq5skMBRRpOb0bJpmvBOC9ssYGVyV
         X3kY/fS2DsGoK4+AWBi+ocjXBOWvwzVTlnII+/FTqXvN2fWvxUhIotQVKecHjpJ2lf3C
         hsOg==
X-Gm-Message-State: AOJu0YwWsk6bTRgVOszt+GO962SEcbCE5DSIWPEvMBVv8SbuSdz0lI3H
	0rvQCQqF2eti4NBHLrVslB2IUh+z6qmwhg==
X-Google-Smtp-Source: AGHT+IEY1b2xscbXT22ILBGQMIeAClysK8yA4XXvxeLOt3Dy1g16cO18x78QfZj3hdep3dBQKQjFzw==
X-Received: by 2002:a81:4ed1:0:b0:59c:a68:d36b with SMTP id c200-20020a814ed1000000b0059c0a68d36bmr6871019ywb.20.1695643233481;
        Mon, 25 Sep 2023 05:00:33 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id w82-20020a817b55000000b005774338d039sm2362827ywc.96.2023.09.25.05.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 05:00:33 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d8181087dc9so6789634276.3;
        Mon, 25 Sep 2023 05:00:33 -0700 (PDT)
X-Received: by 2002:a25:c093:0:b0:d89:41ef:4cf7 with SMTP id
 c141-20020a25c093000000b00d8941ef4cf7mr532073ybf.34.1695643233167; Mon, 25
 Sep 2023 05:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230922064551.4663-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230922064551.4663-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2023 14:00:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOjZcvRf+qY9BkaCDQ1uRG7xTOyfkohL4eaTiT18Lm6A@mail.gmail.com>
Message-ID: <CAMuHMdUOjZcvRf+qY9BkaCDQ1uRG7xTOyfkohL4eaTiT18Lm6A@mail.gmail.com>
Subject: Re: [PATCH] usb: renesas_usbhs: remove boilerplate from header file
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 22, 2023 at 11:04=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> There is a SPDX entry, so we can remove the boilerplate.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

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

