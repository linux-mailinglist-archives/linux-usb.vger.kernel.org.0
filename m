Return-Path: <linux-usb+bounces-1871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF57CE882
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 22:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5E62B2110E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 20:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E3F1EB49;
	Wed, 18 Oct 2023 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qGImROqC"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B981EB3B
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 20:07:16 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9954129
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 13:07:10 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4063bfc6c03so4035e9.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697659629; x=1698264429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPhmrOEAGSKzMIjkwCvY5cv2O4ZSIOLkxAjWrHEja3w=;
        b=qGImROqCUOY96TrtmHXS+8iirCCu5lM5bTlxcKNGoO5ltnV79akvZdjA4NXuJSmJYR
         SOuLE/shapWsFPZEuLPAgpbs5LixNtCbhoy4iJsTScsT+0SBiUciFf5wQygrjXqZwP94
         vwN5piFoZ+tRtCol6sSUuincCy323JUyYJFAAsLT9eKkQznXH1uFz6XGQzfvZ176sFy0
         T8MpHNudCOx/W3ULIPInVnccro3vaMKwRzBv6mc4/nrmgnppykVP6zG/nejt3+syLbLM
         7YFM9+qzk3AybTHrbTqskpT7ExW/jmKu7gqigiVVuheyUql05exeMorWQ/5B0u4wj4cx
         m+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697659629; x=1698264429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPhmrOEAGSKzMIjkwCvY5cv2O4ZSIOLkxAjWrHEja3w=;
        b=XZ4jSfjFoouLBY8ac47UWVacM1Th/YVPfqYojHzqZ76ovLwJ7A+kBH88enslwHPDtO
         difbC5SxqCSm46ob75+6aNqyzy0bMeEJlqPAQiWj3TOswfq8s1POzkWRZecfualt+wSd
         evJuV2XwcNsVgc5VxnpJuEAIz/rHWjOn9/WvyRlmP2nGUbUrwe4haU36Zmdq4O0BBLry
         pPcx/sT9tqZpxoeRdS8wxaJfNY/PWhWQQPeCakb4ZNUCDwYV8ucDNVWczfeAoobXKM62
         bNtvHUjw3S8jDH3UutMr8qJA0Wq6+CykCTxVT77100v8r/1AZWU+2CrMPgh2cYhDTmfJ
         De8A==
X-Gm-Message-State: AOJu0Yy8H5+lf+DYLUIFr4iFzOIg/roo6Hbeok91enn3qNA+ep+zwdNO
	JnORCC2R0yBwS3SqXbh9qI7Lw03Eq4CPqgjTf4zyYhYuF5r2dZxLtCo=
X-Google-Smtp-Source: AGHT+IFkedQ+OHj7eKCi9zaF6kjyK5MOXzE0T4xvjYrgCFJPKLNw2LYw0cD94nyM5tACg+nqXeEkej5ps5730sWdDBs=
X-Received: by 2002:a05:600c:1c1b:b0:405:320a:44f9 with SMTP id
 j27-20020a05600c1c1b00b00405320a44f9mr6026wms.5.1697659628765; Wed, 18 Oct
 2023 13:07:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231016225617.3182108-2-rdbabiera@google.com> <CACeCKac2kknw2s7orH1tu4RsiCr5+WYy1VQ483ok_zuzC2N9zQ@mail.gmail.com>
In-Reply-To: <CACeCKac2kknw2s7orH1tu4RsiCr5+WYy1VQ483ok_zuzC2N9zQ@mail.gmail.com>
From: RD Babiera <rdbabiera@google.com>
Date: Wed, 18 Oct 2023 13:06:57 -0700
Message-ID: <CALzBnUEhV1m841bPtcJUceOb0EiNF_jczVhOTQSFhVbvc9E=dw@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: altmodes/displayport: verify compatible
 source/sink role combination
To: Prashant Malani <pmalani@chromium.org>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 2:33=E2=80=AFPM Prashant Malani <pmalani@chromium.o=
rg> wrote:
> OTOH, perhaps you should just introduce a macro that performs this
> bitwise operation for even better
> readability. Something like
>
> #define DP_CAP_IS_DFP_D(_cap_)        (!!(DP_CAP_CAPABILITY(_cap_) &
> DP_CAP_DFP_D))

I'll take this approach, thanks for the feedback Prashant!

---

Best,
RD

