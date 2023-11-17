Return-Path: <linux-usb+bounces-2959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858E7EF2F5
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 13:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AA40B20AC3
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 12:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECB630642;
	Fri, 17 Nov 2023 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n+KxpGXc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79138D55
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 04:49:03 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a7dd65052aso22002697b3.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 04:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700225342; x=1700830142; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qsLyIAWXgTfFV5o66fNwdmuvFE8TfiDt0QFJ94wxiKQ=;
        b=n+KxpGXcsMw1NAwqeOnVXxBsPJ1gSWBy+0F4o9ZWxsDM9AwZDxyob2UV5C5HB28yoQ
         UwSOqc29fCes4cmIsg/wd6UxH+TgO1AR4vbw7XGOFeO8G7Y2bTYBDkHbi8RX8kS8lAqc
         cLaR+PeeTNSL+Tgn4xTDwYvg/KyEviHgbPbCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700225342; x=1700830142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsLyIAWXgTfFV5o66fNwdmuvFE8TfiDt0QFJ94wxiKQ=;
        b=wAGQJMdqePwl4gyokO+oWX6POd1Dsn2bLZoSlmRHz8MqCXtObZ/U934O8KGH3h/V04
         SdRdoN/bYCTELoSGHoj2/abSz9cXvNl2uOJaZo/Zv6YxiiuJUFbMibP95NN4L0YNetEc
         llGqEeLNNjQipZWrr8Pek1Q/D9QsZTxbW/rfb0611HlbKB++fWABuk+ez8Tp7a5RBAeq
         oxGmM4jfUeO6iQdK3Oolfh2ws1WVzwZ175WEuM0Vva0zAGuHbEih7r9oUlOYhjYGei63
         defYrByLdDcxoPk91AKqsmkv/yJCXHgaZwIfNCaJxvEdEQrDH+ySVi8P4JqmLq1tR2St
         eZeg==
X-Gm-Message-State: AOJu0Yw7kEo5u2BcH0hj0YSV1N03d6Vk+yxPuzhnQeJRC/4LW8WCCfz2
	MB+4iJL0IYRGGW/hq96fk3fu/CL5rM3ZGKmhwzYwcw==
X-Google-Smtp-Source: AGHT+IF41m4ZNgjaVJnawtKF8sXw/YF/ZvPu4eg7ZS7NWmer6g1PwnZwRVdUjpKNOLe0Q5uj/pPQYw==
X-Received: by 2002:a81:6d47:0:b0:5a7:ba17:15ac with SMTP id i68-20020a816d47000000b005a7ba1715acmr22034714ywc.41.1700225342194;
        Fri, 17 Nov 2023 04:49:02 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id m64-20020a817143000000b0055a07e36659sm454804ywc.145.2023.11.17.04.49.00
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 04:49:01 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a7b3d33663so21775367b3.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 04:49:00 -0800 (PST)
X-Received: by 2002:a81:8002:0:b0:5ae:a8ac:ed6a with SMTP id
 q2-20020a818002000000b005aea8aced6amr20030337ywf.2.1700225340427; Fri, 17 Nov
 2023 04:49:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231026-dwc3-v2-1-1d4fd5c3e067@chromium.org> <20231031232227.xkk4ju3hxifj3vee@synopsys.com>
 <CANiDSCvEyjHFT3KQbsbURjUadpQYEfQ=M8esdcHnpWe9VsK=2w@mail.gmail.com> <20231110225507.cl6w6vkyb4dvj3uh@synopsys.com>
In-Reply-To: <20231110225507.cl6w6vkyb4dvj3uh@synopsys.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 17 Nov 2023 13:48:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCu1WdKu+2Erkj9iEnp21Cuk84MC_ow+8o-qETqJH1qMNg@mail.gmail.com>
Message-ID: <CANiDSCu1WdKu+2Erkj9iEnp21Cuk84MC_ow+8o-qETqJH1qMNg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: set the dma max_seg_size
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <thinh.nguyen@synopsys.com>, Zubin Mithra <zsm@chromium.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Greg: Friendly ping, just want to make sure that the patch did not
fell into the cracks

thanks!

On Fri, 10 Nov 2023 at 23:56, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> On Fri, Nov 10, 2023, Ricardo Ribalda wrote:
> > > Probably better to have the Closes: tag with the link to the reported
> > > issue. Regardless,
> >
> > It was reported internally, so I have no link to share.
> >
>
> I see.
>
> Thanks,
> Thinh



-- 
Ricardo Ribalda

