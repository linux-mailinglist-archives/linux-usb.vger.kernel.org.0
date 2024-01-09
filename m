Return-Path: <linux-usb+bounces-4892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CD82863A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 13:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E97931C24291
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 12:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB45381DA;
	Tue,  9 Jan 2024 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SRFTF1ul"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E14381BB
	for <linux-usb@vger.kernel.org>; Tue,  9 Jan 2024 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28c93513462so1654685a91.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Jan 2024 04:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704804524; x=1705409324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=equj060FCt2kUxy+zeJ1G6xYNbtT2kIm8VC3uUxQ9x0=;
        b=SRFTF1ulw2TAO7H8y2gr8dkwuAMEbEb+7jHFj4zkx3AmnqK6w3hMijt2Q0ARZbY19U
         n28DwBJISHHEiCDTomIJN9XBHsdZbIv1RekOnt6DOkdNQ+qA9i7LqumussR6DX9lXbjo
         nUBWp94cLqfHr6TQa4qCondjRzmmIHwt8C0Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704804524; x=1705409324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=equj060FCt2kUxy+zeJ1G6xYNbtT2kIm8VC3uUxQ9x0=;
        b=n1PcDu7qtc0SC8lMz4ZTLu49maK+MJQG3J41x0ueCAquMBcFtvYowQkj8E4I+JtkJu
         X+cXkRpltVjrxmhhaDiThxnkYm7pWEAw6S7oazZ/xqWwcxDFOkCrZKAhvZN28O0nSemi
         /3v0+4jCSn8syjTo4n22ngHI5TVk0cLSymFiQFWGNTXZhaXcx1oCtT5fU49ciqI3pihM
         yiXT9rp6Frs4SL+oNc1cFYEW3s1brn1ECvK3B4+si0OtailToPpOLAID5JwKkNm+a2Pg
         j1OCHYhgF1E0Rob8ZKzuSdUqeTf3yobwqGEbx5jb78JI/FdqUmxCHi0oE69z8yLIi8do
         CAbw==
X-Gm-Message-State: AOJu0YxC1OLgAwXYTEvTd346CatrJlCMEWXfpq1IGmyJsj47CvtFZrM1
	IZsXG3SSTmM/i5u67awvGrfWXPZb3txw
X-Google-Smtp-Source: AGHT+IFaKPZTM2YqYrni+6vdDEZ1l2skb9dMVIwfSfVJEvEFl4Gkl73woedlMgZ1EXGQC6+X2xvV7w==
X-Received: by 2002:a17:90a:17ab:b0:28c:93c5:1f9e with SMTP id q40-20020a17090a17ab00b0028c93c51f9emr2332149pja.63.1704804523918;
        Tue, 09 Jan 2024 04:48:43 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id f21-20020a17090a9b1500b0028d9c540b12sm1292899pjp.23.2024.01.09.04.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:48:43 -0800 (PST)
Date: Tue, 9 Jan 2024 21:48:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] media: ucvideo: Add quirk for Logitech Rally Bar
Message-ID: <20240109124838.GB1012017@google.com>
References: <20240108-rallybar-v4-1-a7450641e41b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108-rallybar-v4-1-a7450641e41b@chromium.org>

On (24/01/08 08:17), Ricardo Ribalda wrote:
> Logitech Rally Bar devices, despite behaving as UVC cameras, have a
> different power management system that the other cameras from Logitech.
> 
> USB_QUIRK_RESET_RESUME is applied to all the UVC cameras from Logitech
> at the usb core. Unfortunately, USB_QUIRK_RESET_RESUME causes undesired
> USB disconnects, that make them completely unusable.
> 
> Instead of creating a list for this family of devices in the core, let's
> create a quirk in the UVC driver.
> 
> Fixes: e387ef5c47dd ("usb: Add USB_QUIRK_RESET_RESUME for all Logitech UVC webcams")
> Cc: stable@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

