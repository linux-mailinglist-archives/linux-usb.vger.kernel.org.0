Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D2B74AAE4
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jul 2023 07:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjGGF7o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jul 2023 01:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjGGF7n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jul 2023 01:59:43 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2645D1FC6;
        Thu,  6 Jul 2023 22:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688709581; x=1720245581;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QaDgGYCu1NMCRE7l/cADR02LMIS3aO/47KaPk9B2K1k=;
  b=Tdy3vd7TuPWCFXqxTwpd0jTj2zrcoU9F+YXChr3VHN+vG5jbKNizh0rD
   3u2rx0dnFy/+vriqoQx7KdV9rpmvglJ3TLAs8R0DMOINQpECT01Zd4d5P
   +S81nXnZ5HqZni4qztR9K7sh3lJT4xeKw+wtsX0t/PgP9VEbNk2yAXv6X
   NzyziwaAeBhrSyJS6/LSnolut65lEHqfMz9Bb90AXm/aih17iuKpqzu6/
   F8ibexjs88xnXNfjLH9OI0FlTXMd2cGYxRMZU46mBVvJzH8pFEsMa9W22
   2dmZIzFFyWe1nmALAXBP+zkwSY8YF6qgEVFMC2YkIon7A+2a1o7n+9+gY
   A==;
X-IronPort-AV: E=Sophos;i="6.01,187,1684792800"; 
   d="scan'208";a="31803624"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Jul 2023 07:59:39 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 12F59280084;
        Fri,  7 Jul 2023 07:59:39 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: usb: ci-hdrc-usb2: Fix number of clocks
Date:   Fri, 07 Jul 2023 07:59:38 +0200
Message-ID: <4814813.MHq7AAxBmi@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230706191825.GA170669-robh@kernel.org>
References: <20230706093928.3580544-1-alexander.stein@ew.tq-group.com> <20230706191825.GA170669-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Am Donnerstag, 6. Juli 2023, 21:18:25 CEST schrieb Rob Herring:
> On Thu, Jul 06, 2023 at 11:39:28AM +0200, Alexander Stein wrote:
> > Some (older) IP cores require 3 clocks, named 'ipg', 'ahb' and 'per' wh=
ile
> > more recent IP cores just require one. Fix the number and explicitly
> > state the clock-names.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=20
> > >From I can tell, is that imx25, imx27, imx35 have specified 3 clocks in
> >=20
> > their DT.
> > IMHO minItems for 'clock-names' can be removed as I presume that this
> > property is not set when only one clock is used.
>=20
> Rather than presume, did you test that? Well, I did[1] and can confirm.

Okay, probably my wording was bad. There are a lot of users (e.g. imx8mm,=20
imx8mn) which only have one clock but still provide some clock-names proper=
ty.
It works just because it is not called 'ipg', but some SoC specific clock=20
name.
So this patch should cause some warnings, but these users were incorrect in=
=20
the first place. Following up this patch, they need to be fixed.

Best regards,
Alexander

> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> [1]
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2023070609=
39
> 28.3580544-1-alexander.stein@ew.tq-group.com/


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


