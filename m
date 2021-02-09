Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669F1315475
	for <lists+linux-usb@lfdr.de>; Tue,  9 Feb 2021 17:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbhBIQzO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Feb 2021 11:55:14 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:42979 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbhBIQzI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Feb 2021 11:55:08 -0500
Received: by mail-ot1-f54.google.com with SMTP id q4so8436506otm.9;
        Tue, 09 Feb 2021 08:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s+IoHlRz1gX7UUtH1MF48sL2XDhr0pR2mcJWk4ELF28=;
        b=a3AmJDOpLohUXV7eReMJp8CtGNu/41LDtP5TyRL7TKkJ3zZwj5gV3TKTs8OXTgfa4i
         +rcoONxyVK68Pvio69pfwer/BrZrVFecCxhjMR4m4k0u1SrVi/cgfBHYGpwP6dHnwu9D
         uUj6TQWG3lUyXp8YR1k4kciBhG3AGhqfQnW7/eEOcR8ilLTM2H+b+yHmSqi9sbbn/Hp3
         i6W5BdU/w7HttLOuzxFhOdJ2QrilgbGia5V7jg1gDRAXgxBVRwDGsSXN/HFh6hcpJfop
         Yr9zoslo14UQXSda+rcDYm2IEIgNci9hejuFyrjES1VTflpZtl3qXqaYeZFWFNRtDsVl
         /SqA==
X-Gm-Message-State: AOAM532QI1KIKJsOt+Hx6Eski/FQYl7EFedfDWb09qQKeRP72UV1mwQL
        iCf+xO5/2DXWzHYS/rwI3FaRwytU5Q==
X-Google-Smtp-Source: ABdhPJxB4Dac3uoKx0eh0h0MMdXIMiET21FZNU4QEDjhTPBpYXmdQMpZx3n+oe348gDoIMfQEKEG1A==
X-Received: by 2002:a05:6830:1110:: with SMTP id w16mr16482110otq.326.1612889666987;
        Tue, 09 Feb 2021 08:54:26 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v9sm1472917oon.11.2021.02.09.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:54:25 -0800 (PST)
Received: (nullmailer pid 3923440 invoked by uid 1000);
        Tue, 09 Feb 2021 16:54:24 -0000
Date:   Tue, 9 Feb 2021 10:54:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 0/2] usb: dwc2: Use clk bulk API for supporting
 multiple clocks
Message-ID: <20210209165424.GB3909217@robh.at.kernel.org>
References: <20210125093825.4292-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125093825.4292-1-s.hauer@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 25, 2021 at 10:38:23AM +0100, Sascha Hauer wrote:
> Currently the dwc2 driver only supports a single clock. I have a board
> here which has a dwc2 controller with a somewhat special clock routing
> to the phy. Both the dwc2 controller and the ULPI phy get their phy
> clock from a SI5351 clock generator. This clock generator has multiple
> clock outputs which each is modelled as a separate clk in Linux.
> Unfortunately the clock to the phy and the clock to the dwc2 core are on
> two different output pins of the SI5351, so we have two clocks which
> must be enabled.  The phy is driven by the usb-nop-xceiver driver which
> supports a single clock. My first approach was to add support for a
> second clock to that driver, but technically the other clock is
> connected to the dwc2 core, so instead I added support for a second
> clock to the dwc2 driver.  This can easily be archieved with the clk
> bulk API as done in this series.

Where is the usb-nop-xceiver single clock coming from? 

Maybe you shouldn't be using usb-nop-xceiver? There is a ULPI binding 
though that alone doesn't really help you.

Rob
