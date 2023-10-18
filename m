Return-Path: <linux-usb+bounces-1879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7BF7CEB45
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 00:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1629B2110E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 22:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B9F3E019;
	Wed, 18 Oct 2023 22:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JT3ODgYe"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC9237143
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 22:29:20 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D1C116
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 15:29:18 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1ca72f8ff3aso28070065ad.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 15:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697668158; x=1698272958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MlEhPotc9YVtJuw6c5D3IvfNe+8QoING9f1FrC2gg/U=;
        b=JT3ODgYecULnjYpL8MERlDIjflhc1CPn9eeq2YXXsPQID82x6RcvoccyBhciNM/qt0
         KBaQivWvSMJ/5rYdwMHBuIiQDdqNZyPnIP/vYt9qKmwwfH/8CAlJNw7r3R+1XtDqI+Cy
         Gj4Gl+bU+jQI8wDOkfVlSM2uoLG/O1p+4Uacs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697668158; x=1698272958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlEhPotc9YVtJuw6c5D3IvfNe+8QoING9f1FrC2gg/U=;
        b=J6dJMmKi936uB7KceYWucOjLOwE1l7k/m2cp2DCsTRHCVNwGCBn8yDvJ8bv0lGSZ5B
         Uwh/an6d8fR4aC5Dw5OmXd6oot4U6DMJR0XIIvXM6hlIkNl6nlJhvhjk/q8b1msA0RxS
         XpoEOqHw8yCvYvL93cmUuDvPK2Ak8BiAXIxhjTwFfRaCyXTXPK3Brxpw5eyvUIu6SNsi
         5YZKZN1qlrqogXPAMjG7ozHZvLHPayxPWlq6qWp0260mX/UtLv4ehC7GpzdE1I8Dynfy
         /IxuDpbnT1nf2JF5ZDqgh2fN6UYYMHPtJ4g3LYvtgwzFF26HvrQyD8k45DmemTFw0hwL
         rUbg==
X-Gm-Message-State: AOJu0Yxc/YgHeF+DxiBiUnVXEzPRgwiiwBKBfUYvhwETOC4sdH4btCj8
	fBk5bsnUFZIN9vdLtNC4CS33sg==
X-Google-Smtp-Source: AGHT+IFa7ai3cfHBIJet4SvOmgqTNI6nHVqvudThEcy1ldRSisV/7jAkhiE1Axsq53XFBLKli+nTAA==
X-Received: by 2002:a17:902:dac8:b0:1ca:64f:35ff with SMTP id q8-20020a170902dac800b001ca064f35ffmr877478plx.48.1697668158080;
        Wed, 18 Oct 2023 15:29:18 -0700 (PDT)
Received: from chromium.org (77.62.105.34.bc.googleusercontent.com. [34.105.62.77])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902cec400b001bf6ea340a9sm425908plg.159.2023.10.18.15.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 15:29:17 -0700 (PDT)
Date: Wed, 18 Oct 2023 22:29:16 +0000
From: Prashant Malani <pmalani@chromium.org>
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	badhri@google.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: altmodes/displayport: verify compatible
 source/sink role combination
Message-ID: <ZTBcPEXV5UL_HP3W@chromium.org>
References: <20231018203408.202845-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018203408.202845-2-rdbabiera@google.com>

Hi RD,

On Oct 18 20:34, RD Babiera wrote:
> DisplayPort Alt Mode CTS test 10.3.8 states that both sides of the
> connection shall be compatible with one another such that the connection
> is not Source to Source or Sink to Sink.
> 
> The DisplayPort driver currently checks for a compatible pin configuration
> that resolves into a source and sink combination. The CTS test is designed
> to send a Discover Modes message that has a compatible pin configuration
> but advertises the same port capability as the device; the current check
> fails this.
> 
> Verify that the port and port partner resolve into a valid source and sink
> combination before checking for a compatible pin configuration.
> 
> ---
> Changes since v1:
> * Fixed styling errors
> * Added DP_CAP_IS_UFP_D and DP_CAP_IS_DFP_D as macros to typec_dp.h
> ---
> 

FWIW,
Reviewed-by: Prashant Malani <pmalani@chromium.org>

> Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: RD Babiera <rdbabiera@google.com>

BR,

-Prashant

