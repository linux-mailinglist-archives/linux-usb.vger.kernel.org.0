Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B133B1D495F
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgEOJVv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727837AbgEOJVv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:21:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE49C061A0C
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 02:21:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id g4so1484181ljl.2
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2020 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I1nraDclARKrCA29EVoPDtpaaicLZToHhlMTKQVzenY=;
        b=tnbqvvlNgJUlMgPaXVcmYwDPK1ZEltSB+hMIiSEw01VJoPtGPO20Ffto2m7KVmVXm4
         3oOBH/hZoik3rHCGm+MoRfEYmaf5YHzr9fnPJB35wGze/FhI0C2KW0csgYmk29VigNpy
         obyyOVX3oZelWh2wm5TNJiCKbGm6OagkvYcNmzbTVZtDOiCqoMaV6kY7SS8PlRCyRDXE
         +Uj0Qksx0yjiMcFuOlQss4KfmcNhvPHojuf10StzL++Vje/ARhyjWUp4NlFsr2M8oYzk
         59wMBZ+NTnNBLNtPB3p/+EKJKiIsZl01EwQ2BV4R6ecnz6e2fUqdIN8oiDjahqJYOzpG
         ilqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I1nraDclARKrCA29EVoPDtpaaicLZToHhlMTKQVzenY=;
        b=mx6hEgdG8cOXx9laFgg0DMxbAlBFXNaoYy3dIJ6EMWq2wJum8xvzvUVmyf09kwmvGv
         5U4FdQtL3g3OJq8C8iu9xFl2PjwkQOTgUUogtwMKiRhx+tQKu6oPNSPA5eqzScEzjt/3
         HRp898IzKH5NQ2FjoAXtxZPf3VDkvMQUg6KSmhuwQdmUxS2e6uZGEii3ozr9C2fs7fKr
         byVziuHZA8LEB9EVBYflZO6G7OrQaht9gS/JHNrXSHAJ6rMFOB47e91fKY2y7gUTvNjM
         7jmm5zkge7iWVfYx46sPf9qHQu1yZKgYBHD0MeG97ZXH1BE99l+Ls8K+In6XX9C4oeeE
         oRoA==
X-Gm-Message-State: AOAM533Xt5SMVwWCiepfhaGHlUwYJVjd55ORRUoVNMWwWUvPMIo8vDeZ
        CS2e0Kgi2ChDAywJyUpr5m8hpweX2129uQ==
X-Google-Smtp-Source: ABdhPJyRyE45vtKnuPofzX0MqtQD/YgUetIHt8yKvb3J4GkUiZya6GMEdYU/kHj+T3EdCgDpkUCH3w==
X-Received: by 2002:a2e:9641:: with SMTP id z1mr1517068ljh.215.1589534509054;
        Fri, 15 May 2020 02:21:49 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:46b9:e14c:2541:1887:9a5d:d412? ([2a00:1fa0:46b9:e14c:2541:1887:9a5d:d412])
        by smtp.gmail.com with ESMTPSA id 125sm971515lfc.75.2020.05.15.02.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 02:21:48 -0700 (PDT)
Subject: Re: [PATCH] xhci: Fix log mistake of xhci_start
To:     jiahao <jiahao243@gmail.com>, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org, jiahao@xiaomi.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1589521506-19492-1-git-send-email-jiahao@xiaomi.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <95a9f0ea-05d0-f1c9-9665-8c8bb0c9c8fe@cogentembedded.com>
Date:   Fri, 15 May 2020 12:21:36 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1589521506-19492-1-git-send-email-jiahao@xiaomi.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15.05.2020 8:45, jiahao wrote:

> It is obvious that XCHI_MAX_HALT_USEC is usec,
>   not milliseconds; Replace 'milliseconds' with

     I don't see 'milliseconds', only 'microseconds'...

> 'usec' of the debug message.
> 
> Signed-off-by: jiahao <jiahao@xiaomi.com>
> ---
>   drivers/usb/host/xhci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index bee5dec..d011472 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -147,7 +147,7 @@ int xhci_start(struct xhci_hcd *xhci)
>   			STS_HALT, 0, XHCI_MAX_HALT_USEC);
>   	if (ret == -ETIMEDOUT)
>   		xhci_err(xhci, "Host took too long to start, "
> -				"waited %u microseconds.\n",
> +				"waited %u usec.\n",
>   				XHCI_MAX_HALT_USEC);
>   	if (!ret)
>   		/* clear state flags. Including dying, halted or removing */
> 

MBR, Sergei
