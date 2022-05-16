Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 060F3528010
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 10:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241940AbiEPItZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 04:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbiEPItU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 04:49:20 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B132511A18
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 01:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652690959; x=1684226959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SPeB9+885bF67n2Q89OWpfMsrOXzmW/uB5SRGx8rIBg=;
  b=REupJjaQYC5jJNP8LeHRpUxkpDiuIOiH5gwAqoCCl7a/ahOhtK/e4BHI
   1Q0eDiaoh9koanCa/2ddkbuAiCMQCxwiJn6L3eOKlM/Ysp14u+jhmAFEo
   dDzJT59v3zzS/E7mj6iWqNHZJ6b/qhDpCXsEj+0+s+ybH4yHaaSMI6Iyx
   g6HRIWptrAsg/jec1Ij2veFEA4xpbTmuFUtPF/v46cSatAuCuy69BoliD
   bF801kEY7zDTDIDjGRSFnH/+vFCHdOccmxet4LVcA6a1nr0gni4ZgTSIT
   KqqbEqXDc2C46tS+zReo3gzsBP9MnGtGiR61Oh+ONtSUjhmrihZsLiz4f
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="251282665"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="251282665"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 01:49:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="544267967"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.48.253])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 01:49:16 -0700
Date:   Mon, 16 May 2022 11:59:03 +0300
From:   Gil Fine <gil.fine@intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Gil Fine <gil.fine@intel.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi
 uni-directional once DisplayPort tunneled
Message-ID: <20220516085903.GC8368@ccdjLinux26>
References: <20220511140549.10571-1-gil.fine@intel.com>
 <20220511140549.10571-7-gil.fine@intel.com>
 <Yn4qld89AVEd3cRD@lahna>
 <20220515202746.GA8368@ccdjLinux26>
 <YoIMh0Di7QtALQ/Z@lahna>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YoIMh0Di7QtALQ/Z@lahna>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

On Mon, May 16, 2022 at 11:34:15AM +0300, Mika Westerberg wrote:
> Hi Gil,
> =

> On Sun, May 15, 2022 at 11:27:46PM +0300, Gil Fine wrote:
> > > > +int tb_switch_tmu_config_enable(struct device *dev, void *data)
> > > =

> > > Also can we please make it take some real type and not something
> > > arbitrary?
> > You mean the names, right?
> > Something like:
> > int tb_switch_tmu_config_enable(struct device *parent, void *rate)
> > If so, yes, I will
> =

> I mean use a real type, not void *.
> =

> > > =

> > > Can it be const too?
> > IIUC, it shall be a function pointer with specified signature otherwise=
 it will fail
> > at compilation
> =

> Okay then I suggest to make a reasonable "API" function that handles
> all this internally that does not take arbitrary pointers. Remember to
> document it in kernel-doc too.

This is a function pointer that shall be passed to device_for_each_child()
And it has to be defined as:

int (*fn)(struct device *dev, void *data)

Similar as here e.g.:

static int remove_retimer(struct device *dev, void *data)
{
=BB=B7=B7=B7=B7=B7=B7=B7struct tb_retimer *rt =3D tb_to_retimer(dev);
=BB=B7=B7=B7=B7=B7=B7=B7struct tb_port *port =3D data;

=BB=B7=B7=B7=B7=B7=B7=B7if (rt && rt->port =3D=3D port)
=BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7tb_retimer_remove(rt);
=BB=B7=B7=B7=B7=B7=B7=B7return 0;
}

void tb_retimer_remove_all(struct tb_port *port)
{
=BB=B7=B7=B7=B7=B7=B7=B7struct usb4_port *usb4;

=BB=B7=B7=B7=B7=B7=B7=B7usb4 =3D port->usb4;
=BB=B7=B7=B7=B7=B7=B7=B7if (usb4)
=BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7device_for_each_child_rever=
se(&usb4->dev, port,
=BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7=BB=
=B7=B7=B7=B7=B7=B7=B7=BB=B7=B7=B7=B7=B7=B7=B7      remove_retimer);
}

So not sure I get you...

-- =

Thanks,
Gil
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

