Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580E44BA1ED
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 14:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239496AbiBQNvs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 08:51:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237223AbiBQNvq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 08:51:46 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323411F5C90
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 05:51:30 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id d16so5077640pgd.9
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 05:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0kr8dYO1AqVlag5MK+6evkHEcy2nXbV4DT4/fu7hw/4=;
        b=Kvq39B+ccBdYlKyENKVpOGTfQdtUIKL0wWDVBtxZte/cDqwK7APs5Lv7sTnV8fdjX+
         gRF5r2r+Y7Z2plRlEswKV5BQiKH86VRIYAbeKZdbJLNhOVGUj6YAyGYEbusVVUJdACh0
         2NTAFU0+/M826p7vBSAbhHX4uelQHZcJEi7PgNhSXP023lx+v0ASXlbZ+4qmZFdYy+I+
         b4gxk/JefTLd9n4QHT5jnYwrNQEVgbzGZTqf0i2YJ2Ct1MYk46PPfti/joJ37SD9QuWX
         YUl1AnBN/QHEIwVsglqyMwVnNeu7g29ZqDeXcHfunSb3eftATJG7bnbpR9JTgy+gwW5X
         Tlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0kr8dYO1AqVlag5MK+6evkHEcy2nXbV4DT4/fu7hw/4=;
        b=sFbH7+4uOVrEeQp8Kyl0gAkvD13sNMOE2sBtfxbB5z+vQ+QzL2yBaavdXGtTXB0E2f
         Y1o71zaHoQbDtzFEY7VYqAvaY+CJGWUd4XP2LtT1ikb+DSwehfSv49dYDP2sfi8hTDUE
         G0l/fksmnkiAb6879S4jkvPTtOrY2mHaZ+CJKFI3u1Se91KnQKrqEQDHMkgepnPKoKWc
         8YyUXWhoWA+UUgHNEToQ023VHplzo5uLbE4L4yQ8nMQ+jRa6rM1rxfVIo6S87fvMSoiO
         zTJI5Xtx27C4TG6pZ217ax8TPN76jA1u5XnKecUFtGF/5Qss7eQ3sQpHVNMOUfdwYXG+
         O/gQ==
X-Gm-Message-State: AOAM530bYi8UuNnlkbExNZcWjX8IAGs/Boxwi0E2jMYJxeY9gkED/37C
        4h6hpstHMbR5XTTvtp26kjMXWQ==
X-Google-Smtp-Source: ABdhPJwj8dzIfXUejV9MkeZMkKqNO0xeuopTqfpsWZ77olKhau/mQvMiNf8OQxR0n7/T/B2Z1KUnLA==
X-Received: by 2002:a05:6a00:1ad3:b0:4e1:5623:fdd with SMTP id f19-20020a056a001ad300b004e156230fddmr3044509pfv.26.1645105889597;
        Thu, 17 Feb 2022 05:51:29 -0800 (PST)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id j7sm43990395pfa.36.2022.02.17.05.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 05:51:29 -0800 (PST)
Message-ID: <b6bf2ab5-031d-8be8-e9e7-ba04f39ef35e@kernel.dk>
Date:   Thu, 17 Feb 2022 06:51:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] tps6598x: clear int mask on probe failure
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
References: <e6b80669-20f3-06e7-9ed5-8951a9c6db6f@kernel.dk>
 <Yg4HwO2SKGDvOASz@kuha.fi.intel.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Yg4HwO2SKGDvOASz@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/17/22 1:30 AM, Heikki Krogerus wrote:
> On Tue, Feb 15, 2022 at 11:22:04AM -0700, Jens Axboe wrote:
>> The interrupt mask is enabled before any potential failure points in
>> the driver, which can leave a failure path where we exit with
>> interrupts enabled but the device not live. This causes an infinite
>> stream of interrupts on an Apple M1 Pro laptop on USB-C.
>>
>> Add a failure label that's used post enabling interrupts, where we
>> mask them again before returning an error.
>>
>> Suggested-by: Sven Peter <sven@svenpeter.dev>
>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> Should this be marked as a fix?

Maybe, I can try and dig out the offending commit. From some quick
checking, it didn't come in with recent fixes, so it's probably been
there since support got added. Maybe we just mark it stable?

> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks! Greg, will you pick this up?

-- 
Jens Axboe

