Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A29C6A567B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 11:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjB1KQi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 05:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjB1KQh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 05:16:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FDD15CBE
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677579350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GF6ACDOapKnoQkfxPGA0A98hiGijIqde5MqUuQTyaQs=;
        b=d0EHflsFJK1s8vfYgOc3IOSdB+7CX+PcqzSUD6JjsN4xnBMWWzQ3ocLikxEfH0m3/Z1niD
        VR6vh+/kyTQLqVhNKkHgQYmOcQBbhU3T9x6NwwSpUIvcN9CvpmuOhja7aSPPEE96mvmS6/
        t8BHgSvFxxFLU6WTUs8bvTeBlu/Zz54=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-FZyFZkF1MVyOD7G63k-uMQ-1; Tue, 28 Feb 2023 05:15:48 -0500
X-MC-Unique: FZyFZkF1MVyOD7G63k-uMQ-1
Received: by mail-ed1-f72.google.com with SMTP id cy28-20020a0564021c9c00b004acc6cf6322so13001792edb.18
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 02:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GF6ACDOapKnoQkfxPGA0A98hiGijIqde5MqUuQTyaQs=;
        b=rVQe9KHYNR2pLYNXK+8LAmBv0JrAhnP96mPrdai8idQG/ejeMRQp8hRio75TZNygzt
         TaHoRgJqoHMf1qK5H1/WpUbhKS0hCVIKXQvsIzQxFD5Ax05D91gT+DnTFttxJDHTQaM0
         f9IMggdccvEseHLdovFZI59OGpj2KhuDevi1ng99urs+P1gTiA/2Lq5yB/zUrm9S8qZQ
         cO2brlbxHQtlrAUy8QXzxWZVJBLGMEFXl2ZBstyKqkfbOsLbEqcvbb5rTuCfK6dFwGYD
         HtleU37R8hpWEw0iEz1YMw7+XrYlyBkDcG63pFgiMm3mGW8egrK7dRmzKLxyG+7rFIfm
         33tA==
X-Gm-Message-State: AO0yUKWmm2x5v7jLkcZ5/h2PA3TjObeKB4LBVEgSLpdWCyEP8lyYV02V
        erlNZOxuDC0YkzxxZyIipUjDlOiev5G60clfqKdpR6c6F1Px2DTcjM0yukstyzoq0F7RR+ChYY2
        6FxGb6cQBbEowYzcTcoEq
X-Received: by 2002:a17:906:82d0:b0:8b1:238b:80ac with SMTP id a16-20020a17090682d000b008b1238b80acmr1437671ejy.67.1677579347615;
        Tue, 28 Feb 2023 02:15:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+dj+DZ2ERaJp/D6mM1QpmGN1M1zcWC1CY+3ps2vSNZgsdR2smOr2Osh6T90txbCjKx1NUNXA==
X-Received: by 2002:a17:906:82d0:b0:8b1:238b:80ac with SMTP id a16-20020a17090682d000b008b1238b80acmr1437655ejy.67.1677579347303;
        Tue, 28 Feb 2023 02:15:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i16-20020a17090685d000b008b7a9ff7dfdsm4228731ejy.162.2023.02.28.02.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:15:46 -0800 (PST)
Message-ID: <800fcc20-8009-529f-fc09-c1394cd397fb@redhat.com>
Date:   Tue, 28 Feb 2023 11:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] usb: ucsi: Fix NULL pointer deref in
 ucsi_connector_change()
Content-Language: en-US, nl
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, stable@vger.kernel.org
References: <20230228090305.9335-1-hdegoede@redhat.com>
 <Y/3R68g6qKsqqLdL@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/3R68g6qKsqqLdL@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 2/28/23 11:05, Heikki Krogerus wrote:
> On Tue, Feb 28, 2023 at 10:03:03AM +0100, Hans de Goede wrote:
>> When ucsi_init() fails, ucsi->connector is NULL, yet in case of
>> ucsi_acpi we may still get events which cause the ucs_acpi code to call
>> ucsi_connector_change(), which then derefs the NULL ucsi->connector
>> pointer.
>>
>> Fix this by adding a check for ucsi->connector being NULL, as is
>> already done in ucsi_resume() for similar reasons.
>>
>> Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/usb/typec/ucsi/ucsi.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
>> index 1cf8947c6d66..e762897cb25a 100644
>> --- a/drivers/usb/typec/ucsi/ucsi.c
>> +++ b/drivers/usb/typec/ucsi/ucsi.c
>> @@ -842,7 +842,13 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>>   */
>>  void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>>  {
>> -	struct ucsi_connector *con = &ucsi->connector[num - 1];
>> +	struct ucsi_connector *con;
>> +
>> +	/* Check for ucsi_init() failure */
>> +	if (!ucsi->connector)
>> +		return;
>> +
>> +	con = &ucsi->connector[num - 1];
>>  
>>  	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
>>  		dev_dbg(ucsi->dev, "Bogus connector change event\n");
> 
> I think we should try to rely on that ucsi->ntfy. Would this work:
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index fe1963e328378..0da1e9c66971a 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -928,15 +928,13 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>   */
>  void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>  {
> -       struct ucsi_connector *con = &ucsi->connector[num - 1];
> -
>         if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
>                 dev_dbg(ucsi->dev, "Bogus connector change event\n");
>                 return;
>         }
>  
>         if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
> -               schedule_work(&con->work);
> +               schedule_work(&ucsi->connector[num - 1].work);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_connector_change);
>  

This hunk is not necessary, the con pointer pointing to lala land is
not an issue as long as we don't deref it. The &ucsi->connector[num - 1];
does not deref ucsi->connector it it simply adds an offset to it and
stores that in con (the backtrace I got pointed to the schedule_work call).

But I guess your way does make it more obvious that we don't
deref ucsi->connector.

> @@ -1404,6 +1402,7 @@ static int ucsi_init(struct ucsi *ucsi)
>         ucsi->connector = NULL;
>  
>  err_reset:
> +       ucsi->ntfy = 0;
>         memset(&ucsi->cap, 0, sizeof(ucsi->cap));
>         ucsi_reset_ppm(ucsi);
>  err:

In would expect this to fix things, but I only have access to the monitor
triggering this on Mondays, so I can only 100% confirm next Monday.

Note this does open the race I try to fix in patch 2/3 again.

So what should be done here is to make ntfy a local variable and only
store it in ucsi->ntfy on success.

Regards,

Hans




