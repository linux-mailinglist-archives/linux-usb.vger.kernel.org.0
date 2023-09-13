Return-Path: <linux-usb+bounces-1-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED479F2CE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 22:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657691F20EE5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 20:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FAC5200A0;
	Wed, 13 Sep 2023 20:23:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D601DA42
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 20:23:46 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA37D1BCA
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 13:23:45 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-770ef0f51ccso17436785a.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694636625; x=1695241425; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6XY8wIMD7LjGNpegRcCUKrZA0w1gq5GxQRY7mj2AIc=;
        b=ag95XfCMSjmSa+KD55TQwEfBv5uUo1cvrq8swC9Y9L6+vmtAzGysPaI+FRYKjhKJwQ
         XLIVjVao/EwcFSHY3TxfTbNkcJlEF4CN0MLlRz7AeQxjVryO7LzH7hSakzNMwhaBzKPe
         4UPoh6u0pdhY5qSS4rJjCXW/OT8x9H6UsfyBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694636625; x=1695241425;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6XY8wIMD7LjGNpegRcCUKrZA0w1gq5GxQRY7mj2AIc=;
        b=kUSidl4muDL6Yola45nSHYZf/AAmilHfPc87SeT4S27nYhTPTK7NKA9bcpAnTKmH34
         zx/b21Wqr4Aync5os4KEQBIjJAYO2RD7mW1RMEov9iHao8/zJ2GtM4kk1Atx2FtfKKQ8
         16AXgh/l041oEo+9TP738pKVGPX3atTP3WtuHsUIJ2FzdWErezHEpIGCt0TTZvMxQH+8
         NQTPAESqeKIf38n/DtvaQsbJqoABFsUX9o7UffxbXYI3ZTaNoWh1RDtRFaliUUNzj7ZC
         xXAv74dQAKFN3b92/uvC56s9+uBwAirGQsPBvFddDfeC42dvpaORgprcgTdQhc7YdAxZ
         b05A==
X-Gm-Message-State: AOJu0YwaiSHkj/2jpk1NNJVAc/RO/PeMpENejYH93V9WAD0IOKK47t+d
	3ycabYKgPlyFVEqRJqKK34Ub/e2IheoFrHmcWaU=
X-Google-Smtp-Source: AGHT+IFnh5tXdvAG9bXRFjcRCwtUyfVz81P/6bycyuiP6qCifzFnuhaQGnKsNJ4RjlY4uLYWJ33y3A==
X-Received: by 2002:a05:620a:2809:b0:76f:509:c78a with SMTP id f9-20020a05620a280900b0076f0509c78amr3827309qkp.22.1694636624855;
        Wed, 13 Sep 2023 13:23:44 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-110.dsl.bell.ca. [209.226.106.110])
        by smtp.gmail.com with ESMTPSA id z22-20020ac87116000000b004108f6788a6sm23408qto.41.2023.09.13.13.23.44
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 13:23:44 -0700 (PDT)
Date: Wed, 13 Sep 2023 16:23:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Subject: This list is being migrated to the new infrastructure
Message-ID: <20230913-early-gloomily-4066a8@meerkat>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list is being migrated to the new vger infrastructure. This should be a
fully transparent process and you don't need to change anything about how you
participate with the list or how you receive mail.

There will be a brief 20-minute delay with archives on lore.kernel.org. I will
follow up once the archive migration has been completed.

Best regards,
Konstantin

