Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BEA400444
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 19:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348882AbhICRp5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 13:45:57 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:35547 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhICRp4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 13:45:56 -0400
Received: by mail-oo1-f51.google.com with SMTP id y3-20020a4ab403000000b00290e2a52c71so1735564oon.2;
        Fri, 03 Sep 2021 10:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4DKlnzKaQdYwQhO3HZluLi5DN4OngoT8OAa660HK15o=;
        b=MrOqhd/TnF1WRskpnqAcSMhhTfMYwnMGVpu2iPWxx/eNoZ2gwhw9v9PD6s7B75UjOR
         4lCQFBtzQtrYq4JR58zF815UBRpifJotvKa5lRYA0DIeb3fBDn86NRZr+B2PS7iAlbCU
         7mr1Gu7BLsd2Y/D5us+C7apRQDIU3m8jnSpcxMwj0cjeKSHMyCL6iCblC7yYX/MufNua
         SwpNOjnH0wCEFDue9/Bbg0vRmOfjfJm9RTmdTCkSJdqPNMeFeeCuP3Gtp3B+MMIkCjcX
         wVszapRPsajrooVdQdn/vVeZWdb9fVWNUOTZFFVYIqtNs8tt+R3nSHA5XGfYmU5smfYg
         +ZGA==
X-Gm-Message-State: AOAM533Nmcn1YOVqwCiJRS6pEFGhMw5N/TCjptamfnqJsw6Bvmq+iXeX
        dxTcNaMKEhzefQVW0wLJ0GhftCvCNQ==
X-Google-Smtp-Source: ABdhPJyGT0DcFeoIEboYXSdIli7WmLm/qUYTFFF0GB8KocaC9nTNIUjOf76CqysJdb562eZ87sHj3A==
X-Received: by 2002:a4a:db86:: with SMTP id s6mr3959704oou.58.1630691095762;
        Fri, 03 Sep 2021 10:44:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f33sm3297otf.0.2021.09.03.10.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:44:55 -0700 (PDT)
Received: (nullmailer pid 3155817 invoked by uid 1000);
        Fri, 03 Sep 2021 17:44:54 -0000
Date:   Fri, 3 Sep 2021 12:44:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     git@xilinx.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, manish.narani@xilinx.com
Subject: Re: [PATCH] dt-binding: usb: xilinx: Convert binding to YAML
Message-ID: <YTJfFhuAzPVxdsYv@robh.at.kernel.org>
References: <20210826053433.1599019-1-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826053433.1599019-1-shubhrajyoti.datta@xilinx.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 26 Aug 2021 11:04:33 +0530, Shubhrajyoti Datta wrote:
> Convert the current udc xilinx binding from text format to YAML
> format/DT schema, and delete the legacy text binding file.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  .../devicetree/bindings/usb/udc-xilinx.txt    | 18 --------
>  .../devicetree/bindings/usb/xlnx,usb2.yaml    | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/udc-xilinx.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
> 

Applied, thanks!
