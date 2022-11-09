Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B6F6222F2
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 05:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiKIEKg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Nov 2022 23:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiKIEKd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Nov 2022 23:10:33 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39AEC1E70F
        for <linux-usb@vger.kernel.org>; Tue,  8 Nov 2022 20:10:28 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id j12so15982274plj.5
        for <linux-usb@vger.kernel.org>; Tue, 08 Nov 2022 20:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dA73fzuo5KEnlSVD69RAWkU6tsYtkmweuvX+w6+bAyQ=;
        b=Xx6LHcZBZ8+3nWwZTCC/J17FqOQps53x11+zYgvm2G/4WflsfRy7AE1MtPxEu2zAUc
         bJLUkEMQxbANpABBabxuuxFXzb1ZMpuP/2e69La5oa2WFS6610hXw8Ns9FwuWVcGTWoo
         QFMCpQXOcZXSb76CHDu0JeL19WH956qWISvdOM2kR40YoS9nqyR1srNb4QBvq15GlG5b
         0tty32YhsnWiiDOPkNV1HERsqmODgFx5t35bjj7ljldUWF2oF+VgFqJj57EtIIAfm9sz
         Q4ovPfKhVQDenwIhz8QUUj8eUhuJms8qUf/aLhoYD3nGHYjt8I3p13QtSqkks3JVCpMk
         /nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dA73fzuo5KEnlSVD69RAWkU6tsYtkmweuvX+w6+bAyQ=;
        b=sozuGxD1Ms8SSQXU1UugLcrmtadWbK8m9PG+Dj7ZURpKbnP64VQSV3ODdrOcjcssF0
         fPjNEnx/ChSLV4Sy0nPtRxDBIEbg5K//V/cHBW1xobiarVEHwOTrwGifNRJ6SLzwtXr2
         oz/S4t3O1KXczMJGdmzvpj5B9WlH/K3pH7gX7JeHmEz4WFBP2B3RTbd02rGtzNGsm7Z1
         UMogSikI0WqOM0l38SQDWZ5o7TRCUVXQBOsEjat7MpYJSM3GSEobFK6EZyUG/bLDMtrI
         +PU1FTSpp6jQJWzPXdJjy2t1l1118RO/qV7e4bO9kh93EldSnGK/AztNGaBX1RwDy4zi
         ZLHA==
X-Gm-Message-State: ACrzQf0VK7MRSrKF12heneqVVr2oJh8mlvccONxs5wjMH6745qVX8Vb3
        NKE5w8kgzcNas22I1YvXcNU=
X-Google-Smtp-Source: AMsMyM48t9rpWgfdIYg9Owxl2miNvd7QmVJ+OmhW0oaeg7xprdTOyGnlNiZn+EmLgRVZDPoDrkCYaQ==
X-Received: by 2002:a17:90a:e7c5:b0:213:b7d8:1c4c with SMTP id kb5-20020a17090ae7c500b00213b7d81c4cmr58172993pjb.114.1667967027705;
        Tue, 08 Nov 2022 20:10:27 -0800 (PST)
Received: from [192.168.1.5] ([159.192.229.229])
        by smtp.googlemail.com with ESMTPSA id ne9-20020a17090b374900b00213a9e1ec44sm98531pjb.52.2022.11.08.20.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 20:10:26 -0800 (PST)
Message-ID: <b46b555e-58b6-907d-b415-0bda016b5764@gmail.com>
Date:   Wed, 9 Nov 2022 11:10:22 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/3] USB: serial: option: add u-blox LARA-L6 modem
To:     Davide Tronchin <davide.tronchin.94@gmail.com>, johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net, cesare.marzano@gmail.com
References: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
 <20221108163001.18454-1-davide.tronchin.94@gmail.com>
 <20221108163001.18454-3-davide.tronchin.94@gmail.com>
Content-Language: en-US
From:   Lars Melin <larsm17@gmail.com>
In-Reply-To: <20221108163001.18454-3-davide.tronchin.94@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/8/2022 23:30, Davide Tronchin wrote:

> +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6),
> +	  .driver_info = RSVD(4) },

Why do you blacklist interface 4 in the configuration that according to 
your list doesn't even have an interface 4 ?


/Lars

