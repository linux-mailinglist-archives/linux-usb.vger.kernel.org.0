Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8D9E107C22
	for <lists+linux-usb@lfdr.de>; Sat, 23 Nov 2019 01:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfKWArB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 19:47:01 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34664 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKWArB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 19:47:01 -0500
Received: by mail-oi1-f194.google.com with SMTP id l202so8215568oig.1;
        Fri, 22 Nov 2019 16:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GF2tivPiJSsbGOJG9c4fGJGIslqjxw0Gv2tmQCbJN2U=;
        b=sjdoGuj0ByhqrG+n9rNTGw9k4ZfCnd6SIBpDrN94Z/T5QmrZ6PerbX/MKAw5ODx1OL
         yuvFh3ke6fe56P5s4PgIITm6xhuS3kmcCfMdwzdCjcJtfuMPjQmNxQ92Bn/guujzb0n/
         ST8nwOKPjKV07bCWp+fHjtqXaLZUcyh7SEDkoGvzvkHPdYrXMYhW1A9k7S6XUUbR8ko9
         bCCD1j7TBB1U6M+kXZF+lqxw9Gf3KkBxaOJ3EOBNRVp7E7FmJDmRcmcu5QXPXcSkR72C
         qZg1gQBexXzZ+2SaY+tUkxC69Dczupo6IP3Zda+112jC/lj+r7HP41jG2w9qj/73GudM
         W2zQ==
X-Gm-Message-State: APjAAAUg0WY8nps/Ibf55aJf9nuxAL7lOQ2Y5hjvcaJx5LPOGx9FX8Lp
        5ci1V3XGh8whhGnnfgmdSmKAiJk=
X-Google-Smtp-Source: APXvYqzyBxNhquOKqULhaKKlwET9TNo/0SJA5OAbC7BTthcla3tFWtm5EHHsD2ZAohRKLik90eEQPA==
X-Received: by 2002:aca:4a0e:: with SMTP id x14mr14006246oia.123.1574470020242;
        Fri, 22 Nov 2019 16:47:00 -0800 (PST)
Received: from localhost (ip-70-5-93-147.ftwttx.spcsdns.net. [70.5.93.147])
        by smtp.gmail.com with ESMTPSA id 38sm2845744otr.7.2019.11.22.16.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:46:59 -0800 (PST)
Date:   Fri, 22 Nov 2019 18:46:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Chen <peter.chen@nxp.com>, Jun Li <jun.li@nxp.com>,
        Leo Li <leoyang.li@nxp.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH v3 1/2] usb: dwc3: Add chip-specific compatible string
Message-ID: <20191123004656.GA23783@bogus>
References: <20191121024206.32933-1-ran.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121024206.32933-1-ran.wang_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 21 Nov 2019 10:42:05 +0800, Ran Wang wrote:
> Some Layerscape paltforms (such as LS1088A, LS2088A, etc) require update HW
> default cache type configuration to fix DWC3 init failure when applying
> property dma-coherent.
> 
> Note that the cache type configuration is actually native feature of DWC3,
> not additional desgin coming from SoC, so add this support here.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v3:
> 	- Update commit subject according to content change, originanl one is
> 	  'usb: dwc3: Add node to update cache type setting'
> 	- Replace sub-node definition with chip-specifc compatible string.
> 
> Change in v2:
> 	- New file.
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
