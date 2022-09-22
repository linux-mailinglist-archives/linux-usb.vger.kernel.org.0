Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7745E63D8
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 15:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbiIVNjk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 09:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbiIVNjS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 09:39:18 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C670883D9;
        Thu, 22 Sep 2022 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663853946; x=1695389946;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CvNGXgqzeE+QXCg49n3Dh9W15AC3+5BUxUFylLugfkY=;
  b=RUAJLQ6ICVrEDsj1lXooZ8oeEld4ON+vhu522EmMsPp3nyUE/SLV0gK3
   Azvq9u4uwnSLDeCmGwCsblaVpml/zqdfERDA9SqmX658OoQCRukX30FQr
   CwT67fftb/5I5l8UEBEVITj4/aOQCIybKlzeyi3+lOVnXcBHwaGfEfkWI
   +CNhNs0Iax+RJmGFCn8RabJ8bi1DJqUPr2V1Vm5aQmEcxFIuUMZsYeymU
   U2t6Dy43TWZqdPH2DIUual3DrGnHdNvATzvm1gfyh7Y5iwR8lRqFr6MvA
   aDUPg6HdMTS9wsiv347ikbSODGd+K+5uuFqnO9XMkL67GP67OHyM7Fe7m
   A==;
X-IronPort-AV: E=Sophos;i="5.93,335,1654552800"; 
   d="scan'208";a="26339193"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Sep 2022 15:39:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 22 Sep 2022 15:39:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 22 Sep 2022 15:39:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1663853944; x=1695389944;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=CvNGXgqzeE+QXCg49n3Dh9W15AC3+5BUxUFylLugfkY=;
  b=c7DZenHHYRGr2lVSyapJ4pLRCazWnuagwlY6sswvrVT56tX+qeuAt06e
   LXUs9zT5qmjXUmp3HJfcgIxyHWFkyOv+fmfTFtT5dcv3Ce22Uvf3p42KT
   tzJCgUxGST3vE2Fqvid9IshwKjFX3/KyMLM3sR8nVGv/NEXXMsNEGRB6R
   oa7DUhkjl5BEEvILm5PoBedNq4BhFMx2visXdxl16qOne2FELsNTMQWiY
   5WKQQQAUgO4ETHTZCkSPGfG5JsW10S00jNP5M+hEI8h3RjAuzl8QfzMHz
   LCT5z4iSc7iyWLfUwOOrABDKbrAHIJewp1e1Vz69Tv0XBpPMWeXJD+up+
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,335,1654552800"; 
   d="scan'208";a="26339192"
Subject: Re: Re: [PATCH v2 4/4] arm64: dts: tqma8mpql: add support for 2nd USB (host)
 interface
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Sep 2022 15:39:04 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D247B280056;
        Thu, 22 Sep 2022 15:39:03 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Thu, 22 Sep 2022 15:39:01 +0200
Message-ID: <5606023.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YyxgUtT1gtyMIHeY@kroah.com>
References: <20220915062855.751881-1-alexander.stein@ew.tq-group.com> <20220915062855.751881-5-alexander.stein@ew.tq-group.com> <YyxgUtT1gtyMIHeY@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Am Donnerstag, 22. September 2022, 15:17:06 CEST schrieb Greg Kroah-Hartman:
> On Thu, Sep 15, 2022 at 08:28:55AM +0200, Alexander Stein wrote:
> > The on-board USB hub has a single reset line which needs to be enabled.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >  .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> 
> This patch failed to apply, please rebase and resend.

If I rebase this one to usb-testing (or usb-next) this will conflict with 
additional patches for this file already in linux-next later on, especially 
fb4f0b69565e ("arm64: dts: tqma8mpql: add USB DR support"). So IMHO this might 
not the best idea.
How to proceed here? Maybe Shawn can take this one once the other 3 patches 
hit linux-next.

Best regards,
Alexander



