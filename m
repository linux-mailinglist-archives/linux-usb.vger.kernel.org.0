Return-Path: <linux-usb+bounces-2264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A87D95C1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCA8C1F22CA5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E1917756;
	Fri, 27 Oct 2023 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JbXPZb95"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7BD8BF9
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:57:09 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A661AC
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 03:57:06 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41cc7b67419so14980501cf.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 03:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698404225; x=1699009025; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0A9loy1aY7VPkTdE3IuoQHU7Fso8JnZ0H8sKLa3lXGs=;
        b=JbXPZb954Gr78Un9YgXd6ibxOUXRfmIXvt/Y9idIjTmGuTQ9lavlRF7S8wF02bI2Da
         EYzMJcUiBmxeImbndkhCck1k5kYM5IZ7DPMG5M5DjzI6FSwz6DxDODBtZKlG1D/jKwP0
         ZYPHrtQZz+P4g1sJV35i+h2z9BrjyIwDTQloo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698404225; x=1699009025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0A9loy1aY7VPkTdE3IuoQHU7Fso8JnZ0H8sKLa3lXGs=;
        b=I/mM2EG8YcYcI+87Dtspoop863EPyqKYKkQe2/uzZJ+F3PU11Vt7XmsEfNxfXoe7ZE
         UQyhoPraoqx3r98Y4UKDvF+u5CPIq9jFLp3FeIPkHyviRqAcB+TdGgtdiwk6by63sQZl
         9y3w6eIHfJYKDERZCdY5d7PwqQytpRjRYFLc5qK2B2kKAfSVcZ/lkTj216qhzSGV6Xha
         vez3adWU978oUXzPa13dCNLtewwDJ2FwSCueZXIcmyVTMDeTDFgkxl95/YcLt25Rfa2q
         y5Ijnj4FKqWdMprpIhhJxfFUaRLixW8vUsqsp/9MQPP7/Uh5LS881zgaX0VcO/YU8sV8
         hmOA==
X-Gm-Message-State: AOJu0YziL4Ybap3L3qzHn3pc1tzbx65vZzeAjPITUxEsHor4/kBCvjQV
	Qd2lkAjUfEbQM9UTSF5p2jg5R/yWJ1GM782+kBUttw==
X-Google-Smtp-Source: AGHT+IEBme/Farl9SUMBICeXPhEO1NzGAWncgcmm2IWPAOu5xzYb/apAHbjpXHChLud/v24UyRcGMQ==
X-Received: by 2002:ac8:7f47:0:b0:41c:e129:87dc with SMTP id g7-20020ac87f47000000b0041ce12987dcmr2550413qtk.36.1698404225702;
        Fri, 27 Oct 2023 03:57:05 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id q6-20020a05622a030600b004180fdcb482sm477530qtw.81.2023.10.27.03.57.05
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 03:57:05 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-66d2f3bb312so13072466d6.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 03:57:05 -0700 (PDT)
X-Received: by 2002:a05:6214:4009:b0:66d:618a:b347 with SMTP id
 kd9-20020a056214400900b0066d618ab347mr2805248qvb.14.1698404224907; Fri, 27
 Oct 2023 03:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231026-dwc3-v1-1-643c74771599@chromium.org> <2023102753-spirits-aerobics-c2c6@gregkh>
In-Reply-To: <2023102753-spirits-aerobics-c2c6@gregkh>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Oct 2023 12:56:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCtbQkEaSFgFCyWDQGGoTzFfiM7QaO_LfWMjqPZfAYodFg@mail.gmail.com>
Message-ID: <CANiDSCtbQkEaSFgFCyWDQGGoTzFfiM7QaO_LfWMjqPZfAYodFg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: set the dma max_seg_size
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zubin Mithra <zsm@chromium.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg

On Fri, 27 Oct 2023 at 12:51, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> What commit id does this fix?
Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")

Shall I send v2? or you can pick the tag?

Thanks!



-- 
Ricardo Ribalda

