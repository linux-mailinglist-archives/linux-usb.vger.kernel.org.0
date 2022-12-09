Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 419C36483A0
	for <lists+linux-usb@lfdr.de>; Fri,  9 Dec 2022 15:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiLIOTS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Dec 2022 09:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiLIOSr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Dec 2022 09:18:47 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DBC1D65E
        for <linux-usb@vger.kernel.org>; Fri,  9 Dec 2022 06:18:44 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id o15so3351101wmr.4
        for <linux-usb@vger.kernel.org>; Fri, 09 Dec 2022 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rqRoXzIwEU1zj8bbDdo1JhYsHCe+Ftd9l7ZfInZw3d8=;
        b=czdanGLrDAyClU5QU5AQxcinaoDoWniKhl88AKAL2HIY+ifUSLmSjhdLqGEpOECfRj
         Z3v4v2QcgJqutrx7bw7vfyZBEzOYSgYDvxpViB5D11WTxY7I5zqdG/KoMpqpK/Yx6XBC
         qZufVQ66nL84yglPGwgRlkIMGWw8Qz5Ke8NirlX8CgkM0nRdTGTTuCi2PJVwypAHnCOo
         iq5Y8kf5ygbAEsRE3fnrim/nYs4WX9utVoHrr+t4U4cHBWw5jyO3/sPlCJGyiKXu/Xls
         ulVZPZhwOEdl28x8OySAPsX4N2aCPAnbqjyCSoUKY3oqx9muAK29mCUvIAsmoZ3+DeQm
         T6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqRoXzIwEU1zj8bbDdo1JhYsHCe+Ftd9l7ZfInZw3d8=;
        b=3MqNaFI7UmjR8Gu89isVEI1w7z08Ivm13vu8n/dZU6uSz8BOFfaqEapim8zyBZ2i5d
         0PytCTvAf/QxsEJIr6rVJPkWzVfvtXBN729v2BJHZ4g22QMeexG93JDPo9EYtYGZudVq
         QdbHPTKIo2iZaShwupWZ1D8oYFnatQ0ydV/HO1PIhOd6MTm4gksdaeEiEhK05TWLw5Is
         FWrmlccmzllFsnKipQr8ihwDZVONHE7cEQhR363mx/xQAgSYDs9LwiFSm8eTdB+KdJuP
         2jGKMvPwJN7QQGpCsZKHywNl4A9ddQu40yiYYtIxRkU1nqGWKG4JmbowTE+oNCKEz6R6
         PzKg==
X-Gm-Message-State: ANoB5pkfQ70oDeOWR96PvaM0RbzGKqBUsvucaSeMhz4p1Ug29vaeNeKp
        pAJM4S1L0D0WHUmVBZ62wjWDgQ==
X-Google-Smtp-Source: AA0mqf5HnEezPwRXRfAv6gmx0BINo5sfONCkIqxCk4H/YcaCk8vM6p19rHCM888dibQN+ISegErqXg==
X-Received: by 2002:a05:600c:1d15:b0:3cf:c2a5:5aad with SMTP id l21-20020a05600c1d1500b003cfc2a55aadmr5210391wms.14.1670595523376;
        Fri, 09 Dec 2022 06:18:43 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id q3-20020a1c4303000000b003cfa81e2eb4sm1897390wma.38.2022.12.09.06.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 06:18:42 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:18:40 +0100
From:   Corentin LABBE <clabbe@baylibre.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/2] usb: serial: add support for CH348
Message-ID: <Y5NDwEakGJbmB6+b@Red>
References: <20221114073736.672194-1-clabbe@baylibre.com>
 <20221114073736.672194-2-clabbe@baylibre.com>
 <Y4DETJvl12YfnMxF@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y4DETJvl12YfnMxF@hovoldconsulting.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le Fri, Nov 25, 2022 at 02:34:04PM +0100, Johan Hovold a écrit :
> On Mon, Nov 14, 2022 at 07:37:35AM +0000, Corentin Labbe wrote:
> > The CH348 is an USB octo port serial adapter.
> 

[...]

Hello

Thanks for your review, I have fixed all problems.
Thanks again for pointing mxuport, the code is shorter now.

Regards
