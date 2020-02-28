Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF678173612
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 12:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbgB1Lcl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 06:32:41 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45182 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgB1Lcl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 06:32:41 -0500
Received: by mail-ed1-f68.google.com with SMTP id h62so1024979edd.12;
        Fri, 28 Feb 2020 03:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WwHkn00+dJyzFl79Z3wZZ7U758NGAlMAHel80SC1KKA=;
        b=b5m9ZcSvlAVgIprC8rZGqDdUCBk9Y9I0v0o0ZBhHknGPOf/Y3498RouFvDQQ6cBrq6
         aT1zn1dzyDz9Nq3nSr64lkv3BlE5cQ94LKH3FXUM8rIgXh3GOup+iU4+XTO5Zlrd3O3i
         ebOjg2EzvNAFLzIHDFiU3sLiXrGR/7le9gMCW7CwS0At43ihKnnfHrU29pF1Wr8GnygL
         F2z3ikmYt1NCuDnx6WRZGJDwMqzKH1+fWdsNPTP1MUJqVcbn5Kovu9qiuhZEs79XnVlx
         wLwZDpjPtRAA6EpjNdOEpxRMCKMc69+uTTAi82K+MUm+4kDxKY5CHWDxbO+jrAvattiO
         CxhQ==
X-Gm-Message-State: APjAAAXqcO96NjUQbDa0QnOfuo6IvIflw6FcR6pzdnCbNSRLy1zOIWX3
        Q6ivJZMQaphnu2wKojo2mGu6FqAgEKw=
X-Google-Smtp-Source: APXvYqyld2+YaUioJrINN5LT/V2YT0770Evql77F4sX6YZe/MzPiF6b7LkLpyKcRgbsFkNJalUHZ/Q==
X-Received: by 2002:a17:906:5c10:: with SMTP id e16mr3651279ejq.10.1582889559109;
        Fri, 28 Feb 2020 03:32:39 -0800 (PST)
Received: from pi3 ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id r23sm531736edp.15.2020.02.28.03.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 03:32:38 -0800 (PST)
Date:   Fri, 28 Feb 2020 12:32:36 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc2: Silence warning about supplies during
 deferred probe
Message-ID: <20200228113236.GD9458@pi3>
References: <CGME20200228092607eucas1p20faf7fdabdf52586f18e8781e371f04d@eucas1p2.samsung.com>
 <20200228092557.31429-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228092557.31429-1-m.szyprowski@samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 28, 2020 at 10:25:57AM +0100, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about the failure in getting
> supplies in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/platform.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

