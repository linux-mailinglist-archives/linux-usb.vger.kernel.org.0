Return-Path: <linux-usb+bounces-814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 615F47B3A92
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 21:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 4EA4228393C
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 19:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CCF6669E;
	Fri, 29 Sep 2023 19:21:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68166DC9
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 19:21:21 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C191B1
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 12:21:19 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-692b2bdfce9so11474458b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015279; x=1696620079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCv+kMrx/0UVGQCBQ46tqfp9gvNT/0LM2qgPxtgaA9o=;
        b=VX4hN++I+aUc1RYQv6yPxwRdma7EuTF2+LNbnhnxHUwwju+e1crZgJgNTyuPIwvvdd
         i2ZkwRKYiUHJVbJpEKaLXNEQeTEho1lzI/nc9C0A0s7LDNWs/FB03nMQnsrkAN4JvCdc
         2lkpELBtihCNmQMAAgMZIpmM7ELu2Cl/4J3v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015279; x=1696620079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCv+kMrx/0UVGQCBQ46tqfp9gvNT/0LM2qgPxtgaA9o=;
        b=NDzBn8PcFld4AeYLWZ/EAhUXj83x0ONQbfGxII3BVpyfjnJATPTMc//NyL/WS8DJOL
         ZA7fzvOvIfLbwA9Vqh55wNY3V45r5b2gn2Nz8G87Kw9JeRWijbbsGY5Qh3R0vFwl8lVY
         xh+mw9pz/QWRk1EmaJ0Rhp8bfy5fpF5RtnvMXFWlSZYcjfn0vV4Dps2/lUUtiIjZi2MF
         ahNj8hgO26FGqm5LGAYyTSu79W7VODURjsFdSozseF3Hfr69VsiSwIoHBiTH7mvM3MEz
         XSPmG1ccPILKUgBW9ePjBX69w4nkI0cAR4HyzH3rvJMRb1dYtx9xrYWmVEXct/yElkp1
         d9Kw==
X-Gm-Message-State: AOJu0YyvBgy+OXs6E4k5OWwVK/ggWdIKmvCSgb4I/Tx9WMNMe+jQdKvj
	xbro260ImSYQUG2ScOQK02Vf1g==
X-Google-Smtp-Source: AGHT+IGiBwStaHPR44R6ANK1/tkrYWC/2DFh5Z+5BULeXdWKDr6O8WVqqWNlE6Fy+1azpzu06/HF2A==
X-Received: by 2002:a05:6a20:3d22:b0:160:a752:59e with SMTP id y34-20020a056a203d2200b00160a752059emr5701827pzi.40.1696015279415;
        Fri, 29 Sep 2023 12:21:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y7-20020a637d07000000b0054fa8539681sm14767022pgc.34.2023.09.29.12.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>
Cc: John Keeping <john@keeping.me.uk>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	linux-usb@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Jeff Layton <jlayton@kernel.org>,
	Uttkarsh Aggarwal <quic_uaggarwa@quicinc.com>,
	Yuta Hayama <hayama@lineo.co.jp>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Annotate struct ffs_buffer with __counted_by
Date: Fri, 29 Sep 2023 12:21:11 -0700
Message-Id: <169601526969.3013632.10440475414357366621.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915195849.never.275-kees@kernel.org>
References: <20230915195849.never.275-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, 15 Sep 2023 12:58:49 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ffs_buffer.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] usb: gadget: f_fs: Annotate struct ffs_buffer with __counted_by
      https://git.kernel.org/kees/c/84657a30a0c9

Take care,

-- 
Kees Cook


