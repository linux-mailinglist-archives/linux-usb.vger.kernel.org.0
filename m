Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C4A134DE5
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 21:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgAHUtv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 15:49:51 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41745 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgAHUtv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 15:49:51 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so3908731oie.8
        for <linux-usb@vger.kernel.org>; Wed, 08 Jan 2020 12:49:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y2blFDS/4xPh5DF4rW8+xU8LHc7BSZTKgnRIfuXGUCs=;
        b=EcRVFaxyTpv16MMsGI3niT4eQh1xrhX6WYJazGZfo4luSrSnxN408pYG/oOB5Y8hrk
         YtoSOHYlI/zMBMjb5mhyozTnI2VCoznnNjmPoWrDe4HcxFVeM765AQGC09SNW8b5kM5v
         XP9jE4zang3EULDA1NwKUCuklEEqXvAGyCVPiytCd3/TUL9Uu7mov/pQ6NL2WEo1Gur1
         WmmMlZqmvBTakpL2sfCsBme89TXfQJgdoioNRKETUyCet55LX2DcwH/tQCo5hWf+/hmz
         w40jr1XIq8iSaZIGl9Szrg2tpfDqhmEL2hvFaKqVLj4Dz54suwEdV3DDrDn0ID6k3FsG
         RcQA==
X-Gm-Message-State: APjAAAUtFAGYWT3oOqXzpiqmGn5xpVIMlqkPR+jCvXACvjpU07ILVGJr
        s6otb0tjrFCUc9SRVSDGW94MVsQ=
X-Google-Smtp-Source: APXvYqzsortdxZV+S204AUGJUGrsxzJPopm1u5xiU3aHood/dkta35um3Mc7owo3IIyLBunLxA7wTA==
X-Received: by 2002:aca:f507:: with SMTP id t7mr427590oih.156.1578516590084;
        Wed, 08 Jan 2020 12:49:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l82sm1461083oib.41.2020.01.08.12.49.48
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:49:49 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:49:48 -0600
Date:   Wed, 8 Jan 2020 14:49:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org,
        hminas@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        amelie.delaunay@st.com,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3] dt-bindings: usb: Convert DWC2 bindings to json-schema
Message-ID: <20200108204948.GA9782@bogus>
References: <20200107091630.12796-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107091630.12796-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 7 Jan 2020 10:16:30 +0100, Benjamin Gaignard wrote:
> Convert DWC2 bindings to DT schema format using json-schema.
> DWC2 is widely use but a couple of compatibles and properties
> (vusb_d-supply,vusb_a-supply) were missing in dwc2.txt, the
> patch add them.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> CC: Minas Harutyunyan <hminas@synopsys.com>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> 
> changes in version 3:
> - put Rob Herring as maintainer
> - change the example to use one of the listed compatible
> 
> changes in version 2:
> - put Minas Harutyunyan <hminas@synopsys.com> as maintainer
> - remove type and description from phy property
> - remove description from compatible items
> - simplify samsung,s3c6400-hsotg compatible handling
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt  |  64 ----------
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 151 ++++++++++++++++++++++++
>  2 files changed, 151 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc2.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/dwc2.yaml
> 

Applied, thanks.

Rob
