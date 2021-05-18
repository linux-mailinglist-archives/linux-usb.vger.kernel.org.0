Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76977386EBD
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 03:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345371AbhERBKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 21:10:08 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:39446 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237859AbhERBKH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 21:10:07 -0400
Received: by mail-oi1-f179.google.com with SMTP id u144so8221471oie.6;
        Mon, 17 May 2021 18:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=snh0Gp2powy5pJ7syN/kFx92N7RIekRe39Pnw5Nu3b4=;
        b=A8dULthHpaAA75B5W5m8uyQ98OsQfXDbB+3qX/WR/sO58QAmTRzxvFo1oEK1Q1mwGC
         6bGF7H2mQSYcc8CwPI61sZk/ku69yFdWsFW7g9S0R082Ii7VUID67SPPwuK0qCZQxA+B
         hXyWTtVtCDTRL+AtW/YfGnClQyMpQA1MBl48PWcnv5P/3qs63n4N7NZi0Ew7eFZXQVyq
         vt8BxuzKf3IMvpA2mKbgryCKW7OD6JEQlxk5lh76115lMHO2oo6nTOWcbgPrcY8Nypun
         wohXlhlliW9Om+aFK1xk8m4fPQPNdm4wLRduANBoAieb1SPG3UiQSHSJwrp2gYMnXNSh
         ylJQ==
X-Gm-Message-State: AOAM532Z8f9OXgUQRLvf5DoIxsACaqSli6joK3iRpiQiuL4Ok/YZ0say
        tQs9EeFagHKXvCQf0PqPtQ==
X-Google-Smtp-Source: ABdhPJz3G9sBinHoplF0MTLNqavo1KmwmkjtlMwdNKMz9wx/6sJRP/O+nvTOBU8ZymfsHCmRJPlNYw==
X-Received: by 2002:a05:6808:1496:: with SMTP id e22mr400945oiw.78.1621300130118;
        Mon, 17 May 2021 18:08:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a4sm3107590oib.17.2021.05.17.18.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:08:49 -0700 (PDT)
Received: (nullmailer pid 3569666 invoked by uid 1000);
        Tue, 18 May 2021 01:08:48 -0000
Date:   Mon, 17 May 2021 20:08:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 8/9] dt-bindings: usb: nxp,isp1760: add bindings
Message-ID: <20210518010848.GA3569637@robh.at.kernel.org>
References: <20210513084717.2487366-1-rui.silva@linaro.org>
 <20210513084717.2487366-9-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513084717.2487366-9-rui.silva@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 13 May 2021 09:47:16 +0100, Rui Miguel Silva wrote:
> The nxp,isp1760 driver is old in the tree, but did not had a bindings
> entry, since I am extend it to support isp1763 in the same family, use
> this to add a proper yaml bindings file.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../devicetree/bindings/usb/nxp,isp1760.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
