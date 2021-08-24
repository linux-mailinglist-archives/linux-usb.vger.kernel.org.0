Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F603F6C62
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 01:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbhHXX5J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 19:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhHXX5I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Aug 2021 19:57:08 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E8AC061757
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 16:56:21 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e5so17106287wrp.8
        for <linux-usb@vger.kernel.org>; Tue, 24 Aug 2021 16:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0eKTm+iFtZEDsKPuRONh+K02yrNa1c6g9glq9hhcmRs=;
        b=kQTp2neDLaDghFPp9wLFdToduiKEwO76rLK8La3uwLCJ2oS0h+2JjdF46K5GIv88Gp
         WKRl2IcaG/tdH1SXf+X4J6eF60deUdenLCI5GoS+Po5iv6wlTvb7AZWra82xnmNVEvR0
         JujntWFJTt45VfA7cyRPGK5AcdC6LpHhGDnTP5zMzlk7xT5YsAnYPl0qg3+VXpW4mMLS
         LtVIEWAFO4x1wyKQpwr4SL+aG1SFdts3n48UdgB5pXj3PMm5Gx9+lh2nSvXkA/QO6ygE
         /CmrZpwWa6wAXLi7udPs24PrHF4bR57DpA/6IvwXKbdidpcVQVOlrb1YLdlIfU8GrzWv
         ID/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0eKTm+iFtZEDsKPuRONh+K02yrNa1c6g9glq9hhcmRs=;
        b=s/cquenflVCHKUg9Y63OSpriLQth/Jve408D5TfOTFNjszQbpxOu7ZVJWPQjqvcFKg
         EJz0MnQH1bTVTVOjO3CbXkBpxrpeAtAvDwG7MruDVYDownMzEYjp1dySqagU7SrL5bOF
         xc+DYb6caF60xfs53QD9MCzt4leiBg46AVIAEKIuHE6aLeAkkGAKeHX4dhrVzS3TgKwq
         wkc6fxcjKz5rnHaYw8tVuyq02txEwXHCNk0pFzyTun5ijJMzCk43lBkvKAxiPDRiCDSX
         CyG5R19VidHyNR/Xx3NWibnBEuYkdYmSHsVzsPMnY+2RQ1npKV46Jqau3epKBlEaIT5z
         On1g==
X-Gm-Message-State: AOAM533tAeP4CZEdfGzeL9qH4JCOuo6dT178pPAORfJL6cezdTnQmAwu
        sUP45FjSr4XTRhnpFl859xAFBQ==
X-Google-Smtp-Source: ABdhPJyFv4nVa8h6XWO6cg+uTTs4IIoWIcMyWXcEXxF4Tx0E0NVrYwzy8LulZGqVCYhx3ngIS7fNYQ==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr21408683wrq.377.1629849379912;
        Tue, 24 Aug 2021 16:56:19 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z6sm3549612wmp.1.2021.08.24.16.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 16:56:19 -0700 (PDT)
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Peter Chen <peter.chen@kernel.org>, balbi@kernel.org,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YOZ3CBNTXFTa+fNx@yoga>
 <de86a2c5-92cf-da0a-8819-2de4c3c88b3f@linaro.org> <YSWGRcla0/dPLDpU@ripper>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <593dc3f5-268d-580f-76fa-0be00505ac37@linaro.org>
Date:   Wed, 25 Aug 2021 00:58:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YSWGRcla0/dPLDpU@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/08/2021 00:52, Bjorn Andersson wrote:
> But isn't this role switching interaction (both B and C) already part of
> the core/drd, so if we can just get the drd to invoke
> dwc3_qcom_vbus_overrride_enable() we're done (and can remove all the
> extcon code from the qcom glue as well)?

Provided we have an acceptable way of triggering when a role-switch 
happens - then USB role switching itself is a NOP here, its really just 
a convenience to invoke the callback.

---
bod
