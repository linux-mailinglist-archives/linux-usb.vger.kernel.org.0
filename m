Return-Path: <linux-usb+bounces-3588-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE63180147E
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 21:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CEAE281D4E
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 20:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270AB4E62B;
	Fri,  1 Dec 2023 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GS7SyIQt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8EC1713
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 12:31:16 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7b34c5d7ecdso80976839f.0
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 12:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701462675; x=1702067475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+EUuqZuvrB4W59cRhl0cknB02foDINxSF3GIXDLo+U=;
        b=GS7SyIQt4TbMYhRb0L8VzN5lBXG8UAwXGFWEQraQRAVBfSKe+KRLp5NcHHXdkDaZBX
         Rsf877zuMjw3eaP036cRzS9V1k56TiWS5G3skOjL/BsPBlOeK8a6ZHn55VmBpTfUhPLy
         ZQV+EGWW4taxNwGfTWPJN0aq/k8F2tIYQC0SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701462675; x=1702067475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+EUuqZuvrB4W59cRhl0cknB02foDINxSF3GIXDLo+U=;
        b=ap/ERpCEzbVDf/I1SkaNLRg6tTxgz4XdRLo+/15lZk3eKk5XzJXfZbWqJIt8SdmPCf
         0S0iZRZPLCdFc8rmFHwNOV7agq5XFei2p1We44fXsg9+5n6j+sveuBJiu54XeWeVExmt
         wUpPYxh9dWdDNUE8QSXk2kdYHcpj+uu9I6yVVdhf9MtHNCsty2ZkhV0AmVWGBaWaTrXf
         +yCfAC1aCPHP7Jvu1FYJ4+PygKwu0qAA//levYThFZBkHIAX+JFNx7Iv574jvD5evhpq
         KEAY38PHhUuerRYhus17pVGWl7MdabOOk87AIS10E4cZzYeHzAVgY0im4QnnX+UUmP4K
         RBww==
X-Gm-Message-State: AOJu0Yx0Su7Sswe71UZ5iypzRqX/iWmOVBUSzA18Kr5mLb3xRscILWOz
	viBTHtWt8nrJtetZ3hJNKesKDA==
X-Google-Smtp-Source: AGHT+IEz0TtG8++a6j8TNO+x64tCKqqrWpTZU+KMFbvdVOawUs5BYTTq0W7rjH14ItqcqrDHOzHHtQ==
X-Received: by 2002:a05:6602:82:b0:7b3:ef90:a56f with SMTP id h2-20020a056602008200b007b3ef90a56fmr127647iob.4.1701462675503;
        Fri, 01 Dec 2023 12:31:15 -0800 (PST)
Received: from localhost (74.120.171.34.bc.googleusercontent.com. [34.171.120.74])
        by smtp.gmail.com with UTF8SMTPSA id s1-20020a02ad01000000b00466844b037asm1040222jan.100.2023.12.01.12.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 12:31:15 -0800 (PST)
Date: Fri, 1 Dec 2023 20:31:14 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Anand Moon <linux.amoon@gmail.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [RESEND PATCH v2 3/3] usb: misc: onboard_usb_hub: Add support
 for Cypress CY7C6563x
Message-ID: <ZWpCkolQOWOwKedB@google.com>
References: <20231127112234.109073-1-frieder@fris.de>
 <20231127112234.109073-3-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231127112234.109073-3-frieder@fris.de>

On Mon, Nov 27, 2023 at 12:22:26PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The Cypress CY7C6563x is a 2/4-port USB 2.0 hub. Add support for
> this hub in the driver in order to bring up reset, supply or clock
> dependencies.
> 
> There is no reset pulse width given in the datasheet so we expect
> a minimal value of 1us to be enough. This hasn't been tested though
> due to lack of hardware which has the reset connected to a GPIO.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

