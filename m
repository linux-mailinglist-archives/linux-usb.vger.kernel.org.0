Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70A35ED68D
	for <lists+linux-usb@lfdr.de>; Wed, 28 Sep 2022 09:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbiI1HnD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Sep 2022 03:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbiI1Hlp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Sep 2022 03:41:45 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3701A83B;
        Wed, 28 Sep 2022 00:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664350775; x=1695886775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fgYDK18w1qo3dRZOSQ9zzPBSZaRiLF9ws87GZFwPXX0=;
  b=MgvYmSidK5wQH9IgiNne2u2pTaLSJvbMcCbWI7fUkO6b5lkZhn0OqYzE
   tgB+PX/i0goCSq1OL8yqOsxfziMtNIqsTdlNLJNBJqWy1d79EpjefYLlM
   eOFRY0z0wd6Oru6FAy7pw2JKWvQyid7OW/JXKnddObr4HLTby1b9quCC4
   fNEnOJqASbZnQZq2mm0ajylNSVTCkDRR29vba1xMKleNfM34jAAwvyo5N
   Sbqv5eEmm2fbjT8GRD7jtkTWzmbbfiTDIeO9xzi1wu8cZ7OEEdHCr6nRG
   5Stf8Aw73hw2wIx4glmyGhrDgbZiXG889sF7X1NwU74Eg2QIf5v/IsebZ
   g==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654552800"; 
   d="scan'208";a="26445733"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Sep 2022 09:39:33 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 28 Sep 2022 09:39:33 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 28 Sep 2022 09:39:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1664350773; x=1695886773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fgYDK18w1qo3dRZOSQ9zzPBSZaRiLF9ws87GZFwPXX0=;
  b=pkuE71wg3ANxHGuS7Z4rUUJd15aaF6O5I7bdH7ycYqaT5BLAaFo2xriQ
   fA+AdNPCS7uf5bEKSX01dC6UrmvDFhutEn8HSH7eKLsRm0UebSFMESKI0
   jHTz+X3z+3qva96Zk6dWDB+PBhaosJDxRpR+sb3mtFi4/6h90ozSWbUEY
   +vw6Rqgp/7d9UGpqi3T6nUM1wJpLCxKA/rt7x7f8DnfKfiRsONHE/d8zj
   bORqKwj3j/smlpJ0mJ0F2FZjHGdjRl5H2nj/ovjAfvWWR7WCkyNV3BVMA
   Uk9/VPs8O+c4KYOz0mK6QV+BkzgOHjsEe6SJ+tBhXgMePZlYrKPt1eTbm
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654552800"; 
   d="scan'208";a="26445732"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Sep 2022 09:39:33 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0A9FC280056;
        Wed, 28 Sep 2022 09:39:33 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Re: [PATCH v2 4/4] arm64: dts: tqma8mpql: add support for 2nd USB (host) interface
Date:   Wed, 28 Sep 2022 09:39:32 +0200
Message-ID: <2199557.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YyxnVicN/W/M2/ir@kroah.com>
References: <20220915062855.751881-1-alexander.stein@ew.tq-group.com> <5606023.DvuYhMxLoT@steina-w> <YyxnVicN/W/M2/ir@kroah.com>
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

Hi Shawn,

Am Donnerstag, 22. September 2022, 15:47:02 CEST schrieb Greg Kroah-Hartman:
> On Thu, Sep 22, 2022 at 03:39:01PM +0200, Alexander Stein wrote:
> > Hi Greg,
> > 
> > Am Donnerstag, 22. September 2022, 15:17:06 CEST schrieb Greg Kroah-
Hartman:
> > > On Thu, Sep 15, 2022 at 08:28:55AM +0200, Alexander Stein wrote:
> > > > The on-board USB hub has a single reset line which needs to be
> > > > enabled.
> > > > 
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > > 
> > > >  .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 41
> > > >  +++++++++++++++++++
> > > >  1 file changed, 41 insertions(+)
> > > 
> > > This patch failed to apply, please rebase and resend.
> > 
> > If I rebase this one to usb-testing (or usb-next) this will conflict with
> > additional patches for this file already in linux-next later on,
> > especially
> > fb4f0b69565e ("arm64: dts: tqma8mpql: add USB DR support"). So IMHO this
> > might not the best idea.
> > How to proceed here? Maybe Shawn can take this one once the other 3
> > patches
> > hit linux-next.
> 
> Yeah, or just wait for 6.1-rc1 to come out?
> 
> Your call,

now that patches 1 till 3 have hit linux-next, feel free to pick patch 4 into 
your tree.

Best regards,
Alexander



