Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F6D58407B
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 16:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiG1OBD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 10:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiG1OBC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 10:01:02 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35A265D9
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 07:00:58 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id o3so1883642ple.5
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fswC/i0v6E79SSY7fTiByjsbaX9Ll7VbjlECbWd+3d4=;
        b=PTwwTl1f8C6LBKPD2OVQnC1ltcPVxbJflifswKX4NDedJMbrAKp3z9oIGYZlR/hm7L
         s7l9qYWKQI15GOv34+PfuhDK9+fEa7meZpKFfEKy0evollwKQKXh4S0/XRZomUpWsuNk
         NnyB7Jic7VLnM8Jhtl6f/jDH78mv88fMCqrgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fswC/i0v6E79SSY7fTiByjsbaX9Ll7VbjlECbWd+3d4=;
        b=7S1XK4bfzZh57UQxXUnCZNO5kQmEzW681PfkWozCj2y+6pXozZHUZdYDw1TimFKKuj
         zGeu5LsbYLCs8qEdUqDtlLzc0z+cEa/ka+im+U3VYVu8RXgzs4tbnPqPzGUFetjE3ja2
         2CJcSKsXWppYDb2MnxNbH4Lxavh3mSfGOP5aPoaMUZq+f8c0KYWff5nu4U+dVfV93neX
         r1CAjX0vK0IeaNvQWtST+xB+508Eg//SsJfBjrdQPDmp4zq+Kms4fLMU/DbGdmImLvKD
         SgmzT8LBLXbmzfpHMAYkGYK7/+4Fw98n1OEs2zgG34lw1L1EoLoNy6uT9cwahNP1vusi
         oTNg==
X-Gm-Message-State: AJIora+jrCe5OHm0JGS6y91aTiSZWDLBbBwtnZw9HLMn2LHx23rJT+7J
        BVaLr0Fr1U3qqvBpF3xuSmv0tQ==
X-Google-Smtp-Source: AGRyM1vpz00cuZlEriin/SDtlUUaK/Y+CnMoB1L/umTjFpcH4S3lehwFyfZ7c4ameWpx+HLTq2c+oA==
X-Received: by 2002:a17:90a:4402:b0:1f2:3507:5f96 with SMTP id s2-20020a17090a440200b001f235075f96mr10200525pjg.22.1659016858427;
        Thu, 28 Jul 2022 07:00:58 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:bb10:e729:7f59:7cbc])
        by smtp.gmail.com with UTF8SMTPSA id z7-20020a17090abd8700b001f02a72f29csm1121556pjr.8.2022.07.28.07.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 07:00:58 -0700 (PDT)
Date:   Thu, 28 Jul 2022 07:00:56 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: misc: onboard_usb_hub: Remove duplicated
 power_on delay
Message-ID: <YuKWmORTe7mrCFNb@google.com>
References: <20220728064937.917935-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220728064937.917935-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 28, 2022 at 08:49:37AM +0200, Alexander Stein wrote:
> onboard_hub_power_on() already ensures the reset pulse width delay, so
> there is no need to wait right after requesting GPIO as well.
> 
> Fixes: 40758e493f4d ("usb: misc: onboard_usb_hub: Add reset-gpio support")

That shouldn't be needed, since it's not an actual bug.

Anyway, I see Greg already landed it.
