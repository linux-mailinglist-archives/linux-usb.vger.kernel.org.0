Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BD03F63AD
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 18:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234610AbhHXQ5p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 12:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbhHXQ5U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 12:57:20 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345E4C0612A7
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 09:56:30 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id x9-20020a056830278900b0051b8be1192fso27139545otu.7
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ME7V06Hs9N7FHh0eC+qDsWeeVxksOvtnIuQ7ALIDLg8=;
        b=YCGRJX+eH9eC7BEJUKSc305AH4tZ9pbMJXPDo2ffG50ILB4L0jDqDmN70Fv/bfP17T
         nBOsOUTDBmlwuVH7mhT4pNUDwFhmpPtnEG60o7zPNMGYMqggIF1GQHjCJGaSOMAoCgo3
         c5672oce8SueKFYUumQWTU6KaEi6e0I6jmv1C7vSBtWB/qyaW93wyIpDgz7JOdCMa6yT
         lVvUVFdWQ+0NQMkxv66Rz6pHx0KdFFBurm3gx5HkBHY+Q/eZZzED0SIH31ePiY7rGZK1
         CaCu+EaevZNhSK9zvXNwIi+9UnWyE1k2jxdKE7M+pAHgoLwLftfKpAgnHNqZxoGqW0Cm
         TifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ME7V06Hs9N7FHh0eC+qDsWeeVxksOvtnIuQ7ALIDLg8=;
        b=Ep1DnpMMPRWhelxmhKSmH8PTgSN+4o+5Z1myxpv0bXhtp/L1qxvVEqgbrGkk14CJfN
         GznTBkqxO2yijJrC710ePHvHXlJErimp+YOT6F7z3luGsXBn2LHIGER0FlB6PfOGh0dR
         P44WtFiiM4zXAgZiO5i1tDu672odRuLuE9g1EcUhLyw/VQoG+quDs/G8Vr+LTTYBHpyN
         rHkQcPYYQURZZc7IEf8WCRD4FK6ecRfJ0JuNYm7YUAEpSH49umD7VYPsD1o0YALNbfVR
         dSgc/xfIKnno7grih+JO0B47Ui2kxdTycR8cn6Q9tMYKolzUICblAL1KEhHXeXpRdcP1
         GLlw==
X-Gm-Message-State: AOAM533GcIJasltUG+NDX1QTGSgWtuanO2grTYgKfenNo+3jI4MIW8T6
        YeNCUFNg+NmQjEyv+0Xez6A=
X-Google-Smtp-Source: ABdhPJwZN+3ZtkwHVHppRBxWRUGyDSeorK/cwKUEw1y3FoVGsxSZH+iBMfaHfmiQsHUMoIzEna+sig==
X-Received: by 2002:a9d:4c9a:: with SMTP id m26mr33432820otf.99.1629824189630;
        Tue, 24 Aug 2021 09:56:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t1sm4145340ooa.42.2021.08.24.09.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 09:56:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     jun.li@nxp.com, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
References: <20210824113014.1420117-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] usb: typec: tcpm: Fix up tcpm set delayed state which
 may not delay
Message-ID: <3202088e-8705-7b85-509f-f71b9a4be986@roeck-us.net>
Date:   Tue, 24 Aug 2021 09:56:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824113014.1420117-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/24/21 4:30 AM, Xu Yang wrote:
> Setting a delayed state by tcpm_set_state may enter the delayed state
> instantly without delay for the specified time.
> 
> [   65.424458] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
> [   65.424475] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> [   65.427233] VBUS off
> [   65.427238] VBUS VSAFE0V
> [   65.427243] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
> [   65.427252] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> [   65.427258] cc:=2
> 
> In this log, tcpm should change to SNK_TRY state after 200 ms.
> The following sequence may trigger this abnormal result:
> 
>            [tcpm_pd_event_handler]      [tcpm_state_machine_work]
> 
> 1       tcpm_set_state(A, 0)
> 2           port->state = A
> 3           port->delayed_state = INVALID_STATE
> 4           queue work to worker_list
> 5       tcpm_set_state(B, ms)
> 6           port->delayed_state = B
> 7           start timer
> 8                                   dequeue work from worker_list
> 9                                   tcpm_state_machine_work
> 10                                  port->delayed_state != INVALID_STATE
> 11                                      port->state = B
> 12                                      port->delayed_state = INVALID_STATE
> 13                                  handle B state
> 
> In step 9, tcpm_state_machine_work gets scheduled because it has
> been queued in step 4. At this point, however, both port->state and
> port->delayed_state are non INVALID_STATE which causes the pending state
> to be handled in step 13 without delay.
> 
> If a non-delayed state and a delayed state are orderly set in some works
> except tcpm_state_machine_work, this bug will certainly occur. Also, if
> set in a thread different from tcpm worker thread, this bug may occur.
> 
> Therefore, when port->delayed_state is a valid state but the
> state_machine_timer is still running, tcpm_state_machine_work should
> keep the delayed state pending until the state_machine_timer timeout.
> 
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index c40e0513873d..4bdf119b1306 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4815,7 +4815,8 @@ static void tcpm_state_machine_work(struct kthread_work *work)
>   		goto done;
>   
>   	/* If we were queued due to a delayed state change, update it now */
> -	if (port->delayed_state) {
> +	if (port->delayed_state != INVALID_STATE &&
> +	    ktime_after(ktime_get(), port->delayed_runtime)) {
>   		tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
>   			 tcpm_states[port->state],
>   			 tcpm_states[port->delayed_state], port->delay_ms);
> 
Unless I am missing something, this doesn't really match what the description says.
It will ignore the pending state change and execute the state change to SRC_ATTACH_WAIT.
This will then likely call tcpm_set_state() again. In other words, the state change to A
is executed even though it was superseded with a state change to (B, ms). That doesn't
look correct to me.

I think the problem may be similar to the problem in patch 2: The worker is already
running by the time tcpm_set_state(B, ms) is called, because tcpm_set_state(A, 0)
triggered it. This means that "dequeue work from worker_list" already happened
before tcpm_set_state(B, ms) was called. The only difference to patch 2 is that the
multiple state changes are not triggered from tcpm_init() but by some external event
outside the state machine. We should try to find a solution which covers both
situations and makes sure that the worker only handles the most recent state change.

Thanks,
Guenter
