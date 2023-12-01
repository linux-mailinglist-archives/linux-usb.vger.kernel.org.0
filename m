Return-Path: <linux-usb+bounces-3586-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E84838013EC
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 21:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 767C8B20FA4
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 20:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546CB54BF4;
	Fri,  1 Dec 2023 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ehX/+cx3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79902C4
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 12:08:37 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35aa6107e9fso8940625ab.0
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 12:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701461317; x=1702066117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5X67UT48wg/5S+eDppQqxVPicA/oErz3kVT5PTAiSag=;
        b=ehX/+cx3iPY6svSaiLZ9VzvRWANI0cJqQli64GM088iKs7vFTwHY7bMzd7RNL2vvlQ
         mK5M/jAhNKEezESaxjUOrwTu+11OxWM2rkjP3h6CA6WkuR6YGfiug5tZqbqrNop9rmlY
         wMvsyxaFsyDCGKmv5xNVja5rJcjj8boCISxjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701461317; x=1702066117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X67UT48wg/5S+eDppQqxVPicA/oErz3kVT5PTAiSag=;
        b=jEKoexLR5jMPKQCg20Tt5C8AO+eTzh1ns577PuPczMgUN1+XUXvuY0FuTmvqjqJleA
         qgw14OZx0LHObsMSiZLJ9dTxCglPk6BnC6P8JUng5y38CaO3u9zeLDdobaV18Mxt1iJp
         9KHpmYt6Sgyxm/3SNAXAqvQwUD9jGArsmzOFb1iUhUuw2XCXcstV9BAyDeDekLStZhBV
         jw19XL89OdJ7ykXjnOrJkYvgoX356IyIcvz8IZfbX6s+2QFcpicxvM0n0O8bXvDSKtla
         bfSqYN4nLaJXX94789wRzl+XRuXiRFJ6apEMU7Ch68VM55GoLzpn7OOOK0LsqYHGITHh
         fA+g==
X-Gm-Message-State: AOJu0YxzUTgtBsBikHVELqmawfj4yuGD3JSEhitlAsxG8JZUcj6IpWDn
	1OhSHFHBqW2QJsCAT/8m7iLpCA==
X-Google-Smtp-Source: AGHT+IGafXXzfp/Kjl2w6ZU4AO7+2S3gpE7t2D/zhikZhTXGjbpHML5z+Irzs9a1Q+blMY1vw9EvXA==
X-Received: by 2002:a92:dc10:0:b0:35c:a639:bce3 with SMTP id t16-20020a92dc10000000b0035ca639bce3mr76174iln.1.1701461316905;
        Fri, 01 Dec 2023 12:08:36 -0800 (PST)
Received: from localhost (74.120.171.34.bc.googleusercontent.com. [34.171.120.74])
        by smtp.gmail.com with UTF8SMTPSA id bt10-20020a056e02248a00b0035cafe5d3d6sm778ilb.32.2023.12.01.12.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 12:08:36 -0800 (PST)
Date: Fri, 1 Dec 2023 20:08:36 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Rob Herring <robh@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [RESEND PATCH v2 2/3] usb: misc: onboard_usb_hub: Add support
 for clock input
Message-ID: <ZWo0ZjKDsZKa6RyA@google.com>
References: <20231127112234.109073-1-frieder@fris.de>
 <20231127112234.109073-2-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231127112234.109073-2-frieder@fris.de>

On Mon, Nov 27, 2023 at 12:22:25PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Most onboard USB hubs have a dedicated crystal oscillator but on some
> boards the clock signal for the hub is provided by the SoC.
> 
> In order to support this, we add the possibility of specifying a
> clock in the devicetree that gets enabled/disabled when the hub
> is powered up/down.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

