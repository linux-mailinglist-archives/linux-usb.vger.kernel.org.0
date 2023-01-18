Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C94A6724B2
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 18:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjARRTH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 12:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjARRS5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 12:18:57 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ADB589A6
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 09:18:55 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id f8so11269484ilj.5
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 09:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kUweEJsz1I+VstJe9YX0p17oDZgJR4Ui31/RYAe6tw=;
        b=FmE67VsAO0nj0Y4Qun6+he/g7nukglQR4r0mw+iUu2AfdP7RFN1Ut6i2nObVZJHCw+
         +DWRgzY9EgGEGKlXdejzp4ViO8lK/92r6ZSIpio58q5PfPfcGN75NBt5QP5OfniCWW3C
         uo+Yxz3hnS+frF2Ota62uYi+xnd9FpkdoPsDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kUweEJsz1I+VstJe9YX0p17oDZgJR4Ui31/RYAe6tw=;
        b=TjGaCeo70VA8DPxKeDNGkMQ1S7GjPI4k5nPh7TH26n7M6BKMGHQeqQmaAzmU9FqiDV
         uOiIG1TDTGlgSqt/cHDp1UH/2clSxwVh6rXryJvCsS6LY87XwzAAwVnexvI3l6uT/HIu
         S40Z+anPHgLScVUyF4pAPlvRuvgirHLHMslJvgSF1/291Vy3a7Jv+wdaHsoIt920EJ85
         dC9GP0mg2cZKnbzIHKXBjrVL5rfcElLM6wOlapr+RY4gDSY5e01Ddg7VR3JNkkMiZNIR
         ElB9X8wfKhpyKSBP32+Qig1IycFmtUEYxiFy/GV2O3zV0dNOSSt8iTYHDLu5HFdvQ8dW
         T3WQ==
X-Gm-Message-State: AFqh2kr21jQwlqkLuckh2ncUN+lEfwVMeRqYeXrIxMOFwx3Mh5eS38gy
        oXQFCanFmvyGOc5Fd8p+/Y/HGw==
X-Google-Smtp-Source: AMrXdXsHSHwWMRi7BEYSROOq8YpKIH8Ioxk083DipSTSjeRYtjmqTkFnhcMejKTCDWCDR0eCkrlO0g==
X-Received: by 2002:a05:6e02:de6:b0:30e:f36a:f24e with SMTP id m6-20020a056e020de600b0030ef36af24emr5125952ilj.11.1674062334964;
        Wed, 18 Jan 2023 09:18:54 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id m3-20020a923f03000000b00300b9b7d594sm10059003ila.20.2023.01.18.09.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 09:18:54 -0800 (PST)
Date:   Wed, 18 Jan 2023 17:18:53 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-amlogic@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] usb: misc: onboard_usb_hub: add Genesys Logic
 GL852G hub support
Message-ID: <Y8gp/Q9kpFLjQSiv@google.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-5-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230118044418.875-5-linux.amoon@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 18, 2023 at 04:44:12AM +0000, Anand Moon wrote:
> Genesys Logic GL852G is a 4-port USB 2.0 STT hub that has a reset pin to
> toggle and a 5.0V core supply exported though an integrated LDO is
> available for powering it.
> 
> Add the support for this hub, for controlling the reset pin and the core
> power supply.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
