Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB13BDB03D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 16:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406465AbfJQOjx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 10:39:53 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35474 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403882AbfJQOjx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 10:39:53 -0400
Received: by mail-ot1-f66.google.com with SMTP id z6so2109168otb.2;
        Thu, 17 Oct 2019 07:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XKvgXvqjjk8TiIeEIKyQ/yG8pWMIH1hEHS2GUYJicX0=;
        b=lZJ6836OI2pn12aL9PXTWeUTOzXE0J5n7XVlvoTCNoIwnIxK8Xvj4RdzXEn6ftbK46
         3UF+8s5d2F9IEDUe3e5Z7at+zUaFMAxFXavbyasPb3N/GlL4g3kImnBJkgXOjDzm/dI1
         hQxlfuFx8RFV1aqsUS8ffCGfzJ3AWxeyZsILv+D9UchXb0UY09oE9JpOBDiyMV5LFVAn
         kzaftBvRAkedL9oEFpik3VqHM5Qk22VsDAGQE54EE1UgbpO7jBCkEXRGEjrZGenwLkkK
         t8+Jjmo7n15+SzoKtaHglifBWdWJe4x006uKtgIkh+Kei4UsPhQJV+3VLriUw3rsqMMs
         qneg==
X-Gm-Message-State: APjAAAXPABB4f9qID33UKIwyk3G+WfeN2eV/p/0/TMM5gGhUgsrCB02r
        ueOBujpfL8FS2UcSPnzF1g==
X-Google-Smtp-Source: APXvYqyTwFiv7B8kcSPfWUsuQZ0ie4KxRI5EDe1Qf5K0ko9ok+SIKpmViiaHcvqOyxD96G6OJvSekQ==
X-Received: by 2002:a9d:37a1:: with SMTP id x30mr3504866otb.49.1571323192328;
        Thu, 17 Oct 2019 07:39:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w33sm647877otb.68.2019.10.17.07.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 07:39:51 -0700 (PDT)
Date:   Thu, 17 Oct 2019 09:39:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC][PATCH v3 04/11] dt-bindings: usb: dwc3: Allow clock list &
 resets to be more flexible
Message-ID: <20191017143950.GA11204@bogus>
References: <20191016033340.1288-1-john.stultz@linaro.org>
 <20191016033340.1288-5-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016033340.1288-5-john.stultz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 16, 2019 at 03:33:33AM +0000, John Stultz wrote:
> Rather then adding another device specific binding to support
> hikey960, Rob Herring suggested we expand the current dwc3
> binding to allow for variable numbers of clocks and resets.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> CC: ShuFan Lee <shufan_lee@richtek.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Jun Li <lijun.kernel@gmail.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Jack Pham <jackp@codeaurora.org>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Suggested-by: Rob Herring <Rob.Herring@arm.com>

Use my kernel.org email please.

> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
