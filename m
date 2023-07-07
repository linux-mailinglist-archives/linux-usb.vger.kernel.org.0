Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6187A74AD2B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jul 2023 10:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjGGIfJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jul 2023 04:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjGGIfB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jul 2023 04:35:01 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF3C90;
        Fri,  7 Jul 2023 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688718899; x=1720254899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tSUJGwxw4GKdbWDaAgS5DZYxSnm3gTsQl19EC2tErow=;
  b=DDhQveShs7sBe7fRu1qt5qw6ruSJZ8FpU3+c0FlG9uYbRmwjhCTOy9Fp
   GIGRPAo0XWA0n5XDmBrKj9ujiyuMKRipG70RXQdi+SoYrZsqNFln2fe6f
   ROl15WHvzI1dLu5hlAbX9SebuYthJWEY19lepkvj460WfWX555D+oioY2
   3XA0A+RFO4bDpeLrg9nDwrIoIc2WXjd3wmj6XLhXxHH0gL1fCOFOfsr0J
   SgqnwgilU+2PWVpPpyjamNsoqA8NWH4YDD/PyJtnndis3dYEqBactuLEU
   rdzUbt3xXz5o8ghXPcH4TBxCLkBCJMscXu0C01wTi+/hBSAH5av4HiWHD
   w==;
X-IronPort-AV: E=Sophos;i="6.01,187,1684792800"; 
   d="scan'208";a="31808359"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Jul 2023 10:34:57 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5A586280084;
        Fri,  7 Jul 2023 10:34:57 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh@kernel.org>, Xu Yang <xu.yang_2@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH 1/1] dt-bindings: usb: ci-hdrc-usb2: Fix number of clocks
Date:   Fri, 07 Jul 2023 10:34:57 +0200
Message-ID: <3547043.jE0xQCEvom@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <DB7PR04MB450585C112FA299FE46023828C2DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230706093928.3580544-1-alexander.stein@ew.tq-group.com> <4814813.MHq7AAxBmi@steina-w> <DB7PR04MB450585C112FA299FE46023828C2DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
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

Hi Xu Yang,

thanks for your feedback.

Am Freitag, 7. Juli 2023, 09:06:09 CEST schrieb Xu Yang:
> Hi Alexander,
>=20
> > -----Original Message-----
> >=20
> > Hi,
> >=20
> > Am Donnerstag, 6. Juli 2023, 21:18:25 CEST schrieb Rob Herring:
> > > On Thu, Jul 06, 2023 at 11:39:28AM +0200, Alexander Stein wrote:
> > > > Some (older) IP cores require 3 clocks, named 'ipg', 'ahb' and 'per'
> > > > while
> > > > more recent IP cores just require one. Fix the number and explicitly
> > > > state the clock-names.
> > > >=20
> > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > ---
> > > >=20
> > > > >From I can tell, is that imx25, imx27, imx35 have specified 3 cloc=
ks
> > > > >in
> > > >=20
> > > > their DT.
> > > > IMHO minItems for 'clock-names' can be removed as I presume that th=
is
> > > > property is not set when only one clock is used.
> > >=20
> > > Rather than presume, did you test that? Well, I did[1] and can confir=
m.
> >=20
> > Okay, probably my wording was bad. There are a lot of users (e.g. imx8m=
m,
> > imx8mn) which only have one clock but still provide some clock-names
> > property. It works just because it is not called 'ipg', but some SoC
> > specific clock name.
> > So this patch should cause some warnings, but these users were incorrect
> > in
> > the first place. Following up this patch, they need to be fixed.
>=20
> It means that all the usb nodes need to contain 'ipg', 'ahb', 'per' clock
> names with your patch.

That's not true. They only need these 3 clocks iff they specify clock-names=
=2E=20
If there is only one clock, there is no need to specify clock-names.
TBH: If there is just one clock, which is not called 'ipg', the driver does=
n't=20
care about the name at all.

> It's unexpected due to only imx25, imx27, imx35
> need this. I think you need to narrow this property to specific SoCs.

That's a good idea, but I would consider adding property conditionals as a=
=20
follow up patch.

Best regards,
Alexander

> Thanks,
> Xu Yang
>=20
> > Best regards,
> > Alexander
> >=20
> > > Reviewed-by: Rob Herring <robh@kernel.org>


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


