Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AC679AF40
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 01:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350608AbjIKVjl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237617AbjIKNBa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 09:01:30 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8F6CD
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 06:01:25 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-34deefc2016so13541725ab.2
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 06:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694437285; x=1695042085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vpNZPcx3bjDHiQSM0MkVh372Rmrhu59xNLcZbNnj7uQ=;
        b=QHjDrnYQIX+ME6Itr80hHF04z0PPVnDlAwWiqaBcJW4rkmPC5Nqff1WBvL0visCW63
         zS4rfNYDqAMDZeerkXtgRrP0o3EnbLwci98aeZK77be8BYCODkh5pRmmdMMIa9cASVEM
         CWbme7xi52oW2A0CTwY6vhPAX/s7wioXZTltY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694437285; x=1695042085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpNZPcx3bjDHiQSM0MkVh372Rmrhu59xNLcZbNnj7uQ=;
        b=GSjWTCJyxqXc5KbXme2ENk7/OF6XX2ylJH8TNUnpPMJ1ynT+KDm/77wFQT7EedfG8j
         ukA340CK5gt+xpavDnFhBUFB0kUwOFJ3p+FUIc1ygFPyGjio+jNiYqoz8sbXmsg1ihGq
         mxEvbt4mlqeZUWDsepr/aGK2j3t+hFko3fofTZKcMWxn3zOQ5aX5Bl6GuKeHwGUEP0X9
         00r8ehPE/41y9TM3Qv5970cSaYGeYq9e+aaIqUuaigDm+IJk3ZDk6qjY8OkkymqottN9
         K7fRJqyFsLaTiW7HIT6ivQavjY6FYju4IE1E7Ylb2nL2cBC1ED5mOUY25R318BA4sKoP
         iGGg==
X-Gm-Message-State: AOJu0YyQxnud7suywjG6q14cNeQ5IK5l+4nXLr/uao5ERzFqqLG5GYFv
        PDdS731YDKi9MZu7MNt7ifHimg==
X-Google-Smtp-Source: AGHT+IFGzwi1w5oe71D2cbB1u9WZWLs+LMA8N7bKRNCnsIeRjk7c07VTBcGLxjPIPYMtujZqyupEsA==
X-Received: by 2002:a92:d34e:0:b0:348:e9e4:4902 with SMTP id a14-20020a92d34e000000b00348e9e44902mr10477274ilh.0.1694437284827;
        Mon, 11 Sep 2023 06:01:24 -0700 (PDT)
Received: from localhost (110.41.72.34.bc.googleusercontent.com. [34.72.41.110])
        by smtp.gmail.com with UTF8SMTPSA id a24-20020a02ac18000000b00430245071ddsm2153329jao.176.2023.09.11.06.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 06:01:23 -0700 (PDT)
Date:   Mon, 11 Sep 2023 13:01:21 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Javier Carrasco <javier.carrasco@wolfvision.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: onboard_hub: add support for Microchip
 USB2412 USB 2.0 hub
Message-ID: <ZP8PobwGAG+PlLQH@google.com>
References: <20230911-topic-2412_onboard_hub-v1-1-7704181ddfff@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911-topic-2412_onboard_hub-v1-1-7704181ddfff@wolfvision.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 11, 2023 at 10:22:38AM +0200, Javier Carrasco wrote:
> The USB2412 is a 2-Port USB 2.0 hub controller that provides a reset pin
> and a single 3v3 powre source, which makes it suitable to be controlled
> by the onboard_hub driver.
> 
> This hub has the same reset timings as USB2514/2517 and the same
> onboard hub specific-data can be reused for USB2412.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
