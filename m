Return-Path: <linux-usb+bounces-450-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F127A9CDD
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 21:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61FBF283E00
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 19:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED9151B86;
	Thu, 21 Sep 2023 18:34:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1848835
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 18:34:52 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8897FD5124
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 11:25:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so1737168e87.1
        for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1695320738; x=1695925538; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PImsx6KWbNqeW3aSQcC5Ii8dPWKbRVigN6bpHRAR4iI=;
        b=diejVKbu1v429xsxEKfMvPKkSLrVCNr89TBb7Ua1vZ3VoUZn3uRzTPD37LZ45zuCyH
         HBf/p78Guc27VkLBruz5oAVWuqjMZy5UvQKIm4olRfdURwDWPNN7wDTfDUwN8YG80xqi
         KxnhiDi045AaNleohv2r/VVTstnWHnLcbhzj7Vf062KJW2VwT1B+Wxltt2ArxjpjNyH1
         D7LqYOU2IKNIYrTWOCVy0RSfQ7YDnyCeXVXuiiYNKX14y0T1iYHlk/TkKLJSJ6KcTOHr
         vHG8lRz1g+Y/yI3nZz4M3I+WotOEE/A5f/QJJHGxCSiGZ+1SUZh50kms93h+IbPRs7ZZ
         zkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695320738; x=1695925538;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PImsx6KWbNqeW3aSQcC5Ii8dPWKbRVigN6bpHRAR4iI=;
        b=FGg67jyuKphS6F8jEs7ixIVxtDyw6DsOBpc3snAUUC00U9caQTi123QAJEv2OS9gls
         GS1KdDCRPFS2RVUaZ3U+EQJsdef/vNt/W0seQYXqA3kHg52pMTEdIvDVEL/1Cvp+kt3w
         hqqvCYlKmFTdJoe7n26/0oC0DZKO5bnxZ9tkYdmMX95UKq1Yln7FksA0bjqbzJLlq6nY
         uXxf+KXelQoX8hxA72yn/qWLC49FwtWVKK/L2VNBNCGUKrrXxOtMqQQ2mD1+ejDJSRfd
         L2nG2jlhvIeGfgpc9JjYhbVOsL6/IEmNOxPT0FBdBOFU0O8O6T84qmFcU1h/3Nm2z94r
         dCGg==
X-Gm-Message-State: AOJu0Ywk4GkisGPo0hBbXeWwQ+KRljtWxZBWA1nbI99bh6kZs55Vit2Q
	IdL3kYSsaoh9CoBujKZOOCCFjbHRQUTbRQjf4BnQlp/CVzmM0RP7Hg==
X-Google-Smtp-Source: AGHT+IFl+eP0H2PDCxlqQpOe2LDiAdzem0Vet1AdL+OxBmXcP12GPV6P5bL+gRXHdK1uYNaJH8PE9PebIIyY/Kq9MCk=
X-Received: by 2002:a05:6512:617:b0:500:b5db:990b with SMTP id
 b23-20020a056512061700b00500b5db990bmr4609070lfe.47.1695300086936; Thu, 21
 Sep 2023 05:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Da Xue <da@libre.computer>
Date: Thu, 21 Sep 2023 08:41:16 -0400
Message-ID: <CACqvRUbXK3gNXB5me0OvWy2qkyHU22JjBZaJ8Sxm=KJd8gzM-g@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Soft reset phy on probe for host
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-stable <stable@vger.kernel.org>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Thinh,

I can confirm your patch fixed the issue on RK3399 when I was running
on Linux 6.1.54.

I'm not on the ML for this so I'm sorry if this email causes any issue
as I'm not sure how to reply to a thread from a ML I am not on.

Best,
Da

