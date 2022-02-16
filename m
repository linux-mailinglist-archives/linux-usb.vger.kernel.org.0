Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2D44B84A0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbiBPJmI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:42:08 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiBPJmG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:42:06 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B49E0AEB
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:41:52 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e17so2395208ljk.5
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QaNwt9SQ6DzRbNAGLtqtMU6nrQKeqSfmU6yrI7LzU0Y=;
        b=KkCea7osivyB9FSw2DaT9jDfa0MzzKtbLlXCAJy8GXyJITuiG0eo3WV7Bij2TNY98v
         DeBBrjIxibIEV0CMaOHYfhc/a7pbRjrSHvTCNW7pvUdb+wEYuguQnmN4sx1d+TGAnXQS
         r4yzCe08uAbJT9W5ewyH1vBeWSCz/Tz1smB9M/mhId7LOj5KWgZJmVnq7agZdIAa/xSr
         JW+exTCxPF18fCokPVF30Ox+V80Ss9miet9nx/c2OCKmaS0Uxt9QKTsjSRjKpd2TX3iE
         P5SziC1mdPRXtG/kADH1lUVVdMkD7n+wEv8fmxdxrPDvjfd04JfpFiVUlNtiG7ZJCNBH
         23jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QaNwt9SQ6DzRbNAGLtqtMU6nrQKeqSfmU6yrI7LzU0Y=;
        b=ZdoPieEJiUpUb0HU6hmGOABKpWeMo+7eCX126jI10xFg6DI3/yXF4AAGtxIZJShV1q
         TbiyiWwggXdmOTiId9pkUay3qvqYE8nr56jQxkkkKCAnxvFVnEaQhvVIYepR5OkRGmOo
         fM3og3LHpnDn6kyO8pYCCz6si+W/n93Lk7MlvhubcPDrgivV2qfQu4YTkkBBDpQNFvaU
         QpHpEPDYxTg/4oa74hnuvC07T7PIxaQYeyhORsqgkMcW2czR7OVOyzUN3czORWtNRqa3
         HNGIiodtp8wuBWltouJkPIM/ymOIYcsp4+AWZZBd9RSc3GRz13oQ5uAMlnoYWBEqLyn7
         PS5w==
X-Gm-Message-State: AOAM530agbtqu5UAD/zST1+EaGyY/VW/V7Q9Iv15/or1CO5CMz+PyL4J
        8DMWV34h4J4AZN5xpg58R54=
X-Google-Smtp-Source: ABdhPJw4H6I7xWX0In3K8NmI6N1uXmUrxifxlgx9dKyUQkLTy1zmdHIQ2CEZjgb9nNINRinI8w1Zrg==
X-Received: by 2002:a2e:3c06:0:b0:245:a3b8:aacf with SMTP id j6-20020a2e3c06000000b00245a3b8aacfmr1362819lja.241.1645004510933;
        Wed, 16 Feb 2022 01:41:50 -0800 (PST)
Received: from [192.168.1.103] ([31.173.81.81])
        by smtp.gmail.com with ESMTPSA id t15sm164562lfp.91.2022.02.16.01.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 01:41:50 -0800 (PST)
Subject: Re: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>
References: <1644994755-12975-1-git-send-email-quic_linyyuan@quicinc.com>
 <1644994755-12975-2-git-send-email-quic_linyyuan@quicinc.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <4688f5bb-c0fd-bbce-de1f-a554d543ed03@gmail.com>
Date:   Wed, 16 Feb 2022 12:41:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1644994755-12975-2-git-send-email-quic_linyyuan@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 2/16/22 9:59 AM, Linyu Yuan wrote:

> The for loop to find page size bit can be replaced with ffs().
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/host/xhci-mem.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 0e31206..3cbc7f2 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2395,12 +2395,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  	page_size = readl(&xhci->op_regs->page_size);
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
>  			"Supported page size register = 0x%x", page_size);
> -	for (i = 0; i < 16; i++) {
> -		if ((0x1 & page_size) != 0)
> -			break;
> -		page_size = page_size >> 1;
> -	}
> -	if (i < 16)
> +	if ((i = ffs(page_size)) < 16)

   Always run your patches thru scripts/checkpatch.pl -- in this case it will complain
of an assignment in the *if* expression...

[...]

MNR, Sergey
