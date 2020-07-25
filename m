Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497E922D833
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 16:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgGYOqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 10:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgGYOqO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 10:46:14 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A59C08C5C0
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 07:46:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t6so6996201pgq.1
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RcS3uquj6ViV2NVaCWtpoVRE8DMO14CnB3EeNpV+KU8=;
        b=qXjSxPv7bVI/nmoepQK8FP1Skz91zaFt6/FfHzwDO0bdZsIIlY66EePWrwl9R3RZDC
         JcKlfE+msOi0jn09ILhn/00oSxujDXNOtRVcBQENGMU8H2t/xBRE7TZ47XRl5p8LZSxF
         aU/zatIa2gYPlgzFqiOkTiBaLKQueM6vysmJZmbCU9YDgR5AFHBoLnFItILIZ6oO69iJ
         I3Mf6fIt5k5nlmIwUpkA9Eguy+GSb3c9xYWIU5LqPtTvu2LigaTgYiQL6wxswDw8mPBF
         FYebkAWdV2ir3kOE3ozSsfAVmUagNXgE7gBhnhkdYCESO+54i5hJjK89ZoCbnQnkc7Eb
         XOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RcS3uquj6ViV2NVaCWtpoVRE8DMO14CnB3EeNpV+KU8=;
        b=Aux9x/G3vDX4p+qwDH54m5KvsulzUphLBP2edY8R4jjJ/STkP77b2ELT9XPFSjg96m
         GDjq7bzz6Bipkmr6PiLevs3ceDJI3UiTXtxUmKYZES/Jt82pW+f4yXzZrIT0yXFMlnLI
         IxcYSgHF7aqb8V0tPAq5MUszjhDsWAtup5POcXUsZCbhMhwItGJZj2jbAs4C5j4jw1r+
         93G+8mv7LrHkD3d3X5dehVcpN15C1x/YVXyY4zJGc+Vwdq/8b3k63Jp6abTzrER5w4wD
         rz4dY86UV6fvL7GFh+qBN9uHuofjl6otUF3MkkkDGnQmdrCTy5w23F8vK6whKPvmzksB
         FBdg==
X-Gm-Message-State: AOAM532hVzsxHNGopqK5Cnr0mxIr5gSNdSgdXPAMjCJ7LEin0/hmqdXy
        4SXH24hguRX14vhy5ku0MYkc3MEY
