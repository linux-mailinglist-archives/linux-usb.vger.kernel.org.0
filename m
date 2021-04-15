Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22182361407
	for <lists+linux-usb@lfdr.de>; Thu, 15 Apr 2021 23:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbhDOVTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Apr 2021 17:19:00 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:35514 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234959AbhDOVS7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Apr 2021 17:18:59 -0400
Received: by mail-ot1-f48.google.com with SMTP id a2-20020a0568300082b029028d8118b91fso5421378oto.2;
        Thu, 15 Apr 2021 14:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=05+XHFlDq72xLlQj/rcNUyOU1OL09QWF1WagkfDO5lQ=;
        b=W0SQ+aFRPZcGlsK3avux7czKe+MFC+HvRU1rPMM7zTc9/JJkLNkIMKvyhBbNzh3x04
         FiVKDeT7x0s5heDgK8a2BH6M8JRxSJmyEniqDUkkMV848UBYi3aDEIdxOVfYZqiRUQbt
         8ZtYlwGv/CATCYnM1u+BdqXLYGPXsNMg90f3bsaLWBZiZh1G3pxkqRRGPuZol13SlKY+
         yZ48M+DXCJQWvu/PfVV+kuwrLXhGTHAB4t4DE8Nmu+/BHveD+DJ5WQiZEGNnHmhS9u8S
         vy5HgzyZCHDKjKgVneqRVyrYYaUuq4Fszx+N5ZNXefaRUVDQXRqDtQOvhuS5DGEWBRBi
         hlzg==
X-Gm-Message-State: AOAM530WWQQD1T0XabhZoC6NhBUkAmBBTn9E1b/CoB37hDQ8CH1vRekN
        Ist0C1UAkBMIPOWAsLtJ5g==
X-Google-Smtp-Source: ABdhPJzAjRkeWJ51F7m8ni4s2MLxav61pivxcaMB9j4R8cz7P5ZvbFcyq+SA9qWBSf9ttAL2eqcxhw==
X-Received: by 2002:a9d:5f0c:: with SMTP id f12mr967042oti.258.1618521515654;
        Thu, 15 Apr 2021 14:18:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x2sm948505ote.47.2021.04.15.14.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 14:18:35 -0700 (PDT)
Received: (nullmailer pid 1899390 invoked by uid 1000);
        Thu, 15 Apr 2021 21:18:34 -0000
Date:   Thu, 15 Apr 2021 16:18:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: dwc3: Add disabling LPM for
 gadget
Message-ID: <20210415211834.GA1899359@robh.at.kernel.org>
References: <cover.1618366071.git.Thinh.Nguyen@synopsys.com>
 <f31348ba744318c83b3a9ab1eab75c61122b15ae.1618366071.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f31348ba744318c83b3a9ab1eab75c61122b15ae.1618366071.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 13 Apr 2021 19:13:11 -0700, Thinh Nguyen wrote:
> Add a new DT option to disable LPM for gadget and update the description
> for usb2-lpm-disable related to host for clarity.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  Changes in v2:
>  - New patch
> 
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
