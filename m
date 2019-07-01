Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7F01BBF7
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2019 19:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731722AbfEMRbk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 May 2019 13:31:40 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34411 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728708AbfEMRbk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 May 2019 13:31:40 -0400
Received: by mail-oi1-f196.google.com with SMTP id v10so9990533oib.1;
        Mon, 13 May 2019 10:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jfvm+UxtW85+1lTj8+jl3f2AYjNWVAR7x9TACkvrnqs=;
        b=XD7sZyqNO0liK+ip/Wc6hYBlLBBYUEL2zJXIvXF8IvQbxHFb7nA7E3n6SCnBd90h2N
         7jcsuWqJ2sO4dSfeHN23s8U8+BwJOfBiGlnpvfKcGqqJl+mBoz0DnEU0NczOItX9s+zD
         NatLZeAHp7eUrCNSs6EbtVOAyEIvyZBxm5dj6vd1dDlTKTJ+pgX69OhDCvXlg4pW6pJH
         GQ74fsvtljhzl/53vztvKARbntf2NfTFYL27RrPrIw5S6w9wAtDYPjCnK0dLS/G5GR5c
         s/QLxR7s4qqKdlY3KBNjNehdpbok9l1WtSGmFtNlP9rCf40TrEQx8/mlgdsseIgcS1Iq
         8GFw==
X-Gm-Message-State: APjAAAWFrwVHSY3i/As0mhijCxzP25eziRPdIIwH2fMvoAJCewcIKGzt
        1vN2Hr9fkkQFXol7v5sWNw==
X-Google-Smtp-Source: APXvYqza4wgb3FqLjsDoT94kPU0YjBN5EA7DYSQSSawD4WxuLHYAvNzbMmRxERMqkWJ+hZXslQS8CA==
X-Received: by 2002:aca:61d7:: with SMTP id v206mr178118oib.97.1557768699295;
        Mon, 13 May 2019 10:31:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k65sm5359873oia.16.2019.05.13.10.31.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 10:31:38 -0700 (PDT)
Date:   Mon, 13 May 2019 12:31:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Claus H. Stovgaard" <cst@phaseone.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        v.anuragkumar@gmail.com,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Subject: Re: [PATCH v3 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling U1 and U2
Message-ID: <20190513173137.GA20313@bogus>
References: <1557472048-10536-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1557472048-10536-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557472048-10536-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 10 May 2019 12:37:26 +0530, Anurag Kumar Vulisha wrote:
> This patch updates the documentation with the information related
> to the quirks that needs to be added for disabling the link entering
> into the U1 and U2 states
> 
> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
> ---
>  Changes in v3:
> 	-None
> 
>  Changes in v2
> 	1. As suggested by Thinh Nguyen changed the "snps,dis_u1_entry_quirk"
> 	   to "snps,dis-u1-entry-quirk"
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
