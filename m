Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF54E4D5FD8
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 11:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348054AbiCKKjD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 05:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346581AbiCKKjB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 05:39:01 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F682F3
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 02:37:44 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E5443F203
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646995063;
        bh=h9mhN1l0jEg81Bw1okmoM1euKZTWPDCOflq/7RGt514=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=riMPFMPTXKr6Znx9Oo+arl3YVQhSBrZo2EqNDdKShKzsBwvR0EASh9ts/nD7sroBP
         WGxLO6cFWaJR+NP/chXsDDarhtHO6ZOc9l85skiSroxxLnmpT/H5fIwXCABGGuCJjq
         JoM0nI/Tp5bAVSfZDSeMOhwKnyTezJU6Gmndsaw+YY00l4Jo+gYfnKgj6N0u9nhboO
         CoXKDpJ9XwpwPsfhQVAhO0AkhpQh+xjELENgEmeHKqjn46BJetKd2RkdpvkJVjNX9J
         3QAS8wfkZiWFEd80+AJsMaUKzK8Mjkufrh1FrAFybwsz+HwtbmjcX6NzAy95tcilon
         qMyCgCs+Ggj3g==
Received: by mail-ej1-f70.google.com with SMTP id ga31-20020a1709070c1f00b006cec400422fso4694333ejc.22
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 02:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h9mhN1l0jEg81Bw1okmoM1euKZTWPDCOflq/7RGt514=;
        b=E/ryHoKGgv+6fTKm0inUsz+rtY0tT7nr/3TwdAdL0ng0EOe/+rv1jhEOioYEG7Hm/d
         DEFZnjDB9u701f9jX/llpEETDq9B4nHzfu4Fp1l0JzvGb5xrXZY9bRg8CyMiLBjISoXY
         8vhyvHkP0CoqSqr2cd7htxkSAJh5c48dM2pChZA5PQiYLoOpIuRbjIoYhKiu9peQhDj+
         PFgvRnF2jlb5n3pLyh95dKI+3ZLlInVp3N/KORZwcg1SH01ktUHy0wVv1sNICT/f7Qv4
         MsnReEk6/yUX8Da2cX0LdRlV1DFVIjKpBRTSwr6hopQ9TSEhjGZa9JLXjr95iORgS8om
         zo8A==
X-Gm-Message-State: AOAM5307wqgxxan6qHxalMTXGpm1Se9OUjZ+dxyKXpVW3IFDRQ2R3PMX
        zwjLzQWSTvmE3EKyprM8X+50/5i4DIWh6DR/mii9B2cqMfaHJVHBHe/hT+mQqYsbOgThW+vsTx+
        tHthnkRC10XceaUX1irb44DoQxQDshTrWYMb8wA==
X-Received: by 2002:a17:907:3e98:b0:6d7:7c21:529f with SMTP id hs24-20020a1709073e9800b006d77c21529fmr8241312ejc.104.1646995062773;
        Fri, 11 Mar 2022 02:37:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySUrEllRvzUKMm8nuZ24/WPj5ahUOL3vYX386ifl7LfzzG3qWE67RngRL+w4jFgklVI7KbKQ==
X-Received: by 2002:a17:907:3e98:b0:6d7:7c21:529f with SMTP id hs24-20020a1709073e9800b006d77c21529fmr8241294ejc.104.1646995062569;
        Fri, 11 Mar 2022 02:37:42 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id p3-20020a1709060e8300b006d0e8ada804sm2742975ejf.127.2022.03.11.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 02:37:42 -0800 (PST)
Message-ID: <3a9258c3-0555-0de5-f8fb-06f542f55855@canonical.com>
Date:   Fri, 11 Mar 2022 11:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] usb: usb251xb: Set boost value for up- and downstream
 ports
Content-Language: en-US
To:     "Neumann, Bastian" <Bastian.Neumann@dentsplysirona.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <PH0PR17MB48487D4BC9BB0D3C38D8EED38E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
 <PH0PR17MB4848F60C6E91ECB7CDF308138E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <PH0PR17MB4848F60C6E91ECB7CDF308138E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/03/2022 11:04, Neumann, Bastian wrote:
> This patch adds devicetree properties to enable signal boosting on USB ports.
> 
> Signed-off-by: Bastian Neumann <bastian.neumann@dentsplysirona.com>
> ---
>  .../devicetree/bindings/usb/usb251xb.txt      | 22 +++++++++++++

Please split the bindings change. scripts/checkpatch did not complain?

You also need to Cc maintainers. Use scripts/get_maintainer.pl for this.

Read:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst

Best regards,
Krzysztof
