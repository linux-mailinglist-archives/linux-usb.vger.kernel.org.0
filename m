Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90C473064E
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 19:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbjFNRtL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jun 2023 13:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235822AbjFNRtE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jun 2023 13:49:04 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04395213A
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 10:48:59 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-66643830ab3so974917b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686764938; x=1689356938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjrKab4vfGxL0dLn3LMbtzN7OEg/16CgMG49/q/se/g=;
        b=eCzeoU8LezyUAvJVYQgqiFYeiiMn3HN0d1MFvlfoQcOtsyJGayKkkfvin8rgYYT0Bt
         VTZZOHWzvvj9xL8WycutB9Jeggr8qAprVQaAIU3ZW8LODkJWI3m7vBx5wSR/27xhbNrw
         9NrPMzZ9s3xIoU7SPD4pN2wH8igILNyC1g9R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686764938; x=1689356938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjrKab4vfGxL0dLn3LMbtzN7OEg/16CgMG49/q/se/g=;
        b=bkDZgXwzE1uMn9Kh2sZ9NiSiD9tW8XVs3zA9EpbUjLxR7bN22pNwJEhuhaGcKVhzTR
         ZRjgU/ms2tvri3Z2E2LMB0GXCtsNofjekQAfMR3hQNic4x5Jtlf1TYAxLcVg5ekbEKR1
         ljv4zWpiIQU0T44TMgWYAoo58VojAdNhZFQzVCgADdLY2s2YPLtTrGLkBnX8asEdtUgH
         NrDvmLWc7eb17LlnI6CD/kXnrMM6V6OKUtml+6zcpo2+rIHRTLpvGWUSwsiEahRUZn7A
         VDdpVkNyzTbTxwSnRS4j4jb7xbMft5hvwHFW1I66E4zMQDCQgsXJI+PIaYB8Am81aKQ5
         X4Vg==
X-Gm-Message-State: AC+VfDyOUTEnhuwvyAwtFURjEilFmSaRh9IlbRj9Su/cG+Bssf8+NqpC
        8bawVJkBfEsJasCYFnyfjYl38Q==
X-Google-Smtp-Source: ACHHUZ6/py/DK99QfyP54m1+xWT2yTOI77wGCJA7udeTtjICND/fJZsxj4XWok3Kr4uiaXYP0dhCeA==
X-Received: by 2002:aa7:8892:0:b0:657:e9ae:e022 with SMTP id z18-20020aa78892000000b00657e9aee022mr3031205pfe.5.1686764938500;
        Wed, 14 Jun 2023 10:48:58 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t14-20020a63444e000000b00528da88275bsm11301568pgk.47.2023.06.14.10.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 10:48:57 -0700 (PDT)
Date:   Wed, 14 Jun 2023 10:48:57 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Azeem Shaikh <azeemshaikh38@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-hardening@vger.kernel.org, Hongren Zheng <i@zenithal.me>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usbip: usbip_host: Replace strlcpy with strscpy
Message-ID: <202306141048.27FC4B7F3D@keescook>
References: <20230614141026.2113749-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614141026.2113749-1-azeemshaikh38@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 14, 2023 at 02:10:26PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> 
> Direct replacement is safe here since return value of -errno
> is used to check for truncation instead of sizeof(dest).
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
