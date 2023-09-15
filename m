Return-Path: <linux-usb+bounces-169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB597A2750
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 21:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ECCC1C209F4
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 19:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732BB1B262;
	Fri, 15 Sep 2023 19:43:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4EF19BDB
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 19:43:24 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C871FCC
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 12:43:24 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf7a6509deso20071615ad.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 12:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694807003; x=1695411803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a6+sswFsC9jOA36RIWjPp2T/q8ZGAafBXoclkZefwbQ=;
        b=dqgnotqsnYIi5a/HnQxT9yvJWcsPXKoTbdz0zQ3erVMxfsBwebSvRgePUHaxdRP9Dz
         KfQ0n7hYc3yYHXxFyXoZealbfy6yqIvjIgqvwo04TTk1aSNEWRyjF9Dm3NCMBFRmy9S1
         yPYcNbfRDsJiH8qwyEiwdiE10W3CaKo8drpaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694807003; x=1695411803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6+sswFsC9jOA36RIWjPp2T/q8ZGAafBXoclkZefwbQ=;
        b=r97czUtIeKErUMzRQnOvlciii2SXg8AX6exiij6VWBGyVVI5uGMVdIn66wbDfRrW0a
         BMmPaVW+XtY+U/G3sJZtcYBjWKLnqD1RYCVQYi+9myvGSd/KS3VdTXOdh7mKrzI4mL5s
         wqkZ8s+3mgw2X5gpoWvlz9Vvho8ZFvCY2rVIOhO0XDHKLMLFJ0pEZMYJPC2OiwGNmDID
         wGaWEa+q10mWgCXTQvtXx0TfEJUzwJZxtb3dL9JmDecWvP7aN5ia/8QJlkXxfFJ5ri/2
         ZPYB2PZAOPvSS5JNvLOTsXmSzIp/R4jT78zfdiWD8biDtYZtpWLlapb8tTlhZP93nII5
         JkqA==
X-Gm-Message-State: AOJu0Yz45HoTJ1VsI9V471a1/irISgnJw3GpFP3b7r1oqLK3b14b5j3r
	m+O+X5qmrfgA4JTddkWPgyGe1g==
X-Google-Smtp-Source: AGHT+IFSpBH4WxdF3BlGbEDuAyvk2UVoNFNE1yYoSuMa31xAi+uP36IkyDJkx9K3A36VzJvCVoF0AA==
X-Received: by 2002:a17:90a:f3d4:b0:274:6cd3:a533 with SMTP id ha20-20020a17090af3d400b002746cd3a533mr2314769pjb.20.1694807003442;
        Fri, 15 Sep 2023 12:43:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a199700b00267eead2f16sm3640941pji.36.2023.09.15.12.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 12:43:22 -0700 (PDT)
Date: Fri, 15 Sep 2023 12:43:22 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Duncan Sands <duncan.sands@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] usb: atm: Use size_add() in call to struct_size()
Message-ID: <202309151243.028CC322D@keescook>
References: <ZQSuboEIhvATAdxN@work>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQSuboEIhvATAdxN@work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 15, 2023 at 01:20:14PM -0600, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound,
> the protection that `struct_size()` adds against potential integer
> overflows is defeated. Fix this by hardening call to `struct_size()`
> with `size_add()`.
> 
> Fixes: b626871a7cda ("usb: atm: Use struct_size() helper")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

