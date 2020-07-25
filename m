Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA6922D83C
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 16:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgGYOxL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 10:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYOxK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 10:53:10 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEEEC08C5C0
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 07:53:10 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f7so1112247pln.13
        for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2020 07:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NPJdQeVnrJl7d0GqLmA1MP8kZRW/daTYRrUTJwOPi10=;
        b=W3dN7dPZ1wuRCxipII9sNQ06JnDnd3hVI6CfOfYmYgwIq1eqJQ9A52kVDQzl29nGzY
         oKgdmPS7XlG2DZt4qTtE7gke3oD6l/XgzJNYmr1/oRa1tLP1HHiZqtlPgH9A+yYgZT9K
         6oHEQSfSE05Ho3WlSA5CIhqKDKcY3XIMlXayN6x6rbDUjWcVzbh9xQFxE8CqjUB6DNeT
         cSGMxmGdd+LG6cFa3vKJPPGyRgdC4kmwGAuDwv2LxeljJmVz45khifxIQ9KD8Ye4uDJK
         mtjGpXjiDj7KEJAqp8nvI9oyAOXIz3V40LoAlyEVczN+QWDqlfN8x4cIoDyMwRlFWZOh
         7y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NPJdQeVnrJl7d0GqLmA1MP8kZRW/daTYRrUTJwOPi10=;
        b=uHCa9J/QyaM0l8jhYHiEsoHyzrI6wNHUR7AC23PLAtM63VXz3nFgxi5T4Dkx8nnNZN
         DWVYtegLp7zDoYVsmJ99RYirvHYS2nOec0Is0lvvcHPV13KqRbxy/N5IaeWnolJ5ST+b
         7DIGA/fEe3MBK/pJ35mhPtlrhL90RAqB/twnN1MMredSEbpw1c8pnivDFmlZTl2Ysn8P
         6XP+Tg8vChDZCKAr99Q0Vr+c8bN+euh76SVm1rXqT9HRUrNrQQy7c/Bn0DJBdgmugD1H
         sHJft6orpUzcUJpF9nBJZmS+lPa42kYbCUPEG9MK5zLEvy/cft96SHhSO50TtwtF+GTU
         JNAA==
X-Gm-Message-State: AOAM530RXveqNr/Oyl1k57pwVxH7ebkJot93z9y4DzcozzEVNiHVWpH1
        0eSU7TxrXzK+KWCe8tU7ZeYRkhAv
X-Google-Smtp-Source: ABdhPJyowOWZ3PxY/6HXDd1a+LN3mzunRpb/WNvZiI7fXp2SyFOTBHBujoA7qhH4B7Aw1d/k0VkBzg==
X-Received: by 2002:a17:90b:2350:: with SMTP id ms16mr10625188pjb.127.1595688789814;
        Sat, 25 Jul 2020 07:53:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fy11sm2670001pjb.2.2020.07.25.07.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 07:53:09 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] usb: typec: tcpm: Add WARN_ON ensure we are not
 trying to send 2 VDM packets at the same time
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-6-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e813b66d-3c1c-0aab-5edc-56423472d00e@roeck-us.net>
Date:   Sat, 25 Jul 2020 07:53:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724174702.61754-6-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/24/20 10:47 AM, Hans de Goede wrote:
> The tcpm.c code for sending VDMs assumes that there will only be one VDM
> in flight at the time. The "queue" used by tcpm_queue_vdm is only 1 entry
> deep.
> 
> This assumes that the higher layers (tcpm state-machine and alt-mode
> drivers) ensure that queuing a new VDM before the old one has been
> completely send (or it timed out) add a WARN_ON to check for this.

Just in case you resend ... "has been sent" is grammatically correct.
The feedback on
	https://www.quora.com/What-is-the-difference-between-send-and-sent
explains it in detail.

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> ---
> Changes in v2:
> - Fix typo in commit-msg subject
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 9b26b57a0172..cc786d558f14 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -971,6 +971,9 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  {
>  	WARN_ON(!mutex_is_locked(&port->lock));
>  
> +	/* Make sure we are not still processing a previous VDM packet */
> +	WARN_ON(port->vdm_state > VDM_STATE_DONE);
> +
>  	port->vdo_count = cnt + 1;
>  	port->vdo_data[0] = header;
>  	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
> 

