Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A861145EC
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 18:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbfLER2v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 12:28:51 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40203 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729396AbfLER2v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 12:28:51 -0500
Received: by mail-oi1-f193.google.com with SMTP id 6so3470218oix.7;
        Thu, 05 Dec 2019 09:28:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/xCNgaA/RJUdznExwtslEOtpcNh7qbOa568yutxnWgQ=;
        b=ayHqQe9buMvTx5Nsib3Vgj/Vw6NrbAHQe13cQ88dlTdnvNKGq7RXV7X8PJro7ooDlS
         GKieC1gXpWuJnf6Txi5BYIdA6OMUAc5ChbAG+i/0Owo4MzYIYlxMjf5tZdak5ikresUx
         fvifxjNz8Kv/+tAKbcOyf8LVG8hGI7ZgNssqqSkjETlTTorcIHZerFirtPBKVW5T3x8Q
         9rSA47KWoGpBUFpmyVQTSukPBGzRE3Bbemhx4lMf3TalA1FWLkgr7p1RNntHGRO1LIZk
         OUzanbL+7jS/M2wdvsJaW8pPONYZNmgDG6SyWnr0sGT0FJnRaPDai7HYj9NKJUAUTaZW
         9Ljw==
X-Gm-Message-State: APjAAAVk+MAt2d6VKD/RkujkrD/rHUpy+K86Lggke9aSO5NicJlexAs9
        v8y/+SelkUVN9SMei9aIGbtLQUY=
X-Google-Smtp-Source: APXvYqyo+bOLgmaHpcXxa+Q7K/RJV1JvnSSCEPE3kj2XbGKOEP6yGJkqq8nFO6RkpW4/TBCIdcBFiw==
X-Received: by 2002:aca:3846:: with SMTP id f67mr8052456oia.61.1575566930059;
        Thu, 05 Dec 2019 09:28:50 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 47sm3645510otf.54.2019.12.05.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 09:28:49 -0800 (PST)
Date:   Thu, 5 Dec 2019 11:28:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc2: add support for STM32MP15
 SoCs USB OTG HS and FS
Message-ID: <20191205172848.GA26517@bogus>
References: <20191125102659.22853-1-amelie.delaunay@st.com>
 <20191125102659.22853-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191125102659.22853-2-amelie.delaunay@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 25 Nov 2019 11:26:58 +0100, Amelie Delaunay wrote:
> Add the specific compatible string for the DWC2 IP found in the STM32MP15
> SoCs.
> STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
> ID pin state. usb33d-supply described the regulator supplying Vbus and ID
> sensing comparators.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