X-Google-Smtp-Source: ABdhPJwTjUdtypzmtBkeweK1rbbwGoJDLof2OdYyvoyiKX2dmhzQWLJPUcfW01mUTW8geDMfXjrYKA==
X-Received: by 2002:a63:6fcd:: with SMTP id k196mr13296927pgc.251.1595688372954;
        Sat, 25 Jul 2020 07:46:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q17sm11042027pfk.0.2020.07.25.07.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 07:46:12 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] usb: typec: tcpm: Fix AB BA lock inversion between
 tcpm code and the alt-mode drivers
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-5-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <f7652e94-641a-0f1e-3597-ed984a20f463@roeck-us.net>
Date:   Sat, 25 Jul 2020 07:46:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724174702.61754-5-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/24/20 10:47 AM, Hans de Goede wrote:
> When we receive a PD data packet which ends up being for the alt-mode
> driver we have the following lock order:
> 
> 1. tcpm_pd_rx_handler take the tcpm-port lock
> 2. We call into the alt-mode driver which takes the alt-mode's lock
> 
> And when the alt-mode driver initiates communication we have the following
> lock order:
> 
> 3. alt-mode driver takes the alt-mode's lock
> 4. alt-mode driver calls tcpm_altmode_enter which takes the tcpm-port lock
> 
> This is a classic AB BA lock inversion issue.
> 
> With the refactoring of tcpm_handle_vdm_request() done before this patch,
> we don't rely on, or need to make changes to the tcpm-port data by the
> time we make call 2. from above. All data to be passed to the alt-mode
> driver sits on our stack at this point, and thus does not need locking.
> 
> So after the refactoring we can simply fix this by releasing the
> tcpm-port lock before calling into the alt-mode driver.
> 
> This fixes the following lockdep warning:
> 
> [  191.454238] ======================================================
> [  191.454240] WARNING: possible circular locking dependency detected
> [  191.454244] 5.8.0-rc5+ #1 Not tainted
> [  191.454246] ------------------------------------------------------
> [  191.454248] kworker/u8:5/794 is trying to acquire lock:
> [  191.454251] ffff9bac8e30d4a8 (&dp->lock){+.+.}-{3:3}, at: dp_altmode_vdm+0x30/0xf0 [typec_displayport]
> [  191.454263]
>                but task is already holding lock:
> [  191.454264] ffff9bac9dc240a0 (&port->lock#2){+.+.}-{3:3}, at: tcpm_pd_rx_handler+0x43/0x12c0 [tcpm]
> [  191.454273]
>                which lock already depends on the new lock.
> 
> [  191.454275]
>                the existing dependency chain (in reverse order) is:
> [  191.454277]
>                -> #1 (&port->lock#2){+.+.}-{3:3}:
> [  191.454286]        __mutex_lock+0x7b/0x820
> [  191.454290]        tcpm_altmode_enter+0x23/0x90 [tcpm]
> [  191.454293]        dp_altmode_work+0xca/0xe0 [typec_displayport]
> [  191.454299]        process_one_work+0x23f/0x570
> [  191.454302]        worker_thread+0x55/0x3c0
> [  191.454305]        kthread+0x138/0x160
> [  191.454309]        ret_from_fork+0x22/0x30
> [  191.454311]
>                -> #0 (&dp->lock){+.+.}-{3:3}:
> [  191.454317]        __lock_acquire+0x1241/0x2090
> [  191.454320]        lock_acquire+0xa4/0x3d0
> [  191.454323]        __mutex_lock+0x7b/0x820
> [  191.454326]        dp_altmode_vdm+0x30/0xf0 [typec_displayport]
> [  191.454330]        tcpm_pd_rx_handler+0x11ae/0x12c0 [tcpm]
> [  191.454333]        process_one_work+0x23f/0x570
> [  191.454336]        worker_thread+0x55/0x3c0
> [  191.454338]        kthread+0x138/0x160
> [  191.454341]        ret_from_fork+0x22/0x30
> [  191.454343]
>                other info that might help us debug this:
> 
> [  191.454345]  Possible unsafe locking scenario:
> 
> [  191.454347]        CPU0                    CPU1
> [  191.454348]        ----                    ----
> [  191.454350]   lock(&port->lock#2);
> [  191.454353]                                lock(&dp->lock);
> [  191.454355]                                lock(&port->lock#2);
> [  191.454357]   lock(&dp->lock);
> [  191.454360]
>                 *** DEADLOCK ***
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> -Move the mutex_lock call to above the tcpm_queue_vdm() call, so that
>  we can use the regular tcpm_queue_vdm() instead of having to call
>  tcpm_queue_vdm_unlocked()
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 03a0c083ee9a..9b26b57a0172 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1249,6 +1249,27 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	if (PD_VDO_SVDM(p[0]))
>  		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
>  
> +	/*
> +	 * We are done with any state stored in the port struct now, except
> +	 * for any port struct changes done by the tcpm_queue_vdm() call
> +	 * below, which is a separate operation.
> +	 *
> +	 * So we can safely release the lock here; and we MUST release the
> +	 * lock here to avoid an AB BA lock inversion:
> +	 *
> +	 * If we keep the lock here then the lock ordering in this path is:
> +	 * 1. tcpm_pd_rx_handler take the tcpm port lock
> +	 * 2. One of the typec_altmode_* calls below takes the alt-mode's lock
> +	 *
> +	 * And we also have this ordering:
> +	 * 1. alt-mode driver takes the alt-mode's lock
> +	 * 2. alt-mode driver calls tcpm_altmode_enter which takes the
> +	 *    tcpm port lock
> +	 *
> +	 * Dropping our lock here avoids this.
> +	 */
> +	mutex_unlock(&port->lock);
> +
>  	if (adev) {
>  		switch (adev_action) {
>  		case ADEV_NONE:
> @@ -1273,6 +1294,15 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  		}
>  	}
>  
> +	/*
> +	 * We must re-take the lock here to balance the unlock in
> +	 * tcpm_pd_rx_handler, note that no changes, other then the
> +	 * tcpm_queue_vdm call, are made while the lock is held again.
> +	 * All that is done after the call is unwinding the call stack until
> +	 * we return to tcpm_pd_rx_handler and do the unlock there.
> +	 */
> +	mutex_lock(&port->lock);
> +
>  	if (rlen > 0)
>  		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
>  }
> 

