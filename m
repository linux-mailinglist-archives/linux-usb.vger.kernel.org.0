Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C38C3656290
	for <lists+linux-usb@lfdr.de>; Mon, 26 Dec 2022 13:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbiLZM2c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Dec 2022 07:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbiLZM2b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Dec 2022 07:28:31 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694A62AD4
        for <linux-usb@vger.kernel.org>; Mon, 26 Dec 2022 04:28:30 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o6so15798153lfi.5
        for <linux-usb@vger.kernel.org>; Mon, 26 Dec 2022 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9VsUfbXpnBl5i0jqV0GHVfHb2fzN94uWi/WF4L80bQ=;
        b=EGt0tVqCcxNMIPHFjFmmSJmtfepupOLGU6WfTr20N1cfbTWvjad6h6ZyUMyzbXS0dO
         JwBOXpGJdV3w+qcgu5Rtn5uwfbndTK2SGADbeGhlzTuVf7uZXZEx8VcwS+kZjHfqtDIP
         0tWkhL8h3pGUklT9nVvyHj4zjSRCy5xxV+pU7mEF8fHn8n2Pzbx/vNAJUk9eKyE4MOv6
         /ROyOZvwmpzEkhxUOBbEQKal3v1MhUJFVTJoQnI2Ek26xL8C3MZk9lT2MbSWWw3qhtGc
         hcLQCFFEXXWcAowwQGVoYha+nXJpA+xlunoGYxSaFci2gOGQuDyynfLOtalsc1HLCyM3
         GllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9VsUfbXpnBl5i0jqV0GHVfHb2fzN94uWi/WF4L80bQ=;
        b=pnXB5Lscq5Dwf7b080KRNsnBOQqngSXYiPX2fwr5hnejW9PKeXOlZWu5pleBUSY6Ki
         d+DNeSW8j9v5Gx2+zkMJ4LlO8b5sFQzGyjoAVBseBvTlixY/JFdw2I5TkcBLjk+Tpj6H
         l0JnVtOSZz0mZighvcvfOr+tMLvsMWYF9jk+rT1CZgxH5DsvsqI72e+205uOLGoUZCgI
         jz/eO2sSlwW0xUw/4zIBGVFepy7Xgf9HLg/mP28rwT3YrCzry16RmgbjJvBPf8ahb8tO
         wT5DepLgkVl73Q8QgTJQGLbhmFGnO8MeV6vrbNOGDSeiYxv/HUjxT6lNYcB0j9LAFao2
         u2GA==
X-Gm-Message-State: AFqh2kpDU/GMmhzm/cl9nhSwfKByOVocgjMLLO1jfRAfYB6Y2rH5fJnl
        my8quYLj43vdpUwkWzoYEOSOPg==
X-Google-Smtp-Source: AMrXdXt+SG75PQYPAqAyfLTtW57mlbWYpcItg3HmguNy4OAxCp6Z8zw35YRYWDPCc637ckI/5JBHRQ==
X-Received: by 2002:a05:6512:6d0:b0:4b5:d:efb2 with SMTP id u16-20020a05651206d000b004b5000defb2mr5311841lff.14.1672057708771;
        Mon, 26 Dec 2022 04:28:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b004cafd013f54sm1174058lfr.118.2022.12.26.04.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 04:28:28 -0800 (PST)
Message-ID: <9e93a28b-c735-5250-34d0-9b41c0f488b5@linaro.org>
Date:   Mon, 26 Dec 2022 13:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 08/14] usb: dwc3: Add DT parameter to specify maximum
 number of interrupters
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        quic_jackp@quicinc.com, quic_plai@quicinc.com
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-9-quic_wcheng@quicinc.com>
 <CAA8EJppsK=L69AaBgj=MzWp-ess3NSn=gPYf8-3QtJVqEVqGzw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppsK=L69AaBgj=MzWp-ess3NSn=gPYf8-3QtJVqEVqGzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24/12/2022 12:13, Dmitry Baryshkov wrote:
>> @@ -1468,6 +1469,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>          */
>>         tx_fifo_resize_max_num = 6;
>>
>> +       /* default to a single XHCI interrupter */
>> +       num_hc_interrupters = 1;
>> +
>>         dwc->maximum_speed = usb_get_maximum_speed(dev);
>>         dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
>>         dwc->dr_mode = usb_get_dr_mode(dev);
>> @@ -1511,6 +1515,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>                                 &tx_thr_num_pkt_prd);
>>         device_property_read_u8(dev, "snps,tx-max-burst-prd",
>>                                 &tx_max_burst_prd);
>> +       device_property_read_u8(dev, "snps,num-hc-interrupters",
>> +                               &num_hc_interrupters);
> 
> bindings change?

Undocumented bindings change :(

Best regards,
Krzysztof

