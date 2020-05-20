Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A0E1DB4DE
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 15:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgETNYL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 09:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETNYK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 09:24:10 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDD9C061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 06:24:10 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i15so3099289wrx.10
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 06:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j0JARMDv4UlW7aJGjHKEVVFu7IQGNKna5Ft8YAkfL14=;
        b=xK98M4uQy9MQFTvRagojNw1kvfnBxYEj+C1CvAAwRdtJL7PwqYAWu58C5m0Pay5/aW
         d33GX00Cy13TIuhnVPzG/I1tvxKiDiLqTYFWCIywktYa2IABiXNFLS+Cb8LejEGP/+U/
         yUcTce+MP+PuR4Ayt//smb16fPdbwugMETdO8gsWkSuQNBUqhEUCOWKQfk6munWkdjnE
         1xyqu3LbP6/GMoWBBImvxsSEslseL2xc3Eoet99X4g0mfSHJ/nhuGKROylZ42zFIVlgB
         szzmIzo0t1YtzZ0GEV0RBFMO7YfIxjYDj68QEY3GWGCnIjISLvKKNUcTIApwa/Sxgfv3
         qgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j0JARMDv4UlW7aJGjHKEVVFu7IQGNKna5Ft8YAkfL14=;
        b=L4QeTSHLRsfIp/RNFKMGl2Plmanzx/3Yn/BZRomGWaS1exyMZcgAzf3xe+geD15850
         wXedqxKZchd7EydFnBwjuZG4L7j9M+gKJgeGxgQEQPy6uHoAFAfio7H1hUZu3rOVM6IL
         HEnSmhWbcnSD7fe0F6+AS26zw7wAjgFzqkQHvP7TcH/tFtPNrmfq6lacNRuLvwi5FLfl
         gliMLnIuGCs35Lo8pPjV14JtFv4t+KBu1SMFkGp/kfU+vgW3UR7jbbEZNNDsPz1ar1E4
         DQaHmnBSIFKdQJ391KQgZy6e1YTVoj26KHzZa7WPMlcLMh5cn3IUTKeUvjTXRPrGt8cO
         sIAw==
X-Gm-Message-State: AOAM531+Hr7uv3MXVUQOWrdEUSZsjdehtc24mTJ6P5OjA8BYyQ87pvrb
        FT2RRCBCqXpu9Mvdy0mBSovriEWu8r0=
X-Google-Smtp-Source: ABdhPJzJ1pLGHbLqrPfPxHOXS4w2EnGARikJZogOL6GFvTARRP0s8MaLO8DV3FNDts/J2bUTHN1r0A==
X-Received: by 2002:a5d:69c3:: with SMTP id s3mr4047582wrw.305.1589981048779;
        Wed, 20 May 2020 06:24:08 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id 32sm2916818wrg.19.2020.05.20.06.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 06:24:08 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] usb: typec: Ensure USB_ROLE_SWITCH is selected for
 tps6598x
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
 <20200520123312.320281-2-bryan.odonoghue@linaro.org>
 <20200520131728.GJ1298122@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <ae7915f0-be5b-1756-c51a-b839ec3de8eb@linaro.org>
Date:   Wed, 20 May 2020 14:24:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520131728.GJ1298122@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/05/2020 14:17, Heikki Krogerus wrote:
> depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH

Hmm.

That broke for me with a recursive dependency

but this will work

+       depends on REGMAP_I2C
+       depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH

