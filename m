Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9C36222F3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 05:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiKIEP3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Nov 2022 23:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiKIEPZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Nov 2022 23:15:25 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAB01D65D
        for <linux-usb@vger.kernel.org>; Tue,  8 Nov 2022 20:15:23 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id p12so10494876plq.4
        for <linux-usb@vger.kernel.org>; Tue, 08 Nov 2022 20:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXW3usUXlEGiBChq6Q3HSBenEZb7gzkGO9BJIsYTd2E=;
        b=OFQZZKXkYnsfiAsmrcFC7THBL+QoAaysa9nuJa3ZIpWLGYhc0F/FWU3kZor6Petu0z
         qWQYLlWhwvzJHfwS/iYEK9EOTfXzg+25u89bXOhi6KyLCx2DO5X1fUJqm/Z/VAom2EE+
         RF7tmEbW5imXDweeGqPQPWLNeQqEU+CrWBYj9P1oY/UqbmsQNsAlWfj55U2PGTAhMZAg
         5QyBVqs2HE2izReqzydsSCMDc9VPWRTuO2UVRwGEZd40PSAgHk/3i6ckmHjqs8/gbnp/
         6PSolOcVuGec2EGNTxyHxNrWysv2GVBndPKnLQb4I+ZkyaV1oM1JaSeu8z4E7KcllYIX
         yOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXW3usUXlEGiBChq6Q3HSBenEZb7gzkGO9BJIsYTd2E=;
        b=iIjmZCbqhBx2MpGIHlKGN3z+ymMra2XJ7D9Ja+C48rM7gvn4B8UnHHEKwK+jMdXQFl
         Hy+UVQ+uHImFNLTCh+A7AiW0RU0QqzW40EpHcPS/qD39DRq9th8qr5syC0colr0761v2
         /wo54Ek6T9UkycNvn84LZAWxeY8Eo6pzLaXI8ByARH7CRT0/t3Jji0CRyrY3b/ymtmDH
         2oqm1lBFP8u8P7ID+1GqmozN1UOYNdXiyRSItoZ2lbJ7htyXUnAmGypow77OmNEPXa8a
         aIPryu362Jd9Aun2WwXafXF0JmREyucY6OEJHT9RCsRyDD+/CTGEO7GimhcRmSC8MdwU
         osrw==
X-Gm-Message-State: ACrzQf0GYTi6gb91W29G3up5jtA3kUI64OUFdiJXwUPIE77ohN9wTaEH
        LPGmFd6FzrxuAVR/u1b3KVw=
X-Google-Smtp-Source: AMsMyM7j2O+4PpEgTDjz1CRXGBrkZvJ5Ikbx9hNvxMtq5mIbur9YOeOMnuIHE+6R1hOUezg4HgDaHg==
X-Received: by 2002:a17:903:22cb:b0:186:a8ae:d107 with SMTP id y11-20020a17090322cb00b00186a8aed107mr43153153plg.119.1667967322895;
        Tue, 08 Nov 2022 20:15:22 -0800 (PST)
Received: from [192.168.1.5] ([159.192.229.229])
        by smtp.googlemail.com with ESMTPSA id n126-20020a622784000000b0056b4c5dde61sm7379812pfn.98.2022.11.08.20.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 20:15:22 -0800 (PST)
Message-ID: <9bc73916-9a9f-a78a-df64-ba408bdc0ac9@gmail.com>
Date:   Wed, 9 Nov 2022 11:15:19 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/3] USB: serial: option: remove old LARA-R6 PID
Content-Language: en-US
To:     Davide Tronchin <davide.tronchin.94@gmail.com>, johan@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net, cesare.marzano@gmail.com
References: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
 <20221108163001.18454-1-davide.tronchin.94@gmail.com>
From:   Lars Melin <larsm17@gmail.com>
In-Reply-To: <20221108163001.18454-1-davide.tronchin.94@gmail.com>
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

On 11/8/2022 23:29, Davide Tronchin wrote:
> The LARA-R6 module old PID (defined as: UBLOX_PRODUCT_R6XX
> 0x90fa) has been removed since is no longer used by the
> current u-blox LARA-R6 product.

Was it never sold into the market?
No current user of it which with this patch would be without driver 
support for it?


/Lars

