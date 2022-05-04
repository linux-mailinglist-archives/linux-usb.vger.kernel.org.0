Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B60519D42
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 12:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237546AbiEDKpn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 06:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347148AbiEDKpe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 06:45:34 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D66289A3
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 03:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651660917; x=1683196917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=V7q/xp8Lb7hiAZQGdppHr7vHJ731NLaAxOxu+wxEh84=;
  b=DiXc2O3a/jPDwmfVWyWGnQsPRrOcaQQzzAwDlweM8eVw6v5uS3A8X1Bf
   EOrJs+LU5gBSscGX8hSPu3P5B5AGY1Tjux1eb0wL5mXp/IeFlj40zb3Rl
   /Nwu2GBdP7hfdemMw2Pj8LhyDu7Nd6U58gg42tMtOkjjDfHEn3hd99f+0
   IxzV+iBcB8tZTjsksP2kUOWUO26/KYjie5W6jtRmv2BWrH0yjaEuTD1Sm
   hgLwQQOA/HtuE4+w/HirSzjdYWHP3MDXbDXn0oknHbvh+PYc3ok9Op0p5
   dtoKbLvG3i2m2ddSDiWzcmVFizB0AxJZ8tzvfiXRFZPMq5lLfJlyhSjw/
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="255194073"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="255194073"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 03:41:56 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="693758241"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.48.253])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 03:41:54 -0700
Date:   Wed, 4 May 2022 13:51:27 +0300
From:   Gil Fine <gil.fine@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 1/5] thunderbolt: Silently ignore CLx enabling in case
 CLx is not supported
Message-ID: <20220504105127.GA19479@ccdjLinux26>
References: <20220501203321.19021-1-gil.fine@intel.com>
 <20220501203321.19021-2-gil.fine@intel.com>
 <Ym+pgfn8GHurkNQ6@lahna>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ym+pgfn8GHurkNQ6@lahna>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

On Mon, May 02, 2022 at 12:50:57PM +0300, Mika Westerberg wrote:
> Hi Gil,
> =

> On Sun, May 01, 2022 at 11:33:17PM +0300, Gil Fine wrote:
> > We can't enable CLx if it is not supported either by the host or device,
> > or by the USB4/TBT link (e.g. when an optical cable is used).
> > We silently ignore CLx enabling in this case.
> > =

> > Signed-off-by: Gil Fine <gil.fine@intel.com>
> > ---
> >  drivers/thunderbolt/tb.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 44d04b651a8b..7419cd1aefba 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -581,6 +581,7 @@ static void tb_scan_port(struct tb_port *port)
> >  	struct tb_cm *tcm =3D tb_priv(port->sw->tb);
> >  	struct tb_port *upstream_port;
> >  	struct tb_switch *sw;
> > +	int ret;
> >  =

> >  	if (tb_is_upstream_port(port))
> >  		return;
> > @@ -669,7 +670,9 @@ static void tb_scan_port(struct tb_port *port)
> >  	tb_switch_lane_bonding_enable(sw);
> >  	/* Set the link configured */
> >  	tb_switch_configure_link(sw);
> > -	if (tb_switch_enable_clx(sw, TB_CL0S))
> > +	/* Silently ignore CLx enabling in case CLx is not supported */
> > +	ret =3D tb_switch_enable_clx(sw, TB_CL0S);
> > +	if (ret && ret !=3D -EOPNOTSUPP)
> =

> I think we can debug log this and also:
> =

> >  		tb_sw_warn(sw, "failed to enable CLx on upstream port\n");
> =

> can we use something like "failed to enable CL%d on upstream port\n" and
> pass the CL state there too? I think it is useful to see what what CL
> state failed.
Not sure is necessary because:
for CL0s/CL1 from SW (Driver) perspective, they are actually enabled and su=
pported together.
I mean from HW/FW perspective, entry to CL1 e.g. can be objected and only
allow entry to CL0s. But SW behaviour is similar for both.
I mean, that if SW CM fails to enable CL1, it will also fail enabling CL0s =
and
vice-versa.
So, it may be relevant if some-day we add CL2 support (which probably will =
not
happen, because the introduce of the adaptive mode in USB4 v2)
I am thinking to merge both of them to be one ENUM and to name it someting =
like
"TB_CL0s_CL1":
enum tb_clx {
=BB=B7=B7=B7=B7=B7=B7=B7TB_CLX_DISABLE,
=BB=B7=B7=B7=B7=B7=B7=B7TB_CL0s_CL1,
=BB=B7=B7=B7=B7=B7=B7=B7TB_CL2,
}
And then do this:
ret =3D tb_switch_enable_clx(sw, TB_CL0s_CL1);
if (ret && ret !=3D -EOPNOTSUPP)
	tb_sw_warn(sw, "failed to enable %s on upstream port\n", tb_switch_clx_nam=
e(TB_CL0S_CL1));
What do you think?

-- =

Thanks,
Gil
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

