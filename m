Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B2676B60D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 15:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbjHANlU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 09:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbjHANlP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 09:41:15 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0561D1BF8
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 06:41:13 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso61760355e9.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Aug 2023 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690897271; x=1691502071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Jd6Bu2fWUccPQE4w3JM+VwAuK7pWORe1Hxf+ypNt9Y=;
        b=Pm/W+3kn424ixYZQkKpzz4HcBDVHD776tjF+go9N11RWZ1VGoMssigfPmzEDNUG0M4
         2ZoeIaILhyG9m3h/Pu0as0C+2uudxl0kv1oQiYj5xPX8ek+fK99/C91cXBgnGgSyjGaE
         7wESfZdHDYT4h7e1ex7+D0AUh6JoiwkfWfe2iHJHnpA1elcXE8tyRtgENKerUnBF+S9W
         bcQvJGB7G6qoKLEwcab/dU07sjAr8defNulFxJgoxoCHxXRuwfp9Yw3DNR7Yv3+XPdlh
         JNPo/AaHA2pMj8Np3UHo3bfRQ5x9GwLMpTOWUniECTm1n9yR4T+/8C6iVurWJjd4nT1S
         SYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690897271; x=1691502071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Jd6Bu2fWUccPQE4w3JM+VwAuK7pWORe1Hxf+ypNt9Y=;
        b=bbLfXX9MPA/4Iw3UvBMA4VMhr3XPAk3TYd0UfbGhIVVZ72920w665QzSvoJe/PXVj5
         yKas0C44vAUe2TlNjNFTC4TLZU2Ct9BJLhIw5a54dd4xLvvFD0uXJ0RDmNfbNagWXWP5
         6uKbzq0Wll/vwV8YRm9DurKetGujoCUm0PjRyODlpCOTyRt8Z3i/Mzi3cIRPir4hbnp2
         VAi8FxsRJTQSXoOC02Y9Fw33MJxHh1ZwyRWES9HzfaRslctBSR2gJVqXSFVoickeXc24
         hVSfIV0HVsbSRfJ0Xi/K8ki9jx3pPuKBo8SJvN792WqQcZsFUA/faakmB9Jd61Fi8rD4
         s/EQ==
X-Gm-Message-State: ABy/qLZFmc8cYzHUGL87pim9OeuY5nY7MSnhigfOhSP1F5RmZNDsOWKt
        gOscWkU06xYEWMFPK3WI6vwhQA==
X-Google-Smtp-Source: APBJJlFM8wilWNsoiEnhkTnEDB5dH225GL5eR8sPOPtZVcuq7wWHD6crz8yvDRvBjnciU/NQaqu9yA==
X-Received: by 2002:a5d:53c7:0:b0:317:7c31:f3a7 with SMTP id a7-20020a5d53c7000000b003177c31f3a7mr2292099wrw.17.1690897271271;
        Tue, 01 Aug 2023 06:41:11 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.174.59])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5005000000b00311d8c2561bsm16046836wrt.60.2023.08.01.06.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 06:41:10 -0700 (PDT)
Message-ID: <2ddc5aed-3b20-ac56-5a04-98a0fe5ae092@linaro.org>
Date:   Tue, 1 Aug 2023 15:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/7] usb: dwc3: dwc3-octeon: Use _ULL bitfields defines
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/aa2ncz6tJGNU@lenoch>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZMd/aa2ncz6tJGNU@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31/7/23 11:31, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> While driver is intended to run on 64bit machines, it is compile time
> tested for 32bit targets as well. Here shift count overflow is reported
> for bits greater than 31, so use _ULL versions of BIT and GENMASK macros
> to silence these warnings.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307260537.MROrhVNM-lkp@intel.com/
> ---
>   CHANGES:
>   -v5: new patch
> 
>   drivers/usb/dwc3/dwc3-octeon.c | 78 +++++++++++++++++-----------------
>   1 file changed, 39 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

