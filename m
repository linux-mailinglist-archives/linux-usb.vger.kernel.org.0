Return-Path: <linux-usb+bounces-812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 882527B3A70
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 21:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id DCA7FB20B50
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 19:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471536668A;
	Fri, 29 Sep 2023 19:15:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716151BB3
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 19:15:06 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAABA1AA
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 12:15:04 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso112296775ad.1
        for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696014904; x=1696619704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMR6LUwPftHKv0r5/Li6NluEAeTRiPtbXaPEQ4+PpRg=;
        b=UBVYx32GUgxii2P9VeGDr1XxGqw9do4g2/tM3vjpNC9nG0EjDE7tes9gRDeaZHKBu4
         vp/hpV3A98dMo62Yzx1vECGtQPuK3Nv3gnvw5cEFwMGP9gwVXJI2GuLKMMLElp7+edWi
         1mpveEyxLXzmsn2Llw8qGt8RBDcp/y/f4Fpuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696014904; x=1696619704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMR6LUwPftHKv0r5/Li6NluEAeTRiPtbXaPEQ4+PpRg=;
        b=nStETjhgjq7VEFXdVMsrpMRwGfAmrm+lqbmL2dxOUlZEbv7YSyO8r1E+HKuWDUyLQN
         ThPxA03YeY1fh7GVRaoYiqOveB5X6fkwNDAxjpSkWCM0q9O7RxO63npB6QzH6kcFX/SO
         TolyPn7VgBhueAcd3OoVgG8b3yF0dmX/RPT/0u+ZoBXrxqDL0v+cssnwPE8OCCSGDtTs
         nm8pwNDKiF51Q2/Mlr4fNJip57Imit5zZFDcp3dH9pqKIjCqItC40Fm0dIpd3+gBCkTq
         p/qgP/esV2eA+ogjCgqk/mUNcy5/4VONuXW6ISVllQgFOCHg2yLACGmaIGoDBkPMSFIe
         CGeA==
X-Gm-Message-State: AOJu0Yw21tQi3mMhDCmTOpi487mEGBryn8HdYwgzHtVV8MQMjyOHBZIb
	5AkJiybs1zwAtLYRf+WdJL1YUe44v6EWyUmSHm0=
X-Google-Smtp-Source: AGHT+IEBopBak8B7MGmd1sJZ3Lf8ZG5V73oh21Tehv4+8J8dAWg7SRzxgWm5FohLg5EVdZWMSxbroA==
X-Received: by 2002:a17:90a:f2c1:b0:279:47d0:d923 with SMTP id gt1-20020a17090af2c100b0027947d0d923mr439775pjb.17.1696014904230;
        Fri, 29 Sep 2023 12:15:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i6-20020a17090a2ac600b0027360359b70sm1974742pjg.48.2023.09.29.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:15:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Duncan Sands <duncan.sands@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] usb: atm: Use size_add() in call to struct_size()
Date: Fri, 29 Sep 2023 12:15:01 -0700
Message-Id: <169601489954.3012131.16051231116010521718.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZQSuboEIhvATAdxN@work>
References: <ZQSuboEIhvATAdxN@work>
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

On Fri, 15 Sep 2023 13:20:14 -0600, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound,
> the protection that `struct_size()` adds against potential integer
> overflows is defeated. Fix this by hardening call to `struct_size()`
> with `size_add()`.
> 
> 

Applied to for-next/hardening, thanks!

[1/1] usb: atm: Use size_add() in call to struct_size()
      https://git.kernel.org/kees/c/13f1a60fe04f

Take care,

-- 
Kees Cook


