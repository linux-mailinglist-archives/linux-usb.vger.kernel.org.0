Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E5360AD34
	for <lists+linux-usb@lfdr.de>; Mon, 24 Oct 2022 16:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233979AbiJXOUD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Oct 2022 10:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235842AbiJXOTQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Oct 2022 10:19:16 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACDA951C1
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 05:57:14 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id hh9so5491032qtb.13
        for <linux-usb@vger.kernel.org>; Mon, 24 Oct 2022 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23G6IRAZxWb674PHa8tupeqN+hPj8IaS0EymERZ275g=;
        b=Dz6kdECH9awqquaIAb8L5ReL5RrQbVdYUBGUuO/TeGHjxqWMtVxvj7C8GR5UUKsn6Z
         cjjvRsFSmsIzb1jkhiGA2p+Q30gQWXZIESDqNs0pFdI9//+JRwAePkvD5b1jqy8aIY73
         0UKu86VLs2riLkNZrhjfail8f1UQBrFxvwmq4WCewK/5oiOqIR1u2h5qYgGQXC6wdH3h
         8eRXyvG7mquddRw8Lnt6RBJCbUnzKMcLk2Y97x102sZDMqYbcw2LeM7GMq2cDBWJx5rM
         fuxwPFdY3SpU/KPVoqgcwFFhsLmVroNx165Y5KOaWbbttwsS4Nu08boqN+jLsMkvV5g+
         hXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23G6IRAZxWb674PHa8tupeqN+hPj8IaS0EymERZ275g=;
        b=sMM8RZ4ec8FnTwUe/n/kkljdopBPCWQQ+kgNV2MvXwchPicDSfVNQJ13RuFA0o0fMc
         yIBcRf7jK/6Hg8QLKu1rL2yMf2soHBKOWyHkbN7vHvTDlqWgtHuUnxEppRwOEiTgXa3D
         VjefpvrZiMiYOssvZSt9pQtB0cx1UILgrgTxPbIrot38OvHZlfGO4hBeKVFcgNthAW+G
         Mp88cxjHwA1no95iF3v1IrEiUmPvWcWp9eoynf9NX8d6BT6irj27v0ZXaak81lfj9lq0
         dGWtg+2oz64ZKSBfQJTyDAiF/oYetz4Al/BIxfxqZ1xbkrJsS0YXm4NwGSDmB1JmdvlI
         et0w==
X-Gm-Message-State: ACrzQf2F3XMjitpvnC7wYpKyl+VBgiARkVcdxL7o3R2fEUNjDkjzE6w3
        mFCxgvArpiF0CED/BTvJg1dLebsHTeeGqQ==
X-Google-Smtp-Source: AMsMyM4TJpZ8bPgkeww9iiix6fKrutp9EVC5vYAocJxmQRCjgegrv44taFt4JuKpdamX58HtpJMu0Q==
X-Received: by 2002:a37:f701:0:b0:6ce:f09b:9065 with SMTP id q1-20020a37f701000000b006cef09b9065mr22669096qkj.268.1666615164084;
        Mon, 24 Oct 2022 05:39:24 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id cj24-20020a05622a259800b00399fe4aac3esm12847030qtb.50.2022.10.24.05.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:39:23 -0700 (PDT)
Message-ID: <622768f7-a98f-3228-8d17-4eff6cf2c772@linaro.org>
Date:   Mon, 24 Oct 2022 08:39:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 13/21] usb: gadget: remove s3c24xx drivers
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-13-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-13-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform is gone, so both the udc and hsudc drivers
> can be removed as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

