Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D400070FE7A
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 21:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235667AbjEXTWg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 15:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbjEXTWe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 15:22:34 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC2D12F
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 12:22:32 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-760dff4b701so10424239f.0
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684956152; x=1687548152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nzSqRithcVJSEIIF4wkFMi/pyzN6B3NO2/5rIhCU4EE=;
        b=dIe6i6kAPJ6Qo4C3yDPFRKov0TLpzxQ21sIvchSBnT8P7ag8yj0zh+GqteaHfGElBQ
         w3mDmUVEynp2Mo6kKGckHjnSW/Ue8reooO25q/oh2h2CfbXoxz2ib9pKspiFwmXE8otw
         TwHu9H4hez70Snj/ZjtAZuKkydOt8ee4CN+SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684956152; x=1687548152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzSqRithcVJSEIIF4wkFMi/pyzN6B3NO2/5rIhCU4EE=;
        b=cc3Esob/E9YPHacO2VOnivLnVHmxFrijheufzrFkjOZaNSQ2cTQb+HRvxWUncb/vBS
         UqcR6EKGHbyO++EPwFIjBBD46fsvS2VLATliG6u38VMLgSP0fps3kj8aOalFDuoPcaTV
         VysfWwv1ti53yh1N2sNt6X00L5iONyXFDjFN6CdpLyheSqCyvNg4ZopgvHYgSCH3zlJo
         uEH1LWdTl9LfdkSKrUABZewTBYXz13P57JCROFtbdPJo6ET6QyxaZMslsgv0N3kDsSHb
         Eia9O/wVoWhrZnS2jZ2KIh0fY5n6RiQ0yTu5s1xJq7sPlUBVoBPVvhvJyUJj9EzP+uPp
         J1FA==
X-Gm-Message-State: AC+VfDwwQk9glcbocW71xOJ87bLt9kMTK8VA94frMT1XUq08wn+VJbEj
        AsndvOsaDy7H+CttzL1vpy7mBUae0Ha/XR6yXhg=
X-Google-Smtp-Source: ACHHUZ409Nzg7vxKlMBpUGCxITyf6iMa6U06QpDvNebhfhN5ozMerlUhqz35xPJGg7puzuoaaiYf7Q==
X-Received: by 2002:a6b:14cf:0:b0:774:9337:2d4c with SMTP id 198-20020a6b14cf000000b0077493372d4cmr1594405iou.1.1684956151980;
        Wed, 24 May 2023 12:22:31 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id z21-20020a6be215000000b00774efe6fa24sm25647ioc.10.2023.05.24.12.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:22:31 -0700 (PDT)
Message-ID: <68a74574-142c-6aff-50eb-2edf67139b21@linuxfoundation.org>
Date:   Wed, 24 May 2023 13:22:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 97/97] usbip: vhci_hcd: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de, Shuah Khan <skhan@linuxfoundation.org>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-98-u.kleine-koenig@pengutronix.de>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230517230239.187727-98-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/17/23 17:02, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

