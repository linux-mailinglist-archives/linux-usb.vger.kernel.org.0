Return-Path: <linux-usb+bounces-1345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4F7BF5DB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 10:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CA331C20C72
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 08:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73A715AD1;
	Tue, 10 Oct 2023 08:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Hsnnv3fI"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E9A14F81
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 08:29:43 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6065A4
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 01:29:40 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4060b623e64so32406525e9.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696926579; x=1697531379; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=YrDpZmZefXlqy3WFlkBNTJUKRA9XMwssY5ktKEP6Rng=;
        b=Hsnnv3fIc1m7TH1rMUBq/XXbHKa/9pGFZSmM27eWflv+izae8wc40whIQbfV+4SXGS
         DpD5lfNC6hieAQ5fIUyXVDh2vrCG9QtGniL3DAHlBSQnCKEV6+GbXQSpbtnSmmwfDlsw
         buX8++UZjbZnb7OFumRcBTJ648pb9QtMUo5gWhnXE2AF/67ThOeTddyF1J874AnYANEL
         NpQLX/3TLg7pHWAc/XBxJB4vMUz+/un7TYo9Ve9WUg2f8+KSlYFf6T9HGbzx94s3ARer
         qf5jYW5gyC1Zr1Jkq4tLjPaOsDUK7tZ/+ysysIxBsn/HXkaBqO2bWDmpSTwDdUxnKpZ3
         /LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696926579; x=1697531379;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrDpZmZefXlqy3WFlkBNTJUKRA9XMwssY5ktKEP6Rng=;
        b=ItLvjfniufleBaiDpMAhltRNHvrAk4xNgpmADahZsg1F7Qxzte+86yLJShDEHP/FK6
         xwNTimrKbfdx693H+UXYvoMkZUodSwdQsvHqmnhm27bToDDpNt7AslxBe8EG4WlIUApp
         hXgSIsADnQ4DMlg+IldKz3e+dkP8p/ggkWZXXR0fD1kkpJQ2ayyaLqQEn/B2RtdP/KHt
         hX6IHsXQrP77UD3oVpl+Vh/G5ZrP7pdQK+Bz6Wostv5iOuu1ujIPnbIA2vOXOTTr1oco
         gLzW0rLA24MgXuhcq6+JwqZzgUAYLJdBSDiBx5tLS12R/UANZvgHHnXKu4vzW+eEBm38
         0RkQ==
X-Gm-Message-State: AOJu0YzE3dF8gkEYzTHCWr8ELFHGLs2zovN9BincienalHBdh+WzKaZ8
	e62LfLaUgBEfJ1YxW3GLtmC/Rw==
X-Google-Smtp-Source: AGHT+IFk5wTB1OSheyR+tcxmgmgrUuRTtfgpZrtLiJ3/eRJ6WTGcqEUM2TECgII5D5zIpHI9IGCKgg==
X-Received: by 2002:a7b:c457:0:b0:401:c8b9:4b86 with SMTP id l23-20020a7bc457000000b00401c8b94b86mr13461614wmi.9.1696926578938;
        Tue, 10 Oct 2023 01:29:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cb24:d0d8:242b:616c])
        by smtp.gmail.com with ESMTPSA id z23-20020a1c4c17000000b00405935b417asm15681065wmf.2.2023.10.10.01.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 01:29:38 -0700 (PDT)
References: <20231006101028.1973730-1-jbrunet@baylibre.com>
 <2023101036-ambiance-precision-657c@gregkh>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Neil Armstrong
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH] usb: misc: onboard_usb_hub: extend gl3510 reset duration
Date: Tue, 10 Oct 2023 10:27:32 +0200
In-reply-to: <2023101036-ambiance-precision-657c@gregkh>
Message-ID: <1jv8bex4lq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


On Tue 10 Oct 2023 at 08:56, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Fri, Oct 06, 2023 at 12:10:28PM +0200, Jerome Brunet wrote:
>> Initial tests with the gl3510 has been done on libretech aml-a311d-cc.
>> A 50us reset was fine as long as the hub node was under the usb phy node it
>> DT. DT schema does not allow that. Moving the hub under the dwc3 controller
>> caused issues, such as:
>> 
>> onboard-usb-hub 1-1: Failed to suspend device, error -32
>> onboard-usb-hub 1-1: can't set config #1, error -71
>> onboard-usb-hub 1-1: Failed to suspend device, error -32
>> onboard-usb-hub 1-1: USB disconnect, device number 2
>> 
>> Extending the reset duration solves the problem.
>> Since there is no documentation available for this hub, it is difficult to
>> know the actual required reset duration. 200us seems to work fine so far.
>> 
>> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Fixes: 65009ccf7e8f ("usb: misc: onboard_usb_hub: add Genesys Logic gl3510 hub support")
>
> I can't find this git id, what tree is it in?

Silly mistake. I must have taken the git id I had before you merged it. Sorry.
The correct tag with usb-next is

Fixes: b447e9efe50a ("usb: misc: onboard_usb_hub: add Genesys Logic gl3510 hub support")

Should I resend it ?

>
> thanks,
>
> greg k-h


