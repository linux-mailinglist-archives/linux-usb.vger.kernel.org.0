Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60C1D427172
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 21:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhJHTek (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 15:34:40 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:40695 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbhJHTek (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Oct 2021 15:34:40 -0400
Received: by mail-ot1-f46.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so12901854otq.7;
        Fri, 08 Oct 2021 12:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fn95PFblNu/n2WPk0S8fpzw+qYkLTPd9r9RyFtw4x5w=;
        b=4b9hP9oHxs/POh7lRJy3Shc7mQkYQVf/dqRe4dIsdLeCZkjKNS12TG4atwy8tN/X09
         vcuiiX5aKwncCRf5rl36X7l2BuTNbVCA753Vg5t26R7RqiQtz/BG5ib+s8ZHem6yMvIE
         eqy+2CPZ/KIliKZ+aZFX+60gIlt+hGKMK3EtQIIG3jKDO4HHZp6hRFDCvHCYskrWsRUE
         WftEZd1zC4HZnl6q1uI4G+oQAmUoctU324MSVFWDGQHa6odHWCbEdnLzcONdUHyCr8a1
         eG09koD3SgiaVss/s7sfhQXrohiZADTKf+5Myir+AUIGUxQ1paZu4d5vNnRaDlaQHEpy
         zgtg==
X-Gm-Message-State: AOAM531bOhoDYlKFPrhf3jD6Go6vnQ/XZEucyF3HMJL6FtUPbPr+kv4K
        Tj/HKnY6S06MwGibCsSxWVTeUcd8jA==
X-Google-Smtp-Source: ABdhPJxueOyimn5+QlOO/vCWTB/+h/pOuuDzt7vG9m4ufHYSrvlWZ/XmTF7gEPiDuvRcmF+JbPIYOg==
X-Received: by 2002:a9d:3783:: with SMTP id x3mr10382211otb.16.1633721564334;
        Fri, 08 Oct 2021 12:32:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l2sm63420otu.23.2021.10.08.12.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 12:32:43 -0700 (PDT)
Received: (nullmailer pid 3169868 invoked by uid 1000);
        Fri, 08 Oct 2021 19:32:43 -0000
Date:   Fri, 8 Oct 2021 14:32:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        git-dev@xilinx.com
Subject: Re: [PATCH v4 1/2] dt-binding: usb: xilinx: Add clocking node
Message-ID: <YWCc2lYWWNr0SZYD@robh.at.kernel.org>
References: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
 <30c7d87ab46a0ea2da2dd04d824f162a2e3da4c8.1632805672.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30c7d87ab46a0ea2da2dd04d824f162a2e3da4c8.1632805672.git.shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 28 Sep 2021 10:57:10 +0530, Shubhrajyoti Datta wrote:
> Add a clocking node for xilinx udc.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v3:
> update clock description and names
> 
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Since I picked up the conversion, applied. Thanks!
