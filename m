Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32535FF232
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 18:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiJNQWO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 12:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbiJNQWN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 12:22:13 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688F71D299F
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 09:22:12 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id p16so4279665iod.6
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 09:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQXWoKpRmTOgqqGrbzG/1Mzsebe1fiO8UA8Yjh42UqY=;
        b=N2niElHU2mySrSo2SQ7DYpy3Govx2BMLSUpvxKimhBOj13Zgmd0UHNUZr1XJBzbUDh
         AvgpSWaLp/p7QMAu6bWzoSiIybK5AuB70g4OMn2fU8NY8M6lvRy3kOALGSS9MlkEOu4c
         KhL1dkan+hyRLL6JFsB2WsJ3WJbTsn/dKYRPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQXWoKpRmTOgqqGrbzG/1Mzsebe1fiO8UA8Yjh42UqY=;
        b=W/6VR7BEwLqNpgTywkGbbACnLMy6k1wzQa7pf2unReM4tYqTBUG9ikIcqGU9phw0mU
         lsJBT4mbLtGaUkFPByeg5CMQXLAnuyKQr9bVorNQoK2mpd5uiyJy0DdRicjbPk5RX0j3
         oTO5XamOA73YxlKDJYED7/JldelTjCXyd2Y/o82Lye+CzGY+eq/ufOFcEZ+XkTBSImTo
         59IaoagyK2Rr6VhKJai2E5+s23LPp1o1JRof9r9kSznd8nTaDUY+qIFF46VceLkr6bxm
         x0bKxY2YPlpqQseuBU+DkRYiu4o1LobrdYD53gVtCbcpSIxRpv0bi42zinYSrsldOv3p
         h7pQ==
X-Gm-Message-State: ACrzQf06rI/ACH74i6LwmM+uf+PyPr5MqcoPHeQktJRsOmEaiX7plyjy
        3IdEP+fhgaA6Kbl5lpr/27iVLQ==
X-Google-Smtp-Source: AMsMyM5jZZRrhNJ2UVldBVfhy7C4DuqwBvrNXBlnkGuPxQup4pIQyE18Bnf9fb2iQMypqnZqvgi2ew==
X-Received: by 2002:a05:6638:2410:b0:363:ffb3:fc08 with SMTP id z16-20020a056638241000b00363ffb3fc08mr2985525jat.50.1665764531813;
        Fri, 14 Oct 2022 09:22:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id o18-20020a92dad2000000b002e97becb248sm996780ilq.29.2022.10.14.09.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 09:22:11 -0700 (PDT)
Message-ID: <38bda8e2-0948-ed48-f2e2-670c15c38298@linuxfoundation.org>
Date:   Fri, 14 Oct 2022 10:22:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] usbip: convert sysfs snprintf to sysfs_emit
Content-Language: en-US
To:     Xuezhi Zhang <zhangxuezhi3@gmail.com>, valentina.manea.m@gmail.com,
        shuah@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20221014110606.599352-1-zhangxuezhi3@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20221014110606.599352-1-zhangxuezhi3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/14/22 05:06, Xuezhi Zhang wrote:
> From: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst
> and show() should only use sysfs_emit() or sysfs_emit_at()
> when formatting the value to be returned to user space.
> 
> Signed-off-by: Xuezhi Zhang <zhangxuezhi1@coolpad.com>
> ---

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this up.

thanks,
-- Shuah
