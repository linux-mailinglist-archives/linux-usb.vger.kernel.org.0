Return-Path: <linux-usb+bounces-555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A37AD21B
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 09:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 5349828177F
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 07:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E936F10A16;
	Mon, 25 Sep 2023 07:44:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCAC53BA
	for <linux-usb@vger.kernel.org>; Mon, 25 Sep 2023 07:44:42 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCDCB3;
	Mon, 25 Sep 2023 00:44:41 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59be6bcf408so67896217b3.2;
        Mon, 25 Sep 2023 00:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695627880; x=1696232680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGlxeF3mvqh10+aDJP6sgcuQtFs8Uq5hua0HbhUOEJc=;
        b=iPKswbU4uA050Norm3TL6bsmzZ8Iknp5Mdx5O0QEZiZ7Cax9UNKfUzH99vPbF8sf+4
         LF/7hQkR8NlThgLchileT+CY6B0AIB7gd8kpFcHO25+YpMo97j5LTMrU9HBJVT7TcH3i
         IQnmf5K4rQBZ5diQAOrhA4nxps246KKdJrhKaLDVOiWOI8gYGiTLEY4i8HDJuccIsH+q
         5UbB5bMa4jgaUZzgL61WzaWPVZyP7PWMhqf03+5oeDJvQz84Au6RN/g9N8g2X04Z850G
         XyJdBe2TvqpmP9e6OMxX2RAQwFXF3SHN6cXtwLI8+nbcl/ZLIN1fGLVEVOtfI4DamRtM
         Zf1w==
X-Gm-Message-State: AOJu0Yx+fbhmPPshE1RZ4Y6oJSA0tDJ7qJm2JiWGIFMMuNKDh7vFkooG
	XN1BNP3C18oyHlArcC9lnwPSxkb8s4uA1w==
X-Google-Smtp-Source: AGHT+IGKgu31hM/9VX6A1nkYglZVi8xyxmuWBdM7nzk91mDbwxYk6dbH/QycBxvgtpWqw6qu7HQjQA==
X-Received: by 2002:a81:b206:0:b0:59f:4c55:efa3 with SMTP id q6-20020a81b206000000b0059f4c55efa3mr5193737ywh.12.1695627880230;
        Mon, 25 Sep 2023 00:44:40 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id gq10-20020a05690c444a00b0059f5828346csm1061744ywb.3.2023.09.25.00.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 00:44:39 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59c0a7d54bdso68063247b3.1;
        Mon, 25 Sep 2023 00:44:39 -0700 (PDT)
X-Received: by 2002:a81:b60f:0:b0:59f:5614:ebe8 with SMTP id
 u15-20020a81b60f000000b0059f5614ebe8mr4799116ywh.9.1695627879642; Mon, 25 Sep
 2023 00:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230922080421.35145-1-wsa+renesas@sang-engineering.com> <20230922080421.35145-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230922080421.35145-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Sep 2023 09:44:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=y9i=36r-WHgpB9RhCF1rsfQ=qsosTbjwPCTHo9PrYQ@mail.gmail.com>
Message-ID: <CAMuHMdW=y9i=36r-WHgpB9RhCF1rsfQ=qsosTbjwPCTHo9PrYQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: typec: drop check because i2c_unregister_device()
 is NULL safe
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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

On Fri, Sep 22, 2023 at 12:44=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> No need to check the argument of i2c_unregister_device() because the
> function itself does it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

