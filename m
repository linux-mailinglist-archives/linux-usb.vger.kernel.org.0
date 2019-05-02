Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B15F1122AE
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 21:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfEBTqe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 15:46:34 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45876 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBTqc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 15:46:32 -0400
Received: by mail-ot1-f66.google.com with SMTP id a10so3197576otl.12;
        Thu, 02 May 2019 12:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wxtOkr3KGpgPZTAV1KtJFXkUF9r12ab9Mq01prC07Tw=;
        b=SEGvCP+FvOD32gh1DF/pu5jM42gUoiE+YItgQHu/z4riZpKizU8B3Zk1jPSSlXbnE2
         gyxD8GB2/rqddu084mbIQ8Bdf9Mn5p8I9ywBHpMs2NhOjXB4UFQNTSMvlufe2GpD9s+5
         sWhd89/4vFZBVBl+d6/UdCfcilhQBt4fk/s0PtREcMruowy4ZOVLO4SCgRktSBkusxrz
         GrbTBm5k/VBuM9K4BdMXLTGtbfmlQ1z1QdkrQPdK1LHhYF2Bed/R+j354rEgR/8NbyR1
         b/Jmar0J+xIUBdOpwz9JNL2I/FWPzBmKIqi/PrgTQc5HLBHf0ObQyCdHpWLuG2kacnlF
         TLCA==
X-Gm-Message-State: APjAAAW40bouhGJKGvMpaLv8OMBsfFdf+HvPN0/OrjLu46Yd6HgjWxZ6
        9V9ZNL0SImge/KOLcOTmng==
X-Google-Smtp-Source: APXvYqyUqX9iXXgB8ggvWLANR9adKg4zUX0xV1DSbc275Yf7NL+qswC5/uihS1/Ue3gGOap5UosCzQ==
X-Received: by 2002:a9d:4002:: with SMTP id m2mr4021772ote.325.1556826391290;
        Thu, 02 May 2019 12:46:31 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u22sm17078072otk.49.2019.05.02.12.46.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 12:46:30 -0700 (PDT)
Date:   Thu, 2 May 2019 14:46:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 3/7] doc: dt-binding: ci-hdrc-usb2: add compatible string
 for  imx7ulp
Message-ID: <20190502194630.GA20293@bogus>
References: <20190428024847.5046-1-peter.chen@nxp.com>
 <20190428024847.5046-4-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190428024847.5046-4-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 28 Apr 2019 02:51:20 +0000, Peter Chen wrote:
> Add compatible string for imx7ulp.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
