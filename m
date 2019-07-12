Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B15BA6698B
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 11:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbfGLJBj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Jul 2019 05:01:39 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37158 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfGLJBj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Jul 2019 05:01:39 -0400
Received: by mail-lj1-f195.google.com with SMTP id z28so8630173ljn.4
        for <linux-usb@vger.kernel.org>; Fri, 12 Jul 2019 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NqJXiNNSh/sjFsxwZIgeFXlIgfNFkURnbK71YSfseYY=;
        b=jmLEqVYILBKpz0fWkFdYTUdn3cjWcmQ8Yaz3zfW0Ov/VG79dcQFeBj6jRagVCXlQ3V
         KGavzDhWFaj7NXDDay9d5959A+4+f8Zzzvki2Me8E+zFiFiJZmrVb6vjQeeGqjofV3mn
         kFsnWqZEPGt5ktzvhasqBdU8wew1hR/wWzTrXNU9sSqjI/GbAr/BSBM/jAvaIm0s+6+S
         v/RIE7+t9aaF9YshGNQdWzUYWac1knWWpruoWx11wLh+5kCIUKb1tes4M+2+ESQfefSy
         mNKYK0NX+jMBSvGQEq/Za+ttEPm3s5mZ/2Hu43UpRfccQEXKPUiNyYi6WRdvh363Uiup
         X4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NqJXiNNSh/sjFsxwZIgeFXlIgfNFkURnbK71YSfseYY=;
        b=aUjfljqoBadf374Gsvy+bUwaSYgPIxxhiXHN1mXHHsxj6+tM/Uym9h3t6GI5nV9p1j
         dEhSgUh/nwCHLkXtFiu25sn3VwLr2SVDdYe/18VynjegSArv4UYj7EF6b2O54JJKCyZj
         jq//q2tHpexJ8vjFnIw+d0FJO+hf2SKYol4KnoZLNsXfdpW/rAql4RFT+FBmuKywnlB/
         ZontXW6kPSmWfvchuWNMgAAObp+1rzR2S2VHhEFXq0Tfo1vCAoJmQ5/Weh3D5sieAoEV
         I/APHiXiMLpZKiejSeMepOYS1nkN3dbxEsPRE3D5qx15ZcR4Yu4YQcsGzEkTVJBrv1H8
         urhQ==
X-Gm-Message-State: APjAAAXiPTHOCgii7DnaTto+V7TWG2mktDSjODs00fPzjqIVk54OnyTH
        Wk1rE1lQ1qH3bhVr7jf7ab7r0g==
X-Google-Smtp-Source: APXvYqzweFnvfYr067luVfUQlJ0vLz0JYRNdDpX8qASatPwiZSZodl+Q7MuiT+rPF8JONqiypEsnPg==
X-Received: by 2002:a2e:9192:: with SMTP id f18mr5230052ljg.52.1562922097456;
        Fri, 12 Jul 2019 02:01:37 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4891:7704:fc39:ac04:c327:315e? ([2a00:1fa0:4891:7704:fc39:ac04:c327:315e])
        by smtp.gmail.com with ESMTPSA id e12sm1028446lfb.66.2019.07.12.02.01.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 02:01:36 -0700 (PDT)
Subject: Re: [PATCH v2 04/12] usb: gadget: aspeed: Improve debugging when
 nuking
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
 <20190712025348.21019-5-benh@kernel.crashing.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <af1da9a4-0122-4fdb-9fe7-fb886c19f3c7@cogentembedded.com>
Date:   Fri, 12 Jul 2019 12:01:25 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712025348.21019-5-benh@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12.07.2019 5:53, Benjamin Herrenschmidt wrote:

> When nuking requests, it's useful to display how many were
> actually nuked. It has proven handy when debugging issues
> where EP0 went in a wrong state.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/usb/gadget/udc/aspeed-vhub/core.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> index db3628be38c0..0c77cd488c48 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -65,13 +65,16 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
>   void ast_vhub_nuke(struct ast_vhub_ep *ep, int status)
>   {
>   	struct ast_vhub_req *req;
> -
> -	EPDBG(ep, "Nuking\n");
> +	int count = 0;
>   
>   	/* Beware, lock will be dropped & req-acquired by done() */
>   	while (!list_empty(&ep->queue)) {
>   		req = list_first_entry(&ep->queue, struct ast_vhub_req, queue);
>   		ast_vhub_done(ep, req, status);
> +		count++;
> +	}
> +	if (count) {
> +		EPDBG(ep, "Nuked %d request(s)\n", count);

    CodingStyle says to avoid {} around a single statement.

>   	}
>   }
>   

MBR, Sergei
