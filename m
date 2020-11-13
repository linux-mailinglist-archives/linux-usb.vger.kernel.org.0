Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E172B1EA1
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 16:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgKMP2Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 10:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgKMP2X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 10:28:23 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48635C0617A6
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 07:28:13 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 19so8477421wmf.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 07:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KLkUtI/SVQeUp7VwceuSHv8X/fMKWIt+TsBfNKporJc=;
        b=fosSqcUSzdsOp2joMf8sEToZTn4UmIkStglUd9ikWBDpIg5QUhei8a/eYaEYiFdEVV
         MAU4SqW2iUjEtVpbD3QiPxnWs+IrHWB4Ll7TlHCUJNZNU/l1VO7PrBCwRsGxusqJoGLT
         16S7eUJZuB3/OIYH1LoY6kpWME3HxxVeBl/KC2iLh2TDrqmB1VcJNnRQbUUQVQfZcWpe
         WZDke0mQLIaSTHc085ZsZ/KHIj5+KE4ywGZqNtaQGVikH8ujYOYh3R4q3QHEv5dEesFe
         ZLyJpYAr+TxVjW2qrd3cqipFjCCEMSwyWDpDADlH/T1SCTjzQhjy/Fp8g3Or87lOMvBz
         /92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KLkUtI/SVQeUp7VwceuSHv8X/fMKWIt+TsBfNKporJc=;
        b=EP0M6Y9RLIpv5HGpwQGOpWnLlqX0F72Ksxfg6EaGqhuCxg/UgzqXcpZLk4BzPF2jaH
         xsk1hZPNEHxGnqy/aeuPVhYLrRTRfc4tkBTBaa2TVzRJiVAiQpmgW7XAlG/xEeB/XlRT
         pRoFA8Cp9GJKXQgiez1jhds+fdbKaYevBwW+wTzSYDAFDpoFSoMY2wyNNDFBOflvkk+W
         Vq8dgZ478QmmvRQ70kKstZ4xPk+gGy46EVPuJhR5T8L8fzOynnadwW2CHHQqIa/3b0xq
         hAnC23h411eSw8cQC8Dq1F/dExJwC0SJwIGCEP9bodQ8A7oQ/1l1MGP6Z7IrRdIcmDar
         WDFw==
X-Gm-Message-State: AOAM532nIJF/g7h452fyNBr5U8y6jqGGn2LdLoI3Rej0J5ewvg1xDGxA
        K0t1Y4td7YumSXULtXBO2JrnJQ==
X-Google-Smtp-Source: ABdhPJz0NHXxKJ21M7mNWtBHglyXWW1yTkIPTpBbQc7ttvRnOC32dCp4adBlI41JNQkQYvGVmnKlrw==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr3186906wme.53.1605281287062;
        Fri, 13 Nov 2020 07:28:07 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:b0c9:356b:b197:e786? ([2001:861:3a84:7260:b0c9:356b:b197:e786])
        by smtp.gmail.com with ESMTPSA id s13sm11913471wrv.43.2020.11.13.07.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 07:28:06 -0800 (PST)
Subject: Re: [PATCH v2] reset: make shared pulsed reset controls
 re-triggerable
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-usb@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20201112230043.28987-1-aouledameur@baylibre.com>
 <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <95a40dd0-8762-5f80-f692-a2c1f22cad52@baylibre.com>
Date:   Fri, 13 Nov 2020 16:28:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/11/2020 16:04, Philipp Zabel wrote:

> On Fri, 2020-11-13 at 00:00 +0100, Amjad Ouled-Ameur wrote:
>> The current reset framework API does not allow to release what is done by
>> reset_control_reset(), IOW decrement triggered_count. Add the new
>> reset_control_rearm() call to do so.
>>
>> When reset_control_reset() has been called once, the counter
>> triggered_count, in the reset framework, is incremented i.e the resource
>> under the reset is in-use and the reset should not be done again.
>> reset_control_rearm() would be the way to state that the resource is
>> no longer used and, that from the caller's perspective, the reset can be
>> fired again if necessary.
>>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> Change since v1: [0]
>> * Renamed the new call from reset_control_(array_)resettable to
>> reset_control_(array_)rearm
>> * Open-coded reset_control_array_rearm to check for errors before
>> decrementing triggered_count because we cannot roll back in case an
>> error occurs while decrementing one of the rstc.
>> * Reworded the new call's description.
> Thank you, applied to reset/next.
>
> regards
> Philipp

Thank you for reviewing and approving my patch !

Furthermore, I think your idea of open coding reset_control_array_rearm
was accurate, and should be also applied to reset_control_array_reset()
and reset_control_array_(de)assert()

What do you think ?

In case you agree it is necessary to do so, I can work out an upcoming
patchset to fix this matter.

Best,
Amjad

