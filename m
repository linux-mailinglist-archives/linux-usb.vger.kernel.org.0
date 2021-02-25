Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB208324A2F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Feb 2021 06:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234345AbhBYFZh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 00:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234107AbhBYFYo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Feb 2021 00:24:44 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B68C061574;
        Wed, 24 Feb 2021 21:24:04 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f1so6738929lfu.3;
        Wed, 24 Feb 2021 21:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yWXS2HkM8xLGWtpmEak7G4owDTjliw1WPvOt21FIkbU=;
        b=M5ez5k7LGBR/QZvgoVygoUpkYl4gHnC4rC4JK2e4TB/yCBnajciDNauG+bknnMnBd1
         iCAD2UsMUnaGOYrnJ+77+kCyDfqf+HKj3kqQEKgg/BHBww9YMJGtZZC7VAXVHz54U/vC
         ZUtjGDJRmcE2WTUE1I3xpcVzpMfnEiKzO8+23lh6ZPjLXYecEq582J71jwwpG0Ea+HRq
         pzdFEZ4eBHKP55JfMBmwabw8aCvo8K82cx53galu/l24kdMBTmddbia5pINw/fC7c8fC
         vynwV0Vn5kAZX3KwSKBND/6HmvbeqYq2OuNVAl+7ddw2oq9lKnZEvimJncPBRrmmc1P1
         +ynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yWXS2HkM8xLGWtpmEak7G4owDTjliw1WPvOt21FIkbU=;
        b=EawR/0YtpV1A3qFjOiN1jTRcdSHk42YIkSndwRqAP7viuaMzwBP3Av+yTkWmFEQ8Pe
         rvOJZ+XHFYnfv3uoJMELJam1JZ8DHgHiSqhUV1W6cOh7nfpXC0e6H2eHrd5hwRRdmGyX
         /HT/AY3Kpf63laaON2JI69LYgKhOpxusdC9JNO+t/MRvVivBhsChD+SOCg4j08EnxRRu
         CSXVG6tmw4+fINQ9t7iVPK9JF8zSpkqcuBkAVjYRn48oz+Q64GkWbTNdTfsE0hAtsann
         Kp/CANbE0LHjSPOB+UgNjvIlocQJvXDfIdTTbjtQMYzDSxicwJy/T9Pikq6j05AZVK+E
         9ETg==
X-Gm-Message-State: AOAM530OjAd9mmzoGaM4ZllG5mg4dkWPci1bNddtx85lXGHah/w9cuwW
        kE+kKECM+qA7oyjryRisj2M=
X-Google-Smtp-Source: ABdhPJw1tmQuThcSV+p/pyc+f+G2QaF/UdGurxwD2JSxe/gZIL0JZ3YPXIBM+FzJqvUMyrvZs1QShQ==
X-Received: by 2002:ac2:4d99:: with SMTP id g25mr856788lfe.107.1614230642630;
        Wed, 24 Feb 2021 21:24:02 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id k9sm928719ljg.59.2021.02.24.21.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 21:24:02 -0800 (PST)
Subject: Re: [PATCH] usb: chipidea: tegra: fix flexible_array.cocci warnings
To:     Julia Lawall <julia.lawall@inria.fr>,
        Peter Geis <pgwipeout@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kbuild-all@lists.01.org
References: <alpine.DEB.2.22.394.2102132108040.2720@hadrien>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <040ff9fe-ceb2-b1f8-b01f-1d71a70a1c71@gmail.com>
Date:   Thu, 25 Feb 2021 08:24:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2102132108040.2720@hadrien>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

13.02.2021 23:09, Julia Lawall пишет:
> From: kernel test robot <lkp@intel.com>
> 
> Zero-length and one-element arrays are deprecated, see
> Documentation/process/deprecated.rst
> Flexible-array members should be used instead.
> 
> Generated by: scripts/coccinelle/misc/flexible_array.cocci
> 
> Fixes: fc53d5279094 ("usb: chipidea: tegra: Support host mode")
> CC: Peter Geis <pgwipeout@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Julia Lawall <julia.lawall@inria.fr>
> 
> ---
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> head:   7a1e838d0cdce7d09a0bd81d45c7b5a660e71ac7
> commit: fc53d5279094e38e6363506339772a7021da2df8 [64/198] usb: chipidea: tegra: Support host mode
> :::::: branch date: 19 hours ago
> :::::: commit date: 4 weeks ago
> 
>  host.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -32,7 +32,7 @@ struct ehci_ci_priv {
>  struct ci_hdrc_dma_aligned_buffer {
>  	void *kmalloc_ptr;
>  	void *old_xfer_buffer;
> -	u8 data[0];
> +	u8 data[];
>  };
> 
>  static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
