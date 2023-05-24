Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0209670FE81
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 21:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjEXTYD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 15:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjEXTYC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 15:24:02 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2D8A4
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 12:24:00 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7748ca56133so6372739f.0
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684956240; x=1687548240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1EuGK2wj0nfYl9JFXwkFb231iqL2hB/JWylqcNoYsGM=;
        b=gGrWhGI1hhJ5wCt1XO4BvoAIx5DvMnKjL8wm/iAWGln1Em7+zN3nFqHfl3+/dF4s8a
         EN6HaCJoxSitJBCf4MsI5iPJxFpxEs8bPv/f6bUYJ/+rCBkwlyg2KRK1NeyAqUThQJY8
         hZX9LqWsJ3pWtyrpPUMZm9Z+C+p0mt7wKvzDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684956240; x=1687548240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1EuGK2wj0nfYl9JFXwkFb231iqL2hB/JWylqcNoYsGM=;
        b=hziLa4H+o73f+6Tg641hBCVW6OXiOagFeHoQbTAHA0WAqHkqK+jZIwHFRRJBi8K2Dv
         zNPk2fYf/O9g2jAK3pJE3z8nnPlF9z7Ys65RpKqi2LT7Ct/mlLtdMqjTYC4rMA3F2mur
         hpkieSoscnK0XcIEpl7xd2xG1V4oSHOqzsYIsxH8eSVfGAUT1R84K57ewTMer7P6H7aS
         E8vMsXh9acKvdu3bM0Xf30G5CdYMB6bD102Qi1fH7rCP8HIEBXh35iFJtlFtl81eU6pY
         MzmB4laZCmP9caylEj28IsQ9pPJeU0LSmSnO1Ub6FWa9ZfQ4ykOUpGVie35xlqhSz8O8
         KkAg==
X-Gm-Message-State: AC+VfDye7X+uSp0o3Uw9zBuOouA2KK3AR68+wQZ1y4+ClI0/BL93Upx9
        QFzRVvNw/QGHbGvR1QUIWSZrTA==
X-Google-Smtp-Source: ACHHUZ5xkCfNh5peiQSqkO9jk8dLN1bjBsJPtf4uwjI3rbXQJC/z6eWUS8FESjevIHqZPPOQ6/YbkQ==
X-Received: by 2002:a05:6e02:482:b0:32a:eacb:c5d4 with SMTP id b2-20020a056e02048200b0032aeacbc5d4mr9081629ils.0.1684956240322;
        Wed, 24 May 2023 12:24:00 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x24-20020a029718000000b0040f8b6933f0sm3261660jai.74.2023.05.24.12.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:23:59 -0700 (PDT)
Message-ID: <e4bf6e65-c4d4-30a9-08f1-207689266842@linuxfoundation.org>
Date:   Wed, 24 May 2023 13:23:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] usbip: give a more helpful error message if vhdi_hcd
 isn't loaded
Content-Language: en-US
To:     Hongren Zheng <i@zenithal.me>, Galen Guyer <galen@galenguyer.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230508212120.435329-1-galen@galenguyer.com>
 <ZFmtO64UqItxjsSz@Sun> <ZFmv033l5ahyrlVc@Sun>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZFmv033l5ahyrlVc@Sun>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/8/23 20:28, Hongren Zheng wrote:
> On Tue, May 09, 2023 at 10:17:31AM +0800, Hongren Zheng wrote:
>> On Mon, May 08, 2023 at 05:21:20PM -0400, Galen Guyer wrote:
>>> Suggest loading vhdi_hcd if it's not loaded to make error message less opaque
>>>
>>> Signed-off-by: Galen Guyer <galen@galenguyer.com>
>>
>> Reviewed-By: Hongren Zheng <i@zenithal.me>
>>

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

